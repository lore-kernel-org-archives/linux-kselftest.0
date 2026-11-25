Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795626729;
	b=hUO7rYdDHBdg0/ncO9VCEeAoldd1y3/fRNW15TKN9j1+nbH2WHOFX4zufG35sEtQ0YyE
	 yJWQY2Oh/ecEeCFIAkETZLPV0sfr1mEP6JyWaCfkXNGbiHH65DPBBO3Z4XloPPh0Vb/43
	 WvD79jSRkIq7q4CohuYMy9tz8bmJkinXVhIGQhKks7tGUsx420RFDlPsErsXdtw+8dEzd
	 EEYukwIXkFVMYFl9/OmKf4G9+/qdG1pAxH2ZDchgN5uJCtCnFrPvOAZWe3Pw5WwG8mfoa
	 RKLT1gTrRIJd8Nu/Pj4kx8Ty51twjoB+ehfEynk1CmuXjbngpR/hXhHZd+Wh4cMTl0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795626729;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=uu/YlG123q6ELk6fptQDq7K5NRJkGGSqpe8mSjuwiXA=;
	b=kDOf4AxvcY8k/vqOJSTxnlN0mwV5Cdr5gtZP5mcUR/oMphutM1k3xP8AGZdeSH7pFjzo
	 tPi8E95cGZRcDqTfVhsrMDrcXOgLWHWGfGPsElkfwet4ER8oOpBLN4MULD01tXKEU6i97
	 Ax2S/b29m/CcthhgPjyj0ih7Twsk/IXvk7NWEOV1RtG+6RsfFLaCuVasx8AjcBljSGh4i
	 edpOa8ynVQ+9rxVGPFzttlHMKfazh6D6UtDoOc7r5oWd5NoNyHsyQFHxwHm/qq795Ukei
	 B5L65inud1nnxPhytdUva7bq7utaBJUMuOvKc2Hj7KWYbnnt1iVkEqO17DmVv0ohQoQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=V8e5Ggm8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC3D60A261A
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 17:12:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADC3D60A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=V8e5Ggm8
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6ba2a448540so55513a12.0
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 09:12:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795626727; cv=none;
        d=google.com; s=arc-20260327;
        b=Ne6nmvGwtlPupWjg59GUZwfMeDSVB+gpBLgEvqgyRpiFJUHUl0YS+xVt+v6kTavYnn
         J2yDsFvlkKsdYnfh2/KuTQWLdirUgReiOZdxiDGjKPkgxHUgLaC+iPsMBO84DlxN8Fw0
         F33B4vpihL9FGrxSaqm1jagcYqPHgXTs6oCbVELKYUnFOWzNui/vGaX6+Bk1JQAooxQr
         rJ69W26bg6Rm4qF4fvlmQmlyHNVkDvkNti+lQkSNGfriPEm2amD2A1W2AK55ndvFQDFQ
         nNivseyu/TzO35dmavT4XTommf6EYPuG0pZBVGoOwuXG6DMlZXZZBMoMGleNcw/bBs+I
         AVtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uu/YlG123q6ELk6fptQDq7K5NRJkGGSqpe8mSjuwiXA=;
        fh=1Vz9mVtfpv+zkQF3DNCE9qPF34lyyEUQQ1OFKm86/0E=;
        b=p/iSijHZeQ2qVSaPf17w2rQLqEtioemqFsWiu6qL7vz8khI3Mz+C2SM10VHG4o0VgN
         wuG55G7xW1IHuW+GEfXgx5aPfQbSVV5hxOrOyIAs0oIMt1gDSLwBzvUOCw3HmdmFeC++
         77smxHZ3wGxKCRE5gyY6TCQieqxnfwWw8Fq25a7f3PmDmOzxNSrfro6iIe9VzKnPanpV
         PPn4dnqDwhNVt9QiE7NK+csKzwK5DT/k1bvrFq/xxQVT6NGu3yJ7w1+LTQ9U6sTnAv8T
         +3Px5NGTbyn5n1vrqOyNFJJRSDaR2Z6FWAajCQWobBNJdShlnn/e8l+qsz7d8ZgQ65eP
         u3hg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795626727; x=1796231527; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uu/YlG123q6ELk6fptQDq7K5NRJkGGSqpe8mSjuwiXA=;
        b=V8e5Ggm84inOCQAMYdSzZXXtwJhtKZGa3opq9z1u/ygc7Cgvs3z918oJs3ToJLw7oU
         fCIdlQx3YW7fwfa3MvqmFwEVGA/cH80K5y45fHseumRQDYwVP5JL9FNBFFBkQGhyp/7+
         CdnfXm+OFERmvEfRmZRda7WADVdA8s7Hz7Ws6kl4Uww/UlySc1XE7K8rQ2FyWXjVL5CC
         jdXKNdR6yMG3CWPw7Oe9VxXrj72H0VOKx+H37KQtOfKyJ6zCm3qY4EMqOqLxNmwmIgN6
         ftKr/KHB+HRvvJvBSV84Vu7yMAd4Dao5AN9X9O1+nNoSlSEsxLxzcBQ3y5VaOM0ImSyS
         9+kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795626727; x=1796231527;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uu/YlG123q6ELk6fptQDq7K5NRJkGGSqpe8mSjuwiXA=;
        b=x8GvP9es2p3mDMPMiAosDmtPZIi9wXSTcG0R5Q80wO9cnQO8zYHvTZGxaPNDiDr53/
         NiBXdjfAc2kaJjPFcm2PEmBRZ/wce6w3n37ZWrbP2j++xTQeS1iWFPrf87IHcsmNCRIB
         u8P34TQvjUHYR3AGCLBQ2JE2HfHr8b49x8QopgQixoEg/qruwHbKBbOUvmzpTJCztgLE
         h86FqAIl0U0nmpidW5dhlB848mT+olrPAbTPMoD8W+87ThyNCVuS+nuBFV4CmvKt/Aqg
         clsFLmAz/Pov3beaX6QWy/WpJL6hXe26ubZgZQmo60mm4Bn2SNileUO1/uGrFVBPgbUQ
         DQhw==
