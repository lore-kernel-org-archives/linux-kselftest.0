Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9213A839B
	for <linux-kselftest@vger.kernel.org>; Fri,  4 Sep 2026 08:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788512130; cv=none; b=U+kY2X3LIVvyXRV4ri8B6jv0E+gPxYS4Syx4qgqf4WxgFSzgnM0RtPofqECK9EkAchFe7rBoSVTniSOomfdMV5KsEs8Wf7hOfWbVbE4cylQMoJzC1/dGoUwaxEjnHIUJ2O4u9ditI2Y5PHh+yorhcaKV+27c6BoqzTJt/IRJdxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788512130; c=relaxed/simple;
	bh=4IIv9yG4m7qxm3IqrT9DQAomNx8kM3TWRYVx0cDnJRE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rMkuxpbktH/Z2GHby1hPvHOOMmwO0ZPmH8wkyfRCNa1w04SnbAUTnR/OGrTn0S9u9cOyy10KgB6MbcPvJCn9qgGyzrPoQSJoPTAsGyrUHs0hw37TqqnPHmgb/jdfnpixELu7hOabXLWRgsH0M5RtbfGaEa5b6hUI0BAFB/iH66Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LD88kmsY; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=GHSRva5s; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LD88kmsY";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="GHSRva5s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788512127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JKkhm4P3owmRu88ixnc//OXNGkRZebTXD50nAJpfW/8=;
	b=LD88kmsYbCnbK9xEC8DoWeKi4Hd/N547tbI1yVQDjqMcQTgkyBVioWs+KRNcDqBK6zyM49
	BkvBVjeC3aU/KzH8dj/HNC8kA72VAwKtfElezDzFroFxA//75hP+XAMRCZ/6ICPc/BEZwo
	tftBY4YPQ9zKfw5GbVahcNkPDcFuHT8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-39-jyBidgycMrCMF-Yngfr99Q-1; Fri, 04 Sep 2026 04:55:25 -0400
X-MC-Unique: jyBidgycMrCMF-Yngfr99Q-1
X-Mimecast-MFC-AGG-ID: jyBidgycMrCMF-Yngfr99Q_1788512125
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-490a767c7dcso5642075e9.2
        for <linux-kselftest@vger.kernel.org>; Fri, 04 Sep 2026 01:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788512125; x=1789116925; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JKkhm4P3owmRu88ixnc//OXNGkRZebTXD50nAJpfW/8=;
        b=GHSRva5sMEryUDA+/igHn9JZyq/Ve7JP5ZnPCnu6cuz3I8o5mit2MG5KusK5KcWkBp
         Ap1txZYb9A+KXqzb4u+2ZHiD9EF7Pl0lven+DH3EM6dS24QbUJcRp1wzA/fUHPQdK100
         6Rx569cSI21p2Z/19KergekHvDRPygtC3FUSyasvQrnPEELV4tJrx3BDLI28CZ9hCL2h
         MbJVibU+45X5b0J6D3SepvT4Q5u9xeop7m7QGO1N5xETnikFp/xHTfeTAliqDNTUaDr9
         oVFWs9/mDdKP7v6WX0SObfBCHD1DQWFU2pl0x3cl/lMsHbnxLR5JZ0APMOv8y+eR41IH
         WbBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788512125; x=1789116925;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JKkhm4P3owmRu88ixnc//OXNGkRZebTXD50nAJpfW/8=;
        b=IX+j1K214mIZPQf4Y9x8i+aVI3WOF//GpHnpstzwFhVCl8TMBB4FFXtitvXY2xiX1g
         IkJ1sDZW38gjqjQZ03apG6Dz+P/xkWrG/CHIBVk8Cn37sQZpr4qXrbDXPYSQ2Q+O+vTm
         BRVx7YHSXaaqa1RhXKKW/d0GQ/JeCW0xai+fxp0/jM6GTGto66tM7QLfl0lUlL5Nimr1
         OvsQhSBDOXWofYnUrbS5G0ULComchfhUrSX22HhGrX8HtrtHnwFSlBcajpO29NibfOk3
         8di/IGqOoXp6UcwrDujKvJLCTcMmWs6Vgtn+XlW8zp7q4UJYrcE3gOSKbtqg52l0osSW
         sR9g==
X-Forwarded-Encrypted: i=1; AKwUvBwD6+gaz03rZk/jWsmd/VJYAuPqXEHwu6VLQ8Zx8F1k7RnnIfAgef42v5UIlPXNhSrqXp0odQU+gW5Kstw8Sx8=@vger.kernel.org
X-Gm-Message-State: AFuF++n1EVCL5MQThkEfNAYz5vJRq1VHNrRR7E2t9cCmHi+KntzSZs3q
	yNknIsaBctCDOfEbnM9F/muQ5zLF904iiptTGLX8ckG5yeg5cIy/RKOrS3My4D1EDU7SMzkyDoT
	ZxxoWNNfWWWyairyc7QPkQJ+ARQrDJmam68sFf//weTTsgyA4h3IYmuJvxAIbDjQsr7I8fQ==
