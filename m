Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31EA65616CD
	for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 17:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792000235; cv=none; b=VWhV05J0HFVGfq9KYq7DIStFHi8BQb9EOFQcMqy7fzT0Sn7tD8u+rTlJ+GxG4GQkXC5Z6GQPQYE78F62NV48mR8lGltyRk95joLQ88xcaaHqWW2qt8/z8GTw8ko/+wHMeZmyTnp6cFGrZmSrFWpwm684GFgVcfhSuZw9/rk6gWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792000235; c=relaxed/simple;
	bh=jOEgE+7hZGq23m4Kwf1DaF7fI9X9TN6cpMzxIR01eQE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Iun7Hvu7Juiwru4wR27M0jJy/SL/qWsTlxgm/j2nGs+HDRrWC82+XNCJh228L7kJuu929NH/vWOYm3ePQHD6kb+rvGiCLnM3BQFkaA9rusbquUzgeLwnvzIZc6nfju1jKiF+j4LrnKuSUzLXBoM/Pxj9tnfebeetspb1eggGSYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=Y5QLkfFY; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="Y5QLkfFY"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c3156e7705cso224737566b.1
        for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 10:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1792000231; x=1792605031; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jOEgE+7hZGq23m4Kwf1DaF7fI9X9TN6cpMzxIR01eQE=;
        b=Y5QLkfFYSxuogsDX4uu/tbPvzVjdCeKaqy7iLif0uAul8WBT456ad1lf9GLSP5JRrE
         OXzeKf3uF6vndKe5lsL56e8/Payw2YXccq0GECvDERhQpvQV+PAaVhrwyAK+t0Ziq868
         fWBxvNKsM5q32VCqttcYHUQp+pOHm1cYnq6Mdw5DMiecJ99xer+Pw0zzRYzrdfeS+LcV
         q1dCYm49/w9rToog9UyQVE2hDmcZVGjQ4O8TUKNh7ZEDDD69ZoopuR64Wxfzh8lyb5Ot
         STFCb9Q/QUlaPIlWj9tX2REcR9azHVASrUA3+/W2v65FlYxaChE6tz15YPKE0FAKPLYx
         DQYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792000231; x=1792605031;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jOEgE+7hZGq23m4Kwf1DaF7fI9X9TN6cpMzxIR01eQE=;
        b=hgNu2Jq0Ajn5ZJ5cmcvg/Rb/D8/gmHxupY/0y/jh57HB8NfgzJIENeIkoO0nFgr7Lj
         by2cEXVnapS4pd0USrQUBIPaSSG3nUYdPt3VdnIHbVKdYCacXFxIqoJz3CZ3FuyBECr2
         Tqb8lPDMkaknwr9o5YvUMICJvdTA0jsxucaIG1DduNjIrKXD8GIeTT9adOWm4xY2SImR
         waN1PGx2Ti3p112/r5CxovSgzfax8/2tIuddfU/s5ZLdX3Ln+YmhziTPiiiVKBSvvCju
         XGSaofSpj6v6dgTUAz/4vPJRYzC72Gdo7up2xZP2WLsEZD1xRFeZvXp/h45tSpRTWVL3
         Apjw==
X-Forwarded-Encrypted: i=1; AKwUvByc2UfuiEJyZaadL2aqymgTBWDofJJg4CtSfsVbUlNp04Ahu09JD7LpMz1qWu3HBLzbKcH5L19QgPHw8mFvr6o=@vger.kernel.org
X-Gm-Message-State: AFq9FYLu1nXKv+pK9IfH56jHOnOXCVdG6pxEHSPItnGXrX1+tGYZk46z
	AwWgr+AqVFMchGBneQCf56GCV1od4eFsZ6xeT3kRVmawcLhxofEbatWdqTsAy4UX8kE=
X-Gm-Gg: AYBFou0MzNEwga1XD6D6uSsWrHKK5xx5yADVDUllt9vTwyDj5Fn45NevjT6tqWYr1Ap
	zrz0S/Qxl9rvaD8q+sAZZKkVBhBs8Rbw8DJ5+EYuhf6mpfFroaV2QDrSgk1+Nw7FRjPKSyqI+CW
	zwoqEdLVO04OMBEcpEMYGEcwt6GfxnnzS18g4+5xri7wlsp/+7rSVj/y8Iqp/Bqn9pwPv0pLCF0
	uEFk2XzZdSwa4EpBPnnjw38EJ2Z3C86UPJaKlEbUlRUQYKctByYERRq91dN4wBLSRhC4/FRQKr8
	qmuN/1nIilgVXi+SENz1dQ8iJXoDNAHkoV5G26PNSxI7q0hj+UsUjV7YN4ROyAvWgZXpIsXqb6g
	GyvNtEZr/Rp8qOwyMfj7iMhK2GxRi/OL7Ef3n+rVn3az6lB2nQlQKZswqtg1BiZuNaQ8cuhZdDk
	jbLQW6u2jJNEgMTM4yUnJBBW6jHzBuXUy49sk0Ofsr2ToozfRDItt9aTDy2UPX