X-Forwarded-Encrypted: i=1; AL+hErGBM68PAV88egzhUd8Qhk9224CRG3slghhWbxRQP18AJ6nL/vbOLCRc1bJn5pX1fWVTVXN7OfVKIWfUyRCOmCI=@vger.kernel.org
X-Gm-Message-State: APuU4Z85BYuCwzHt1cuW/yOptiQ6mSwhwinTFw7c0khtxNVRZ+RTsLtk
	pt1CEBE2bDpR4hNCKOitR2wrbTO8l+iBi+2l+S1VIdRpDJRsX5Mi8IfSQ3mF4oJ8x7DKxXOFNS4
	CC9RYdlVlRaon2dINW7VaEUQWoWmogHpkSCFJf1DL
X-Gm-Gg: AZFdTZdWDVd1rBlu9ftas9hMawffO7U/6Im1y3ZdFXCR9kLa5rworNzJiMOeF4t+Qkv
	/M8JmIgo63KEHueL/xSOqCEPQ2KcVb0syvDMD/chb3wFxyOYszAyG5/yVY2S1qSRXlm3zxneBlr
	Ngt9TFavGjmqxBs109h/jYSyoWdg76tNkGkkCaOkoykvDLXe+ZES578tTJ9yMbSv61LcmUboRaz
	A59k3tFDJywAP3iUY26CxU8R8AGrtHvB3Hc3PgDHQbcvSGPo82Fr9M835gJ9r8Z/p4jnM+wcHot
	orOra889b/g9uZ7tB9dL/Ax8PV2pEY38FEcDqqIAi5iiZsDSTLhMJ40TVAxg4xDzVzwjKHA2rcu
	8peyMm7LCCjS5nD2nvrdRfKdmbXuBbQer+1nxEA==
X-Received: by 2002:a05:6402:1c05:b0:6b6:ee14:5096 with SMTP id
 4fb4d7f45d1cf-6ba6edd1421mr395825a12.10.1795626726540; Wed, 25 Nov 2026
 09:12:06 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120045918.1239746-1-almasrymina@google.com> <CA+FuTSfx_MzL1v6cRReLWwpJUpUnmrzFvGmm+HiNL40uMOMAjw@mail.gmail.com>
In-Reply-To: <CA+FuTSfx_MzL1v6cRReLWwpJUpUnmrzFvGmm+HiNL40uMOMAjw@mail.gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 25 Nov 2026 09:11:54 -0800
X-Gm-Features: Aa3M54rtHxu24NDH6LtxWg_kyJM9Tle0yl5VdSQDTOsl7lzOpGstdr23hcQlHN0
Message-ID: <CAHS8izP3c6V_2EaQVHSXOq3hCNP4xM=gNWtBikbV1CHK_YeVgg@mail.gmail.com>
Subject: Re: [PATCH net-next v4 0/7] net: devmem: support leased RX and TX
 queues on netdev unregister
