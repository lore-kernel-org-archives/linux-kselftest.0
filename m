Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2D63A0E92
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 15:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771945819; cv=none; b=eVAIdbMn/HZBpj9q5bVcCiQNT3rzBo3Z31MvZ7/3dbrsRWWutsDj6xBzLXPxY7Vd91ZQ3/j2lwHyrGbxSUUNzZpRbefitwYVLndpRTa30E4/1zwrtvBuzkUe6m7ys9JVhiUnEVOyU7VwUU+0EIqApXz3iIXwOwJMohQxOJCLLxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771945819; c=relaxed/simple;
	bh=TAyHgBBI4ob9tTcrFegG2TRo7EKXGQuXyNpp/MzDVco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B8sa4XsVNqxd2YyaZf8D2FhjrKAUno2UYKaygH/1L+m5NqwTrD1Ti9MwJ1NS3pLODYCuReBXRgw0UqUzvs5dbAoyPq0rF+xBlbRHLyYfn/P87YiGhg2+SGNFqNVZBId7I/3G1VeiBwNGE8sq8oOXO63CznsZLAY2XKqFobVMV1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Cn/lkXq6; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=qtAZPZRs; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Cn/lkXq6";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="qtAZPZRs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771945816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sCeOSff7eDNB7TgbEfprmGtaT8WW51aaIgrRBupCpNA=;
	b=Cn/lkXq6YEK1vLnFlTOgXLa0Ykgr8IVDtek4hHRtUhUE1im4QiBhL7vN4J8Qk5aWIiD2Uc
	m0rQc779H7yZtqPHTt0U1WDxOkSGw1kdxd25PbGUthn+4uhTDEkGlKPfKAK+zrtTuzVuBj
	V5SZlxKqnLkvwx72K8PAY+A3AR3yQkc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-502-9ZsvKdg7OdCdn89Zj8G-VA-1; Tue, 24 Feb 2026 10:10:15 -0500
X-MC-Unique: 9ZsvKdg7OdCdn89Zj8G-VA-1
X-Mimecast-MFC-AGG-ID: 9ZsvKdg7OdCdn89Zj8G-VA_1771945814
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-48378c4a79fso42580455e9.0
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 07:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1771945814; x=1772550614; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sCeOSff7eDNB7TgbEfprmGtaT8WW51aaIgrRBupCpNA=;
        b=qtAZPZRsazWcNEz1dpn43MRNn7EqFMH6VV6pZ87VafHbDrcQEQOfi02XT09VW5yhB1
         9XZ0xPalpY7hY8ePKM4De1ov9ZSJFRsVX/eQpvrCRu7ks1NvnkmVPJNOJyzYF/Xm2NXc
         ueZJ1mG7Kci4NBnwl4qRBJn2r9oud/asUA4diHCVzDZ1nYQLJQm1afF6n6B0qp9f+PHK
         sUiEIQ64rbteFK83QYFGG5Swrjs+PzBRF+/BReAINXBfgfqBwYvaLhrijhCPf+eA9iVC
         awSbBUKjSvCNldw6QPXub/8jEGw5ZyhzC5gYE7hG/FRJHl0vfDxZkRDBWA/z1K2yPLgN
         nBJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771945814; x=1772550614;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sCeOSff7eDNB7TgbEfprmGtaT8WW51aaIgrRBupCpNA=;
        b=wJtRF5NqTX8rgKrCq40enpaphaLOgvh2QzrPO35bAn9SQ4amhJNFCrayQ3NhvxrlZY
         GaEO10R/sIbxXUcTG+iWVgDXEd4WtetZZw40cDeUU55bWTVLulsL5e81ZsNjcNH9Vv0C
         4IEQVV+InHbVjq0zDXn24VAS5MrOi8ax8vhhBofrlrFUCIxnPGF0wXlEeNJJXNw4Yans
         SWszYUaiRQkntoqBntpBgDVybX+JzACEfK/ExmTBOdqqKxixdkipHgoXvQwLWpX8ucwe
         DoVZMDHBsU/aqpC8G1yDyVHQ9OFCWmZSdLbPjoQnyZBFFX8LEClLlZXOu12F+1GuPWqK
         I3og==
