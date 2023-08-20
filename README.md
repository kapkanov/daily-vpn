## About

This project is indented to allow you quickly bootstrap a vpn server for daily web browsing via PC, phone or any other device that's [able to run wireguard](https://www.wireguard.com/install/). For now it just creates lighsail instance and configures wireguard server on it. 

## Requirements

- terraform cli
- ansible
- make
- aws cli with access to your account provided via environment variables or `aws configure` command. It's better to use an account with limited set of permissions for lightsail instance creation and configuration, but it's quite tedious, an example of IAM document with all neccessary permissions will be added later on

## Bootstrap

- Edit file with usernames `users.txt`. One name per line and it's better not to use whitespaces
- Run `make` in a root of the repo
- Get user configs under `ansible/userconfigs`

## Clean

- To remove your vpn server simply run `make clean`

