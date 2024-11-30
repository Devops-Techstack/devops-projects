#!/bin/bash
 
 # Function to display usage instructions
 usage() {
   echo "Usage: $0 <username> <password> <ssh_public_key>"
   echo "  <username>        : The username for the new account"
   echo "  <password>        : The password for the new user"
   echo "  <ssh_public_key>  : The SSH public key for key-based authentication"
   exit 1
 }
 
 # Check if the correct number of arguments is provided
 if [ $# -ne 3 ]; then
   usage
 fi
 
 # Assign input arguments to variables
 USERNAME=$1
 PASSWORD=$2
 SSH_KEY=$3
 USER_HOME="/home/$USERNAME"
 
 # Check if the user already exists
 if id "$USERNAME" &>/dev/null; then
   echo "Error: User '$USERNAME' already exists."
   exit 2
 fi
 
 # Create the new user with a home directory and set the shell to /bin/bash
 useradd -m -s /bin/bash "$USERNAME"
 if [ $? -ne 0 ]; then
   echo "Error: Failed to create user '$USERNAME'."
   exit 3
 fi
 
 # Set the password for the user
 echo "$USERNAME:$PASSWORD" | chpasswd
 if [ $? -ne 0 ]; then
   echo "Error: Failed to set password for user '$USERNAME'."
   exit 4
 fi
 
 # Create the .ssh directory in the user's home directory
 mkdir -p "$USER_HOME/.ssh"
 chmod 700 "$USER_HOME/.ssh"
 
 # Add the SSH public key to the authorized_keys file
 echo "$SSH_KEY" > "$USER_HOME/.ssh/authorized_keys"
 chmod 600 "$USER_HOME/.ssh/authorized_keys"
 
 # Set the correct ownership for the .ssh directory and its contents
 chown -R "$USERNAME:$USERNAME" "$USER_HOME/.ssh"
 
 # Optionally, add the user to a specific group (e.g., 'sudo' or 'docker')
 # usermod -aG sudo "$USERNAME"
 
 # Display a success message
 echo "User '$USERNAME' created successfully with SSH key access."
 
 # End of script
