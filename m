Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981907;
	b=Ro1jBeeIXiCUnuTYEKE2PumJhQtEq/RofiUzjpG45VLyKT0i5czF5oNOvzhi+zO0wBV3
	 M3PLIgt6POxLlDDBDw9OJkB9aChjyb5lN6Wn72wxhttoAa2G5JrX41S7wvudWJPuqBfjZ
	 YyHDGBm+1brg7wQffQ87RPsL8P31lfUS0zAZZksIg1sG8MRi+frCm+sZ+dIy1RtrPVASr
	 8jajf4SCGIHGXuAH44FFdV5LUFYjTTaZOAiKbpXqIGdLIVQ72bXlaw5byr/lWaBFjgADH
	 bQTxlEhniLPkAuKfSs22/rym91FrmLbakE97y+mCopQ8A86rWMX7Vxq+lXPN8TULKHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981907;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=CxV7DkI88H76yb2VLPpANzS1RzJati4k6J5qQNCsUNs=;
	b=mgeFnAO1y0w0LDbK1gyBBVF9pcoNku6Pd/544g2bB7TWQftdf3vUQOhM81OTMzHhBMYr
	 HvM5NfAJ24gnuedkCkQEw4LczOe9Us6nOO3ERgtedsKfx41VzvMBdgPWK0AjWqlUGgvur
	 PHR2ejEy4L724q2w4V+MNkC78IXuNFd+JvVDpkxq+gR8woOUgS8cZ6/YVL/jfElFqvIr1
	 y6qMfjh+TUnF8YwKqw+eL/Yyl0yBp/pWv5Vg8ACpEYw/UMwDT5Tnvd4bDA+5FevtXENTg
	 bfOFSZl8NHnGcGf45LX9FotWic/85ftURVCIMQoNhwSIAKOWb/FYcHePuMIyOjjmRyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nVBPr3M+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2519606A882;
	Wed, 18 Nov 2026 06:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nVBPr3M+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C3081F000CC;
	Wed, 18 Nov 2026 06:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794981907;
	bh=CxV7DkI88H76yb2VLPpANzS1RzJati4k6J5qQNCsUNs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=nVBPr3M+jXB2/0refst1diprUXrEdRRz72YZcbI+7/IXPzttZdgRBkkTLG/c2/AF0
	 VNoX9fmmbv38uGjiycuKCNSEKvSWgOw3bUeB999SCcNFDXlw9Cdvy6/MV77gxF/lJ6
	 CVSQo16gUMIUi3RJfaNp7iOT3i+YtX7+si96Qspeh4e+epxVf21cfWmVVyoG0HQKxQ
	 namrtQcg49H6bswxI5fPVMeyP1jIlAUHaX0USXIRxWbz+8UdtaHc21HRLc1f3VmeBF
	 XpnUeW64Lf4pOlf6z5FlsT7FnQF7nZN8cOQvtrzrnx66XPnbr7FXq4evswpAWy4ANi
	 YfXFetdA3vNkg==
Subject:
 Re: [PATCH net-next v4 3/5] psp: defer tx key deletions for SADB drivers
From: netdev-bot+sashiko@kernel.org
To: daniel.zahka@gmail.com
Cc: kuba@kernel.org, willemdebruijn.kernel@gmail.com, davem@davemloft.net,
 edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, donald.hunter@gmail.com,
 andrew+netdev@lunn.ch, shuah@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, willemb@google.com
Date: Wed, 18 Nov 2026 06:05:06 +0000
Message-ID: <179498190614.3136.5698785790307751985@kernel.org>
In-Reply-To: <20261116-psp-v4-3-1a599df2aefa@gmail.com>
References: <20261116-psp-v4-3-1a599df2aefa@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The new PSP_ASSOC_DEFER_TX_KEY_DEL path in `psp_assoc_free()`
  (net/psp/psp_sock.c:118-121) gives up its only psd reference before…
- [Medium] Removing the SADB check in `psp_sock_tx_rekey()` lets any non-
  admin user who can reach the PSP device rekey one established TCP…
