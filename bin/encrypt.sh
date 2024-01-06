#!/bin/bash
file_to_encrypt="$1"
gpg --encrypt --recipient your@email.com "$file_to_encrypt"
