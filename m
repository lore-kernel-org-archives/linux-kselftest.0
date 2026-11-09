Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794253985;
	b=DIW0yw2dnfLPpyAL6ywoHrf9wcyn4cBlPGMccML2V65iPiWtIBhhNwCeM4XxLvzLRgY2
	 E8QwYhJii+YbXtrGmsmlGJPNgTxD1UPxI+ii8NgcO1tk0qiEH35kNSrE6lFvm8quH4s61
	 fXK4PHkOtYJWaDm66kNazWQrCZlB3kwe5wKvO9U2UhNm47xyEax2wvlVQY//1PAHiCcJD
	 9WZd7kXgleYZhfyNIIaaeFqRLJYdHdXWvHH/bCPkdqtEq7ECt9HGs8ovM4974/YZjiN6Y
	 7HluYUiDs53ZjPZzPgAfV2BS74tji5IWfVYvAB92/pqrMaOf0/1HMfgwOWcMY+pf7Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794253985;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=gAorfxIyUvbBcX96PfMi8oF/ogo2BfVfyJbNm4STPww=;
	b=wYddnYFTvDCs3UgPVhIlnQcgSGd7HNBRgauSH6t2/19lfRi0O5Tbu9bu9AKXYoMGBMgH
	 2Pep3w8/RB4BNi4SBfA3XCtDkK8DxNuaVxsrfX1JsuBPb1jfsJV2SAiPnaMvBjRjMlD5X
	 Nva4Ke2K32bZHXn/RpAOZMRsBeMZh4eQjiyAzXQLlqo2Lq13zoyyCE6LViCjmLvXXrvJA
	 t63vS/wK5n+isbYG0i88NrTGqRHh3kHVNmCSzfPlOIr2414Ze8QffbS7Wct9y4JluIUQf
	 bfvUtNYU2izkPsQMdJLgp/+Kxa7dzfAARdVRk6CUAGl4wQtCV5AQ+RxCUOeVIBgnUcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="qWt7ITv/";
	arc=none smtp.remote-ip=74.125.229.133
