Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A543E51DB
	for <linux-kselftest@vger.kernel.org>; Mon,  8 Jun 2026 20:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780948942; cv=none; b=EoFNjVC5AHadRDdr8+oaDD7PiYSN1kMPclJl/gs+oBpLwj7Zu7xaebRYc6ha1/UEpI1jntw9wKe7ueWz3swcdT+ai7RdRQTS1FJo0WjTMMA8w6ToO/eUmiqhs4/DAhfF8fPK57C+5yw4P9OzaZ8/uoIaJ1O5h6b0YiE8BqApWCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780948942; c=relaxed/simple;
	bh=wrqE2O76YCV8wdY1YPpUUnMYdTSt/lGtjLT9N9f7KaA=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=XWFaDkFokTO5UeZscS050r2xlgLLQ/GNvCtGh9pHeRAkb7qJ6w79UQS6Jn2rpz8fYbFF5bCGHbmEVR7ejxaD/jT+6IInZ8kpmXKdISQfCUWvDOq7yf5KomBf3CmcuS9tifjRgl3D/+TBn/xAHt/BRkrIRmvHDEcKt3jfuYRpDI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JaGM42CN; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JaGM42CN"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7e6e41cf7aeso2799623a34.0
        for <linux-kselftest@vger.kernel.org>; Mon, 08 Jun 2026 13:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780948940; x=1781553740; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pwrxcif3XUtEKF7lrhb7eyL0FpVd3GzB9U/X8qwd09o=;
        b=JaGM42CND++GVCO/APZTAt8fet5/AfRQBUcUWxHYxHHqZInMxKQbF6OT3FmXDjtx6i
         ozM356muRW6wHE7nxLSzn0SpJLwzCmam74OffTWA0QxKNXp2uBjvUKkWZHa5Qn2qSMvL
         LUMkkAtJm/hr/K3MutMWwkwk9vP0EL8d053cguGLhQO+eWhd9DcMNR1Mp9om4+fpp3Ne
         R6SlRzNODEgUPxSoeYrLPmWT5FDBkX33xxLwNapI3/HMCNc2SEWNQmWHBOZPmRQYpqpp
         +PAbwSpx/A6u4EDuoiFZcwRcVVsnSb9x8xXTMxRMeUutezTmyBN38WGw74RGHhb8To9j
         5amQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780948940; x=1781553740;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pwrxcif3XUtEKF7lrhb7eyL0FpVd3GzB9U/X8qwd09o=;
        b=a+6l65VBC/yhrS3DEcvXyLtHEQnCIKMDHNEosr9JJh7orBOMJE83hckWKl8UTyhbR7
         hHHoMS5Ry17/tu7ff7ZQQyjgNAM5CgJ9ibXKCsvMX/efuEFQbfBwXX/7Ms6krQ8BqP4N
         HsvSIjo+3wuT7Fnpnsq0yT/1hBQOaBjTiaFv7PYHrnuY3QJgKxwg79D9TJe/IwQ/tLHk
         BPwFitfeLQOJIEkPlJECFDYbWZdQlNRwtoMH5p3OXVFSxh0rHq6MspUWJIpLGCvb5paI
         NkWPJ0MCXuJUWxg3RFv4UcC7OXKJ2Qmy7nztTNZ2txqQ+f7qj72MN+sgCotjJmb/vXRa
         amsA==
X-Forwarded-Encrypted: i=1; AFNElJ+JRgtu99w9jo7s2xY51oW2VKBYhEazsbtL1/9+Edg9plV4JY+Mp3TitQPLdx7hU/G0OZtXjAQT1n+X+20CZCI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3MIG1iiN4ImpDGjC4FmtW1HxgXsUd0TXgaU39Iw06q5y6OiEO
	S+M1d1HjSr9Ai/5vvuHPv7QM8arFkurHNFgVUyt3lCnW7VpYpwGuHxhn
