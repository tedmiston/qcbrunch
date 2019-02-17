workflow "Zeit Now Deploy" {
  on = "push"
  resolves = ["Deploy"]
}

action "Deploy" {
  uses = "actions/zeit-now@666edee2f3632660e9829cb6801ee5b7d47b303d"
  secrets = ["ZEIT_TOKEN"]
}
