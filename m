Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793651509;
	b=AGRFV7VoAhzQgsW5HKAM/KJFPWsnwOUvdtcQP0rBjuhD1fspvcosVThxU81MY0ERH/PP
	 3Zk87kr4bWjZAhiPqQUJEfEyQwQIg98r9MQ23qji3GKvgA1OMi4p8Wm58MUWKoRiICjIB
	 GLbmXVP5XPAmSSb2CqyELRYptJwXzOkE+BaBFOq+hEBZw9uJJTk0nIKRlvujJ2QxgTOfw
	 /aR7hO+ihiNdPovegq9o9qGxqMFd/kHOR1+VclGYAHMRhxhzMkai6R3kB6GaOXfJVGxwT
	 fHGrYmKtjlEX+aEAJjDnNM0lxLZ4ubArU66RKiC90xqOLQuS2MVuKfnJFI3xfj+uFpQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793651509;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VjG5TvEjkBjtEt0wy1VTgpSv3HtKBsr1B1mB8IreTGM=;
	b=GICjl/4tcEk1IcqFug1t1+5eaPpIQYFAS3NvBX1uMAtLkKShwpSFphyiyZeJuRAg5Ixn
	 oGM75JyFl41pTxYwygE6XyzZJGYGSctN29HPOiekJPQ4/WSKhajwNnslA70lkTGqY57w4
	 kOLQci2y/cZD30j//v+H9Gsj2rxqAHUqNWczBRSQAg0iy2KS1SdUCRSY7DhNkPvtFsXo0
	 +y2E48DFuP2GgtlnXAEc4SuV4YwfK68CF/M1k03ynrIzvMzjheyAagNhk+InbZJR2xXF/
	 OlkMxnlKXpOmobltTcbWpTKvS5bwAvLxaftzW9hbhasPDwte7FSKYCs5456u9p2Epfg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AAJQnj1J;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F09A606A327
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 20:31:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F09A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AAJQnj1J
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6ae14cdc63aso2121a12.1
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 12:31:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793651507; cv=none;
        d=google.com; s=arc-20260327;
        b=B0SIqEHpTprCElIBNRo0GoMr5ig4dRJc+EoSGhAfl8txAr5xW9DwZExZqZ8/TcSQSP
         /a3pmBLGG2Yr4u4rr4BuDTI5TyXidoHt5J/bGAWkk2IXsOhjtT7oOOUMIE0yQZkVF6jt
         +XmoGHILdePK54kVbY/VgeE+N4CYun1/KSJ1FM/0czfAOH3htW5qHzjUjmTq244MLQTL
         SjXxXBweY0cKMTiy187Bm+79uqFFSCURkzVdv3eQiipsytJUIipUp1sk5WZSavYJpMv6
         h7E6qV10maBTK4va+REsGf6B8WD4gb9ysGAJPlu5LGj7Y9mWaRjn6DIYu5fbfbLJ5Ry9
         Nd5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VjG5TvEjkBjtEt0wy1VTgpSv3HtKBsr1B1mB8IreTGM=;
        fh=epyty6YLM/R3HT5iWaUzdNy6VSOX6V2X2xdGeuoq4nE=;
        b=VtXzMJdyw6gVJO5FX5LBc8yVYu6t2nQxg17yztghweeIhMS5EnUi1ZrjA3+f3WsJCc
         +922oQSVE9I3WboM92QmCXw/1vTPLTIKmzJboekGL1FgxEm+scu2AmHrP6WRIpsRHP39
         W99i2h39Yg6ZAD3gMGJP6/BhrORGJ+rbuuIyOSi7zzmMSZbZO3Pgy05XSfKDIWUavNZe
         lQbJfQCM+RYlU+uQ59ONxvnJoS31T2JtpnJXeprxfkKkU9nv6EAY/FTRLv+33c8mdXzU
         3gpboJD9L/sHGkuatvzWx5DcbxH+6DXCZC9GC5HJObLBIYNo1zoUpmZziAYwhLC0DrSQ
         ioxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793651507; x=1794256307; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VjG5TvEjkBjtEt0wy1VTgpSv3HtKBsr1B1mB8IreTGM=;
        b=AAJQnj1Ja11T23MVaTLcNycS+cUJrfMpwhSGmHetEgU0YRe4eRGM44pV2rGMMTbVSC
         vTj97Qw6X9pHx3UO3B/YV+Tt5TuvUx76pgo1Ha0VR/atoIse9D55YKYrUSVdYIMNktQW
         /KDFXZfnQ75dvbLD1S2Zsl3r6zjQhaBhJujHDe0GxmQcpzi4mVizJHSC8QnkB9ok0m+h
         uRGb22Jpp7sCGuFp/73CyZ9+yx1sxgJ412AnHSmAuh3TMXnpxkmncKRT254C1vRiFohY
         kQv7YfInJwo0rwgXpcvgCKtx4fLX/FS3PYMpYb+ZM8G4lbfc0fqQEEicCYIsiXPtDUkX
         8eeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793651507; x=1794256307;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VjG5TvEjkBjtEt0wy1VTgpSv3HtKBsr1B1mB8IreTGM=;
        b=UJw2bIQDpOasUSFZBx0FOQsDvpMtx2AcKlsGQxPEi6LVlQrP+zPscGUF40iUGmAJ2S
         cl/LXqR/oZhE9EKsRAiJyIrUbU8FLaCY8Yss16oWHkDozLbHilMu2V0A5JRIiRnpuuxM
         AryTuqfBWFEeRR+KifNqdA9N3bxLKJty2DgdUnENMSm0cCcPPqizzG/YKCaq/3rVUqj+
         8dEyV/+gVmM5wJkONMEvRXOBvurRpCFnVkUtkgI7PxD60xQJDPh3EA+byFewfrm84dBn
         BfYjFKQ79cYEosva4HrPZSUX8GvWTUgYKvu2YJGHNpyGUxjaKr3dqPCIxTP+Sc8duG0c
         hpAw==
