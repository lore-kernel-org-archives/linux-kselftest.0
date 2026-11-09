Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794204019;
	b=XqfG9+kUVHIchcErk7Ucd0gbnyuV96JVeIz0h4fTf3S817rofyuXw1/kazP/JmfoEqJC
	 qpirkGuhxkxcZ5h3Gz9nHZ29rfJEiH2yln8qSwL6MobQbRJ3c5oYsuHx4XIZumulruLj0
	 +nW5129rFEOJdxKx3HNQi92NlHUR26ufh4bfwGymnap03s6Zu9HtIV6A9Z8MyoAJzr47w
	 MnVHzFc7Iz0eBoNng3YfJ30jmLuTD60Nq6yOK2t6CKRwKSfGZjOWDmqOqx5y3rxzwohJ0
	 rhPyJHEjaoRFlSufD3nFxkMmZzY0BA//tHUXAJgOzu025bPtmf3GptkaYPOHhCxGmcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794204019;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Ezt0QzdtXRpdhW1yj2rTzGXOSQDTzrUEz+cuvrZygBU=;
	b=2EHwHjQwkjdWt0pFVfqotv64D4Yd/OJGXeCgr3Zrr8r6br/qeA3w9kxsg6J+LGCGAZPd
	 mbgpG7tz8BWYDYf08g33Yz9D6As0xvHWYldRE0qk73ZLt1del/j3bIhtCYLuXIRvcQF2C
	 ruO02RpopmQBqQ+ggAaJn8GxEDyI/d4UviBpWmsWSdZkkom+l1wI5IEinOd1F8BpOhZ5x
	 f2fJveI0i7BTX3HIdap+3RR87tcCUyWkCFgrbiS+4U8Q0h2HvrN4lNIhTPdpBbAmT5ipU
	 vIQuR1ZhpEw8CL8/cevT1aYgZG3nZ0cCxBW5nPbY/916Mrd1n44L31DgjZKJBSPQZCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YgH1LWq8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FF6606D80D;
	Mon,  9 Nov 2026 06:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YgH1LWq8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92A771F008A6;
	Mon,  9 Nov 2026 06:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794204019;
	bh=Ezt0QzdtXRpdhW1yj2rTzGXOSQDTzrUEz+cuvrZygBU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=YgH1LWq8b35HH0hXDk3dOkDlwfVylAC4iCxcJZGczWKBo1r0frgv2K1lp23jQllPb
	 uasE57Hw7nYvh277QI2NzK1XyGgCi+ErhSnoSGtG2YFitlWIDUAv++qAZLxca0wPbx
	 K4gH42H0l62qbNpb2rBWHzcEe9YNJdYMP3tWu6qgxsus8gXB+GeXYb5mrRbHjqUUoI
	 FXanv/is2rjhkHR9GZ2/w2nkDwpaGttIsgO6SyM+HxyGQ/EY+uxouPK8oeH+aFH+A5
	 OXXT406BNJtqyPZt7FN/Z27wKmFRZ8kNonYF59ra7o7H5podeQS7oLLemSuKodu14S
	 VdsEvX61WZkAA==
Subject: Re: [PATCH net-next v2 6/6] selftests: net: add leased devmem RX and
 TX netdev unregister tests
From: netdev-bot+sashiko@kernel.org
To: almasrymina@google.com
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 daniel@iogearbox.net, razor@blackwall.org, dw@davidwei.uk,
 sdf.kernel@gmail.com, bobbyeshleman@meta.com, dtatulea@nvidia.com
Date: Mon, 09 Nov 2026 06:00:18 +0000
Message-ID: <179420401815.994134.4956375359433881127@kernel.org>
In-Reply-To: <20261108055809.2122934-7-almasrymina@google.com>
References: <20261108055809.2122934-7-almasrymina@google.com>
X-sashiko-severity: Medium
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The new leased tests bind through `_devmem_bind()`, which
  turns every NlError with EOPNOTSUPP into KsftSkipEx.
- [Low] devmem_lease_bind_rx_unregister_check()
  (tools/testing/selftests/net/nl_netdev.py), remove_virt_first=True…
- [Low] devmem_lease_bind_rx_unregister_check() and
  devmem_lease_bind_tx_unregister_check() each run a two-pass loop…

--

selftests: net: add leased devmem RX and TX netdev unregister tests

This commit adds two tests to nl_netdev.py. Each one binds an RX or TX
dmabuf to a single-mode netkit device that leases RX queue 1 from
netdevsim. The tests then check for clean teardown both when the netkit
device is deleted first and when the netdevsim device is removed
directly.

> diff --git a/tools/testing/selftests/net/nl_netdev.py b/tools/testing/selftests/net/nl_netdev.py
> index dd0321c0b463a..fa4b5be093257 100755
> --- a/tools/testing/selftests/net/nl_netdev.py
> +++ b/tools/testing/selftests/net/nl_netdev.py

[ ... ]

> +def devmem_lease_bind_rx_unregister_check(nf) -> None:
> +    """Verify leased RX devmem bindings detach cleanly on virt/phys unregister."""
> +    for remove_virt_first in (False, True):

