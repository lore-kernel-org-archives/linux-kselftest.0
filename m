Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794255465;
	b=JAzytf/MDXReIEKqEa+bqNceZuyAyd44/kkhiS/HJWCOGFdwptX+w3dnxYI52pXEIgab
	 2SmN1FE2DFzIG08Mt9/g3Z6IuXNWzdokObsUc5VldVzWt68vHInCOJCMwsutwdBbZsjJ1
	 7qQbmayVgp5OEjwe3DajY+KBxaem+7/JbyBEe4NwCfez8TkHc73p6EqlyXZwr/B0/lQmj
	 DvyCzF10RnrkmjIVtxFotExSmikBh19NEMiNB/YM2jY6Qx/akiHz1XZoCJRBFovBExQIS
	 1WfhEcUsoqTGgFSksIIXmtCFVhPcSQf/OlJOq0pT4KceFxBne7FVKCdE2FpiyREoe3w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794255465;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ltRfrvbZQq2u14YHzE9ATEjjt/vP6akccZZlMBuYSXQ=;
	b=QshrIirxAusgKqeKsNfacJKlWfETJs2g3lLErR7qbqMlhbX176sG1RzcLkFa9rKsmK+t
	 KlNG8Irixn4XGENg250o4QovxsTLw/7soTe4DmyxcBDDz1QcqxP8CvfIL6hGiNlKWsYda
	 /wpJd2siOcwecfJS76NZdcSTN31swd0YqGtqMz5mIJ8Yu/kPENlMuo397l8aRLxQ2HAGP
	 hiq+VpTW0v+WyRCz3oDSlB8KAAXpHg0hKfEnpDpLyvvLQZ2YCZ0f0/jXwtqq4ej3BDzCf
	 uv3BbeEYYoZ8bXCPZY3e88ygHWTyO3AT2h5ofNEDHbfv9KPdxWaa5EmtdAJnIoUCAOA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=P0sZXvsq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2C7606A325
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 20:17:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C2C7606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=P0sZXvsq
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b56c90b38eso3100a12.0
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Nov 2026 12:17:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794255463; cv=none;
        d=google.com; s=arc-20260327;
        b=RPetabrQCz5Ttlt+yIA/mhkOsnx7cMhZU/H1Pp2ptMbMnMQFITiSZJE95cNrOy7jkC
         lcXmxOISXbgv3eU4MlVGhRRQNhRsIlG3z1eeuVWOjhXb47mSs+7kEwjrq2z/k5bgITcP
         LVimjKkslsKPpAhSHEbxmnNg/zWbYlNSonUHGU19s4s8kHXGlDPfBNdBIUBsDVNjDPxQ
         oL023TKAAvB7LLiZ8s/+VuCSUjI5CEIlCelUqw83vCokF4aQmwoq6Vc7GXy8eYeJPKQf
         KDdk72iytsFgEynWg/wWRvAWpbFEuHz4AOWObVwDJQ5wCXwakS6lE0iWgPUN7TFKyOI1
         Dbcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ltRfrvbZQq2u14YHzE9ATEjjt/vP6akccZZlMBuYSXQ=;
        fh=/s2fLdcBOuGOi9Ty7dIXfAZvEunhXI2upq3SR5l9JrY=;
        b=Ah780H2gxk/Wb7BdjRr4muX3vipFFzQPHP44UlPJ9d5QKgFUY0dzu36rTQ3b/FdnRq
         sXZzvakCWApeV+bw1TtFNZvilACX0GK9+WVgmXFLYBmpvkVCIg9xFywGF64WM7ULWLBk
         iollHmQ7/+K7WwKWlXmje2uEREm2+hNQWNW1Iru2bY4eBcG+4582KEmM+9Z6GenvjADz
         XfHE0Z7ApD3rPbQhrZnA8hSTV4CAVmJyOY1ieCGI4Ypo4Dmvl1zPg2VIN0sbntFq+noA
         B5HIOkZsrT0ZPgHZ3WEBkNedyNA0+Cie+7Ra6owP9z9h5oxPFWprD8czNYXoVyLL4J+I
         uUuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794255463; x=1794860263; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ltRfrvbZQq2u14YHzE9ATEjjt/vP6akccZZlMBuYSXQ=;
        b=P0sZXvsqIohLE8Gp0wvO3DZJR6gUx3reQ55TVmSn9CykBgFrZfrQjaLL4smDuM0j1b
         5waQ6jjkuJjTO+9bK6d70m2Utj/Bo3ByzfIn4qpnN36A4OGr4mTtX+4jwHJPIdtm2UYI
         zUcvRkOzUEgrz0Rkzq4ZKf2kebSPB1+kFy/+FfAG7cS+e78EJV0P0VlujXhU9iu9Hp0A
         8i/yBt+1uCLDsBJyHn0CJe6rqPWpfuqyQiS+hb/gskzYbsqtWwWGnajuRq7Q8FrF6ozZ
         eZEXUqvB8fN1LtEJQnXQhyPhUQZhECtR14nfrxmKUEg2/dcOy13bALzuaFxJftMKZ4jM
         dprg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794255463; x=1794860263;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ltRfrvbZQq2u14YHzE9ATEjjt/vP6akccZZlMBuYSXQ=;
        b=eL5lziAYS6Df0LY1jIdMeecN75YT/lVxFDx7Edb4IT4uHwR7tO+IuCk+lPStXkgyq7
         +16fbz2TM+k1nQR+g2DX2rNLW4CoHkXrEXo1wl8bJ4rghBP5rQNAmQeOILupxlSu8Nq8
         8CfSPyIHtgVkvxxVR1PMwqn4qxJ/BY4qw5MUWv/vQC3VOsCTf0IGLtjTOaugrYzD2Yn/
         acDKKiWLFFM5yWxyUvaBJYmTiHpEaqxJ4GlKixo7xS+QLxFg5G5Uh1hWnPzzWrkO2XXy
         oMSwOq6Dj8kCsRBwIKYaN91xx7Nt86P/h5PH8DmjTmp2aYLzy3YU1mr4ndM3USfFBz59
         Bj1A==
