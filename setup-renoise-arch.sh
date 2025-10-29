#!/bin/bash

# Renoise Audio Setup Script for Arch Linux
# Configures real-time audio permissions and PipeWire for low-latency performance

set -e  # Exit on error

echo "=========================================="
echo "Renoise Audio Setup for Arch Linux"
echo "=========================================="
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if running as root
if [[ $EUID -eq 0 ]]; then
   echo -e "${RED}ERROR: Do not run this script as root/sudo${NC}"
   echo "Run it as your normal user - it will prompt for sudo when needed"
   exit 1
fi

echo -e "${YELLOW}[1/5] Adding user to audio group...${NC}"
if groups $USER | grep -q '\baudio\b'; then
    echo "✓ Already in audio group"
else
    sudo usermod -aG audio $USER
    echo -e "${GREEN}✓ Added $USER to audio group${NC}"
fi

echo ""
echo -e "${YELLOW}[2/5] Configuring real-time audio limits...${NC}"
if grep -q "^@audio.*rtprio" /etc/security/limits.conf 2>/dev/null; then
    echo "✓ Real-time limits already configured"
else
    sudo tee -a /etc/security/limits.conf > /dev/null << 'EOF'

# Real-time audio configuration for Renoise/DAWs
@audio   -  rtprio     95
@audio   -  memlock    unlimited
@audio   -  nice       -19
EOF
    echo -e "${GREEN}✓ Real-time limits configured${NC}"
fi

echo ""
echo -e "${YELLOW}[3/5] Creating PipeWire config directory...${NC}"
mkdir -p ~/.config/pipewire/pipewire.conf.d
echo -e "${GREEN}✓ Directory created${NC}"

echo ""
echo -e "${YELLOW}[4/5] Configuring PipeWire for low-latency audio...${NC}"
cat > ~/.config/pipewire/pipewire.conf.d/10-renoise.conf << 'EOF'
# Optimized settings for Renoise and audio production
context.properties = {
    default.clock.rate = 44100
    default.clock.quantum = 512
    default.clock.min-quantum = 32
    default.clock.max-quantum = 2048
}

context.modules = [
    {   name = libpipewire-module-rt
        args = {
            nice.level   = -11
            rt.prio      = 88
            rt.time.soft = -1
            rt.time.hard = -1
        }
        flags = [ ifexists nofail ]
    }
]
EOF
echo -e "${GREEN}✓ PipeWire configuration created${NC}"

echo ""
echo -e "${YELLOW}[5/5] Restarting PipeWire services...${NC}"
systemctl --user restart pipewire pipewire-pulse wireplumber 2>/dev/null || true
echo -e "${GREEN}✓ PipeWire restarted${NC}"

echo ""
echo "=========================================="
echo -e "${GREEN}Setup Complete!${NC}"
echo "=========================================="
echo ""
echo -e "${RED}⚠️  IMPORTANT: You must LOG OUT and LOG BACK IN${NC}"
echo "    for the audio group changes to take effect."
echo ""
echo "After logging back in, you can verify with:"
echo "  ulimit -r     # Should show: 95"
echo "  groups        # Should include: audio"
echo ""
echo "Recommended Renoise settings:"
echo "  • Device type: JACK (use PipeWire's JACK compatibility)"
echo "  • Buffer size: 256-512 (for ~5-12ms latency)"
echo "  • Sample rate: 44100 Hz"
echo "  • Enable: Use realtime priority"
echo ""
echo "IMPORTANT: Use JACK, not ALSA!"
echo "  - ALSA bypasses PipeWire and causes conflicts"
echo "  - JACK gives proper real-time performance"
echo "  - PipeWire provides JACK API automatically"
echo ""
echo "If you experience audio glitches, increase buffer:"
echo "  256 → 512 → 1024"
echo ""
echo -e "${GREEN}Happy tracking! 🎵${NC}"

