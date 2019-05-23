From: shuah@kernel.org (shuah)
Date: Thu, 23 May 2019 17:32:35 -0600
Subject: [PATCH 0/2] kselftest: fix rtctest timeout
In-Reply-To: <9c94c2b7-153d-ef75-c474-9bae49d6a039@kernel.org>
References: <20190523224223.11054-1-alexandre.belloni@bootlin.com>
 <9c94c2b7-153d-ef75-c474-9bae49d6a039@kernel.org>
Message-ID: <3846d273-7b8e-8bb8-a3d4-04fd382d8324@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190523233235.nQwrgNLxL4B7qvR478Pkolz4P3Ed3rQ7HZyObq_vFqk@z>

On 5/23/19 4:57 PM, shuah wrote:
> On 5/23/19 4:42 PM, Alexandre Belloni wrote:
>> Hi,
>>
>> Commit a745f7af3cbd ("selftests/harness: Add 30 second timeout per
>> test") wrongly assumed that no individual test would run for more than
>> 30 seconds and this silently broke rtctest.
>>
>> Please consider the following patches as fixes for v5.2 to avoid having
>> any non working release.
>>
>> Thanks,
>>
>> Alexandre Belloni (2):
>>    selftests/harness: Allow test to configure timeout
>>    selftests: rtc: rtctest: specify timeouts
>>
>>   tools/testing/selftests/kselftest_harness.h | 17 ++++++++++++-----
>>   tools/testing/selftests/rtc/rtctest.c       |  6 +++---
>>   2 files changed, 15 insertions(+), 8 deletions(-)
>>
> 
> Thanks for fixing them quickly.
> 
> I will pull these in. I have one more fix from Kees already queued
> up.
> 
> Jeffrin! Would you like to test these to see if they work for you
> and send Tested-by tag.
> 
> I don't see 1/2 in my Inbox. I have Kees's reply to it. Odd.
> 

It showed up late. I have 1/2 in my Inbox now. Must have taken a scenic
route. :)

thanks,
-- Shuah
