workflow "Zeit Now Deploy" {
  on = "push"
  resolves = [
    "Alias",
    "Master",
  ]
}

action "Deploy" {
  uses = "actions/zeit-now@master"
  secrets = ["ZEIT_TOKEN"]
}

action "Master" {
  uses = "actions/bin/filter@46ffca7632504e61db2d4cb16be1e80f333cb859"
  needs = ["Deploy"]
  args = "branch master"
}

action "Alias" {
  uses = "actions/zeit-now@master"
  args = "alias"
  secrets = ["ZEIT_TOKEN"]
  needs = ["Master"]
}
