Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794253985;
	b=SUT9AdXF4SRcpmnX5u50OGry2O9c4lQhnIOsj3mxOBTFNjSZl9YHFwTcNOX1wbXsq+kN
	 Pjwgz05sFXqGOC/gC70XD8u672Hxsf5wfik/ZSr+pPM6kAapXmf9pzCCCd/Ck7zMJHKWn
	 46kvGSuNXRRhRl/ZvtCaShtAAlSDb/V37ENOdgvOPal8wDQDCuR7AeCJkdlV72683UeFj
	 v1w7cx0rqOyloJmf9okzsOu0JVygBue60WAejdR2dCUcEiuUiThQFpDYiVuq0J3kszVv7
	 8q4zEivGdHzKG+s3e+yjN/IiyQfEhp0V8wbG7EbYQNOqNaNiWhf6DmOtJA58cQ6iZcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794253985;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=FMtzZSTePsqyAZZxCGo8MwfwBr67cppzq+ZS1S4y9wI=;
	b=FUPq3rJCvNbtYYoQx4g8cRnYFIO+nD2NahxYptXxXJIqxhq9Cu7HgX+e5fSM6mRufS5t
	 D23o2TDLwxSZm7risu+o8HC3f8XZw4coK6LKmL/b7b3BgXMaUj4q1UdGaVVf0g1IhVZ3i
	 4AowWgonlgFWKzxk7qhQcXwI7lYRKtWqsDJJL9dFEz2of9HOfBTToD1fETw39y2+yYkLX
	 xpMXwTFpqw+yoHLV6ssGyQFPTu5q+WIla+PbRtySJdjNa4C9dP3DaVQQ3iW05wAu76OfA
	 Ac3Xl2T/uNaWo+MvV0lBSgf11urPnBGbxiOKvc16fjbUa1EAPl20dm6rNluJT9B/8Zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PNCWuayX;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77956606A31C
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 19:53:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77956606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PNCWuayX
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-36c9b5c6faaso982439eec.0
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Nov 2026 11:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794253983; x=1794858783; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FMtzZSTePsqyAZZxCGo8MwfwBr67cppzq+ZS1S4y9wI=;
        b=PNCWuayXaw6cdsnihksxBFStS1vdDbWuT5N2TsQ7QXhUAMyQtRbJLKqVNoaOEG1Vs8
         QoXGYdLae7VvZIScE77VdhcODq5NFWR1ZA0LkVPG1k8npy6YIHYEyQGUTP3MwnYbZ67P
         SgvwBWSrWuh2CsR3GK6Ez9wvx22SokHJMaVrDKnWoMPan36LxuxrrtWX2G0mCD8BmmPS
         XXpcbQAudBOVxiB82PHK9SxAV9eypHgAC+4YBGaCP/JiJyZZ6hwlZU4f/XZr5Ms1+HLR
         StnrhupHc2YUYWtj5ZEuU8xIe0LunAUh7CTt4rhkHvORHsC7hxyT/NVmsZC9tM7rA8qg
         eOtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794253983; x=1794858783;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FMtzZSTePsqyAZZxCGo8MwfwBr67cppzq+ZS1S4y9wI=;
        b=Iw/ZzKsJpMj6XXhkx902cGQxf1k0CLVjNoh8g3n8sos5Y+DxZ56PTxcl87wJdrj0TY
         6sTYf2NglcLpO4CMhdZ5tcp3GOy0IgtKbQvKzAJrOiK03ROyXBD6LkMKanMnK4Pe/vdP
         x7Otth4WBdwxDCeTxLrR9MnNwrH7YUN1PKwJVEHOguUeW3Tay6GPN/2tQfyflu1h0tNl
         fEr7tqMWF6MUj8bN5mbuurewmwrb00Vr3NQPVgYqkFDMmPJKkUK/6tcPpwxY1qYh8jJy
         JriWaG/arq+vaI4nzqa1S1TM4/1rirD9awUdh72bqZ9QrHHD79wfksZud9witHIJQEfF
         RSRg==
X-Forwarded-Encrypted: i=1; AL+hErFRzoWf1Hb3YjfUdmuZlQp4KqFGZMxAdMLtABeHQo98F7i9n9HBweqKCJIEsCwRlFC7wwMu7qa8NgRx+0FtqvE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qRteP+c7JsHVbmz+DDLFlGpvEGqSteNM2tA+VO+ckEv294We1
	C/m17bOfAKh/fDwhtdANudXU5IMsT5N7aeBJuQIeTe2br7/7zCaJhiLeTSDm6mnL8vw=
