#!/bin/bash

# Add local user
# Either use the LOCAL_USER_ID if passed in at runtime or
# fallback

USER_ID=${LOCAL_USER_ID:-9001}

echo "Starting with UID : $USER_ID"

getent passwd $USER_ID > /dev/null 2&>1

if [ $? -eq 0 ]; then
    echo "Creating ${USER_ID} ...."
    useradd --shell /bin/bash -u $USER_ID -o -c "" -m user
else
    echo "${USER_ID} already exists."
fi

export HOME=/home/user

/sbin/my_init

