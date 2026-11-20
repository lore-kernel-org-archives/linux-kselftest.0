Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795157484;
	b=oNS1TFAA33tDzcbjlOTZVP/mYSbqvkRXmZllUp3uJ0v/stR9bCsCN66M4ElUl6QVz8o8
	 2hcYLnetZ9Yk24wC7LRpf4ectGOd5wWaMir1oPl5xLGdxAk3WPMVvBUub6kJlvLAGsAal
	 0/lBPAOGBRMXKXPDQPvcFVhD3hRdqBBP5IDADeS2jNMIGcqEd5criNmi6bj9jsinrhb8n
	 X0eV/UU4psHahAxcfcU1QYzvo7Omk89FlN20xqTwI1kNqAoW3nCzOjUCGDjHzSaiFbgGP
	 8FnvKXMdW81xkxrB7Af5W0hS1d8tGS0aYNrEBVaZ2w6BIovGyJe/Rf4VkfEFZKSP51w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795157484;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=gS7xDRLG+cEqZ7xpUktoOrALv5wJ/YwgxA6f594Sw9I=;
	b=QAeqLs7sk6aNwlI/fgqRoYISTZ7ebqE5ZW8JbRjEvm9YTQpac0l05w7aQfqXGl/vOZOI
	 dp21OtBc+QB9mBjASjujJMU/kVb5XEScS4e/YdM02rSP1SU0qj9xNQ0Mn0cWvKc7v68IN
	 VOAL/jeBIbjgvaMXT5g895ss9KqUs66h1jsNUN7P+i+8K65192JQjOPHjHLFvk8Z52w+q
	 rY5xlLLzZL2KtboyxExs+DJrfa4Jvixv1iHETxPj5pPN4/VxcAacu2H7LGknAkr4NVuwV
	 71HtDgevDSj9m9hPT5zMGWbf6hMUQ6VNI5r7lX1qkMYQbhJEH4FDv8aPnD5OxNV+eqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b1WZWdto;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225B2606A325;
	Fri, 20 Nov 2026 06:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b1WZWdto
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B6031F000C4;
	Fri, 20 Nov 2026 06:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795157483;
	bh=gS7xDRLG+cEqZ7xpUktoOrALv5wJ/YwgxA6f594Sw9I=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=b1WZWdto4zy/TyUUlzLT5GHq3aICSa7Gu/QVWUwct4iOlJAEhQq/GfLz/+OhvzcqA
	 JTSl5JkkoIEY1j3zWrPYxrrzOwOO4jr9FL1CE3ba26jPeZ3txxZnnmGpUTUYM2ph0A
	 D1QSsF57PQcZv632haMQJ+qvNDTB34oJ16rqACPJUizgoBk1Qt1XoGL4lFppMZibJD
	 v9EZ6TIeM2ItuYzb0KZfmfdfAOrpMv6nHE1bl8Q56auuW79ImyWqHJaYniKWH1vm5b
	 e94zFLhBW+yp9YqQkxOVJcjz2uT4eSv8mN4Pi4gEB8mYJaPhZOBBiVJk1bL4tGtfP+
	 668QtSr3b9OzQ==
Subject:
 Re: [PATCH net-next v3 1/2] netdevsim: add TLS device offload emulation
From: netdev-bot+sashiko@kernel.org
To: jiayuan.chen@linux.dev
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 john.fastabend@gmail.com, sd@queasysnail.net, shuah@kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Fri, 20 Nov 2026 06:51:22 +0000
Message-ID: <179515748266.3136.5201206680474625164@kernel.org>
In-Reply-To: <20261119064902.242502-2-jiayuan.chen@linux.dev>
References: <20261119064902.242502-2-jiayuan.chen@linux.dev>
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

- [Low] The new NETDEVSIM dependency `depends on TLS || TLS=n` in
  drivers/net/Kconfig is broader than the link requirement.
- [Low] The new TLS byte counters in drivers/net/netdevsim/tls.c add
  skb->len, which is the whole L2 frame including Ethernet/IP/TCP…
- [Low] nsim_do_tls() comments "Leave what nsim_do_psp() has handled
  alone", but the check it uses is the generic skb->encapsulation bit.
