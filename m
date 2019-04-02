From: rdunlap at infradead.org (Randy Dunlap)
Date: Tue, 2 Apr 2019 15:31:41 -0700
Subject: [PATCH v3.1] selftests: Clean up module testing shell script
In-Reply-To: <20190402222610.GA15100@beast>
References: <20190402222610.GA15100@beast>
Message-ID: <ce347ca9-7b94-f77c-bbcd-9e73861e7182@infradead.org>

Hi,

Minor corrections below:

On 4/2/19 3:26 PM, Kees Cook wrote:
> This adjusts kselftest_module.sh to take an option "args" argument for
> modprobe arguments, removes bash-isms (since some system's /bin/sh may
> not be bash), and refactors the lib/ scripts into a shorter calling
> convention.
> 
> Signed-off-by: Kees Cook <keescook at chromium.org>
> ---
> This is my suggested clean-up for the module testing script for the
> strscpy_pad() series...
> ---
>  tools/testing/selftests/kselftest_module.sh  | 24 ++++++++++++--------
>  tools/testing/selftests/lib/bitmap.sh        | 17 +-------------
>  tools/testing/selftests/lib/prime_numbers.sh | 17 ++------------
>  tools/testing/selftests/lib/printf.sh        | 16 +------------
>  tools/testing/selftests/lib/strscpy.sh       | 17 ++------------
>  5 files changed, 20 insertions(+), 71 deletions(-)
> 
> diff --git a/tools/testing/selftests/kselftest_module.sh b/tools/testing/selftests/kselftest_module.sh
> index b5d446738614..20a897d21fde 100755
> --- a/tools/testing/selftests/kselftest_module.sh
> +++ b/tools/testing/selftests/kselftest_module.sh
> @@ -2,19 +2,20 @@
>  # SPDX-License-Identifier: GPL-2.0+
>  
>  #
> -# Runs an individual test module.  kselftest expects a separate
> -# executable for each test.  So test should each have an individial
> +# Runs an individual test module. kselftest expects a separate
> +# executable for each test. So test should each have an individial

                                  tests (?)                individual

>  # script that can call this script.
>  #
>  
>  # Individual test scrits should define these:

                     scripts

>  module=""			# filename (without the .ko).
>  desc=""				# Output prefix.
> +args=""				# modprobe arguments
>  
>  modprobe="/sbin/modprobe"
>  
>  main() {
> -    parse_args $@
> +    parse_args "$@"
>      assert_root
>      assert_have_module
>      run_module
> @@ -23,17 +24,20 @@ main() {
>  parse_args() {
>      script=${0##*/}
>  
> -    if [[ ! $# -eq 2 ]]; then
> -	echo "Usage: $script <module_name> <description> [FAIL]"
> +    if [ $# -lt 2 ]; then
> +	echo "Usage: $script <description> <module_name> [FAIL]"
>  	exit 1
>      fi
>  
> -    module=$1
> -    desc=$2
> +    desc="$1"
> +    shift || true
> +    module="$1"
> +    shift || true
> +    args="$@"
>  }
>  
>  assert_root() {
> -    if [[ $EUID -ne 0 ]]; then
> +    if [ ! -w /dev ]; then
>  	skip "please run as root"
>      fi
>  }
> @@ -45,7 +49,7 @@ assert_have_module() {
>  }
>  
>  run_module() {
> -    if $modprobe -q $module; then
> +    if $modprobe -q $module $args; then
>  	$modprobe -q -r $module
>  	say "ok"
>      else
> @@ -72,4 +76,4 @@ skip() {
>  #
>  # Main script
>  #
> -main $@
> +main "$@"


ciao.
-- 
~Randy
