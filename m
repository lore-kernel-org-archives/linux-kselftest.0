Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794416482;
	b=RY+g3aLbRshBUVMaP7aX52dHD0omZOhNOW8GEreXxfR02LcJM3QOEyAeI3v1uQwFhCdz
	 kPTU/flyV1rN99Abdkn05gG6cBAvtxJC/+wQOvQ5R4EH1brFjGmRMhJkLPJdEtoQ6Ppk4
	 Cm1Ti1THGGONz2G01B0mQNLwFkou5Is2Vx3Zp/QEJmUvYwanvc9UlPNjR20v3LoRWpq4q
	 sYK05kYtOu8Gd6JabtXmOEZhFbsqtMTnHVVl3nZba2q9o/jxL6cIhxknCPkNIhv/bVyAL
	 Su18dmvj6Obj7aiTwbQngAXwLK6s90oQjwmloAXDEuBYWzmgwN2havqjQHfPgttpN4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=cNJr3c3uqZZVhSfWEr07FcVM+B83XjBK0ipGpurD8/w=;
	b=rIBIbU4vbt1wshzjd3zx+yZvaa/7gGK8djp5WdJZebnPmpKdw6GxAoDfmk4tFmX6YXlr
	 0feJ93+Q2R7BSZQiXSS/p7q/DO6BnEtLGlsGt88dED+q/Ltp1kAf/R0mbSeHxl8bgya8X
	 M8GDzwLkoOnjGtdoOSpvWbTHU+WaD2qWiaCmH+UreOTgxjkOeJXfMdSXZU73jOnanH8k9
	 1d8O5k5kboOAj8/BkeX5/+F+Rb5dmSgtZ+6UNrLBuuLBTUzs9/PxMmYXAz2LDM63g2LUU
	 chgs04gxD6KgvAbQuBoD856TlVGj++Qt39y16gCqEhwR0y4b7D448+jipqPh03Y7AcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eV24wG6k;
	arc=none smtp.remote-ip=209.85.222.53
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EDE606A31C
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 17:01:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54EDE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eV24wG6k
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-9912c47367cso19765241.1
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 09:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794416481; x=1795021281; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cNJr3c3uqZZVhSfWEr07FcVM+B83XjBK0ipGpurD8/w=;
        b=eV24wG6kUDKl/1BRzugsFu4O6Q8IMvuBMVX/hw3IwA8m/Qdq9KxFfGNdIwU/1eK/S/
         ryB9W0aiepskzNkxFtuLuS1B8mDbwU0HwpPUMSHmC1vGEAs3AcwgrIuW2dj/HE+iOpfC
         c2D/uE7ouHDAkBbJKtQh2hwdmG3Kxw5BCw6dYMAOxlPArZVX8CZnIRFqD41fzK06ZI1q
         GThZ1b4wU1om1c6zeGKhdtmLDrJKAvlzi1ckauC5O0yIfDFOTVBPJyXqT0g4guj/7j90
         CH18VtYry2bKaO8SsBtHxaYYhBDJn51m9CKVYwR7LJa5RW9yCa7mGQnRL7KBGekkvjZ2
         vXMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794416481; x=1795021281;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cNJr3c3uqZZVhSfWEr07FcVM+B83XjBK0ipGpurD8/w=;
        b=lpumYRx8EHDOg+rXyJ9TFMh91nZS/IjRhC8aI6hk3N8hxYB8P7h3AXQyLpTHB7FT3i
         x5KtLFesToQtNO1teg8vFj6LBi0Jl5Si84D7ZtFpXMjRhSptAnljgqWYTRxfQR7p9mnK
         BU8HeqdghzGESj441F4NWHiBbPqSMrw+gH+3SdXoBU5ZmMeQglV2S4z7qfEgtdH5xq9q
         DGgtPNd3hPnkQdCIwl4/3H8Mjxzsv6+88xrGChY5OKoNng33/DS0LdDW4dA+xqZoWTQr
         ub+tmkWzA4uJDKZ6H6/DaO5Heigrw1ZsgUCwG6al/boTO1Fwz4Dp9+biRI9mDqupiZH4
         WH+g==
X-Forwarded-Encrypted: i=1; AL+hErEUbVO3Mhsf1y7Oq1EUTwkW0OjAMYd1Fd0m7QV/Psm6XfuRuq7FuQAS/N7QE7yaBfD3HGqjVVQ1OuAzJ4HDfKc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AKner5BDTvTi+E0HUQzolc05+RMSNGgu3tcLyQQ0gmUxlradp
	1yN/8HZm45aCwLU1jJEQJv/AvnxcIG7nynvr1yx5L+GPI3/Lb9ct6dKT
