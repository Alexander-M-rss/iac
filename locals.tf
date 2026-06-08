locals {
  common_tags = {
    Terraform = "true"
    Project   = var.project_id
  }

  blue_user_data = <<-EOF
    #!/bin/bash
    mkdir -p /var/www/html
    echo "<h1>Blue Environment</h1>" > /var/www/html/index.html
    cd /var/www/html
    nohup python3 -m http.server 80 &
  EOF

  green_user_data = <<-EOF
    #!/bin/bash
    mkdir -p /var/www/html
    echo "<h1>Green Environment</h1>" > /var/www/html/index.html
    cd /var/www/html
    nohup python3 -m http.server 80 &
  EOF
}
