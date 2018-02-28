From: daniel at iogearbox.net (Daniel Borkmann)
Date: Wed, 28 Feb 2018 22:31:17 +0100
Subject: [PATCH] selftests/bpf: Add bpf_probe_read_str to bpf_helpers.h
In-Reply-To: <f7ff30a7-888f-bb3c-b6b5-48c82d5b0c08@oracle.com>
References: <1519778024-3113-1-git-send-email-tushar.n.dave@oracle.com>
 <1d72361e-e8a7-38e0-16db-ade3f658ce92@iogearbox.net>
 <f7ff30a7-888f-bb3c-b6b5-48c82d5b0c08@oracle.com>
Message-ID: <916737aa-6b2b-b207-a1ed-4751c8deca3b@iogearbox.net>

On 02/28/2018 10:28 PM, Tushar Dave wrote:
> On 02/28/2018 08:57 AM, Daniel Borkmann wrote:
>> Hi Tushar,
>>
>> On 02/28/2018 01:33 AM, Tushar Dave wrote:
>>> Using bpf_probe_read_str() from samples/bpf causes compiler warning.
>>> e.g.
>>> warning: implicit declaration of function 'bpf_probe_read_str' is invalid in C99
>>>        [-Wimplicit-function-declaration]
>>>          num = bpf_probe_read_str(buf, sizeof(buf), ctx->di);
>>>                ^
>>> 1 warning generated.
>>>
>>> Add bpf_probe_read_str() to bpf_helpers.h so it can be used by
>>> samples/bpf programs.
>>>
>>> Signed-off-by: Tushar Dave <tushar.n.dave at oracle.com>
>>
>> In general no objections to it, but it would need an in-tree
>> user first:
>>
>> $ git grep -n bpf_probe_read_str tools/
>> tools/include/uapi/linux/bpf.h:596: * int bpf_probe_read_str(void *dst, int size, const void *unsafe_ptr)
>> $
>>
>> Why not adding this along with a sample?
> Okay, I will send new patch along with new sample or add usage of
> bpf_probe_read_str() in one of our exiting sample :)

Sounds great, the latter is totally fine as well. :-)

Thanks,
Daniel
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
