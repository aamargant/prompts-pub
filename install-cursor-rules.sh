#!/bin/bash

# 🚀 Cursor Rules Installer
# Imports cursor rules from prompts repository to any target repository

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Repository information
REPO_URL="https://github.com/aamargant/prompts-pub.git"
TEMP_DIR="/tmp/prompts-$$"

print_header() {
    echo -e "${BLUE}╔══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║                    🚀 Cursor Rules Installer                 ║${NC}"
    echo -e "${BLUE}║              Import AI-enhanced cursor configurations        ║${NC}"
    echo -e "${BLUE}╚══════════════════════════════════════════════════════════════╝${NC}"
    echo
}

print_step() {
    echo -e "${YELLOW}➤${NC} $1"
}

print_success() {
    echo -e "${GREEN}✅${NC} $1"
}

print_error() {
    echo -e "${RED}❌${NC} $1"
}

print_info() {
    echo -e "${BLUE}ℹ️${NC}  $1"
}

cleanup() {
    if [ -d "$TEMP_DIR" ]; then
        print_step "Cleaning up temporary files..."
        rm -rf "$TEMP_DIR"
        print_success "Cleanup completed"
    fi
}

# Set trap to cleanup on exit
trap cleanup EXIT

main() {
    print_header
    
    # Check if we're in a git repository
    if ! git rev-parse --git-dir > /dev/null 2>&1; then
        print_error "Not in a git repository. Please run this script from the root of your project."
        exit 1
    fi
    
    # Get current directory (target repo)
    TARGET_DIR=$(pwd)
    print_info "Target repository: $TARGET_DIR"
    
    # Create temporary directory for cloning
    print_step "Creating temporary directory..."
    mkdir -p "$TEMP_DIR"
    
    # Clone the prompts repository
    print_step "Downloading cursor rules from prompts..."
    if command -v git > /dev/null 2>&1; then
        git clone --quiet --depth 1 "$REPO_URL" "$TEMP_DIR" 2>/dev/null || {
            print_error "Failed to clone repository. Trying alternative method..."
            
            # Alternative: Download from local path if this script is run from the source repo
            SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
            if [ -f "$SCRIPT_DIR/.cursor/rules/deep-thought.mdc" ]; then
                print_info "Using local repository files..."
                cp -r "$SCRIPT_DIR/.cursor" "$TEMP_DIR/" 2>/dev/null || {
                    print_error "Could not access cursor rules. Please ensure you have the prompts repository available."
                    exit 1
                }
            else
                print_error "Could not download cursor rules. Please check your internet connection or repository URL."
                exit 1
            fi
        }
    else
        print_error "Git is not installed. Please install git to use this script."
        exit 1
    fi
    
    # Check if cursor rules exist in the source
    if [ ! -d "$TEMP_DIR/.cursor/rules" ]; then
        print_error "Cursor rules not found in the source repository."
        exit 1
    fi
    
    # Create .cursor/rules directory in target repository if it doesn't exist
    print_step "Setting up cursor rules directory..."
    mkdir -p "$TARGET_DIR/.cursor/rules"
    
    # Copy cursor rules
    print_step "Installing cursor rules..."
    
    # Copy all .mdc files
    if cp "$TEMP_DIR/.cursor/rules"/*.mdc "$TARGET_DIR/.cursor/rules/" 2>/dev/null; then
        print_success "Cursor rules installed successfully!"
        
        # List installed rules
        echo
        print_info "Installed cursor rules:"
        for rule in "$TARGET_DIR/.cursor/rules"/*.mdc; do
            if [ -f "$rule" ]; then
                rule_name=$(basename "$rule" .mdc)
                echo -e "  ${GREEN}•${NC} $rule_name"
            fi
        done
        
    else
        print_error "Failed to copy cursor rules."
        exit 1
    fi
    
    # Add .cursor directory to .gitignore if it doesn't exist
    print_step "Updating .gitignore..."
    if [ -f "$TARGET_DIR/.gitignore" ]; then
        if ! grep -q "^\.cursor/" "$TARGET_DIR/.gitignore" 2>/dev/null; then
            echo ".cursor/" >> "$TARGET_DIR/.gitignore"
            print_success "Added .cursor/ to .gitignore"
        else
            print_info ".cursor/ already in .gitignore"
        fi
    else
        echo ".cursor/" > "$TARGET_DIR/.gitignore"
        print_success "Created .gitignore with .cursor/ entry"
    fi
    
    # Final instructions
    echo
    print_success "Installation completed successfully!"
    echo
    print_info "Next steps:"
    echo "  1. Restart Cursor IDE to apply the new rules"
    echo "  2. Open any file and test the enhanced AI behavior"
    echo "  3. Choose between available rules:"
    echo "     • ai-web-interface-designer.mdc - For information-dense, creative web interfaces"
    echo "     • deep-thought.mdc - For comprehensive analysis and reasoning"
    echo "     • precision-efficiency.mdc - For structured, concise responses"
    echo
    print_info "To switch between rules, rename the desired .mdc file or modify your Cursor settings."
}

# Handle command line arguments
case "${1:-}" in
    -h|--help)
        echo "Usage: $0 [OPTIONS]"
        echo
        echo "Import cursor rules from prompts repository to current repository"
        echo
        echo "Options:"
        echo "  -h, --help     Show this help message"
        echo "  -v, --version  Show version information"
        echo
        echo "This script must be run from the root of a git repository."
        exit 0
        ;;
    -v|--version)
        echo "Cursor Rules Installer v1.0.0"
        exit 0
        ;;
    "")
        main
        ;;
    *)
        print_error "Unknown option: $1"
        echo "Use -h or --help for usage information."
        exit 1
        ;;
esac 