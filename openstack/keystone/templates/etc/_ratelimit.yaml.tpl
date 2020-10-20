# Override default ratelimit response.
ratelimit_response:
  status: 498 Rate Limited
  status_code: 498
  body: "Rate Limit Exceeded"

# Override default blacklist response.
blacklist_response:
  status: 497 Blacklisted
  status_code: 497
  body: "Your account has been blacklisted"

# Group multiple CADF actions to one rate limit action.
groups:
  write:
    - update
    - delete

rates:
  # global rate limits counted across all projects
  global:
    auth/tokens:
      - action: write/read/list
        limit: 60000r/m
    versions:
      - action: write/read/list
        limit: 50000r/m
    users:
      - action: write/read/list
        limit: 30000r/m
    s3token:
      - action: write/read/list
        limit: 20000r/m
    projects:
      - action: write/read/list
        limit: 30000r/m
    healthcheck:
      - action: write/read/list
        limit: 10000r/m

  # default local rate limits applied to each project
  default:
    auth/tokens:
      - action: write/read/list
        limit: 6000r/m
    versions:
      - action: write/read/list
        limit: 5000r/m
    users:
      - action: write/read/list
        limit: 3000r/m
    s3token:
      - action: write/read/list
        limit: 2000r/m
    projects:
      - action: write/read/list
        limit: 3000r/m
    healthcheck:
      - action: write/read/list
        limit: 1000r/m