- [Low] nsim_tls_tx() (drivers/net/netdevsim/tls.c) checks again at
  ndo_start_xmit time whether an skb is one of its own plaintext…

--

netdevsim: add TLS device offload emulation

This patch implements tlsdev_ops in netdevsim and advertises
NETIF_F_HW_TLS_TX/RX, so kTLS sockets over netdevsim take the device
offload path. No crypto is done: TX puts plaintext records on the wire
with the tag placeholder zeroed, and RX offload is emulated by matching
the tuple installed at tls_dev_add() time. A Kconfig dependency on TLS is
added because the new code calls tls_get_record().

> diff --git a/drivers/net/Kconfig b/drivers/net/Kconfig
> index ff79c466712df..cb4d4bb87afc2 100644
> --- a/drivers/net/Kconfig
> +++ b/drivers/net/Kconfig
> @@ -607,6 +607,7 @@ config NETDEVSIM
>  	depends on INET
>  	depends on PSAMPLE || PSAMPLE=n
>  	depends on PTP_1588_CLOCK_MOCK || PTP_1588_CLOCK_MOCK=n
> +	depends on TLS || TLS=n

[Severity: Low]
Is this dependency broader than needed? tls.o is only built when
CONFIG_TLS_DEVICE is set (see the Makefile hunk below). With TLS_DEVICE=n,
netdevsim.h supplies empty inline stubs for nsim_tls_init(),
nsim_tls_teardown() and nsim_do_tls(), so nothing in netdevsim links
against the tls module.

With TLS=m and TLS_DEVICE=n, NETDEVSIM is still capped at m. An existing
NETDEVSIM=y config would then be silently demoted to m.

The commit message says:

  "NETDEVSIM can't be built in with TLS as a module since it calls
  tls_get_record()."

That only holds when TLS_DEVICE=y. TLS_DEVICE is a bool that depends on
TLS, so would something like this express the actual requirement?

	depends on TLS || !TLS_DEVICE

>  	select NET_DEVLINK
>  	select PAGE_POOL
>  	select NET_SHAPER
> diff --git a/drivers/net/netdevsim/Makefile b/drivers/net/netdevsim/Makefile
> index 87718204fb4de..c7f7621323b2b 100644
> --- a/drivers/net/netdevsim/Makefile
> +++ b/drivers/net/netdevsim/Makefile
> @@ -25,3 +25,7 @@ endif
>  ifneq ($(CONFIG_MACSEC),)
>  netdevsim-objs += macsec.o
>  endif
> +
> +ifneq ($(CONFIG_TLS_DEVICE),)
> +netdevsim-objs += tls.o
> +endif

[ ... ]

> diff --git a/drivers/net/netdevsim/tls.c b/drivers/net/netdevsim/tls.c
> new file mode 100644
> index 0000000000000..16c5508245d3a
> --- /dev/null
> +++ b/drivers/net/netdevsim/tls.c
> @@ -0,0 +1,453 @@

[ ... ]

