#!/bin/bash

# Flutter Installation Script

set -e  # Exit on any error

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if running as root
if [[ $EUID -eq 0 ]]; then
   print_error "This script should not be run as root"
   exit 1
fi

# Check if git is installed
if ! command -v git &> /dev/null; then
    print_error "Git is not installed. Please install git first."
    exit 1
fi

print_status "Starting Flutter installation..."

# Check if Flutter is already installed
if [ -d "/opt/flutter" ]; then
    print_warning "Flutter directory already exists at /opt/flutter"
    read -p "Do you want to remove it and reinstall? (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        print_status "Removing existing Flutter installation..."
        sudo rm -rf /opt/flutter
    else
        print_status "Keeping existing installation. Skipping clone step."
        SKIP_CLONE=true
    fi
fi

# Install Flutter
if [ "$SKIP_CLONE" != true ]; then
    print_status "Cloning Flutter repository to /opt/flutter..."
    cd /opt
    sudo git clone https://github.com/flutter/flutter.git -b stable
    print_success "Flutter cloned successfully"
    
    print_status "Setting ownership permissions..."
    sudo chown -R $USER:$USER /opt/flutter
    print_success "Ownership set to $USER"
fi

# Determine shell configuration file
SHELL_CONFIG=""
if [ -n "$ZSH_VERSION" ]; then
    SHELL_CONFIG="$HOME/.zshrc"
elif [ -n "$BASH_VERSION" ]; then
    SHELL_CONFIG="$HOME/.bashrc"
else
    # Default to bashrc
    SHELL_CONFIG="$HOME/.bashrc"
fi

print_status "Detected shell config file: $SHELL_CONFIG"

# Check if PATH is already configured
FLUTTER_PATH_LINE='export PATH="/opt/flutter/bin:$PATH"'
if grep -q "flutter/bin" "$SHELL_CONFIG" 2>/dev/null; then
    print_warning "Flutter PATH seems to be already configured in $SHELL_CONFIG"
else
    print_status "Adding Flutter to PATH in $SHELL_CONFIG..."
    echo "" >> "$SHELL_CONFIG"
    echo "# Flutter SDK" >> "$SHELL_CONFIG"
    echo "$FLUTTER_PATH_LINE" >> "$SHELL_CONFIG"
    print_success "PATH updated in $SHELL_CONFIG"
fi

# Reload the shell configuration
print_status "Reloading shell configuration..."
source "$SHELL_CONFIG"

# Add Flutter to PATH for current session
export PATH="/opt/flutter/bin:$PATH"

# Verify installation
print_status "Verifying Flutter installation..."

# Check if flutter command is available
if command -v flutter &> /dev/null; then
    print_success "Flutter command found at: $(which flutter)"
    
    print_status "Checking Flutter version..."
    flutter --version
    
    print_status "Running Flutter doctor..."
    flutter doctor
    
    print_success "Flutter installation completed successfully!"
    
    echo ""
    print_status "Next steps:"
    echo "1. Restart your terminal or run: source $SHELL_CONFIG"
    echo "2. Navigate to your Flutter app directory"
    echo "3. Run the following commands:"
    echo "   flutter clean"
    echo "   flutter pub get"
    echo "   flutter run"
    
else
    print_error "Flutter command not found. Installation may have failed."
    print_status "Try restarting your terminal and running: source $SHELL_CONFIG"
    exit 1
fi

print_success "Installation script completed!"
