Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811993ACEE2
	for <linux-kselftest@vger.kernel.org>; Tue, 23 Jun 2026 21:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782249555; cv=none; b=jqDibtP1oP+4rBo0RFnk4M4Xtw2Ez73hY/6h1ttpNE6TOm+FdZ4TQosYVjyLkM/7Z6ui0EAvM+G+sjbUZN6GejKS/MtQic4ZKPDV+dRvYE/+E34P6wgoOL16wZzGvo15qAPBVvXEYnpYQz2DMSnbkBE3La0rsjPREio5UvG2Qp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782249555; c=relaxed/simple;
	bh=wjU+QQV4ZbhrClmDZG0wh2L8aqWrT43sZmShel/LIuw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=W8J8v66VSXgYjlWiqs2qI7bjT3+gjoRJKMeYLzZ+NFjcmmUuOOyQWzByfXZWlJvOEOIqWlCz2RDIpB1kAeYCrKftlNGTUSooa2+R2TZk8XXFQaRNK8LAsfkG+Z3ggsQNv7LoYnWJzLBhIv73nKTb+AmK3bJ6+/Y0V4GKLFnIPyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=XBhaFr3g; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="XBhaFr3g"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-30c6836fea9so218502eec.1
        for <linux-kselftest@vger.kernel.org>; Tue, 23 Jun 2026 14:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1782249554; x=1782854354; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YdxmerIAihadrns5k6AeCU+dX7jwGWrd5Ynsr92j6uE=;
        b=XBhaFr3gRyUgr3akoYHpuKyF/S6FyR4zDIpUJZzvE6L+RDzhxBFzCRRJwJTOViKwQY
         PhaFT5Zqd6w0Q+iFrBhRPwOJljeT1MMiDhc0hYr8NU9vTUYocB7E07KBWxvV0xmwV2u3
         T7Qs0z9mPTehQYRn0OMGK5VcaBu+IFA1Z+VSXOBIVPEfFIKM8Qrl1dHWSY8uqsmksNFT
         xjRxFEsyLMiF1uVFVwAExfQOUZ+FeCSiLuxwhIsQTKlwjIMfJ6TPgDe1dUm9P1zabfqC
         ITJGAmD6MC/4jyWlKnV6eJIH+3VUoztvFNo9N41u6D3kaZAkSZwjS0kMvvwSFKmlS3nz
         D7sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782249554; x=1782854354;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YdxmerIAihadrns5k6AeCU+dX7jwGWrd5Ynsr92j6uE=;
        b=nLHiUlS3fGLYFNs483pUnp7FZIkd6CaFS1hLx1LRHZFEdD/aCxSESy6M0iGqwIIUe6
         1fKnvOYxtxmheFB1GCp/irYY5XIgNbzXfrzl2KsOpUWgkEFdDWofMtgc9V4waC4Sgm2n
         Gy/LxclkRw9P09BqckerU5skW2oFi2jsIRUTW9O1SZ1pVwaFbHfaXqx0IAFjnBUEzpod
         yqXQsUN5FZZ2DPXUVZJRMT7SNmhH5ijsPPqUX/qSpjnB5Z2kVAxz/kOu1fM3so9JHuX9
         Mq97sR+fByracHM8jmksj7qit2ivz3o/3WCbmv+thhkWCtgA3WPVhS1juOLozKOof7dO
         obHA==
X-Forwarded-Encrypted: i=1; AHgh+RqbkTCdx3gpj/TumTH+RP3CxJbLu8pAFk30UwvB9wBMZKlFeDG+xPpA90YajH+nG+Q923UBPpSQUEDPOUONKrw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8hf0eDuClURMM085H5N7AA9YeCDCSSWdD987MtJfSupPCtNUv
	3K12TbIh9TCnTKI5ldsPZketLFRSAMxCavsoX0FtDLpDUTrPy4sd7H9AbsOtTt0twYA=
