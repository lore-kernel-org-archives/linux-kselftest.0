From: shuah at kernel.org (shuah)
Date: Wed, 23 Jan 2019 08:07:53 -0700
Subject: [PATCH][V2] selftests: cpu-hotplug: fix case where CPUs offline >
 CPUs present
In-Reply-To: <abb5a36f-e513-e3ba-3286-4cc2026ef580@canonical.com>
References: <20190110123802.13832-1-colin.king@canonical.com>
 <abb5a36f-e513-e3ba-3286-4cc2026ef580@canonical.com>
Message-ID: <c18c3293-631d-2deb-794d-b7057ea2c50d@kernel.org>

On 1/23/19 6:25 AM, Colin Ian King wrote:
> ping?
> 
> On 10/01/2019 12:38, Colin King wrote:
>> From: Colin Ian King <colin.king at canonical.com>
>>
>> The cpu-hotplug test assumes that we can offline the maximum CPU as
>> described by /sys/devices/system/cpu/offline.  However, in the case
>> where the number of CPUs exceeds like kernel configuration then
>> the offline count can be greater than the present count and we end
>> up trying to test the offlining of a CPU that is not available to
>> offline.  Fix this by testing the maximum present CPU instead.
>>
>> Also, the test currently offlines the CPU and does not online it,
>> so fix this by onlining the CPU after the test.
>>
>> Fixes: d89dffa976bc ("fault-injection: add selftests for cpu and memory hotplug")
>> Signed-off-by: Colin Ian King <colin.king at canonical.com>
>>
>> ---
>>
>> V2: remove some debug and an empty line

Sorry for the delay. I will take this for 5.0-rc5

thanks,
-- Shuah
