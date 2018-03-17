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
  example.org
  www.example.org
)
```

Once setup, you may execute the script without any arguments:

```Bash
./check.sh
```

## Sample Output

```Bash
$ ./check.sh
samerziadeh.com
 ✔ http
 ✔ https

www.samerziadeh.com
 ✔ http
 ✔ https

samerziade.com
 ✔ http
 ✔ https

www.samerziade.com
 ✔ http
 ✔ https

samerziadeh.ca
 ✔ http
 ✔ https

www.samerziadeh.ca
 ✔ http
 ✔ https

samerziade.ca
 ✔ http
 ✔ https

www.samerziade.ca
 ✔ http
 ✔ https

samer.io
 ✔ http
 * Skipping https://samer.io/

www.samer.io
 ✔ http
 ✔ https

 www.example.com
 × NOT FOUND (http)
 × NOT FOUND (https)

example.org
 × NOT FOUND (http)
 × NOT FOUND (https)

www.example.org
 × NOT FOUND (http)
 × NOT FOUND (https)
```