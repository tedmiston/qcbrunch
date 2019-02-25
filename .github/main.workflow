workflow "Deploy" {
  on = "push"
  resolves = ["Alias"]
}

action "Validate HTML" {
  uses = "tedmiston/qcbrunch/docker/html-validator@master"
}

action "Validate CSS" {
  uses = "docker://validator/validator:latest"
  args = "java -jar /vnu.jar --skip-non-css --verbose css/"
}

action "Validate JS" {
  uses = "tedmiston/qcbrunch/docker/js-validator@master"
}

action "Validate Markdown" {
  uses = "igorshubovych/markdownlint-cli@master"
  args = "--ignore=_posts/ --ignore=node_modules/ ."
}

action "Zeit Now Deploy" {
  uses = "actions/zeit-now@master"
  args = "deploy"
  secrets = ["ZEIT_TOKEN"]
  needs = [
    "Validate HTML",
    "Validate CSS",
    "Validate JS",
    "Validate Markdown",
  ]
}

action "Master" {
  uses = "actions/bin/filter@master"
  args = "branch master"
  needs = ["Zeit Now Deploy"]
}

action "Alias" {
  uses = "actions/zeit-now@master"
  args = "alias"
  secrets = ["ZEIT_TOKEN"]
  needs = ["Master"]
}

workflow "Collection Stats" {
  on = "repository_dispatch"
  resolves = [
    "Google Maps Email",
    "Yelp Email",
  ]
}

action "Google Maps Action" {
  uses = "actions/bin/filter@master"
  args = "action google_maps_views"
}

action "Google Maps Views" {
  uses = "tedmiston/qcbrunch/docker/google-maps-views@google-maps-stats"
  needs = ["Google Maps Action"]
}

action "Google Maps Email" {
  uses = "tedmiston/qcbrunch/docker/google-maps-email@google-maps-stats"
  secrets = ["SENDGRID_API_KEY"]
  needs = ["Google Maps Views"]
}

action "Yelp Action" {
  uses = "actions/bin/filter@master"
  args = "action yelp_follow_count"
}

action "Yelp Followers Count" {
  uses = "swinton/httpie.action@master"
  args = "https://www.yelp.com/collection/Ntw8wQeFY35dpevGB-Et_A?sort_by=alpha | grep Followers | tr -dc '0-9' > yelp_followers_count.txt && cat yelp_followers_count.txt"
  needs = ["Yelp Action"]
}

action "Yelp Email" {
  uses = "tedmiston/qcbrunch/docker/yelp-email@master"
  secrets = ["SENDGRID_API_KEY"]
  needs = ["Yelp Followers Count"]
}
