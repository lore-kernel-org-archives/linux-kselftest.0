Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794074036;
	b=0h0RPp959FXasoJslOHr7KP39TkcEsjti/+QvHTF4EtlUxQ3dmNq+eSJS1ihQfnsYjOH
	 vELwwskVb4oV1MtanE4kD/LpQv1eYxihy/eWBXHPY7vWEiu1y7E2f70Hi/0VGA12DatT1
	 5jTOXCreRRMYlcKcwSeDN+atZiv+0gbW+6R7p12J8Gw8EwVGoKQbehCw77IQguq90m6xs
	 ZeqIyel7Mtt2Ej0v+1DQ0rRoPAflCcgRiUePmCgX5qRAeYHq3mIwYBDwc33MSY78X7Akj
	 gHBAHMyNDl7No7nkFmgEaGbsop2iWDOpV5WNqWRYKDsdxUDAY1wowZh/evYIP91WyRA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794074036;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YuSKW80gEdEKIMIUHnhqL5O2fdz8zV/R82jKMhNdzM8=;
	b=zBch/BgzSolHszUVLBhFoIvPBw1eH3gqX+UAI9nP9UqS9hVSvdAQRrizdSEbqa+vzFFK
	 stPdb1/ksqRyEYD6+QYrKV+x4wgQl8lRWl7j6V/nuUSATVGWLvmW9MH4vG8j1icBBkBCS
	 9ll2TtLXL42wwL5dQ6GiLNEPyNPFLul1TKF/pAqZIHUC7YVB/fXGj4NXwR6DDsfwEhdJp
	 lLO4psmnS5d3O+mNbfn7to+GsBaf6gSOYGcel6zcH6s7GdOzPFayLi5k+PLm/i3FtdMpY
	 pPItrwjteKnSYjJvlwWWaSuITrRT9fcwhv+vRch26P0FVLOp/9L8PXF5igFZpspRBrg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MA43WfmR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52FE606A32C
	for <linux-kselftest@vger.kernel.org>; Sat,  7 Nov 2026 17:53:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D52FE606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MA43WfmR
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-535f598d126so85681cf.1
        for <linux-kselftest@vger.kernel.org>; Sat, 07 Nov 2026 09:53:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794074035; cv=none;
        d=google.com; s=arc-20260327;
        b=lGureZea3/cVN5GoOXqO/eb7kU62rOyLC9o51g6egifb2z+h7AjUgpm+PKVhzHxuE9
         cxDaCi4VHPAICy66TPdpVkuFTD2aeG3GD4K9yCeQ8fwXtqjZJSAMQeqbvfuD0QGtQzwh
         t8Zdp/aMW8x7oyOkMnFQdGJRUcNQP9bLgRNxvHvVu4dI5WB4IjGm7kvmyyd2UPHi/1Pt
         XQiO8Xm5Gw0mYwU/biXw3+6r2CJSIsWTrm8hxNkSAENodrCQUy6nJw2koPm9C6G0jo8j
         R+2A4hNVCqQx2XW5KY5w+5mpZ6JfoWBsMT1i6yYSGfZMk0Rnx3WaN/ttv57mJyf9lDF9
         LieQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YuSKW80gEdEKIMIUHnhqL5O2fdz8zV/R82jKMhNdzM8=;
        fh=bvV6nRxjLYBmP/0nJctimT6VHz0c95G53v0DO8r4IhY=;
        b=mjEn8kvwcKAMWjfkDUGQInNgsdx0Jg84z8N9kO4twcBNDELbjWG+7uThjlOY9dvE1F
         yNvdgonGHxK8573NV74T2HBp1U7gacSKwsvrj0keWtCH0VEWLvroBrtma6BZTpmWVRBt
         IfPtgfjDYRqoQfGMZVNeId0ZAq57cMZoMts43z2vaoKSrvf1hvwDIvmBZJfmTwZCWLEJ
         PCgwsc+7nATjNSYBhQQMzLCbO/Zao/ATSCw5NAZLnCs3DcIK3jiZ8CtXOmPha+zNn63P
         3v4Y45SqASkb5isSv/6BjZLdbuAnoIyhMq5t0LNuzqm9KdS10Ns19E++HVhkpu/iR5mh
         W6hg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794074035; x=1794678835; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YuSKW80gEdEKIMIUHnhqL5O2fdz8zV/R82jKMhNdzM8=;
        b=MA43WfmRkdNpKUpHX5S3uJIFs7srnYuG5eT22TXmuwSmQj5p1KpLdBHBIP+Sp6zNLy
         Fcluhei+8RnXNRn5oAghsrsoPykvQsbaegnV/ATRS7fzB5Ep11p2KyqXwHJXKWJLNKOR
         faFXYBFCFQQbazi8ZelSEiNdJfLblkuKbBf5Xltl1CtXOThd6wnjlbkTsFandUb0Bnxs
         HWxu3tnEu8ZeHdAfrb1cr3MAIoKJJtYIZSf+T4vEpczx2cOaknV/0jJC4xHW73MMlbRO
         +Uz9LpSuFbtZLp0kiirEy1I9tpRJLip/Wewawl2FWNCwMMfBSEgnM7UuwpgeoJ8sniZD
         2qXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794074035; x=1794678835;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YuSKW80gEdEKIMIUHnhqL5O2fdz8zV/R82jKMhNdzM8=;
        b=qmxGHg0aYn/78Wd8QQD1kvANAvSC/ZasTJhyxlXmZ7Zsm5+7pckNboPBBJtCERhuuC
         Qvjg7duIw1LvYe9j7rb0iAejFS56ycZ5gntBnBp7eZ8Nl+9FS34vLwC29Q5nQpvU6M0w
         pj3Pwa4QjuyL0DDR7Ws2ZliKJYmSx4vK0BQ0lVjbXYruHVUR1yHgzQdwOAX5i9WaxCQZ
         Qw3zH6LWpENnwJJiSEHIdgTJsuCbhNVZqvgnvDu+3HaEPtGCUF2KemRLb9nD4pd4xcAn
         KNgMwTQ/y1DlIslVT4gtvhnqKHlOonU04rWFJAZrXBK4yv1PPwa+P5Yurs9KLl0Ml7uh
         JN2g==
