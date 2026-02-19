Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250F97478
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Feb 2026 05:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771478263; cv=none; b=NNF3zAvVdVTHwMXfEM88N8iYsbbubaquw4QsGk+TrXpSUn4CO3Yqn4NUEzLU4iq5i17kk+gs7UjNyroegMCi0yQWzy5Zph24sPcolIlJYHQ5pOicmW0kX+8CeeG450S8O42Iqr2hzSXbt56baZfmszlI3jL2uTKZyPG/sX66bG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771478263; c=relaxed/simple;
	bh=9CfxS2RINrNA4HMKz1BbNhYqFgsoWu8o+Zo4mfiRAlw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=txKN+o4eIHRcx7p9lBIr3Y3Zy1zF5/95WwLHLpNvwYhCJcAuvBztlIfnMk24NKrY2TeyLz0+ikcWDifhoQCzmHGGAzXqancwrllf27RqIaDt5TOiTPMxmT0vOwL/Aq7fzCrxFFfQoIxdMH+hSq3WpNv9DQ/NrV7Pa/wLTr1P0Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=s1EnyG1r; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="s1EnyG1r"
Message-ID: <52bb474f-4b02-496b-ad27-31b0dfe0af5f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771478250;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5ce/qB83v8+271POftr+tV8f8fTpJav0alD44aA0UYo=;
	b=s1EnyG1r6Jf8BUk8JRdDLYDBEzkBmthGjNOJTOoqf4RnCrFod0aWmAMN4ANWH1cyV/KECy
	bik8bhh4Z1OnLkIjXBRWbFl2jtO86BqyYsNvY9jy673pQsB4nSjtJ21owWJ1KVMjwp7ykQ
	JSn7eR/FxOmFBsQbG/sTQV07lqSWJMk=
Date: Wed, 18 Feb 2026 21:17:20 -0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v2 0/2] bpf: Add multi-level pointer parameter
Content-Language: en-GB
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Slava Imameev <slava.imameev@crowdstrike.com>
Cc: Eduard <eddyz87@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>, bpf <bpf@vger.kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Hao Luo <haoluo@google.com>, Simon Horman <horms@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Jiri Olsa <jolsa@kernel.org>,
 KP Singh <kpsingh@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 DL Linux Open Source Team <linux-open-source@crowdstrike.com>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 Network Development <netdev@vger.kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Stanislav Fomichev <sdf@fomichev.me>,
 Shuah Khan <shuah@kernel.org>, Song Liu <song@kernel.org>
References: <bb4bf5fe648ac71c969c6228ac6e72ea85cbc64b.camel@gmail.com>
 <20260218104328.14341-1-slava.imameev@crowdstrike.com>
 <CAADnVQ+xwC+J1hZcHPEUjBoKcUKmnucG4AFQ-kkDmqx+C-GcoA@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <CAADnVQ+xwC+J1hZcHPEUjBoKcUKmnucG4AFQ-kkDmqx+C-GcoA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT



On 2/18/26 7:15 PM, Alexei Starovoitov wrote:
> On Wed, Feb 18, 2026 at 2:44 AM Slava Imameev
> <slava.imameev@crowdstrike.com> wrote:
>>
>> - This programs cannot be compiled as bpf_core_cast cannot cast to a
>> multi-level pointer:
>>
>> SEC("lsm/sb_eat_lsm_opts")
>> int BPF_PROG(sb_eat_lsm_opts_1,char *options, void **mnt_opts)
>> {
>>      void** ppt = bpf_core_cast(mnt_opts, void*);
>>      bpf_printk("%p\t", *ppt);
>>      return 0;
>> }
> Looks like there is a bug in llvm, since it crashes on the above.
> But the following works:
>
> void** ppt = bpf_rdonly_cast(mnt_opts, 0);
> bpf_printk("%lx\t", *ppt);
>
> Plus Eduard's diff:
> -       if (is_void_or_int_ptr(btf, t))
> +       if (is_void_or_int_ptr(btf, t) || !btf_type_is_struct_ptr(btf, t))
>
>
>> - There is a workaround, which requires introducing a wrapper for
>> a pointer or typedef:
>>
>> struct pvoid {
>>      void* v;
>> };
> llvm should have handled it without the workaround. It's a bug
> that should be fixed.

Okay, I will take a look.

>
>> I think there are no technical restrictions for treating single
>> level pointers as PTR_TO_MEM.
> I think it will be a missed opportunity and a potential foot gun.
>
> We didn't support access to 'char *' initially.
> Later relaxed it to mean that it's a valid pointer to a single byte,
> but since the code is generic it also became the case
> that 'char *' is allowed in kfunc and the verifier checks
> that one valid byte is there.
> That was a bad footgun, since we saw several cases of broken
> kfunc implementations that assume that 'char *' means a string.
>
> There are only two lsm hooks that pass 'struct foo **'.
> If we make it ptr_to_mem of 8 bytes we lose the ability to do
> something smarter in the future.
> I think we better add support to annotate such '**' as an actual
> array with given size and track types completely, so
> 'struct foo * var[N]' will become array_to_ptr_to_btf_id.
> That's probably more work that you signed up to do,
> so I suggest treating 'void **' as a scalar as Eduard suggested.
> This particular sb_eat_lsm_opts() hook
> doesn't have a useful type behind it anyway.
> I'm less certain about 'char **'. If we make it scalar too
> it will be harder to make it a pointer to nul terminated string later.
>
> So I would do 'void **' -> scalar for now only.