- [Low] The commit message never says that this patch turns on Tx rekey
  for SADB devices.
- [Low] The patch adds a lock-context rule for SADB drivers that only the
  commit message states: they must not call `psp_dev_unregister()` with…

--

psp: defer tx key deletions for SADB drivers

This commit adds a deferred deletion queue for Tx keys on SADB devices.
A key detached by a Tx rekey is removed from the device only after a
BQL-based descriptor grace period, which a delayed work item checks by
snapshotting per-queue num_queued and polling num_completed. It also
makes INET_PSP depend on BQL, requires ops-locked netdevs for SADB
drivers, and drops the check that rejected Tx rekey on SADB devices.

> diff --git a/Documentation/networking/psp.rst b/Documentation/networking/psp.rst
> index 43f222b38d3d4..ceb1e232317fc 100644
> --- a/Documentation/networking/psp.rst
> +++ b/Documentation/networking/psp.rst
> @@ -202,6 +202,48 @@ Drivers must use ``psp_skb_get_assoc_rcu()`` to check if PSP Tx offload

[ ... ]

> +* Before calling ``psp_dev_unregister()``, the driver must ensure that all
> +  outstanding Tx descriptors containing key references have been completed
> +  or discarded. PSP core deletes all remaining Tx keys during
> +  unregistration without waiting for a grace period.

[Severity: Low]
Should this list also say that psp_dev_unregister() must not be called
with the netdev instance lock held? The commit message states that rule.
It is not in this list or in the psp_dev_unregister() kernel-doc, and
nothing asserts it.

psp_dev_unregister() now starts with:

psp_dev_unregister()
  psp_deferred_del_stop()
    disable_delayed_work_sync(&psd->tx_del.work)

and psp_deferred_del_work() takes the locks in this order:

	mutex_lock(&psd->lock);
	netdev_lock(psd->main_netdev);

Suppose a driver calls psp_dev_unregister() while holding
main_netdev->lock, and the work is blocked in netdev_lock(). Wouldn't
disable_delayed_work_sync() then wait forever?

Even with the work idle, the later mutex_lock(&psd->lock) in
psp_dev_unregister() would run under the netdev lock. That inverts the
lock order the work uses.

mlx5 complies today, because mlx5e_nic_disable() drops the netdev lock
before mlx5e_psp_unregister().

Could the rule go in this list with the other requirements? Something
like lockdep_assert_not_held(&psd->main_netdev->lock) in
psp_dev_unregister() would also match the ops-lock WARN_ON check in
psp_dev_create().

[ ... ]

