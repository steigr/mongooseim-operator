NAMESPACE  ?= default
REPOSITORY ?= quay.io/mynamespace/example-sao
PREFIX     ?= sao
LOGO_URL   ?= ""

all: release
	@true

release:
	@./generate-and-install-operator.sh "$(NAMESPACE)" "$(REPOSITORY)" "$(shell git describe --tags)" "$(PREFIX)"

logo.png:
	curl -L -o logo.png "$(LOGO_URL)"

logo: logo.png
	convert logo.png -resize 40x40 - | base64 -b0 > logo
