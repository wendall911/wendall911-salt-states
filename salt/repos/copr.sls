i3status-rust:
  pkgrepo.managed:
    - humanname: Copr repo for i3status-rust owned by atim
    - baseurl: https://download.copr.fedorainfracloud.org/results/atim/i3status-rust/fedora-$releasever-$basearch/
    - gpgkey: https://download.copr.fedorainfracloud.org/results/atim/i3status-rust/pubkey.gpg
    - gpgcheck: 1


unison:
  pkgrepo.managed:
    - humanname: Copr repo for Unison owned by croadfeldt
    - baseurl: https://download.copr.fedorainfracloud.org/results/croadfeldt/Unison/fedora-$releasever-$basearch/
    - gpgkey: https://download.copr.fedorainfracloud.org/results/croadfeldt/Unison/pubkey.gpg
    - gpgcheck: 1
