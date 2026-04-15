Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCE323182D
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Apr 2026 14:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776263605; cv=none; b=WUpRvLWya310ri4xrGMK0nIjnQm8lrMuIJiORFyLAVU0ik7Zv3R6DcY+IHwA5vFMJsw2PjqoM2prDAXJgFXdR3CGd1Yp2KouRGVo+svBdVn+nPhpJ3KJXyj1WoSMxHmTBMbhz0lNsEP98QeSeQhPMQs6oG/t+kXzBBUhN6R24Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776263605; c=relaxed/simple;
	bh=ncYLpANUEqjiK+lrWZ+15aJWUEhTp3NC51cBqmau3wc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PwLeFOA4XCUSv4OSgYD9yWpuxEz51vbx0fOvT9tIjVH50FIysySsb8hizUaYkqGdlWTqDXjFLmKQlcX+jrBgB9zWC2FALdhJzbBkhMkdymjgRh8jXxEfcF2iogdZXv773ymnCl4Bd8ZC4gy8/Zmbv83y61aj6rXyUSPWSeXIaqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bkUOcPpZ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bkUOcPpZ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488ba6366a7so83910055e9.0
        for <linux-kselftest@vger.kernel.org>; Wed, 15 Apr 2026 07:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776263603; x=1776868403; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KYdaXOUNBM5BakQBjjVuu9J4b98oS6k7ObySiqMkXg8=;
        b=bkUOcPpZJRTq908zunf9NMiuVMjbRRbdcPeSPqh4p+iDOo1NXpfqtYZbiZFh2r7eMw
         sIPNN/evRsbLkZMLG95IYzhj7/m7P1jG6e7N2LN1Bs+prH65oKWmpNzJ32B26MNbAHiY
         3XNfp8Fxw7OuWqHPr/3o5y49NDC0tQFHm9sPmXghAobwNaeMGV8w5HDcfbxKazh/pV6b
         u9KeZ1u8UqWSzqGVWt85sGT0+zwuz9mR8txUN7Q5JBDE91EKe7kiccI4s5jWgikVEGvj
         CtXYwuvhTNxppqCxQNsOqfNXYj35NmJzvcH733DC9XyngWr0TjQTVxObjyeRf6gPbJhf
         RE0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776263603; x=1776868403;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KYdaXOUNBM5BakQBjjVuu9J4b98oS6k7ObySiqMkXg8=;
        b=p37hskrx/QtbXIey+NOmyjJgSE6xmNE5qFpolW1JnkgMWi8ujuU3597Lubk9HS92Jg
         PJHRMpjqizdZo2yR7CGlB1Lgrg+uFwCQuBWjQ4BFVjTLoD6VsXbDdmn1OGpmGvI1Ekdi
         lJjG6EGAAGoMffxDZAcXRZFfCnA6Ifnx7zCpOETf3OiHyh4OLcgXQgp+WsB3KeBY17Zj
         rGffr3b3fMOyYGeNSoc9+od2Ih0hKYTKokYWYt9d5bYWw5zzsyAby1IXCez75SyxGo3+
         2vXN6iBmIDgA1mipc0s6/a8geBsIDNXFkxXrblUsy4lbH2uuual9kKJaL7paR/BRuK9N
         YFIg==
X-Forwarded-Encrypted: i=1; AFNElJ8ZyqEMKUz4biOU4u3SPRdp8WgKBUeEj8u7lVFcthC/IVuxIlj06bd6h7Y6IwSaEmeBj7FCQmGBHbVlzzXwvTA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh5gsN/EAsdpe6pLOG6cC3Uo0UskXQIdV0bgDfqJ7RoyFqiUtH
	FTT4mWMu5LProER+cDgd798O6JMyCwUgG4uNiKAO/G8mVgXnfnsHaQLA
X-Gm-Gg: AeBDiesbARkkeHd+hutNfyrWS3Iuhj126oqXoYM59oGn/CJvbcw8iioFGFYgcOC9OMF
	QY2Vzv3JpuYFdP6jDOZUIliYg2t2Md7c7dJuqD2PEsfyLVdfiKcx+P/FHxj86NsF6I7e6b9zaHf
	sgsQEWI5sXlltVW7e79GXFJ23zzjZiFe0wY6sD3kVa3UW133b1itXB2JJUEyqAHP0FARPUfBJQI
	JWwP0v6mbc4/4HUv5b2Mg3oSMI5vSVklX93F5xQfmqoVIMnplPGI3AmJdzCDPVZUYY3fBGDMB93
	hVwUEtC7O/St1PDoKp5jZavm38sl4Uv1G2X0yptsFoQBWwHSAUC/z5u/6XuLoexJN0qjjYMjcmX
	NxwecJ4ka8c2iSA2IK14ZzJwIEiGAyMc4Eol9PcIoIKbdUI94Qcar2ao06/7e6li1fPQJLLX5fN
	oztGF0yX6f21Lr3CEIR9xKnnQ+TaRPJs20rRgZEy8yhm8ZUPWptr+wJ0t/+9op
