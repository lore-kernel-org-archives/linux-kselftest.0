From: shuah@kernel.org (Shuah Khan)
Date: Wed, 5 Sep 2018 10:47:54 -0600
Subject: [PATCH] sysctl: kselftests: use kernel module instead of built-in
In-Reply-To: <1536114044-31236-1-git-send-email-Lei.Yang@windriver.com>
References: <1536114044-31236-1-git-send-email-Lei.Yang@windriver.com>
Message-ID: <8aeffc5f-ed8c-b418-5db3-ef0299456002@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180905164754.9_SIDRHvBrmfWboyQImyBj5osb076QoHl9xOlKpmups@z>

On 09/04/2018 08:20 PM, Lei Yang wrote:
> It uses modprobe $TEST_DRIVER in sysctl.sh, so update
> config to use "m" instead
> 
> Signed-off-by: Lei Yang <Lei.Yang at windriver.com>
> ---
>  tools/testing/selftests/sysctl/config | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/sysctl/config b/tools/testing/selftests/sysctl/config
> index 6ca1480..fc263ef 100644
> --- a/tools/testing/selftests/sysctl/config
> +++ b/tools/testing/selftests/sysctl/config
> @@ -1 +1 @@
> -CONFIG_TEST_SYSCTL=y
> +CONFIG_TEST_SYSCTL=m
> 

What happens if it is a built-in? Can you elaborate in the changelog

On that note we might have other cases that do modprobe in scripts and
run into the same issue you are trying to solve. :)

thanks,
-- Shuah
