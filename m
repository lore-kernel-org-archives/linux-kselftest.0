Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794962589;
	b=FXUEbF9rN5YlWJejsygKwEgg1ommtgdJmhQGuqhgYD4OfwaOcmPJgXc2zM565blH9S2n
	 swkUfHslZ5TARDPVi7kATacMCJ2qjAYxRUMPybk0vXv/thLHEqSAGfRtWtKHlKUbsF3eN
	 zecFnQrQTgRj9Ta9O7Kvt2/jyTrl4ajuy72Z4qKsW/wEIoyEDMxM3iHWWTNVyxawQu/fe
	 bGIBgtcuoVlSYrzCQU6rdMrBhL5uH9AgkdgFxVX9rHjsZLqoCA6Fi5ZPNcUCHcZ5ZIRuT
	 LgzFqbw5vY5TwdNbqy/5M81sB2lUPwYI/VgmD3G1pJOXU9UJ7U1B2EV7uD0hPKvg+jg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794962589;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=puGtQjs5QpcXV8o0ei3pWVAJkBqePYnUROGDguXC5No=;
	b=vwr6yrswjOxW6qU7/UkHW8CkLOsk8Y3CjCOgi5DCa+LdBLj8+jC/Wx6ys34Ix1yNhwCm
	 zJafdVpvnh84lhld7JRsMOQFqkIu72Vs6u0tfSKdyGTQ5+u8J1/5CTBDbHr81ngjLDvtd
	 QjNPNtL1ezvfNydOLG2/jwcQ3lgSnvstJX5pHQhDpG6mcr4Amt43f5p6YH5aZvRXdjn+k
	 8yvbaAPtq6+5RA4xC3sVjXNCpaeBwCjBJuBVelIYLYGjwlKV80NKJQO6707s9LM150swj
	 HIZdPjZV7HWdPuPukPo8yxZ7ZKoLmVpla5jWrq5kodNJjM3OMhAMfQ1emej9dQUesLw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=QoQgSM7k;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.53
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F740606A887
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 00:43:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F740606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=QoQgSM7k
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-48eee44b908so264816fac.1
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 16:43:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794962586; cv=none;
        d=google.com; s=arc-20260327;
        b=H/uhe6ly9XdejtbuFXbE1QkbCneJ4mYGwc7zWw/E9CJaxAiFtcA/y422grU822tGEs
         QiBC+/Ixxos7bGtACExCUuOh211t7Q7hKALanob+FZZ6vhzXzjz9Fg/n9YS+dIMgO35L
         wPKcFLrUf5OSQQc/kOggqaiQiC4tK03kzhC7VUG4/VNcs29SDS1hSuRF7rznAPWP0rDL
         XUh4rNhviUXyKdlsl2cZZvFzV8h/plbI9oc51G1OEplHVdCpHsX7JC/mMgtukebs1N9H
         xSSXhTfyNVEx2/DVbx27/JW0ld8LlYJKHcHYkFNRnaov69AGbt+Q3aEgWN02Y2rXLrmV
         WI9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=puGtQjs5QpcXV8o0ei3pWVAJkBqePYnUROGDguXC5No=;
        fh=7mAKzJIx9Gg383IBgj8bu9dRp/4v8T0X9Y+FBuabST4=;
        b=oKLJOuKaNonDhJGf5cO9DrwlDYbPMTOOXiZPX2+hztL/+9yfKJW2EfU8lNB4YbmCQ+
         8QIRuRcct+r6Kz8pwPOx9DXuJSfGAMNtsP1i/ZNQTPf0RMJljai/VV86TWzmVAjnYcyO
         sPPfy4bajl/xAuuvfCCYyVbgOi7XI+WneMA7GjiEnkEfXLJDxOmnES63EGlqei3EiPO6
         YruIKK6kX1nBSr2Y36kIskHur8/8NSmq+g3bkZ3Q/qfnfehc7BWD/1Ynz+PlK5HJXw9l
         n3tA2rxwUE4zilBALJBnne/fMYsG7aBMQCpd/GOrcGWtqQZCrRV0sMDVgaqPc/EDIVI4
         z30A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794962586; x=1795567386; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=puGtQjs5QpcXV8o0ei3pWVAJkBqePYnUROGDguXC5No=;
        b=QoQgSM7knlmQduEbalOghi/sOtbUt1RV5d9sPkjYyyVMIE6R1Kp7b4wimTkhe2Yx9I
         bQMdOzdqMed+XivU6bq71iIaeaVoVc7sZyWfap2u6yi7mll11YX8P49J3lvA0YXdc+nX
         ZTDSbaBadvIpnnxmFa+Tri/OuLybsQtUe8BaIEz6Et+INEWS1J9mO6tqyrP5pRBfS2ys
         K8BEF2IqiQQrqxBY/1lNDNLhABCxpAGq06QUY+MXEHZICS9TzjnYQKppfWjSpaRhGIBF
         ogBWvrfRSzVZPHTPGNTRNdjyZ58WBn0UWOcANINrg0lCJV4LPen6qxERF29IH31qzMuS
         ngZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794962586; x=1795567386;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=puGtQjs5QpcXV8o0ei3pWVAJkBqePYnUROGDguXC5No=;
        b=PY+xcRzl+xZt3+7SGAzjB8JNLl3w4cFdBiSNqFqLiB50/KsOMzsHFzH3lygTuOFtDF
         grr+qKgISv1uMiX9yaEeFRGv81pq6qBREGxKnbqO++KwC+0DH4vI7Ufvs2ZIdKUR9TZ5
         F7Gch968piZbfhj1211+iqvR8eUtb9k5sYotaKkSxriHTdw2KIsYpIprxrvO87WTJjim
         uGyTgF19YByLL/D5b+1DRx5NlakOyDLZNllE+yRSXvs/ji/xk6wGMsdXCLV4MCSSzFN2
         RK3dQWD7c6r59K08y6545ylFQLfAdpiWIPjxA+jyY2l2Mc1XCIpxiBHAYF8BxUempDUo
         0mVg==
