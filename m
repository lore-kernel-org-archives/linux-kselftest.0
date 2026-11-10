Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794325556;
	b=pRRsVJyWk2a5CfNf+jxoXpljs9ERBGPi5dzs7Iwu5FYNmCM2n/iRsUlclyyyz9LsVrZT
	 7A/EWVh6sN3HyjID7w1gN8hcKWca9Ucue0DU/CR7atiXgwiIqnyEWghWl3Uz+PtrbXmTh
	 HB5f8fBDqnHLASZO0QqgXIDfZ7cMLW8uFkbwY4xOq/iYj5H4eIPT7DPuukYYwN9U+yP/j
	 YNUICjEHyE1/vOwHb38d0Se1DfRf9LMfXwNjvhf8jzpuPj4Y/asM+9ymIhOYR3QNWnstY
	 Ri/MWRBKmf8AhaFLmL93ZSHKQYFXgnoBIQHXF3UKED65f20UpZjLvcChG5X0e/pKgaA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794325556;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=4joyfckgOzoxD1v9F8y539Lxr07wRquNtozOKKoNpYs=;
	b=FsxvK2xzYpUcOYGQhCciUYQW214Cmi+nADnEsMeRyr4lmoL2VNJXnAJEtl6kgGzjnk48
	 DtvnXBHtqxa5C34J/i1OC7VkEIJFLRzQQYzCBY3Wqv43v/+ZOtYsUfbtiNgmj2P0Of58T
	 gScmDgaJ3CyGGlWXNitvnZrt0cm17zvFcEEHH+GABGxtfCQEXkdhh4JAejuPBHO1rtLsQ
	 OPpqNakFR3nsnmINnCuEObKq/0b8ZDdmTElp+TG3j/fXUGAuaCSNhFq/EUwNE1lYCzRzE
	 FNbejE5LM8cyS3qC6El2OOTBzpePpl1AP75GLP4bIRa/AetmehN//QwjloaKxC/9vZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=eZLW2NkF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4025C606A32E
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 15:45:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4025C606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=eZLW2NkF
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-702dedeb70dso1098745eaf.1
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 07:45:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794325555; cv=none;
        d=google.com; s=arc-20260327;
        b=eH7FWPtGx4Vl7rANS+ZrGgQL4jSn3gv5S0eNfcqTblc9vQYo5JdG0ez/7eDL2LPPGK
         WxIuGWfuIpsbLDsf2aArfgSQL/xHZKnbT2rRGjZscR6ZtgBWYqF9lNLAypL8E5GL8R9Q
         Xa1THA6PZ9iOGgt6a8R0HGIjiup8w7LzIW/UTyLOTAZ3AMJV8cpCm3jU0EHgPiCxV/2q
         l6w0V06t2YSwyTfMpT/stvkb/mlTuhq1C580rz5iI/UrxXA5Vf49HoxsbulwDJYt2Ayb
         9fx7syhwBRqoJG0UksmJ22UAHx9JR9P8hI5JN6B8Fp2gsLTfWrLrD+M25TNsUs3Z2m3E
         oBqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4joyfckgOzoxD1v9F8y539Lxr07wRquNtozOKKoNpYs=;
        fh=kvJK5KJQYDptCEXmHcvUDC0/sNo4roVPyyDicP1JUq4=;
        b=GV7J3n0ucorslOh48xK650Qk82YMx5zsJkGq3mrTnHB1IQgGI2Yn/QIWpDML7TEOsO
         9QFrK+viGPlcCnpuXohmHdFuxlyxr91u4bIBr+GrpbusdAZiD8GZoYKEdGosY95yW0uq
         rtfXAEcnTM+3npacU6LEhDBHH2DrO7RwnMm7M6dnuk0mRl5QGvXDCuvQaowhRVTooS6+
         agVldSDkX2Yia+T/RVavATqRjFIUFDGtnkpX3/rTEKvnIWs/HPfpyPatZjM6+/4RXOSF
         regMnnMpDCo68TFYfWCuXLMBMhkbTPDmkwjG9PsPWMA05G43zfcZo//z/83P1h/vCK0B
         n3Sw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794325555; x=1794930355; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4joyfckgOzoxD1v9F8y539Lxr07wRquNtozOKKoNpYs=;
        b=eZLW2NkFr/j9icFxNcvCAM88kGStK/E6aBuXF8X9PTB/TJstGOhvTD+oxnr2K/CFip
         LcDYPep9GKsBbabgbijJK8fW8Ri7k+AQgTpbE0lfmYbq++4uEecMHCP8cJy+ASy5Fn1C
         Z7cmYFLcw+cxPvYec6ZFIcz9h0hx9GUCZQNC8nte43cm5qiHbXRbnTNHTBl1+VeMbkIY
         uqoY4pDGStIpFAnESbzX/o6nCQkRdYtqB95sCYlkXriJV8MXiOEX4NtIJW6wkeAwE2IJ
         9SnQ/rTMEtIWDIXK5bSkmaqWrqOPx8mk6cdC7zj82UixmIlP+udjnEbIS9a3pHbUWS7o
         nsRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794325555; x=1794930355;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4joyfckgOzoxD1v9F8y539Lxr07wRquNtozOKKoNpYs=;
        b=aLPb+Tf457lD2fZ4DyZ9FvhMHmu7n0ZOC+/dZZTP3jaQ50R14PBOggyKFMtYzVWDtR
         L2FPB8GsxVgbmUkzVK1fuZ9MYWTKpvWuWswOxiQjYCFPDHJ16KjBcXPRvgdrzSU0RZ47
         PHqDwgnUTEXYxHW8AspKWYGB9XyEzKVEY67CO1W1ftaXRVjwhKCTIAuStljHfAI28pd4
         xGZaGF12kU0gxrhd6wFMt8fIeOXn2kxx5QbXxqFtbNF1+3KJiUrmXMDmzIdeVmpQe0VA
         dN9y1LB6dgUNcnzAALPNAJr8jVe6pkJtXQ53AthJu4eW8r68L02y+sWYAIpYav+dhvN3
         0rHA==
