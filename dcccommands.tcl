# This script makes the Eggdrop bot receive all DCC commands via MSG
# and replies with a predefined response

# Register the DCC handler
bind dcc - |* - msghandler

# Procedure to handle incoming MSGs
proc msghandler {type args} {
    variable me
    variable users

    set me [lindex [split $type :] 0]
    set args [lassign $args user type]

    if {[lsearch -exact $users $user] == -1} {
        lappend users $user
    }

    if {$type eq "PRIVMSG"} {
        # Process the received DCC command
        # For demonstration purposes, send a predefined response
        set response "Hello! This is the response to your DCC command."
        dcc msg $user $response
        putlog "Received DCC command from $user: $args"
    }
}

# Initialize list of users
set users {}

# Print a message indicating that the script is loaded
putlog "DCC MSG handler script loaded successfully"
