Received: from mail-pj2-f7.google.com (mail-pj2-f7.google.com [74.125.227.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136434B403F
	for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 16:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791824283; cv=none; b=Ph3zzssYy0Ta872Hh3KgdEKZmwIYdWhiDI1rOF6O3IU/uGYHdq9B2V2yMsYxZMEXZLG8hbYiwCJykU/TIco/yCN8eHvTUjIbevekDhH/18qbmk57mqiYdn1kDLtZ9y111S53OMdOQNny3OOtkTLvQ+sqs4BGx+yN/IsPzEHVYfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791824283; c=relaxed/simple;
	bh=jCrJHhg9LmoI7hpxLeknAoCWjFflwD4GcffxqEOx+x8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g4/ddKGLB6AwdQWIdfdtt9tLe+/Kggu7B9pWEgnRK4hq0E9gitmi1xsMJ2dGr4n02GWz0sCBsJGUufpcZjVjB5z9oXFQ37rEMgmp8eHrnnUWy0bP6Lf9J7UVcJMcRefR54fDQ6NQ+cYYdsUf7wisuyJ+qcNcFmtK1KegJKKyZHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n7nzLGjr; arc=none smtp.client-ip=74.125.227.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n7nzLGjr"
Received: by mail-pj2-f7.google.com with SMTP id d9443c01a7336-2d561173f9fso15171185ad.0
        for <linux-kselftest@vger.kernel.org>; Mon, 12 Oct 2026 09:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791824276; x=1792429076; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lk3jyk+L25op/gK9ZsPi7IfvbejvW+IuaDGcTZaRnIE=;
        b=n7nzLGjr0vi3iGJrn3PYjtRXP1XDVcaHTCsmZ78sppuyb0NJxCIh6daMJ07t8bPUSc
         wVTr1p6r19yo6LrzbFaiMu5uP+P11/zoW7ldVBNCzspn0Yy4rrVWuS6qg95JnUBxDA6u
         bQUiTt/BiOAKLzChwveHcWtvMox8QCJ23WUApozwGSMrZoC72VwAU/QQVCt4t1luncho
         Ku8y2mNq0ZQyzZVZZOAXIAsaPq7HGXVzLhanZU5HdBNPQ3WNv69WjAfobctAWRTJrJjk
         0UdL5RhO706ecw8NBJ40noo48dCZFL8PdgMN7Q0JUjmsWXfwd9vuLhnBcIDlitYFD9CS
         LZ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791824276; x=1792429076;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lk3jyk+L25op/gK9ZsPi7IfvbejvW+IuaDGcTZaRnIE=;
        b=fwZ4v8RtMhu6hTqTOH8pf3eeBRSl4A2uLT6z054mAF2wxcvnyJL85+WbPM3A0Q/o8g
         3yjLE050YyJ4WPEJ+LKFqxsmRItUYjjeL9EZ3j8BKuhPscqHmGbh9mXlSMH2TkIU5fEa
         x+nz0SqKnbtqacboA+S0uXtq3PMDeu9128RrqRtdv0/nGl7vVfqjDCflChS+xbn5nqkd
         KN6sut0RrdEBuZUT03uYW/fPlwHNVdq9V2TYGl5Qu+Fyh3ZgNSVuI2q0M4NOyV5fkUzr
         Y2ZBBqBjAvPit6aKP6ySmv8xX7ppN1DLRmVjaAIkwUuHOtJRcJQKIJJlTAvp1c2fyDZI
         gNcw==
X-Forwarded-Encrypted: i=1; AKwUvBwK2VbqV0YFPoji0/G4qjuyzG2/Pt1C0eqspQ+fKk+pBk1KADaSO98mIhDLtMsOvMfmWAl/mdEVbS5mgRyUnfo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIUhcC96erZ+wrAe/w5/9LfPEk4yenZi034yjvBF5CbQaz6wIOE
	soC4/FeiqKOvSJdS6Oku8sy2ncBN8MvBhxL9iJSH+ovL6/crR8mY7MLU
X-Gm-Gg: AYBFou1djg6640AJRD49oz5p02SjiWu9/kN6UpRYQQu3ycMHE9vN5/fPQpNmg0Dk6dD
	0WeKugcsgFsYMLSYeSHnoDUmpjcegVamCAQDuyObC11U+Zb1SJp8qAA8CtnRCC7iSmlRWXI1QE5
	sSFmuflz1qCqU2Scq6gPxFjJjOAomDS3BU1iMvJP2nYt4prwAVMTR+81m5+OJTCN/My6dDxdhuq
	/90MEa5R8jCNR9yd/VIyrvtrhFF+UPExlEBmR+ppoxt7ia1Woi/0nSX/TzgdGZ7ogxrb/d6JVxS
	hpr60Up5wxP7blNLvIK75zkvQh38nMLU3BwJ+WGSwvI2PnmWxA4/rfaka9cIQJ8ru+2DUSHA5V+
	tYA5xPyz34MmBWclesKFjGulAVr51dJpYJPrZMIg9Bl1ximbLBWyO0kZgUKtkN+4ZqG+mEPJoe/
	v7tKCdpV9Wz3okIOvYTQ7qM0Il8k1VThfSMoxsAUbyLsFgR0t3XgcJ5H/bcufhLo1a
X-Received: by 2002:a17:903:1b6d:b0:2db:39da:90f2 with SMTP id d9443c01a7336-2e84280aed6mr90426765ad.8.1791824276254;
        Mon, 12 Oct 2026 09:57:56 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:5e::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8dd5sm46996085ad.55.2026.10.12.09.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 09:57:55 -0700 (PDT)
Date: Mon, 12 Oct 2026 09:57:50 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Mina Almasry <almasrymina@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>, David Wei <dw@davidwei.uk>, 
	Pavel Begunkov <asml.silence@gmail.com>, Taehee Yoo <ap420073@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Paolo Abeni <pabeni@redhat.com>, 
	Kaiyuan Zhang <kaiyuanz@google.com>, Bobby Eshleman <bobbyeshleman@meta.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Daniel Borkmann <daniel@iogearbox.net>, Nikolay Aleksandrov <razor@blackwall.org>, 
	Tariq Toukan <tariqt@nvidia.com>, Kaifeng Wang <kaifengw@google.com>
Subject: Re: [PATCH net v1 2/4] net: devmem: detach TX bindings on
 NETDEV_UNREGISTER
Message-ID: <as0LL7IcZas6IPY2@devvm7509.cco0.facebook.com>
References: <20261010025532.839559-1-almasrymina@google.com>
 <20261010025532.839559-3-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261010025532.839559-3-almasrymina@google.com>

On 10/10, Mina Almasry wrote:
> TX devmem bindings (NETDEV_CMD_BIND_TX) have no bound RX queues, so
> mp_dmabuf_devmem_uninstall() never runs when binding->dev or
> binding->vdev unregisters. As a result, binding->dev and binding->vdev
> dangle pointing to freed struct net_device memory, and the dma_buf
> remains attached and mapped after device removal.
> 
> Closing the netlink socket after netdev unregistration dereferences the
> freed struct net_device in netdev_nl_sock_priv_destroy():
> 
>   BUG: unable to handle page fault for address: ffff88824ca9b000
>   Oops: Oops: 0000 [#1] SMP KASAN NOPTI
>   RIP: 0010:netdev_nl_sock_priv_destroy+0xbd/0x1e0
>   Call Trace:
>    genl_release+0xf5/0x190
>    netlink_release+0xd01/0x18d0
>    __sock_release+0xb0/0x270
>    sock_close+0x18/0x20
> 
> Add net_devmem_dev_unregister() called on NETDEV_UNREGISTER:
> - When binding->dev (the physical DMA-capable device) unregisters,
>   erase the binding ID, clear both binding->dev and binding->vdev, wait
>   for in-flight RCU/TX readers via synchronize_net(), and unmap the
>   dma_buf under binding->lock.
> - When only binding->vdev (virtual device) unregisters while
>   binding->dev lives, only clear binding->vdev so no new TX sends match
>   the virtual device while allowing in-flight TX packets on binding->dev
>   to finish DMA safely.
> 
> Fixes: bd61848900bf ("net: devmem: Implement TX path")
> Fixes: 1abe839b34ae ("net: devmem: support TX over NETMEM_TX_NO_DMA devices")
> Cc: Kaiyuan Zhang <kaiyuanz@google.com>
> Cc: Stanislav Fomichev <sdf@fomichev.me>
> Cc: Bobby Eshleman <bobbyeshleman@meta.com>
> Cc: Tariq Toukan <tariqt@nvidia.com>
> Cc: Kaifeng Wang <kaifengw@google.com>
> Signed-off-by: Mina Almasry <almasrymina@google.com>
> ---
>  net/core/devmem.c      | 45 ++++++++++++++++++++++++++++++++++++++++++
>  net/core/devmem.h      |  5 +++++
>  net/core/netdev-genl.c |  1 +
>  3 files changed, 51 insertions(+)
> 
> diff --git a/net/core/devmem.c b/net/core/devmem.c
> index 5e4070b82df44..da7b3e8abaa13 100644
> --- a/net/core/devmem.c
> +++ b/net/core/devmem.c
> @@ -169,6 +169,51 @@ void net_devmem_unbind_dmabuf(struct net_devmem_dmabuf_binding *binding)
>  	percpu_ref_kill(&binding->ref);
>  }
>  
> +void net_devmem_dev_unregister(struct net_device *dev)
> +{
> +	struct net_devmem_dmabuf_binding *binding;
> +	unsigned long xa_idx;
> +

[..]

> +	rcu_read_lock();
> +	xa_for_each(&net_devmem_dmabuf_bindings, xa_idx, binding) {
> +		if (!percpu_ref_tryget(&binding->ref))
> +			continue;
> +		rcu_read_unlock();

You use net_devmem_dmabuf_binding_put below but do not use
net_devmem_dmabuf_binding_get here.

Also, I feel like rcu_read_lock/rcu_read_unlock dance is confusing. bindings
are not following rcu lifetimes. Can we race with __net_devmem_dmabuf_binding_free
here? (xa_for_each returns a valid binding, then before we do try_get it
gets kfree'd)
