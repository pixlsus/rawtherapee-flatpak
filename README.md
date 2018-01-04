# A flatpak for RawTherapee

## Clone the repo

`git@github.com:pixlsus/rawtherapee-flatpak.git`

## Make a `Makefile.config` 

The file should contain:


```
GPG_KEY=<your gpg key to sign>
REPO_URL=<your final repo location url>
```
## Build the RawTherapee flatpak

```
make build
make bundle 
flatpak install rawtherapee.flatpak
```
