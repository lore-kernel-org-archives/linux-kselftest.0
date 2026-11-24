Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795518448;
	b=x7ZZKxbgSwfQbi9gBy+15Zqzkcw5LI1UUmFhiej7/I+IX7tLoRvJQ75KsCJ5GPDYsKM6
	 o/j5CxXNOXgMqzCLBqnRKAKFuKCJmi5OwDHlhySUnB2JEPidBg1kZaFxLc2ZQc7e6Ha6A
	 RFObGJZ0/Of+BEPs+8RMvXNWqGU7+rQORNsDV6csQaly16cQmo9bBeK79+mG4D7Gu4IgY
	 lIeHI1ujkjEVK2RDii3HBtU+BrSClnOWuTiLVDDsWFW9Oc4ytF8JjBD9KvFpCpTENw/V0
	 ZelWHGUjF10DzP6DgVDE8jmqmPhq6W9Aq8ITY5y2pUC9N0tGRlPV+IEXvSkRWuAMYrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795518448;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=NPlVhPCIZl8GiH7a8flrLUPFA/vM4GEBifZKh2FcAuU=;
	b=DRAi1Y5hnnsK04gEiWgSjome0EbMQaOCLrNyNlXPL557D7XnEG4wM/YE+9CTPPhlozqX
	 UbuDKup1lZIRu/w8+r3vfddF3hGuVh0YG8TlRicdz6//av+Ap08mfuoxZzTYDeWFDCd1o
	 +bzdqwiWORyMxdUcUgErgMSvyl3QzyxDFXVOeCE8n0ABQUWqTP6AGff66DD0ordXjNxoY
	 0NOdaKQGvowDrpx+vQgIPSI7K7HN7wdkAdy3fmo8+va+U9tAd65L+jrxaGai1YEiBF2PA
	 p11qVuSG55wiPOHLJFjBWL4CswZPChIMKaJY1AZNTzaFaXCtS63d0WZyWNDZt/xK8Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OYi00JXt;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=SitU1Tuz;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34953606A31E
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 11:07:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34953606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OYi00JXt;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=SitU1Tuz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795518447;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NPlVhPCIZl8GiH7a8flrLUPFA/vM4GEBifZKh2FcAuU=;
	b=OYi00JXtnQeRvNyKFw+HZ2u+GyIMK6ve7TQngUQ9Lag5s30IZa8q1hSyhYYHXu4/ALfX2H
	OjTZUFt6IHoy8Jyg4Pwu8unhEXnOQR0z9KmRg2UvrIdDmNnyZUgqieKNHr5bmnNzmibpm8
	tP2xjsmjAsi2/hqFBh+S632ljuPPgnE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-440-k0lu2OU5PO2icG83WE-iUA-1; Tue, 24 Nov 2026 11:07:25 +0000
X-MC-Unique: k0lu2OU5PO2icG83WE-iUA-1
X-Mimecast-MFC-AGG-ID: k0lu2OU5PO2icG83WE-iUA_1795518444
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48e0ef019a4so2638709f8f.3
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 03:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795518444; x=1796123244; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NPlVhPCIZl8GiH7a8flrLUPFA/vM4GEBifZKh2FcAuU=;
        b=SitU1TuzSpfITjVZshQbgJpyKVCokMRHXEa6+qt/sl5QTAG00MUDpglQ4WJdfUOUHw
         3oam4EMlg6F9VvMzEBCCmtVaJi3nRRge6A0dRQvmAzCHXpQs3Xncnq1XwDGxNd9+Gh/s
         d2xoqmTHOhReqmu/LSMRkfzQcQAFCA9b2yBakZ/aODxc6FNueVe5k6IsghaVb5n4Eof0
         g0VrupCBJCFvkT6m3TBZfMYID2ZHleLG3gzEEuLkZQAnjuldI3wfigp8sr+IQUmE2/lk
         UW9aYmVsMpPRYAO4njY/nDv71vjTUk771nUCWjFJy0Alw6Jg2u9WEiqbFOAf1f11JqEa
         fZdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795518444; x=1796123244;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NPlVhPCIZl8GiH7a8flrLUPFA/vM4GEBifZKh2FcAuU=;
        b=G1jo87PYHl9ZaDsGP9EY2Cpi2RGSbwGtcUTTxPbqJTTUyI8q4uI1ehCNV6yJcrx/NY
         2eAMfPLNpBtki/UYsvDssIQMbmX8WNmwwkbHud1EMzMPbtglCpRvMpNpGSjr2K+Fz3Vp
         yuySD/SM32Seyz39oOcpVkecYtq+l+xX1Fut+ty1dmYN6G9+w0RVsDHR/alvvBvNrOME
         T8xF2udsTDKuEqBcll1g0yQeI0YHTEIpq4u6XJW52WWkwE6YNMaZq2b+ymuKfjw/HM2A
         UcJadlnVUMfrFxaeT+FxBt3Zz8WcikPTQLKFgRvLDEf9Hmy1v403ipejmVUFcNLbPPOD
         sSxg==
