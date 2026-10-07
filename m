Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F1E4746BA
	for <linux-kselftest@vger.kernel.org>; Wed,  7 Oct 2026 10:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791368430; cv=none; b=piR6s169IARTGfel/j8Nf45D4RZnk70S+4vV5VTtl98Qp3TA+yvWvzeqR68dNEngqAk6e4V1vN7XqkMNxV7NeSA+3thIkLkks3Oj18zoauCfWZHgdl+IxnOg4cpA/6x+E+f8sTMLnRvfsaQ7McZMg/4KiVSDcVcu1zaEnQcTXAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791368430; c=relaxed/simple;
	bh=rFAvUO4Y/vcYHM1X2jKNJMuKbU0DG4p6en3YHWz9DUE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=lyeWou5uJkL9ftngEC2XEtvSrz2+Gm/LYd7G1iInAo+T9Hi2FlK9rUyUR8ex/OJIH5RQqxDGX9saZahD3rldJ5pmkODnv4Uw1ndw7cxnDhM0dQT86wVQePW400mkLCjtriRA5lKpeGP015eLKvBmQRHOtRLhcuxdbkD4TOAUFw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h8giNJUB; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Jy9wEEPh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h8giNJUB";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Jy9wEEPh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791368419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rFAvUO4Y/vcYHM1X2jKNJMuKbU0DG4p6en3YHWz9DUE=;
	b=h8giNJUBhVEGNxmVHQEdH54c/XlTcssKwhioOE5d/U1cAyDY4GxPGceWzDr8Ky+3iYD0/5
	MOYJspt8dxLVLdZVq78zvm5eCLD9+pqIbfpO826e6jp84ckILBYAbEsBbq1xNORsFUP+Xh
	QehnUMnGMevch55qTkF86cWZzl+ga7A=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-80-n0AEOWNeP7ewmsilevVHBw-1; Wed, 7 Oct 2026 10:20:18 +0000
X-MC-Unique: n0AEOWNeP7ewmsilevVHBw-1
X-Mimecast-MFC-AGG-ID: n0AEOWNeP7ewmsilevVHBw_1791368417
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c2939083cefso460770366b.1
        for <linux-kselftest@vger.kernel.org>; Wed, 07 Oct 2026 03:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791368417; x=1791973217; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rFAvUO4Y/vcYHM1X2jKNJMuKbU0DG4p6en3YHWz9DUE=;
        b=Jy9wEEPhwMeUmcZ30M+B2K96pMC9WI6L7uHAEjEAwj0swcHEWs7CK7QdKicyqVvdB4
         2V/dF5LfbrEDP1nAOdQOLQxAaAHd9b9G3DzSa8FzjxpGVM59No+cHmbfvYSAkZoFh69k
         XzTe8K6y6fns9egJyTOUn+9FSDUfgVWWymeF6tXJIZi5VhWfSPYvunB1GJux7+1wGgKS
         QccKXwWqreY+4ulNQkzj1GR8DeuGHsAde4VYJ5h4FOsDh1kpgKWlE0z6LYyX/nLh3Y8r
         FIz9+4v7jZVDZrFisTLZs0fw8nfxE6v1qK7qRZb5HVSqQhWi1pnxv3kFCacAOsAg4A5D
         mTsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791368417; x=1791973217;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rFAvUO4Y/vcYHM1X2jKNJMuKbU0DG4p6en3YHWz9DUE=;
        b=2alLaK0L0/QKNdaULCVVzEjHt1RFwJmNtznmGMxZXJDnYy1PdfQG2SVmY5hqb8hMJ4
         gBgT7We9pc8vwlIiWZKJUKaXWXq7uUK83xJoa0NKTDVh7RnT2i8tcVcV3ll7pfDFr47Z
         C0kgPP+n4elSi8Ah76V5FjpWfQfYANN1ysGI6NzYgGgRGl1GiFLWLnzWFoBK/zqpb4dQ
         +s53D7GU247R8aGyAi0Zouk4+FonkHwfpmJV+WnvirM3utvdeDVu+Zwqqe0Gs624uhpv
         N/xNuGk1OvhR9fw0w/V4ZohiD90fWd6fdJhzbndElui3Bi2wpw/H3t/kH5XMJulTrdYk
         rkgQ==
