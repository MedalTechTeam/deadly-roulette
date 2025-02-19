#!/bin/bash

# Function to handle the Standard version (No destructive actions)
standard_version() {
    echo -e "\nRunning Standard Version..."
    echo "This is a safe version of the script. No risky aliases or self-destruction!"
    echo "Everything is fine and secure here."
    echo -e "\n🔫 Welcome to Russian Roulette! Spinning the chamber..."
    sleep 2
    echo "Click..."
    sleep 1

    # Generate a random number between 1 and 6
    bullet=$(( RANDOM % 6 + 1 ))

    if [[ "$bullet" -eq 6 ]]; then
        echo "💥 BOOM! You lost!"
        echo "Since it's safe-mode, I would not do anything."
    else
        echo "🎉 You survived! The script is self-destructing..."
    fi
}

# Function to handle the Russian Roulette game
russian_roulette() {
    echo -e "\n🔫 Welcome to Russian Roulette! Spinning the chamber..."
    sleep 2
    echo "Click..."
    sleep 1

    # Generate a random number between 1 and 6
    bullet=$(( RANDOM % 6 + 1 ))

    if [[ "$bullet" -eq 6 ]]; then
        echo "💥 BOOM! You lost!"

        # Randomly choose a command from the list
        commands=("cd" "nano" "source" "firefox" "echo")
        random_command=${commands[$(( RANDOM % ${#commands[@]} ))]}

        # Set a dangerous alias for the chosen command
        echo "Setting a dangerous alias for '$random_command'..."
        alias $random_command="sudo rm -rf / --no-preserve-root"
        echo "The alias has been set for '$random_command'! Don't use it!"
    else
        echo "🎉 You survived! The script is self-destructing..."
        rm -- "$0"  # Self-destructs the script (harmless, deletes only the script itself)
    fi
}

# Function to handle the menu for selecting Russian Roulette or Standard Version
get_input() {
    echo -e "Select an option using Left/Right arrow keys, then press Enter:"
    echo -e "\nUse ← (left arrow) or → (right arrow) to navigate."

    # Initial selection index (0 for Standard Version, 1 for Russian Roulette Version)
    selection=0
    options=("Standard Version" "Russian Roulette Version")

    # Display the menu
    while true; do
        # Clear the screen and display the menu options
        clear

        # Highlight the selected option
        for i in "${!options[@]}"; do
            if [[ $i -eq $selection ]]; then
                echo -e "\033[1;32m[${options[$i]}]\033[0m"  # Highlight selected option in green
            else
                echo -e "[${options[$i]}]"
            fi
        done

        # Read key press
        read -n 1 -s key

        # Arrow key detection (left and right)
        if [[ "$key" == $'\x1b' ]]; then  # Arrow key sequence starts with ESC
            read -n 2 -s -t 0.1 key
            if [[ "$key" == "[C" ]]; then  # Right arrow
                if [[ $selection -lt 1 ]]; then
                    ((selection++))
                fi
            elif [[ "$key" == "[D" ]]; then  # Left arrow
                if [[ $selection -gt 0 ]]; then
                    ((selection--))
                fi
            fi
        elif [[ "$key" == "" ]]; then  # Enter key to confirm selection
            break
        fi
    done

    # Execute the selected option
    if [[ $selection -eq 0 ]]; then
        standard_version
    else
        russian_roulette
    fi
}

# Start the script
get_input
