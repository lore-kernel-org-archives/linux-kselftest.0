From: daniel at iogearbox.net (Daniel Borkmann)
Date: Thu, 22 Feb 2018 01:44:02 +0100
Subject: [PATCH] selftests/bpf: update gitignore with test_libbpf_open
In-Reply-To: <06743ec3-071d-6465-acad-9966ce72fc57@osg.samsung.com>
References: <20180221213001.18682-1-anders.roxell@linaro.org>
 <20180221.174830.160781272671654190.davem@davemloft.net>
 <89896e14-e4ad-bb3d-2d9f-44cfa084a8cd@kernel.org>
 <54b323b8-6ada-a1d4-c347-9dec15923a92@iogearbox.net>
 <06743ec3-071d-6465-acad-9966ce72fc57@osg.samsung.com>
Message-ID: <de1b371c-52c7-3efd-f1fe-789b6cfa0085@iogearbox.net>

On 02/22/2018 01:37 AM, Shuah Khan wrote:
> On 02/21/2018 05:33 PM, Daniel Borkmann wrote:
>> Hi Shuah,
>>
>> On 02/22/2018 12:03 AM, Shuah Khan wrote:
>>> On 02/21/2018 03:48 PM, David Miller wrote:
>>>> From: Anders Roxell <anders.roxell at linaro.org>
>>>> Date: Wed, 21 Feb 2018 22:30:01 +0100
>>>>
>>>>> bpf builds a test program for loading BPF ELF files. Add the executable
>>>>> to the .gitignore list.
>>>>>
>>>>> Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
>>>>
>>>> Acked-by: David S. Miller <davem at davemloft.net>
>>>
>>> Thanks. I will pull this in for 4.16-rc
>>
>> I would have taken this into bpf tree, but fair enough. This one
>> in particular doesn't cause any conflicts right now, so feel free
>> to pick it up then. But usual paths are via bpf / bpf-next as we
>> otherwise would run into real ugly merge conflicts.
> 
> Daniel,
> 
> Go for it. I know bpf tree stuff causes conflicts. That is why I usually
> stay away from bpfs selftests and let you handle them.
> 
> You are taking the other one away, pick this up as well.

Okay, great, thanks for your understanding, Shuah. Just applied
to bpf tree.

> Acked-by: Shuah Khan <shuahkh at osg.samsung.com>
> 
> thanks,
> -- Shuah
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