> +static bool nsim_tls_tx(struct netdevsim *ns, struct sk_buff *skb)
> +{
> +	/* Not ours: the software fallback has already encrypted it.  Clear
> +	 * the decrypted mark the sending stack left so the peer's stack
> +	 * decrypts it.
> +	 */
> +	if (!skb->decrypted || !tls_is_skb_tx_device_offloaded(skb) ||
> +	    rcu_dereference_bh(tls_get_ctx(skb->sk)->netdev) != ns->netdev) {
> +		skb->decrypted = 0;
> +		return false;
> +	}

[Severity: Low]
Can this re-check race with tls_device_down()? The core has already
classified this skb as a device-offloaded plaintext record in
validate_xmit_skb()->tls_validate_xmit_skb(). But tls_device_down()
flips both fields read here before it waits for in-flight transmits:

net/tls/tls_device.c:tls_device_down() {
    ...
		WRITE_ONCE(ctx->sk->sk_validate_xmit_skb, tls_validate_xmit_skb_sw);
    ...
		rcu_assign_pointer(ctx->netdev, NULL);
    ...
		synchronize_net();
    ...
}

Suppose a record that tls_validate_xmit_skb() already passed reaches
nsim_tls_tx() after the flip. It would take the "not ours" branch, which
clears skb->decrypted and skips nsim_tls_tx_zero_tags().

The peer would then get plaintext marked as not decrypted, carrying the
stale tag placeholder bytes. A peer socket with RX offloaded would fall
back to software decrypt and fail the connection with -EBADMSG, rather
than carrying on with the software fallback as tls_device_down() intends.

With netdevsim's default qdisc, dev_deactivate_many() calls
synchronize_net() before NETDEV_DOWN, and that closes the window. With a
noqueue root qdisc, sync_needed stays false:

net/sched/sch_generic.c:dev_deactivate_many() {
    ...
	/* Wait for outstanding qdisc enqueuing calls. */
	if (sync_needed)
		synchronize_net();
    ...
}

So a qdisc-less __dev_queue_xmit() that has already passed
validate_xmit_skb() could still be running when tls_device_down() flips
the state.

Real drivers such as mlx5 have the same window by core design. The
tls_device_down() comment says unencrypted packets may be in flight until
synchronize_net(). With real crypto, though, the connection would not be
lost here.

> +
> +	nsim_tls_tx_zero_tags(skb);
> +	atomic64_inc(&ns->tls.tx_packets);
> +	atomic64_add(skb->len, &ns->tls.tx_bytes);

[Severity: Low]
Should tx_bytes count TLS payload bytes rather than skb->len? skb->len
here is the whole frame, including the Ethernet, IP and TCP headers.
netdevsim also advertises NETIF_F_TSO, so tx_packets counts TSO
super-skbs rather than wire packets. The same applies to rx_packets and
rx_bytes in nsim_tls_rx().

Documentation/networking/tls-offload.rst defines tx_tls_encrypted_bytes
and rx_tls_decrypted_bytes as "number of TLS payload bytes". The PSP
emulation in the same driver counts payload only:

drivers/net/netdevsim/psp.c:nsim_do_psp() {
    ...
	psp_len = skb->len - skb_inner_transport_offset(skb);
	atomic64_inc(&ns->psp.tx_packets);
	atomic64_add(psp_len, &ns->psp.tx_bytes);
    ...
}

These counters are only exposed through the debugfs "tls" file, and
nothing in the tree reads them yet.

> +
> +	return true;
> +}

[ ... ]

> +void nsim_do_tls(struct sk_buff *skb, struct netdevsim *ns,
> +		 struct netdevsim *peer_ns)
> +{
> +	/* Leave what nsim_do_psp() has handled alone. */
> +	if (skb->encapsulation)
> +		return;

[Severity: Low]
The comment mentions nsim_do_psp(), but skb->encapsulation is a generic
bit. psp_dev_encapsulate() sets it, and so do tunnel drivers that use
iptunnel_handle_offloads() (VXLAN, GENEVE, GRE). Doesn't that mean any
encapsulated skb also skips the "not ours" path in nsim_tls_tx() that
clears skb->decrypted?

This matters for software fallback output. complete_skb() in
net/tls/tls_device_fallback.c builds the ciphertext skb with
skb_copy_header(), so it still carries decrypted=1.

Consider a socket offloaded on netdevsim whose route later moves to a
tunnel on top of netdevsim:

- the tunnel device runs the software fallback;
- at netdevsim, tls_validate_xmit_skb() passes the skb because
  dev == ctx->netdev;
- nsim_do_tls() returns early here;
- the peer receives decapsulated ciphertext still marked decrypted.

A peer whose RX context is also offloaded on netdevsim would accept that
ciphertext as plaintext. A peer with software RX ignores the bit and
decrypts correctly.

The setup is contrived, but should this check be limited to PSP-handled
skbs, or should the comment say that all encapsulated traffic is skipped?

> +
> +	if (!nsim_tls_tx(ns, skb))
> +		return;
> +
> +	nsim_tls_rx(peer_ns, skb);
> +}

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119064902.242502-1-jiayuan.chen%40linux.dev
