From: mlichvar@redhat.com (Miroslav Lichvar)
Date: Wed, 4 Jul 2018 09:49:18 +0200
Subject: [RFC][PATCH] selftest: timers: Tweak raw_skew to SKIP when
 ADJ_OFFSET is in progress
In-Reply-To: <1530646587-12101-1-git-send-email-john.stultz@linaro.org>
References: <1530646587-12101-1-git-send-email-john.stultz@linaro.org>
Message-ID: <20180704074918.GE22600@localhost>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180704074918.3JsmgJ28tOU_kppYX2oc2HZ5mdbNRarAL8WDhgdTBOQ@z>

On Tue, Jul 03, 2018@12:36:27PM -0700, John Stultz wrote:
> In the past we've warned when ADJ_OFFSET was in progress, usually
> caused by ntpd or some other time adjusting daemon running in non
> steady sate, which can cause the skew calculations to be incorrect

Good idea.

> Thus, this patch sets a flag which we check when we fail so that
> we don't cause false negatives.

I'd suggest to check few more things to better detect when something
is adjusting the clock. The offset should be zero also at the end of
the test and the frequency and tick should be the same as at the
beginning of the test. This will detect daemons that set the frequency
of the clock directly, not using adjtime() or the PLL.

Something like this:

@@ -137,9 +135,10 @@ int main(int argv, char **argc)
        printf(" %lld.%i(act)", ppm/1000, abs((int)(ppm%1000)));
 
        if (llabs(eppm - ppm) > 1000) {
-               if (adj_offset_bad) {
+               if (tx1.offset || tx2.offset ||
+                   tx1.freq != tx2.freq || tx1.tick != tx2.tick) {
                        printf("        [SKIP]\n");
-                       return ksft_exit_skip("ADJ_OFFSET in progress. Shutdown NTPd or other time steering daemons\n");
+                       return ksft_exit_skip("The clock was adjusted. Shutdown ntpd or other time steering daemons\n");
                }
                printf("        [FAILED]\n");
                return ksft_exit_fail();


-- 
Miroslav Lichvar
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
