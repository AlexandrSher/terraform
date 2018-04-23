provider "epam" {
  token = "${var.EPAM_TOKEN}"
  id = "${var.EPAM_ID}"
}

resource "epam_instance" "devops-server" {
  image = "${var.EPAM_IMAGE}"
  project = "${var.EPAM_PROJECT}"
  region = "${var.EPAM_REGION}"
  shape = "${var.EPAM_SHAPE}"
}
