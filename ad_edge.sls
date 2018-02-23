config-file-1:
  module.run:
    - name: cp.get_file
    - path: 'salt://ad_files/FromHadoop.sh'
    - dest: /etc/profile.d/FromHadoop.sh

config-file-2:
  module.run:
    - name: cp.get_file
    - path: 'salt://ad_files/hadoop.sh'
    - dest: /etc/profile.d/hadoop.sh