X-Gm-Gg: AYBFou0P8cXovbImhTq2TDyIhZW3A0mAW338zB75bWUdreGevhUQ60WbL0trfJVroaq
	+OR7hNG8j9/ViUppk9bT48UaWWMRggEdPkCRPN4Gz0kfxkjrTtwwFxPQ6K1/cGbKev4jZBOdTOs
	d9euKUUFmu8NSfehSFDrgQjo82T0As/vmBnhIEs+JtrHsO73DjkyKWWHwtMLHMS0YxRGr3IqDtL
	QGqP2/c3aiV/WxU96Zp9Ful1eJCG7u40gKmMf186y+o9lsK6xO3zT4YDkKyu6qsmEccgoALho5P
	YXNpW5AV8KeHrJ5Up+BnKiY6Wt6hT4wzgWoM22JjDr1p5MrhmO+rfWum/oNSLqDJ7NaopYi7dT0
	jxQQK/NclJjcxJs/Hvsi6lh7tB3vHfLfdqBUpH/IMIFiGJWQnYZtE7Ymlb2xd/Rb8Xot6h1+NMC
	exgb/eGnDnCWAFULLQ1SvGzHoijAMuhys37K0eP9gay0Vtq/upbKH/Kee2c8Cw+xE+Ns+YC6l9N
	K1qtBr76v7Bv5BYInOemKSrppw0MPhCDfsIY/K8i0ny5rc9kLvJocSrkXjMLmpMVgC6aWHNGwIx
	iJUNxethHX7g/dWhRBFuYg==
X-Received: by 2002:a05:7300:a8d:b0:36a:75aa:33bc with SMTP id 5a478bee46e88-3751f56033dmr328827eec.24.1794253983392;
        Mon, 09 Nov 2026 11:53:03 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:66::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520bfb58dsm839952eec.18.2026.11.09.11.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 11:53:02 -0800 (PST)
Date: Mon, 9 Nov 2026 11:50:48 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Daniel Borkmann <daniel@iogearbox.net>, Nikolay Aleksandrov <razor@blackwall.org>, 
	David Wei <dw@davidwei.uk>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	Dragos Tatulea <dtatulea@nvidia.com>
Subject: Re: [PATCH net-next v2 3/6] net: guard memory provider RX queue open
 and close on unregister
Message-ID: <avIbO71p_947-PIf@devvm16445.scu0.facebook.com>
References: <20261108055809.2122934-1-almasrymina@google.com>
 <20261108055809.2122934-4-almasrymina@google.com>
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
In-Reply-To: <20261108055809.2122934-4-almasrymina@google.com>

On 11/08, Mina Almasry wrote:
> When a memory provider RX queue is leased to a virtual netdev,
> netif_mp_open_rxq() and netif_mp_close_rxq() redirect through
> rxq->lease and lock the physical backing netdev directly rather than via
> netdev_get_by_index_lock(). This raises two issues during netdev
> unregistration:
> 
> 1. In __netif_mp_open_rxq(), the physical backing netdev may already be
>    in NETREG_UNREGISTERING (after dev_shutdown() and
>    dev_memory_provider_uninstall() have run on it, before cascaded
>    unregistration of the virtual leasee tears down the lease). Reject
>    opening an RX queue if dev->reg_state != NETREG_REGISTERED.
> 2. In __netif_mp_close_rxq(), when the physical backing netdev
>    unregisters before the virtual leasee, dev_memory_provider_uninstall()
>    on the physical netdev does not uninstall the virtual queues, so
>    phys_rxq->mp_params remains populated until the virtual leasee's
>    netif_rxq_cleanup_unlease() or socket teardown runs. At that point
>    the physical netdev has already gone through dev_shutdown() and must
>    not call netdev_rx_queue_reconfig(). When dev->reg_state >
>    NETREG_REGISTERED, clear rxq->mp_params and return 0.
> 
> Signed-off-by: Mina Almasry <almasrymina@google.com>
> ---
>  net/core/netdev_rx_queue.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/net/core/netdev_rx_queue.c b/net/core/netdev_rx_queue.c
> index a7261fedd5e76..85ae5abf16b8e 100644
> --- a/net/core/netdev_rx_queue.c
> +++ b/net/core/netdev_rx_queue.c
> @@ -193,6 +193,14 @@ static int __netif_mp_open_rxq(struct net_device *dev, unsigned int rxq_idx,
>  	struct netdev_rx_queue *rxq;
>  	int ret;
>  
> +	/* A leased physical dev is locked via rxq->lease rather than
> +	 * netdev_get_by_index_lock(), so check reg_state under its lock.
> +	 */
> +	if (dev->reg_state != NETREG_REGISTERED) {
> +		NL_SET_ERR_MSG(extack, "Device is being unregistered");
> +		return -ENODEV;
> +	}

nit: wonder if we should keep lease vs non-lease handling in the callers?
netif_mp_open_rxq/netif_mp_close_rxq already handle this, and __ variants
seem to be unaware of the leasing abstractions.

Maybe put them into some new lease-valid helper? So we can keep these
tricky details in a single place, similar to netdev_put_lock?

  netif_lease_valid() { return netif_is_alive && netif_device_present } ?
