From: shuah at kernel.org (shuah)
Date: Thu, 23 May 2019 16:57:14 -0600
Subject: [PATCH 0/2] kselftest: fix rtctest timeout
In-Reply-To: <20190523224223.11054-1-alexandre.belloni@bootlin.com>
References: <20190523224223.11054-1-alexandre.belloni@bootlin.com>
Message-ID: <9c94c2b7-153d-ef75-c474-9bae49d6a039@kernel.org>

On 5/23/19 4:42 PM, Alexandre Belloni wrote:
> Hi,
> 
> Commit a745f7af3cbd ("selftests/harness: Add 30 second timeout per
> test") wrongly assumed that no individual test would run for more than
> 30 seconds and this silently broke rtctest.
> 
> Please consider the following patches as fixes for v5.2 to avoid having
> any non working release.
> 
> Thanks,
> 
> Alexandre Belloni (2):
>    selftests/harness: Allow test to configure timeout
>    selftests: rtc: rtctest: specify timeouts
> 
>   tools/testing/selftests/kselftest_harness.h | 17 ++++++++++++-----
>   tools/testing/selftests/rtc/rtctest.c       |  6 +++---
>   2 files changed, 15 insertions(+), 8 deletions(-)
> 

Thanks for fixing them quickly.

I will pull these in. I have one more fix from Kees already queued
up.

Jeffrin! Would you like to test these to see if they work for you
and send Tested-by tag.

I don't see 1/2 in my Inbox. I have Kees's reply to it. Odd.

thanks,
-- Shuah
