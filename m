Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B71632AABC
	for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 13:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782308171; cv=none; b=FCZ1XTRS7kUfmNTOsLHrDc1pcMl/WRTp3fvRSGzjSRN+yhPEBjC0vp7ikxe9CmZoHppDnkDvfzFm9eGPhDFwMvGu7V5C3O7DXpWkCN+VirjziAri6FuCN+UgrEQ8qxHXcLKCkF8VK40+LKwCygn9mCK0ll9KEDmEBz3GYmzzW3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782308171; c=relaxed/simple;
	bh=i/PjI4m04aPw0PQLU5HQ2rF0LE8MVaue1ZoAwrK1SYE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tixXYjiD9gkzET5XH7V/tbc4G4Bv6r2l3Z6DyxKsieuDhiZXCM/5J4WoVR/LxndHyylExrKIu9bRkjk9Ps+TVyxNk56YycdKu1vGVvQykCmpNH0tgiul6paNLCoetx2JUhETYyeZ7VWK0Z7CDx1qp9EmPpApJxuHTwQnAgKxGdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=HpUn2zPj; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="HpUn2zPj"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-697de23bd7dso1466696a12.1
        for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 06:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1782308167; x=1782912967; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RvxFHr+pWEoc4bhYu8JwbhnPbjylaRVmeM2W41MKswU=;
        b=HpUn2zPjP4mX6UAQRBTOkdF3i/ZQkh+OBP5R9zfZr4UV1ikejir6e27iIYyUjgSoOE
         dydBVdYbDakXnIAcNbvMc34cqvyItyiDGLgHyWZYHJtDf9DtE2KY0rh1VqcQec7BPaQ7
         VO+r1TEbGMNQKxrGX+7HcqyAcfIiuuvNi/7fzx5DKIZqi/sBPKIJDmxbUIX/2+IbgcwX
         kPFggf+LXSmiiQUrgfNAjgv31sEpcUndyONlCE+p2mhtJIQtfUaqhLC6uJUe5A9f1NRe
         vw0/X/Yc2ZSTrTtGxeHoSKuvUYx2yYk5yQJOYr1NbY6f/8kXw3/STbSUZ3WFKpYNolsl
         xCHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782308167; x=1782912967;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RvxFHr+pWEoc4bhYu8JwbhnPbjylaRVmeM2W41MKswU=;
        b=R0gPYHhacsHNWnJvTftVYaQ3cmjq1S0g99bSb7m05y7vDNwy+viwbsBhp2aVzrAzSE
         vx1kwD5k98+uPU3qJoP6HiZZmA8d9++yP313N04SBa6olLSSJi16/s+LFWUTmWMSYWhj
         ZQpZnw4u+4/DnIa39iuxavvQLJhoSUIy+oCm7zLo0qM2nzxlL910jN/+Y65+ki4evWIQ
         lsgeLJQZ7munupSSBLhzHvEwYLEXEQrwTMIZkaLC42yZNGocIB0sQlzZ8Y8rl4GiFoNv
         STCpsRatFw9DX/PNuYo7cUWXeRpqT7+IPPIgFs6BRKCSrz/uEwHuGNby1TjTp2KNjHTG
         nkxw==
X-Forwarded-Encrypted: i=1; AHgh+RqOOMdwCWs7snIIqQrlQM2M++O/dgpmjqWytS0EPEZ032dl8OJj1Eyrbc/trnpd7rNUXixY18Pxwwf7f8ucX9M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbARh1roxR2yvfVpyGMjTzS38M5PjxkCj6nEovrXyNiFfZQVnL
	Nqhu6/DmdDTX1cr+cIgXsic2rOf+vEjsRngveJdPgjIKgLP8gbZ7fIzR3nAvJUhGYxY=
X-Gm-Gg: AfdE7cmTVHPE9q8ZH6U4G+vgXfcDX/sgRFvVsQyKTbsxrtehW6umi861bVQisDFiXz9
	z6AQBy/e/Yxn0jqoJA5YICjEv93GOxKE3vQKJ1FDg9jErqY6rRDmenMlCuXrw7Ecj6knY3hVqjx
	CRECThOEG3r3hVnD68RodGWbQKF/bReko1Z6xhpQlxbzXStCmU0bGo/n4PD8xkDacnU/TsaLaHF
	FLc9G89Mt0k6O7FR58w1V0SjxmVxxo3rrg3JByVHAw8JgmS58q0gaeg36r54jwBT5/u9L33MXxj
	XtwLKGrMIbkriHT2AtToEvQ6d9FbgBfndfQ6c8CpIBX0e8kvjfvoV9C2KFGE9R8EOMoOX0cqb3a
	vA8+jQ68Jk6B0fGed+D+tjEoppldbyz8nZZQ3onfCidbTkcFUv+t1OOsKK9Xk160RKiVz9xr8LE
	Z1H3a+XqOYRyx8HO8=
X-Received: by 2002:a05:6402:1e91:b0:697:de64:ae9a with SMTP id 4fb4d7f45d1cf-697f376fafamr1997570a12.6.1782308167524;
        Wed, 24 Jun 2026 06:36:07 -0700 (PDT)
Received: from cloudflare.com ([104.28.21.182])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f4bd36adsm1202161a12.27.2026.06.24.06.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 06:36:07 -0700 (PDT)
From: Jakub Sitnicki <jakub@cloudflare.com>
To: Michal Luczaj <mhal@rbox.co>, Willem de Bruijn
 <willemdebruijn.kernel@gmail.com>
