Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86844F0558
	for <linux-kselftest@vger.kernel.org>; Wed, 16 Sep 2026 12:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789562687; cv=none; b=fMPlNtX7IO0uAZ4XOcgHLpRiaKH6mWYigrcbLdsJ6k+z4w3X0OldVkip61qqwvMUhKSrsi/1SMYAhtTWQYXlyMV2XAAIaagD3POErw6B2Y042pCsKTSN0y0E9H2yzryLNjdVvZkvF76pLFyQcm2TRA5eRJR2HkKzHdF/7dt0nps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789562687; c=relaxed/simple;
	bh=R6gErF33Osgu7Z3SwcLr9EAh1+JuJ9MhvIEQ63MOWQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QRu/vUPssF2kafi7dpmC95xv83qEZTR7gRIxOIYx3f0AY3tH4T+T2780i0ElSVjl2YRkiA0d41GRVEdLk2b7Js6ydojeTIFpInozREqEiTxu4+07iccxSzZ5M2y1QUgkIsYHaZyDNjhjdfvFlz2J/kJuCEgvx/inm5xAHzlOGRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I1tqclnv; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=grXiK//V; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I1tqclnv";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="grXiK//V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789562682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xtQRXCuPYRxWKGeHGm4yA8jBCwKuCZ6dScY6lTLEkSY=;
	b=I1tqclnvth+ZBN3/5/xaUPUrLrnMcIin+fke49CIwgQj3ZasSPRsAjoAGhWRN1diGOJS5n
	2ic4Oyi038jaFcl7OLs6BLBEgu8CYE6RollkV/yIVbl03ZyEln2NGzEO1Iw0qT9056rjp0
	89Tjf6AAkmzSWkgmqJ2xD5sl0PM2cQQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-140-1JM73LOoOOisJmrxvqeeEg-1; Wed, 16 Sep 2026 08:44:41 -0400
X-MC-Unique: 1JM73LOoOOisJmrxvqeeEg-1
X-Mimecast-MFC-AGG-ID: 1JM73LOoOOisJmrxvqeeEg_1789562680
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4843e59c32dso3795563f8f.3
        for <linux-kselftest@vger.kernel.org>; Wed, 16 Sep 2026 05:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789562680; x=1790167480; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xtQRXCuPYRxWKGeHGm4yA8jBCwKuCZ6dScY6lTLEkSY=;
        b=grXiK//V+b7/KQTPXz7+Ge3n/6GHGWSt3mlWQqlGgH7W4FLoHfTxrE0cCABZkXqsOF
         s4gaumXOGdLWAwNv8tyGQnjnhnGpyUy5Uol4YLXzE9lv4nowCLeBtpHzl0/LWv13smHr
         KGIakXJWgHhmea/Nx91ydPw+Mbx6/EvbCYYZSqTWHBzkrtoMAaDl2vFObkx1iGQLM20U
         WSkG2R7tfby2IXgk32YiCIL2LaQgf2LdkWX2ID+VJe9rwZeNLHYvKas+BruIZjFlLTn1
         SCwXZ3PPMTicZi6RopsKu3RlUf0yTTK+lSZX8xMiAyv9DdGItOnq+laXjKE6j4EB+0OC
         vceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789562680; x=1790167480;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xtQRXCuPYRxWKGeHGm4yA8jBCwKuCZ6dScY6lTLEkSY=;
        b=bw13hItJkIsDvYBQw8lV6cfDJE2eWfBiLvdXX/psvxnFlmFV5QJZqa891LBvXNOap8
         f5vtGZZDS1kYL4SfXJIdWXneckCbcRf09FCgVFbc8i6h0rYtN0ID1PuFlkYsd7lRry3i
         lUIGXy8mkA8vRu+wEk3J2K5p6+qCccAZVuEtMOMMfSRWo6yq6/WrVyv56lwCTjG2DgxI
         qPdCLSia/qCdbiwA/ZUysky3kF6w2+nN6NmeZ+gWX+Ng6ajh1OOCu4UzAtF5ceyVECvC
         pdCTWmQuMOSHZjWqGdrPdfJRdNcudOeFrp1k9nBS0Q5ok5dq83w2o6BRZox4pqYQQxaX
         Be3g==
X-Forwarded-Encrypted: i=1; AKwUvBzQQZF2V8pn2rivz68r9PwvF4HjxcEFAbwvEfirPXG6AWaDPXPKjkqxombevMztwd+NIhAvBo6OQ/jQd6ib1Ns=@vger.kernel.org
X-Gm-Message-State: AFuF++mapDfOn6xa+XNWFwlPAYUkKOgh8heyhz5n3zVXCL8PYqiQbiI/
	K0SYH2JfrOMMWDF6jlDmIhaCvvBOC4StCtN0BbbipCHk+eC6kkq5uP0Dp7Tyxz8iIAbodl8v402
	Tw6c70UEpFRC5weyF954pNZHaZQ+/BoDYWUssYJRU018np+ZEwT1OMyxGM7Fq/U0N0XiEZg==
