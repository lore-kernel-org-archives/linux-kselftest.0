Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795194394;
	b=HziNmm5RueEF5bylFJURDSVWuXwoVaK60pu86DTA4JgMPV+AFZurf7oecaV4rnbqZiNL
	 6qU6F44H3ztO+hiwhyhvTJ8Bgs1iLF+eWmEwTzFSvnd3VbsrjaZ7zVAo3UtuTRCN5fOfP
	 AOEmahCobtgILldi6vxO734Oqel77+kPKXbvmj+JbfW6RHiarj/2dHPtSBLctt5HH+yUG
	 IQExIpZTOonAW4rPcjMR8HiZYWC9zUJkzh6OQwEpTuPkosZRU7GYYuwNeNnIjJsma8kBJ
	 Ngh+pL+HrmlbmtTNm6JqZHNsLqp9yYVTN0MZuvO2UpR8AbVySa5Oag2oJoGl+dPgAuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795194394;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=HawP4HaqSSCCRWTOg50sFxNueZcWIp4gg9tOLMEyCnI=;
	b=DzRf4O7uR+uxbngUlM8qq+thqgo9rPFfOjIte6a+GwDlPyxfpmJpHgQl0XS9xMuuHtqY
	 Q9nujtILTDkEjAJDMLVnx+Svr6IRMQC8MLq+H5/QfxDOM6+q19DaxBMSgzPMgTV2gXlXS
	 BsOGzwYRcNAhfUlS43g7IZisppuM1FiexeNgr1naut3CD8GqARRWt0iX31M5J+sUYbaI/
	 4dieR3pAXtDmB6jjkSdCAFCNyzH7d6AseeMrkH3yBKIbt4lVVg2ErmKUdOQJCA22ESdJ0
	 IO3yipAqW+qn9IUMCU0Fh+VJWoBbfZH7RhSMynk3B9N7JBaIqvgUeeFkacx+UySKgiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OmzPOz94;
	arc=none smtp.remote-ip=74.125.227.1
Received: from mail-vs2-f1.google.com (mail-vs2-f1.google.com [74.125.227.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C39360A2634
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 17:06:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C39360A2634
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OmzPOz94
Received: by mail-vs2-f1.google.com with SMTP id ada2fe7eead31-744b7f44933so125853137.0
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 09:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795194391; x=1795799191; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HawP4HaqSSCCRWTOg50sFxNueZcWIp4gg9tOLMEyCnI=;
        b=OmzPOz94RBlShM27Fq+3M13WAvPl95uJg/Z6jfSNfiGQ/2YfUXnilB6shAptLqaJ9P
         Q8c6SFK9FjKZAJPIDtu+JPcTkDbuz4cdB3GAZiv7jYRjnKnRTSQfEouoo/pC/znPTJx0
         10Er+1on+7/EuSkAm4mFEVsyeRSMnBy4+w86KCgmbtxuczVedutAeDaY+BPKBqieVf7d
         ikOGQgdR1/RnFxqBpWY4K4JiyVTYjF/Iesthf/IODFdnaxnKWQ4mrhaK7f239Akgx2OK
         2KfAc4k+kBguar6hDm4yDh+6GZEGikuofnRnhrelhphJWWPJEGB7NlcLQUP+GSCpl/eb
         zK+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795194391; x=1795799191;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HawP4HaqSSCCRWTOg50sFxNueZcWIp4gg9tOLMEyCnI=;
        b=iY65w3lhctGDRevvaRa0aWikNmPr7JD4Wn7VYqBDz5NZIB0R1T9IFYCsepBLMlM+7N
         XqJZ23zXtdl6jw/gErLXsonfd4hJl6q/kij1OGlvYGHf29rYtri7LoFms+CZ/Un3I2up
         ool/+FzyKFb96XercHds2sdmBFET9H5E/X0B/cCbub339yDsb2M4meUo282Gt9y7inR2
         P3PvjHd+8fuJfq3myYqdaWsSgH2tR7sfJpL34692WPeKEsdn4ZaIiAdWGynC/wzbu3GX
         2XNBroNm06ntrrTBa48qCYFhiZYIh1X3F9WfJdpIaCBDHjpoVeO4j+hduyXibCn/hUcT
         STzA==
X-Forwarded-Encrypted: i=1; AL+hErEcrM6so+Hr0sZC+HagjkNysBVkXftzhEWH2TkIo+wTFOPXV7DfdWnM0GKqGDl1dlysxXjVmg1q5f7jGvafw4g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gAfeekeBzJTwbfjjpBwkF+jem1GK4w4QkxTnZF9KonLDZVCcj
	MIDCBi4Zw0lZiZnDcQK5IsFhW3uHRYsR8RijdDwxnvsDxVOMZC6QxMy6
X-Gm-Gg: AZFdTZfC1iYHiXSGxET/dxKzPDLc3+XcTc+c7nl/Bkc8GgWMLQ/TIv74aEjSVGjayQg
	MC9yurCsD6Kak88y+2XctMsoYtMVD7wZ1eUDTNYP+sSwgmShDV9VW4Xi6alpMI2VmpHPbdTkbfh
	Pn6NydpiU5fkMo8PKRWkDa9Yl/pIVRsJ51gnfmYEbxmJesgDborK4hvBNrwsuHqpWNatmljQLOk
	rFm2mDFwh76jl5l3XWliheiullw5TIjuYFLjOOkVvROdQMgXxItTWwd6uV9EpAZ8vUc6cecfXgj
	lQEOaPLM3uOq5rWUWN4iOyPbEZ7wywpFaKdipqFS8DBlavcFP9TvnkG1nTbyzsuzoy29U9LIm8G
	ARw2j9M/E78nNM8dLRTcUSEv+36ttmGaTXn81Ew2YFf+gcX/nvwzOzRIIqPpUdlBG4QICyRs2vD
	IIbYA7EWnizjFEkspVeovEG/it0Jh5zi5ui7gLPtGdSB0oad+JxJeMo3TA9npvMXXrc4xWbh60U
	p7jhDxplsVfVxWquVJdubv7VM9gpCbfMc4bE2AgcSNcS2L5pW35TBIVPOACmTE65875+JugM3zQ
	cmA7HauctnuSmbUXQe/g5b4=
X-Received: by 2002:a05:6102:4455:b0:7c3:8150:83e7 with SMTP id ada2fe7eead31-7d7393a4a98mr1152864137.9.1795194391043;
        Fri, 20 Nov 2026 09:06:31 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:6c::])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e7d784b3sm3456487137.2.2026.11.20.09.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 09:06:30 -0800 (PST)
