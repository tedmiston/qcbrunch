workflow "Deploy" {
  on = "push"
  resolves = [
    "Zeit Now Deploy",
  ]
}

action "Validate Docker" {
  uses = "tedmiston/qcbrunch/docker/hadolint@master"
}

action "Build" {
  uses = "docker://python:3.7-slim@sha256:589527a734f2a9e48b23cc4687848cb9503d0f8569fad68c3ad8b2ee9d1c50ff"
  needs = [
    "Validate Docker",
  ]
  runs = "bash -c"
  args = "./docker/qcbrunch-cli/app.sh"
  env = {
    QCBRUNCH_ROOT = "$GITHUB_WORKSPACE"
  }
}

action "Validate HTML" {
  uses = "tedmiston/qcbrunch/docker/html-validator@master"
  needs = [
    "Build",
  ]
}

action "Validate CSS" {
  uses = "docker://validator/validator:latest@sha256:33dd5741e96e2369398046fbdce3111d08e3b15e7fc12235655667eacc5d67d3"
  args = "/vnu-runtime-image/bin/vnu --skip-non-css --verbose build/css/"
  needs = [
    "Build",
  ]
}

action "Validate JS" {
  uses = "tedmiston/qcbrunch/docker/js-validator@master"
  needs = [
    "Build",
  ]
}

action "Validate Markdown" {
  uses = "igorshubovych/markdownlint-cli@c62b00d9a586560560b1151b38875deef047a093"
  args = "--ignore=_posts/ --ignore=node_modules/ ."
}

action "Zeit Now Deploy" {
  uses = "tedmiston/zeit-now@c7bb7267fff6ee5fc70ded892dba51b11c3e751a"
  args = "--target production build"
  secrets = ["ZEIT_TOKEN"]
  needs = [
    "Build",
    "Validate Docker",
    "Validate HTML",
    "Validate CSS",
    "Validate JS",
    "Validate Markdown",
  ]
}

workflow "Collection Stats" {
  on = "schedule(0 4 * * *)"
  resolves = [
    "Google Maps Email",
    "Yelp Closed Detector",
    "Yelp Email",
  ]
}

action "Google Maps Views" {
  uses = "tedmiston/qcbrunch/docker/google-maps-views@master"
}

action "Google Maps Email" {
  uses = "tedmiston/qcbrunch/docker/google-maps-email@master"
  secrets = ["SENDGRID_API_KEY"]
  needs = ["Google Maps Views"]
}

action "Yelp Closed Detector" {
  uses = "tedmiston/qcbrunch/docker/yelp-closed-detector@master"
  env = {
    EMAIL_SENDER = "no-reply@qcbrunch.com"
    EMAIL_RECIPIENT = "tedmiston@gmail.com"
  }
  secrets = ["SENDGRID_API_KEY"]
}

action "Yelp Followers Count" {
  uses = "swinton/httpie.action@8ab0a0e926d091e0444fcacd5eb679d2e2d4ab3d"
  args = "https://www.yelp.com/collection/Ntw8wQeFY35dpevGB-Et_A?sort_by=alpha | grep Followers | tr -dc '0-9' > yelp_followers_count.txt && cat yelp_followers_count.txt"
}

action "Yelp Email" {
  uses = "tedmiston/qcbrunch/docker/yelp-email@master"
  env = {
    EMAIL_SENDER = "no-reply@qcbrunch.com"
    EMAIL_RECIPIENT = "tedmiston@gmail.com"
  }
  secrets = ["SENDGRID_API_KEY"]
  needs = ["Yelp Followers Count"]
}
