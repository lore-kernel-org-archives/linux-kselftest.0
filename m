Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793748916;
	b=jv4qHxhVpmR8iE1wsQv1GdTnX4BXmHzcrgv4stYbmkMn6asb3ryMJlORmS9nnHluxI8y
	 xnXH4npcY2Fh/E6OfpBXVMMZhPsmEfMD8quD4S4M4oWSzg0/MjKisvpxgjsrJRexImW6Y
	 M27KQsipomAkElV2N4+dlm6FCjlYjcldsyprbPFCiCWhQuDtw60+yDacxhCBahzMA+a2a
	 yDuXsLhwxCA12M5+DdYhOHFQ2OxB4P5ombdMnVpRZwK3RvrZIsHnwblpkl6HS8fsYqjCT
	 +6M/1yeLIxOlEp6tG0g43C1wQHq3etjIZ/ttvYIk2weRYkJXZYE1Hx1Q0tZJqGuO8Kw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793748916;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=nKxJiX2hq5njbsbRPPasik6GSDqBNI5NA8L85r6kDpk=;
	b=ZtznIGIX4mRmYaiin4RPc4NBI+tzZGMl8STwKW/mb8conAdl7qDZudyEYs87zVGTE349
	 oeHH8LJifoDsDxthEDDsDwrWovDcQYtteXwH0UmyG9ZiVzq2b2LeflLhYr7mGp1oK1TAK
	 X+Pl1EhdgwLLnXVZsmOVwV9Yf7kp19rtH72VuKnf7top4reafUU65LbhGih4PN9dZRFxP
	 6dpwoFnT/mY1vIM1Bi8yORJh+KUQ7MfN4zUXn1yh2jgbKX4uDFpjOlIiB9MIePIkS5JcK
	 6Lnus1IxhdQYVRxNYohJQQnwlmY30ijOpP/gJv1H7Vry5tdezsTdbf6GHfsgSa3qNAQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VxTJ+4aJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.44
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409EC606A31B
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 23:35:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 409EC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VxTJ+4aJ
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-91befe703c4so1716256d6.1
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 15:35:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793748914; cv=none;
        d=google.com; s=arc-20260327;
        b=oOcoPBb+5yL1HFCctscgn93eyNAVo2qFdtxp43w7QBgDD7VPsFOVz3/zknXtmtnE1u
         /KM8bpTI/zZWoink6gGV4vx4PtEwodce/mepe+WvzlzqEHQdZdSGlAn4t3M7RebM9sCx
         VVEJwwMSYAG2BkoT6Y93elxd9cHgAK24vFg0I/UnT82G8fMCkBz1rgO9ubcwy/LkMuuN
         tSN9wsxE7dpprL0Ye+ndK/pyt77uMFdMKKOVD7TPN/uZ5+ExrPQwTmqfwn7HB/X+h9B8
         fnrF+ay53/ykuVLQeugSJfgCawfDEMYv1jR8FMDV1qWfO+AX1W1BJXeXPsrNLNIe9jVz
         AeNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nKxJiX2hq5njbsbRPPasik6GSDqBNI5NA8L85r6kDpk=;
        fh=ARmCwKRWeOaT02xAvT86KenzsI5TxA8KvuywEKvSrbc=;
        b=XMcXc8xjSeaRqUcWQ5rDfEQywthvhE36x8JdowBHEGTVfcy2pADUWQ64JmsfbBIXHR
         PN2s2ESbzZh08YuQaWYruw+KqVyLbu2fKGC5xPXsuB4CFiNK3IlwxB6kUS4JBZWkNtqn
         gLdgk2Yl3VqLqnpsL1mlbB0G4FDOLJmcdv74qCCF3FKtQPJPrzTyD1Y3yknAWuaibR2f
         BASR6//lJu/UwJ2TvP+l+tIMfR2HTwvGZvvgfTOgP8UsHRvdsGzOm9qPMYhMHhO0EUP/
         T9hhDgGTWK6kxQiOzyA/jFxiGBDHMGOTcbFGe0GnuAQQ+TyRQhd3B+C3WY6/AzAiGQ+t
         /EYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793748914; x=1794353714; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nKxJiX2hq5njbsbRPPasik6GSDqBNI5NA8L85r6kDpk=;
        b=VxTJ+4aJ4hoGXlN0OEblscqsEQ8ZIHoVlcPvCs4QWOtOxiB6KfhsX9LnWXJ1+88jC5
         0JTCj2E5N2/3fs3r1e+RvaE9uLU+ENzivEnj2ssqal8mv3UOGemtl16V1KRc5jm/UX3C
         RxanjYA2i4+D/A+cmNKKG0E8C4enpHVo0ZPMBVFtUDmR5OiNohPGtyk0ZJGJRTkv93uX
         v7hCXNF/t2IwvnBd8lnfDtMCDVh7ykrqTzVw9MjHzF74JPrJRs78yx3S2MLuciYisYU+
         qAU9pf9YwEGQt2oG/HcPePOzm8xYVcD/4WEYZIKmHy4+NwBYlOcYGNmtY8HhfcBa5r8h
         1msA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793748914; x=1794353714;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nKxJiX2hq5njbsbRPPasik6GSDqBNI5NA8L85r6kDpk=;
        b=YEYYLCGeDbFn5MCb9jpUHlxFSgd5iJwzNz9MUdNOybERRjomFNjqFyogSXRF4JJc1K
         RHsyNVjXIe+Zich3KKu0vZ6xuNLA3riN0AedS578Rd8Q5AGHegCdIR2SNUkDltRZp9Ws
         VSzKb0zShWXvi8doMU4DT3a4nCfCaOtx4ESUyVPz9zXJLLrJTE8WP8UI1uflmHdJzJ4v
         1KExGBcor35P1D8Yj4l1vaN5wD0Goz8UogOJJJKWFQGcztaxD17qLE90lOxfiQ+OBiAN
         qNeg+b9Tv2baFH3CZdHrHWuvhzkrVuBnclrpSDU8PFdOQ0AbBa+/ZmEO30WFpvp/UYXU
         P+zQ==
