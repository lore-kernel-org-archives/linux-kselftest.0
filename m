Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6CF3321DC
	for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 20:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782331273; cv=none; b=Dr8OgInTXeV/thOAxlxuQtXv0SCoLxuPoE73vHeJk79aAfTD4bsgf2WH2zGGv5MFwSD0HHW8Uu5Lmdf8M3gk95gOvsIZUJFN9wy2d8X6Y3HZCs/dcrYU68ZhQ3viNjgyiuq/M2v90QzSYDus9fD3OUuovYw9IjIxbPlPbbStCvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782331273; c=relaxed/simple;
	bh=EKxSlgEBSBkAM5+htBMrWemn3+ErZ8FA7IixhRa/dSI=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=gCpxx2V44rERmvTqlf2Sy3T9XFFfYszu0CPqyvgHTzcdTkEjc5tP06nur9VMyhUBahwKD5xALHdhJ/8ExoCgfphIhpy5+gN3qf+Ouc016U4VCxT9H3MoKXVDWk9NCNXfQFhMqENKL123v+n1gweiNrfgA2hn1WIeG2hbVEe7h9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZwdMobqj; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZwdMobqj"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-662dc387b7aso1662792d50.3
        for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 13:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782331271; x=1782936071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X2A8EKBL3N7BN+s6tAkTzPMXNdRY8rqNJI+vtC/7pCo=;
        b=ZwdMobqjUPsGo8LE+n+nM5S8ddB2K481rM2YXvRTlZ505ci9yGifHg+gt5MYNxfMPB
         S+L0gDss0iYi9r1lYUDac8g86JTt+88aGXWL1x2Jpx4WoRWJjOS787sM0YBHvbbJltPx
         yW6t/b1RNv256eGRL47SKNFYsSi3Fno6nU2/FElT8xzozEIOU6w9iOBvw+uMBL/c+Tms
         cGLK26Nya42GtqrkIrO0MEjwvmWcRQUxmLaThPXj9sOKFbT5fZ3rBhRu9v177IUk9OXb
         dRAgQH+mD8GX5N3W0phJvSPehqQExV4MLN43I1JFZvSBXWLA2IgqSmhgtCyt2bicuxXy
         UDYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782331271; x=1782936071;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X2A8EKBL3N7BN+s6tAkTzPMXNdRY8rqNJI+vtC/7pCo=;
        b=flW2XCYXPMpFFToqSyzRjwf3zE81f1sQ01qH3eXuDHhGC6mqxWpyFJ0qUK21Z+XnOw
         dU0GHBqoaVLEj/MZFbNqwfEXsekjhSFOOz/0R9O7Oiq0fE2yAcUiRX++zVojznNW9Ou/
         CFdTRK6Hz0L5P4PiVPlZCrbORkCfPHJVjTBVj4smtbnZFJ56/2lR5hNOF/xnllvIxi+X
         nuDLsNK3sWu5CYNVXxlyzZPrYo5Oy0tGTFbe2xb4FRyDHvm1l3lDEe6LtWmKfyga1OtL
         bFpLCKiBFTR3G/5Pl0qZSMWKL5hzJjrpSCrkU9X5oV2fm+9hVGtDV3HrPwSJOb6sn4hf
         gdfA==
X-Forwarded-Encrypted: i=1; AHgh+RoG0IUk3RVziTzeCj/bPeeGotTtpcpuoHY/8B5YV78/CTJEKIDheUmHEQSmQCtrWHEBZ6DlsCwMhvjahmahUUI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0eDjIP1ikxN3JWsZGEh9b7Kxcq7b3xPLknsl2gUQitKdMV+JK
	fbBdxWHZOOkHdZE4OvLpBseHSQR5gT1nuNHogwjYTPJsB8REVm7qwqFj
X-Gm-Gg: AfdE7cltAuLS3nYejzJb5n5xG7IkrIitvrHljKH935ZT3O+ZYQpStUo/VF29faMIvEc
	YjHMrXJEvrzOUt6Wek/74yk775ESKUQSi4Lr9VRVK+exljImf5p/KfmRvxBtFJaQwRHYcxovKjX
	eTV5ICXod5Ai2ChJ6CmZ6j6R6ddC+QmECszROtlo54g2Ra7QgzxkUaPDZ9CRRT+qYfCkekPTqhK
	z6/vbn/VilbE/2DYX8fQ0KAi6a5h12YzMoNxaZOcgzJavf0LAUstq9j2qhBci/NpsDy9YYHpeFN
	mIzn9uvy8yXux1VS5usA/bLa4jo2b1K4f7VyxMgLonM5SWtRTFUjAwyZi+BUr6HegoNVNpq7+ni
	vYrcKdfwEv1N+4TW/I2I3UmtwxKo2U9RxUwMJG72kLp3RMwskU2fSzOPIDEQ1zf05oeLwNMm6CH
	sKG1fEJeaLqzS56G2e4wqbagVbZ5bP5uVAz3R3FlfwM2vwy4eBdavHLASM/TJvr5ble2jX
X-Received: by 2002:a05:690e:1909:b0:660:56ee:ebf1 with SMTP id 956f58d0204a3-6636e489415mr4425430d50.22.1782331270986;
        Wed, 24 Jun 2026 13:01:10 -0700 (PDT)