X-Gm-Gg: AYBFou1ylR3lh7VjNZec9LRlpJ/btWO1nLEijDyP8vp22v8kzp9KD3Teib/gY7ZVH8F
	+GCDcRriA/yjAtCnM+PwhWYiW1bERPDE/CZKu4dsNZroyMp7Ys1e4DEtDMOua2xTir21H/kt7lD
	7CDPRLHMdn/FZkMU4yUet1HP6peeE1LapKnk2GalNcOjcdVLnCrvcqYUT8DsfMzE8og0eVh35Co
	xP0A61iyyZlKHNE3GZ0ffcUR5k3C8Za/qaARZUyEZdpXy460Y1NU8+uEfq95l3h25Ow81yZLfHF
	BWm56aDg2PKkRZHcp60ummEjLbgkTlnGCxBDMmMshMu8qR+O14THKH6e46EhIRGjH7YrdVMobvx
	MZyqG3TkslWQ1VKEi7N4riq516DVgFNNz/IGTKF9WfwQoMQ==
X-Received: by 2002:a05:600c:1c29:b0:49c:fc6c:be03 with SMTP id 5b1f17b1804b1-49cfc6cc06cmr18966775e9.26.1788512124613;
        Fri, 04 Sep 2026 01:55:24 -0700 (PDT)
X-Received: by 2002:a05:600c:1c29:b0:49c:fc6c:be03 with SMTP id 5b1f17b1804b1-49cfc6cc06cmr18966125e9.26.1788512123997;
        Fri, 04 Sep 2026 01:55:23 -0700 (PDT)
Received: from sgarzare-redhat (host-79-53-30-11.retail.telecomitalia.it. [79.53.30.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce46696e8sm128248985e9.0.2026.09.04.01.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:55:23 -0700 (PDT)
Date: Fri, 4 Sep 2026 10:55:17 +0200
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
Subject: Re: [PATCH net-next 0/6] vsock: assign the guest vsock device to a
 network namespace
Message-ID: <apqGcFDFm9_Wtw4q@sgarzare-redhat>
References: <20260902-vsock-guest-ns-v1-0-9995383e9a8b@meta.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260902-vsock-guest-ns-v1-0-9995383e9a8b@meta.com>

On Wed, Sep 02, 2026 at 04:00:46PM -0700, Bobby Eshleman wrote:
>vsock network namespaces let a host put each VM in a namespace of its
>own. A guest has no equivalent yet. It has a single G2H device that
>cannot be assigned to a network namespace.

Thanks for this, I'll do a proper review next week, in the mean time 
some comments below:

>
>This series lets a guest move that device into a network namespace. A
>new ioctl on /dev/vsock, IOCTL_VM_SOCKETS_ASSIGN_G2H_NETNS, assigns the
>device to the namespace of the calling process. The namespace's existing

Why an ioctl?

I'm asking because I'd like to know if you've already considered any 
alternatives (sysfs, netlink, etc.)

How do you think the ioctl should be used? Should we provide an 
userspace tool, or extending some existing tools?

Thanks,
Stefano

>ns_mode then decides who may use it: a "global" namespace shares the
>device with every other global namespace, and a "local" namespace keeps
>the host connection to itself. The device starts out in the initial
>namespace, so until the ioctl is issued nothing has moved and no mode
>has changed. There is no explicit unassign as assigning the device back
>to the initial namespace is equivalent.
>
>The ioctl requires CAP_NET_ADMIN in the initial user namespace.
>
>Connections that can no longer reach the device after a move are reset,
>so that a namespace which has lost access cannot keep using a socket it
>opened while it still had access. Following netdevs, the device returns
>to the initial namespace when the namespace it was moved to is deleted.
>
>Transports opt in through a new netns_assign_allow callback. Only
>virtio-vsock implements it here.

Why? (Not asking to support all the others, asking to explain the reason 
or ask helps from others to extend it)

Thanks,
Stefano

>
>Patch 1 is just a const cleanup that patch 2 needs. The remaining
>patches are actual implementation and tests.
>
>Based off of Stefano's original series:
>https://lore.kernel.org/all/20200116172428.311437-1-sgarzare@redhat.com/
>
>Suggested-by: Stefano Garzarella <sgarzare@redhat.com>
>Link: https://lore.kernel.org/all/20200427142518.uwssa6dtasrp3bfc@steredhat/
>
>Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
>---
>Bobby Eshleman (6):
>      vsock: constify the transport in vsock_for_each_connected_socket()
>      vsock: add IOCTL_VM_SOCKETS_ASSIGN_G2H_NETNS
>      vsock/virtio: support guest device network namespace
>      selftests/vsock: add a helper to assign the g2h device to a netns
>      selftests/vsock: test the guest vsock device network namespace
>      selftests/vsock: test the assign ioctl privilege checks
>
> Documentation/admin-guide/sysctl/net.rst           |  18 +
> include/linux/virtio_vsock.h                       |   2 +
> include/net/af_vsock.h                             |   9 +-
> include/uapi/linux/vm_sockets.h                    |   6 +
> net/vmw_vsock/af_vsock.c                           | 200 ++++++++-
> net/vmw_vsock/virtio_transport.c                   |  28 +-
> net/vmw_vsock/virtio_transport_common.c            |  28 +-
> tools/testing/selftests/vsock/.gitignore           |   1 +
> tools/testing/selftests/vsock/Makefile             |   3 +-
> tools/testing/selftests/vsock/config               |   1 +
> tools/testing/selftests/vsock/vmtest.sh            | 461 ++++++++++++++++++++-
> .../selftests/vsock/vsock_assign_g2h_netns.c       |  45 ++
> 12 files changed, 774 insertions(+), 28 deletions(-)
>---
>base-commit: d0ec95a8a4e79f2fd6063fc8932415db8c227689
>change-id: 20260831-vsock-guest-ns-d06af451da67
>
>Best regards,
>-- 
>Bobby Eshleman <bobbyeshleman@meta.com>
>

