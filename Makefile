NAMESPACE  ?= default
REPOSITORY ?= quay.io/steigr/mongooseim-operator
PREFIX     ?= mongooseim
VERSION    ?= $(shell git describe --tags)
LOGO_URL   ?= https://mongooseim.readthedocs.io/en/latest/MongooseIM_logo.png

all: release
	@true

release:
	@./generate-and-install-operator.sh "$(NAMESPACE)" "$(REPOSITORY)" "$(VERSION)" "$(PREFIX)"

logo.png:
	curl -L -o logo.png "$(LOGO_URL)"

logo: logo.png
	convert logo.png -resize 40x40 - | base64 -b0 > logo
