# selenium-side-runner-docker
Docker image for selenium-side-runner and sample docker-compose.yml

In order to make it work with the sample docker-compose.yml:
* copy Selenium .side files into the `./sides` directory
* run `docker-compose up`
* retrieve the results from the `./out` directory

The following environment variables can be used to change the behavior of the
image:
* ALWAYS_EXIT_WITH_ZERO: if set the execution of selenium-side-runner will
  always return with a zero exit code, even if tests are failed (useful with CI
  tools like Jenkins)
* DELAY_BEFORE_START: if set, specifies the delay (in seconds) before the test
  starts. Default is 5 seconds.
* DELAY_BEFORE_STOP: if set, specifies the delay (in seconds) to wait after the
  test is over. Useful when used with docker compose's --abort-on-container-exit
  so to allow other containers to finishing write to disk, flush buffers, etc.
  By default is not set, no there's no wait after tests are completed.
* OUTPUT_FORMAT: determines the output format of the result file, by default is
  jest (json) but also junit (xml) can be specified
* SERVER: if set, specifies the target selenium server to be used.
  Default is http://chromedriver:4444
* WORKERS: if set, specifies the number of workers to be used for parallel test
  execution.
  By default is not set, so the selenium-side-runner default is used.

If a `.side.yml` file is put together with the .side files (i.e. in the
`./sides` directory) it will be used as a configuration file for then runner.

