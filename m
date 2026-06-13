Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A2D1F5834
	for <linux-kselftest@vger.kernel.org>; Sat, 13 Jun 2026 00:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781310549; cv=none; b=QrCkXzgPUB05UnB/tvAu930y3y3+Us2klmCL8YvZ+7xxKVkcum6kEtqDXoEcY/BrTxyJYVtaAa/n2GOlr4K3cBSr2+bJnzVSnYa+LajZGDPuuiPPBcGc9DnY8093oXPT8OGzHmS0Ej53uvb+1W4xD8F6QDY+3I2U8P/u64QAims=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781310549; c=relaxed/simple;
	bh=QgXc4ODljJhWTTpaw445TVamF/nyBWaAo/I/wBG/rxw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YP/jBQ5WnaI7loB4BCVNW7WYEorAx1EOyOdkltQRHFgVusmisQc1lvbN3cB5c4h8kliJ7gS77j5zy6jSadJkZK7sRqdi+IKgOlJnH1zcx2m6FD+0n7k6OZgroDCw9hluIOlUg5DedcNymUW1xdj10nYUPvyBeeugXQNg/5SmrHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GgfahnZQ; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GgfahnZQ"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2c354050c34so14001545ad.3
        for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 17:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781310548; x=1781915348; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OUh6D4rBcGOJpXdbW9cjRObx5ZfnYBi6zdUUzwINyao=;
        b=GgfahnZQrDLbK9ff4h7onSM3J8k8edLC0IeZsMQ3zTs5hIgSLN33JCo0G5hnVRPAxI
         yI6hhCsAOFWhLQWph7JAtLchoGGadyXAigHE6ktPTnaaqz8MVKNp/aG6tf1y+k8IcXrr
         aVdCYn4H4xGMV+EZd2tvnjosIPW1I5pmMSaf9agrPjKTjKP/dnP6SnDDLq2Z1sKGQ8hQ
         WyZQNb9VXzm77534zFmH77B/P82tH0F6YK+qkI4wRqKBaVD9kojNaaQ5egLJNuPJ75er
         d3YTaM+NZWQ31AfMvFWD7pIXbxOyxGno0gtrHkdDRBdNn+GLUl4WBy4lGk2jmcBsQwaa
         Y8nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781310548; x=1781915348;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OUh6D4rBcGOJpXdbW9cjRObx5ZfnYBi6zdUUzwINyao=;
        b=PAvn+99LpRiS6dOS+vTK3kbh/HnVvVX36LCBeRALgPLxcYjSvgsWh/l+Qh8aRa0jUH
         DbTv0IALnr81t4ajC+aIMC+wey0/jkN4eiALcUhOOUubfiT19B+8XyB0FNPSzDCn+W+d
         /xk8MRF8vS6BY3KIo5eX7dTJvsFkm8fz3d+s6aQ6GuXudQqxcLxqm2N8RR8FyQNNVYfv
         W//c/Z/Jj3un+Sl61eJUwoacu2BJ3WR81FLptnWwldau40zTEQKoCI4xcIIGM10S6Do1
         xoNTym9/Z+gswXDzkPjYibhC0Ku9xglgudW+Nvmvl8RQqC5M6pqTR2Tn+MYzi/ntKbJo
         0GYw==
X-Forwarded-Encrypted: i=1; AFNElJ/uKZqdsYj7jL5cq4guVxTUWaBaJvC71fMp/lNw+vg46r427KSCIwuY6S/zRpaVIpjgMj9gNExM1VrvJRUarcc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTvLP0ZhbMr8ahN+FP3qN/Yhu1c+Shyp5KX2he2R4I1bS7SKyU
	+MXwFtgty8THqGbMuB6HpH9fCl7wRVoqSa5VLkyZtJxfi9Y17y5/LYLYb6J2CqimBHWpxvURK2/
	2pz16+g==
X-Received: from plbjx9.prod.google.com ([2002:a17:903:1389:b0:2bd:9bd8:749b])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:cec7:b0:2c1:f29a:b554
 with SMTP id d9443c01a7336-2c664271df6mr18671095ad.21.1781310547424; Fri, 12
 Jun 2026 17:29:07 -0700 (PDT)
Date: Sat, 13 Jun 2026 00:28:38 +0000
In-Reply-To: <20260612130919.299124-4-jiayuan.chen@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260612130919.299124-4-jiayuan.chen@linux.dev>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260613002906.1336958-1-kuniyu@google.com>
Subject: Re: [PATCH bpf-next v3 3/7] bpf, sockmap: zero-initialize pages
 allocated in bpf_msg_push_data
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
	xmei5@asu.edu, yonghong.song@linux.dev
Content-Type: text/plain; charset="UTF-8"

From: Jiayuan Chen <jiayuan.chen@linux.dev>
Date: Fri, 12 Jun 2026 21:07:47 +0800
> From: Weiming Shi <bestswngs@gmail.com>
> 
> bpf_msg_push_data() allocates pages via alloc_pages() without
> __GFP_ZERO. In the non-copy path, the entire page of uninitialized
> heap content is added directly to the sk_msg scatterlist, which is
> then transmitted over TCP to userspace via tcp_bpf_push(). In the
> copy path, a gap of len bytes between the front and back memcpy
> regions is similarly left uninitialized.
> 
> This leads to a kernel heap information leak: stale page content
> including kernel pointers from the direct-map and vmemmap regions
> is transmitted to userspace, which can be used to defeat KASLR.
> 
> Add __GFP_ZERO to the alloc_pages() call to ensure the allocated
> page is always zeroed before it enters the scatterlist.
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
>  net/core/filter.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/core/filter.c b/net/core/filter.c
> index 3e555f276ba80..6e345ca65ca14 100644
> --- a/net/core/filter.c
> +++ b/net/core/filter.c
> @@ -2832,7 +2832,7 @@ BPF_CALL_4(bpf_msg_push_data, struct sk_msg *, msg, u32, start,
>  	if (unlikely(copy + len < copy))
>  		return -EINVAL;
>  
> -	page = alloc_pages(__GFP_NOWARN | GFP_ATOMIC | __GFP_COMP,
> +	page = alloc_pages(__GFP_NOWARN | GFP_ATOMIC | __GFP_COMP | __GFP_ZERO,

This is a red flag.

We have a bunch of KMSAN reports due to raw/packet sockets,
which requires CAP_NET_ADMIN, and leave them unfixed although
some people attempted to "fix" them by adding __GFP_ZERO to
__alloc_skb().



>  			   get_order(copy + len));
>  	if (unlikely(!page))
>  		return -ENOMEM;
> -- 
> 2.43.0