> diff --git a/net/psp/psp_sock.c b/net/psp/psp_sock.c
> index d497f41c483e1..48bffe088c79b 100644
> --- a/net/psp/psp_sock.c
> +++ b/net/psp/psp_sock.c
> @@ -114,8 +114,14 @@ static void psp_assoc_free(struct work_struct *work)
>  
>  	mutex_lock(&psd->lock);
>  	if (psp_dev_is_registered(psd)) {
> -		if (psp_assoc_needs_tx_key_del(pas))
> +		if (psp_assoc_needs_tx_key_del(pas)) {
> +			if (pas->flags & PSP_ASSOC_DEFER_TX_KEY_DEL) {
> +				psp_deferred_del_queue(psd, pas);
> +				mutex_unlock(&psd->lock);
> +				return;
> +			}

[Severity: Medium]
Once pas is on psd->tx_del.next, its psd reference belongs to the
deferred queue. This path keeps no reference of its own across
mutex_unlock(&psd->lock). Can psd be torn down while this thread is
still inside mutex_unlock()?

Documentation/locking/mutex-design.rst says mutex_unlock() may access the
mutex after releasing ownership, so the caller has to keep the mutex
alive until it returns. When there is a waiter, __mutex_unlock_slowpath()
releases ownership and then still takes lock->wait_lock and calls
debug_mutex_unlock(lock).

A possible sequence:

CPU1 (psp_assoc_free work)         CPU2 (psp_dev_unregister)
psp_deferred_del_queue(psd, pas)
mutex_unlock(&psd->lock)           mutex_lock(&psd->lock) succeeds
  still in slowpath                psp_deferred_del_uninit()
                                     psp_dev_put(psd)
                                   mutex_unlock(&psd->lock)
                                   psp_dev_put(psd)
                                     psp_dev_free()
                                       mutex_destroy(&psd->lock)
                                       kfree_rcu(psd, rcu)
  debug_mutex_unlock(lock)

In the current tree, guard(preempt)() in __mutex_unlock_slowpath() and
kfree_rcu() keep the memory valid. Under CONFIG_DEBUG_MUTEXES, though,
mutex_destroy() clears lock->magic, so
DEBUG_LOCKS_WARN_ON(lock->magic != lock) can fire.

The old non-deferred path only called psp_dev_put(psd) after
mutex_unlock(). Would it work to take psp_dev_get(psd) before queueing
and call psp_dev_put(psd) after the unlock? Another option is for the
deferred queue to take its own reference.

[ ... ]

> @@ -287,10 +293,6 @@ psp_sock_tx_rekey(struct sock *sk, struct psp_dev *psd, struct psp_assoc *pas,
>  	struct psp_assoc *new;
>  	int err;
>  
> -	if (psp_dev_has_sadb(psd)) {
> -		NL_SET_ERR_MSG(extack, "Tx rekey not supported on this device");
> -		return -EOPNOTSUPP;
> -	}

[Severity: Low]
Removing this check turns on Tx rekey for SADB devices, but the commit
message doesn't say so. The subject is "defer tx key deletions for SADB
drivers". The only explicit mention, "allow tx rekey on SADB devices", is
in the v2 changelog below the --- line, so it won't be in the applied
commit.

The body also says:

  "Rekeying introduces a code path where a psp_assoc is detached from its
  socket and may be freed while the socket is still alive."

That reads as though the path was already reachable on SADB devices,
but this patch is what makes it reachable.

mlx5 is the only in-tree SADB driver: mlx5_psp_ops sets tx_key_add and
tx_key_del. With no driver changes, PSP_CMD_TX_ASSOC on an established
mlx5 socket used to return -EOPNOTSUPP and now installs a new SADB key.

Could the commit message state this behavior change directly, and say
whether mlx5 was checked against the new psp.rst driver requirements?

[Severity: Medium]
With this check gone, can a non-admin user use up the device SADB by
rekeying one socket in a loop?

PSP_CMD_TX_ASSOC has no GENL_ADMIN_PERM, and
psp_assoc_device_get_locked() calls psp_dev_check_access(psd, net, false).
Each rekey goes through:

psp_sock_tx_rekey()
  psp_assoc_set_tx()
    psp_dev_tx_key_add()
      mlx5e_psp_assoc_add()

The old assoc is then flagged PSP_ASSOC_DEFER_TX_KEY_DEL. After RCU,
psp_deferred_del_queue() appends it to psd->tx_del.next with no count or
cap:

	list_move_tail(&pas->assocs_list, &psd->tx_del.next);
	schedule_delayed_work(&psd->tx_del.work, 0);

psp_deferred_del_work() frees keys only after a full BQL grace period,
polled every PSP_TX_GRACE_POLL_MS (1000 ms). Keys queued while a period
is active wait for the next one. If any queue below real_num_tx_queues
stops completing BQL bytes, the list keeps growing until
psp_dev_unregister().

Before this patch, each socket used at most one SADB Tx entry. Now one
socket can hold about rekey rate times (RCU grace period plus 1-2 s)
entries. The SADB is a hardware resource shared across namespaces, so
tx_key_add could start failing for other users. The pas allocation is
charged via GFP_KERNEL_ACCOUNT, but SADB capacity is not.

The commit message acknowledges the missing rate limit and suggests not
exposing PSP devices to untrusted users. However, devices in init_net
are reachable by all of its users, and there is no knob to restrict
tx-assoc.

Would it make sense to add a per-socket or per-device bound on
outstanding deferred keys in this change?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261116-psp-v4-0-1a599df2aefa%40gmail.com
