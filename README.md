# HTTP Redirects Tester

This is a very simple Bash script which will help you quickly check the redirects statuses of hosts you're setting up. It's useful for projects that require you to redirect lots of domains to a single one and you need to check that they're all redirecting properly.

The script itself is very simple, and all it does is reads out the `Location` HTTP header to ensure that it's redirecting to the expected location based on the `expect` variable you set.

## Usage

In the file, you'll have to set up the `expect`, `schemes`, and `domains` variables:

```Bash
expect="https://example.com/"

schemes=(
  http
  https
)

domains=(
  www.example.com
)
```

Once setup, you may execute the script without any arguments:

```Bash
./check.sh
```

## Sample Output

The sample below aren't based exactly on the variables set above, they're just there to demonstrate the different output states.

```Bash
$ ./check.sh
www.example.com
 ✔ http
 ✔ https

example.com
 ✔ http
 * Skipping https://example.com/

 www.example.net
 × NOT FOUND (http)
 × NOT FOUND (https)
```