X-Gm-Gg: Acq92OGmIsTcXP/htAmqrxeFjgAKT6tTHbN0i/GiSNn84KhryAZN51duMnZu3ts7lcj
	0MeuLk6DHK2eUp1oIq8wUB20vP5DoEvGifWy7YI/M8SUoejm7sTQlQ9inOWYc3iWydHCJh4bVNA
	knhXy/APdhxOUGIJefLMrxh9nXW/DJbwCaFHltQ/MMhOopaGdnUNw3JY1fRSNPnCw16k6N3Uros
	wRU3LxatS2JH/5qJ3TJ/8FihPOZH3hnp+X9GwHtjOn0O/sc/six9CeWiNA29KAdf6H151aQyDRT
	DF2NOvJ6yqETO4KWCtj/OpuKOaPnInSpIY7/1mBO1uTKfNFhk6vJxqwbAFy2OTCAR8FkgMUamIF
	THsnRDXXFR2OePH9qWYX3qojKftjMJGptCbH03JUthvIbuc/g+TMdGz43l7YAStYAeZkYkstRfH
	BdJz4hKoVPKwkdIyMIxMWrz2c77J1V1uiC0w7kR49PiMFvKpIVlnqwWBOJP7q/XKU6RJzo55d2r
	pqNotrIbSJzKbwN6k4Co7tla15d8K5jtD+qEoI=
X-Received: by 2002:a05:6830:902:b0:7dc:dd19:7f53 with SMTP id 46e09a7af769-7e70c7906d4mr9896252a34.14.1780948940066;
        Mon, 08 Jun 2026 13:02:20 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:5c::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e6e7923af1sm13046364a34.20.2026.06.08.13.02.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 13:02:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 08 Jun 2026 13:02:17 -0700
Message-Id: <DJ3XPJA746S5.NYKZWY1HBH8O@gmail.com>
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Kuniyuki Iwashima" <kuniyu@google.com>, "Jiayuan Chen"
 <jiayuan.chen@linux.dev>, "Alexei Starovoitov" <ast@kernel.org>
Cc: <bpf@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, "Simon Horman" <horms@kernel.org>, "Willem de
 Bruijn" <willemdebruijn.kernel@gmail.com>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Martin
 KaFai Lau" <martin.lau@linux.dev>, "Eduard Zingerman" <eddyz87@gmail.com>,
 "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>,
 "Shuah Khan" <shuah@kernel.org>, "Joe Stringer" <joe@wand.net.nz>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH bpf v8 1/2] net: Validate protocol in skb_steal_sock()
 for BPF-assigned sockets
X-Mailer: aerc
References: <20260608125846.157004-1-jiayuan.chen@linux.dev>
 <20260608125846.157004-2-jiayuan.chen@linux.dev>
 <CAAVpQUDZoEVEX1kXok-29dzVHk=ZK_2MkZyZY8kRHCJCfAWVFg@mail.gmail.com>
In-Reply-To: <CAAVpQUDZoEVEX1kXok-29dzVHk=ZK_2MkZyZY8kRHCJCfAWVFg@mail.gmail.com>

On Mon Jun 8, 2026 at 10:21 AM PDT, Kuniyuki Iwashima wrote:
> On Mon, Jun 8, 2026 at 5:59=E2=80=AFAM Jiayuan Chen <jiayuan.chen@linux.d=
ev> wrote:
>>
>> bpf_sk_assign_tcp_reqsk() can assign a TCP reqsk to a non-TCP skb,
>> causing a panic when the skb enters the wrong L4 receive path [1].
>> An initial attempt tried to fix this in the BPF helper by checking
>> iph->protocol, but Sashiko [2] revealed that BPF programs can bypass
>> this check via a TOCTOU attack by modifying iph->protocol around the
>> call:
>>
>>     iph->protocol =3D IPPROTO_TCP;
>>     bpf_sk_assign_tcp_reqsk(udp_skb, tcp_sk);
>>     iph->protocol =3D IPPROTO_UDP;
>>
>> Furthermore, bpf_sk_assign() has had the same class of vulnerability
>> since its introduction =E2=80=94 it can assign any socket type to any sk=
b
>> without protocol validation.  Since the BPF helper check alone cannot
>> prevent a malicious BPF program from crashing the kernel, add protocol
>
> I'm curious about the BPF maintainers' stance on this kind of "bug"
> where admin tries to shoot oneself in the foot.
>
> I saw Alexei said this recently, and I guess it applies here as well ?
> https://lore.kernel.org/bpf/CAADnVQLh7VEKAtckzz=3DXOVPT8ovpDQshvPPCWHDQu2=
OWQx27_w@mail.gmail.com/
>
> ---8<---
> Not every "bug" needs a fix.
> If a malicious bpf user wants to crash the kernel they will
> find a way to do so. Especially with agents.
> We cannot realistically close all of the holes.
> Right now the priority is to fix the issues that normal
> users can hit and not bots.
> ---8<---

In addition to that I have to add that skb_steal_sock() is performance
critical path of networking stack. Adding runtime overheard there
because bots can find a way to abuse the interfaces is not a good trade off=
.
If there is no simple way to fix it completely on the bpf side
then we have to flag this issue as "won't fix" and move on.