X-Gm-Gg: AYBFou2N/K1nbD6MOyJ4zNHZwBWJ4xnHa5qD/6dsPBvJlum0xaDJRqMRjkDbZ9nv1ZW
	rb5Y2sgrQExNKlMY+1mu8rUGPDdi1Q2esIlO3ZEhgINh9y7QZXeT81D/r3vpQWLXKtjclhRSYeM
	XZI9TA4RFK3kF6v+nNjoDz6Q5pi9JlieCMOny+dusDr/ewLS+CU/Fcg9jOOTW4aueItfmaoIHeV
	jWtecroMzyQr170lvQsLDOXshpwEQPo+R+rVZ+2sX9+AwesG4rqKRMdgU1yxxu8vFN28oN8Ffjv
	GwhOG1Wfd/VGfxqTGa85Efs+ZioOwGf4r+OVbSkafli0i8n+U2Ufhdr7uXJy8xKNW/0/qSOylCr
	CYM3fQS9amfa367FrVy9Ig6URjSD3MNh7d12boG2M9hXoOQ==
X-Received: by 2002:a05:6000:2210:b0:486:e949:532c with SMTP id ffacd0b85a97d-4870d16d687mr2826032f8f.43.1789562680229;
        Wed, 16 Sep 2026 05:44:40 -0700 (PDT)
X-Received: by 2002:a05:6000:2210:b0:486:e949:532c with SMTP id ffacd0b85a97d-4870d16d687mr2825969f8f.43.1789562679479;
        Wed, 16 Sep 2026 05:44:39 -0700 (PDT)
