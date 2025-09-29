# nfrastack/container-airsonic-advanced

## About

This repository will build a container for [Airsonic Advanced](https://www.airsonic-advanced.io), for serving a music collection.

## Maintainer

* [Nfrastack](https://www.nfrastack.com)

## Table of Contents

* [About](#about)
* [Maintainer](#maintainer)
* [Table of Contents](#table-of-contents)
* [Installation](#installation)
  * [Prebuilt Images](#prebuilt-images)
  * [Quick Start](#quick-start)
  * [Persistent Storage](#persistent-storage)
* [Configuration](#configuration)
  * [Environment Variables](#environment-variables)
  * [Users and Groups](#users-and-groups)
  * [Networking](#networking)
* [Maintenance](#maintenance)
  * [Shell Access](#shell-access)
* [Support & Maintenance](#support--maintenance)
* [License](#license)
* [References](#references)

## Installation

### Prebuilt Images

Feature limited builds of the image are available on the [Github Container Registry](https://github.com/nfrastack/container-airsonic-advanced/pkgs/container/container-airsonic-advanced) and [Docker Hub](https://hub.docker.com/r/nfrastack/airsonic-advanced).

To unlock advanced features, one must provide a code to be able to change specific environment variables from defaults. Support the development to gain access to a code.

To get access to the image use your container orchestrator to pull from the following locations:

```
ghcr.io/nfrastack/container-airsonic-advanced:(image_tag)
docker.io/nfrastack/airsonic-advanced:(image_tag)
```

Image tag syntax is:

`<image>:<optional tag>`

Example:

`ghcr.io/nfrastack/container-airsonic-advanced:latest` or

`ghcr.io/nfrastack/container-airsonic-advanced:1.0`

* `latest` will be the most recent commit
* An optional `tag` may exist that matches the [CHANGELOG](CHANGELOG.md) - These are the safest

Have a look at the container registries and see what tags are available.

#### Multi-Architecture Support

Images are built for `amd64` by default, with optional support for `arm64` and other architectures.

### Quick Start

* The quickest way to get started is using [docker-compose](https://docs.docker.com/compose/). See the examples folder for a working [compose.yml](examples/compose.yml) that can be modified for your use.

* Map [persistent storage](#persistent-storage) for access to configuration and data files for backup.
* Set various [environment variables](#environment-variables) to understand the capabilities of this image.

### Persistent Storage

The following directories/files should be mapped for persistent storage in order to utilize the container effectively.

| Folder                 | Description                                                                                                |
| ---------------------- | ---------------------------------------------------------------------------------------------------------- |
| `/config`              | (Optional) - Configuration folder                          |
| `/data`           | Data folder to hold music, podcasts etc|

### Environment Variables

#### Base Images used

This image relies on a customized base image in order to work.
Be sure to view the following repositories to understand all the customizable options:

| Image                                                   | Description |
| ------------------------------------------------------- | ----------- |
| [OS Base](https://github.com/nfrastack/container-base/) | Base Image  |

Below is the complete list of available options that can be used to customize your installation.

* Variables showing an 'x' under the `Advanced` column can only be set if the containers advanced functionality is enabled.

#### Core Configuration

#### General Settings

| Parameter              | Description                                                  | Default                    | Advanced |
| ---------------------- | ------------------------------------------------------------ | -------------------------- | -------- |
| `CONFIG_PATH`          | Where configuration files are kept                           | `/config`                  |          |
| `DATA_PATH`            | Root Volatile Data folder                                    | `/data/`                   |          |

## Users and Groups

| Type  | Name      | ID   |
| ----- | --------- | ---- |
| User  | `airsonic` | 4040 |
| Group | `airsonic` | 4040 |

### Networking

| Port  | Protocol | Description |
| ----- | -------- | ----------- |
| `4040`  | tcp      | Airsonic Advanced Interface       |

* * *

## Maintenance

### Shell Access

For debugging and maintenance, `bash` and `sh` are available in the container.

## Support & Maintenance

* For community help, tips, and community discussions, visit the [Discussions board](/discussions).
* For personalized support or a support agreement, see [Nfrastack Support](https://nfrastack.com/).
* To report bugs, submit a [Bug Report](issues/new). Usage questions will be closed as not-a-bug.
* Feature requests are welcome, but not guaranteed. For prioritized development, consider a support agreement.
* Updates are best-effort, with priority given to active production use and support agreements.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
