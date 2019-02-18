workflow "Zeit Now Deploy" {
  on = "push"
  resolves = [
    "Alias",
    "Master",
    "Validate",
  ]
}

action "Validate" {
  uses = "docker://validator/validator"
  args = "find . -name '*.html' | xargs java -jar /vnu.jar"
}

action "Deploy" {
  uses = "actions/zeit-now@master"
  secrets = ["ZEIT_TOKEN"]
  needs = ["Validate"]
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
