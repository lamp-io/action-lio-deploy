# [lamp.io](https://www.lamp.io) deploy

This action will deploy your app to [lamp.io](https://www.lamp.io) platform

## Usage

An example workflow for deploying laravel app to [lamp.io](https://www.lamp.io)

```yaml
on: [push]
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v1
      - name: Lio deploy
    #   TODO change repo/action names
        uses: lamp-io/action-lio-deploy@master
        with:
          auth_token: ${{ secrets.lamp_io_token }}
# Uncomment this line if want to use sqlite as persistent storage      
#          sqlite: true
```

### Secrets

- `lamp_io_token` – **required** The [lamp.io](https://www.lamp.io) access token, should be used as `auth_token` argument

### Arguments

- `auth_token` - **required** ***string*** The [lamp.io](https://www.lamp.io) access token
- `app_type` - **optional** ***string*** Set your application engine. Default value is `laravel`
- `sqlite` - **optional** ***bool*** Set sqlite as persistent storage fro your app

## License

The Dockerfile and associated scripts and documentation in this project are released under the [MIT License](LICENSE)
