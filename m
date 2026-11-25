Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795573464;
	b=FLBKtKJrp+HCtw8FVD6U3Mmh/PDhdgciiH/c/P91bWFEo5qIolCaJkYqC8pCS3KBJpiG
	 kzFz/Yx6NwvkZrl+8UEXnMrwop4lCT0FWrWrgGHh4MzgMJuHAf/wfFdQxCnLf901xRQGJ
	 WR2Tzh8tFE/FELGmwJVA8V65TWUiC5C7eemhMquMbrS+x6IYaiYadUb6VN7Ds1e9tfQR8
	 7J/qk0sqK15Z+sSzOXtlCsSMJIUtbmbRnCjUCnoXwtr9ZoVTGqIvB2yTltOAFVNPibiIK
	 oz+3RvBPlzxwGzGEp734IBfsZAuMUIOtXQqqnrb17VVlPpdvVgL5E0qP/+GW1l02jsQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795573464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rd4GC1nMvyzqQV/2Zr6imotUfVMdtsmwryjlRHNRz28=;
	b=X2KpnXbdZ6VNzWrRROkJvLHdYIDgEMFnjmEU28EdnuMJH4K4zuLrB+Qd7O6BzknmKBMu
	 9GtGIIcPLP6yE8hweVpeOFy9tdSHwyuwEpbQjfk6MpqD5oes4alRMH+FDDDpk7hBr95wQ
	 Tqg8kZ4sWR3YfQjz7YWQcEcMib0evO20p4EQqR9ZBNQpa30dQGhDBbXgTZf+BMRykCddO
	 7OWx0xDVXO6yc8XymRGB6wDe8oBndYAk5Zat5/uk1IyXbjmZGvJT043Y9weMyeexTfZrr
	 qfODeFJyL+87mUrPu8x/qlh5HGClyDEz31eKomLgOfxi+t+TUuWJH8fmtgcmUmLONmQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LCYVFbhH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0FB606A321
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 02:24:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF0FB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LCYVFbhH
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5c1b8120565so3178571e87.3
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 18:24:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795573462; cv=none;
        d=google.com; s=arc-20260327;
        b=BEMGqu8nlwwYuacnmcmHsYNPrCsVUiu81FJxuIoqMB5rII/93OoqBipK7i44lqK81S
         vltc6LO8Vq1eIk/bxC7hCdgru3VHifTSqs4WCdihcIzw67P93lTIkPWvZLYraoBU6BI6
         9GvqyE3UpLWkMDOhMOtSWxAJnmlPBKjbSP5hFwE7opBtT2eVKEgz1R5s0NCK2MwrzuQB
         6qSDGNOJ5eadw1xxWNNNz+pspbOvLoojSRPCzlvH/RVJYTCeG/r1wXV8grJp76nlx05Z
         lLaNyApCI8+PBP9w9Lhy0J6E/fBmUqLTLtBx9MH6eo7/eR6VuQUyrXx41EaewGphYK3I
         FBgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rd4GC1nMvyzqQV/2Zr6imotUfVMdtsmwryjlRHNRz28=;
        fh=uR1NgkNttcb9gxjdIusBD9SI+03MrC5xZItU8sBk2QE=;
        b=eSkAkQ5dCuUsZS4DSkpz/eg0rWSTublXqw76k1EwWxCoyAlmdTdOuB1Z+huViIwb3B
         y+7gP6EveZPqtaVdj697Lck1n96PxLfgyM6/Z8LGpYyBJI1wOsMUZSfEJEFQ5h9rI4QJ
         r4aWkhLwzICIxVlphPbK46nr2AuvR5LRApx4J+qWRo2x4hxKyq8pSChJgkgoCZoCBxxx
         QG8LOAYF0q6tb+FFJbY1l9rP2nzOCm60lr+uMsWkZFaFeW9bLE7ss30DFC0UCsB4rGqD
         TgDr2c3aNU4K6HORDvBthi+bCBQCoBG0yt1fFrVK+uz1QZ+Vdr80sKnHwwjU43Kf9PR1
         wMmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795573462; x=1796178262; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rd4GC1nMvyzqQV/2Zr6imotUfVMdtsmwryjlRHNRz28=;
        b=LCYVFbhHyL0llXm58JUZKT+EcQfGqmt5jyVRvlsWV/dnt/onfl66G4Mu666/AGQ+lJ
         GiyAF5jHHE0mbADUpxBgJTNYudkrScxjEs/4hPLnF8bzPh91QgBYvABI6OZywQUtpkTe
         G/lwiFvllPOdHdV0r1dcy28T0Mw/pvG9dzolbEE+zPL015apxSTKDTK93+2vnX6LJ8U2
         obaLNGmoekvwapQDHxrIeyYrFDrgaZ1Q2gWRwFEb5xtu/0oSDuTEKETkpOEP0ZdCDeMJ
         mNeadfvtJJSLkJOzvAbDIEJroxO1qsiHSyxvwlRfoY4fXVePZst13IBrpFPze5noB88L
         MiFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795573462; x=1796178262;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rd4GC1nMvyzqQV/2Zr6imotUfVMdtsmwryjlRHNRz28=;
        b=BTh3xGoSIoDr3+e2NADEvt41QhoQGYu/VkVOEBTwT8OzeYtBz4GtnGYKIupto1yjwC
         BtRRTfbf74vg49i/HOEyhj1+NNXTFoG97tUxNrJYqn7XnyYTjq/QADTlVIGuWfcEMpj6
         VNNxDPie84ykdKYyTLPR/e3Q6qrzOALoSY6BZAa6NYbwsmun2sPKnMw66NjO328S1iPP
         P2UZIkCXy1q6ihLQ50nRZe4n003c9aLJc4hznaufMBFApXXnIzwaZtqrX7SUq0LaQCR4
         vTbyv72yo0i3TAaiOR683DJA/d2S5Fkk2m9hZzd/L9oS0TtJNgQUFFKajC4mmFr6rl4R
         JsoQ==
