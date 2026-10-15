Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454E92DC791
	for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 21:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792100713; cv=none; b=HPFShIdcQpJAkDj1e3csLPsfN0Ire/aiURe2Lz6GO0RsZPWD4btO/zrlIZQDoD+e+E+2MSgPNXuuqVE6E4g4zh/oztkEvGgJFDiJtQinfOW8w4BXNAJWaJ3J03wPweWl3uqJb8IqAVrr9LWIRX+Ksy1Gft2uBI651QFLbfSOqSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792100713; c=relaxed/simple;
	bh=GPNQqOJAOgBKAauyZt2tdDWFLSk/zJ+iARLWqBubi6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sqI3qyGSTVo3gb0CmouTSZ+x0g8notlekK0+/t4MdGbN6kitNLiRoRIGXiU9zyHBbk5G2Ffi6FFNmvaPCC3ZMcDnoBMzNTkgLSgiKTVRMbyAIUMQxFExcsIF0HJQE9yR9taYqTIEGSlivIfQfYI6XxdhseXIi9dz/jbGoEzWgrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oBlUIjX8; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oBlUIjX8"
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-3a0aa5e2b20so1627907a91.1
        for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 14:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792100712; x=1792705512; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9Utj4RJBz9ZzU3Tg03m75VH5qFdGTJER42ZgUXj5+s8=;
        b=oBlUIjX8H3L398YNTVFnWmj6VlVLiUIO2KPqjEG+Hk+0hL5At01p59XcFXwn2UrRS6
         R2km8R5+QiphW4mpagyNunPEzS+jCMVjutxs6LL0c8d1fEvKSL2wVPueeBejArZHzjxM
         eNjekzxVSW377t4jJhFU0tancVP7abd6IrBVjOe8CM5wTEp6s1WOX5t2xyh1nbeUwW3f
         +iI80VEwLE2jbjI9NHITmArOqsZAmbA+JorYD9sPmp/vO9OjrsEUAPUyDLbLGyjbkFQp
         KCX8N0URjeYkAZrG7ZVBvPEMH6ddB0zzLebV6AQuRxdke2l6/HnP7yfmaHCGePSNDkIy
         snSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792100712; x=1792705512;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Utj4RJBz9ZzU3Tg03m75VH5qFdGTJER42ZgUXj5+s8=;
        b=HLoTu0VTBtS6DTo57k9mUXTq6hsvdDnaWECZrOWmRlzDOX6e/1618LNBrPe1izvWpg
         XJp0uj0PXA9jmDK9zJcc1WkuS5BTaxMEisBvFQ6+4xJfoxOi1eHbBuf1IBqYI7DBtP01
         HDrFLX5RZG2LPi0fAI0kRA+PPBjELnk7u3QzgxNeIQyLDQj8iqB4iLNoFu8csRL8XsB+
         Jv+DzrtY+D2uSX1J6LcjlAQR0/yhMA5SvC/hNqHgk0Dr6C6Gn7dD55J8pBDVSZqt2EnV
         KMIrIGNgy1ly69JITnx5OnYt+7x0VZ8k9mRbRXC/mYLL18OjE2B7FObCmp6k2BwQ9v6l
         bQBw==
X-Forwarded-Encrypted: i=1; AKwUvByX5x/f0wvRRLL0q8H7OWvJhMWbwKQ7zvngD1C65h4nTDMmzYc8tIzjfISLwVquHWJyO+FDjyu8JiSW/1Q+qcM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKR8Vq3rbfclSyNLqQTgkuc8qx8Tw9AqA1omcEKUk/cUMWHkQOx
	y0wQkT+qsPF5/bhq8yDglGPuvHEj4BhlCaFDiuHLJJNoAkOffx3Yplqb
X-Gm-Gg: AYBFou3ca259WULfKDy4qcDuTGT1XpZYX7x2SxkZT8x5JylaAa5tWuNlBUlnkBlMKMd
	bv4HC3PP18BCEWbBICiKCad63EJkZniuQeGcqDHZwHWscMJe6v7ACkjHu4WTGjikGDBN/Rho7fC
	CeEeT9TaZQdPQvj1qL91j5TCgyzjVBDwqmUttWVL+FpFIA72GG+likyNykqv/iydJ0nDqpLSajV
	u7xb/pb1YBdn51LHydfFQWsbvPipneVqzVKk3l19kY3JaGTPYWU+IRWLPPnncUdAWnDoDvwd41l
	5c43FG4I8Zuee/0v+u+pttpAJ+CBfG7JzhrfEfhchZ9Isg2P4kUHFs0fl2/cOluIfHBhlq+ZQ7w
	agJREWLsoIjPdtDXlAcqb0muPXFZ2Fi6vS+i6gWtF9cdjkCDhaf/SsKGg8B3cWTRLj3/tlV8Zex
	3eRQNwM9lC1yDkJU7LPuOUU8Se7gFS8gdMvavCBVtxMVLnQuMc5T77S0xhg8zhnBa8
