FROM ghcr.io/validator/validator:latest

CMD ["sh", "-c", "/vnu-runtime-image/bin/vnu --errors-only --skip-non-html --verbose $(find -name \"*.html\" -path \"./build/*\")"]
