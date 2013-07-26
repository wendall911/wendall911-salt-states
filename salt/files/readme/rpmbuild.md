# Creating RPM Packages for Fedora / Centos / Amazon Linux

All requirements should already be installed via salt. A .rpmmacros has already been created.

## Setup Environment

rpmdev-setuptree

## Detailed rpmbuild instructions

### Centos
* [Instructions](http://wiki.centos.org/HowTos/SetupRpmBuildEnvironment) for setting up rpmbuild on Centos NOTE: Do not install redhat-rpm-config

### Fedora
* [Instructions](https://fedoraproject.org/wiki/How_to_create_an_RPM_package) for setting up rpmbuild on Fedora

## Extracting files from existing SRPMS
* wget package.src.rpm
* rpmdev-extract package.src.rpm
* mv package.src/*.spec ~/rpmbuild/SPECS
* mv package.src/* ~/rpmbuild/SOURCES

## Building from SPEC
* cd ~/rpmbuild/SPECS
* rpmbuild -ba yourspec.spec

## Pushing to yum repo
* scp all rpms and srpms to signer workstation
* sign rpms and add to yum repo
