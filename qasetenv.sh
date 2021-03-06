DIR=$(pwd)
cat << EOF > "$DIR/backend.tf"
terraform {
  backend "gcs" {
    bucket  = "`gsutil ls  | grep "backend-" | awk -F "/" '{print $3}'`"
    prefix  = "application_deployment/qa"
    credentials = "service-account.json"
  }
}
EOF
cat "$DIR/backend.tf"