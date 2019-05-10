FROM validator/validator:latest@sha256:845a84e9abec538b1822e888e42668d48f564edd5105f6cd0a3c2a90062ab9aa

CMD ["sh", "-c", "java -jar /vnu.jar --errors-only --skip-non-html --verbose $(find -name \"*.html\" -not -path \"./node_modules/*\")"]
