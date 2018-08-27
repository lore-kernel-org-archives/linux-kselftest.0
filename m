From: shuah@kernel.org (Shuah Khan)
Date: Mon, 27 Aug 2018 14:14:06 -0600
Subject: [PATCH] selftests: kselftest: Remove outdated comment
In-Reply-To: <20180725025725.4214-1-bauerman@linux.ibm.com>
References: <20180725025725.4214-1-bauerman@linux.ibm.com>
Message-ID: <99fd20f8-b3fd-c5b7-ccb2-092888c8545f@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180827201406.axDa_jYWrrjeRCGsbjvPTGgFAbO6OwLL_Vp-SnwO3Yw@z>

On 07/24/2018 08:57 PM, Thiago Jung Bauermann wrote:
> Commit 3c07aaef6598 ("selftests: kselftest: change KSFT_SKIP=4 instead of
> KSFT_PASS") reverted commit 11867a77eb85 ("selftests: kselftest framework:
> change skip exit code to 0") but missed removing the comment which that
> commit added, so do that now.
> 
> Signed-off-by: Thiago Jung Bauermann <bauerman at linux.ibm.com>
> ---
>  tools/testing/selftests/kselftest.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/kselftest.h b/tools/testing/selftests/kselftest.h
> index 15e6b75fc3a5..a3edb2c8e43d 100644
> --- a/tools/testing/selftests/kselftest.h
> +++ b/tools/testing/selftests/kselftest.h
> @@ -19,7 +19,6 @@
>  #define KSFT_FAIL  1
>  #define KSFT_XFAIL 2
>  #define KSFT_XPASS 3
> -/* Treat skip as pass */
>  #define KSFT_SKIP  4
>  
>  /* counters */
> 
> 

Thanks for the patch. Sorry for the delay. It is now in linux-kselfttest
next for the next 4.19-rc

thanks,
-- Shuah