X-Forwarded-Encrypted: i=1; AJvYcCVk5lclHfnS4pg+WetLSCxBCCMljGGPUZaveUTvnJbdN1CgEqlwetJD4jndDy71v4fSfwgmJZoFWpxlUQi7RRM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVdgCoA94Gtpvp8bF7viLSaYYu6EdNPGXXjkLYMb81Yfvg8Ed1
	M8rWUzzCCvxjCSC8ZPy4Y9/+vSdmps0KCUWa2v6MfN8tRtLOYNnEfRFajHU2/agcIQ2Jq7HkzAT
	xk/R7uuvg6Cpw/J2yDFk/fkgcHdJ2PxIZHJluIvPRfrDr7PFPH5+GGTuxaKJzo85/watQSg==
X-Gm-Gg: AZuq6aKnZe2obGKCth5xBBMHvV7Rkc4hMK8hv3ZTKsA7MqHfypAIQYuYFL4HLv+2AkX
	Zbq32XYt2jWWSSW0aCkI76VdxQy6ygDnu1BEEz6RX18YBcLnsECLPA6BpnVJt1kdJZ3v92+iGHd
	hmeByola4O9b5fRLrFd5QIWvjuha/Ek6lju9FJJHA5WkDvIaGQncqD6f2rM/XKLQ1SuvIdxEs5W
	0TuKkeaJuK4ALwVDekoL2asL9weOJSKqxltprkPXdK54h7jfHlP5yfc3MHDLBG6OUHOapfqd7n2
	4zp76M2zkk35Hliq/GDO7yNZubC+7RRk4rCidLCFCoecPDRVJyQ9AnziIwd6Q/1cIeHyTUddP1V
	dlRcm3/6zcHwT7OuUdXMFhvh/oiXYE6GRQYC9YXnUx9xYf22hmKtZmY5RrzC4eANN7Liis8k=
X-Received: by 2002:a05:600c:3516:b0:483:a21:7744 with SMTP id 5b1f17b1804b1-483a9637590mr181464415e9.26.1771945813998;
        Tue, 24 Feb 2026 07:10:13 -0800 (PST)
X-Received: by 2002:a05:600c:3516:b0:483:a21:7744 with SMTP id 5b1f17b1804b1-483a9637590mr181463595e9.26.1771945813378;
        Tue, 24 Feb 2026 07:10:13 -0800 (PST)
