Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795409970;
	b=yd8+H+n5MBEIXrBzyqPNYXl8KMprVLb07nXOsC1HhFA7jV0NzH8gtdAn91lb/MQsBKbt
	 sBXrb5WbYCIXyQCkaXE9AMbfMSfVylrjcqZARrHx0tiDYA+y8EPXDrFqjkI46YaH1LPjq
	 mhOnivoh6irzfDWMSoSYsLAjHxpRJtndyxHzcNXaGKAcVeKCfMJ3wNXvubBEaApOaTZq6
	 WQEuu8CyB4x+RLsFVaP0JsCOKj/+QRUZAvGux/r2a9fv4sIRPCZ5OfZ7i9K9o9MdzpVrf
	 PWue2Y+tqEx8tWMHf79BOLV/pwtBnXFciDRuJydY/4fdRQ4raqQmYRGXqankWLHlC9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795409970;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=1U2qKwXOycH72CjwahmU01vcSa577mKU1ZxaRp8GTkc=;
	b=4XHZzQRX7WYMJNGbSYmo8jWKQP3PbDFX/3oYq3nWZUbRZ1LqZsanYf2ZisyiYzsY+R7N
	 MMfqCier8Mgskjn43yLAZlv6zLb0phuYex4UQ4yCpj5zfKn/I8+rubwl9DaKA8+IDhdh4
	 Zk8mEA+1Us7lUJcKsJgwsYMzt5Shu39x88IogM7s5S5hbesxcEbJmB22D+19j7KURmrnW
	 zJTaw4CvnYR3UdHXl8JWExcbL4wMVvsWfv2aX7UJvhWJq/sPadRm1h+r/tZDUElDkBZ52
	 +Q3oQYcI5Kort4SbkjeIZ4Ga9UttH1arHq5/W5YM+QN84dfFd9zWKRgGqdmhJZC3sSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hnIwpHbv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD76606A31E;
	Mon, 23 Nov 2026 04:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hnIwpHbv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B652D1F000EF;
	Mon, 23 Nov 2026 04:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795409969;
	bh=1U2qKwXOycH72CjwahmU01vcSa577mKU1ZxaRp8GTkc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=hnIwpHbvHzpVcwFrad7ro6tQJJ++RxjZrEEvd2QM5duiW6MS0lcbDyA5fIqP4rLdS
	 JEyePJ0BvQe18TcvXDslB+50V6HCvtFsElvuJQJnUv/72tiPiH6VN6J+JW7uIvlQD2
	 Ilga4cIbYkxz22Jhw5XU7yoL+Z3cHXKUfMzx8/oVbf3OOtefwJ1vzWpMlsmYJ2aKXG
	 E61aaM65sSbqAovSqxUeHUkd3yxqteefWv2EQdylMUjLFQQ3cp2q0ZyeYmZ71XjhyG
	 RCcwDp6tZZ1u6h4vKHg3cAXyH628tPsgEJumjY/XBPOPpRm/sGHJ26lWKvb8yOZI8O
	 sBGja96oO3Psg==
Subject: Re: [PATCH net-next v4 6/7] net: devmem: resolve physical map_dev for
 leased RX bindings
From: netdev-bot+sashiko@kernel.org
To: almasrymina@google.com
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, bestswngs@gmail.com, daniel@iogearbox.net,
 razor@blackwall.org, dw@davidwei.uk, sdf.kernel@gmail.com,
 bobbyeshleman@meta.com, dtatulea@nvidia.com
Date: Mon, 23 Nov 2026 04:59:28 +0000
Message-ID: <179540996833.3135.12827693293026536068@kernel.org>
In-Reply-To: <20261120045918.1239746-7-almasrymina@google.com>
References: <20261120045918.1239746-7-almasrymina@google.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The commit message for "net: devmem: resolve physical map_dev for
  leased RX bindings" describes a use-after-free and has no Fixes: tag.

--

net: devmem: resolve physical map_dev for leased RX bindings

This commit makes netdev_nl_get_dma_dev() return the physical backing
netdev when an RX queue is leased. That netdev is used as map_dev for
net_devmem_bind_dmabuf() and is locked around the call. With map_dev now
always the physical DMA device, the commit drops the
!netif_is_queue_leasee(dev) guard in net_devmem_dev_unregister(), so
leased RX bindings get unmapped when the physical netdev unregisters.

> Previously, netdev_nl_bind_rx_doit() passed netdev as both map_dev and
> bind_dev to net_devmem_bind_dmabuf(), so leased RX bindings stored the
> virtual netdev in binding->map_dev without tracking the physical backing
> netdev at all. When the physical backing netdev unregistered while a
> leased RX binding was active, net_devmem_dev_unregister() did not match
> the physical netdev and mp_dmabuf_devmem_uninstall() on the virtual
> queue skipped unmapping because rxq->lease was set, leaving the dmabuf
> attachment mapped against the freed physical dma_dev until
> __net_devmem_dmabuf_binding_free() triggered a use-after-free in
> dma_unmap_sg_attrs().

[ ... ]

> Suggested-by: Stanislav Fomichev <sdf@fomichev.me>
> Signed-off-by: Mina Almasry <almasrymina@google.com>

[Severity: Low]
Should this commit carry Fixes: tags? The use-after-free described above
seems to come from two earlier commits together.

The first is 222b5566a02d ("net: Proxy netdev_queue_get_dma_dev for leased
queues"). It made devmem bind-rx possible on a virtual leasee such as
netkit, but netdev_nl_bind_rx_doit() still passed the virtual netdev as
both map_dev and bind_dev.

The second is c4466d2c3e77 ("net: devmem: unmap dma_buf synchronously on
queue uninstall"). It added the guard in net_devmem_dev_unregister() that
this patch removes:

    if (!netif_is_queue_leasee(dev))
        net_devmem_dmabuf_binding_unmap(binding);

c4466d2c3e77 fixed the non-leased form of the same use-after-free and has
two Fixes: tags. Without a tag here, could stable trees that contain both
commits keep the leased form unfixed? For example:

Fixes: 222b5566a02d ("net: Proxy netdev_queue_get_dma_dev for leased queues")
Fixes: c4466d2c3e77 ("net: devmem: unmap dma_buf synchronously on queue uninstall")

The fix also depends on earlier patches in this series that the commit
message doesn't mention. netif_lease_valid() comes from "net: guard memory
provider RX queue open and close on unregister". bind_dev is only always
populated after "net: devmem: always populate bind_dev and detach both
devices on unregister".

If this commit were backported alone, wouldn't it fail to build or behave
differently? Could the commit message list these dependencies?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120045918.1239746-1-almasrymina%40google.com
