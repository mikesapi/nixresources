# Steps for connecting two PCs via an ethernet cable.

- Connect two PCs (PC1, PC2) via an ethernet cable, making sure wired connection is ON.
- Disconnect any VPN connections.
- Set up PC1 to have IPv4: 192.168.1.1, Netmask: 255.255.255.0
- Set up PC2 to have IPv4: 192.168.1.2, Netmask: 255.255.255.0
- From PC1, test connection: `ping 192.168.1.2`, and ssh: `ssh PC2uname@192.168.1.2`
- From PC2, test connection: `ping 192.168.1.1`, and ssh: `ssh PC1uname@192.168.1.1`