Received: from sgarzare-redhat (host-79-53-30-11.retail.telecomitalia.it. [79.53.30.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf3494dsm6691205f8f.28.2026.09.16.05.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 05:44:38 -0700 (PDT)
Date: Wed, 16 Sep 2026 14:44:28 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Jason Wang <jasowangio@gmail.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, sargun@sargun.me, jlinbox@meta.com, 
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next 3/6] vsock/virtio: support guest device network
 namespace
Message-ID: <aqqNZX0gk0I6AbVG@sgarzare-redhat>
References: <20260902-vsock-guest-ns-v1-0-9995383e9a8b@meta.com>
 <20260902-vsock-guest-ns-v1-3-9995383e9a8b@meta.com>
 <aqlkWGyoUYrgQUzz@sgarzare-redhat>
 <aqmLFzcF3MmwRITz@devvm29614.prn0.facebook.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <aqmLFzcF3MmwRITz@devvm29614.prn0.facebook.com>

On Tue, Sep 15, 2026 at 11:14:47AM -0700, Bobby Eshleman wrote:
>On Tue, Sep 15, 2026 at 05:47:02PM +0200, Stefano Garzarella wrote:
>> On Wed, Sep 02, 2026 at 04:00:49PM -0700, Bobby Eshleman wrote:
>> > From: Bobby Eshleman <bobbyeshleman@meta.com>
>> >
>> > virtio-vsock did not have namespace support (the device was always
>> > accessible to any global namespace).
>> >
>> > Make the virtio-vsock device assignable to a namespace and initialize it
>> > to init_net. Because virtio-vsock and init_net are both hardcoded to
>> > global mode, nothing changes until the assign ioctl is issued.
>> >
>> > When the device's local-mode namespace is being destroyed, received
>> > packets are reset until new valid a namespace has been assigned and/or
>> > automatically returned to, and the next RX batch begins (in
>> > virtio_transport_rx_work). They are reset rather than dropped because
>> > vsock does not retransmit, so a silent drop would leave the host waiting
>> > for a timeout, and a connection request arriving in that window has no
>> > socket whose teardown would tell it otherwise. This requires making
>> > virtio_transport_reset_no_sock() available outside of the common code.
>> >
>> > When a device is assigned to a namespace, every already established
>> > vsock socket that is no longer able to reach the device is forcibly
>> > reset. For that reason, adding new sockets to the connected table must
>> > be performed atomically with regards to namespace assignment. This
>> > ensures that when the socket is added to the connected table that it
>> > actually passes the new reachability conditions set by ns assignment. If
>> > it wins the race to the table and does NOT pass the reachability tests,
>> > then the reset sweep will correctly catch it. This is the purpose
>> > of the new helper 'vsock_maybe_set_connected()'.
>> >
>> > Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
>> > ---
>> > include/linux/virtio_vsock.h            |  2 ++
>> > net/vmw_vsock/virtio_transport.c        | 28 ++++++++++++++++++++++------
>> > net/vmw_vsock/virtio_transport_common.c | 28 +++++++++++++++++++++-------
>> > 3 files changed, 45 insertions(+), 13 deletions(-)
>> >
>> > diff --git a/include/linux/virtio_vsock.h b/include/linux/virtio_vsock.h
>> > index f91704731057..9c68ce1d7fb4 100644
>> > --- a/include/linux/virtio_vsock.h
>> > +++ b/include/linux/virtio_vsock.h
>> > @@ -286,6 +286,8 @@ void virtio_transport_inc_tx_pkt(struct virtio_vsock_sock *vvs, struct sk_buff *
>> > u32 virtio_transport_get_credit(struct virtio_vsock_sock *vvs, u32 wanted);
>> > void virtio_transport_put_credit(struct virtio_vsock_sock *vvs, u32 credit);
>> > void virtio_transport_deliver_tap_pkt(struct sk_buff *skb);
>> > +int virtio_transport_reset_no_sock(const struct virtio_transport *t,
>> > +				   struct sk_buff *skb, struct net *net);
>> > int virtio_transport_purge_skbs(void *vsk, struct sk_buff_head *list);
>> > int virtio_transport_read_skb(struct vsock_sock *vsk, skb_read_actor_t read_actor);
>> > int virtio_transport_notify_set_rcvlowat(struct vsock_sock *vsk, int val);
>> > diff --git a/net/vmw_vsock/virtio_transport.c b/net/vmw_vsock/virtio_transport.c
>> > index 4f9aa9c4c3aa..a453a4f828dc 100644
>> > --- a/net/vmw_vsock/virtio_transport.c
>> > +++ b/net/vmw_vsock/virtio_transport.c
>> > @@ -540,9 +540,14 @@ static bool virtio_transport_msgzerocopy_allow(void)
>> > 	return true;
>> > }
>> >
>> > +static bool virtio_transport_netns_assign_allow(void)
>> > +{
>> > +	return true;
>> > +}
>> > +
>> > bool virtio_transport_stream_allow(struct vsock_sock *vsk, u32 cid, u32 port)
>> > {
>> > -	return vsock_net_mode_global(vsk);
>> > +	return vsock_g2h_net_reachable(sock_net(sk_vsock(vsk)));
>> > }
>> >
>> > static bool virtio_transport_seqpacket_allow(struct vsock_sock *vsk,
>> > @@ -587,6 +592,7 @@ static struct virtio_transport virtio_transport = {
>> > 		.seqpacket_has_data       = virtio_transport_seqpacket_has_data,
>> >
>> > 		.msgzerocopy_allow        = virtio_transport_msgzerocopy_allow,
>> > +		.netns_assign_allow       = virtio_transport_netns_assign_allow,
>> >
>> > 		.notify_poll_in           = virtio_transport_notify_poll_in,
>> > 		.notify_poll_out          = virtio_transport_notify_poll_out,
>> > @@ -616,7 +622,7 @@ virtio_transport_seqpacket_allow(struct vsock_sock *vsk, u32 remote_cid)
>> > 	struct virtio_vsock *vsock;
>> > 	bool seqpacket_allow;
>> >
>> > -	if (!vsock_net_mode_global(vsk))
>> > +	if (!vsock_g2h_net_reachable(sock_net(sk_vsock(vsk))))
>> > 		return false;
>> >
>> > 	seqpacket_allow = false;
>> > @@ -634,6 +640,9 @@ static void virtio_transport_rx_work(struct work_struct *work)
>> > 	struct virtio_vsock *vsock =
>> > 		container_of(work, struct virtio_vsock, rx_work);
>> > 	struct virtqueue *vq;
>> > +	struct net *net;
>> > +
>> > +	net = vsock_g2h_net_get();
>> >
>> > 	mutex_lock(&vsock->rx_lock);
>> >
>> > @@ -682,10 +691,14 @@ static void virtio_transport_rx_work(struct work_struct *work)
>> >
>> > 			virtio_transport_deliver_tap_pkt(skb);
>> >
>> > -			/* Force virtio-transport into global mode since it
>> > -			 * does not yet support local-mode namespacing.
>> > -			 */
>> > -			virtio_transport_recv_pkt(&virtio_transport, skb, NULL);
>> > +			if (unlikely(!net)) {
>> > +				virtio_transport_reset_no_sock(
>> > +					&virtio_transport, skb, &init_net);
>>
>> Why init_net?
>
>This parameter is actually unused by virtio_transport_reset_no_sock(),
>its call to virtio_transport_send_pkt(), and even the eventual call to
>virtio_transport_deliver_tap_pkt()... so maybe NULL w/ a comment would
>be better?

mmm, should we remove that parameter if unused?

Anyway, not in this series/patch.

Here, anything is fine, just put a comment with the reason.

Thanks,
Stefano