[ ... ]

> +        _devmem_bind(nf_priv.bind_rx, {
> +            "ifindex": nk_ifindex,
> +            "fd": dmabuf_fd,
> +            "queues": [{"id": res["id"], "type": "rx"}],
> +        })
> +        ksft_ge(_dmabuf_attach_count(dmabuf_fd), 1)
> +
> +        if remove_virt_first:
> +            ip(f"link del dev {nk_ifname}")
> +            phys_q = nf.queue_get({"ifindex": nsim.ifindex, "id": 1,
> +                                   "type": "rx"})
> +            ksft_not_in("dmabuf", phys_q)
> +            ksft_not_in("lease", phys_q)

[Severity: Low]
Do these two absence checks show that unleasing removed anything?

Nothing earlier checks that the physical queue reported dmabuf or lease
while the binding was active. The only check after the bind is:

    ksft_ge(_dmabuf_attach_count(dmabuf_fd), 1)

That count goes up when net_devmem_bind_dmabuf() maps the dma-buf, which
happens before any queue gets the memory provider. So it says nothing
about the physical rxq.

Suppose netdev_nl_queue_fill_mp() stopped reporting dmabuf on the leased
physical queue, or the lease redirect in netif_mp_open_rxq() never
installed the memory provider. These ksft_not_in() checks would still
pass.

nk_qlease.py checks lease reporting, but no selftest checks dmabuf on a
leased physical queue.

Could a ksft_in() check on the physical queue be added right after the
bind?

> +            ksft_ge(_dmabuf_attach_count(dmabuf_fd), 1)
> +            nsimdev.remove()
> +        else:
> +            nsimdev.remove()
> +            ksft_ne(cmd(f"ip link show dev {nk_ifname}", fail=False).ret, 0)

[Severity: Low]
What happens on the second loop pass if this check fails?

ksft_ne() only records the failure and does not raise. If removing
netdevsim no longer cascades to the netkit device, the loop moves on to
the remove_virt_first=True pass with the netkit device still there.

That pass calls _create_netkit_single() again with the same name and
NLM_F_EXCL:

    ifname = f"nk{os.getpid()}"
    ...
                flags=[Netlink.NLM_F_CREATE, Netlink.NLM_F_EXCL],
    ...
    defer(cmd, f"ip link del dev {ifname}", fail=False)

The deferred ip link del only runs when the whole test case ends, not
after each iteration.

Would RTM_NEWLINK then fail with EEXIST? _create_netkit_single() only
turns EOPNOTSUPP and ENOENT into a skip, so it would re-raise that error.

The real cascade failure would then be hidden under an unrelated NlError
traceback, and the remove_virt_first=True case would not run.
devmem_lease_bind_tx_unregister_check() has the same pattern.

> +        ksft_eq(_dmabuf_attach_count(dmabuf_fd), 0)
> +
> +        nf_priv.close()
> +
> +
> +def devmem_lease_bind_tx_unregister_check(nf) -> None:
> +    """Verify leased TX devmem bindings detach cleanly on virt/phys unregister."""
> +    for remove_virt_first in (False, True):

[ ... ]

> +        _devmem_bind(nf_priv.bind_tx, {
> +            "ifindex": nk_ifindex,
> +            "fd": dmabuf_fd,
> +        })

[Severity: Medium]
Can a broken lease lookup be reported as SKIP here rather than FAIL?

_devmem_bind() turns every EOPNOTSUPP into a skip:

    def _devmem_bind(bind, attrs) -> None:
        try:
            bind(attrs)
        except NlError as e:
            if e.error == errno.EOPNOTSUPP:
                raise KsftSkipEx(f"devmem binding not supported: {e}") from e

netkit sets dev->netmem_tx = NETMEM_TX_NO_DMA. So this bind only succeeds
if netdev_find_netmem_tx_dev() walks the netkit rx queues, finds
rxq->lease, and returns the physical device. If that walk fails,
netdev_nl_bind_tx_doit() returns the same errno:

    map_dev = netdev_find_netmem_tx_dev(netdev);
    if (!map_dev) {
        err = -EOPNOTSUPP;
        NL_SET_ERR_MSG(info->extack,
                       "No DMA-capable device found for netmem TX");

The leased RX bind in devmem_lease_bind_rx_unregister_check() has the
same problem. netif_mp_open_rxq() returns -EOPNOTSUPP when the lease
redirect resolves to a device without a parent ("rx queue belongs to a
virtual netdev"), and __netif_mp_open_rxq() does the same when there are
no qops.

The skip is needed when netdevsim has no DMA mask and so does not set
NETMEM_TX_DMA. But the wrapper cannot tell that case apart from a lease
resolution failure.

Would it work to skip only if a direct bind on the nsim device also
returns EOPNOTSUPP, or to check the nsim DMA capability up front?

> +        ksft_ge(_dmabuf_attach_count(dmabuf_fd), 1)

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261108055809.2122934-1-almasrymina%40google.com
