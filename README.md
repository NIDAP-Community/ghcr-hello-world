# GHCR Hello World

Tiny Docker image for validating connectivity from Galaxy Cloud (or any runner) to GitHub Container Registry (GHCR).

## Usage

```bash
# pull by moving tag
docker pull ghcr.io/<org-or-user>/<repo-name>:latest

# or pull the immutable digest shown on the GHCR package page
# docker pull ghcr.io/<org-or-user>/<repo-name>@sha256:<digest>

docker run --rm ghcr.io/<org-or-user>/<repo-name>:latest
```

Expected output:

```
Hello from GHCR!
Container connectivity test successful.
Platform: x86_64
OS: Ubuntu 20.04.x LTS
```

## Galaxy Tool Wrapper

A Galaxy tool definition is included at `tool/test_hello.xml`. To register it:

1. Copy the XML file into your Galaxy tools directory (for example `tools/ghcr-hello/test_hello.xml`).
2. Add the tool to your tool panel configuration (`config/tool_conf.xml` or equivalent):

```xml
<section id="ghcr_testing" name="GHCR Connectivity">
  <tool file="ghcr-hello/test_hello.xml" />
</section>
```

3. Restart Galaxy. The tool produces a single text dataset containing the hello message, proving the worker successfully pulled and ran the container image.

## Publishing Workflow

A GitHub Actions workflow in `.github/workflows/docker-publish.yml` builds `linux/amd64` and pushes to GHCR on every push to the default branch or when the workflow is manually dispatched. Update `IMAGE_NAME` in the workflow to match your repository before enabling it.

After the first push to GHCR, visit the package page and set its visibility to **Public** so Galaxy Cloud can pull it without credentials.