Received: from gmail.com (141.139.145.34.bc.googleusercontent.com. [34.145.139.141])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6647f99b601sm351024d50.20.2026.06.24.13.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 13:01:10 -0700 (PDT)
Date: Wed, 24 Jun 2026 16:01:09 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Jakub Sitnicki <jakub@cloudflare.com>, 
 Michal Luczaj <mhal@rbox.co>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: John Fastabend <john.fastabend@gmail.com>, 
 Jiayuan Chen <jiayuan.chen@linux.dev>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Alexei Starovoitov <ast@kernel.org>, 
 Cong Wang <cong.wang@bytedance.com>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, 
 Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Shuah Khan <shuah@kernel.org>, 
 netdev@vger.kernel.org, 
 bpf@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 kuniyu@google.com
Message-ID: <willemdebruijn.kernel.24d11e11d5dc0@gmail.com>
In-Reply-To: <87wlvoxdq1.fsf@cloudflare.com>
References: <20260623-sockmap-lookup-udp-leak-v1-0-05804f9308e4@rbox.co>
 <20260623-sockmap-lookup-udp-leak-v1-1-05804f9308e4@rbox.co>
 <87wlvoxdq1.fsf@cloudflare.com>
Subject: Re: [PATCH bpf 1/2] bpf, sockmap: Don't leak UDP socks on
 lookup-bind-release
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Jakub Sitnicki wrote:
> On Tue, Jun 23, 2026 at 08:03 PM +02, Michal Luczaj wrote:
> > UDP sockets get SOCK_RCU_FREE set when (auto-)bound. This means
> > sk_is_refcounted(unbound) = true, while sk_is_refcounted(bound) = false.
> >
> > Because sockmap accepts unbound UDP sockets, a BPF program can increment a
> > socket's refcount via lookup. If the socket is subsequently bound, the
> > transition from unbound to bound causes bpf_sk_release() to skip the
> > decrement of the refcount, causing a memory leak.
> >
> > unreferenced object 0xffff88810bc2eb40 (size 1984):
> >   comm "test_progs", pid 2451, jiffies 4295320596
> >   hex dump (first 32 bytes):
> >     7f 00 00 01 7f 00 00 01 d2 04 1b b7 04 d2 00 00  ................
> >     02 00 01 40 00 00 00 00 00 00 00 00 00 00 00 00  ...@............
> >   backtrace (crc bdee079d):
> >     kmem_cache_alloc_noprof+0x557/0x660
> >     sk_prot_alloc+0x69/0x240
> >     sk_alloc+0x30/0x460
> >     inet_create+0x2ce/0xf80
> >     __sock_create+0x25b/0x5c0
> >     __sys_socket+0x119/0x1d0
> >     __x64_sys_socket+0x72/0xd0
> >     do_syscall_64+0xa1/0x5f0
> >     entry_SYSCALL_64_after_hwframe+0x76/0x7e
> >
> > Maintain balanced refcounts across sk lookup/release: (re-)set
> > SOCK_RCU_FREE on proto update to treat the socket (whether bound or
> > unbound) as not requiring a refcount increment on (a RCU protected) lookup.
> >
> > Fixes: 0c48eefae712 ("sock_map: Lift socket state restriction for datagram sockets")
> > Signed-off-by: Michal Luczaj <mhal@rbox.co>
> > ---
> > Note: this issue is related to commit 67312adc96b5 ("bpf: reject unhashed
> > sockets in bpf_sk_assign").
> > ---
> >  net/ipv4/udp_bpf.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/net/ipv4/udp_bpf.c b/net/ipv4/udp_bpf.c
> > index ad57c4c9eaab..970327b59582 100644
> > --- a/net/ipv4/udp_bpf.c
> > +++ b/net/ipv4/udp_bpf.c
> > @@ -173,6 +173,9 @@ int udp_bpf_update_proto(struct sock *sk, struct sk_psock *psock, bool restore)
> >  	if (sk->sk_family == AF_INET6)
> >  		udp_bpf_check_v6_needs_rebuild(psock->sk_proto);
> >  
> > +	/* Treat all sockets as non-refcounted, regardless of binding state. */
> > +	sock_set_flag(sk, SOCK_RCU_FREE);
> > +
> >  	sock_replace_proto(sk, &udp_bpf_prots[family]);
> >  	return 0;
> >  }
> 
> There is a side effect that an unhashed (unbound) UDP socket can now be
> selected in sk_lookup with bpf_sk_assign.

The commit does mention a related fix, beneath the ---, commit
67312adc96b5 ("bpf: reject unhashed sockets in bpf_sk_assign").
That fixes a similar issue by exactly disallowing this:

    Fix the problem by rejecting unhashed sockets in bpf_sk_assign().
    This matches the behaviour of __inet_lookup_skb which is ultimately
    the goal of bpf_sk_assign().

So ..

> Though perhaps that's for the
> better because TC bpf_sk_assign doesn't reject non-refcounted UDP
> sockets either, so we would have both socket dispatch sites behave the
> same way.

.. there are two conflicting types of consistency here? Consistent with
__inet_lookup_skb or the TC bpf hook. Of those the first is the more
canonical.

> Also, with this patch, if we insert & remove an unhashed UDP socket
> into/from a sockmap, we end up with an unhashed non-refcounted UDP
> socket. Not entirely sure if that is actually a problem or not.
> 
> Willem, what is your take on having unhashed non-refcoted UDP sockets?

I don't immediately see a problem, but I'm not an expert on SOCK_RCU_FREE.

