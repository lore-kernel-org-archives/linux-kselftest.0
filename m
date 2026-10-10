Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF2C399350;
	Sat, 10 Oct 2026 21:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791668626; cv=none; b=RS15oCBjoJ+x2YxLKfMhj7HOskLpoYA5milE5wjQU2WMqTxkL6QD9HVxBuPFMV69HmGq5x6mo3oWmIMYMQMZbrAwoXV91BmpYT7CMGXC8Tz+Isf8vnraCgnn3X0lQ9QHQFc3VzIpUipWzzlq323t+DgyRYFceJQrrd1f8liGCp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791668626; c=relaxed/simple;
	bh=S2+VIQWyumTlCKdwVlzIuXp+jZW715G56ZnAY1o8YIU=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NYXTrjbkg8Mds+twyH/U/oFPS8cJu1kW+dCo+68WcODlN7qa4IGQwtMsMXphiFNzGEkp14QJuvGtysMJYTIzvALqykknyy3qqLYO5qtyAAkzrmSjP6JBROXLDFfnE45Vt62G/4ATKrZQrR2UX13PEPKgq2GOIknI/Q9Mvro3vk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fvlr0PbV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fvlr0PbV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 297901F000FF;
	Sat, 10 Oct 2026 21:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791668625;
	bh=CzKVYP/aWRoAXnR4xjbGlUAOnhcQcQoKQsLyJlte7ek=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Fvlr0PbVTAKlJ03h92QWsfURuw70Ng+GNA+wsTUg2jH6E2Y5dyfe2EXFswE7Xpiyz
	 w7fuSiJrL67ki8IWRFTNkNRiGxyu8+IIsLlMjRVp9nhDWO0nUOUUwlYncYbIRWl/TD
	 UYtpnhL4pZaBmTzdy9OtICdK4pjpQ8qeC+ORERJ8FOYgvSihOHlquzELOUSGA9o97g
	 ///BtgeVSGTgiCZwlti0nYpCuU9lzRQ1U9N4Dwud2cxF3ji7//r5VzRb4ISMuVBFZk
	 K7+m2ind1cxQmYjvB9O3ywItbrcpN8EzOU8J2sm3wTm9acBFtRpF/QmIJIZUT81syC
	 ITX+Ya/vkcdqg==
Subject:
 Re: [PATCH net-next v2 3/7] psp: defer tx key deletions for SADB drivers
From: netdev-bot+sashiko@kernel.org
To: daniel.zahka@gmail.com
Cc: kuba@kernel.org, willemdebruijn.kernel@gmail.com, davem@davemloft.net,
 edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, donald.hunter@gmail.com,
 andrew+netdev@lunn.ch, shuah@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Date: Sat, 10 Oct 2026 21:43:43 +0000
Message-ID: <179166862366.434549.8959446384447272811@kernel.org>
In-Reply-To: <20261009-psp-v2-3-5596ab50f677@gmail.com>
References: <20261009-psp-v2-3-5596ab50f677@gmail.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] Removing the SADB gate in psp_sock_tx_rekey() lets an
  unprivileged user who owns an established PSP TCP socket rekey in a…
- [Low] psp_dev_unregister() (net/psp/psp_main.c) disables the grace-
  period work with psp_deferred_del_stop() and then calls…

--

psp: defer tx key deletions for SADB drivers

When a Tx rekey detaches an old psp_assoc from its socket, this patch
waits for a BQL-based descriptor grace period before deleting the old key
from an SADB device. Old keys are queued on psd->tx_del, and a delayed
work polls the dql counters before calling psp_dev_tx_key_del(). The patch
also allows Tx rekey on SADB devices and makes INET_PSP depend on BQL.

> diff --git a/net/psp/psp_deferred_del.c b/net/psp/psp_deferred_del.c
> new file mode 100644
> index 0000000000000..cfbac72577e96
> --- /dev/null
> +++ b/net/psp/psp_deferred_del.c
> @@ -0,0 +1,231 @@

[ ... ]

