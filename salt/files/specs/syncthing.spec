%global debug_package %{nil}

%ifarch x86_64
%global altarch amd64
%endif
%ifarch %{ix86}
%global altarch 386
%endif
%ifarch %{arm}
%global altarch armv7
%endif

Name:syncthing
Version:0.11.26
Release:1%{?dist}
Summary:Open Source File Synchronization
License:MIT
URL:https://syncthing.net/
Source0:https://github.com/%{name}/%{name}/releases/download/v%{version}/%{name}-linux-%{altarch}-v%{version}.tar.gz
ExclusiveArch:x86_64 %{ix86}
BuildRequires:systemd

Requires(post): systemd
Requires(preun): systemd
Requires(postun): systemd

%description
Syncthing replaces proprietary sync and cloud services with something open, trustworthy and decentralized. Your data is your data alone and you deserve to choose where it is stored, if it is shared with some third party and how it's transmitted over the Internet.

%prep
%setup -c
cd %{name}-linux-%{altarch}-v%{version}
echo "$(cat %{name}.md5) %{name}" | md5sum -c
cd -

%build

%install
rm -rf %{buildroot}

mkdir -p %{buildroot}%{_bindir}
install -p -m 0755 %{name}-linux-%{altarch}-v%{version}/syncthing %{buildroot}%{_bindir}

mkdir -p %{buildroot}%{_unitdir}
install -p -m 0644 %{name}-linux-%{altarch}-v%{version}/etc/linux-systemd/system/syncthing@.service %{buildroot}%{_unitdir}


%post
%systemd_post %{name}@.service

%preun
%systemd_preun %{name}@.service

%postun
%systemd_postun_with_restart %{name}@.service

%files
%doc  %{name}-linux-%{altarch}-v%{version}/README.txt %{name}-linux-%{altarch}-v%{version}/LICENSE.txt %{name}-linux-%{altarch}-v%{version}/AUTHORS.txt
%{_bindir}/syncthing
%{_unitdir}/%{name}@.service


%changelog
* Fri Sep 15 2015 kc <kc04bc@gmx.com> 0.11.25-1
- Updated to 0.11.25, not going to update changelog for simple version updates from now
* Fri Sep 6 2015 kc <kc04bc@gmx.com> 0.11.24-1
- Updated to 0.11.24
* Sun Aug 25 2015 kc <kc04bc@gmx.com> 0.11.22-1
- Updated to 0.11.22
* Tue Aug 18 2015 kc <kc04bc@gmx.com> 0.11.20-1
- Updated to 0.11.20
* Wed Aug 12 2015 kc <kc04bc@gmx.com> 0.11.19-1
- Updated to 0.11.19, added md5sum validation of syncthing binary
* Mon Aug 1 2015 kc <kc04bc@gmx.com> 0.11.17-1
- Initial Version, based on https://github.com/thunderbirdtr/syncthing_rpm
