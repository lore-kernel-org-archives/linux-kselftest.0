Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795302184;
	b=hiMBE1RlEUmhx+ZyOwPKy78CLugEA7m3BK/+kTBMtDralRVx475MxX6K4TCkdyzxP40x
	 0Kyfem4I18BemxNYzpUKQglKSn5HvAa3r/o0vUHbTQaoG88k5uadFQQQOwdFBm4XC5/GC
	 o2vzalsKYWVGlsaMp6mdNqm8BFN7CpKqJ4+vqI1R3/ADMUd5TSauKyIOKb8KiEOBHg+gx
	 3OhBNnH7dNvFw53Iw8qRjRSMwfZ1k8I7wUELbZ5cdwu1NPrXRDPuwOTQu/GG36Tjb4jPX
	 Tp8+jibpcM+wK3FZPtb3VzLGdCEVNbAw/VRHgSAohjUhAVi4H5T3UtVHAVryISIG4zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795302184;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=XcRczKWwU5ym95c9oT/UpnXRef3ufPr29kt2RL5hTFo=;
	b=YtNla1N04h2O6+SNPnl9vs5bSHlyQ3fGPq3IcC0s1+Bwhk74mBhwxOVys6lVEDZlfz03
	 vM1PcxmputWHalfqifPnPXFx9soDRjNVY0k9/oeKaQLIVHLeGehZ8pZGDpmZwRulwJIIw
	 7gKLZewe5AwMlgya9t/ipD5XvCSKemEatw+oKsyF8wsqjSzWUWXXXF68v+y48Gs4CPMFG
	 +rf6H3WEV3aWosXTMsUCimkmvGs15CDBna+kl1W3ciUzMPuAjV5dRMpm4YZmdgBNCGq29
	 qy0AICC/b2r+u39MK3e8NUF7wwyFJGaHxY21/qsNaE0zTWRhYKTsDhyW0JPMXEqXbCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ciNaogL4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4DB606A6B3;
	Sat, 21 Nov 2026 23:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ciNaogL4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 376C21F000C4;
	Sat, 21 Nov 2026 23:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795302184;
	bh=XcRczKWwU5ym95c9oT/UpnXRef3ufPr29kt2RL5hTFo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ciNaogL4aQTonU3P7r5sYZ319swbSvr17afipS2f9rwiNU7egTulspO514bgX2D4L
	 LxIZKR8WdZ9TAYaQA5vNi1jlCoWMNKLFIlfI0fVynUgvCauuEJTkllN19acfc8RZJR
	 bPyV7PXq9wQdht/Nb1zcW4DtScgohjz+woqzVQWSyVBouIVqwLxj/OlL1/HvxbNN0M
	 8VEGCq8gd9z76YojQrF3sUDOYDNMI1sd2bP0Xe0klbCKanHV6F8lx32INVaeC+9VAh
	 llNOnr2Xl/JAooPMdF79wO0bqO9CUrkzFTTr9zOfpAC6N4wyO9B2Tqq3SEiOhdcGAN
	 lXbZp2g9Mh4yw==
Subject:
 Re: [PATCH net-next v5 4/6] psp: defer tx key deletions for SADB drivers
From: netdev-bot+sashiko@kernel.org
To: daniel.zahka@gmail.com
Cc: kuba@kernel.org, willemdebruijn.kernel@gmail.com, davem@davemloft.net,
 edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, donald.hunter@gmail.com,
 andrew+netdev@lunn.ch, shuah@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, willemb@google.com
Date: Sat, 21 Nov 2026 23:03:02 +0000
Message-ID: <179530218277.3135.14647055020229146998@kernel.org>
In-Reply-To: <20261118-psp-v5-4-b9ec840e0296@gmail.com>
References: <20261118-psp-v5-4-b9ec840e0296@gmail.com>
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

- [Medium] With the -EOPNOTSUPP guard gone from psp_sock_tx_rekey()
  (net/psp/psp_sock.c), any unprivileged owner of an established PSP TCP…
- [Low] The applied commit message does not say that this patch turns on
  Tx rekey for SADB devices.
- [Low] The kernel-doc for psp_dev_ops::tx_key_add and ::tx_key_del in
  include/net/psp/types.h still says only that each callback 'Can be…

--

psp: defer tx key deletions for SADB drivers

This patch adds a deferred Tx key deletion queue for PSP devices that
store Tx keys in an SADB. Before calling psp_dev_tx_key_del(), the core
snapshots BQL queued byte counts per Tx queue and polls until those bytes
have completed. It also removes the -EOPNOTSUPP restriction on Tx rekey
for SADB devices and makes CONFIG_INET_PSP depend on CONFIG_BQL.

> diff --git a/net/psp/psp_main.c b/net/psp/psp_main.c
> index ba44154cf8dc0..789315dae2373 100644
> --- a/net/psp/psp_main.c
> +++ b/net/psp/psp_main.c

[ ... ]