X-Forwarded-Encrypted: i=1; AKwUvBwr+7UgYCjeiiQZDLyLdq2RCjM5mCxLtYiLXMpjThgUQSVpPZZmA+F+7VAdrEXL7K/wlU2eERf1yFSmLu7Ng7E=@vger.kernel.org
X-Gm-Message-State: AFuF++l63pppjIYfiQRX4RTUNXg4eHmjlaUM5+glY6An0VcuUvZ8H7To
	P5LZhIBNLH44M9fMQMZk154O3hV9kBYgRNpkwZs8dT9mlns3qGn8uci9vR/OKJC3xcSw3hBiLSo
	EsHwap8rgIowgYFPt50Hz85oBKvIfsV1YusGxpPAABGMEGjooQZNsC3hPUuP6wA8acOtcRw==
X-Gm-Gg: AYBFou10Z+3l8eRGbmu7wLCb2Ymx0xOJYgGN9KK59ID+LSp4rexLsfI0BHX+ILUUyFe
	4qg1gJkBSR7ITxuhim2/pdqYaQmFkTXaaDquzeXd4oASMi7HCGDJwxWDmLtamiImjZh0C0/520S
	1D6kfJvhRim7FKmZcNxI9aHtW5nI3NlmeFIpbkXlrVdGHWdLmpfPdIGHQCm8G5jYVOfJeGU1GDN
	0Y+gmBsDwKGWpGl4ogt0GgXPSv96pfrStObSiGnvGxuq9RYGhdkIjAac0AunJj728R9SPqwKADV
	C1eKWi86F39EvS+zzZuTrJ2rCBg4XlSn4u3emTGhZleHdQTfuGH6sx8Obj43hKWj/dDasKJd1xC
	YsmiT3uq9kKccU9bb+ToKDqhr
X-Received: by 2002:a17:906:f592:b0:c29:d31f:7d6a with SMTP id a640c23a62f3a-c317bf67d52mr155717766b.35.1791368416949;
        Wed, 07 Oct 2026 03:20:16 -0700 (PDT)
X-Received: by 2002:a17:906:f592:b0:c29:d31f:7d6a with SMTP id a640c23a62f3a-c317bf67d52mr155715166b.35.1791368416617;
        Wed, 07 Oct 2026 03:20:16 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c317c32af4fsm81250166b.63.2026.10.07.03.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 03:20:15 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id D29F7A4CB6C; Wed, 07 Oct 2026 12:20:13 +0200 (CEST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Tianyi Gao <tianyi@cloudflare.com>, netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, lorenzo@kernel.org, horms@kernel.org,
 bpf@vger.kernel.org, shuah@kernel.org, hawk@kernel.org,
 kernel-team@cloudflare.com, ast@kernel.org, daniel@iogearbox.net,
 john.fastabend@gmail.com, sdf@fomichev.me,
 linux-kselftest@vger.kernel.org, Tianyi Gao <tianyi@cloudflare.com>
Subject: Re: [PATCH net 1/2] veth: fix peer NETDEV_XDP_ACT_NDO_XMIT after
 GRO is toggled while down
In-Reply-To: <20261006173241.65945-2-tianyi@cloudflare.com>
References: <20261006173241.65945-1-tianyi@cloudflare.com>
 <20261006173241.65945-2-tianyi@cloudflare.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Wed, 07 Oct 2026 12:20:13 +0200
Message-ID: <87cxtlu80y.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Tianyi Gao <tianyi@cloudflare.com> writes:

> A veth device advertises NETDEV_XDP_ACT_NDO_XMIT only if its peer has an
> XDP program attached or GRO enabled, that is, only if the peer will have
> NAPI to receive the frames.
>
> veth_set_features() updates the peer's flag when GRO is toggled, but
> returns early if the device is down, and veth_open() only refreshes the
> flags of the device being opened. Toggling GRO while the device is down
> therefore leaves the peer's flag stale after the device comes up.
>
> If GRO was enabled while down, the device comes up with NAPI but the
> peer does not advertise NDO_XMIT, and devmap rejects redirects to the
> peer with -EOPNOTSUPP. If GRO was disabled while down, the device comes
> up without NAPI but the peer still advertises NDO_XMIT, so redirects are
> accepted and then dropped in veth_xdp_xmit() with -ENXIO.
>
> Commit 7a6102aa6df0 ("veth: Update XDP feature set when bringing up
> device") made veth_open() refresh the device's own flags. Refresh the
> peer's flags there too. The peer's flag depends on this device's XDP
> program and GRO setting, not on whether the peer is up, so it is
> correct to set it even if the peer is down.
>
> Fixes: 8267fc71abb2 ("veth: take into account peer device for NETDEV_XDP_=
ACT_NDO_XMIT xdp_features flag")
> Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>

Reviewed-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>