X-Forwarded-Encrypted: i=1; AL+hErFWV/ZpgkYzWA10ik1PmZj5g6STkE8Heizj37Hbi7Idi60Y4zqbujFejKGAcdZY8a9C9RY/2EpaBA1L/F+O+O8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9m4CPfQPzAQzvsXb7BSTWFwj5OI449sGM8L9058hGjpfZJyzhn
	OjhMa8+dZIEkS4E8XOsP42ZqYPBi6m+tP1hUqM9eOVFJJhvy25750EDPfhMikKN8FmODk1cWL8T
	tH3xAqQUrs71cbmGW/krzUZiuW6PI8DC8Y20xl8Ta
X-Gm-Gg: AYBFou3zG5ClaBYZEUBICecbrmLoIjjFkwkkNl6ShVNQiHy9kuY/zvE4q+xk2bfEnmB
	GJ/fHaFwFKA2ukZRtPFGgeWA9VS+AHGGnmUFGxWl1l3pHlgT50EobYk1Gp7LUTQIVzV77EO6ljD
	6ufMLjtr1yg5WcPK8wTK5+QawaWvymgBbELRpuaMeJIvYwHfaPDP/RFxyNTvWD2CuQoKg7kyfAL
	Tic7N8dlj/UTCBlyyWYA0QVGXGuNI/gymYLsyTA1gSXk2M/fKdjbjcSTBrCrq/TUz9btaCL2vlp
	arSeKIGQIxOClKTEnC4UqVCYzJGNd1uAAeOsmRddkUNb3R0jPkfpg/ZjN2ZkfrRmUtFDlHmvPjP
	11nNun1ftiVl1F8W+pJFZovAPU9tnKKBPlb/AjqIcDhoL9741rBpB61IpfR5SvI0Gf9M=
X-Received: by 2002:aa7:d7d3:0:b0:6b1:a517:5bce with SMTP id
 4fb4d7f45d1cf-6b756af180fmr22485a12.16.1794255462346; Mon, 09 Nov 2026
 12:17:42 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015163915.1166043-1-almasrymina@google.com>
 <20261015163915.1166043-4-almasrymina@google.com> <20261020121858.3b9107c5@kernel.org>
 <CAHS8izPwWT+vbgAe49m5vXsRxT3unbfjLTkVZBScgAPdQTo2dQ@mail.gmail.com>
 <20261021132304.23e0a4e7@kernel.org> <CAHS8izNTbs8ONvjhiw+6cRkZQq+cX3t=BZK9aCr39JNkVbY9gA@mail.gmail.com>
 <20261109104959.181a3b35@kernel.org>
In-Reply-To: <20261109104959.181a3b35@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 9 Nov 2026 12:17:30 -0800
X-Gm-Features: AclHuK_0MFErjqghvOz060hZJCCzy2vAPCeLH5qWi-kHJsJTH_MqHsOjMY4lEMM
Message-ID: <CAHS8izPcFSLdmq16ZrUDKpCqUJf513EMs+Y45brc56s+mUBmeg@mail.gmail.com>
Subject: Re: [PATCH net v4 3/4] netdevsim: support devmem RX and TX bindings
To: Jakub Kicinski <kuba@kernel.org>
Cc: Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, 
	Stanislav Fomichev <sdf@fomichev.me>, Taehee Yoo <ap420073@gmail.com>, Paolo Abeni <pabeni@redhat.com>, 
	Kaiyuan Zhang <kaiyuanz@google.com>, Bobby Eshleman <bobbyeshleman@meta.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Dragos Tatulea <dtatulea@nvidia.com>, Nikolay Aleksandrov <razor@blackwall.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Tariq Toukan <tariqt@nvidia.com>, 
	Kaifeng Wang <kaifengw@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 10:50=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Sat, 7 Nov 2026 22:21:48 -0800 Mina Almasry wrote:
> > So I started looking into whether we can improve test and fuzz
> > coverage with an improved netdevsim. My LLM prototyped full datapath
> > (with devmem) and offload support in netdevsim so the hardware
> > selftests and packetdrill run and pass in a plain VM without physical
> > NICs. I posted the branch at:
> >
> > https://github.com/mina/linux/tree/nsim-devmem-rx-tx
> >
> > The main problem is the total LLM generated diff to netdevsim: 62
> > files changed with 5,525 additions and 672 deletions :( So it's a big
> > change.
>
> Great! Please keep that slop to yourself, tho.
> Upstream isn't built to host people weekend slop.

Understood and sorry for the bad suggestion! I was indeed unsure how
you felt about including that kind of slop in test code. It was a bit
too tempting to suggest it to enable the extra test coverage.

--=20
Thanks,
Mina
