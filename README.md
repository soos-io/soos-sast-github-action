# [SOOS SAST](https://soos.io/products/sast)

SOOS is an independent software security company, located in Winooski, VT USA, building security software for your team. [SOOS, Software security, simplified](https://soos.io).

Use SOOS to scan your software for [vulnerabilities](https://app.soos.io/research/vulnerabilities) and [open source license](https://app.soos.io/research/licenses) issues with [SOOS Core SCA](https://soos.io/products/sca). [Generate SBOMs](https://kb.soos.io/help/soos-reports-for-export). Govern your open source dependencies. Run the [SOOS DAST vulnerability scanner](https://soos.io/products/dast) against your web apps or APIs.

[Demo SOOS](https://app.soos.io/demo) or [Register for a Free Trial](https://app.soos.io/register).

If you maintain an Open Source project, sign up for the Free as in Beer [SOOS Community Edition](https://soos.io/products/community-edition).
## How to use it:

You can use the Action as follows:

- Update the `.github/workflows/main.yml` file to include a step like this
``` yaml
on: [push]

jobs:
  soos_sast_analysis_example:
    name: SOOS SAST Analysis Example
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@master
      - name: Run SOOS SAST Analysis
        uses: soos-io/soos-sast-github-action@v1.0.0
        with:
          client_id: ${{ secrets.SOOS_CLIENT_ID }}
          api_key: ${{ secrets.SOOS_API_KEY }}
          project_name: "My Project Name"
          source_code_path: "The path to start searching for SAST files."

```

## Parameters

| Property               | Default                      | Description                                                                                                                  |
|------------------------|------------------------------|------------------------------------------------------------------------------------------------------------------------------|
| api_key                | [none]                       | The Api Key provided to you when subscribing to SOOS services.                                                               |
| api_url                | "https://api.soos.io/api/"   | The API BASE URI provided to you when subscribing to SOOS services.                                                          |
| branch_name            | [none]                       | Branch Name to create scan under.                                                                                            |
| branch_uri             | [none]                       | URI to branch from SCM system.                                                                                               |
| build_uri              | [none]                       | URI to CI build info.                                                                                                        |
| build_version          | [none]                       | Version of application build artifacts.                                                                                      |
| client_id              | [none]                       | The Client Id provided to you when subscribing to SOOS services.                                                             |
| directories_to_exclude  | Listing of directories or patterns to exclude from the search for SAST files. eg: **bin/start/**, **/start/** |  |
| files_to_exclude        | LListing of files or patterns patterns to exclude from the search for SAST files. eg: **/sa**.sarif.json/, **/sast.sarif.json |  |
| log_level              | 'INFO'                       | Log level to show: PASS, IGNORE, INFO, WARN, FAIL, DEBUG, ERROR.                                                                       |
| on_failure              | Set the On Failure Scan Strategy: fail_the_build, and continue_on_failure | continue_on_failure |
| operating_environment  | ${{ runner.os }}             | System info regarding operating system, etc.                                                                                 |
| project_name           | ${{ github.repository }}     | The project name that will be displayed on the dashboard. By Default is owner/repository_name.                               |
| source_code_path           | GITHUB_WORKSPACE         | The path to start searching for SAST files.|
| verbose                | [none]                       | Enable verbose logging.                                                                                                      |