X-Gm-Gg: AYBFou2QVR60JPvmStr+8W14rqqZ0xupme5Da8d4kF+ir30Tj0qBCLd8zwwLH5eargX
	XLeGG1gw4ePYJn7qyRG2drRKN5tTFujShb7lwUx2AmSI18npXE6dcwSGaUz5KrUt+H6q5QDOzXX
	IVwCyRjxNC3qtNmlObzy/JzFAwGlcBPL6lTIJYNDxL6HQ5O7z/qZRNjfHchZF0ZapKK7JvW4qDd
	Q70tEtVJbXED+V/xRD0Nq6BYmuXnFO3g+N1ny0QAiBX9dobQuCqq42gnTEXK1XOlJopW8dDVWA3
	4CjD605N5j/fxvG+nQbULTARdr9kBz8RlGB/NzlmUnXaZScYEopE4AV5sgdBSlBJ2blzCtgfEyi
	F5C/mxHWGBw5nqhpXX4WTkSOUdARJvFMd2zVzz8tVMzKelpOAbK3q0PcPHJgRm42JraXXgPXsxo
	HmVrdEWzKIk/3Avx4iBHQ94S95E9iWtPTFLS7zwJHJl2JXO+SJH/TydtoVYgzzGvzgA5k0uwQMn
	mWrmPVM4Qfwf2qKLs25DXyNVUQdT7eIAPcYW0hyZqGOiGu7rXF4Q53JSEAq/0wiK/gE9yT5gI6C
	9lT5/XcXspB9hK2X
X-Received: by 2002:a05:6102:a4d:b0:7cc:905a:331a with SMTP id ada2fe7eead31-7d6316c856dmr19138137.14.1794416481052;
        Wed, 11 Nov 2026 09:01:21 -0800 (PST)
Received: from localhost ([2620:10d:c091:500::6:868a])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d302239188sm4078178137.2.2026.11.11.09.01.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 09:01:20 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Nov 2026 12:01:19 -0500
Message-Id: <DMSJJY9PLHSR.39PSNUXEC82J4@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, "Andrew Lunn"
 <andrew+netdev@lunn.ch>, =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?=
 <bjorn@kernel.org>, <bpf@vger.kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Daniel Zahka" <daniel.zahka@gmail.com>, "Donald
 Hunter" <donald.hunter@gmail.com>, "Eric Dumazet" <edumazet@kernel.org>,
 "Jakub Kicinski" <kuba@kernel.org>, "Jamal Hadi Salim" <jhs@mojatatu.com>,
 "Jiri Pirko" <jiri@resnulli.us>, "John Fastabend"
 <john.fastabend@gmail.com>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-rdma@vger.kernel.org>, "Martin KaFai Lau" <martin.lau@linux.dev>,
 "Paolo Abeni" <pabeni@redhat.com>, "Saeed Mahameed" <saeedm@nvidia.com>,
 "Simon Horman" <horms@kernel.org>, "Tariq Toukan" <tariqt@nvidia.com>, "Wei
 Wang" <weiwan@google.com>, "Willem de Bruijn"
 <willemdebruijn.kernel@gmail.com>
Subject: Re: [PATCH net-next v1 00/15] psp: introduce socket-less
 associations
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: "Todd Freed" <toddfreed@meta.com>, <netdev@vger.kernel.org>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261111005533.6436-1-toddfreed@meta.com>
In-Reply-To: <20261111005533.6436-1-toddfreed@meta.com>

On Tue Nov 10, 2026 at 7:55 PM EST, Todd Freed wrote:
> psp associations today are bound to a tcp socket when created. traffic
> on that socket is encapsulated in transport-mode psp, and encrypted.
>

You can start sentences with capital letters in cover letters and commit
messages.

> this series adds associations which aren't bound to a socket, which
> allows psp encapsulation and encryption to be applied to forwarded
> traffic. you can use this to transparently apply psp tunnels to flows,
> with help from userspace to manage the tc rules and orchestrate key
> exchange.
>
> the lifecycle of socket-less associations is managed over the psp
> netlink family. socket-less associations are stored in a small registry,
> and are addressable by id. the registry does not contain socket
> associations.
>
> socket-less associations are on the device's association lists, like
> socket associations. rx ones are therefore marked stale by key rotation
> in the same way. in this series, nothing acts on socket-less rx
> associations on key rotation. instead, userspace should replace decap
> rules for a SPI before its device key has been rotated twice. a
> follow-up will bring enforcement.
>
> series structure,
>
> 1, 2/ prepares psp to work with non-tcp packets
>
> 3, 4/ adds the netlink commands for managing socket-less associations
>
> 5/ adds a METADATA_PSP dst which carries the socket-less psp association
> on an skb for tx, and the transmit checks for it
>
> 6, 7/ keep mirred and bpf from sending decrypted skbs from egress to
> ingress, since skb->decrypted depends on direction
>
> 8/ limit time-wait psp socket validator to sockets actually in
> time-wait. the new psp actions check for presence of the validator
>
> 9/ adds the act_psp tc actions, psp encap and psp decap. in software,
> encap is egress only.=20
>
> 10/ adds flower matches on psp header fields, for rx matching
>
> 11, 12/ add drv-net tests (netdevsim and hardware)
>
> 13/ makes tc-testing run dependsOn probes outside the test namespace,
> where they currently always fail
>
> 14/ adds tc-testing tests
>
> 15/ Documentation for socket-less psp associations
>

Some of these can probably stand alone like the bpf decrypted, psp encap
helper, and timewait validation, and be submitted first to shorten the
series. That's just a suggestion though. If there are dependencies on
the main series you can ignore.
