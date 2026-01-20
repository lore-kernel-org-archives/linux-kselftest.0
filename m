Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C1440759F
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Jan 2026 10:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768905663; cv=pass; b=MyIEcqruPkiaA+Id8oZe80Pqijd9rQ1+BAAfTynUIKbxG/D9jWe9KXFaQ1v50qnFhYRITYYYxSE80LoxPIWkn9Lxq9tXpDCmwYHVXcbA8i2cGJmjdbIJXeBzv9trRlNBh5MxKL2zM3zC06/FUVHOPDB+3tWO2juOp0DyB6Btahs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768905663; c=relaxed/simple;
	bh=FFii1bsKXobctKhMNLtq5d1Ip3RYu1nQ6MH14Bs+3t8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O1lkHn94stmr0lv5jI4BYjden3+KnDHpD2r8dO1m+Faa8pWY4eC/cEufOe+rLU0TUV/VeTZmqFPnKQvjMnBPltssOQc7Rl/Je2nHpUNef7MDtgDZHNOXNX5AW3ap66XOeULfbgb+xBoH8ZCNynfmxX51f9Cu6FRihsYa3bTMRjg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bLarUOM4; arc=pass smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bLarUOM4"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8c5265d06c3so618050085a.1
        for <linux-kselftest@vger.kernel.org>; Tue, 20 Jan 2026 02:41:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768905660; cv=none;
        d=google.com; s=arc-20240605;
        b=RbvGQv7bgIvk4U1Kv0nB0EV65SE/Z2Zq4yWN6lmLvNJTZnoNq0jN7AcX2U0M0gpvcJ
         chnoDr+nZdR97nAne1lfWiI7kIMqUvinLtBmBz5ZUu1y4oGW52EqMJ9GyiuJSbb9czEV
         MIn/9d53fSFii+fchtqy9yoy0PgjbEYsAaxgh5vrhhQhA61EAEWTlY3nBnXbhMjo3Bd8
         dhv6SgyuHUWofXFmceLfKfkFbh6/KmcJS5pe/WLPspBaxsMxoC5Ze2yROel8npHgkBUV
         SJvTFAZwXNBtZR3h9oBcCLDB1C9UkGQNUbR3nOrbaC4hnR43FSSDFtwBxZEimB5UklsV
         09qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FFii1bsKXobctKhMNLtq5d1Ip3RYu1nQ6MH14Bs+3t8=;
        fh=x3uSGfCN7wo0CqdgNRSffvrI54ZYe7cObBbr2AQDWCw=;
        b=HETsRhZZZzVzcGLJt3fjV6eFSiWr8ZLLzaukWRmOY3wAeXLHJLi63k8/XBGB0/yKX2
         rRPEUVvRiTQ3aADSVHCMFuwFWMQkRPITcLdF2j208f9YsX/BNKDlYFwAaTeASZggrBu5
         hRnVE0f6kh7NDnfGSkNn14HaUEnTvcrGPDBKkzQfjzTruoSB0ax0qaYDrslkIfI2G9B0
         4WcmGyNEOE4YBmUit5T6ygTmHh2TOvlVqcxd7mSvZ8vdvvUHViPIX1QToRjfkmgxY66M
         XWWJ3Qai3D4l5wqZH+sWWg0xFKDms37BtHrOA3RQwahgtX4VEBnaiinS/nyvb3b1iwtl
         498g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768905660; x=1769510460; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FFii1bsKXobctKhMNLtq5d1Ip3RYu1nQ6MH14Bs+3t8=;
        b=bLarUOM4KWKl8f8jZgqdcCHw3/BWGLLM0Lee/em0TyNUn56jxnJiCCMwImFosoG8BG
         bZ4ByuHgsMz229Eg7TzNOWTJZjiKMzDRETJfukjRdQEjYMCehR+z4Y7pAI9Q2auCxG7E
         e1Y54T0Hw7PqbKEqIZgANAaOQL9U5/pRC8TAKKDsc79lCOYpctfKAhJ2Q0SXP2DqD2fe
         f1u1/sh1/2CY3SJYi11hp/VEgmCZuNhxk/9RtFJ+F5kkn6NkkA1HU1Hl+vwEhd7LTXRv
         yw2bhlQNHF5yNZqfgxWMhFfvo0XmZUQNedyaSYVtNgkhtW/bP8azuPcC+vXn6D3LFXAM
         ph/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768905660; x=1769510460;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FFii1bsKXobctKhMNLtq5d1Ip3RYu1nQ6MH14Bs+3t8=;
        b=uD7vpGa7AnsCILsK2WtOrc591/13EPGlPjI77BKfw40EdmHtMO515rJ1Gt3ROkFQXY
         IdU9+jfSlPSOzA7obvnJCN58wNF0BLPoLo43inounGEO1x5MCMxdPmuUGqZRtzCUWcCT
         lGtxGiCEyh0Z3RybDowOSjqKj46byq38cYrQCCoq4dThz40c3QkVvda4xjMBIzpYA2ad
         38jVuh1TvFEwjOx9eI0aEQmVlfsJ/WbwIEbjUkaNe6mkeap941hJS5Vuc/Yk794NDjAZ
         0zsl6NdmtioY9S2u4jNH86RLMaabWHtyOoJAIVLrNadu8jsp7BpkRhMLSUsIUPAov/V+
         rWHg==
