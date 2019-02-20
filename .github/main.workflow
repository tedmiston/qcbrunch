workflow "Zeit Now Deploy" {
  on = "push"
  resolves = [
    "Alias",
  ]
}

action "Validate HTML" {
  uses = "docker://validator/validator:latest"
  args = "java -jar /vnu.jar index.html stats.html"
}

action "Validate CSS" {
  uses = "docker://validator/validator:latest"
  args = "echo TODO"
}

action "Deploy" {
  uses = "actions/zeit-now@master"
  secrets = ["ZEIT_TOKEN"]
  needs = [
    "Validate HTML",
    "Validate CSS",
  ]
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
