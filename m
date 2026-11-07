Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794085169;
	b=X77VA/ymldNBIwUzp6QS9So1Shnb255TzNvkq2tjFtkc+cI+0HQVSduXk0m7VwoI5pJU
	 xlCu/n0sMJ1j1v98ITIzAuNxGN6vM7eBE5cKxxyGjJ9+8fgZ5A1RHIZVd4Mr7TFsFMqbz
	 XeTaCoVtdH4LeCVdyOXmTADy93tJshZMgSfGRyNXlnm3oWPNGDf0xzwQMqYE0ZN29fOxd
	 vpPvqAISIvnUcUIQfsg5eVpA5LAsNVeBkG6/QFqNq9rFAbxCNKPkDSi4cEtHSBok8S6RG
	 mv38Ez3u43GqyyeNrB7O5oNjcqaBJddaCP1N1abQCoTf6rQ/EFXRzzSKB7ZoAGX1kkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794085169;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=rBTYyUmfsQGb/AQCf/MvwklElVs0fgEKG8OanSKNog4=;
	b=QFmLbxo3VcnXpQWIP5ir7iuLkb4OQBCJ5lKf69+dfaA0dhSv395eU3DhfWy5u+1oi0Ze
	 m4eC/pWti8pZu92RjTn4hc2r6n76SEhFfjNcCi0OnniYNiQW770x/ttTFv6rQskMRd4U1
	 IC/lvpRzFfQSbuNvBdGN8j06hlXCk9pVZhGRljpTVrUASrw3Lqj5HyX6AJIBQ1TVOn648
	 GDS9vZCjjTeFkvSyLlV818Whf0+zRt1jF9DymPotSuiimc5BUdqoXb7dP7Wy0gwL1I3ZU
	 DnyXUmBp7ek5ohcLuv2owoeT+k8r/FGms5a5gjBUxal35WLw9JGZeCthIf/50wzDxzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="VcRrtY/4";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEA3606A32C;
	Sat,  7 Nov 2026 20:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VcRrtY/4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AAFF1F008A1;
	Sat,  7 Nov 2026 20:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794085168;
	bh=rBTYyUmfsQGb/AQCf/MvwklElVs0fgEKG8OanSKNog4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=VcRrtY/45mXjrDCOOngeZIVy6yS72n3h7axO0Q5nCD0sVuBwrxA7FkYQ31G2S51KJ
	 u9E48zZzrHSLfH1xxrvbjfoBGAXdX46ztL8NcKK0trDbP8uQeLxSTvugV3Iwru1d67
	 sjoa2+6xIub0C8nZjEHNzTiMpR5LPopSw2YkmdyTo5QeDydCZ6B45MYYmGRvxmTm49
	 OY14FHkDUmzH/yRmsFwwozAd39aJBykYdTSbxRLD4tz8uDQxuvlZH4CoV6bHviV4K9
	 fTHoGvMyZEW/Y4Ubumqx42wrpej5CSpLddYkB95IzNezt85QIqX7C8ldcXVgmtwD9L
	 FWffREGb4r+LQ==
Subject:
 Re: [PATCH net-next v3 3/5] psp: defer tx key deletions for SADB drivers
From: netdev-bot+sashiko@kernel.org
To: daniel.zahka@gmail.com
Cc: kuba@kernel.org, willemdebruijn.kernel@gmail.com, davem@davemloft.net,
 edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, donald.hunter@gmail.com,
 andrew+netdev@lunn.ch, shuah@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Date: Sat, 07 Nov 2026 20:59:26 +0000
Message-ID: <179408516694.994134.18039275084711975656@kernel.org>
In-Reply-To: <20261106-psp-v3-3-a8dd38f5a727@gmail.com>
References: <20261106-psp-v3-3-a8dd38f5a727@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] This patch removes the psp_dev_has_sadb() -> -EOPNOTSUPP guard
  from psp_sock_tx_rekey() (net/psp/psp_sock.c) and replaces the old…
- [Low] The patch adds an implicit rule for SADB drivers (those with
  tx_key_add/tx_key_del) that is written down only in the commit…

--

psp: defer tx key deletions for SADB drivers

This commit enables Tx rekey on devices that keep Tx keys in an SADB. A
superseded Tx key is now deleted only after a BQL-based descriptor grace
period has passed on every active Tx queue, and a delayed work polls the
queued and completed byte counts to detect the end of that period.
CONFIG_INET_PSP now depends on CONFIG_BQL, and SADB drivers must be ops
locked.

> diff --git a/Documentation/networking/psp.rst b/Documentation/networking/psp.rst
> index 43f222b38d3d4..ceb1e232317fc 100644
> --- a/Documentation/networking/psp.rst
> +++ b/Documentation/networking/psp.rst
> @@ -202,6 +202,48 @@ Drivers must use ``psp_skb_get_assoc_rcu()`` to check if PSP Tx offload

