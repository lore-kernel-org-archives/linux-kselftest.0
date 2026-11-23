Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437216;
	b=KJLfrpk6+polm2p6Fh7WDEZFcyZWeY18swOKxBTyhpnL3INVGgk7dG+cDj0zzZsSHd2y
	 sveH+N2fXQ2g3LjCm/lbxjJSL1eKeF3t6eKkLtk0IekFwWIUF5F7+jXzn8KaYY3Yf3t2K
	 tjJhrSKkiBX3JWkSd7x+CyifaWdPiZPhpqLz7pLiG7feOJmhvbionY+Q1Tj+xVjekiydE
	 wAe42nemH7AZIZuRUFY5gnvN0hEkLA8XnRqTH5tPMiHxVQpJyZH2fsCrl14Bb08RqqVmw
	 jIP8WWcISS39m3d05Ij9mSBgXe7KeS9GPhUR9+neoHCHXvCDXfgXA5d++bKwbGX/u6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437216;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Subject:From:To:Cc:X-Mailer:References:In-Reply-To;
	bh=J0mlNUxeHiFvmURQfRnhNjQjYghLvFoxyIdXO0EVi9E=;
	b=Da6Lrh432dskydw98iRfzcGXpQaDNeYCmt19oEQqAXA4Ee1TB6g7jFCqZCx1mvgX9eTy
	 5cYBTvrR0NW3DAuWqUe2RmECl+NW0aEJ3JIp7L4MZ3ivHlJxYFzwGPKIGUgIsxC9PQoKQ
	 qecNvxQMqxMHlpCoVaRJ4yPUBwtH9pbAJS0LmaEf6XOmn+yAT9Xoty6TRazLppMU7B8+R
	 GU6+760UiuvXPxh0AyxbK2ZF9NCTQ1logiVkfZL0+MLWBlrb1dby1H4bMCMhQgwwertPI
	 xdK2v9LDO6bhUmeE4g0VjeVPAbItjaC2hnqUrbyruL6PZ9pP3k31iAYVnuQfKRUaoxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b7usWCHz;
	arc=none smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EE4606A31A
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 12:33:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51EE4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b7usWCHz
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b4d86f5328so19437937b3.0
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 04:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795437215; x=1796042015; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=J0mlNUxeHiFvmURQfRnhNjQjYghLvFoxyIdXO0EVi9E=;
        b=b7usWCHzIxH06fYfGotrQgPVLAmQ3sWKSBQiYFomKOR1WG9RrYxCgghN5xryJd8aa6
         I7QJq55FrNH2VuK5wByTae3ZvEPs8yxhLG5gaiAM+xYeoGoJNVqDsFy32aUK0AJtpTdq
         D78ot97LeUzcEUkhfyorOUMIj/esXbrJ/wjakWlzrJo0XjhHt4WkexbHjpNCTPX67slJ
         36CKmmhtVcOSioQ6cdNsixq8eqPWaI7iyBZsQOgqX+p4gsgXdWGgbWM/eQNhxwlEWeqn
         V1l6m/NP8B2sMsm759gCJ5b5kr5ikU8Zo0KzFfRJh2dp2rTjXrvw2lUmrdawOpHzwQ/F
         9XXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795437215; x=1796042015;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J0mlNUxeHiFvmURQfRnhNjQjYghLvFoxyIdXO0EVi9E=;
        b=weIDCsSb3TlgOUm3VgpPGXfXoQsyggiCOYNGQmgCwlZJUo5kLSxi4GxHHfdZf952uk
         gr8azibveTyqngCBehUlTf4slv1ate89zPE5azyv9zJAq5ZnXapCP3AfMctqjNA+HwS1
         4iabmdu7d1FnQ2VJexsbSOeI1JWHUpGJZ/WqzN5nGUqeOVdB2YHVo99LYEF8VeuUz62Q
         M90J5qnLf/ZR4Zwr11MrxNFY12nsgxKOy6qAohDbqdGT2xZuF3/OQ9QmPtl2sIt5sIUO
         eiWs5A0Y93Gy3rpfooKx7pNCJ1nx4zoGa2dzu3XhtGB8GCx5MuDY7sRwjHzmKwgafM4q
         T3Nw==
X-Forwarded-Encrypted: i=1; AL+hErHfs5tWNn6aN++M0ElCep4xayNokz2KOtHy+Y0yTuiM5KreQVrIzC8n1hrLyYJEkDvGiEYKlS1t/O4ZRoO7uDA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/p9lPRArfLp04MWN9FtqCldKIhJJxvHvJZzmp1s2hJuAEBHV7L
	eUu0qgMZ5I91eRQYS89Q4ua/KFvN3Mlgm7KALN9yPhPYj3syEoCOL3hx
