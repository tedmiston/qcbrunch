FROM validator/validator:latest@sha256:d88f04f37ea54d3b87c227c2e9275383ee35ba17f773b653ac81f47afd5ad4c5

CMD ["sh", "-c", "java -jar /vnu.jar --errors-only --skip-non-html --verbose $(find -name \"*.html\" -not -path \"./node_modules/*\")"]
