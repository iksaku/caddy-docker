# caddy-docker
Custom caddy image with support for docker proxies and cloudflare dns

## Usage

1. Pull the image: `docker pull ghcr.io/iksaku/caddy-docker`
2. [Create a Cloudflare API Token](https://dash.cloudflare.com/profile/api-tokens) with permissions to edit your zone's DNS. You can use the `Edit zone DNS` template shown in Cloudflare setup flow and specify the zone you want to use.
3. Copy your Clouflare API Token and pass it to your caddy container under via Environment Variables. You can name it however you like, for example `CF_API_TOKEN`.
4. Tell caddy to default acme challenges to be executed using the `cloudflare` provider. To do so, add the following tag to your caddy docker container (replace `CF_API_TOKEN` with the name of your environment variable):

| name           | value                         |
| -------------- | ----------------------------- |
| caddy.acme_dns | cloudflare {env.CF_API_TOKEN} |

## Proxying domains through docker

Please read the documentation at [lucaslorentz/caddy-docker-proxy](https://github.com/lucaslorentz/caddy-docker-proxy) for information.

## Credits
* To [Lucas Lorentz](https://github.com/lucaslorentz) for his incredible work on the docker proxy plugin for caddy. Without it, this wouldn't be as easy!
* To all the contributors of the [cloudflare provider for caddy](https://github.com/caddy-dns/cloudflare) for making it easy to connect Cloudflare's API to caddy.