X-Received: by 2002:a05:600c:c08e:b0:488:9619:9bf4 with SMTP id 5b1f17b1804b1-488d686093bmr210608955e9.20.1776263602600;
        Wed, 15 Apr 2026 07:33:22 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1126:4:cbe8:6434:118f:886d? ([2620:10d:c092:500::5:3ecd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488ee042f3dsm118049065e9.12.2026.04.15.07.33.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 07:33:21 -0700 (PDT)
Message-ID: <3afdf4fa-7e4e-4e56-8aaa-c8a04085432d@gmail.com>
Date: Wed, 15 Apr 2026 15:33:20 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next] selftests/bpf: Fix timer_start_deadlock failure
 due to hrtimer change
To: Shung-Hsi Yu <shung-hsi.yu@suse.com>, bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
 Jiri Olsa <jolsa@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260415120329.129192-1-shung-hsi.yu@suse.com>
Content-Language: en-US
From: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>
In-Reply-To: <20260415120329.129192-1-shung-hsi.yu@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/15/26 1:03 PM, Shung-Hsi Yu wrote:
> Since commit f2e388a019e4 ("hrtimer: Reduce trace noise in hrtimer_start()"),
> hrtimer_cancel tracepoint is no longer called when a hrtimer is re-armed. So
> instead of a hrtimer_cancel followed by hrtimer_start tracepoint events, there
> is now only a since hrtimer_start tracepoint event with the new was_armed field
> set to 1, to indicated that the hrtimer was previously armed.
> 
> Update timer_start_deadlock accordingly so it traces hrtimer_start tracepoint
> instead, with was_armed used as guard.
> 
> Signed-off-by: Shung-Hsi Yu <shung-hsi.yu@suse.com>
> ---
> Currently only fails on Linus' tree since hrtimer changes haven't made
> its way into bpf-next yet.
> ---

This patch fixes the failing test.

Tested-by: Mykyta Yatsenko <yatsenko@meta.com>

The logic is also looks correct, tracepoint used to run on timer_cancel, 
which was called due to the second timer_start, now it's running on 
timer_start with was_armed=true, so the logic is kept the same.

Acked-by: Mykyta Yatsenko <yatsenko@meta.com>

>   tools/testing/selftests/bpf/progs/timer_start_deadlock.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/testing/selftests/bpf/progs/timer_start_deadlock.c b/tools/testing/selftests/bpf/progs/timer_start_deadlock.c
> index 019518ee18cd..afabd15bdac4 100644
> --- a/tools/testing/selftests/bpf/progs/timer_start_deadlock.c
> +++ b/tools/testing/selftests/bpf/progs/timer_start_deadlock.c
> @@ -27,13 +27,13 @@ static int timer_cb(void *map, int *key, struct elem *value)
>   	return 0;
>   }
>   
> -SEC("tp_btf/hrtimer_cancel")
> -int BPF_PROG(tp_hrtimer_cancel, struct hrtimer *hrtimer)
> +SEC("tp_btf/hrtimer_start")
> +int BPF_PROG(tp_hrtimer_start, struct hrtimer *hrtimer, enum hrtimer_mode mode, bool was_armed)
>   {
>   	struct bpf_timer *timer;
>   	int key = 0;
>   
> -	if (!in_timer_start)
> +	if (!in_timer_start || !was_armed)
>   		return 0;
>   
>   	tp_called = 1;
> @@ -60,7 +60,7 @@ int start_timer(void *ctx)
>   
>   	/*
>   	 * call hrtimer_start() twice, so that 2nd call does
> -	 * remove_hrtimer() and trace_hrtimer_cancel() tracepoint.
> +	 * trace_hrtimer_start(was_armed=1) tracepoint.
>   	 */
>   	in_timer_start = 1;
>   	bpf_timer_start(timer, 1000000000, 0);