X-Forwarded-Encrypted: i=1; AL+hErFLF8qBz9fdF05swdwZRmkHvZS3RI0xK18z1BUogfeVZuoFLNmMBOMxHUGYVY2i8zzI03Vzg7ItDydBN6RymR4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xjBM6WjxWgFqBySCOffWz/Pi5DHTHdRYesDQIgr6EF0OCNPaN
	ZGbDm2H/Ns54r9bLGkzq9A6Te5DR5sTSFYw97objlExQ0Q/AQvRI34GiWw3ceY437OtTVm6cYns
	sy0twV8FVeWxrXtkIAWpUYZcYteN5bjnAYuZhYEylmYLOUmxPHMI8UYgrA+jepaWlPhEG5A==
X-Gm-Gg: AZFdTZcOY9bLkgq8FPxY8vU0GxHlAFAbqVz8h/WK1GW1WMwiSWtsc7/JEsaPJXVNsLh
	XNJmf2VG62k1xvBOeuMt2VUrdfVTSwVx/n9cyfafM3DQUaVnQVYqNLVzVuIF4S5m8zDCaoqIwfv
	rEqRlUBjmDpZcp9gZ9oE7e+l4pz5BhT/4duhQa3O6LOpDNSCosJasd3UekB6yk2W7kXItCOwT7g
	iszxF5uC5eCXB743p21bjvvC7bYMcZHTZ9DjEAYRyTXxVKKu4vhgBdYN/Z1Gz0NcIBThL8kupgM
	Up7E4c804Ab2eEbC6AmYpImOqntm/43afOd/BLv+eKQUoBkvXKRAZXs5jmG8jPRcgDNVAidpket
	WMV+x4psdX6VFlQtYqB8OomAbXAIfzY8XbFajE/uLQhWRrSi0P8Oyeh1eCWf/IteXs4oJpPjBYa
	EmzQEpjItShgZpsF7gH2byhjBYjl0rXhfPJWo/e1mE4IPh
X-Received: by 2002:a5d:5d0a:0:b0:4a7:e4c7:2795 with SMTP id ffacd0b85a97d-4abb71cbe31mr32232532f8f.36.1795518443958;
        Tue, 24 Nov 2026 03:07:23 -0800 (PST)
X-Received: by 2002:a5d:5d0a:0:b0:4a7:e4c7:2795 with SMTP id ffacd0b85a97d-4abb71cbe31mr32232488f8f.36.1795518443567;
        Tue, 24 Nov 2026 03:07:23 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d55sm27608496f8f.5.2026.11.24.03.07.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 03:07:22 -0800 (PST)
Message-ID: <adb6840a-26cc-4b66-a732-abe9f6bba60f@redhat.com>
Date: Tue, 24 Nov 2026 12:07:20 +0100
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 3/7] net: guard memory provider RX queue open
 and close on unregister
To: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
 linux-kselftest@vger.kernel.org, Weiming Shi <bestswngs@gmail.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>,
 Stanislav Fomichev <sdf.kernel@gmail.com>,
 Bobby Eshleman <bobbyeshleman@meta.com>, Stanislav Fomichev <sdf@fomichev.me>
References: <20261120045918.1239746-1-almasrymina@google.com>
 <20261120045918.1239746-4-almasrymina@google.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261120045918.1239746-4-almasrymina@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/20/26 05:59, Mina Almasry wrote:
