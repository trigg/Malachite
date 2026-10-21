# Malachite

A uBlue image running Wayfire, wf-shell and a highly opinionated set of defaults.

## How to

If you already have a Silverblue, Kinoite or other uBlue install just run

```
rpm-ostree rebase ostree-unverified-registry:ghcr.io/trigg/malachite:latest
```

To install fresh : Good luck? Not got that far yet

## Details

Some elements are pulled directly from development git.

- [wayfire](https://github.com/WayfireWM/wayfire) - the compositor
- [wf-shell](https://github.com/WayfireWM/wf-shell/) - panel, background, lockscreen
- [wf-copy-capture](https://github.com/soreau/wf-copy-capture) - wayfire plugin to allow screencasting
- [pixdecor](https://github.com/soreau/pixdecor) - wayfire plugin to decorate windows. Personal preference
- [touchswitch](https://github.com/trigg/touchswitch) - wayfire plugin to switch windows with touch gestures
- [orientprompt](https://github.com/trigg/orientprompt) - gtk app to change display orientation based on sensor data.
- [materia-trigg-custom](https://github.com/trigg/materia-trigg-custom/) - gtk theme. dark, slightly blue, slightly translucent.
- [wf-session-systemd](https://github.com/trigg/wf-session-systemd) - session manager

## Why

This image is intended to test daily changes to wayfire and wf-shell in a repeatable manner.

It may not pay off, but it seemed like a good idea at the time.