X-Received: by 2002:a17:90b:4b09:b0:3a2:b16d:928b with SMTP id 98e67ed59e1d1-3ab3a79dd3emr16515826a91.46.1792100711675;
        Thu, 15 Oct 2026 14:45:11 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:52::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc963f36asm239567a91.0.2026.10.15.14.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 14:45:11 -0700 (PDT)
Date: Thu, 15 Oct 2026 14:45:02 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Willem Ferguson <wferguson@cloudflare.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, ncardwell@google.com, bpf@vger.kernel.org, 
	ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, 
	memxor@gmail.com, linux-doc@vger.kernel.org, corbet@lwn.net, 
	linux-kselftest@vger.kernel.org, shuah@kernel.org, linux-kernel@vger.kernel.org, 
	kernel-team@cloudflare.com
Subject: Re: [RFC PATCH net-next 0/4] tcp: carry a BPF-chosen identifier in
 TSval low bits
Message-ID: <atFI9vl5hy09Dc0t@devvm7509.cco0.facebook.com>
References: <20261013103906.2660384-1-wferguson@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261013103906.2660384-1-wferguson@cloudflare.com>

On 10/13, Willem Ferguson wrote:
> This series lets a listener encode a small per-connection identifier in
> the low bits of the TCP timestamp values it sends. The peer echoes TSval
> back in TSecr, so every segment the peer sends after the handshake
> carries the identifier in its TSecr.
> 
> In Anycast networks, mid-stream path changes caused by BGP route flapping
> or ECMP shifts frequently deliver active TCP packets to an ingress Point
> of Presence (PoP) that lacks the flow's socket state, resulting in abrupt
> connection resets (RST). While protocols like QUIC avoid this using explicit
> Connection IDs, TCP lacks an in-band routing token to help ingress
> nodes identify where a flow actually lives. To address this problem,
> we propose embedding an N-bit data center ID into the lower-order bits
> of the TCP Timestamp option (TSval, RFC 7323), allowing edge load balancers
> to recognize misdirected packets and steer them to the correct origin data
> center holding the active session.
> 
> How it works:
> 
>  - tcp_ts_id_bits (per netns, 0..8, default 0) sets how many low TSval
>    bits are reserved. The millisecond clock is shifted up by that many
>    bits.
>  - A sock_ops program opts a listener in with
>    BPF_SOCK_OPS_TCP_TS_ID_CB_FLAG and is called with
>    BPF_SOCK_OPS_TCP_TS_ID_CB for each SYN, before the SYN-ACK is sent.
>    It sees the SYN and optionally returns the identifier
>  - The identifier and width are stored in the request socket, then in
>    the full and timewait sockets. Incoming TSecr values are decoded
>    before RTT estimation and PAWS use them.
>  - TCP_TS_ID reads back the identifier, and /proc/net/netstat gains
>    TCPTSIdAssigned, TCPTSIdDeclined, TCPTSIdSkipped and
>    TCPTSIdEchoMismatch.
> 
> RTT estimation on the encoding host sees the same decoded timestamps
> as before, so they are unchanged. On the peer, PAWS keeps working too;
> the only effects are a shorter idle limit and a narrower tolerance for
> reordered segments, both described below.
> 
> Scope and limitations:
> 
>  - Passive opens only. SYN cookies, microsecond timestamps and peers
>    without timestamps are left unencoded.
>  - The peer sees a clock running 2^bits times faster. That narrows the
>    real-time span of its PAWS window, so the width should be no larger
>    than the identifiers need.
>  - Peers that keep ts_recent for the RFC 7323 24 days (e.g. FreeBSD,
>    macOS) stall connections that stay idle longer than 24.8/2^bits days
>    (about 37 hours at 4 bits). Linux peers stop enforcing PAWS after
>    TCP_PAWS_WRAP and are unaffected.
>  - TCP_REPAIR cannot restore the identifier, so hosts that migrate
>    established connections should leave the feature off.
> 
> All of this is documented under tcp_ts_id_bits in ip-sysctl.rst. With
> the sysctl at 0 (the default) the only new cost on the established fast
> path is one likely() branch when parsing TSecr.
> 
> Questions for reviewers:
> 
>  1. Is encoding an identifier in the low bits of TSval acceptable in
>     principle, given the trade-offs above?
>  2. If so, what feedback do you have on the implementation?

Don't see any feedback yet, so from the top of my head: looks like you
control two sides of the communication, so why not a custom (bpf) tcp option?
Would you need that on every packet and it makes it expensive?

Or any other field you can abuse maybe? IPv6 Flow label?

Implementation-wise, the sock_ops is going away in favor of bpf_tcp_ops,
so BPF_SOCK_OPS_TCP_TS_ID_CB_FLAG is a no go.
