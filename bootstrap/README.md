# Bootstrap Scripts

Bootstrap scripts are generated from mako files and can be created for
different workstation/server instances based on permanent salt configuration
files. All scripts must be generated from template and deployed to the target
machine either scp or cloud-init.

## Generating Bootstrap Script from Template

python3-mako-render machine_name.mako > out/machine_name.sh

## Mako Include Files

All mako include paths must be under the template root. So for salt templates
that get included, we symlink ../salt/files -> files.

