Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.160.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794873355;
	b=C1ihGjX+By00lZ1+Vstkf9q+NBjblj4fJfpFko3Sx0Qv+tSK+WVUXCro4mdsEM+HzxRr
	 PfMrx1fe2cXKwxuaOXGRhQXIpysvRQ78Hx845OnJW/NZe1/wdWMoWI3LgOGTQVcY94Xmg
	 gUJ02Agbo+599DoNyL2ZABOea1WzWpXaVc0mntJNyNM9IOkHkEDp40lmpyuNt3lRDu9B0
	 EXq/eGPLdwejO4lDXJaDiKkQFp6mw/6wdNSwWzdF53ScjlIl+ffJ7cG+fe0XDi9aBO4xT
	 JDnZi+YfHStsQbWZnv7EH4cONCMeHQdWnKIicpmQn9lchdy+pwh04Ae2VzeY/EV2LeA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873355;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=pBcsIqN5fGPsZcVWkz3kK83U3k9KWzXvm7Zsz1tEHJk=;
	b=uxsQJeYlTF/gDPjC1XAsYKG256VknWsVVMJFbgl4r2ASeGIGAvEbg90DgXuavnaMewlz
	 e+6mKnOUVicjeoXP3Z2w2CxJEZIts5XR5Zb9TemCh97TRDnR1O9ZcEB/DgbbdSxcv7pye
	 off4hxi3Qd5Bof7VUOuEE6WCKbDKWRBGjMSeZpZqTkIANc+w6M0Lhg4EmQQSnXWxBx6fs
	 tVGH5b6N5EeSS83Q/RbYfSjjAK+F/i6AO7Tz1n14/ufBYDBuOmR508NKvJLAES9OXSaoN
	 aLm7koEkWp4GWLvYGzO9EK1gkmsgCzBuJEgdBJjkoLrhTN6KmC09ZNfnFtxexmLo8Tw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=JAkvmEBC;
	arc=fail smtp.remote-ip=209.85.160.41
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA18606A329
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 23:55:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDA18606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=JAkvmEBC
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-48eee44b908so3017179fac.1
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 15:55:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794873354; cv=none;
        d=google.com; s=arc-20260327;
        b=Rclj7wAMgtNXRNibsnJxU1vfHhKcrhVLDbnm+VnOqhpNf+A9LPcGzj3OcPR1mU5EYt
         uwx+csu9Wlwga1YwQpCqTDd8z9zABzJ2p4pa/jWoNGaYNt62bCRaEOtgLYtB3ueXp2Uc
         yvmANp2u214SLInR0hruC0rQUrijF/Wkls2+L7effkENM9RbaxLdsqdrDUG5QZb+LzxN
         5sJ2bwIToawNkWIfTIvWyt22XnSaoqf5fIc9WBTo5RF04pw45ApZucSUOm/AvWoJCeXE
         hf+e7xtzM0FX8lrsCgeqbUdAjfpa0SBfrLb+TtEZFNUr7Qg0//5qTuPN8gDUg91OWEUf
         GEog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pBcsIqN5fGPsZcVWkz3kK83U3k9KWzXvm7Zsz1tEHJk=;
        fh=hY/B2OBC4dIcyte7dxnUs+vBrsBbEgEiumu1pPL7xZs=;
        b=jbcW0+LyBYeeM3ZtYZudo0q5zLzIN0UPRiTa7IgxbhymJBNbOEHYBWoRiI5v8UftA/
         hcgtAKfU9XJWT4B7f3qXD9jIRQ0etWLCqE4zq1Y+RWnZ82gOK23k6MIhE3HkG/09bdu7
         fCGxHHP8WGqesIQsJsdwe4ul8Oh0/NUR4jfkcJGER4WP2rNcNlUK57noFKDnVBkakNdd
         mrUGJ0TdURwIHikxT0phAf4kvFjaq14Pdkw4POQtajATHxuWs+akPcsyfjnAKgygOdU0
         72RBB0DjMQhFA39ujrvFQ7yNDAbdji2xzTFFpdtRpPeZ9ytfWiAyVkvRI4sXtdjWdi/k
         JKkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794873354; x=1795478154; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pBcsIqN5fGPsZcVWkz3kK83U3k9KWzXvm7Zsz1tEHJk=;
        b=JAkvmEBCaNDQqwC/zKowMzj6cpiI7lgA6iaz0LI7B90FIdYKT+zfc8mHOfbT+8rfmy
         SkxZwQ9E/3nRcFpOdPfK4YkO31ptJrj017y76GEN9o+sriJn2LpPhsvGdy4+6ZVs7P7b
         gWmNIxbWSERHhTKd2zkL1m6C4vu+dM8FCwNbEDFmf98bujAm6BesiHJVeKB6Mv37oIXE
         DWAm2yXQzqAAVjsc+DybarNPT6YXVie4MGJHRFFkjGvmOyHEShJDDqv0maNaWckg64Z2
         L/XJP7qjo7r7unFg1B4QzrVD6lfR0b+R5Old5lYIyjznlmAyd2cbZ0Uxx0FLIGVM4o9N
         a3VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794873354; x=1795478154;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pBcsIqN5fGPsZcVWkz3kK83U3k9KWzXvm7Zsz1tEHJk=;
        b=vFnQmZbkoONwR86DReOAZwUZ/knGaM1DLhBEBT8eeNSY7SJ+0H8pEesYNH9qp7MNRl
         QqjSn5E4Wv6woEXmLUUxDABcqYq02iCEEg52jDusA6dwvu75Au6ig0/wXAwcCHwV8dm2
         yZbUVAfWnm/77J0WFNRIdLKC6eUkAB60lQhfmms5Sp+f+WxKe4Wxs5p+4TsucPmFcNVR
         L6Ha405fNc9WO7mMMIwtHB0wbcFwxxWjgPXyPn5GBvlMcP8vlJS0eK1Lttu+XUvgu+ls
         RjNrPWe1+g+MM+8JUcBai7dCYUmJiw9vgPIqLxdkCV/FjdhWqOjMWBEk6gNkQw7ataRZ
         owlw==
