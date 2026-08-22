Received: from mta1.migadu.com (out-26.mta1.migadu.com [95.215.58.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A392F39C2
	for <linux-kselftest@vger.kernel.org>; Sat, 22 Aug 2026 18:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787423272; cv=none; b=Yqrwu6cOJdIJdH1t08Wh+/mxr+QYwBEXo5b/bBUS9EZ0iaPxxwS7zFKWbn+eoSoz2UoSAGQjXU+Xv0Zr85qxrQcyY/26SzoZV76ynUePrDM9NrDVWpsdgSIly7OE1yJzK8qU6HdQeY9BGopBnC84GZUd9zcMu13ZfR3+414NY6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787423272; c=relaxed/simple;
	bh=thd4YQftP12yCx6TE0t6pWFFKHfj668R34Wjtwuo9W0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GVETyZ2K+5N/ti2QWnjtUrwTGZJhYMFJZuschkRHXsFyx7M0wBcHcaI2O90/SqaSaeMU1IRdkyXYS6H2BlVq6AMa0FuSnmj/XEMKuO9odZUsdmKTrPgoIObzLlpJliTzDHWK86V3pHPdVJpJmoBhdJNvzE3FveMKNHzu0skUcwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=DCHPaScs; arc=none smtp.client-ip=95.215.58.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="DCHPaScs"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=thd4YQftP12yCx6TE0t6pWFFKHfj668R34Wjtwuo9W0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787423266; v=1; x=1788028066;
 b=DCHPaScs6DOQx+V2m8mbUSr9dlJIviUKbOXc3ai1IpniOgZRy0W1ao4w9Ut/j3HytNEOQqOm
 KY7pPJrIRuEMYpPY5QdD30N3cw9iglpoOxP1RDxe927tedSDzo1zuf2WjY7OADhJ26znJdebj2v
 TNXUeWmo3x6wgn/qSefvM33c=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: from [IPV6:2600:381:d619:d1ec:8d3:1358:3a33:c2e4] (2600:381:d619:d1ec:8d3:1358:3a33:c2e4)
	by smtp.migadu.com with ESMTPS id 7035a39f906b7eac;
	Sat, 22 Aug 2026 18:27:46 +0000
X-Mizu-Trace-ID: 7035a39f906b7eac
X-Migadu-Flow: FLOW_OUT
Message-ID: <e2a7e092-df3c-4f92-8f12-5eb371f004df@linux.dev>
Date: Sat, 22 Aug 2026 11:27:38 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] bpf: reject stack-argument callback subprograms
Content-Language: en-GB
To: Eduard Zingerman <eddyz87@gmail.com>,
 =?UTF-8?B?SsOpcsOpbXkgSmVhbg==?= <Jeremy.Jean@oss.cyber.gouv.fr>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260817204812.1637171-1-Jeremy.Jean@oss.cyber.gouv.fr>
 <20260817204812.1637171-2-Jeremy.Jean@oss.cyber.gouv.fr>
 <5d02cbe3-fd71-44e4-a6dd-706233ba248e@linux.dev>
 <9f50810d45db0b60248f106d21b4a278f3ec2156.camel@gmail.com>
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <9f50810d45db0b60248f106d21b4a278f3ec2156.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 8/20/26 3:32 PM, Eduard Zingerman wrote:
> On Tue, 2026-08-18 at 08:23 -0700, Yonghong Song wrote:
>> On 8/17/26 1:48 PM, Jérémy Jean wrote:
>>> Helper callbacks enter BPF subprograms through bpf_callback_t, whose
>>> runtime ABI supplies five arguments. BTF validation nevertheless permits
>>> static callback subprograms to declare more than five arguments when JIT
>>> stack arguments are supported.
>>>
>>> This lets verifier state for a callback use outgoing stack argument slots
>>> prepared at the helper call site. The helper does not pass those slots. On
>>> x86-64, callback loads of arguments seven and later therefore read the
>>> helper native frame instead of the synthetic values checked by the
>>> verifier. KASAN reports a slab OOB write.
>>>
>>> Reject callback subprograms with incoming stack arguments when processing
>>> callback calls.
>>>
>>> Fixes: 0f6bd5e7a804 ("bpf: Support stack arguments for bpf functions")
>>> Assisted-by: Codex:gpt-5
>>> Signed-off-by: Jérémy Jean <Jeremy.Jean@oss.cyber.gouv.fr>
>>> ---
>>>    kernel/bpf/verifier.c | 2 ++
>>>    1 file changed, 2 insertions(+)
>>>
>>> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
>>> index fdc5fbb1f78c..5fcefc0eaba0 100644
>>> --- a/kernel/bpf/verifier.c
>>> +++ b/kernel/bpf/verifier.c
>>> @@ -9285,6 +9285,8 @@ static int push_callback_call(struct bpf_verifier_env *env, struct bpf_insn *ins
>>>    	err = btf_check_subprog_call(env, subprog, caller->regs);
>>>    	if (err == -EFAULT)
>>>    		return err;
>>> +	if (bpf_in_stack_arg_cnt(&env->subprog_info[subprog]))
>>> +		return -EINVAL;
>> This is not good as user will not know why it failed. Your v1 does have an error message.
>>
>> But this is not needed. Without above verifer.c change, user will get an error message:
>>      func#0 writes 4 stack arg slots, but calls only require 0
>>
>> NACK, see my v1 comment: https://lore.kernel.org/bpf/14a7e7c2-36f7-4aa2-9b20-cc54700a9f1b@linux.dev/
>>
>>>    
>>>    	/* set_callee_state is used for direct subprog calls, but we are
>>>    	 * interested in validating only BPF helpers that can call subprogs as
> Yonghong,
>
> this is a real bug. Here is an example of a program that exposes
> unsafe behavior:
>
>      unsigned long arr[10];
>      
>      __noinline __used
>      static int callback_9args(__u32 index, void *ctx, long a3, long a4,
>                                long a5, long a6, long a7, long a8, long a9)
>      {
>              return arr[a9] % 2;    // verifier sees a9 as 0 and allows this memory access
>      }
>
>      SEC("tc")
>      __description("stack_arg: callback with incoming stack args")
>      __failure
>      __naked void stack_arg_callback_many_args(void)
>      {
>              asm volatile (
>                      "r6 = 0;"
>                      "*(u64 *)(r11 - 32) = 0;"
>                      "*(u64 *)(r11 - 24) = 0;"
>                      "*(u64 *)(r11 - 16) = 0;"
>                      "*(u64 *)(r11 - 8) = 0;"
>                      "r1 = 1;"
>                      "r2 = %[callback_9args];"
>                      "r3 = 0;"
>                      "r4 = 0;"
>                      "call %[bpf_loop];"
>                      "r1 = 1;"
>                      "r2 = 2;"
>                      "r3 = 3;"
>                      "r4 = 4;"
>                      "r5 = 5;"
>                      "*(u64 *)(r11 - 32) = 0;"
>                      "*(u64 *)(r11 - 24) = 0;"
>                      "*(u64 *)(r11 - 16) = 0;"
>                      "*(u64 *)(r11 - 8) = 0;"
>                      "call callback_9args;"   // this hides the callback call from the check in bpf_fixup_call_args()
>                      "r0 = 0;"
>                      "exit;"
>                      :
>                      : __imm_ptr(callback_9args),
>                        __imm(bpf_loop)
>                      : __clobber_common, "r6"
>              );
>      }
>
> Jérémy,
>
> Please update the test case as above, as your test case does not
> really expose the bug. Also, I think that a better fix would be to
> make stack arguments not-init in the callback frame. This way the
> verifier would produce a proper error message.

Okay, I see. The key thing is the below:
    "call callback_9args;"   // this hides the callback call from the check in bpf_fixup_call_args()

So callback_9args appears twice, and bpf_fixup_call_args() only checks the second callback_9args(), right?