X-Forwarded-Encrypted: i=1; AL+hErEU79ia6ixi2pjbVBE3NyzXxJKyrzIGE+WGpO9htfWW/pMrOUuuxcEgqvoLSz9e6cBdMUYEiSxEZPxBHImoTag=@vger.kernel.org
X-Gm-Message-State: APuU4Z9emj2vRB6fPpkBWRSFyAb8/FVrFZCOKpIn2+U8GbX5dFYoxZqF
	GRjLcM3vDnL31HffoEb5vurGkGfaR/1RqGcpfEVK2l2AkRrV6IgxP0zO4aPwY39N/G8ScN7X1IW
	F4TiXJT7Q+FqjEiSoBl+hyXswcwp768ewKuBjIXyP
X-Gm-Gg: AYBFou0+2d3fDCYlBf9uIUlwDWFdy0qO5oZjYXDa2N6a8JqfsUqx77B1YUJou15f5kI
	faTQFTO7a6TGENKXbA7bMt9m07lsDhw0WPaeXhOYVS27fBv+wSIl7+Oy0qOR1KXHQHkCtwZOQ71
	/MRlO0rQBtNBGlZtPaiIhRaG3ecj8lR702ekuCqrpBFmgscsrKqC4gz0qv1bCPfFILkpqefGNPI
	jdvwWtjgkAHgZspBonIg/IqEKTgvMbJc5NL5MjcaUcMrnf2f5hooTyjO3GsdjupWwcMwpiZjTjw
	0Omk8TYL56hh7mMOxnddwfDQAhZr56D4KOc5SLBFtc5wHXqmvUWMf1LZKy/RLvHYFIG9cJBdOTj
	XVDrUwYbJGzhge2cK/DllxgKSqqAijjaRqupe3d4y91DhCo/W4+huIGjYkJBOxnGi/33YItXUEu
	B+Gy7qhMTi3HoVd4j/CVNZkRqcq8c=
