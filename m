Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDE820D4FC
	for <linux-kselftest@vger.kernel.org>; Sat, 13 Jun 2026 00:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781311470; cv=none; b=l9nb4bcZV4lk67fnWXZuQB7TYDojcPwYugzpZ2G9lxR+B+a362lWT9LhoobFKbCLf49iC+KIa9lmL1OG1eRfSP9SYkh+t1Y+3P+SRTLWWm1CaHvQ9GB2TPLkr5wS0ixAk8hWxHXX8ffRiceKgB4kWBF9aE+Ue8AbVdppbYA+RUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781311470; c=relaxed/simple;
	bh=Tn7ej/8bpTZPZT3FAt7K90hmxt6AummHBhAcDjCJFgE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ycxl5sXvxyE18IEmjpNoC8LhXjQpbYD8wLdEAlEiwxAIBuHWfDWv97ElVS7oIvhxkHEZNIwnX/ImwSV9/J0NgHNq8G7+yVMkexRGntJo7Um6jTcQG1akKrxj4ZO9Uk1SmRW35EjVSFCHLx5grsL8brLG3fDilSlSzofofdkaEJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RmIdU2jV; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RmIdU2jV"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-36d98b828c8so2207799a91.2
        for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 17:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781311468; x=1781916268; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GdSWAaXQJk4NhbjCX9jOP5RFV/noRIR3yFDGGrPquyo=;
        b=RmIdU2jV1C8CJe8EPYElgzSqa4i3FnlGMQUTTrCvBUGO6hYkI7peMDOp327jmjwCUI
         22ZlRhzD6JwbeTtqSYIsy1h5IIn0JBVZt8td7l5fAH5F/gSpY6j9plesYh9+xRAbLCcF
         apweIUx0biRGGTFHrBMyiNv0fvqnd04vLVCjWx4gmtdphroRCUJJxPlwg+0Csn1KUAtb
         w911zRrHf48+iYgZHtIWwkKN/o2/0aYA1uHg16LP6exg8J1V3qSdGyksLWf1m0OEEb+1
         d9nWdnkgM2FPJO4DD1I+ZDmZ1xohQ+24xcWoYFa7tjf4BfzyWvX4sTe4X1Z2mN+RI5+1
         05Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781311468; x=1781916268;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GdSWAaXQJk4NhbjCX9jOP5RFV/noRIR3yFDGGrPquyo=;
        b=M0tZLy47VW09yWONqVsS+S3VEoepPYztYs9VvVDE1OqgYnfEV7pcvdITclhjmXIpOP
         VHXmrzwbqhWfsgC/G47ZeQKhSsn7YMNhKSAZAOqL5oE6XMStK5Lq9TqmDQpu1buKZE6C
         7FtH7Qh1RZ8Qim5qqecV2oKKBW42pRbPsqaKJrhCOtyF4tvz2Bf9D8GMShanldwrWSEV
         v59guSG1inPwbE092dZG/savS28O99UHKiOHr/nyuESLliSsXslEz3SrxfIQ1Ntwf5fX
         v00MGoFKYql3mwXatJo67mqYftDd6BLpW7rDtUhoZ0r884hiMmaeYzEBLJKmW62cRCI4
         EjeQ==
X-Forwarded-Encrypted: i=1; AFNElJ+3pIv8iQNYRLZQcjeU8eCFMs/H7N4c/LPg+7LB6+a0SUwigYkFDwMdaQu4aOENMxfDBGMI0LV7YkVvU/WKGgM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1g3JOo6Rxh4nyrPBhPiiVOuBI543CeYgIGjsfxUcLmrmcabHI
	q8RMzZh/5zCXpGNOWy/OV4KDWJBimLfnpoV3juQyAAnQbjRv47gIdIzrpFi53BG4hbP+Kqo2dNp
	Q3foNNw==
X-Received: from pjyt12.prod.google.com ([2002:a17:90a:e50c:b0:36b:a12c:2f0])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4c:b0:368:ea0c:1b75
 with SMTP id 98e67ed59e1d1-37a01c36550mr5265091a91.6.1781311467684; Fri, 12
 Jun 2026 17:44:27 -0700 (PDT)