X-Forwarded-Encrypted: i=1; AL+hErGzMuKTaAtLX1vBPO52rF7gS2Ig5y0Q33QndiPp9PDH3V6t02/n0NX+iOOFxvdrmj/CnD09Je7jZHhMGG6aTyk=@vger.kernel.org
X-Gm-Message-State: APuU4Z98VLznEvFYrF05FyGQxwFJ+GEuhGlZU94+lemPL5R5W/AlnQJP
	EItgJL8YFhkVdJcnurq3Xpd4wrTqR5pCDLXipJ1pXXl8aG1mmg1KBsLeKUyR41ibPUP/rBmI14u
	Ydix378WExm7+ykN66MStd6WtiibJ7IZgy76jbqaiCOsUtseFynJyz0H0hW8=
X-Gm-Gg: AZFdTZeGVo5F3ncpT/ARDtqhV3A6MDa1VuAFhlECRhBgRrWWM7Wu//2M1jrpM0KmOJF
	ihQovph4IYwMqmTiJ/+Q72hKviy3fOT5pDrH6acZBpW0OKoEud6Nnd1B0l33yO7Tzz4T+ocd+q7
	BPd24uX2guN0DvF/2IPs1JDox4hVcCg8rVZpMqvlT9x1ojcjw7RCAegQ+GXBcyPjfLv/gF1N1LX
	bxVSRTcxAmE2/Vrdzr8SVQeWtydfgWThYQ5+QkVcXGK/ZnCLdJx2+ZC7F3NKP+569grQogMtdoX
	M6HMtSL5g6wxPAds2jh77UvbaiQQwa+DOKUn3fXj2XJD5FwjyHCz3t+pdzRQRy0hmTJ0KugXcnP
	q+iOh5fQIZsLhPy/gVuWVU7XchfzctfEwZ+bn0mYMwq355UjMZABY8IYM1iKgaQoOdG/B3OJDaY
	OOlgM4mDDN6D/pzZcwJqeyu4kdPHQhl9M2V/BHrASeKqqu97rRNVmE1Z5IqW1DUdLAl4NQc5q47
	7PRA0QTi4l7fsQbIsjPUV2XtoKXWAGoKJPw4g==
X-Received: by 2002:a05:6512:3d24:b0:5c1:4c4b:6b68 with SMTP id
 2adb3069b0e04-5c1bc802f62mr5014716e87.31.1795573461524; Tue, 24 Nov 2026
 18:24:21 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120045918.1239746-1-almasrymina@google.com>