Cc: John Fastabend <john.fastabend@gmail.com>,  Jiayuan Chen
 <jiayuan.chen@linux.dev>,  "David S. Miller" <davem@davemloft.net>,  Eric
 Dumazet <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>,  Paolo
 Abeni <pabeni@redhat.com>,  Simon Horman <horms@kernel.org>,  Alexei
 Starovoitov <ast@kernel.org>,  Cong Wang <cong.wang@bytedance.com>,
  Daniel Borkmann <daniel@iogearbox.net>,  Andrii Nakryiko
 <andrii@kernel.org>,  Eduard Zingerman <eddyz87@gmail.com>,  Kumar
 Kartikeya Dwivedi <memxor@gmail.com>,  Martin KaFai Lau
 <martin.lau@linux.dev>,  Song Liu <song@kernel.org>,  Yonghong Song
 <yonghong.song@linux.dev>,  Jiri Olsa <jolsa@kernel.org>,  Emil Tsalapatis
 <emil@etsalapatis.com>,  Shuah Khan <shuah@kernel.org>,
  netdev@vger.kernel.org,  bpf@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-kselftest@vger.kernel.org
Subject: Re: [PATCH bpf 1/2] bpf, sockmap: Don't leak UDP socks on
 lookup-bind-release
In-Reply-To: <20260623-sockmap-lookup-udp-leak-v1-1-05804f9308e4@rbox.co>
	(Michal Luczaj's message of "Tue, 23 Jun 2026 20:03:09 +0200")
References: <20260623-sockmap-lookup-udp-leak-v1-0-05804f9308e4@rbox.co>
	<20260623-sockmap-lookup-udp-leak-v1-1-05804f9308e4@rbox.co>
User-Agent: mu4e 1.14.1; emacs 30.2
Date: Wed, 24 Jun 2026 15:36:06 +0200
Message-ID: <87wlvoxdq1.fsf@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Jun 23, 2026 at 08:03 PM +02, Michal Luczaj wrote:
> UDP sockets get SOCK_RCU_FREE set when (auto-)bound. This means
> sk_is_refcounted(unbound) = true, while sk_is_refcounted(bound) = false.
>
> Because sockmap accepts unbound UDP sockets, a BPF program can increment a
> socket's refcount via lookup. If the socket is subsequently bound, the
> transition from unbound to bound causes bpf_sk_release() to skip the
> decrement of the refcount, causing a memory leak.
>
> unreferenced object 0xffff88810bc2eb40 (size 1984):
>   comm "test_progs", pid 2451, jiffies 4295320596
>   hex dump (first 32 bytes):
>     7f 00 00 01 7f 00 00 01 d2 04 1b b7 04 d2 00 00  ................
>     02 00 01 40 00 00 00 00 00 00 00 00 00 00 00 00  ...@............
>   backtrace (crc bdee079d):
>     kmem_cache_alloc_noprof+0x557/0x660
>     sk_prot_alloc+0x69/0x240
>     sk_alloc+0x30/0x460
>     inet_create+0x2ce/0xf80
>     __sock_create+0x25b/0x5c0
>     __sys_socket+0x119/0x1d0
>     __x64_sys_socket+0x72/0xd0
>     do_syscall_64+0xa1/0x5f0
>     entry_SYSCALL_64_after_hwframe+0x76/0x7e
>
> Maintain balanced refcounts across sk lookup/release: (re-)set
> SOCK_RCU_FREE on proto update to treat the socket (whether bound or
> unbound) as not requiring a refcount increment on (a RCU protected) lookup.
>
> Fixes: 0c48eefae712 ("sock_map: Lift socket state restriction for datagram sockets")
> Signed-off-by: Michal Luczaj <mhal@rbox.co>
> ---
> Note: this issue is related to commit 67312adc96b5 ("bpf: reject unhashed
> sockets in bpf_sk_assign").
> ---
>  net/ipv4/udp_bpf.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/net/ipv4/udp_bpf.c b/net/ipv4/udp_bpf.c
> index ad57c4c9eaab..970327b59582 100644
> --- a/net/ipv4/udp_bpf.c
> +++ b/net/ipv4/udp_bpf.c
> @@ -173,6 +173,9 @@ int udp_bpf_update_proto(struct sock *sk, struct sk_psock *psock, bool restore)
>  	if (sk->sk_family == AF_INET6)
>  		udp_bpf_check_v6_needs_rebuild(psock->sk_proto);
>  
> +	/* Treat all sockets as non-refcounted, regardless of binding state. */
> +	sock_set_flag(sk, SOCK_RCU_FREE);
> +
>  	sock_replace_proto(sk, &udp_bpf_prots[family]);
>  	return 0;
>  }

There is a side effect that an unhashed (unbound) UDP socket can now be
selected in sk_lookup with bpf_sk_assign. Though perhaps that's for the
better because TC bpf_sk_assign doesn't reject non-refcounted UDP
sockets either, so we would have both socket dispatch sites behave the
same way.

Also, with this patch, if we insert & remove an unhashed UDP socket
into/from a sockmap, we end up with an unhashed non-refcounted UDP
socket. Not entirely sure if that is actually a problem or not.

Willem, what is your take on having unhashed non-refcoted UDP sockets?
