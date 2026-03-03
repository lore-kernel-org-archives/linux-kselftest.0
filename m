Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9E319CD0A
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Mar 2026 01:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772502329; cv=none; b=Zt0DknHSp4EUPfb0D22vZaGyQ9vGj7DiVAG3q3w1fDA0+aOw901yi4p0QbSZUKkClLtdcvD+nCsYBymGttzh3QTvLlQNYKH33HXyM91oKZwHO9d72pMvxaUSM/L2PnodRIJb51qSr9NCkKlc3nBsZe9Bv69LQfnsRBH3TRNOqow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772502329; c=relaxed/simple;
	bh=6gqYdMhM9B31nCogOBCyxHeugaSB0gydR+5zFw2F5v0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZRVlWxX+No4cOisSC+gtAoTVN9u1hw1Duo4lfpUK5rOzrr6We+Vu7jDTOjbZ5dDW0+kaIrN29mD6uDMieb1gA7Hc2N894frZuID3BfoQ9WjescQOt3F7wJrxhGhITZ5LLirzssAsFmexksKqEACowc7qWHguJuws7G/lS+ZZJ/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Z+qyzfx0; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Z+qyzfx0"
Message-ID: <6d7b89fc-994b-41c8-b545-630d4e2f884f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772502315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w7EbhjGk5ygqAWAHSwgdvk9K0e2jlW2xVYMwCYcwC2E=;
	b=Z+qyzfx0f2KC2pD215nfcWflWvEJpwA+zUd/mTGYRRLfPGd8BEyvfW1GN96CRoO3m+wX2B
	9CwAzRWC3qahIzeFPnCgFi9dNTqjpcYrDU2kvU7d3Io72EMsefygrVv/Rl83yyQoqpdP27
	CocWnSPye4FrbLgHOIITR7EzooiDsMQ=
Date: Tue, 3 Mar 2026 09:44:54 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v2 3/6] bpf: Disallow !kprobe_write_ctx progs
 tail-calling kprobe_write_ctx progs
Content-Language: en-US
To: bot+bpf-ci@kernel.org, bpf@vger.kernel.org
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org,
 yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, shuah@kernel.org,
 yangfeng@kylinos.cn, menglong8.dong@gmail.com, puranjay@kernel.org,
 bjorn@kernel.org, pulehui@huawei.com, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, netdev@vger.kernel.org,
 kernel-patches-bot@fb.com, martin.lau@kernel.org, clm@meta.com,
 ihor.solodrai@linux.dev
References: <20260302150342.55709-4-leon.hwang@linux.dev>
 <d1728faa022db83c9e5ab0245579eb1b1d176495744953f9ab66e0864ed31025@mail.kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Leon Hwang <leon.hwang@linux.dev>
In-Reply-To: <d1728faa022db83c9e5ab0245579eb1b1d176495744953f9ab66e0864ed31025@mail.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 2/3/26 23:53, bot+bpf-ci@kernel.org wrote:
>> diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
>> --- a/kernel/bpf/core.c
>> +++ b/kernel/bpf/core.c
> 
> [ ... ]
> 
>> +enum bpf_map_owner_match_type {
>> +	BPF_MAP_OWNER_MATCH_FOR_INIT,
>> +	BPF_MAP_OWNER_MATCH_FOR_UPDATE,
>> +};
>> +
>>  static bool bpf_map_owner_matches(const struct bpf_map *map, const struct bpf_prog *fp,
>> -				  enum bpf_prog_type prog_type)
>> +				  enum bpf_prog_type prog_type,
>> +				  enum bpf_map_owner_match_type match)
>>  {
> 
> [ ... ]
> 
>> +	switch (match) {
>> +	case BPF_MAP_OWNER_MATCH_FOR_INIT:
>> +		if (owner->kprobe_write_ctx != aux->kprobe_write_ctx)
>> +			return false;
>> +		break;
>> +
>> +	case BPF_MAP_OWNER_MATCH_FOR_UPDATE:
>> +		if (!owner->kprobe_write_ctx && aux->kprobe_write_ctx)
>> +			return false;
>> +		break;
>> +	}
> 
> In the v1 review, Alexei Starovoitov asked for strict conformance
> both ways rather than one-directional validation:
> 
>     "Don't be fancy. Require strict conformance both ways
>     in *all* patches."
> 
> https://lore.kernel.org/bpf/CAADnVQ+-V0-1i8_+CYpK7G0CnV-2n8e9Szv43yM3Az197eL_0A@mail.gmail.com/
> 
> The BPF_MAP_OWNER_MATCH_FOR_UPDATE case still uses one-directional
> matching, rejecting only !owner->kprobe_write_ctx && aux->kprobe_write_ctx
> but allowing the reverse. The v2 changelog lists other Alexei comments
> as addressed but does not mention this one.
> 
> Was this an intentional design choice, and if so, should the changelog
> note the disagreement?
> 

This was intentional design choice.

My explanation in v1 should address his concern.

As his disagreement was not part of the patch series, should I note it
in changelog?

Thanks,
Leon

> 
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md
> 
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/22582690876
> 
> AI-authorship-score: medium
> AI-authorship-explanation: Confirmed LLM involvement in v1 development process (selftests called out by reviewer), but core code changes and v2 revisions appear human-authored with genuine design engagement.
> issues-found: 1
> issue-severity-score: low
> issue-severity-explanation: Unaddressed maintainer review comment requesting symmetric matching in the UPDATE path; not a code bug or security concern.

