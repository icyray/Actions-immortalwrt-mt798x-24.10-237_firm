# Actions-OpenWrt-Multiple

[![LICENSE](https://img.shields.io/github/license/mashape/apistatus.svg?style=flat-square&label=LICENSE)](https://github.com/icyray/Actions-immortalwrt-mt798x-24.10-237_firm/blob/master/LICENSE)

A template for building OpenWrt with GitHub Actions, based on [P3TERX/Actions-OpenWrt](https://github.com/P3TERX/Actions-OpenWrt).

## What is different?

- This template allows you to build multiple target devices images simultaneously in a single repository, with update check for respective profiles.

- Refactor builder and bugfix.

## Usage

You need to prepare the following items before using this template.

- **`.config` file:** Generate `.config` files using any compatible OpenWrt source code.

- **`.sh` file:** To include your custom software or do some modifications to the image.

- **`.md` file:** *Optional.* This file is used to display the description about your image when release. Add some meta info of your built firmware (such as firmware architecture and installed packages) here, this will save others' time.
  - The line starting with `![Badge]` in `.md` file will be replaced with meta data badge, including build time, target device, upstream repo and commit hash.

- **`.yml` file:** Copy the template workflow file to your repository. Modify the filename, workflow name and `env` parts to fit your `.config`, `.sh` and `.md` files. **Note: The workflow name must be unique. Do not edit other parameters in the workflow file.**
  - Setting `UPDATER_ENABLED` to `true` will enable the updater feature.
  - `UPDATER_DEFCONFIG` signifies the path of default `.config` file that generates your own `.config` file in OpenWrt source code. *This is a special parameter for [padavanonly/immortalwrt-mt798x-24.10](https://github.com/padavanonly/immortalwrt-mt798x-24.10). See below for more details.*

After completing the preparation, you can start building your firmware.

- `update-checker` will check all workflow files under `.github/workflows`, find those workflow files with `UPDATER_ENABLED` set to `true`. Then `update-checker` will extract building data from each workflow file, check whether there is a newer version of OpenWrt source code, and trigger the firmware building if needed. `update-checker` will also check `DEFCONFIG` update (this usually indicate the kernel package or driver of the system has been updated, and you may need to update your `.config` file)(use for [padavanonly/immortalwrt-mt798x-24.10](https://github.com/padavanonly/immortalwrt-mt798x-24.10)) and send a issue to notify you.

- You can also trigger any single profile via `Run workflow` button in the Github Actions page.

- When the build is complete, `Artifacts` will list your firmware image. You can also find the firmware image in the `release` page.

## Notices

- `update-checker` was scheduled to run every 5 day at 00:00 UTC by default. To disable it, please comment schedule.

- `clean-up` will be called after each build is completed. It will delete all workflow runs except the latest 2 runs and the latest 4 releases runs. If you need to keep more workflow runs, please modify the `clean-up` workflow file.

- **Please understand that this repository only accepts issues with bugs report. Those about how to build OpenWrt will be closed.**

## Credits

- [P3TERX/Actions-OpenWrt](https://github.com/P3TERX/Actions-OpenWrt)
- [Microsoft Azure](https://azure.microsoft.com)
- [GitHub Actions](https://github.com/features/actions)
- [OpenWrt](https://github.com/openwrt/openwrt)
- [padavanonly/immortalwrt-mt798x-24.10](https://github.com/padavanonly/immortalwrt-mt798x-24.10)
- [dacbd/create-issue-action](https://github.com/dacbd/create-issue-action)
- [benc-uk/workflow-dispatch](https://github.com/benc-uk/workflow-dispatch)
- [softprops/action-gh-release](https://github.com/softprops/action-gh-release)
- [Mattraks/delete-workflow-runs](https://github.com/Mattraks/delete-workflow-runs)
- [ophub/delete-releases-workflows](https://github.com/ophub/delete-releases-workflows)

## License

[MIT](https://github.com/P3TERX/Actions-OpenWrt/blob/main/LICENSE) © [**P3TERX**](https://p3terx.com)

[MIT](https://github.com/icyray/Actions-immortalwrt-mt798x-24.10-237_firm/blob/main/LICENSE) © [**icyray**](https://github.com/icyray)