X-Received: by 2002:a05:622a:c07:b0:545:7949:80a5 with SMTP id
 d75a77b69052e-54fc4047021mr12339661cf.12.1794074034132; Sat, 07 Nov 2026
 09:53:54 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-mtu-probing-series-v1-0-a2809e725aaa@gmail.com> <20261103-mtu-probing-series-v1-1-a2809e725aaa@gmail.com>
In-Reply-To: <20261103-mtu-probing-series-v1-1-a2809e725aaa@gmail.com>
From: Neal Cardwell <ncardwell@google.com>
Date: Sat, 7 Nov 2026 12:53:36 -0500
X-Gm-Features: AclHuK-b7qc6bzaZz7ltF4_Msg4vRZBtYtjjIeLFeqwo1Hd-sWVco-4G452TJu0
Message-ID: <CADVnQy=AHpy6UoiAFopRUmHLNv6Arw07PysXVijiR=qERuzeww@mail.gmail.com>
Subject: Re: [PATCH net-next 1/4] tcp: sync MSS after enabling MTU probing on
 passive connections
To: echoowall@gmail.com
Cc: horms@kernel.org, edumazet@kernel.org, kuba@kernel.org, kuniyu@google.com, 
	shuah@kernel.org, davem@davemloft.net, pabeni@redhat.com, 
	netdev@vger.kernel.org, panweiping3@gmail.com, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 2:09=E2=80=AFAM Yongjian Wang via B4 Relay
<devnull+echoowall.gmail.com@kernel.org> wrote:
>
> From: Yongjian Wang <echoowall@gmail.com>
>
> tcp_v4_syn_recv_sock() and tcp_v6_syn_recv_sock() call tcp_sync_mss()
> before MTU probing is enabled, and tcp_init_transfer() enables it later
> without syncing the MSS again.
>
> With net.ipv4.tcp_mtu_probing=3D2, a passive connection therefore starts
> at the full MSS instead of tcp_base_mss as documented, while an active
> connection starts at tcp_base_mss. This has two visible effects, shown
> here with tcp_base_mss=3D1024:
>
>  - The MSS drops when the first probe is acknowledged, from 1460 to 1242,
>    although that probe has just shown the path can carry more.
>
>  - On a black hole path the MSS never tries tcp_base_mss. It goes from
>    1460 straight to 512, since MTU probing is already enabled when black
>    hole detection triggers.
>
> Sync the MSS right after tcp_mtup_init(). tcp_sync_mss() only applies
> search_low when MTU probing is enabled, so the other tcp_mtu_probing
> values keep their behaviour.
>
> The Fixes commit kept tcp_mtup_init() in a single place on purpose, so
> sync the MSS next to it instead of moving it back into the
> syn_recv_sock() handlers.
>
> Fixes: 4d83e1773031 ("tcp: delete redundant calls of tcp_mtup_init()")
> Signed-off-by: Yongjian Wang <echoowall@gmail.com>
> ---
>  net/ipv4/tcp_input.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> index e1f2d9765..c13f005b2 100644
> --- a/net/ipv4/tcp_input.c
> +++ b/net/ipv4/tcp_input.c
> @@ -6760,6 +6760,7 @@ void tcp_init_transfer(struct sock *sk, int bpf_op,=
 struct sk_buff *skb)
>         struct tcp_sock *tp =3D tcp_sk(sk);
>
>         tcp_mtup_init(sk);
> +       tcp_sync_mss(sk, icsk->icsk_pmtu_cookie);
>         icsk->icsk_af_ops->rebuild_header(sk);
>         tcp_init_metrics(sk);
>
>
> --

Functionally this seems correct. But I'm wondering about the
performance impact, and whether there is a way to achieve this without
adding this call to the code path for every connection establishment?

Eric and Kuniyuki, WDYT?

neal