X-Gm-Gg: AfdE7clyB0/S/lCXDklBKH9El6YbEwwVatTQFlqivRI+eMcqsWUhN4dAh3gQPdHI2qt
	C/HWKmId5cvMpVhgmXDz/K/dvAtWHNUAXPmLNfIrHM5KpNodgEO6Pr9P01a0aEKBKkBhQLntNgh
	4na2GLm7qP77lDbmcdE2A95rk1DJ9lzcKsPXEcee2zMSvdQoC/c5dp6D2685X5lMF33Tha9yZHo
	AMQ/aLjnhleYHlc8Hiv7Mft7HZ5sq+zt2sYZpriHq2jDdwUwjrIG7mZSvKbt9ZXSQBaWIa5amNz
	T6tKascuImSGSexEBxsQti/iGnhmCw2GxAcNCqZtdqIgjOSxo6GOT+2WTUobfNfRKgn1pxSSPb0
	r9k3lBCL14GWx8AzvWFrphIAvuD+Hy+YpbYh1YtD5n0lHmOemBlgI4DHLr6udOtlcls/Nqw==
X-Received: by 2002:a05:7301:3e0b:b0:30a:e52f:9b99 with SMTP id 5a478bee46e88-30c553f5be2mr4493143eec.0.1782249553428;
        Tue, 23 Jun 2026 14:19:13 -0700 (PDT)
Received: from localhost ([2620:10d:c090:600::2526])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1be4967fsm17804817eec.26.2026.06.23.14.19.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 14:19:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Jun 2026 17:19:10 -0400
Message-Id: <DJGQQKCPFMSC.19R6QFGHXVMQ5@etsalapatis.com>
Cc: <netdev@vger.kernel.org>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH bpf 1/2] bpf, sockmap: Don't leak UDP socks on
 lookup-bind-release
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Michal Luczaj" <mhal@rbox.co>, "John Fastabend"
 <john.fastabend@gmail.com>, "Jakub Sitnicki" <jakub@cloudflare.com>,
 "Jiayuan Chen" <jiayuan.chen@linux.dev>, "David S. Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Simon
 Horman" <horms@kernel.org>, "Alexei Starovoitov" <ast@kernel.org>, "Cong
 Wang" <cong.wang@bytedance.com>, "Daniel Borkmann" <daniel@iogearbox.net>,
 "Andrii Nakryiko" <andrii@kernel.org>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Martin
 KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong
 Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Shuah Khan" <shuah@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260623-sockmap-lookup-udp-leak-v1-0-05804f9308e4@rbox.co>
 <20260623-sockmap-lookup-udp-leak-v1-1-05804f9308e4@rbox.co>
In-Reply-To: <20260623-sockmap-lookup-udp-leak-v1-1-05804f9308e4@rbox.co>

On Tue Jun 23, 2026 at 2:03 PM EDT, Michal Luczaj wrote:
> UDP sockets get SOCK_RCU_FREE set when (auto-)bound. This means
> sk_is_refcounted(unbound) =3D true, while sk_is_refcounted(bound) =3D fal=
se.
>
> Because sockmap accepts unbound UDP sockets, a BPF program can increment =
a
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
> unbound) as not requiring a refcount increment on (a RCU protected) looku=
p.
>
> Fixes: 0c48eefae712 ("sock_map: Lift socket state restriction for datagra=
m sockets")
> Signed-off-by: Michal Luczaj <mhal@rbox.co>

Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>

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
> @@ -173,6 +173,9 @@ int udp_bpf_update_proto(struct sock *sk, struct sk_p=
sock *psock, bool restore)
>  	if (sk->sk_family =3D=3D AF_INET6)
>  		udp_bpf_check_v6_needs_rebuild(psock->sk_proto);
> =20
> +	/* Treat all sockets as non-refcounted, regardless of binding state. */
> +	sock_set_flag(sk, SOCK_RCU_FREE);
> +
>  	sock_replace_proto(sk, &udp_bpf_prots[family]);
>  	return 0;
>  }

