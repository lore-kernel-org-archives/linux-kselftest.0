From: mcgrof@kernel.org (Luis Chamberlain)
Date: Wed, 21 Nov 2018 14:27:30 -0800
Subject: [PATCH v2] sysctl: kselftests: fix test_modprobe issue
In-Reply-To: <1536229374-25699-1-git-send-email-Lei.Yang@windriver.com>
References: <1536229374-25699-1-git-send-email-Lei.Yang@windriver.com>
Message-ID: <20181121222730.GA4922@garbanzo.do-not-panic.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181121222730.GuoDrwCHRcGw_IlAQJj40Amr8MWSNjG2SOIZRsx6rQU@z>

On Thu, Sep 06, 2018@06:22:54PM +0800, Lei Yang wrote:
> when CONFIG_TEST_SYSCTL=y, there is no "/sys/module/test_sysctl/"
> when CONFIG_TEST_SYSCTL=m, checking /sys/module/test_sysctl/ is
> before kernel module loading
> 
> you'll get below error message
> root at intel-x86-64:/tmp/sysctl# ./sysctl.sh
> Checking production write strict setting ... ok
> ./sysctl.sh: /sys/module/test_sysctl/ not present
> You must have the following enabled in your kernel:
> 
> This patch will fix this issue.
> when CONFIG_TEST_SYSCTL=y, it has no chance to check "/sys/module/test_sysctl/"
> when CONFIG_TEST_SYSCTL=m, it will load kernel module first before checking sys
> interface.
> 
> Signed-off-by: Lei Yang <Lei.Yang at windriver.com>
> ---
>  tools/testing/selftests/sysctl/sysctl.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/sysctl/sysctl.sh b/tools/testing/selftests/sysctl/sysctl.sh
> index 584eb8e..08dc995 100755
> --- a/tools/testing/selftests/sysctl/sysctl.sh
> +++ b/tools/testing/selftests/sysctl/sysctl.sh
> @@ -120,6 +120,7 @@ test_reqs()
>  
>  function load_req_mod()
>  {
> +        trap "test_modprobe" EXIT
>  	if [ ! -d $DIR ]; then
>  		if ! modprobe -q -n $TEST_DRIVER; then
>  			echo "$0: module $TEST_DRIVER not found [SKIP]"
> @@ -770,7 +771,6 @@ function parse_args()
>  test_reqs
>  allow_user_defaults
>  check_production_sysctl_writes_strict
> -test_modprobe

Better yet, we can just depend on /proc/config stuff for test modules,
refer to check_mods() on tools/testing/selftests/firmware/fw_lib.sh.
Feel free to make helpers if you can come up with a generic directory,
otherwise just duplicate the effort for now.

  Luis
