Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8F757981B
	for <linux-kselftest@vger.kernel.org>; Wed,  9 Sep 2026 16:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788970163; cv=none; b=JQNxltMJoebDSalv2n34CLygL5SaFX869Z3sol5jsoGW3K0OrSxdPq4ntmwjy7ElQ493G3p8UNf91KGm3lJfKa3DcDp9L8lwJ0k2nX2TzFM5LtxHdq+J+ohud8ckslsXhSpABYZYocTWyY2jc9aAjFKhI4MoLm90EPQIGrjRNGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788970163; c=relaxed/simple;
	bh=eAly930iExSc0nx8hDXxCQBEPYU0uHos2zYVFXGsAlg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BA2nSaYKX9pNTJf844XQR/KbogrAGzMzL/hoYAEjpgHVWLxe4dB4hY/OZZJrK9CqQGJjfqZyzeGQd5/G9XPv2gYX3R5atF9nHUnADMS11OdEmDRtqEqAB/JY/k76TMxZ+eqReymokhkztXrtmP1cUpfxqAZrXx3banEsrAortCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com; spf=pass smtp.mailfrom=6wind.com; dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b=WrruB8P+; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b="WrruB8P+"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-499db1a5b5eso1902695e9.2
        for <linux-kselftest@vger.kernel.org>; Wed, 09 Sep 2026 09:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1788970159; x=1789574959; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SU+Vq0Ts2ZBtfqXXPBx43tPtSAYvdfKOjWmn3OOcizQ=;
        b=WrruB8P+IaN6NIa/n6Khcj1Za4dxN1CVr5op6iFKqpXz9ei1ISp4ZJJ693p/jzli+B
         Y1wrCd0208HAcu03sV9Ng6skQQBo6STLbUzf8zyynNikrmLea0t1+F7XC1OgGzxc5N5/
         PSyZ2P/H1tYXbd5+gSBQxWI8LvcYRBBgtcwRXUsf7XQCrbDTyArxoggxEX0tfL59/YIL
         F0szpGdUMrvLDlkIHaveW/3rxpUmrPrWROVn2FRUyocicsRuOb4akAHDIruPJtOR8h5O
         5a/dnhp7rM3hl5xltnRqhuQP2sWzsBWMiWb4vsGm2uzkzmwR0NEItsDyPgfsrs4prDrW
         O/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788970159; x=1789574959;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SU+Vq0Ts2ZBtfqXXPBx43tPtSAYvdfKOjWmn3OOcizQ=;
        b=bZjQqaiQ5dBZ/yi7xPDAqZy7y7yCDKJPehwHbhahXT4fna+LZ+CyEjWE1I43D2Qk0C
         hEmq9HB8UNsY0110DDlwpU3ff3MRHCX5an3FiJt6XSjVhuaSHGCJiY+9XXNn51TLIoHX
         ra7VsCtTzNYF/3cneJqR8bYXkdkiwUIVEEWymdt0W4dDcE3xl1umSXvnGLbIu1fr1Cve
         XxSs/QdSpG+XkESkj2oNOc9Jyi9UlgXlQ7KTGkms3Vzi26K0XsXIrckLVp20xFKGJr+8
         OLJK/W6ThLSjnTlnobeVhwoyQbAomllFOJRPZLzNv7ZJ7CKrldZuzqgFkAJxCaCYDmAy
         3FlA==
X-Forwarded-Encrypted: i=1; AKwUvBxyBnlrNZkJuO1psUOXILFeDX3lDaO1vEzc40m/I0YOAsY14o6SLCaeAYcAYszM7i3Ezk3wBh4e9RY7H7MSzAM=@vger.kernel.org
X-Gm-Message-State: AFuF++meV/rIdde9+eRLzodhNvnMaKBjyqD9KOJ712NmyjaON9wigCZc
	mznc7ut4Wa2AnHP+Y4QOJB7xq99uwEL/7JsdFBqHj5d1IajltiImAt73kHPNfAIEBbE=
X-Gm-Gg: AYBFou19nGU248RlwlFUKkwmngi0ZvOq2cjE5G1ovEAXR6Q08WbOJuaeJA6ZwwYsWK+
	39EdoVACP5p9eDqIbf7cttQfW1p2Ua2mMBjYjcooUOz7UtQPv2X6xnKK7g/IFUq8GgCUL5Rmbnu
	zn2PybUMcXt1Oun4uPG5wGyVL7AXxZs/lIHiNGMdniHLo1BnM7FsbqLj3x0TBxnRyDeqIQUoG4j
	SDgedaO55tr9DyO1DT5/z3pLmDWbWgO8kHem0v0la76jl4D8aBzoiuBnBNHsN80ruwleO0C8WZe
	zRzXugi2s1wqtCYcKFUmkded6SIrfdZ66eKranMJw/drM4UQzdtT1juaXkRyMm1aMwR3GPHgPt5
	ehkt3BX4pAjblfF9Ar/3FMV+r4QAQEaXqMZdsQyGibzdpl3bF09TLknW2MyGfwiSoJODzyfBOTB
	5USshCEGp+S8IJw4t1a3cNabBrfDZOJNxiTUHptmec9Sa6maTjDlUVWLm0Mf9WY86imU14oYcD7
	4auzZZhUet5y3jVhlynMvVXkDOXW5fFMa0JICeMA+8Y6RxLTpNQ
X-Received: by 2002:a05:600c:c494:b0:49b:916a:e553 with SMTP id 5b1f17b1804b1-49d010c2a57mr266347345e9.0.1788970159014;
        Wed, 09 Sep 2026 09:09:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:ab7:2110:6a1d:efff:fe52:1959? ([2a01:e0a:ab7:2110:6a1d:efff:fe52:1959])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c39086sm746485e9.10.2026.09.09.09.09.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 09:09:18 -0700 (PDT)
Message-ID: <a6836306-a60a-4bd9-8173-0bd759f73dad@6wind.com>
Date: Wed, 9 Sep 2026 18:09:17 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH net-next v3 1/4] netlink: specs: rt-addr: fix the type of
 target-netnsid
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, David Ahern
 <dsahern@kernel.org>, Donald Hunter <donald.hunter@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Ido Schimmel <idosch@nvidia.com>,
 Jakub Kicinski <kuba@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>,
 Nikolaos Gkarlis <nickgarlis@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>,
 Simon Horman <horms@kernel.org>, Stanislav Fomichev <sdf.kernel@gmail.com>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 netdev@vger.kernel.org
References: <20260909133247.113923-1-sigefriedhyy@gmail.com>
 <20260909133247.113923-2-sigefriedhyy@gmail.com>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <20260909133247.113923-2-sigefriedhyy@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 09/09/2026 à 15:32, Yuyang Huang a écrit :
> The kernel parses IFA_TARGET_NETNSID as NLA_S32 and rt-link.yaml
> declares its target-netnsid as s32, but rt-addr.yaml has it as binary.
> 
> Fixes: dfb0f7d9d979 ("doc/netlink: Add spec for rt addr messages")
> Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
This is a fix, so the target is net.
Could you submit it separately?

Regards,
Nicolas
