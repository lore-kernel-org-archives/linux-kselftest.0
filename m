Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E435226D4CA
	for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 12:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792066401; cv=pass; b=UhglIwBfK9LgnpCFMU4crqGcU28QekpOOoBcN51BiJ0FbzmTKM7vkbwXrytOdRm+g/lDnG/caOoT4SpOavx6bFhBlcsXLb3F2HBXBcEOE9Ufn/xBuwp8GAO4BnWeSMfz2QFU8fp9t/osCmQ11Qhc4qy66RSGcHTQqnzo3CCSp0U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792066401; c=relaxed/simple;
	bh=PfWD4VpdWtdSjVgCMYbGy7PflI7LLghvMi+QrsP2eAY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n1d8PiRfhZwNoVWrYncit1QMC7ffX8RV6SmKFvTiNVKRH8mWZbdOv1ijZC/c3xZY7KKlZthImW/mM+KTWrRZJ0IZO+09lYas7gAOE11ksLzcDvH7zzNLaciI8xMMHWuL6Z5IizWNUn2bllmq9A02ZjumWTz8w0nV/4qmrPJ1w9U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MFUv0rFw; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MFUv0rFw"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b8b3c8c4bbso2304968e87.0
        for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 05:13:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792066397; cv=none;
        d=google.com; s=arc-20260327;
        b=Ri8ZgfRZmXldKb6i8Yr2FU2yIFErNgLRruMaKFu+LBvLJ2NqWYSQu1ouMZDhbYx0sI
         WyrMOhJSBY/mMSU/3kdZF4aEWNtffty3j7/sdaD/jDBPdv2Tvt6Vfh6x9JiZD5KWMjwH
         /0ERs0TfbHRdg4Ia9mEyMZyTqkgCQWkVWAij/mSlY7PaUqRNjR1fajRdS2TATWL1+qrq
         aHZ9Jh/qCSMQIpMM0aCA8Qd4b27qldAHtteJX3vz/5reYZ7xE5wzO6JFtD36OXqLn/wp
         1XrSMQ2H00af9T4DfTGfHBIc+9JKGSeoRgeIWbU2tC7uPEPvD9B4+vH0mVArC2JYZheA
         SbbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PfWD4VpdWtdSjVgCMYbGy7PflI7LLghvMi+QrsP2eAY=;
        fh=E28tyhDs6o6V4uLwwaQxg0bcJe97uaIyCtfS2cRHlks=;
        b=kK7/uUC3gKK58zlqZGhDij5DlnKExN7oUNpKN/b1oXCz5iUqx6xEW16drM+VKV6poF
         XRsYvI7CfOLcYqvS+rQsdm82GBY+g5PvW4vaaxWqmQyFGRUC+1WlVFGo+y/RmRyxO3eK
         qWO+GiWYZdspJSIvVCvDtF7FvV6VW14+XT4zazmPL6+6LlFIIMPTsok7fPgGMpV9nw5X
         AM8wT4Aa2YFOtzuhi+r/+zbzR92t0tj60cemwzZIGXWkB9f2XKm2S7WwkmdzkSJn97SL
         hBQvKmegmJGe7Sm4R943ysGY8cIrqs2SzY3uc6a36AzSVRIk/3NNjUJCfATx3QJiZLNL
         s9Aw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792066397; x=1792671197; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PfWD4VpdWtdSjVgCMYbGy7PflI7LLghvMi+QrsP2eAY=;
        b=MFUv0rFwkY46TMBt7X8wNlMgYfH2YjM20arVDogzgWTSRu/Y6LyM+DTrbXsuUU4IIM
         KMefd9j1ptRsfqlo0pBgpWwYnuwS7fgCGXKEckghBS+1MbY5V0k43XFCPQfNBRIo7rqn
         7ogA4wk4yI3JLiTiW/wgvj+yXuLzs7al5YO7pu1bm4MGoB+M3Ehh8qJsKATWAJkHuduv
         PK7Sw7a+CUJ3u0rQgaaMXwZoRqciyvgFJdV9v6dr96LtRVBOr1510olmTRyInjU3Gj5i
         ycB+cHUT0QzW4clXhHZ1Tr619ClxvRi78UB0NIs+BHrDyy9A1FwE0I9Iucm1YJ3qhBiM
         Q9vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792066397; x=1792671197;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PfWD4VpdWtdSjVgCMYbGy7PflI7LLghvMi+QrsP2eAY=;
        b=ePazIV8Q9yfeXOKCLEysPfD7tGRCbMjsNZv1NyoN6eswIuTpqsBqr5N1SiCgSSxp+L
         2FmdqiMqoFgoSpdNnCxrlw4dvV3WL5VzZnJLjOyEYIJ42vzGMulYlQby2rxmdVkOe+4H
         bVCQBGsS9IXILuLYh28MiEMj53SC9bU0Po2Bxm15c0arGzw9bzia0jE9M1SIJl+oGZ75
         uhVLCvzTQwnRomkoeF6KCL8Vcv67A22SzqLdgw9zl8lmk+ZDncdKJ7evXdyxSgRYPqye
         UaiP0YxrzkefpMOR+127CKNP/Y0rJfBSpt7cx408jUiO53Rd/OPWGKsveKifzkhCwJ0k
         BgQg==