Received: from mail-dl2-f5.google.com (mail-dl2-f5.google.com [74.125.229.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80065606A338
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 19:53:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80065606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qWt7ITv/
Received: by mail-dl2-f5.google.com with SMTP id a92af1059eb24-1ac216daf7dso723388c88.1
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Nov 2026 11:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794253985; x=1794858785; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gAorfxIyUvbBcX96PfMi8oF/ogo2BfVfyJbNm4STPww=;
        b=qWt7ITv/CVwWMnO7nbLE6nC1aAG5BonHOqFPfpJ2NRQcvtRZ9dsC5eGGAEcWlg26t6
         +CT7WN6RIUhJbmYItfcn1xjHuwLfuHkFdrNFoMyaEh7XmF7G9+Y9ZIbOCeBk3fneev2h
         /JNu+ddogJjpbCGMh4BbytOPM5alPXMUa5asoR5PHa6t4dfmk1IuMgme4xdsL7hev4Dn
         QItB3o91jx11IjrEGYFriODKb5B4NfjfkLao1NTJ1JOeUtCM8R4zCJNgsaCtDYKG2RI4
         +YE/w2slWhO0xN3ZOsSzSihZE6FMtfO92PwwJLY+wjRg/XtVzhi4mPH+raWRKqayBo+d
         c9Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794253985; x=1794858785;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gAorfxIyUvbBcX96PfMi8oF/ogo2BfVfyJbNm4STPww=;
        b=xdJOa5VFRpXPNP5SRXbopQX84Qgqp5m0b2Yx2VKHllV2YNeXJfJ/OfIBC6SmFO/lPp
         N2+jAQIgxhEUQuzAPGbAmW8Yq3nh5WEaSkbTEy+Eo7iNYdun8c6LSM55nV5K+4Pu6Qq2
         M5TWcI/KhrIZCxse6YVP7dFJ3sJhkWwfyy3/qn1LSpURNI1WFHi81ilgPPhyyelfKU/R
         fTlrJF2LB5eOArfdtB2D4LgZTebKUW/GC9y4vJt066Zaxba0UOvreNwcg+gsjEE8bMsm
         8yrqwN9vN0ZVTKpA04SmjcahD8dwDxGV62JXpK1LY/5CRrzadZCafN5rK+Cl2WGyrIiE
         lSjg==
X-Forwarded-Encrypted: i=1; AL+hErFDXCOr3jEz6KGSWUVwSbbYah3VDeVjRkCS8pxAesG5bmUtklTABcOMJzb11cKy1+R2EkYnPKmstCZJv1f7SzM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cGTwBRsMYILyktIsDjK+q++4tospnGHS9NNNLlue/A+B+5G2q
	yOm9WukKmQu3EQqqy32+mKeoq2/XaxuQL+zIhbylhTRvNj6oN4eyOEP1
X-Gm-Gg: AYBFou2lB5VkrNiNSpkmjOSebx9DNtq4Jv4mFTIauFm2zCQeR0NxKe/u8jTQk37Xipz
	UC9VPF2X4p7jC0ZdUKqEqijT9TKNOwCUl+l/zZky+g45UuFwFZ8lh6TSL1K75ihRq9EWQgSacf7
	PgKy8YWHXYM7gwkpmy/o5PLO8WFU27WbNDrXgAjbhF8b1hy83ld61D3K/8eI2PfmYwVMxRxf4bw
	ziZ4f3tMmihht1zhHhJxkIroPk0rL8pmPi38XtWmjDe2K+ct/KR5umlsWpVfpeMPUtT6BvuZ/NR
	kzrP5iV6Brwb0TmAB+6e1jkMKftM/qtigPrKXcNy5Wiwzl8qX1gqCZUpI6fawfhDkhoJe6Nqzu8
	EH/ZWcULcFz/K4J63cv3eb0DsSlS+LURg82QVA8fL2B9TmlTmgP0eNj8dyJxLxoFp05cJan1YCZ
	4aNn8JBSE3O+S3GUfyBJuwyr16XV0ivWVtLV+3wSlRL/HxXW3rGgnhfHMUuwX9ST6Ph+N03Eskr
	0zpMDQ0hUC/a9yaG7jXkhjRTRuz4Fo3GGMHGqWRhWpg7s/K2BaB8gz3P7EPDFGUu9JckmSaBwvN
	8h6gs2E+q56WkUSdN7qV7g==
X-Received: by 2002:a05:693c:6007:b0:36c:da71:37e0 with SMTP id 5a478bee46e88-3751c6350e1mr401135eec.2.1794253984600;
        Mon, 09 Nov 2026 11:53:04 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:70::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375218c863csm447069eec.28.2026.11.09.11.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 11:53:04 -0800 (PST)
Date: Mon, 9 Nov 2026 11:52:55 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Daniel Borkmann <daniel@iogearbox.net>, Nikolay Aleksandrov <razor@blackwall.org>, 
	David Wei <dw@davidwei.uk>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	Dragos Tatulea <dtatulea@nvidia.com>
Subject: Re: [PATCH net-next v2 5/6] net: devmem: resolve physical map_dev
 for leased RX bindings
Message-ID: <avIkaDJ_G89_BYH9@devvm16445.scu0.facebook.com>
References: <20261108055809.2122934-1-almasrymina@google.com>
 <20261108055809.2122934-6-almasrymina@google.com>
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
In-Reply-To: <20261108055809.2122934-6-almasrymina@google.com>

On 11/08, Mina Almasry wrote:
> Previously, netdev_nl_bind_rx_doit() passed netdev as both map_dev and
> bind_dev to net_devmem_bind_dmabuf(), so leased RX bindings stored the
> virtual netdev in binding->map_dev without tracking the physical backing
> netdev at all. Unregistering the physical backing netdev while a leased
> RX binding was active failed to detach and unmap the dmabuf.
> 
> Return the physical backing net_device from netdev_nl_get_dma_dev() when
> the RX queue is leased from another netdev, lock map_dev around
> net_devmem_bind_dmabuf() when map_dev != netdev (matching
> netdev_nl_bind_tx_doit()), and assert in net_devmem_bind_dmabuf() that
> both bind_dev and map_dev are locked.
> 
> Because a leased map_dev is reached via rxq->lease->dev and locked with
> raw netdev_lock(map_dev) rather than netdev_get_by_index_lock(), it may
> already have entered NETREG_UNREGISTERING and completed
> net_devmem_dev_unregister(map_dev) before cascaded unregistration of
> bind_dev tears down the lease. Reject binding in
> net_devmem_bind_dmabuf() if map_dev->reg_state != NETREG_REGISTERED.
> 
> Signed-off-by: Mina Almasry <almasrymina@google.com>
> ---
>  net/core/devmem.c      | 12 ++++++++++++
>  net/core/netdev-genl.c | 19 ++++++++++++++++---
>  2 files changed, 28 insertions(+), 3 deletions(-)
> 
> diff --git a/net/core/devmem.c b/net/core/devmem.c
> index bb785a871d1c4..2dac581a57e13 100644
> --- a/net/core/devmem.c
> +++ b/net/core/devmem.c
> @@ -321,6 +321,18 @@ net_devmem_bind_dmabuf(struct net_device *map_dev,
>  	size_t i;
>  	long err;
>  
> +	netdev_assert_locked(bind_dev);
> +	netdev_assert_locked(map_dev);
> +
> +	/* When map_dev != bind_dev, map_dev is locked via the queue lease
> +	 * rather than netdev_get_by_index_lock(), so it may already be
> +	 * unregistering before cascaded bind_dev unregistration runs.
> +	 */
> +	if (map_dev->reg_state != NETREG_REGISTERED) {
> +		NL_SET_ERR_MSG(extack, "Device is being unregistered");
> +		return ERR_PTR(-ENODEV);
> +	}

And you can call this new lease-valid here as well? Otherwise, the changes
are too LLM-y, testing some super low-level conditions and are a bit hard
to read/follow?
