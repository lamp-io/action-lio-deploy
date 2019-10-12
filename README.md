# [lamp.io](https://www.lamp.io) deploy

This action will deploy your laravel app to [lamp.io](https://www.lamp.io) platform

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
        uses: lamp-io/action-lio-deploy@master
        with:
          auth_token: ${{ secrets.lamp_io_token }}
          app_id: $({secrets.lamp_io_app_id})
```

### Secrets

- `lamp_io_token` – **required** The [lamp.io](https://www.lamp.io) access token, should be used as `auth_token` argument

### Arguments

- `auth_token` - **required**  The [lamp.io](https://www.lamp.io) access token
- `app_id` - **required**  Your [lamp.io](https://www.lamp.io) App Id

## License

The Dockerfile and associated scripts and documentation in this project are released under the [MIT License](LICENSE)
