From: shuah at kernel.org (Shuah Khan)
Date: Fri, 4 May 2018 13:45:59 -0600
Subject: [PATCH] selftests: fix spelling mistake: "desciptor" ->
 "descriptor"
In-Reply-To: <20180429115425.9378-1-colin.king@canonical.com>
References: <20180429115425.9378-1-colin.king@canonical.com>
Message-ID: <55d4fa6c-2870-afd4-2506-b7a3d721e711@kernel.org>

On 04/29/2018 05:54 AM, Colin King wrote:
> From: Colin Ian King <colin.king at canonical.com>
> 
> Trivial fix to spelling mistake in message text
> 
> Signed-off-by: Colin Ian King <colin.king at canonical.com>
> ---
>  tools/testing/selftests/filesystems/devpts_pts.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/filesystems/devpts_pts.c b/tools/testing/selftests/filesystems/devpts_pts.c
> index b9055e974289..ea5de8271521 100644
> --- a/tools/testing/selftests/filesystems/devpts_pts.c
> +++ b/tools/testing/selftests/filesystems/devpts_pts.c
> @@ -279,7 +279,7 @@ int main(int argc, char *argv[])
>  	int ret;
>  
>  	if (!isatty(STDIN_FILENO)) {
> -		fprintf(stderr, "Standard input file desciptor is not attached "
> +		fprintf(stderr, "Standard input file descriptor is not attached "
>  				"to a terminal. Skipping test\n");
>  		exit(EXIT_FAILURE);
>  	}
> 

Thanks. I will queue this up for 4.18-rc1

-- Shuah
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