Date: Fri, 20 Nov 2026 09:04:38 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	linux-kselftest@vger.kernel.org, Weiming Shi <bestswngs@gmail.com>, 
	Daniel Borkmann <daniel@iogearbox.net>, Nikolay Aleksandrov <razor@blackwall.org>, 
	David Wei <dw@davidwei.uk>, Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v4 0/7] net: devmem: support leased RX and TX
 queues on netdev unregister
Message-ID: <awB9nOahr_lP5teq@devvm16445.scu0.facebook.com>
References: <20261120045918.1239746-1-almasrymina@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261120045918.1239746-1-almasrymina@google.com>

On 11/20, Mina Almasry wrote:
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
> 
> v4:
> - Rebase onto latest net-next/main.
> - Fold net_devmem_lookup_dmabuf() into net_devmem_get_binding() under a
>   single rcu_read_lock() (deferring net_devmem_dmabuf_binding_get()
>   until after all checks pass) and update net_devmem_dev_unregister() to
>   use a two-pass loop with a single synchronize_net() after clearing
>   NET_DEVMEM_BINDING_LIVE and before unmapping bindings with
>   map_dev == dev (Paolo).
> - Document issue discovery, validation, and testing in commit messages
>   and the cover letter (netdev-bot+sinfo).
> - v3: https://lore.kernel.org/netdev/20261115022607.348112-1-almasrymina@google.com/
> 
> v3:
> - Rebase onto latest net-next/main.
> - Add netif_lease_valid() helper and keep lease validity checks in the
>   lease-aware callers (netif_mp_open_rxq(), netif_mp_close_rxq(),
>   netif_rxq_cleanup_unlease(), and net_devmem_bind_dmabuf()) rather than
>   inside __netif_mp_open_rxq() / __netif_mp_close_rxq(), and document why
>   mp_params is cleared directly when !netif_lease_valid(dev) (Stanislav,
>   Sashiko).
> - Guard the bound_rxqs loop in net_devmem_unbind_dmabuf() with
>   if (binding->bind_dev), keep the !netif_is_queue_leasee(dev) guard in
>   net_devmem_dev_unregister() in patch 4/6 until patch 5/6 resolves
>   binding->map_dev to the physical device so the series is bisectable at
>   every commit, and document the use-after-free in dma_unmap_sg_attrs() on
>   physical netdev teardown in patch 5/6 (Sashiko).
> - In nl_netdev.py, verify dmabuf and lease on the physical queue after
>   binding, skip when queue_create returns EOPNOTSUPP, probe the physical
>   device on EOPNOTSUPP so a broken lease lookup is not masked as SKIP, and
>   clean up nk_ifname between loop iterations (Sashiko).
> - v2: https://lore.kernel.org/netdev/20261108055809.2122934-1-almasrymina@google.com/
> 
> v2:
> - Split patch 3/4 from v1 into 3 smaller commits (patches 3/6..5/6).
> - Clear rxq->mp_params and return 0 in __netif_mp_close_rxq() whenever
>   dev is already unregistering, avoiding queue reconfiguration on an
>   already-shut-down map_dev during cascaded lease teardown (Sashiko).
> - Drop unnecessary xa_erase() in net_devmem_unbind_dmabuf() and use a
>   local map_dev variable in net_devmem_get_binding() (Stanislav).
> - Restore ASSERT_EXCLUSIVE_WRITER(binding->bind_dev) in
>   mp_dmabuf_devmem_uninstall(), drop redundant bind_dev->reg_state check
>   in net_devmem_bind_dmabuf(), and expand commit message rationale
>   (Dragos, Stanislav).
> - v1: https://lore.kernel.org/netdev/20261103232659.1340283-1-almasrymina@google.com/
> 
> Mina Almasry (7):
>   net: devmem: pass net_device pointer to net_devmem_lock_dev()
>   net: devmem: rename binding dev and vdev to map_dev and bind_dev
>   net: guard memory provider RX queue open and close on unregister
>   net: devmem: fold net_devmem_lookup_dmabuf() into
>     net_devmem_get_binding()
>   net: devmem: always populate bind_dev and detach both devices on
>     unregister
>   net: devmem: resolve physical map_dev for leased RX bindings
>   selftests: net: add leased devmem RX and TX netdev unregister tests

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
