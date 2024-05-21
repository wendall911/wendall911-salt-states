copr-i3status-rust-repo:
  pkgrepo.managed:
    - humanname: Copr repo for i3status-rust owned by atim
    - baseurl: https://download.copr.fedorainfracloud.org/results/atim/i3status-rust/fedora-$releasever-$basearch/
    - gpgkey: https://download.copr.fedorainfracloud.org/results/atim/i3status-rust/pubkey.gpg
    - gpgcheck: 1

copr-unison-repo:
  pkgrepo.managed:
    - humanname: Copr repo for Unison owned by croadfeldt
    - baseurl: https://download.copr.fedorainfracloud.org/results/croadfeldt/Unison/fedora-$releasever-$basearch/
    - gpgkey: https://download.copr.fedorainfracloud.org/results/croadfeldt/Unison/pubkey.gpg
    - gpgcheck: 1

copr-prismlauncher-repo:
  pkgrepo.managed:
    - humanname: Copr repo for prismlauncher owned by g3tchoo
    - baseurl: https://download.copr.fedorainfracloud.org/results/g3tchoo/prismlauncher/fedora-$releasever-$basearch/
    - gpgkey: https://download.copr.fedorainfracloud.org/results/g3tchoo/prismlauncher/pubkey.gpg
    - gpgcheck: 1

copr-keyd-repo:
  pkgrepo.managed:
    - humanname: Copr repo for keyd owned by alternateved
    - baseurl: https://download.copr.fedorainfracloud.org/results/alternateved/keyd/fedora-$releasever-$basearch/
    - gpgkey: https://download.copr.fedorainfracloud.org/results/alternateved/keyd/pubkey.gpg
    - gpgcheck: 1
