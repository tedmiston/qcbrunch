workflow "Zeit Now Deploy" {
  on = "push"
  resolves = [
    "Alias",
  ]
}

action "Validate HTML" {
  uses = "docker://validator/validator:latest"
  args = "java -jar /vnu.jar --errors-only --skip-non-html --verbose $(find -name \"*.html\" -not -path \"./node_modules/*\")"
}

action "Validate CSS" {
  uses = "docker://validator/validator:latest"
  args = "java -jar /vnu.jar --skip-non-css --verbose css/"
}

action "Validate JS" {
  uses = "tedmiston/qcbrunch/docker/eslint@master"
}

action "Validate Markdown" {
  uses = "igorshubovych/markdownlint-cli@master"
  args = "--ignore=_posts/ --ignore=node_modules/ ."
}

action "Deploy" {
  uses = "actions/zeit-now@master"
  secrets = ["ZEIT_TOKEN"]
  needs = [
    "Validate HTML",
    "Validate CSS",
    "Validate JS",
    "Validate Markdown",
  ]
  args = "deploy"
}

action "Master" {
  uses = "actions/bin/filter@master"
  needs = ["Deploy"]
  args = "branch master"
}

action "Alias" {
  uses = "actions/zeit-now@master"
  args = "alias"
  secrets = ["ZEIT_TOKEN"]
  needs = ["Master"]
}
