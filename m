Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4743E3AFCF4
	for <linux-kselftest@vger.kernel.org>; Mon,  8 Jun 2026 22:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780956969; cv=none; b=J301Eu+kiSi1YOlvkGsJc45hkV6Yi04Kce2+DsBKkqboY6Fzeix1uY645CckRHo26DeaBLbVlxXXUQJXKZ2FgyJ4pt+SuwACDWu/fTabs3qoNhB5YJ8yOrwSVr3MGKyDiVps32dLFHD/gmQPZzPpv0eCFM37lNEcPz7cOgdYFQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780956969; c=relaxed/simple;
	bh=5S9+Cq5mB6r0CsPwnBf6Bi9EBEMbdFL9VF1fFs2tVh8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=G9jyvUq1/mBCBzTbIVjAVZc/zEAyxQhpprMJpc12hQNRIlJ40lS3GjaOM9ll8ZsEZmdeEaDfCDmdBRHkh1b3ekkNHva2LnrO/9APGmxGP0Ch1QmfH+Fup3IGlXHhwy2VInt88DiuJ3ty/zVuyul0sm/wcSV6WySHICksz0LVke8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m/j6uKom; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m/j6uKom"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-48670d35a87so3461502b6e.1
        for <linux-kselftest@vger.kernel.org>; Mon, 08 Jun 2026 15:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780956967; x=1781561767; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5S9+Cq5mB6r0CsPwnBf6Bi9EBEMbdFL9VF1fFs2tVh8=;
        b=m/j6uKomIznvp+t9zPkrFDexHFl1cwOn80Pf/8nQUwPCopgBZ7vGWIYsmLenqujMG6
         aEGvRIunsn5WeX5DaiC5O5pAfTSwoZyK27aKXKdaNu47GUZkec61FlUpWmMuAf0pavgu
         +OnJ6yTTQJRUc42ZZO4LpzoIzmMLUuftWtMky//J3gLjKXOElPsHMkcEQk5rgbk/3sJh
         MktBkO+qCF/1lPzqvCuLeQHd4reR2kvbUEt+h7AR8bp71Ogygs4448qeaX3qdupWis1k
         ebjZiBMNrh4HgWcfMd4WWL7Q8xhUVOz543bl1b5Hz81HPaq+LEjePjFOivpfzxEqhvKP
         dTpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780956967; x=1781561767;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5S9+Cq5mB6r0CsPwnBf6Bi9EBEMbdFL9VF1fFs2tVh8=;
        b=jm+v6VrMoMDSbCpe2B6EigOKlNWMLiwT/Y5WE9+aakct/rhqvq2yFHpBH/FZSieJBi
         tpeN37t9x3/zuiKK523cLW65gSkaAssmK/Ww/9vShvRD29kjz8qN2OnlPaCsssg6WwWu
         IQgHTxiRVWB92W1dy/016VZda9rXT7mvdz0oZ8xfsZcDW+Niy+h0IcJgBPrIRkm4N8Tt
         50T6cP+5xaklrTkBqgMsN/4eNSngQ8TrVaIqt12f7B8lOVXqBM5gqptjKkbkkd+znjWU
         b9/ularMnf6SkelB5XQbDOklPm7vkm1kREXSEkZmIT2fkT9tn8oEJs0KB3xmEsJxWNLq
         JgMg==
X-Forwarded-Encrypted: i=1; AFNElJ/ouv+1GVNGiZdfC2XgFsGc7z1iV4iZ5MqrOW9LmuV01kfa6paxKlRvGfVr7pxOiMLev9Ya+Lc2rkjA4HItHPc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxckKWhJQX34MPZd+dFc/twtQNKeyZYN420QoktOL6e9mNyoKhw
	tX1SK/nschKk40++tDpLWhKUzVvo8LfEojKpO/DWpmv1XuSXfas+Dpzc
