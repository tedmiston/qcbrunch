workflow "Zeit Now Deploy" {
  on = "push"
  resolves = [
    "Alias",
    "Master",
    "Validate HTML",
  ]
}

action "Validate HTML" {
  uses = "docker://validator/validator"
  args = "java -jar /vnu.jar index.html stats.html"
}

action "Deploy" {
  uses = "actions/zeit-now@master"
  secrets = ["ZEIT_TOKEN"]
  needs = ["Validate HTML"]
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
