Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794495328;
	b=1x64DEo4vPmNtWQxzgPpHruJRyLb8LT/8k2CeZCDTzQuISSvmm3JUb4UIdMkLHgfyI5A
	 nfSnJrPEai/7WPZi6SX78m1UFGMqGro5VGSnMJf6PdsaaL2BGrg0q0Kcb2sLNZoVglJ7L
	 KvElOoIB7zjcpWgwZzSLN8hw9P4Lp42JvcS3A17J9nLck2Q+QU0h62vjOCSM4W4IBQHJY
	 b0KZmpYdtPVyNsQkOPWdCgpUhq3sNbpHmXHn4GWAbS/54xZhHKg0+4pbTXVd/FRv7HJ59
	 vU/jvAACruxFWlY7KkFfY34ScShFvcZC8LJxEmzTzFlJftYgdGiznsTFMi+2bepqDoQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495328;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=vwPTmyMvNhiyDg4UslxzJuuKVfCT6YaQluFzq5V0j6g=;
	b=NLtnr3IDT0ydBMSUCPGPZ97bVYPgR8X8SWP8t9HIKJdXFEP1DhAO1V1WJY6nH1Y6AzUZ
	 bnQXre4CM8yeCjCmhhra2pwb5DqO22/s0iv49dFnyqURBKpI+N9JiFRiYuOc2CWlUG+/+
	 Oe7qJk0GBoHXrLogJmIqGDNn3rq0Ta5HZA7XXyiYEipoNBjOvXNyjrfMBbkovDB7ZCg9E
	 Mvc4B8MrwZIlkMUOQMhe4yLCDWmBig4wIAHXPUmekOVjqp8uQ1DznMjbt+88nKn1TUmhd
	 Nc8teSJcF9DVIPd5BSn69Eib3OUD18Xi0r22j4lqx96FwKRL+Lsy9XEeEVfYwjTLvNA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=U5KQI7tP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE6F606A32D
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 14:55:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BE6F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=U5KQI7tP
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6f74f6b46abso1950726eaf.0
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 06:55:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794495327; cv=none;
        d=google.com; s=arc-20260327;
        b=W05F6Zkf8cgpDUWq07KtO2zQAoljAxy7KK5Mq+Rk0Z2DumX0o+B5ZReErm3VgJx2na
         aQ0aUZiqvhBuQyk/nkhs1Umie5QMjcuTbZrotMvm46864mysA8j0et9Yc+9kytz9imXG
         IUGHTmeJAGab91yEhMCNWiX94mW0Wqgkiv3PlOIMaIem7sS7G5ZdCsHzkL1NAKishpgF
         B9sH34KvI4o6QTu7dvkfRUk1Xanfa9nXir756Wz+TLJCv4PAU09s4nakdtFltB+VzNjv
         p/oav+X9o5BiazMxHMGwSVcu+aDmg0Pk3yfY7zysRLfwNrkKHSU8x1vi3wjoa6PifnZb
         le5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vwPTmyMvNhiyDg4UslxzJuuKVfCT6YaQluFzq5V0j6g=;
        fh=KqlF9w7lgaEt6JeR4/cPb57cv4vLnnGQgxhHmq59x+I=;
        b=quzbVgacXXlA+goxQoWvA73IVASZV48VT3/f4UycTiIgMkfcYOmSpaRnWQLWJ9IviV
         ED21mDHOOTiYoAd1j2xXjGIi70FE2yeHGcSPyrTGvvSWdLtQ9YI7shYYN/YHz8Nyv6yd
         3eGB1wk0/ca5aoF3yg0QZ5/c3GLmfNQyvBA//PYuM9lqL32I3fh4F7de1S1t3eRQ7DS+
         p+ga+0AuBX9VRqSiO12SazY/6EX8NP+wYSBNZrqVMcPWXlvhTjsZMiMfFHGotCXNgsAT
         /WHb6R3fSf1TXPXmNtd46IBcWhyQ/8QSEaVVaMrdB2P3isLvAhI0BqPs8NHnFYV8CSx0
         mLbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794495327; x=1795100127; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vwPTmyMvNhiyDg4UslxzJuuKVfCT6YaQluFzq5V0j6g=;
        b=U5KQI7tPQrZmVs2O+/K/2qinNoIrgmL+JN3JGy7b9UiDPeSLDrYZUz8m3+Fi+GmK4d
         FPhVPTsRS15yE/k7GknytYpWAG6MwHXBIIKa8+5OUMRQdlbNuFvA+ep3tr0dGAEsUuqS
         a+qAoHXBep9HV3bGKKYHTsPNJ9pBthMfNLk3q0DuYIG3pLV59xn/MzPe5hgZKfRheDNT
         6JXrnL43z2Low687s4+keArBSR7IBzhVjsWA3Ig96aNpRQIwExEY7RDDcIQ+BgeozV2b
         TQoClntxCegkGq8td3fNEFFkUr2rZefYM3k1Tn1u2EN6NmmUeW9xJMDbZ19emN/tNOTo
         3cxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794495327; x=1795100127;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vwPTmyMvNhiyDg4UslxzJuuKVfCT6YaQluFzq5V0j6g=;
        b=AJHpn7HN98QFm+JU8MKSemK6gHFNAYF425SFZxnwA9fEUy672bYmDFT1TztvsuQUz8
         4+ngFWgNWKKeHQvkdwX5LKaCPnG+HztDsZvFad6QJ/oy1T6D6v/yWO8RSorFak7+ebme
         BT8WH2ESYL9ux1Pl0Z3/CCxQaWuKKzW1ADSEqxPWy4oHv6QIWcVi75Lpv8DxwpNz5FJw
         ssiNF2GvYNoSmHKBNQBpzcr5on4A3cqxExhcrRAQnRQH6Q6zZ5VWW6Fj+vs/UkZKsWj+
         zxzoaDEFyyIhTudilR0XkxW9I8R2mQJHTYjcpG3IzxyMnpE0DnPFc+8oWr6Q91ZIOtIe
         bbYw==
