From: shuah at kernel.org (shuah)
Date: Fri, 19 Apr 2019 13:10:43 -0600
Subject: [PATCH] selftests/ipc: Fix msgque compiler warnings
In-Reply-To: <20190408200141.uusxqlqly6tab6h7@linux-r8p5>
References: <20190408171344.GA22803@beast>
 <20190408200141.uusxqlqly6tab6h7@linux-r8p5>
Message-ID: <a53346cd-9eec-7ca6-3a09-a5558a5c9aa8@kernel.org>

On 4/8/19 2:01 PM, Davidlohr Bueso wrote:
> On Mon, 08 Apr 2019, Kees Cook wrote:
> 
>> This fixes the various compiler warnings when building the msgque
>> selftest. The primary change is using sys/msg.h instead of linux/msg.h
>> directly to gain the API declarations.
>>
>> Fixes: 3a665531a3b7 ("selftests: IPC message queue copy feature test")
>> Signed-off-by: Kees Cook <keescook at chromium.org>
> 
> (Not really related to this patch)
> 
> Given that the selftest/ipc/ only consists of this test, I wonder if
> the test should just be moved to ltp, where the ipc tests are a lot
> more complete and robust -- and which I've been using for years for
> basic testing code changes.
> 

Having this test in here helps us find regressions quickly. It does good
and no harm keeping this test in here.

I don't think it is a good idea to remove it all together.

thanks,
-- Shuah
