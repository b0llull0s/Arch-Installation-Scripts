rmk () {
    scrub -p dod $1
    shred -zun 10 -v $1
}