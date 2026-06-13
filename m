Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57142E65D
	for <linux-kselftest@vger.kernel.org>; Sat, 13 Jun 2026 00:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781309438; cv=none; b=fiR2SZE6if1K7wxdaozegyOpGv+sz1v5b1nwTCw4ETX/E23YWFk3MIUd9e62N1y7sZbhwsgZzKEl48IOZRXdf/MeE/z3kfCDd9fvQf1e9udg39jt9irQacBU93npxUyvniZx1OQ7MK31/aTPWK3oKBEt8ywjxTe+6CKU0g6hjV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781309438; c=relaxed/simple;
	bh=bNMsgYGyF4Tc6YjEZ9ElAv1ahEqg8OKorBlOU3Fmhfs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Nj4su/B4IwNX4RjAfy7GdIOO3sUbDDV++8M6fcQsRf41zDFb9u7eSANvCiqv8sJ9fdv5OGdSlPXOq9BHp37qvpCxruvSSO9JYoJ9TE0sBHlH77pmGfWAeEOF2cXBYpSOulyoCWBmNzq8NOMG0P7OfSZQWgPweh9yGscxdzie1TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=neJDuHKN; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="neJDuHKN"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2bfdd99f6b7so25054555ad.0
        for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 17:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781309436; x=1781914236; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kyks4UFOUwCvj/2wr5bJ0bF+lU7UlWavCSZG1GuENqE=;
        b=neJDuHKNODfH4YLs8X5yESc74jXRcypOMa4MlCO0H3J0GADKfHQVrWxGqXrRx+nsKt
         2mjhbayTupb/EYmvEQzgVD8HzGEnUIfK4w4IlelsqUm5uuagIbpi5R8Cx54MIv1Zjqi+
         gh1LooHxi+sd7smSQSZbOWA8JzA/auc5k/eTucyFKO2XQv+lOVWOdCjaDe6Aw9Z9tZwr
         EpElC3P3VWDdzJAeEhFln5+++w/dYNwKFYoQ97Dgxx23elc30PKD8i9+r6w+OHRIPAv6
         1kLkksUi+LfqYt7mLfVLNF6R/APHhw+rcZAxsGyG2NR77XbzgScbytsXJNVglAah5dqs
         ADew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781309436; x=1781914236;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kyks4UFOUwCvj/2wr5bJ0bF+lU7UlWavCSZG1GuENqE=;
        b=QHrCr4TCR9QEj4h42DRuRaqyD8rGDcRSWtAO8cuzdrF2dSiF4FialBOMuj6crfMa7R
         sKps0HNMViUKYk7GGB9M+wSLJybknA7+4QVPsrsCd8kfpiZk+71Jfe7r0b5RI4JY82IK
         4rypu69tRyBcznDZdAqBtaUGj9hIWETPVXmrMqFGp2gvrcZrx+mVk1MeFq1jDMy4MXHh
         DmtXESeENn/uIkLB2ewd5YWdd/ifpHg8LILqG6YIPfzweoZTfrHEoJqKZEimoqdIQPph
         APNBgFkByKDUBqZzOvQLPcGfeIjD+gLoLM4qSTKmpBewBD0p79Z3xPpY53lEQIY6qr51
         UzBQ==
X-Forwarded-Encrypted: i=1; AFNElJ+KLsaGKzvw+jgaHOOzKUirf7vXaeyXxf7m6woel1DJSr1guF4iCFbWr6Bfn5dybFcdAz7nrOPKAwiUnCAFgAI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnpbPe4GwsIT702LVTN+w3lsjWzHM9+vPN9oOQJdxp652kAo8m
	oa1WfXow9KrejlDcNEtdx5CnT6MAM2FoBMxUmkhrZvP+4N/2Sa2MpBzrNnGt4alGWbflX1VAxYi
	nDt6Wgg==
X-Received: from plpn16.prod.google.com ([2002:a17:902:9690:b0:2bc:bb0f:91a1])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:4587:b0:2bf:2e93:c624
 with SMTP id d9443c01a7336-2c41284101amr59144935ad.27.1781309435945; Fri, 12
 Jun 2026 17:10:35 -0700 (PDT)
Date: Sat, 13 Jun 2026 00:09:38 +0000
In-Reply-To: <20260612130919.299124-2-jiayuan.chen@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260612130919.299124-2-jiayuan.chen@linux.dev>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260613001033.1323846-1-kuniyu@google.com>
Subject: Re: [PATCH bpf-next v3 1/7] bpf, sockmap: reject overflowing copy +
 len in bpf_msg_push_data()
