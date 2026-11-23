Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795409966;
	b=py4/BNxVWGn9Je1f7B6TIAePusYjFrhTBkz5QOiJyUCKHk+e6f5xC8rsuqYRzYEBwRQ7
	 zMCCF3PA+HXQcTz8ckNWtrcRCakYdKi4eqwLRDXqW8ysoTEkaIhebgQ6bDFkUFCR/RCFP
	 ERNLpiVIyR5muHxEJ3PHQAj4bK/nmA/swuTK2TCMln8WAqqFFWfvp3QWgSh0H+lHeZdij
	 djuERlnnODtgT1PoUv9hcaCwfUgpEw+ebZPLZ9f3e/v1tc3Bj1xGdvuybF+6caKsr/Xq3
	 mpNfrtzg9u53ZmdIPQTCqIM2LIT6SWZRozCLuo/2aiIVJcjazMOCsuo1BqICQPUf0cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795409966;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=loEiT5lccta+J8+Vkh7t1K+0XOJsgyAVnAcn0ulOpCg=;
	b=fDaDHee8Oa+jRLaBX5WKFU4oE3O7VUKgYRkc1+bzktY36Km4NbDEY6Z6LUc2fNmHAEbS
	 ZBejC5FcGdb7mVDtKx0BCEZF/viaZwBcDZpT9SrBANQG9RivkT3gkkm2OAuGFaGegvJew
	 Eas37aF9dqL0n8PIYQsPYGFStCpi6vjrdc9CTzG/QPJ+tt7igFiSX2JtFY+pxtck21HNK
	 XcT5spYRsob36ieyrb/gU6JfsKt9ZQac9VLOo5NWVk28ujNsGwxGrN5bhntQfGPCzMe1j
	 c6Nu+ZlLxb1Ys+eu6kiMqvjMXEWmdM7gt8DY99fPzRKKrw+XRz8nZ2wvow4FP7pmVAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eug9sXBt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE93606A334;
	Mon, 23 Nov 2026 04:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eug9sXBt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B33F1F000D3;
	Mon, 23 Nov 2026 04:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795409966;
	bh=loEiT5lccta+J8+Vkh7t1K+0XOJsgyAVnAcn0ulOpCg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=eug9sXBtxo//L+SW3CgaH+0nRuPZyRMoq8ghVSpy9YOzV6o8kem5TxumDFK15ldNs
	 SPffZGfRZ1fqEeNMWzRiRGQTyYGgRgfD2ID81KqRB+Id0zZrM6nEox+AF9XxZI04+V
	 MBqyOmlZrQ1I0RF+FcS1h4v/qF+UBJTWvObcDC3W9rVhVrYu2q1zRHl+SxXl/iGu2G
	 sc5q1yCpjLI8widxPM9GCJ8aDpJvTSb7bGewbNj1RgIz5rSbmR8+RUK+SH1p3mHblD
	 y7HGR7FkVSQcGeI9PxJSzeI0qd3OTZBkQqFZXdGezIRkSZ9LCMYT2gS3mtat0Mo7vU
	 YFVKT2HSG6SeQ==
Subject: Re: [PATCH net-next v4 4/7] net: devmem: fold
 net_devmem_lookup_dmabuf() into net_devmem_get_binding()
From: netdev-bot+sashiko@kernel.org
To: almasrymina@google.com
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, bestswngs@gmail.com, daniel@iogearbox.net,
 razor@blackwall.org, dw@davidwei.uk, sdf.kernel@gmail.com,
 bobbyeshleman@meta.com, dtatulea@nvidia.com
Date: Mon, 23 Nov 2026 04:59:24 +0000
Message-ID: <179540996476.3135.17355620050045766012@kernel.org>
In-Reply-To: <20261120045918.1239746-5-almasrymina@google.com>
References: <20261120045918.1239746-5-almasrymina@google.com>
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

- [Low] The commit message presents the fold as closing a gap: with two
  RCU sections, synchronize_net() after clearing NET_DEVMEM_BINDING_LIVE…

--

net: devmem: fold net_devmem_lookup_dmabuf() into net_devmem_get_binding()

This patch folds net_devmem_lookup_dmabuf() into its only caller,
net_devmem_get_binding(). The xarray lookup, binding validation,
dst_dev check and net_devmem_dmabuf_binding_get() now all run inside one
rcu_read_lock() section. Because the reference is taken only after all
checks pass, the error path no longer needs a reference put.

> Because the lookup and device checks are split across two RCU read-side
> critical sections, waiting for synchronize_net() after clearing
> NET_DEVMEM_BINDING_LIVE does not guarantee that in-flight
> net_devmem_get_binding() callers have finished validating the binding
> and returned.

[Severity: Low]

Does anything in the tree at this commit depend on closing that gap yet?

For a TX binding, net_devmem_unbind_dmabuf() only calls list_del() and
percpu_ref_kill() after synchronize_net(). bound_rxqs is empty, and the
map_dev clear only runs for DMA_FROM_DEVICE:

net/core/devmem.c:net_devmem_unbind_dmabuf() {
    ...
	synchronize_net();

	if (binding->list.next)
		list_del(&binding->list);
    ...
	if (binding->direction == DMA_FROM_DEVICE && binding->map_dev &&
	    !busy) {
		net_devmem_dmabuf_binding_unmap(binding);
		WRITE_ONCE(binding->map_dev, NULL);
	}

	percpu_ref_kill(&binding->ref);
}

So this path writes none of the fields net_devmem_get_binding() checks
(tx_vec, net, uid, map_dev, bind_dev).

net_devmem_dev_unregister() does change TX-checked state. It clears
NET_DEVMEM_BINDING_LIVE and bind_dev, unmaps, and then clears map_dev. It
never calls synchronize_net(), though, so it does not use the
single-section guarantee either:

net/core/devmem.c:net_devmem_dev_unregister() {
    ...
			WRITE_ONCE(binding->bind_dev, NULL);
			__xa_clear_mark(&net_devmem_dmabuf_bindings, xa_idx,
					NET_DEVMEM_BINDING_LIVE);
		}

		xa_unlock(&net_devmem_dmabuf_bindings);
		if (!netif_is_queue_leasee(dev))
			net_devmem_dmabuf_binding_unmap(binding);
		xa_lock(&net_devmem_dmabuf_bindings);
		WRITE_ONCE(binding->map_dev, NULL);
    ...
}

Before this patch, net_devmem_lookup_dmabuf() already held a percpu_ref
through the second RCU section. The late checks therefore could not race
with teardown in a way that mattered.

The new guarantee seems to be used first by the later commit "net:
devmem: always populate bind_dev and detach both devices on unregister".
That commit adds synchronize_net() to net_devmem_dev_unregister() before
it clears map_dev.

Could the commit message say this is preparation for that change and has
no functional change by itself? As written, it describes a gap but no
failure, and it has no Fixes: tag. That makes it hard for maintainers and
stable backporters to know whether it is meant as a fix.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120045918.1239746-1-almasrymina%40google.com