> When an RX queue is leased from a physical backing net_device to a
> virtual net_device (e.g., netkit), memory provider operations reach the
> physical net_device through rxq->lease and lock it directly via
> netdev_lock(dev) rather than looking it up via
> netdev_get_by_index_lock().
> 
> Introduce a netif_lease_valid() helper checking netif_is_alive(dev)
> under netdev_lock(dev) and use it in the lease-aware callers while
> keeping __netif_mp_open_rxq() and __netif_mp_close_rxq() unaware of
> queue leasing:
> 
> 1. In netif_mp_open_rxq(), if the leased physical device is already
>     unregistering (!netif_lease_valid(dev)), netdev_get_by_index_lock()
>     on the virtual netdev succeeds before cascaded unregistration runs,
>     allowing a new memory provider to be installed on the physical device
>     while it is unregistering. Reject the open with -ENODEV.
> 
> 2. In netif_mp_close_rxq() and netif_rxq_cleanup_unlease(),
>     __netif_mp_close_rxq() reconfigures the physical RX queue so that it
>     can continue operating with a regular page_pool when the physical
>     netdev outlives the virtual queue or memory provider. When the
>     physical backing netdev is itself unregistering
>     (!netif_lease_valid(dev)), its queue will not outlive the lease and,
>     matching the non-leased unregistration path (where
>     dev_memory_provider_uninstall() detaches the provider without calling
>     netdev_rx_queue_reconfig()), the physical queue should not be
>     reconfigured. However, unlike non-leased queues,
>     mp_dmabuf_devmem_uninstall() on the physical netdev does not match
>     bound_rxqs (which stores the virtual rxq), leaving
>     phys_rxq->mp_params populated until socket teardown or the virtual
>     leasee's netif_rxq_cleanup_unlease() runs. When
>     !netif_lease_valid(dev), skip __netif_mp_close_rxq() and clear
>     mp_params on the physical queue directly so that a subsequent
>     netif_rxq_cleanup_unlease() or dev_memory_provider_uninstall() sees
>     !mp_ops and does not uninstall a second time.
> 
> These issues were discovered during AI code review (Sashiko) of the
> earlier non-leased devmem unregister series and confirmed by code
> inspection (not observed in production or reproduced on real hardware).
> Tested with the nl_netdev.py selftest on netdevsim added in this series.
> 
> Suggested-by: Stanislav Fomichev <sdf@fomichev.me>
> Signed-off-by: Mina Almasry <almasrymina@google.com>
> ---
>   net/core/dev.h             |  7 +++++++
>   net/core/netdev_rx_queue.c | 31 ++++++++++++++++++++++++++-----
>   2 files changed, 33 insertions(+), 5 deletions(-)
> 
> diff --git a/net/core/dev.h b/net/core/dev.h
> index 4e9e8cd156977..50cfede051db1 100644
> --- a/net/core/dev.h
> +++ b/net/core/dev.h
> @@ -119,6 +119,13 @@ bool netif_rxq_has_mp(struct net_device *dev, unsigned int rxq_idx);
>   bool netif_rxq_is_leased(struct net_device *dev, unsigned int rxq_idx);
>   bool netif_is_queue_leasee(const struct net_device *dev);
>   
> +static inline bool netif_lease_valid(const struct net_device *dev)
> +{
> +	netdev_assert_locked(dev);
> +
> +	return netif_is_alive(dev);
> +}
> +
>   void __netif_mp_uninstall_rxq(struct netdev_rx_queue *rxq,
>   			      const struct pp_memory_provider_params *p);
>   
> diff --git a/net/core/netdev_rx_queue.c b/net/core/netdev_rx_queue.c
> index a7261fedd5e76..98b51b2ac8ee1 100644
> --- a/net/core/netdev_rx_queue.c
> +++ b/net/core/netdev_rx_queue.c
> @@ -270,7 +270,12 @@ int netif_mp_open_rxq(struct net_device *dev, unsigned int rxq_idx,
>   	}
>   
>   	netdev_lock(dev);
> -	ret = __netif_mp_open_rxq(dev, rxq_idx, p, extack);
> +	if (netif_lease_valid(dev)) {
> +		ret = __netif_mp_open_rxq(dev, rxq_idx, p, extack);

I'm sorry for the late feedback, but it looks like the above patter could/should
be embedded into a single helper?

I mean something alike:

bool netif_lock_if_alive(const struct net_device *dev)
{
	netdev_lock(dev);
	if (netif_is_alive(dev))
		return true;
	netdev_unlock(dev);
	return false;
}

That could be possibly later used elsewhere.

Other opinions welcome!

/P