To: Willem de Bruijn <willemb@google.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
	Weiming Shi <bestswngs@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>, 
	Stanislav Fomichev <sdf.kernel@gmail.com>, Bobby Eshleman <bobbyeshleman@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 6:24=E2=80=AFPM Willem de Bruijn <willemb@google.co=
m> wrote:
>
> On Fri, Nov 20, 2026 at 12:50=E2=80=AFAM Mina Almasry <almasrymina@google=
.com> wrote:
> >
> > Support leased RX and TX devmem bindings when either the virtual device
> > (e.g. netkit) or the physical backing net_device is unregistered:
> >
> > 1. Pass struct net_device **dev_ptr to net_devmem_lock_dev() so callers
> >    can lock either binding->map_dev or binding->bind_dev.
> > 2. Rename binding->dev and binding->vdev to binding->map_dev (physical
> >    DMA device) and binding->bind_dev (device passed to bind-rx/bind-tx)=
.
> > 3. Introduce netif_lease_valid() and guard netif_mp_open_rxq(),
> >    netif_mp_close_rxq(), and netif_rxq_cleanup_unlease() against an
> >    unregistering physical device reached through a queue lease.
> > 4. Fold net_devmem_lookup_dmabuf() into net_devmem_get_binding() so the
> >    xarray lookup, validation, device check, and reference acquisition
> >    run under a single rcu_read_lock() section.
> > 5. Always populate bind_dev on RX and TX bindings and handle teardown
> >    and netdev unregistration of both bind_dev and map_dev, waiting for
> >    synchronize_net() after clearing NET_DEVMEM_BINDING_LIVE before
> >    unmapping bindings whose map_dev is unregistering.
> > 6. Resolve the physical backing map_dev in netdev_nl_get_dma_dev() for
> >    leased RX bindings, lock map_dev around net_devmem_bind_dmabuf() on
> >    bind-rx when map_dev differs from netdev, assert both devices are
> >    locked, and check netif_lease_valid(map_dev).
> > 7. Add kselftests in nl_netdev.py covering leased RX and TX devmem
> >    bindings across both virtual-first and physical-first netdev
> >    unregistration orders.
> >
> > These issues were discovered during AI code review (Sashiko) of the
> > earlier non-leased devmem unregister series (and subsequent mailing lis=
t
> > review) and confirmed by code inspection (not observed in production or
> > reproduced on real hardware). Tested with the nl_netdev.py selftest on
> > netdevsim added in this series.
>
> Is it perhaps possible to avoid the dual device tracking?
>
> AI summary so YMMV, but worth considering if the alternative is sound
> and a lot simpler (to maintain long term too):
>
>   The leased RX UAF on physical NIC removal and reconfiguring a dying
> physical queue on unlease (plus the bind-vs-unregister race) are
>   worth fixing.
>
>   Before going with the dual bind_dev/map_dev tracking, have you
> considered resolving leased RX queues to phys_dev and phys_rxq once at
> bind-
>   rx time instead? Since mp_params, page_pool, and dma_dev all live on
> the physical queue anyway (and netkit doesn't store any memory
>   provider state on virt_rxq), storing phys_dev in binding->dev and
> phys_rxq in binding->bound_rxqs=E2=80=94plus clearing rxq->mp_params in
>   dev_memory_provider_uninstall() and passing phys_rxq in
> netif_rxq_cleanup_unlease()=E2=80=94would let dev_memory_provider_uninsta=
ll()
> and socket
>   teardown operate directly on the physical device under netdev_lock(phys=
_dev).
>
>   That would keep binding single-device (vdev stays an opaque TX-only
> cookie), avoid most of patches 1, 2, 4, and 5 (no dual-device locking,
>   no two-pass net_devmem_dev_unregister(), and no TX behavior change
> when only the virtual device unregisters), and let physical-first
>   teardown clean up directly while virtual-first unlease can unmap
> immediately when the queue closes cleanly.

Huh, I thought dual device tracking was essential especially with
Nvidia's upcoming Data Direct series, but my bot calls out that this
approach works and even extends well to that series. Let me prototype
it and see if I run into issues. Thanks for the suggestion!

--=20
Thanks,
Mina