[ ... ]

> +Drivers which implement the Tx key callbacks must meet the following
> +requirements:
> +
> +* The driver must be "ops locked"
> +  (see Documentation/networking/netdevices.rst).

[ ... ]

> +* Before calling ``psp_dev_unregister()``, the driver must ensure that all
> +  outstanding Tx descriptors containing key references have been completed
> +  or discarded. PSP core deletes all remaining Tx keys during
> +  unregistration without waiting for a grace period.
> +

[Severity: Low]
Should this list also say that psp_dev_unregister() must not be called
with the netdev instance lock held? Right now that rule is only in the
commit message.

psp_dev_unregister() now begins with psp_deferred_del_stop(), which waits
for the work:

psp_deferred_del_stop() {
	disable_delayed_work_sync(&psd->tx_del.work);
}

The work takes psd->lock first and then the instance lock:

psp_deferred_del_work() {
	...
	mutex_lock(&psd->lock);
	netdev_lock(psd->main_netdev);
	...
}

Suppose a driver calls psp_dev_unregister() under netdev_lock() while the
work is blocked in netdev_lock(). Then disable_delayed_work_sync() never
returns. Taking psd->lock after that would also invert the psd->lock ->
instance lock order.

The psp_dev_unregister() kernel-doc has no Context: line covering this.
The @tx_key_add / @tx_key_del kernel-doc in include/net/psp/types.h still
only says "Can be left NULL if device does not store Tx keys". It doesn't
say that psp_dev_create() now rejects tx_key_add on devices that aren't
ops locked, and it doesn't mention the BQL requirements.

mlx5 calls psp_dev_unregister() from mlx5e_nic_cleanup() without holding
netdev_lock, so it isn't affected today.

[ ... ]

> diff --git a/net/psp/psp_sock.c b/net/psp/psp_sock.c
> index d497f41c483e1..48bffe088c79b 100644
> --- a/net/psp/psp_sock.c
> +++ b/net/psp/psp_sock.c

[ ... ]

> @@ -287,10 +293,6 @@ psp_sock_tx_rekey(struct sock *sk, struct psp_dev *psd, struct psp_assoc *pas,
>  	struct psp_assoc *new;
>  	int err;
>  
> -	if (psp_dev_has_sadb(psd)) {
> -		NL_SET_ERR_MSG(extack, "Tx rekey not supported on this device");
> -		return -EOPNOTSUPP;
> -	}
>  	if (!pas->peer_tx) {
>  		NL_SET_ERR_MSG(extack, "Socket PSP state is not fully established");
>  		return -EBUSY;

[Severity: Medium]
With this check removed, can an unprivileged user use up the device's Tx
key space by calling tx-assoc in a loop on a single socket?

The PSP_CMD_TX_ASSOC op in psp-nl-gen.c sets only GENL_CMD_CAP_DO and not
GENL_ADMIN_PERM. The caller just needs to own an established TCP socket
routed over an SADB device. Every rekey allocates a new device key:

psp_nl_tx_assoc_doit()
  psp_sock_assoc_set_tx()
    psp_sock_tx_rekey()
      psp_assoc_set_tx()
        psp_dev_tx_key_add()
          mlx5e_psp_assoc_add()
            mlx5_create_encryption_key()

The superseded key is released only after all of these steps:

- an RCU grace period
- the free work runs
- psp_deferred_del_queue() moves it onto psd->tx_del.next
- a BQL grace period completes on every Tx queue

psp_deferred_del_work() checks for the end of that grace period only once
every PSP_TX_GRACE_POLL_MS (1000 ms).

Nothing limits the rekey rate or the length of tx_del.next and
tx_del.active:

psp_deferred_del_queue() {
	...
	list_move_tail(&pas->assocs_list, &psd->tx_del.next);
	schedule_delayed_work(&psd->tx_del.work, 0);
}

If a Tx queue stops completing its snapshotted bytes (for example, the
peer sends link-level pause frames), the grace period never ends. In that
case tx_del.next keeps growing and new device keys keep being allocated.

Every PSP socket on the device shares these keys, and they aren't charged
to the caller's memcg (only the psp_assoc allocation uses
GFP_KERNEL_ACCOUNT). Once they run out, tx_key_add() fails for every
other user of the device.

The commit message says:

  Adding a time based rate limit per socket for tx-assoc to prevent
  wasting SADB or deferred deletion queue space is possible for future
  work. For now, users should avoid presenting PSP devices to users they
  don't trust to abuse this.

Before this patch, a socket on an SADB device could hold only one Tx key.
There also doesn't seem to be an in-kernel way to limit tx-assoc to
trusted users. The rest of the series only adds selftests, so no later
patch adds a bound.

Could this patch cap the number of pending deferred deletions per device
or per socket, or rate limit Tx rekey, instead of leaving that for later?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261106-psp-v3-0-a8dd38f5a727%40gmail.com