X-Gm-Gg: AZFdTZcpA37RHsSnt1JDNeaN6f2RIquRTep9Ip1x90nF1fCJqAWx4pdCc/mCK30hcjH
	Sw/8jpOiYPQwwDw6rU36SutCHb7RtLGR3beZl3McuKS5XBS+sDMcxpMJ9g+eux91jpKxzovab1I
	yw5/92EHmRiNumVtfb1iAYaVzm5Bj/4dp6X4pQQyqAUoYjJ5/unSjav8buC9XvVIrcLjNaTweHD
	90C6xMYAxRrYlrb+HQfBcvHBQzQDzllW86zSJm5jaXCIUsJ6c0dueUEPk7qx2toYzQHYRB4RVQ3
	/LU0fFUOw4XnW3ZMi4zdMn2jmRPb1giiw/SClgWi64fQwIKglaqISlu3M/HA41j6yYMcfmUWpWt
	Fu/7TT4/bju+vfcX7o9qc3zVy6Y63Ymr001I2v2yUj6mHIcvEiq6NEFyx+0MSuLZW2WQerFxVRz
	9qrSlmM729bO/ZfsjU0GsMtKfNUdW6ussNRYEuyDHjatFxphRsiai4dqUCet2+213nOwlfOc+Hh
	EUPm5CzG5UhjYBFhZ/T2eo+rIC5B7yeVM/Uuvvwu/30XPWVjC26Jzk4dJ0zp/UTrB2La2wpSkVM
	iZLvMasXeIb8DydWmZz7CGEHeV1NzELOotw=
X-Received: by 2002:a05:690c:610d:b0:8b4:deb1:4b18 with SMTP id 00721157ae682-8b520442309mr48137067b3.18.1795437215079;
        Mon, 23 Nov 2026 04:33:35 -0800 (PST)
Received: from localhost ([2600:1700:4a51:2210::11])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b520ca0cf8sm41807657b3.29.2026.11.23.04.33.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 04:33:34 -0800 (PST)
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
Date: Mon, 23 Nov 2026 07:33:33 -0500
Message-Id: <DN2LDH2V24NL.13URJFKPGO0N@gmail.com>
Subject: Re: [PATCH net-next v5 6/6] selftests: drv-net: psp: add rekey
 tests
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: <netdev-bot+sashiko@kernel.org>, <daniel.zahka@gmail.com>
Cc: <kuba@kernel.org>, <willemdebruijn.kernel@gmail.com>,
 <davem@davemloft.net>, <edumazet@kernel.org>, <pabeni@redhat.com>,
 <horms@kernel.org>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
 <rdunlap@infradead.org>, <donald.hunter@gmail.com>,
 <andrew+netdev@lunn.ch>, <shuah@kernel.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <willemb@google.com>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261118-psp-v5-6-b9ec840e0296@gmail.com>
 <179530218434.3135.4343666486290603431@kernel.org>
In-Reply-To: <179530218434.3135.4343666486290603431@kernel.org>

On Sat Nov 21, 2026 at 6:03 PM EST, netdev-bot+sashiko wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] selftests: drv-net: psp: stale length n in run_session() after
>   tx assoc
>
> --
>
>> diff --git a/tools/testing/selftests/drivers/net/psp_responder.c b/tools=
/testing/selftests/drivers/net/psp_responder.c
>> --- a/tools/testing/selftests/drivers/net/psp_responder.c
>> +++ b/tools/testing/selftests/drivers/net/psp_responder.c
>> @@ -247,6 +354,16 @@ run_session(struct ynl_sock *ys, struct opts *opts,
>>  						fprintf(stderr, "WARN: echo but no data sock\n");
>>  					send_ack(comm_sock);
>>  				}
>> +				if (cmd("rx assoc"))
>> +					handle_rx_assoc(ys, data_sock,
>> +							comm_sock);
>> +				if (cmd_w_msg("tx assoc", struct assoc_msg)) {
>> +					handle_tx_assoc(ys, buf, data_sock,
>> +							comm_sock);
>> +					__consume(sizeof(struct assoc_msg));
>> +				}
>> +				if (cmd("key rotate"))
>> +					handle_key_rotate(ys, opts, comm_sock);
>>  				if (cmd("data close")) {
>>  					if (data_sock >=3D 0) {
>>  						close(data_sock);
>
> [Severity: Medium]
> In run_session(), n is set from off once, before the do/while loop,
> and is never updated. cmd() still tests n >=3D sz and __consume() tests
> n =3D=3D sz. For a single tx assoc message n is 49.
>
> cmd("tx assoc") consumes the 9 byte string and moves the struct
> assoc_msg to buf[0]. __consume(sizeof(struct assoc_msg)) then takes
> the else branch. That leaves off =3D=3D 0, but the 40 byte assoc_msg is
> still in buf[0..39].
>
> The checks that follow in the same iteration (key rotate, data close,
> conn psp, conn clr, exit) still see n =3D=3D 49. They memcmp() buf agains=
t
> the SPI, version and key bytes of a message that was already handled.
> Suppose those bytes match a command string. For example, an SPI of
> 0x65786974 with version 0 reads as "exit\0". The matching __consume()
> then does off -=3D sz starting from zero, and memmove() gets a negative
> length converted to a huge size_t, which crashes the responder.
>
> The conn psp handler already has the same stale-n pattern, but it
> only leaves the two version bytes behind. tx assoc is the first
> command that leaves an arbitrary binary payload at the front of buf.
>
> Would it make sense to have cmd() and __consume() check off rather
> than n, perhaps as a small fix ahead of this patch? Then a command
> could only match bytes that have not been consumed yet.

that probably would make sense, but this is mostly a preexisting
hazard with the demux loop, so it would cost another setup patch, and
the issue is still not actually reachable during test execution. The 4B
SPI would need to alias the string "exit". That won't ever happen.

This would be the only reason to go to a v6 for the series here, so let
me know if you think this is worth it.