X-Forwarded-Encrypted: i=1; AL+hErEYY2qY8wBqJ+JCO+TH4/5Xzg1OKkS22QuNvbhlPGYj7n9fGKZiEx7TOVcP42yzmiOvZzktPDs7S2bFo7RJ/H8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8c/ditubprZQX9VgNeRq+ZeKIZ/g8KU7v1TduJSOyKR0GMVpgW
	fe3JXrD2hSosOu8imqQw4c4X1N+LqO57h/8Ho5tlyX/8ahKaRx0ELEA2YTWmcQYNY/iJbqW2+Xz
	MlxbgqKAJZG2v/wlaDyjQij2VWMSE1TmXaRb7AtECsA==
X-Gm-Gg: AYBFou01o/Ge/ly3ghRL38NxVbxVwuMk90KShVERmhU2lBF5M7O2NH2AbtrKPnLCUPI
	p+QK8Xe9B2tdfC0P/Ox+uXN8iHpY13P8iXNcyj++O9gQrguPDQ5U7sGHBVvTeghYi0lh/6wIzF1
	Z3HOOW9FF9kTD9zEc+vm7lukK3sR1gRj5NA16YwlPf2XWuKj5Djaudk36fB3nDD2K1S1f2YCXiD
	PL4M6wUkASlSpxVMr/zGJormImG+sPWTPK7ccSK/Ls85n7FqDMTNcxMPrZmaj/BMeJ9sgsyrs8O
	F7AbaJP+hotGobivtQt8BLMBsQWtHyOrcc2ZvxjQVgpoqSaPtNWTyZJzqyfPkKZPDLA/1NZo1rZ
	Q5OGuiN5XAsnjL01UHHxlgniiwr7amIwiMVAgqEaGM6l/8S9S+MccqXqggq+4zFmNw43y3q4rbc
	B1Vt1LUDXiMA==
X-Received: by 2002:a05:6871:b11:b0:491:47e1:6280 with SMTP id
 586e51a60fabf-4b75bb74ec7mr770348fac.15.1794962586147; Tue, 17 Nov 2026
 16:43:06 -0800 (PST)
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
 <20261116142710.347e8571@kernel.org> <CAG4wq-cDYa2GkpWSYeOLwEPv45BtucZk+r=N2b1Srd=gUUO4MQ@mail.gmail.com>
 <20261117161856.6f6c2ce9@kernel.org>
In-Reply-To: <20261117161856.6f6c2ce9@kernel.org>
From: Tianyi Gao <tianyi@cloudflare.com>
Date: Wed, 18 Nov 2026 00:42:55 +0000
X-Gm-Features: Aa3M54r-Qn1bATmm01-LGWkLr4tuoSPVNlK5FfS3xcLFtqloul4EQ0s5CX5Sq4I
Message-ID: <CAG4wq-cQVUJgizeowhr4s4Z2Q_o0_dWfAwzXthpBATBB-7edLQ@mail.gmail.com>
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

Hi Jakub,

Thank you so much. I am really grateful for your comments, and for
spelling out your views on this problem. I learnt a lot.

I would like to share how I see the problem. I understand that you
want the setters to mirror the existing getters, so that the metadata
stays with the driver. But I see a fundamental mismatch between
reading and writing the RX metadata:

- To read it, we must go through the driver callbacks, because each
  driver keeps it in its own descriptor format.

- To write it, the target is always the xdp_frame or the skb, and
  both are the same for every driver.

So to me it is natural to set it all at once in one helper function.
This also makes it much easier to support a new driver than
implementing three callbacks in each one.

Overall, I feel this has turned into a deeper difference in design
direction. The same question has come up in several earlier series
too. I will discuss it with Jesper, and we will come back to this in
the near future.

Thanks,
Tianyi