From: Kuniyuki Iwashima <kuniyu@google.com>
To: jiayuan.chen@linux.dev
Cc: andrii@kernel.org, ast@kernel.org, bestswngs@gmail.com, 
	bpf@vger.kernel.org, cong.wang@bytedance.com, daniel@iogearbox.net, 
	davem@davemloft.net, eddyz87@gmail.com, edumazet@google.com, 
	emil@etsalapatis.com, hawk@kernel.org, horms@kernel.org, 
	ihor.solodrai@linux.dev, jakub@cloudflare.com, john.fastabend@gmail.com, 
	jolsa@kernel.org, kuba@kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, martin.lau@linux.dev, memxor@gmail.com, 
	mmmxny@gmail.com, netdev@vger.kernel.org, pabeni@redhat.com, 
	rhkrqnwk98@gmail.com, sdf@fomichev.me, shuah@kernel.org, song@kernel.org, 
	xmei5@asu.edu, yonghong.song@linux.dev, Kuniyuki Iwashima <kuniyu@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Jiayuan Chen <jiayuan.chen@linux.dev>
Date: Fri, 12 Jun 2026 21:07:45 +0800
> From: Weiming Shi <bestswngs@gmail.com>
> 
> When the scatterlist ring is full or nearly full, bpf_msg_push_data()
> enters a copy fallback path and computes copy + len for the page
> allocation size. Since len comes from BPF with arg3_type = ARG_ANYTHING
> and both are u32, a crafted len can wrap the sum to a small value,
> causing an undersized allocation followed by an out-of-bounds memcpy.
> 
>  BUG: unable to handle page fault for address: ffffed104089a402
>  Oops: Oops: 0000 [#1] SMP KASAN NOPTI
>  Call Trace:
>   __asan_memcpy (mm/kasan/shadow.c:105)
>   bpf_msg_push_data (net/core/filter.c:2852 net/core/filter.c:2788)
>   bpf_prog_9ed8b5711920a7d7+0x2e/0x36
>   sk_psock_msg_verdict (net/core/skmsg.c:934)
>   tcp_bpf_sendmsg (net/ipv4/tcp_bpf.c:421 net/ipv4/tcp_bpf.c:584)
>   __sys_sendto (net/socket.c:2206)
>   do_syscall_64 (arch/x86/entry/syscall_64.c:94)
>   entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130)
> 
> Add an overflow check before the allocation.
> 
> Link: https://lore.kernel.org/all/20260424155913.A19FDC19425@smtp.kernel.org
> Fixes: 6fff607e2f14 ("bpf: sk_msg program helper bpf_msg_push_data")
> Tested-by: Xiang Mei <xmei5@asu.edu>
> Tested-by: Xinyu Ma <mmmxny@gmail.com>
> Reviewed-by: Jiayuan Chen <jiayuan.chen@linux.dev>
> Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>
> Signed-off-by: Weiming Shi <bestswngs@gmail.com>
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
> ---
> To sashiko:
> 
> Regarding bpf_msg_push_data() reading "copy = msg->sg.data[i].length" with
> i == msg->sg.end (appending at the very end of a full/near-full ring):
> 
> This is pre-existing code, not touched by this series, and reproducing it needs
> a narrow combination -- a pure append at the end so the loop exits with
> i == msg->sg.end, a full/near-full ring, plus a prior push/pop history that
> leaves a stale length in the otherwise-unused end slot. A freshly built ring
> zeroes that slot, so copy stays 0. We don't consider it practically reproducible.
> 
> Even then it's already covered: the overflow check in patch 1 ("copy + len <
> copy") rejects the dangerous case, and __GFP_ZERO in patch 3 prevents any data
> exposure. Not worth fixing here.
> ---
>  net/core/filter.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/net/core/filter.c b/net/core/filter.c
> index 9590877b0714f..3c8f1cedb217f 100644
> --- a/net/core/filter.c
> +++ b/net/core/filter.c
> @@ -2829,6 +2829,9 @@ BPF_CALL_4(bpf_msg_push_data, struct sk_msg *, msg, u32, start,
>  	if (!space || (space == 1 && start != offset))
>  		copy = msg->sg.data[i].length;
>  
> +	if (unlikely(copy + len < copy))
> +		return -EINVAL;

Who wants to push E2BIG "metadata or option" ? :(
https://docs.ebpf.io/linux/helper-function/bpf_msg_push_data/

I feel this is the same class of "bug" we discussed recently,
but given the change is just small validation,

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