In-Reply-To: <20261120045918.1239746-1-almasrymina@google.com>
From: Willem de Bruijn <willemb@google.com>
Date: Tue, 24 Nov 2026 21:23:43 -0500
X-Gm-Features: Aa3M54pQBVeIsj5CnW0SePR69-QmnWtg_nSpVkvLRc6_t3yxWi8NAbPfND57CTY
Message-ID: <CA+FuTSfx_MzL1v6cRReLWwpJUpUnmrzFvGmm+HiNL40uMOMAjw@mail.gmail.com>
Subject: Re: [PATCH net-next v4 0/7] net: devmem: support leased RX and TX
 queues on netdev unregister
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
	Weiming Shi <bestswngs@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>, 
	Stanislav Fomichev <sdf.kernel@gmail.com>, Bobby Eshleman <bobbyeshleman@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 12:50=E2=80=AFAM Mina Almasry <almasrymina@google.c=
om> wrote:
>
> Support leased RX and TX devmem bindings when either the virtual device
> (e.g. netkit) or the physical backing net_device is unregistered:
>
> 1. Pass struct net_device **dev_ptr to net_devmem_lock_dev() so callers
>    can lock either binding->map_dev or binding->bind_dev.
> 2. Rename binding->dev and binding->vdev to binding->map_dev (physical
>    DMA device) and binding->bind_dev (device passed to bind-rx/bind-tx).
> 3. Introduce netif_lease_valid() and guard netif_mp_open_rxq(),
>    netif_mp_close_rxq(), and netif_rxq_cleanup_unlease() against an
>    unregistering physical device reached through a queue lease.
> 4. Fold net_devmem_lookup_dmabuf() into net_devmem_get_binding() so the
>    xarray lookup, validation, device check, and reference acquisition
>    run under a single rcu_read_lock() section.
> 5. Always populate bind_dev on RX and TX bindings and handle teardown
>    and netdev unregistration of both bind_dev and map_dev, waiting for
>    synchronize_net() after clearing NET_DEVMEM_BINDING_LIVE before
>    unmapping bindings whose map_dev is unregistering.
> 6. Resolve the physical backing map_dev in netdev_nl_get_dma_dev() for
>    leased RX bindings, lock map_dev around net_devmem_bind_dmabuf() on
>    bind-rx when map_dev differs from netdev, assert both devices are
>    locked, and check netif_lease_valid(map_dev).
> 7. Add kselftests in nl_netdev.py covering leased RX and TX devmem
>    bindings across both virtual-first and physical-first netdev
>    unregistration orders.
>
> These issues were discovered during AI code review (Sashiko) of the
> earlier non-leased devmem unregister series (and subsequent mailing list
> review) and confirmed by code inspection (not observed in production or
> reproduced on real hardware). Tested with the nl_netdev.py selftest on
> netdevsim added in this series.

Is it perhaps possible to avoid the dual device tracking?

AI summary so YMMV, but worth considering if the alternative is sound
and a lot simpler (to maintain long term too):

  The leased RX UAF on physical NIC removal and reconfiguring a dying
physical queue on unlease (plus the bind-vs-unregister race) are
  worth fixing.

  Before going with the dual bind_dev/map_dev tracking, have you
considered resolving leased RX queues to phys_dev and phys_rxq once at
bind-
  rx time instead? Since mp_params, page_pool, and dma_dev all live on
the physical queue anyway (and netkit doesn't store any memory
  provider state on virt_rxq), storing phys_dev in binding->dev and
phys_rxq in binding->bound_rxqs=E2=80=94plus clearing rxq->mp_params in
  dev_memory_provider_uninstall() and passing phys_rxq in
netif_rxq_cleanup_unlease()=E2=80=94would let dev_memory_provider_uninstall=
()
and socket
  teardown operate directly on the physical device under netdev_lock(phys_d=
ev).

  That would keep binding single-device (vdev stays an opaque TX-only
cookie), avoid most of patches 1, 2, 4, and 5 (no dual-device locking,
  no two-pass net_devmem_dev_unregister(), and no TX behavior change
when only the virtual device unregisters), and let physical-first
  teardown clean up directly while virtual-first unlease can unmap
immediately when the queue closes cleanly.