X-Forwarded-Encrypted: i=1; AL+hErHbWl2jonUqSbIIi63BSp939u56n1YuUz6mJhHfMKunYifQdJUdmM6IumjIQ/dcycTwJedTCjc1AURdsBom3Vs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KYs1Y+1wJUMppmSPBE05+0tsT4YzRSIvfqswf0WdXc+sP7K3l
	XvbBpiN/xNwtHhD5cjhyDg1yUyp6avryGsnMZoxkau5JGvjExttBap5L9qwVG6qvoUAQMiQiddu
	SydJVQK0PIymxB6rW2tROI4FZvk+pbfv2RUC/HxWSJA==
X-Gm-Gg: AYBFou1m7nNnUU5OUtzQWATHN9kE5Dk7eid5TFGqLF6/xa37zayZaAOVG/3LkvX3Tqf
	KlLu20itDHoqZbrzWNj9tKTSR3o0mnxvlNB9tIS5uOF2ah3YEplMERqIGAJBOwqeYERHJ4V3w8D
	kGGvLhHklvgNLbRsOZMQ1w2FvbtafpBvoPvQ5R3wndNWUARLueZjc2FhNLJTwfzD9EECDj6AD2C
	Scln7eJVx0InpAgqheIC8nMF+3iCuvtrac2pHlczwc7oB+Yg/M7CiMJWpqr1Sgp8H3bczXKUWxU
	xckNHD2qzQhUSLjN76VxLh/elbfcAAUJjFMvX428MiFHHFQ0pKYbSsF6cuDz9Ml6wTLHcn3E+o4
	3Kpix6K1FV3cdxcOctO5qbI1EGA5nEcKJzNmlQsRSFt6bGTWbQRKpCbIK1PgrsTXIcLnGZxyioa
	W1lK0bYn0cDQ==
X-Received: by 2002:a05:6871:b2a:b0:494:b8f4:9a22 with SMTP id
 586e51a60fabf-4afdf70bba7mr10365207fac.28.1794873353687; Mon, 16 Nov 2026
 15:55:53 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794281983.git.tianyi@cloudflare.com> <avOvI8xrHI0dwyHj@devvm16445.scu0.facebook.com>
 <CAG4wq-egD55NZDw+OKVKTKN2tQJ9oKEC504wFv=xoMXyJ-0z4g@mail.gmail.com>
 <20261115113902.4834dda6@kernel.org> <CAG4wq-dhd5a5zxQcSShaKifYd2z+pMpHaCYtZJRX1QCxEH4dfg@mail.gmail.com>
 <20261116142710.347e8571@kernel.org>
In-Reply-To: <20261116142710.347e8571@kernel.org>
From: Tianyi Gao <tianyi@cloudflare.com>
Date: Mon, 16 Nov 2026 23:55:42 +0000
X-Gm-Features: Aa3M54oRvcr-c3A5HCcCKnOxqAqDaGkfnfsAP0Ey0SL0I7zgF2gu0s6ZsVqnle8
Message-ID: <CAG4wq-cDYa2GkpWSYeOLwEPv45BtucZk+r=N2b1Srd=gUUO4MQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next 00/15] xdp: add SKB core extensions to keep RX
 metadata until skb creation
To: Jakub Kicinski <kuba@kernel.org>
Cc: Stanislav Fomichev <sdf.kernel@gmail.com>, bpf@vger.kernel.org, netdev@vger.kernel.org, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
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
	llvm@lists.linux.dev, kernel-team@cloudflare.com, 
	Tianyi Gao <tianyi.gao@linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Nov 2026 14:27:10 -0800 Jakub Kicinski wrote:
> The question is _why_ you use it. Let's leave the cpumap case aside,
> you provided no legitimate reason why having an XDP prog in that case
> is a problem. With veth - you are right that attaching XDP causes
> problems for pure skb traffic. For veth cases, however, there's no
> strong reason to delay the skb allocation. Hence my question.
> Why not let the driver allocate the skb if we know that the
> redirect target will need to allocate one, anyway.

Sorry for not being clear enough.

On the setup we want to build: an XDP program on the NIC does the
decap for all traffic. The services run in namespaces, so the packets
must be delivered into them. Some services attach their own XDP
program to the veth, and some do not. The host does not control the
service's program.

For a veth with a program, the skb path has the problems you mention,
so the host uses XDP_REDIRECT. For a veth without a program, we want
to use XDP_REDIRECT too, so that the host delivers to every namespace
in the same way.

In a minimal benchmark, pktgen sends UDP, and perf stat counts the
cycles on the RX CPU. bpf_redirect_peer() from tc costs 3% more
cycles per packet than XDP_REDIRECT with the checksum status kept
(mlx5, one extra __netif_receive_skb_core()). So one XDP_REDIRECT path
for all namespaces is both simpler and cheaper.

> Since your patches are not a natural / clean extension of the existing
> infrastructure - we should step back and make sure the use case is
> practically justified.

Maybe I am missing something here. XDP_REDIRECT into a veth works
without an XDP program on the veth. To me, it is natural that the RX
metadata also reaches the skb on that path, without attaching an extra
XDP program.

Thank you for taking the time to look into this. I would really
appreciate it if you could point out which part does not look natural
to you.

Thanks,
Tianyi
