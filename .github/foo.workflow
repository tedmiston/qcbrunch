workflow "Foo" {
  on = "push"
  resolves = [
    "Bar",
  ]
}

action "Bar" {
  uses = "docker://alpine:latest"
  args = "echo test"
}
