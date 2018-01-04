include Makefile.config

release: 
	repo org.rawtherapee.RawTherapee.json
	flatpak-builder --force-clean --repo=repo --ccache --gpg-sign=${GPG_KEY} rawtherapee org.rawtherapee.RawTherapee.json
	flatpak build-update-repo --generate-static-deltas --gpg-sign=${GPG_KEY} repo

bundle:
	flatpak build-bundle repo rawtherapee.flatpak org.rawtherapee.RawTherapee
	rm -f rawtherapee.flatpak.sig
	gpg --sign-with ${GPG_KEY} --output rawtherapee.flatpak.sig --detach-sign rawtherapee.flatpak

repo:
	ostree init --mode=archive-z2 --repo=repo

rawtherapee.flatpakref: rawtherapee.flatpakref.in
	sed -e 's|@REPO_URL@|${REPO_URL}|g' -e 's|@GPG@|$(shell gpg2 --export ${GPG_KEY} | base64 | tr -d '\n')|' $< > $@

# install a bundle with: flatpak install rawtherapee.flatpak