> @@ -75,7 +77,8 @@ psp_dev_create(struct net_device *netdev,
>  		    !psd_ops->rx_spi_alloc ||
>  		    !psd_ops->get_stats ||
>  		    (!psd_ops->tx_key_add != !psd_ops->tx_key_del) ||
> -		    (psd_caps->assoc_drv_spc && !psd_ops->tx_key_add)))
> +		    (psd_caps->assoc_drv_spc && !psd_ops->tx_key_add) ||
> +		    (psd_ops->tx_key_add && !netdev_need_ops_lock(netdev))))
>  		return ERR_PTR(-EINVAL);

[Severity: Low]
Should the kernel-doc for tx_key_add and tx_key_del in
include/net/psp/types.h be updated along with this check? It still only
says:

	 * @tx_key_add: add a Tx key to the device
	 * Install an association in the device. Core will allocate space
	 * for the driver to use at drv_data.
	 * Can be left NULL if device does not store Tx keys and @tx_key_del
	 * is also NULL.

With this patch, a driver that implements these callbacks needs an ops
locked netdev. Without one, psp_dev_create() hits the WARN_ON and returns
-EINVAL.

The driver also needs exact, in-order BQL accounting and has to follow
the dql_reset() and real_num_tx_queues rules that psp_deferred_del_work()
relies on.

These rules are only written down in Documentation/networking/psp.rst,
and the ops kernel-doc doesn't point there. A driver written from the
struct documentation alone could hit the registration WARN, stall the
grace period, or end it too early.

Could the kernel-doc reference the new "Deferred Tx key deletion"
section? No later patch in the series appears to update it.

> diff --git a/net/psp/psp_sock.c b/net/psp/psp_sock.c
> index d497f41c483e1..8de313805af03 100644
> --- a/net/psp/psp_sock.c
> +++ b/net/psp/psp_sock.c

[ ... ]

> @@ -287,10 +302,6 @@ psp_sock_tx_rekey(struct sock *sk, struct psp_dev *psd, struct psp_assoc *pas,
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

[Severity: Low]
This isn't a bug, but could the commit message say outright that Tx
rekey is now allowed on SADB devices?

The earlier commit "psp: support tx rekey operation" said SADB drivers
would "return -EOPNOTSUPP for now". With this guard removed,
PSP_CMD_TX_ASSOC on a socket that already has a Tx key now succeeds on
mlx5, where it used to fail.

The only explicit mention is "allow tx rekey on SADB devices" in the v2
changelog below the --- line, and that part is dropped when the patch is
applied.

The same goes for the new registration requirement in psp_dev_create():

	(psd_ops->tx_key_add && !netdev_need_ops_lock(netdev))

The body only says drivers "must meet the requirements in
Documentation/networking/psp.rst".

> @@ -322,6 +333,7 @@ psp_sock_tx_rekey(struct sock *sk, struct psp_dev *psd, struct psp_assoc *pas,
>  	list_move(&pas->assocs_list, &psd->stale_assocs);
>  
>  	rcu_assign_pointer(sk->psp_assoc, new);
> +	pas->flags |= PSP_ASSOC_DEFER_TX_KEY_DEL;
>  	psp_assoc_put(pas);
>  
>  	return 0;

[Severity: Medium]
Can an unprivileged user use up the device's hardware Tx key pool
through this path?

PSP_CMD_TX_ASSOC has no GENL_ADMIN_PERM. psp_sock_assoc_set_tx() enters
psp_sock_tx_rekey() whenever pas->tx.spi is already set, and each call
allocates a new hardware key:

psp_sock_tx_rekey()
  psp_assoc_set_tx()
    psp_dev_tx_key_add()
      mlx5e_psp_assoc_add()
        mlx5_create_encryption_key()

The old key then goes onto the deferred deletion queue, which has no
upper bound:

net/psp/psp_deferred_del.c:psp_deferred_del_queue() {
	list_move_tail(&pas->assocs_list, &psd->tx_del.next);
	schedule_delayed_work(&psd->tx_del.work, 0);
}

psp_deferred_del_work() handles one grace period at a time and polls
every PSP_TX_GRACE_POLL_MS (1000 ms). Keys queued during a grace period
wait for the next one. A single socket can therefore pin as many DEKs as
it can rekey in that window, where before each socket held at most one.

Suppose a queue below real_num_tx_queues never completes the bytes
snapshotted in psp_tx_grace_start(). Would every later rekey then pin a
DEK, a psp_assoc and a psd reference until psp_dev_unregister()?

When a grace period does end, psp_deferred_del_work() calls
psp_dev_tx_key_del() for the whole batch while holding psd->lock. On mlx5
each call is a firmware command:

	list_for_each_entry(pas, &to_free, assocs_list)
		psp_dev_tx_key_del(psd, pas);

Would that block other PSP netlink operations, and psp_assoc_free() for
every socket on the device, until the batch is done?

The psp_assoc allocation uses GFP_KERNEL_ACCOUNT, but the hardware DEK
pool is shared by the whole device and is not charged to any cgroup. One
local user could make tx_key_add fail for other users' sockets. That
includes sockets in other netns that were delegated the same device.

The commit message acknowledges this ("users should avoid presenting PSP
devices to users they don't trust to abuse this"). In the main netns,
though, every local user can reach the device. Nothing later in the
series appears to change these paths.

Is a cap on the deferred queue length, or a per-socket rate limit,
needed before SADB rekey is allowed?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118-psp-v5-0-b9ec840e0296%40gmail.com