X-Forwarded-Encrypted: i=1; AL+hErGK6SjrsCw5bjenkPU8NfxQGtIaEidR5l1/VMYYjjDmmUsVwAcx6ko8OZM4nbDt4ioHwGbwttzTTfgrlvMMAa4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+PogZhHlhuVqKK8zxTpW9R4K4UkDXe74taeHYiHtff2P3CFSHk
	Ja0MtpTB0FC1Uo050Wz2vhhGdZWHi4RX2RvKcW5U1hqEVK5ajcf8lEQcC9CF+LdqtLRPzKpUxz4
	Q55S27vNBi1YLt4kyA9RLaiK7iEgDih9XNIuN067/mw==
X-Gm-Gg: AYBFou0KJvG6COwuJLIyP7YFoZdmAZW1Jnhp2zpVHSk7x4w3F1QYhOqgISLunKA4jFc
	o++Ejh1p+KEWH7hr0HHKYriW4cSHOKFtq4pZ4b00Sctab83CrIG8nbkVp7QYXqD8sWlV1MhI7Zt
	7MX+JMhnqPEBMwxPQ/o5117mn93P2/GRl5K2sMdrH9kMtertdRl0Q53VFjDGqThyiFK5Du8/pzM
	GbpRgBUYMwmLaZdaLmq2hAfOehwMjDh3dYlvdz9sdzczcxL2P8HpipP6oMDaOkZHhfo7sskrtiZ
	D6nYe1vdBPgdcbTqBGYL8QD0GQo2FWW1n3H9EmwKqc6GZH6jcszCMqAt+0JhfBPtg1cNlP/g6d/
	Ei56iMU44kupQcOg7DT1HbsljLdfp4t97srNhveP6Nc4xvYG1vDzbZMFANrPGOHML9fkk3Ssxf3
	GhmpFf7ObjWQ==
X-Received: by 2002:a05:6820:a50f:20b0:716:bb4f:9d1c with SMTP id
 006d021491bc7-719179b52cdmr2435932eaf.70.1794495327350; Thu, 12 Nov 2026
 06:55:27 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794281983.git.tianyi@cloudflare.com> <DMST78XBB2RK.2BKP3O07GEWZQ@gmail.com>
In-Reply-To: <DMST78XBB2RK.2BKP3O07GEWZQ@gmail.com>
From: Tianyi Gao <tianyi@cloudflare.com>
Date: Thu, 12 Nov 2026 14:55:16 +0000
X-Gm-Features: AclHuK_osBWVQK63DcE7gK81kaRbLSav5BXe8bL_6Bp3W1Mewum9RV7hacJBHqc
Message-ID: <CAG4wq-cXJtTzG2GO9KTL04b=prS+X67fRBJ=nriOO0G-24Rjzw@mail.gmail.com>
Subject: Re: [PATCH bpf-next 00/15] xdp: add SKB core extensions to keep RX
 metadata until skb creation
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: bpf@vger.kernel.org, netdev@vger.kernel.org, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Vladimir Vdovin <deliran@verdict.gg>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Donald Hunter <donald.hunter@gmail.com>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Magnus Karlsson <magnus.karlsson@intel.com>, 
	Tushar Vyavahare <tushar.vyavahare@intel.com>, Jason Xing <kerneljasonxing@gmail.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Madalin Bucur <madalin.bucur@nxp.com>, 
	Ioana Ciornei <ioana.ciornei@nxp.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Chris J Arges <carges@cloudflare.com>, 
	Jakub Sitnicki <jakub@cloudflare.com>, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, intel-wired-lan@lists.osuosl.org, 
	llvm@lists.linux.dev, kernel-team@cloudflare.com
Content-Type: text/plain; charset="UTF-8"

Hi Alexei,

On Thu, 12 Nov 2026 00:34:54 +0000, Alexei Starovoitov wrote:
> I'm with Stan on this. It looks heavy.
>
> How about the following idea:

Thank you very much for the patch and the idea. I really appreciate it!

v1 uses the skb_ext-like layout mainly because of the earlier pushback
on a fixed struct [1][2]. This series adds only the three most commonly
needed types of RX metadata. A 12-byte fixed struct that takes headroom
only when any RX metadata is stored can be a reasonable middle ground.

I would like to hear from Jesper and Jakub before I move to v2.

Thanks,
Tianyi

[1] https://lore.kernel.org/all/20250805172831.213ddd8d@kernel.org/
[2] https://lore.kernel.org/all/1d5521eb-84fc-4417-a3f5-6366694d160a@kernel.org/