X-Forwarded-Encrypted: i=1; AKwUvByv4nU4m0DvYmZqs9nA0L1Eg9cZjXU2eb3JtYgBi5csMJdrJcacD6kVJSHVRZRtQ3JyF7BIYnFv7cJLcu+qivI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLflOwTJrz7SP5bR+UfbTIblAA+fSwKnODXUkwBTn4NYeQp1Jys
	AcNTHxXaQWQ+iLdQa2gwpEtlRXPF0Lre0nEEfKU9XqbxYbSuxIFfrnKzpSO/1eaaSB3kmXuUAE2
	RRF7Uukz6PdYStJqqdSzuNqrm7dBEVCI=
X-Gm-Gg: AYBFou1dQ0WE20RuykOiHQnidiahNzCVJRn5hA/iqtMTvb/9ophoEseBEmiFTz0/66a
	kqPbcHh9xIxSqmdw9kizoNhdEIPEEK2Bg64VIV3SzPJilWvL83KNSo6KBfMtq8D2vAV4fa11X4z
	tXQw+ueaK6F10omUXvLNucnqnPvellTWg6BbU6CmQHE0e8TuybcwmwMQnCG/dwjcbyla7RWpB28
	UfZs0bCaM10yqun356lKHXQoltujpKpGrQW4RCsPY+/FW26eiqNDE7NizleJpWu/TrX672WtF72
	/GARVlqC5Peo/hYcCIGCRNIWs6HHz1idAX+nXjdrXQUhi6+DxQ4fzzvtCR424ir8eSxcbjs8cT6
	proP9XngbTYyvc9SAvUXFcxSyjziRYe3S5WaoJefqLgWf0g4yehbXTPBMTijh+PGKW8iMDw==
X-Received: by 2002:a05:6512:b1c:b0:5b8:e9cf:daa6 with SMTP id
 2adb3069b0e04-5bcdd4f080cmr6853474e87.10.1792066396625; Thu, 15 Oct 2026
 05:13:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013103906.2660384-1-wferguson@cloudflare.com>
 <20261013103906.2660384-3-wferguson@cloudflare.com> <877bjk893u.fsf@cloudflare.com>
In-Reply-To: <877bjk893u.fsf@cloudflare.com>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Thu, 15 Oct 2026 20:12:39 +0800
X-Gm-Features: AclHuK9xypnzrrqwCcprd2CwQO7kzSIQ141D-bgf0CuqS7x-S8jo7RzifyoP-go
Message-ID: <CAL+tcoBjfDEVGvvSXZHkiMjq5jat+5OJE-7uJr3MvtFyzn+KUg@mail.gmail.com>
Subject: Re: [RFC PATCH net-next 2/4] tcp: add BPF_SOCK_OPS_TCP_TS_ID_CB to
 assign a TSval identifier
To: Jakub Sitnicki <jakub@cloudflare.com>
Cc: Willem Ferguson <wferguson@cloudflare.com>, netdev@vger.kernel.org, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, ncardwell@google.com, 
	bpf@vger.kernel.org, ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	eddyz87@gmail.com, memxor@gmail.com, linux-doc@vger.kernel.org, 
	corbet@lwn.net, linux-kselftest@vger.kernel.org, shuah@kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@cloudflare.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 1:51=E2=80=AFAM Jakub Sitnicki <jakub@cloudflare.co=
m> wrote:
>
> On Tue, Oct 13, 2026 at 10:39 AM GMT, Willem Ferguson wrote:
> > Let a sock_ops program pick the identifier that the previous patch
> > encodes in the low bits of TSval, for passively opened connections.
> >
> > The width is set per network namespace by the new tcp_ts_id_bits sysctl
> > (0 to 8, default 0). A listener opts in by setting
> > BPF_SOCK_OPS_TCP_TS_ID_CB_FLAG, typically from BPF_SOCK_OPS_TCP_LISTEN_=
CB.
> > tcp_conn_request() then runs BPF_SOCK_OPS_TCP_TS_ID_CB once the request
> > socket exists and before the SYN-ACK is built, so the SYN-ACK already
> > carries the identifier. The program sees the request socket, the SYN
> > (bpf_load_hdr_opt() works on it) and the available width in args[1]. A
> > reply that fits in that width is stored with the width in the request
> > socket and is inherited by the child, including Fast Open children; any
> > other reply leaves the connection unencoded.
> >
> > The callback is not run for SYN cookies, which have nowhere to keep the
> > identifier, or when the peer did not negotiate timestamps. It is skippe=
d
> > for connections using microsecond timestamps and while the sysctl is 0.
> > The width is captured per connection, so changing the sysctl does not
> > affect existing connections.
> >
> > New /proc/net/netstat counters report how often an identifier was
> > assigned, declined by the program or skipped. TCPTSIdEchoMismatch count=
s
> > third ACKs whose TSecr no longer carries the identifier, which shows th=
e
> > echo was rewritten in flight.
> >
> > BPF_SOCK_OPS_ALL_CB_FLAGS grows from 0x7f to 0xff. The tcpbpf selftest
> > used 0x80 as an example of an unsupported flag, so move it to 0x100.
> >
> > Encoding makes the timestamp clock appear 2^bits times faster to the
> > peer. That shrinks the real-time span of the peer's PAWS window, and
> > peers that keep ts_recent for the RFC 7323 24 days stall connections
> > idle for longer than 24.8/2^bits days. ip-sysctl.rst documents both,
> > along with the lack of TCP_REPAIR support.
> >
> > Signed-off-by: Willem Ferguson <wferguson@cloudflare.com>
> > ---
>
> I think SOCK_OPS are considered legacy.
> We probably want bpf_tcp_ops struct_ops.
> See [1] for an example.
>
> [1] https://lore.kernel.org/all/20261006192601.1875100-11-kuniyu@google.c=
om/
>

Exactly!

Thanks,
Jason