X-Forwarded-Encrypted: i=1; AL+hErG7Wd0ylO6YAcNy6BjLsQ0xyc1iPVlk1f76O/IQQeRbBO75aIeRN6i05b+GYWjIjEdIEi5ZgkgZ6aTaYaBsuKw=@vger.kernel.org
X-Gm-Message-State: APuU4Z99p+Uu1fO6Ss97lTJTJQFvy8XJdmqZawYKs77GHD5ISqxlDhh0
	vASzgvWOu3Gf0ci9FttZsWr7rWE14eiqhlTJb1MdazHlk6i/++VYc+OwSE2C4rO7lM4dVmp/8+I
	IipbVhNbkbEBEE2LDMUPQSHQd1msbTTSuwPSVZZijZQ==
X-Gm-Gg: AYBFou3DnbbYOFJoo1UGMmRuTYYfrj7zJwt06BMqQVwNDMS5QLgLASj2zP9YYk0yWF9
	tLmZdLljpKDgJsTTVLRG8kQMazST+k1wYWH+fVY4c7+egw8zHD7ZnVIHXkqSFDVPg2yyzcl+00G
	QXx4P/Ykl6mCv4G5tC4A1onU/jOvn58IbsOoNACknPsSBuUqeUOInP5u9CT/Np1SuQr8EZXPvFU
	ZUEsmkyNNRwJkCgbV0Z0vaeQVYAJ6Ff7O1zh+caO51H1ptvRtEggUJ7TiN43BKfpvLVba77C+Td
	zy5yOZLxp+qLB4PHJbwX13IdwIzvPs8SWmwaYLcZlDHEpGYjh7IY0cQ541nWuDIQlX9VKMFjHVT
	dtvSGo3+qZdiSPj0ppeC6HCcduJcoFvggby3KZsySg2Nj2cKZU/U+U6SvQmdcoE+1t1gJFg2Glt
	hVfS2O0+Iaaw==
X-Received: by 2002:a05:6820:c2c9:10b0:716:ddaa:40eb with SMTP id
 006d021491bc7-718a4f92ba9mr1015097eaf.28.1794325554928; Tue, 10 Nov 2026
 07:45:54 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794020868.git.tianyi@cloudflare.com> <73b9d23a4190cdd02e89d3a2ce8a1a21ad5feadb.1794020868.git.tianyi@cloudflare.com>
 <20261110073807.2fa62e6c@kernel.org>
In-Reply-To: <20261110073807.2fa62e6c@kernel.org>
From: Tianyi Gao <tianyi@cloudflare.com>
Date: Tue, 10 Nov 2026 15:45:44 +0000
X-Gm-Features: AclHuK9D14tZ4FX3CoGnuGmDbJMM4Y36vINL_kHffGczXiZfZcX98tAF2DEPmTU
Message-ID: <CAG4wq-fJfKAiCY2Z0Hv_nCBM+8gKSBq-N2Xc2KfKREkRL-VDvg@mail.gmail.com>
Subject: Re: [PATCH net-next 8/8] selftests: net: tx_extra_headroom: test veth
 peer at creation
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
	Eric Dumazet <edumazet@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Simon Horman <horms@kernel.org>, David Keogh <dkeogh@amazon.com>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	David Woodhouse <dwmw2@infradead.org>, Dragos Tatulea <dtatulea@nvidia.com>, 
	Nimrod Oren <noren@nvidia.com>, Alasdair McWilliam <alasdair@mcwilliam.dev>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Magnus Karlsson <magnus.karlsson@intel.com>, David Ahern <dsahern@kernel.org>, 
	Ido Schimmel <idosch@nvidia.com>, Alexei Starovoitov <ast@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Donald Hunter <donald.hunter@gmail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Breno Leitao <leitao@debian.org>, 
	=?UTF-8?B?QXNiasO4cm4gU2xvdGggVMO4bm5lc2Vu?= <ast@fiberby.net>, 
	Danielle Ratson <danieller@nvidia.com>, Kuniyuki Iwashima <kuniyu@google.com>, bpf@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@cloudflare.com, nh-open-source@amazon.com
Content-Type: text/plain; charset="UTF-8"

Hi Jakub,

On Tue, 10 Nov 2026 07:38:07 -0800, Jakub Kicinski wrote:
> Please use Python YNL directly, we don't want the dependency on iproute2

Thank you for the comment. I will use Python YNL for v2, with no
dependency on iproute2.

Cheers,
Tianyi