X-Received: by 2002:a17:906:f59f:b0:c2e:4b90:3c56 with SMTP id a640c23a62f3a-c31a9fcf0c2mr1509659066b.13.1792000231355;
        Wed, 14 Oct 2026 10:50:31 -0700 (PDT)
Received: from cloudflare.com ([2a09:bac6:5067:2dc::49:1e5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3eda433582sm10353666b.64.2026.10.14.10.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:50:30 -0700 (PDT)
From: Jakub Sitnicki <jakub@cloudflare.com>
To: Willem Ferguson <wferguson@cloudflare.com>
Cc: netdev@vger.kernel.org,  davem@davemloft.net,  edumazet@kernel.org,
  kuba@kernel.org,  pabeni@redhat.com,  ncardwell@google.com,
  bpf@vger.kernel.org,  ast@kernel.org,  daniel@iogearbox.net,
  andrii@kernel.org,  eddyz87@gmail.com,  memxor@gmail.com,
  linux-doc@vger.kernel.org,  corbet@lwn.net,
  linux-kselftest@vger.kernel.org,  shuah@kernel.org,
  linux-kernel@vger.kernel.org,  kernel-team@cloudflare.com
Subject: Re: [RFC PATCH net-next 2/4] tcp: add BPF_SOCK_OPS_TCP_TS_ID_CB to
 assign a TSval identifier
In-Reply-To: <20261013103906.2660384-3-wferguson@cloudflare.com> (Willem
	Ferguson's message of "Tue, 13 Oct 2026 10:39:04 +0000")
References: <20261013103906.2660384-1-wferguson@cloudflare.com>
	<20261013103906.2660384-3-wferguson@cloudflare.com>
User-Agent: mu4e 1.14.1; emacs 30.2
Date: Wed, 14 Oct 2026 19:50:29 +0200
Message-ID: <877bjk893u.fsf@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Oct 13, 2026 at 10:39 AM GMT, Willem Ferguson wrote:
> Let a sock_ops program pick the identifier that the previous patch
> encodes in the low bits of TSval, for passively opened connections.
>
> The width is set per network namespace by the new tcp_ts_id_bits sysctl
> (0 to 8, default 0). A listener opts in by setting
> BPF_SOCK_OPS_TCP_TS_ID_CB_FLAG, typically from BPF_SOCK_OPS_TCP_LISTEN_CB.
> tcp_conn_request() then runs BPF_SOCK_OPS_TCP_TS_ID_CB once the request
> socket exists and before the SYN-ACK is built, so the SYN-ACK already
> carries the identifier. The program sees the request socket, the SYN
> (bpf_load_hdr_opt() works on it) and the available width in args[1]. A
> reply that fits in that width is stored with the width in the request
> socket and is inherited by the child, including Fast Open children; any
> other reply leaves the connection unencoded.
>
> The callback is not run for SYN cookies, which have nowhere to keep the
> identifier, or when the peer did not negotiate timestamps. It is skipped
> for connections using microsecond timestamps and while the sysctl is 0.
> The width is captured per connection, so changing the sysctl does not
> affect existing connections.
>
> New /proc/net/netstat counters report how often an identifier was
> assigned, declined by the program or skipped. TCPTSIdEchoMismatch counts
> third ACKs whose TSecr no longer carries the identifier, which shows the
> echo was rewritten in flight.
>
> BPF_SOCK_OPS_ALL_CB_FLAGS grows from 0x7f to 0xff. The tcpbpf selftest
> used 0x80 as an example of an unsupported flag, so move it to 0x100.
>
> Encoding makes the timestamp clock appear 2^bits times faster to the
> peer. That shrinks the real-time span of the peer's PAWS window, and
> peers that keep ts_recent for the RFC 7323 24 days stall connections
> idle for longer than 24.8/2^bits days. ip-sysctl.rst documents both,
> along with the lack of TCP_REPAIR support.
>
> Signed-off-by: Willem Ferguson <wferguson@cloudflare.com>
> ---

I think SOCK_OPS are considered legacy.
We probably want bpf_tcp_ops struct_ops.
See [1] for an example.

[1] https://lore.kernel.org/all/20261006192601.1875100-11-kuniyu@google.com/
