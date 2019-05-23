From: keescook at chromium.org (Kees Cook)
Date: Thu, 23 May 2019 15:50:02 -0700
Subject: [PATCH 2/2] selftests: rtc: rtctest: specify timeouts
In-Reply-To: <20190523224223.11054-3-alexandre.belloni@bootlin.com>
References: <20190523224223.11054-1-alexandre.belloni@bootlin.com>
 <20190523224223.11054-3-alexandre.belloni@bootlin.com>
Message-ID: <201905231549.C19B7A21@keescook>

On Fri, May 24, 2019 at 12:42:23AM +0200, Alexandre Belloni wrote:
> uie_read is a commonly failing test that will block forever on buggy rtc
> drivers. Shorten its timeout so it fails earlier. Also increase the timeout
> for the two alarm test on a minute boundary.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni at bootlin.com>

Reviewed-by: Kees Cook <keescook at chromium.org>

> ---
>  tools/testing/selftests/rtc/rtctest.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/testing/selftests/rtc/rtctest.c b/tools/testing/selftests/rtc/rtctest.c
> index b2065536d407..66af608fb4c6 100644
> --- a/tools/testing/selftests/rtc/rtctest.c
> +++ b/tools/testing/selftests/rtc/rtctest.c
> @@ -49,7 +49,7 @@ TEST_F(rtc, date_read) {
>  	       rtc_tm.tm_hour, rtc_tm.tm_min, rtc_tm.tm_sec);
>  }
>  
> -TEST_F(rtc, uie_read) {
> +TEST_F_TIMEOUT(rtc, uie_read, NUM_UIE + 2) {
>  	int i, rc, irq = 0;
>  	unsigned long data;
>  
> @@ -211,7 +211,7 @@ TEST_F(rtc, alarm_wkalm_set) {
>  	ASSERT_EQ(new, secs);
>  }
>  
> -TEST_F(rtc, alarm_alm_set_minute) {
> +TEST_F_TIMEOUT(rtc, alarm_alm_set_minute, 65) {
>  	struct timeval tv = { .tv_sec = 62 };
>  	unsigned long data;
>  	struct rtc_time tm;
> @@ -264,7 +264,7 @@ TEST_F(rtc, alarm_alm_set_minute) {
>  	ASSERT_EQ(new, secs);
>  }
>  
> -TEST_F(rtc, alarm_wkalm_set_minute) {
> +TEST_F_TIMEOUT(rtc, alarm_wkalm_set_minute, 65) {
>  	struct timeval tv = { .tv_sec = 62 };
>  	struct rtc_wkalrm alarm = { 0 };
>  	struct rtc_time tm;
> -- 
> 2.21.0
> 

-- 
Kees Cook
