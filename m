From: shuah@kernel.org (Shuah Khan)
Date: Wed, 17 Oct 2018 09:19:39 -0600
Subject: [PATCH] selftests/ftrace: Use colored output when available
In-Reply-To: <20181016143404.6847beb4@gandalf.local.home>
References: <20181016170220.31156-1-daniel.diaz@linaro.org>
 <037e072a-5695-1343-35d1-37b9450581d4@kernel.org>
 <20181016143404.6847beb4@gandalf.local.home>
Message-ID: <b5b4a38f-d81d-2702-67f7-4fc9cc262776@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181017151939.VFa7riQjZ1txEyUReDa8CRWL72i0A3s_m5fHnEqIcvg@z>

On 10/16/2018 12:34 PM, Steven Rostedt wrote:
> On Tue, 16 Oct 2018 11:43:29 -0600
> Shuah Khan <shuah@kernel.org> wrote:
> 
>> On 10/16/2018 11:02 AM, Daniel Díaz wrote:
>>> If test is being directly executed (with stdout opened on the
>>> terminal) and the terminal capabilities indicate enough
>>> colors, then use the existing scheme of green, red, and blue
>>> to show when tests pass, fail or end in a different way.
>>>
>>> When running the tests redirecting the stdout, for instance,
>>> to a file, then colors are not shown, thus producing a more
>>> readable output.
>>>
>>> Signed-off-by: Daniel Díaz <daniel.diaz at linaro.org>
>>> ---  
>>
>> Hi Daniel,
>>
>> Thanks for the patch. Steve is working on adding this functionality. Please
>> see the latest linux-kselftest next for the patch.
>>
>> Steve just sent an update to the patch to fix an issue. Please test and see
>> if that solves the problem you are trying address with this patch.
>>
> 
> Hi Shuah,
> 
> I think this patch actually addresses the issue of my last patch, and I
> haven't sent another one.
> 
> I'm waiting to hear from Masami if it fixes the issues he saw.
> 
> -- Steve
> 

Steve,

Do you want me to apply this patch from Daniel or do you plan to send
one. If you want to me take this one, just Ack it.

thanks,
-- Shuah
