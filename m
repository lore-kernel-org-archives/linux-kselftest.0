From: mlichvar at redhat.com (Miroslav Lichvar)
Date: Mon, 9 Jul 2018 11:26:21 +0200
Subject: [RFC][PATCH v2] selftest: timers: Tweak raw_skew to SKIP when
 ADJ_OFFSET/other clock adjustments are in progress
In-Reply-To: <1530813031-19243-1-git-send-email-john.stultz@linaro.org>
References: <1530813031-19243-1-git-send-email-john.stultz@linaro.org>
Message-ID: <20180709092621.GC1285@localhost>

On Thu, Jul 05, 2018 at 10:50:31AM -0700, John Stultz wrote:
> In the past we've warned when ADJ_OFFSET was in progress, usually
> caused by ntpd or some other time adjusting daemon running in non
> steady sate, which can cause the skew calculations to be incorrect
> 
> Thus, this patch sets a flag which we check if the clock was being
> adjusted when we fail so that we don't cause false negatives.

The commit message might need an update as the code no longer sets a
flag. Other than that, it looks good to me.

Thanks,

> --- a/tools/testing/selftests/timers/raw_skew.c
> +++ b/tools/testing/selftests/timers/raw_skew.c
> @@ -134,6 +134,11 @@ int main(int argv, char **argc)
>  	printf(" %lld.%i(act)", ppm/1000, abs((int)(ppm%1000)));
>  
>  	if (llabs(eppm - ppm) > 1000) {
> +		if (tx1.offset || tx2.offset ||
> +		    tx1.freq != tx2.freq || tx1.tick != tx2.tick) {
> +			printf("	[SKIP]\n");
> +			return ksft_exit_skip("The clock was adjusted externally. Shutdown NTPd or other time sync daemons\n");
> +		}
>  		printf("	[FAILED]\n");
>  		return ksft_exit_fail();
>  	}
> -- 
> 2.7.4
> 

-- 
Miroslav Lichvar
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