X-Gm-Gg: Acq92OHIsCO/WeWKmFCIqF71mH4oxHj4q0LcNXOtVjoYWBSBThASZqnkHWqOu6oljNu
	sSF3FRjuOiaPz0mZfrtZHE4Bb+z50sJ8ibFq/4V2jCRgfXXUb8IV3I7JpdfLvfSLmNtAWbr5V+8
	onoK+hvlgJZutj9ZIiizVEqh8lL/bLeOY++cMtjENEShWMJK0IYB01oLOXY1+kuFQgjYaZpJFNz
	d80TYwj/fb5lYBpjMfB6pgcwE8l5dyVRMahnTqzPVrFY4QG7ln6+ecFHIZdm9Vw88u5oruWJvNh
	kO/hmVnDRw3jvi/iyCuAH17vnsuYXjFp06O+nHA0U1raO26CUayD84VxI9fwZhJWi0OD3adfys1
	FDxUB9H51EFWRMMtT8x7IyzraSpXTUzepLXQifQ896L+i2uZY/vDWRGZr1HYT1XtDaG4o6UF1pZ
	qfS/bYQxS0kmsSBifwYKyMyLdTFRhT0dajtiIsN1YVyXFOL6sft/iJYLmQf/p5YsRPk34hEuTcE
	eN/bY1M1DCgYDJcBCzS4X/2wWPp
X-Received: by 2002:a05:6808:144a:b0:450:b249:71bb with SMTP id 5614622812f47-48692e390c3mr6568858b6e.19.1780956967107;
        Mon, 08 Jun 2026 15:16:07 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:40::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e6e79237a1sm13423994a34.19.2026.06.08.15.16.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 15:16:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 08 Jun 2026 15:16:04 -0700
Message-Id: <DJ40JYME18U1.3RA3TUXB3MH3M@gmail.com>
Cc: "Jiayuan Chen" <jiayuan.chen@linux.dev>, "Alexei Starovoitov"
 <ast@kernel.org>, "bpf" <bpf@vger.kernel.org>, "David S. Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Simon
 Horman" <horms@kernel.org>, "Willem de Bruijn"
 <willemdebruijn.kernel@gmail.com>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Martin
 KaFai Lau" <martin.lau@linux.dev>, "Eduard Zingerman" <eddyz87@gmail.com>,
 "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>,
 "Shuah Khan" <shuah@kernel.org>, "Joe Stringer" <joe@wand.net.nz>, "Network
 Development" <netdev@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>, "open list:KERNEL SELFTEST FRAMEWORK"
 <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH bpf v8 1/2] net: Validate protocol in skb_steal_sock()
 for BPF-assigned sockets
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Kuniyuki Iwashima" <kuniyu@google.com>
X-Mailer: aerc
References: <20260608125846.157004-1-jiayuan.chen@linux.dev>
 <20260608125846.157004-2-jiayuan.chen@linux.dev>
 <CAAVpQUDZoEVEX1kXok-29dzVHk=ZK_2MkZyZY8kRHCJCfAWVFg@mail.gmail.com>
 <DJ3XPJA746S5.NYKZWY1HBH8O@gmail.com>
 <CAAVpQUATP7S7OEZw4P_7fp5zmQO-T5jByxAfp0+YsjRENeWscg@mail.gmail.com>
 <CAADnVQKa2Z2HKKZMhyD1HrurQ4LTcCS0Mm0YPxtisGKwVfcxmg@mail.gmail.com>
 <CAAVpQUCJH3iknHSfNwMqvHVc_V09zNDK-YbXbqa-=K159PTqiw@mail.gmail.com>
In-Reply-To: <CAAVpQUCJH3iknHSfNwMqvHVc_V09zNDK-YbXbqa-=K159PTqiw@mail.gmail.com>

On Mon Jun 8, 2026 at 2:35 PM PDT, Kuniyuki Iwashima wrote:
>>
>> btw is earlier sashiko TOCTOU concern real?
>
> Yes, the selftest in patch 2 should reproduce null-ptr-deref.
> (I tested one in a prior version)
>
>
>> iph->protocol =3D IPPROTO_TCP;
>> bpf_sk_assign_tcp_reqsk(udp_skb, tcp_sk);
>> iph->protocol =3D IPPROTO_UDP;
>>
>> as far as I can tell past bpf_sk_assign_tcp_reqsk()
>> the networking stack only looks at skb->protocol,
>> so modifying iph->protocol will only mess up
>> things on the wire (if this packet goes out).
>
> ip_rcv_finish_core() uses iph->protocol for early demux
> and ip_local_deliver_finish() also uses it for demux.

ok. Another idea... we can keep the checks on bpf side and
teach the verifier to invalidate packet pointers at bpf_sk_assign_tcp_reqsk=
()
and introduce new concept of "readonly skb".
So after invalidation the reloaded sbk->data will be read only.
There is no such thing today. The verifier only understands PTR_TO_PACKET
as read/write. So it's not easy, but probably good thing to have
for this and other cases where bpf prog shouldn't touch the packet
once it called some kfunc/helper.

