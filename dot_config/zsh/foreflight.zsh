# Work-specific defaults
export AWS_PROFILE="uncrewed-dev.admin"
export SST_BUILD_CONCURRENCY_CONTAINER=4

alias refresh='npx sst refresh'
alias dev='npx sst dev'
alias aws-dev='export AWS_PROFILE="uncrewed-dev.admin"'
alias aws-prod='export AWS_PROFILE="Uncrewed-ANSP.admin"'
alias aws-whoami='aws sts get-caller-identity'
alias aws-login='aws sso login --profile $AWS_PROFILE'