> +void psp_deferred_del_stop(struct psp_dev *psd)
> +{
> +	disable_delayed_work_sync(&psd->tx_del.work);
> +}
> +
> +void psp_deferred_del_uninit(struct psp_dev *psd, bool unpublished)
> +{
> +	struct psp_assoc *pas, *next;
> +
> +	lockdep_assert(unpublished || lockdep_is_held(&psd->lock));
> +
> +	psp_txq_state_free(psd->tx_del.txq_state);
> +	psd->tx_del.txq_state = NULL;
> +
> +	list_splice_init(&psd->tx_del.active, &psd->tx_del.next);
> +	list_for_each_entry_safe(pas, next, &psd->tx_del.next, assocs_list) {
> +		list_del(&pas->assocs_list);
> +		psp_dev_tx_key_del(psd, pas);
> +		psp_dev_put(psd);
> +		kfree(pas);
> +	}
> +}

[Severity: Low]

psp_dev_unregister() calls psp_deferred_del_stop() to disable the poll
work. It then calls psp_deferred_del_uninit(psd, false), which runs
psp_dev_tx_key_del() on every key on tx_del.active and tx_del.next. It
does not check the BQL counters first.

These keys were deferred because Tx descriptors might still reference
them. If an SADB driver calls psp_dev_unregister() while PSP Tx
descriptors are still in flight, would the SADB entries be removed while
the hardware can still use them?

No in-tree driver hits this today. mlx5e_nic_disable() calls mlx5e_close()
before mlx5e_psp_unregister(), and netdevsim has no tx_key_add.

Before this patch, psp_dev_unregister() already deleted keys for live
sockets on the active, prev and stale lists. So the unwritten rule "quiesce
Tx before unregister" already existed.

However, the new "Deferred Tx key deletion" section in
Documentation/networking/psp.rst says PSP core waits until descriptors
are completed. The commit message sends driver authors to its list of
requirements, and that list does not include this precondition.

Could a requirement be added? It would say that all PSP Tx descriptors
must be completed or discarded before psp_dev_unregister() is called.

[ ... ]

> diff --git a/net/psp/psp_sock.c b/net/psp/psp_sock.c
> index 060149f3d72a7..d21f7afd830a3 100644
> --- a/net/psp/psp_sock.c
> +++ b/net/psp/psp_sock.c

[ ... ]

> @@ -290,10 +296,6 @@ psp_sock_tx_rekey(struct sock *sk, struct psp_dev *psd, struct psp_assoc *pas,
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

[ ... ]

> @@ -324,6 +326,7 @@ psp_sock_tx_rekey(struct sock *sk, struct psp_dev *psd, struct psp_assoc *pas,
>  	list_add(&new->assocs_list, &pas->assocs_list);
>  
>  	rcu_assign_pointer(sk->psp_assoc, new);
> +	pas->flags |= PSP_ASSOC_DEFER_TX_KEY_DEL;
>  	psp_assoc_put(pas);
>  
>  	return 0;

[Severity: Medium]

With the SADB check removed, can an unprivileged user fill the device
SADB by rekeying one socket in a loop?

PSP_CMD_TX_ASSOC has no GENL_ADMIN_PERM. psp_assoc_device_get_locked()
only checks socket ownership and netns visibility, and userspace supplies
the Tx key and SPI. Each call installs a new hardware key:

psp_sock_assoc_set_tx()
  psp_sock_tx_rekey()
    psp_assoc_set_tx()
      psp_dev_tx_key_add()

The old assoc is marked PSP_ASSOC_DEFER_TX_KEY_DEL. After the RCU
callback, psp_assoc_free() only moves it onto psd->tx_del.next via
psp_deferred_del_queue():

	list_move_tail(&pas->assocs_list, &psd->tx_del.next);
	schedule_delayed_work(&psd->tx_del.work, 0);

While the 1000 ms poll is pending, schedule_delayed_work() does nothing.
So a key queued during an active grace period waits for that grace period
and then one more full grace period. If any Tx queue's BQL counters stop
advancing, the keys stay installed forever.

Nothing appears to limit how many deferred keys can be outstanding per
socket, per netns or per psp_dev. One connection could then hold about
(rekey rate x 1-2 s) SADB entries. psp_dev_tx_key_add() calls from other
sockets or netns sharing the psp_dev could then fail.

Before this patch, SADB exhaustion was already partly possible with many
connections. TIME_WAIT sockets also hold psp_assoc references for up to
60 s, and psp_assoc memory is charged to the memcg. The rekey path still
adds a new way for a single connection to multiply its usage.

Would it make sense to cap or rate-limit pending deferred deletions?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261009-psp-v2-0-5596ab50f677%40gmail.com