Received: from sgarzare-redhat (host-82-53-134-58.retail.telecomitalia.it. [82.53.134.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483b8912fcasm19737805e9.27.2026.02.24.07.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 07:10:12 -0800 (PST)
Date: Tue, 24 Feb 2026 16:10:07 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Bobby Eshleman <bobbyeshleman@meta.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	virtualization@lists.linux.dev, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
	kuniyu@google.com, ncardwell@google.com, Daan De Meyer <daan.j.demeyer@gmail.com>
Subject: Re: [PATCH net v3 2/3] vsock: lock down child_ns_mode as write-once
Message-ID: <aZ2-yzyNKXNkvPVG@sgarzare-redhat>
References: <20260223-vsock-ns-write-once-v3-0-c0cde6959923@meta.com>
 <20260223-vsock-ns-write-once-v3-2-c0cde6959923@meta.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260223-vsock-ns-write-once-v3-2-c0cde6959923@meta.com>

On Mon, Feb 23, 2026 at 02:38:33PM -0800, Bobby Eshleman wrote:
>From: Bobby Eshleman <bobbyeshleman@meta.com>
>
>Two administrator processes may race when setting child_ns_mode as one
>process sets child_ns_mode to "local" and then creates a namespace, but
>another process changes child_ns_mode to "global" between the write and
>the namespace creation. The first process ends up with a namespace in
>"global" mode instead of "local". While this can be detected after the
>fact by reading ns_mode and retrying, it is fragile and error-prone.
>
>Make child_ns_mode write-once so that a namespace manager can set it
>once and be sure it won't change. Writing a different value after the
>first write returns -EBUSY. This applies to all namespaces, including
>init_net, where an init process can write "local" to lock all future
>namespaces into local mode.
>
>Fixes: eafb64f40ca4 ("vsock: add netns to vsock core")
>Suggested-by: Daan De Meyer <daan.j.demeyer@gmail.com>
>Suggested-by: Stefano Garzarella <sgarzare@redhat.com>
>Co-developed-by: Stefano Garzarella <sgarzare@redhat.com>
>Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
>---
> include/net/af_vsock.h    | 13 +++++++++++--
> include/net/netns/vsock.h |  3 +++
> net/vmw_vsock/af_vsock.c  | 15 ++++++++++-----
> 3 files changed, 24 insertions(+), 7 deletions(-)

I still slightly prefer the version I proposed here: 
https://lore.kernel.org/netdev/aZbR2H2oDyIAxDef@sgarzare-redhat/

But this definitely affects the code less, so for `net` I think this 
patch is better:

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

Eventually, we can discuss in net-next patch whether to change the 
implementation to the other one, but for the user nothing changes at 
all.

Thanks,
Stefano

>
>diff --git a/include/net/af_vsock.h b/include/net/af_vsock.h
>index d3ff48a2fbe0..533d8e75f7bb 100644
>--- a/include/net/af_vsock.h
>+++ b/include/net/af_vsock.h
>@@ -276,10 +276,19 @@ static inline bool vsock_net_mode_global(struct vsock_sock *vsk)
> 	return vsock_net_mode(sock_net(sk_vsock(vsk))) == VSOCK_NET_MODE_GLOBAL;
> }
>
>-static inline void vsock_net_set_child_mode(struct net *net,
>+static inline bool vsock_net_set_child_mode(struct net *net,
> 					    enum vsock_net_mode mode)
> {
>-	WRITE_ONCE(net->vsock.child_ns_mode, mode);
>+	int new_locked = mode + 1;
>+	int old_locked = 0; /* unlocked */
>+
>+	if (try_cmpxchg(&net->vsock.child_ns_mode_locked,
>+			&old_locked, new_locked)) {
>+		WRITE_ONCE(net->vsock.child_ns_mode, mode);
>+		return true;
>+	}
>+
>+	return old_locked == new_locked;
> }
>
> static inline enum vsock_net_mode vsock_net_child_mode(struct net *net)
>diff --git a/include/net/netns/vsock.h b/include/net/netns/vsock.h
>index b34d69a22fa8..dc8cbe45f406 100644
>--- a/include/net/netns/vsock.h
>+++ b/include/net/netns/vsock.h
>@@ -17,5 +17,8 @@ struct netns_vsock {
>
> 	enum vsock_net_mode mode;
> 	enum vsock_net_mode child_ns_mode;
>+
>+	/* 0 = unlocked, 1 = locked to global, 2 = locked to local */
>+	int child_ns_mode_locked;
> };
> #endif /* __NET_NET_NAMESPACE_VSOCK_H */
>diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
>index 9880756d9eff..50044a838c89 100644
>--- a/net/vmw_vsock/af_vsock.c
>+++ b/net/vmw_vsock/af_vsock.c
>@@ -90,16 +90,20 @@
>  *
>  *   - /proc/sys/net/vsock/ns_mode (read-only) reports the current namespace's
>  *     mode, which is set at namespace creation and immutable thereafter.
>- *   - /proc/sys/net/vsock/child_ns_mode (writable) controls what mode future
>+ *   - /proc/sys/net/vsock/child_ns_mode (write-once) controls what mode future
>  *     child namespaces will inherit when created. The initial value matches
>  *     the namespace's own ns_mode.
>  *
>  *   Changing child_ns_mode only affects newly created namespaces, not the
>  *   current namespace or existing children. A "local" namespace cannot set
>- *   child_ns_mode to "global". At namespace creation, ns_mode is inherited
>- *   from the parent's child_ns_mode.
>+ *   child_ns_mode to "global". child_ns_mode is write-once, so that it may be
>+ *   configured and locked down by a namespace manager. Writing a different
>+ *   value after the first write returns -EBUSY. At namespace creation, ns_mode
>+ *   is inherited from the parent's child_ns_mode.
>  *
>- *   The init_net mode is "global" and cannot be modified.
>+ *   The init_net mode is "global" and cannot be modified. The init_net
>+ *   child_ns_mode is also write-once, so an init process (e.g. systemd) can
>+ *   set it to "local" to ensure all new namespaces inherit local mode.
>  *
>  *   The modes affect the allocation and accessibility of CIDs as follows:
>  *
>@@ -2853,7 +2857,8 @@ static int vsock_net_child_mode_string(const struct ctl_table *table, int write,
> 		    new_mode == VSOCK_NET_MODE_GLOBAL)
> 			return -EPERM;
>
>-		vsock_net_set_child_mode(net, new_mode);
>+		if (!vsock_net_set_child_mode(net, new_mode))
>+			return -EBUSY;
> 	}
>
> 	return 0;
>
>-- 
>2.47.3
>

