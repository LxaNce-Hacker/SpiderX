#!/bin/bash

# Neon color palette
NC='\033[0m'
NEON_PINK='\033[38;5;198m'
NEON_BLUE='\033[38;5;51m'
NEON_GREEN='\033[38;5;46m'
NEON_PURPLE='\033[38;5;165m'
FLASH='\033[5m'

# Welcome screen with neon effect
show_welcome() {
    clear
    echo -e "${NEON_PINK}"
    echo "
                        ⠀⠀⢀⡟⢀⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣧⠈⣧⠀⠀
                        ⠀⠀⣼⠀⣼⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⡆⢸⡆⠀
                        ⠀⢰⣿⠀⠻⠧⣤⡴LxaNce⣤⣤⠾⠗⠈⣿⠀
                        ⠀⠺⣷⡶⠖⠛⣩⣭⣿⣿⣿⣿⣿⣯⣭⡙⠛⠶⣶⡿⠃
                        ⠀⠀⠀⢀⣤⠾⢋⣴⠟⣿⣿⣿⡟⢷⣬⠙⢷⣄⠀⠀⠀
                        ⢀⣠⡴⠟⠁⠀⣾⡇⠀⣿⣿⣿⡇⠀⣿⡇⠀⠙⠳⣦⣀
                        ⢸⡏⠀⠀⠀⠀⢿⡇⠀⢸⣿⣿⠁⠀⣿⡇⠀⠀⠀⠈⣿
                        ⠀⣷⠀⠀⠀⠀⢸⡇⠀⠀⢻⠇⠀⠀⣿⠇⠀⠀⠀⠀⣿
                        ⠀⢿⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⢸⡏
                        ⠀⠘⡇⠀⠀⠀⠈⣷⠀⠀⠀⠀⠀⢀⡟⠀⠀⠀⠀⡾⠀
                        ⠀⠀⠹⠀⠀⠀⠀⢻⠀⠀⠀⠀⠀⢸⠇⠀⠀⠀⢰⠁⠀
                        ⠀⠀⠀⠁⠀⠀⠀⠈⢇⠀⠀⠀⠀⡞⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
    "
    echo -e "${NEON_GREEN}                      [ SpiderX - VERSION 1.0 ]${NC}"
    echo -e "${NEON_PURPLE}                    [ ADVANCED RECON FRAMEWORK ]${NC}\n"
}

# Glitch effect
glitch() {
    local text=$1
    for i in {1..3}; do
        echo -ne "\r${NEON_PINK}${text}${NC}"
        sleep 0.1
        echo -ne "\r${NEON_BLUE}${text}${NC}"
        sleep 0.1
    done
    echo -ne "\r${NEON_GREEN}${text}${NC}\n"
}

# Cyber scanning animation
cyber_scan() {
    local target=$1
    echo -e "\n${NEON_BLUE}[>] ${FLASH}INITIATING SCAN SEQUENCE${NC}"
    sleep 0.5
    echo -e "${NEON_PINK}[>] TARGET ACQUIRED: ${NEON_GREEN}$target${NC}"
    sleep 0.5

    for i in {1..20}; do
        echo -ne "\r${NEON_PURPLE}|${NEON_BLUE}█████${NEON_PINK}█████${NEON_GREEN}█████${NEON_PURPLE}| ${i}0% "
        sleep 0.1
    done
    echo -e "\n"
}

# Main scanner function
scan_target() {
    local target=$1
    local output_dir="HUNT_${target}_$(date +%H%M%S)"
    mkdir -p "$output_dir"

    glitch "> LAUNCHING CYBER RECONNAISSANCE"
    cyber_scan "$target"

    echo -e "${NEON_BLUE}[*] EXTRACTING DATA FROM WAYBACK MACHINE${NC}"
    curl -s "https://web.archive.org/cdx/search?url=*.${target}/*&collapse=urlkey&output=text&fl=original" > "$output_dir/urls.txt"

    if [ -s "$output_dir/urls.txt" ]; then
        echo -e "${NEON_GREEN}[+] DATA EXTRACTION SUCCESSFUL${NC}"
        count=$(wc -l < "$output_dir/urls.txt")
        echo -e "${NEON_PINK}[>] DISCOVERED: ${NEON_GREEN}$count${NEON_PINK} TARGETS${NC}"

        # Extract domains and subdomains
        cat "$output_dir/urls.txt" | grep -o -E "https?://[^/]+" | sort -u > "$output_dir/domains.txt"

        # Extract paths (excluding query parameters)
        cat "$output_dir/urls.txt" | while read url; do
            echo "$url" | sed -E 's|https?://[^/]+/?||' | sed 's/?.*//' | grep -v '^$'
        done | sort -u > "$output_dir/paths.txt"

        # Count unique values
        domain_count=$(wc -l < "$output_dir/domains.txt")
        path_count=$(wc -l < "$output_dir/paths.txt")

        # Print results in cyber style
        echo -e "\n${NEON_PURPLE}[>] SCAN RESULTS${NC}"
        echo -e "${NEON_BLUE}══════════════════════════════════════${NC}"
        echo -e "${NEON_GREEN}[+] Domains   : $domain_count${NC}"
        echo -e "${NEON_GREEN}[+] Paths     : $path_count${NC}"
        echo -e "${NEON_GREEN}[+] Total URLs : $count${NC}"

        # Show some example findings
        echo -e "\n${NEON_PURPLE}[>] SAMPLE DOMAINS FOUND:${NC}"
        head -n 5 "$output_dir/domains.txt"

        echo -e "\n${NEON_PURPLE}[>] SAMPLE PATHS FOUND:${NC}"
        head -n 5 "$output_dir/paths.txt"

        # Generate detailed report
        {
            echo "╔═══════════════════════════════════════╗"
            echo "║        SpiderX SCAN REPORT       ║"
            echo "╚═══════════════════════════════════════╝"
            echo "[TARGET] : $target"
            echo "[TIME]   : $(date)"
            echo "[STATUS] : SCAN COMPLETE"
            echo ""
            echo "DISCOVERED DOMAINS:"
            cat "$output_dir/domains.txt"
            echo ""
            echo "DISCOVERED PATHS:"
            cat "$output_dir/paths.txt"
        } > "$output_dir/report.txt"

        echo -e "\n${NEON_PINK}[>] SCAN COMPLETE - CHECK ${NEON_GREEN}$output_dir/report.txt${NEON_PINK} FOR DETAILS${NC}"
    else
        echo -e "${NEON_PINK}[!] NO DATA FOUND${NC}"
    fi
}

# Main execution
main() {
    show_welcome
    if [ $# -ne 1 ]; then
        echo -e "${NEON_PINK}[!] USAGE: $0 <domain>${NC}"
        echo -e "${NEON_BLUE}[!] EXAMPLE: $0 example.com${NC}"
        exit 1
    fi
    scan_target "$1"
}

main "$@"
