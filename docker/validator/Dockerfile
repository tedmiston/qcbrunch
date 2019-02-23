FROM validator/validator:latest

CMD ["sh", "-c", "java -jar /vnu.jar --errors-only --skip-non-html --verbose $(find -name \"*.html\" -not -path \"./node_modules/*\")"]
