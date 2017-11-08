From: shuahkh@osg.samsung.com (Shuah Khan)
Date: Wed, 8 Nov 2017 08:26:16 -0700
Subject: [Linux-kselftest-mirror] [PATCH] selftests: kselftest.h: fix
	compilation errors
In-Reply-To: <20171108052410.14616-1-Lei.Yang@windriver.com>
References: <20171108052410.14616-1-Lei.Yang@windriver.com>
Message-ID: <0ac0008c-df35-6df3-03c9-5698815d18b2@osg.samsung.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20171108152616.kpsbL3eQG9XhrESkfjDmtuDeWANq56g4-Co8BAvEDNU@z>

On 11/07/2017 10:24 PM, Lei Yang wrote:
> In next branch, Various build failed with:
> 
> In file included from membarrier_test.c:8:0:
> ../kselftest.h: In function ‘ksft_print_header’:
> ../kselftest.h:61:3: error: expected ‘)’ before ‘printf’
>    printf("TAP version 13\n");
>    ^
> ../kselftest.h:62:1: error: expected expression before ‘}’ token
>  }
>  ^
> 
> Signed-off-by: Lei Yang <Lei.Yang at windriver.com>
> ---
>  tools/testing/selftests/kselftest.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/kselftest.h b/tools/testing/selftests/kselftest.h
> index d6732ba312ef..acc98a5c3d73 100644
> --- a/tools/testing/selftests/kselftest.h
> +++ b/tools/testing/selftests/kselftest.h
> @@ -57,7 +57,7 @@ static inline int ksft_get_error_cnt(void) { return ksft_cnt.ksft_error; }
>  
>  static inline void ksft_print_header(void)
>  {
> -	if (!(getenv("KSFT_TAP_LEVEL"))
> +	if (!(getenv("KSFT_TAP_LEVEL")))
>  		printf("TAP version 13\n");
>  }
>  
> 

Thanks for the patch. It was a mistake that the original patch
ended up in the linux-kselftest next branch. My bad. I ended up
committing the patch my mistake. It is now removed.

thanks,
-- Shuah
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
