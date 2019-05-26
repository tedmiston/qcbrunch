FROM validator/validator:latest@sha256:33dd5741e96e2369398046fbdce3111d08e3b15e7fc12235655667eacc5d67d3

CMD ["sh", "-c", "/vnu-runtime-image/bin/vnu --errors-only --skip-non-html --verbose $(find -name \"*.html\" -path \"./build/*\")"]
