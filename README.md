# Essential Education Assets

System administration assets for Essential Education Corporation.

## Buildouts

Each internal application has a unique buildout environment. These buildouts
can either be copied to another location on the filesystem or, if the target
system is a salt minion, updated via the salt master.

[Project Buildout Documentation](docs/buildout.md)

## Repository Management

Each repository belonging to an application has some configuration and setup
required for the repository to be used within any given project.

[Repository Management Documentation](docs/repository-management.md)

## Versioning

All software components should use [Semantic Versioning](https://github.com/essentialed/semver/blob/master/semver.md).
