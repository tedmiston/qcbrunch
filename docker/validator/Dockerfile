FROM validator/validator:latest

CMD "java -jar /vnu.jar --errors-only --skip-non-html --verbose $(find -name '*.html' -not -path './node_modules/*')"