X-Forwarded-Encrypted: i=1; AKwUvBwuKlIOSosjceruylt4D+86gYFn0ZVRyFcMLqzyQh15kR6twivZNdcwadhXaLHqBAEJxsa5k9Ti0yPQKRpbBYw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8r6c1kpoSe8k37oJh15XlkA+CcukhonUYavQRZCnqGk+NW2csI
	8wZdkIji8iUnQmdc4utvz7feZMmW/fpzY+0IaofS5EpwGUhDTphedZqntVDWEsJt+YePs3RT4Hq
	YNt+u6FvIO1Bf//s6PKkWCwM6kprfd7Gr0i8NTZOB
X-Gm-Gg: AYBFou3lh6p6UMgJKMlMyNdCwG+2uoH7IcXbT5xZPfja9Yew3xnBHo29XOtDDDPHhqg
	uirobjfnUgS50me5ZTQDCmreLuCFfb+96/H2IB3GOLhQrbYXhzs7oLpkfjA2nYf/wWIF1uPSl8r
	UZVUQa/ejlk1tAoUVsHgZbClqFBSyMdsRN86d7DAiXaSPYYMHkxyZthkwNoUpODzzcLECXlpsj5
	w3TV1Anq9lzOeAogpwJSI1K6igaJr5EDwAwJM/iciwXOY7d29+OovlGQ9hxeEObxiKJq+BR4JCL
	BB7T4CAoqvjd814U57QrcVCFFAs/e7meftvx3pzmZUsoQtFaFJsJll7xytXbFIiEaN4BVNdckKN
	SJ44iZjgfmtMS9hoJ4rKcQeyz0tfiX+WbK+YMhLZYFi5zsz5gXJP2jpPj+Uy757qqOvY=
X-Received: by 2002:aa7:d794:0:b0:6b4:2188:97d0 with SMTP id
 4fb4d7f45d1cf-6b539d22220mr5389a12.6.1793651506561; Mon, 02 Nov 2026 12:31:46
 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102191438.1059771-1-sdf@fomichev.me> <20261102191438.1059771-6-sdf@fomichev.me>
In-Reply-To: <20261102191438.1059771-6-sdf@fomichev.me>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 2 Nov 2026 12:31:35 -0800
X-Gm-Features: AclHuK-pAzMpwpW_Jh3vV_sTtL85J3_WyWyUrIfAoS4gpBHVCa9xsaWfoYFzl4A
Message-ID: <CAHS8izM49sjB7QMv6eD_vws3D-JvR=vi9U=g5_tb-t70hJ=MWw@mail.gmail.com>
Subject: Re: [PATCH net-next 5/7] bnxt_en: limit netmem TX frags to 32KB
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch, 
	edumazet@kernel.org, horms@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, michael.chan@broadcom.com, 
	pavan.chebbi@broadcom.com, sdf@fomichev.me, bobbyeshleman@meta.com, 
	asml.silence@gmail.com, daniel@iogearbox.net, razor@blackwall.org, 
	leitao@debian.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 11:14=E2=80=AFAM Stanislav Fomichev <sdf.kernel@gmai=
l.com> wrote:
>
> The TX BD length field is 16 bits wide. Limit netmem TX frags to the
> largest power of 2 which fits, which keeps 4K aligned frags 4K aligned.
>
> With 64K pages this already applies to PAGE_SIZE net_iovs, whose 64KB
> frags would otherwise wrap the BD length to 0 with BIG TCP.
>
> Tested on a 50Gb/s NIC: devmem TX from a 2MB hugepage-backed udmabuf
> runs at line rate with 2-3 frags per 64KB skb, none above 32KB.
>
> kperf output (sender side, 1 flow):
>
>   client: =3D=3D Source <sender>
>   client:   Tx 46.358 Gbps (174483046400 bytes in 30110590 usec)
>   client:   Rx  0.000 Gbps (0 bytes in 30110590 usec)
>   client:   TCP retrans reord rtt rttvar d_ce snd_wnd cwnd
>   client:           729   153 599     48    0 13893632 3147
>   client:   net CPU 71: usr: 0.03% sys: 0.06% idle:67.62% iow: 0.00% irq:=
 1.12% sirq:31.14%
>   client:   app CPU 72: usr: 0.16% sys: 6.01% idle:90.66% iow: 0.00% irq:=
 0.83% sirq: 2.32%
>
> Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>

Acked-by: Mina Almasry <almasrymina@google.com>


--=20
Thanks,
Mina
