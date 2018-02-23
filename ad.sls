ad-setup:
  cmd.run:
    - name: echo cisco.123 | realm join vzlab.local

replace-domain-name-option:
  cmd.run:
    - name: sed -i 's/use_fully_qualified_names.*/use_fully_qualified_names = False /' /etc/sssd/sssd.conf

replace-home-dir-path:
  cmd.run:
    - name: sed -i 's/fallback_homedir.*/fallback_homedir = \/home\/%u/' /etc/sssd/sssd.conf

sssd-restart:
  cmd.run:
    - name: systemctl restart sssd

