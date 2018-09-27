From: shuah.kh@samsung.com (Shuah Khan)
Date: Thu, 27 Sep 2018 07:58:32 -0600
Subject: [PATCH] rseq/selftests: fix parametrized test with -fpie
In-Reply-To: <20180927092235.77282e35@vmware.local.home>
References: <20180918135328.32034-1-mathieu.desnoyers@efficios.com>
 <1367962117.10271.1537897176578.JavaMail.zimbra@efficios.com>
 <CGME20180927132250epcas4p3d0775cc258f6112d27bdad359fc6e416@epcas4p3.samsung.com>
 <20180927092235.77282e35@vmware.local.home>
Message-ID: <a7bae2ff-1f4d-dbfc-43f8-e7a89f319abb@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180927135832.tQPyVKBab_0iPW-Sof4b2NT3Qxf6lMHA9KBqzn7iPlY@z>

On 09/27/2018 07:22 AM, Steven Rostedt wrote:
> On Tue, 25 Sep 2018 13:39:36 -0400 (EDT)
> Mathieu Desnoyers <mathieu.desnoyers@efficios.com> wrote:
> 
>> ----- On Sep 18, 2018,@9:53 AM, Mathieu Desnoyers mathieu.desnoyers@efficios.com wrote:
>>
>>> On x86-64, the parametrized selftest code for rseq crashes with a
>>> segmentation fault when compiled with -fpie. This happens when the
>>> param_test binary is loaded at an address beyond 32-bit on x86-64.
>>>
>>> The issue is caused by use of a 32-bit register to hold the address
>>> of the loop counter variable.
>>>
>>> Fix this by using a 64-bit register to calculate the address of the
>>> loop counter variables as an offset from rip.  
>>
>> Should this fix go through tip or the selftests tree ?
>>
> 
> I usually have changes like this pulled through Shuah's tree with an
> ack from the maintainer of the code that it tests.
> 
> -- Steve
> 

Right that is what I prefer. I usually wait for an Ack. I can pull this
in.

thanks,
-- Shuah

-- 
Shuah Khan
Sr. Linux Kernel Developer
Open Source Innovation Group
Samsung Research America(Silicon Valley)
shuah.kh at samsung.com
