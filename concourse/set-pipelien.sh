#login
fly -t ci-demo login -c https://p-concourse.pcfdemo.com -n concourse_demo-dev-ci-service-fee7 --ca-cert=/Users/bliang/Downloads/root_ca_certificate

#set pipeline
fly set-pipeline -t ci-demo -c concourse/pipeline.yml --pipeline concourse-web -l /Users/bliang/cf_pws_credential.yml  --non-interactive
