From: shuah.kh@samsung.com (Shuah Khan)
Date: Thu, 27 Sep 2018 12:10:38 -0600
Subject: [PATCH] rseq/selftests: fix parametrized test with -fpie
In-Reply-To: <44897232.11546.1538071328396.JavaMail.zimbra@efficios.com>
References: <20180918135328.32034-1-mathieu.desnoyers@efficios.com>
 <1367962117.10271.1537897176578.JavaMail.zimbra@efficios.com>
 <CGME20180927132250epcas4p3d0775cc258f6112d27bdad359fc6e416@epcas4p3.samsung.com>
 <20180927092235.77282e35@vmware.local.home>
 <a7bae2ff-1f4d-dbfc-43f8-e7a89f319abb@samsung.com>
 <44897232.11546.1538071328396.JavaMail.zimbra@efficios.com>
Message-ID: <2bfea3f5-b251-d4b8-d03a-28b575aefae0@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180927181038.CC3WBscbn1x_s3ZP0qq1t5mDq-IXlkXZwoBlUDzS5wY@z>

On 09/27/2018 12:02 PM, Mathieu Desnoyers wrote:
> ----- On Sep 27, 2018,@9:58 AM, Shuah Khan shuah.kh@samsung.com wrote:
> 
>> On 09/27/2018 07:22 AM, Steven Rostedt wrote:
>>> On Tue, 25 Sep 2018 13:39:36 -0400 (EDT)
>>> Mathieu Desnoyers <mathieu.desnoyers@efficios.com> wrote:
>>>
>>>> ----- On Sep 18, 2018, at 9:53 AM, Mathieu Desnoyers
>>>> mathieu.desnoyers@efficios.com wrote:
>>>>
>>>>> On x86-64, the parametrized selftest code for rseq crashes with a
>>>>> segmentation fault when compiled with -fpie. This happens when the
>>>>> param_test binary is loaded at an address beyond 32-bit on x86-64.
>>>>>
>>>>> The issue is caused by use of a 32-bit register to hold the address
>>>>> of the loop counter variable.
>>>>>
>>>>> Fix this by using a 64-bit register to calculate the address of the
>>>>> loop counter variables as an offset from rip.
>>>>
>>>> Should this fix go through tip or the selftests tree ?
>>>>
>>>
>>> I usually have changes like this pulled through Shuah's tree with an
>>> ack from the maintainer of the code that it tests.
>>>
>>> -- Steve
>>>
>>
>> Right that is what I prefer. I usually wait for an Ack. I can pull this
>> in.
> 
> I am maintainer of the code that it tests as well, so being both author
> of the selftest patch and giving an ack to it seems a bit silly. :) Other
> rseq co-maintainers could weight in though: Peter, Paul, and Boqun.
> 

I was commenting in general, not specific to this patch. No worries. I will
apply this right away.

I have been traveling the last couple of weeks and in the catch up mode still.

thanks,
-- Shuah


>>
>> --
>> Shuah Khan
>> Sr. Linux Kernel Developer
>> Open Source Innovation Group
>> Samsung Research America(Silicon Valley)
>> shuah.kh at samsung.com
> 


-- 
Shuah Khan
Sr. Linux Kernel Developer
Open Source Innovation Group
Samsung Research America(Silicon Valley)
shuah.kh at samsung.com