X-Forwarded-Encrypted: i=1; AKwUvBzdXMA2Gw23HdCprNf5A97qMVFjl8y10rtXYvhBM4X3U6oyGSMViMlV3kdXTRlr0tqaM7Q2F3vBgZP40DlnN0g=@vger.kernel.org
X-Gm-Message-State: APuU4Z97/VhFhi9MbF/D2WDhquuP9LOzZhrMCmfO+rFeDqleJO1JLEnN
	fxNCrIc2IfqSZIvEbzWj0QxiMArrrhHX+4HPJIYE34JoNY0ocpl7C6wJR+wB+ITIR18ZccqhT/j
	TWiXZYkdlSnOGQM+mXwT0OF++6TO1suE=
X-Gm-Gg: AYBFou35r2mdkTDkdfUjIThqawA0+AvwMOllL6h1Lqeo8R2fx8lWC11wFJYLy3fE5c+
	gO1goz/jcEF8PACdC38fmk0xRzbKAHT4to7qYPGml33xuw5okXDvygqN87XQHFZdnQVMxlYr8Ts
	E1eTrJf/fXctHsBm5yrSPTnJ3XmdZarnA1LNGC5JgvzUroOTMrboICI553BaKkHDLHPP0On1iYi
	9FlaAoVeAMdB/TH1aF1wDrp/BqRBMiWPQ6XQ/2Iv+nVZvAZntG1d1NWZ080e0xgyboDM/8KrE+X
	RR3zf/JygvFZH3E0KmlF8gkCJDpoj68T0uDseEkfk6cTEoQr4b0/Y/uYb/kKJFVLDrSR86fuAwv
	iWvYI2c3l+yKWeJOdTLsLrTGrpGMLHaKBT1SsaTJI0dnlQSRtvk8kEhasWxt5O4Jo9qX66VYPHN
	ez3SeFj4qXE3QrKOdxUOTI8RF9QpSv/mtQ+zBEGXNj2kiDqFAnj7KGhCGCmhKCdtvjE0DtGGLPk
	2uQ8EQny3x8LuuapVSEFgCJ6g==
X-Received: by 2002:a05:6214:300b:b0:91c:7f1f:2c9e with SMTP id
 6a1803df08f44-91ca4c1bea5mr239516046d6.55.1793748913967; Tue, 03 Nov 2026
 15:35:13 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-keyupdate-rfc-v5-0-de1ab90a88d5@gmail.com> <20261103-keyupdate-rfc-v5-4-de1ab90a88d5@gmail.com>
In-Reply-To: <20261103-keyupdate-rfc-v5-4-de1ab90a88d5@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Tue, 3 Nov 2026 20:35:03 -0300
X-Gm-Features: AclHuK9j19hhkEsExp91lQWmWztn20ZPkjs1fSHVQiEkHUWk4-OotQ7EK4u8uqk
Message-ID: <CAMAsx6d0kMWT+QLBVGnGjfbEUDuOfrBaoCaizMNKZKn+NmkG=Q@mail.gmail.com>
Subject: Re: [PATCH net-next v5 4/6] tls: update the RX key when a KeyUpdate
 is received
To: martin.belanger@dell.com
Cc: martin.nvme.dev@gmail.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kuba@kernel.org, sd@queasysnail.net, 
	davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	john.fastabend@gmail.com, hare@kernel.org, cel@kernel.org, 
	alistair.francis@wdc.com, corbet@lwn.net, skhan@linuxfoundation.org, 
	rdunlap@infradead.org
Content-Type: text/plain; charset="UTF-8"

<devnull+martin.nvme.dev.gmail.com@kernel.org> wrote:
On Tue, Nov 03, 2026 06:57 PM, Martin Belanger via B4 Relay
>
> From: Martin Belanger <martin.belanger@dell.com>
>
> When a KeyUpdate arrives, kTLS blocks reads with -EKEYEXPIRED until
> the user installs the next key. A kernel user such as nvme-tcp or
> sunrpc never does, so the connection stalls.
>
Hi Martin,

Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>

Thanks,
Daniel