Date: Sat, 13 Jun 2026 00:44:23 +0000
In-Reply-To: <20260612130919.299124-7-jiayuan.chen@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260612130919.299124-7-jiayuan.chen@linux.dev>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260613004425.1347589-1-kuniyu@google.com>
Subject: Re: [PATCH bpf-next v3 6/7] bpf, sockmap: fix integer overflow in
 bpf_msg_pop_data() bounds check
From: Kuniyuki Iwashima <kuniyu@google.com>
To: jiayuan.chen@linux.dev
Cc: andrii@kernel.org, ast@kernel.org, bpf@vger.kernel.org, 
	cong.wang@bytedance.com, daniel@iogearbox.net, davem@davemloft.net, 
	eddyz87@gmail.com, edumazet@google.com, emil@etsalapatis.com, hawk@kernel.org, 
	horms@kernel.org, ihor.solodrai@linux.dev, jakub@cloudflare.com, 
	john.fastabend@gmail.com, jolsa@kernel.org, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	martin.lau@linux.dev, memxor@gmail.com, netdev@vger.kernel.org, 
	pabeni@redhat.com, rhkrqnwk98@gmail.com, sdf@fomichev.me, shuah@kernel.org, 
	song@kernel.org, yonghong.song@linux.dev, 
	Kuniyuki Iwashima <kuniyu@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Jiayuan Chen <jiayuan.chen@linux.dev>
Date: Fri, 12 Jun 2026 21:07:50 +0800
> From: Sechang Lim <rhkrqnwk98@gmail.com>
> 
> start and len are u32, so
> 
> 	u64 last = start + len;
> 
> evaluates start + len in 32-bit and wraps before storing it in last.
> The bounds check
> 
> 	if (start >= offset + l || last > msg->sg.size)
> 		return -EINVAL;
> 
> can then be passed with an out-of-range start/len, after which the pop
> loop runs off the end of the scatterlist and sk_msg_shift_left() calls
> put_page() on the empty msg->sg.end slot:
> 
>   Oops: general protection fault, probably for non-canonical address
>   0xdffffc0000000001: 0000 [#1] SMP KASAN PTI
>   KASAN: null-ptr-deref in range [0x0000000000000008-0x000000000000000f]
>   RIP: 0010:sk_msg_shift_left net/core/filter.c:2957 [inline]
>   RIP: 0010:____bpf_msg_pop_data net/core/filter.c:3103 [inline]
>   RIP: 0010:bpf_msg_pop_data+0x753/0x1a10 net/core/filter.c:2984
>   Call Trace:
>    <TASK>
>    bpf_prog_4cc92c278f4d5d56+0x1b1/0x1e8
>    bpf_prog_run_pin_on_cpu+0x107/0x320 include/linux/filter.h:746
>    sk_psock_msg_verdict+0x357/0x7f0 net/core/skmsg.c:934
>    tcp_bpf_send_verdict net/ipv4/tcp_bpf.c:420 [inline]
>    tcp_bpf_sendmsg+0x766/0x1ae0 net/ipv4/tcp_bpf.c:583
>    __sock_sendmsg+0x153/0x1c0 net/socket.c:802
>    __sys_sendto+0x326/0x430 net/socket.c:2265
>    __x64_sys_sendto+0xe3/0x100 net/socket.c:2268
>    do_syscall_64+0x14c/0x480
>    entry_SYSCALL_64_after_hwframe+0x77/0x7f
>    </TASK>
> 
> Widen the addition with a (u64) cast so the bound is evaluated in
> 64-bit and a len near U32_MAX no longer wraps below msg->sg.size.
> 
> While here, change pop from int to u32. It counts bytes against the
> unsigned scatterlist lengths and can never be negative, so the signed
> type only invites sign-confusion in the pop loop.
> 
> Fixes: 7246d8ed4dcc ("bpf: helper to pop data from messages")
> Reviewed-by: Jiayuan Chen <jiayuan.chen@linux.dev>
> Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>
> Signed-off-by: Sechang Lim <rhkrqnwk98@gmail.com>
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
