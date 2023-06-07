# Docker image for Raspberry Pico SDK

This image provides a dockerized environment for building C/C++ PICO SDK based applications.
It is target to be used in GitHub Actions.

## Requisites

Personal access token (classic). See [documentation](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token).

## How to update

Based on [GitHub documentation](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry)

```bash
docker build -t ghcr.io/user/pico-sdk:1.5.0 -t ghcr.io/user/pico-sdk:latest docker # (1)
export CR_PAT=YOUR_TOKEN; echo $CR_PAT | docker login ghcr.io -u USERNAME --password-stdin # (2)
docker push -a ghcr.io/user/pico-sdk:latest # (3)
```

1. Build the image
2. Login
3. Push the image
4. [Allow actions to pull the container](https://docs.github.com/en/packages/learn-github-packages/configuring-a-packages-access-control-and-visibility)

After performing these steps the personal token can be deleted.
