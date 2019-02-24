workflow "Zeit Now Deploy" {
  on = "push"
  resolves = [
    "Alias",
  ]
}

action "Validate HTML" {
  uses = "tedmiston/qcbrunch/docker/validator@master"
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

workflow "Yelp Stats" {
  on = "repository_dispatch"
  resolves = [
    "Email",
  ]
}

action "Action" {
  uses = "actions/bin/filter@master"
  args = "action yelp_follow_count"
}

action "Yelp Followers Count" {
  uses = "swinton/httpie.action@master"
  args = "https://www.yelp.com/collection/Ntw8wQeFY35dpevGB-Et_A?sort_by=alpha | grep Followers | tr -dc '0-9' > yelp_followers_count.txt"
  needs = ["Action"]
}

action "Email" {
  uses = "tedmiston/qcbrunch/docker/debian@master"
  needs = ["Yelp Followers Count"]
}