X-Forwarded-Encrypted: i=1; AJvYcCW3Umhks7nCaIHmJO5kq/9x5UdynF4Wr5ODz+RGKCgYAoN5fKMmix5C/wjq49X2V2pIDewuqcDRzB7pZFej/4Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVDGTCtGyK3sFyoQtdkmpyU784QcNShS5p0NrA7m9BC4IWoXiC
	HpD7PArmZMkzUt8AKtISBNBpmeLVT0GhiCH63P74jFlO4ESs5JPjXxP/Ytj0WpuEtdJ/Ga+iDSV
	ZIXBq2ToadluoL3jyvPLn+BKaUGxJB3MHDcIOIMQf
X-Gm-Gg: AY/fxX4n+nGpZ0cijWmQTDk9hhVlKkb5TZa/IlZuhVBcxyRC1soLsncCkpHcgqdtfv0
	Lk7nS26sCOCJFiz50xVJZUF0UHxF1AyP6zsF7Aum60xWWB7LI+SD/owT0er/C9tk1iywdKHnCpA
	Gf0kBpf1LJ9FG11VZT/1F8gSvf0yKqud8ad3zf0l1MXdstscB8HRBgaCD1Ww+rRrYIDgS4vwP9F
	G+Ff64XQ2/6UbS4DobU47z2WqgJyZ3Ff53p9wrppDj4qpQeeg75ap4GBVNVLUPxgY1twDEFoRxP
	aL4yAw==
X-Received: by 2002:ac8:7d16:0:b0:4ff:7eaf:6fa1 with SMTP id
 d75a77b69052e-502a156ae5dmr191196621cf.11.1768905659838; Tue, 20 Jan 2026
 02:40:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260119185852.11168-1-chia-yu.chang@nokia-bell-labs.com> <20260119185852.11168-10-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20260119185852.11168-10-chia-yu.chang@nokia-bell-labs.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 20 Jan 2026 11:40:48 +0100
X-Gm-Features: AZwV_Qhir59xi47UnYx9OyC5NKVZCvDNZj7hbofVsggQLWG8gFaqMb9MOW1Nco4
Message-ID: <CANn89iJPE=rCExzfFw-eKe5PiukTnmUogaLJSXgo6JfDeZiezQ@mail.gmail.com>
Subject: Re: [PATCH v9 net-next 09/15] tcp: accecn: retransmit SYN/ACK without
 AccECN option or non-AccECN SYN/ACK
To: chia-yu.chang@nokia-bell-labs.com
Cc: pabeni@redhat.com, parav@nvidia.com, linux-doc@vger.kernel.org, 
	corbet@lwn.net, horms@kernel.org, dsahern@kernel.org, kuniyu@google.com, 
	bpf@vger.kernel.org, netdev@vger.kernel.org, dave.taht@gmail.com, 
	jhs@mojatatu.com, kuba@kernel.org, stephen@networkplumber.org, 
	xiyou.wangcong@gmail.com, jiri@resnulli.us, davem@davemloft.net, 
	andrew+netdev@lunn.ch, donald.hunter@gmail.com, ast@fiberby.net, 
	liuhangbin@gmail.com, shuah@kernel.org, linux-kselftest@vger.kernel.org, 
	ij@kernel.org, ncardwell@google.com, koen.de_schepper@nokia-bell-labs.com, 
	g.white@cablelabs.com, ingemar.s.johansson@ericsson.com, 
	mirja.kuehlewind@ericsson.com, cheshire@apple.com, rs.ietf@gmx.at, 
	Jason_Livingood@comcast.com, vidhi_goel@apple.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 7:59=E2=80=AFPM <chia-yu.chang@nokia-bell-labs.com>=
 wrote:
>
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>
> For Accurate ECN, the first SYN/ACK sent by the TCP server shall set the
> ACE flag (see Table 1 of RFC9768) and the AccECN option to complete the
> capability negotiation. However, if the TCP server needs to retransmit su=
ch
> a SYN/ACK (for example, because it did not receive an ACK acknowledging i=
ts
> SYN/ACK, or received a second SYN requesting AccECN support), the TCP ser=
ver
> retransmits the SYN/ACK without the AccECN option. This is because the
> SYN/ACK may be lost due to congestion, or a middlebox may block the AccEC=
N
> option. Furthermore, if this retransmission also times out, to expedite
> connection establishment, the TCP server should retransmit the SYN/ACK wi=
th
> (AE,CWR,ECE) =3D (0,0,0) and without the AccECN option, while maintaining
> AccECN feedback mode.
>

Reviewed-by: Eric Dumazet <edumazet@google.com>
