Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB2D4AB1A5;
	Sun, 18 Oct 2026 13:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792329396; cv=none; b=NLJsm5XL5+9+uihZ++1bqrC3DGl5Hx5gPmfWLGI9j3LNRWKVnFmBWXKNOFAJDP5hw2wYHq9g1xTOK4bkCiYBixUVelBV5hisFLCA9DZ2v9SBcIjs1Ngq03jlNrUxFuFH4uYFidwSgQ3CSr85p/18kDRIxgwPpNGb6XSryVDuzpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792329396; c=relaxed/simple;
	bh=1+HWnnDgEOwEowv1a4wBOBszBOt4XiehRFUqDLSbF4Q=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GTIl+38FUC+30pQD1PbQZZgHCwZ7CEfuNNhGOzHU9DeT+SghRNvK9BJ+gQId+fbPytAa1NpTD3mJ7bxIFxdme+y58F7gSV8BprGqNNsJVj3QX6glk7OcZa3I+W2IFCofwRHVNDV0xKkXZcvC0FDDdwTyFvHLabtCGQOOyAPkJao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IEe63DEl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IEe63DEl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 428BC1F000C4;
	Sun, 18 Oct 2026 13:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792329394;
	bh=VII/o3W3dI01GUse5I8KzJFkp5bYKlieMuVE2DmeSc8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=IEe63DElslU3kQFBPJNKMJfd8/GIrOxqw4gmy4U+Cz1Yioeeo7TD5YPdmM8G9kAOM
	 Jz4HjkbQlcFbkClZWAK8lu4op9Q+69G7CxO0jAzQWClYnByqq0c2MF9yZa/Qi+3muF
	 h2vc9H3aGiDeD5w/qUY+uy/YahrFniR1/JM8yaFeUzr4eIc1kP1Y/oHTcQFzmkThGw
	 hsk5+Tx4+1vwVxymM9sw4nl483MisO3oPs8TyKoRo1EGZZswUDyt8ZT1K1ZCXdpGoJ
	 WC3WMX2vXt33AAi/ahpiIt8gP81EYQW8J9TkTQIk4aHCHxfKObPqZvlr6M49oNcRPV
	 lNpbjlcUZQPSQ==
Subject: Re: [PATCH net-next v4 6/7] vxlan: vnifilter: account the default FDB
 entry to memcg
From: netdev-bot+sashiko@kernel.org
To: alishmery18@gmail.com
Cc: netdev@vger.kernel.org, idosch@nvidia.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, edumazet@google.com,
 andrew+netdev@lunn.ch, horms@kernel.org, razor@blackwall.org,
 roopa@nvidia.com, shuah@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Sun, 18 Oct 2026 13:16:33 +0000
Message-ID: <179232939385.3135.13264598705207281518@kernel.org>
In-Reply-To: <20261014123814.388557-7-alishmery18@gmail.com>
References: <20261014123814.388557-7-alishmery18@gmail.com>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 (1) · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] This patch adds a deliberate, deterministic -ENOMEM to the VNI
  create path: vxlan_vni_update_group() calls…
- [Low] Commit message inaccuracy.
- [Low] In vxlan_fdb_update_existing() (drivers/net/vxlan/vxlan_core.c),
  f->state and f->flags are overwritten before vxlan_fdb_append(), which…

Pre-existing issues:
- [Medium] This problem wasn't introduced by this patch, but the
  RTM_NEWNEIGH path vxlan_fdb_add() still allocates the same objects…

--

vxlan: vnifilter: account the default FDB entry to memcg

This patch adds a gfp_t argument to vxlan_fdb_update() and
vxlan_update_default_fdb_entry(). The argument is passed down to the
struct vxlan_fdb, struct vxlan_rdst and dst_cache allocations. The
per-VNI RTM_NEWTUNNEL path uses GFP_NOWAIT | __GFP_ACCOUNT, the
device-wide RTM_NEWLINK walk uses GFP_ATOMIC | __GFP_ACCOUNT, and all
other callers keep GFP_ATOMIC.

> diff --git a/drivers/net/vxlan/vxlan_core.c b/drivers/net/vxlan/vxlan_core.c
> index 278d41f58d895..7991b544af5a4 100644
> --- a/drivers/net/vxlan/vxlan_core.c
> +++ b/drivers/net/vxlan/vxlan_core.c

[ ... ]

> @@ -1047,7 +1047,8 @@ static int vxlan_fdb_update_existing(struct vxlan_dev *vxlan,
>  	if ((flags & NLM_F_APPEND) &&
>  	    (is_multicast_ether_addr(f->key.eth_addr) ||
>  	     is_zero_ether_addr(f->key.eth_addr))) {
> -		rc = vxlan_fdb_append(f, ip, port, vni, ifindex, &rd);
> +		rc = vxlan_fdb_append(f, ip, port, vni, ifindex, &rd,
> +				      gfp);
>  
>  		if (rc < 0)
>  			return rc;

[Severity: Low]
The vnifilter change path now passes GFP_NOWAIT | __GFP_ACCOUNT, so this
append can fail once the memcg is at its limit. By that point,
vxlan_fdb_update_existing() has already overwritten f->state and f->flags:

	if (!(fdb_flags & NTF_EXT_LEARNED) ||
	    !(f->flags & NTF_VXLAN_ADDED_BY_USER)) {
		if (f->state != state) {
			f->state = state;
			notify = 1;
		}
		if (f->flags != fdb_flags) {
			f->flags = fdb_flags;
			notify = 1;
		}
	}

On the vxlan_vni_update_group(create=false) ->
vxlan_update_default_fdb_entry() path, fdb_flags is NTF_SELF without
NTF_EXT_LEARNED. So the existing all-zeros entry always has its state and
flags reset. For example, a user-set NTF_VXLAN_ADDED_BY_USER is dropped.

If vxlan_fdb_append() then returns -ENOMEM, the return rc path does not
restore these fields, and no RTM_NEWNEIGH is sent.

Could the state/flags update move to after a successful append, or be
rolled back here? This ordering is older than this patch, but the failure
is now deterministic. The commit message also says "no established FDB
state is destroyed", which doesn't quite hold for these fields.

[ ... ]

> @@ -1287,7 +1289,7 @@ static int vxlan_fdb_add(struct ndmsg *ndm, struct nlattr *tb[],
>  	err = vxlan_fdb_update(vxlan, addr, &ip, ndm->ndm_state, flags,
>  			       port, src_vni, vni, ifindex,
>  			       ndm->ndm_flags | NTF_VXLAN_ADDED_BY_USER,
> -			       nhid, true, extack);
> +			       nhid, true, extack, GFP_ATOMIC);
>  	spin_unlock_bh(&vxlan->hash_lock);

[Severity: Medium]
This isn't a bug introduced by this patch, but this RTM_NEWNEIGH path
still allocates the same struct vxlan_fdb, struct vxlan_rdst and per-CPU
dst_cache without charging them to a memcg.

With NLM_F_APPEND on the all-zeros MAC or a multicast MAC, each distinct
(ip, port, vni, ifindex) adds a new rdst plus dst_cache:

vxlan_fdb_add()
  vxlan_fdb_update(..., GFP_ATOMIC)
    vxlan_fdb_update_existing()
      vxlan_fdb_append()

This path never reaches the cfg->addrmax check in vxlan_fdb_create(). A
task with CAP_NET_ADMIN in the netns can keep growing this memory
uncharged, including by appending to the vnifilter default entries that
this patch now charges.

The commit message limits the scope to vnifilter, so this may be planned
as a follow-up. Would it make sense to account this path as well?

[ ... ]

> @@ -4652,7 +4656,8 @@ static int vxlan_changelink(struct net_device *dev, struct nlattr *tb[],
>  							       &cfg->remote_ip,
>  							       conf.remote_ifindex,
>  							       cfg->remote_ifindex,
> -							       NULL);
> +							       NULL,
> +							       GFP_ATOMIC | __GFP_ACCOUNT);
>  				if (lowerdev_changed)
>  					netdev_adjacent_change_abort(vxlan->lowerdev,
>  								     lowerdev, dev);

[Severity: Low]
The commit message says:

  The device-wide default-remote change (RTM_NEWLINK, via
  vxlan_vnilist_update_group()) keeps GFP_ATOMIC | __GFP_ACCOUNT.
  ...
  here it stays force-charged, as before this series, and is charged to
  the task issuing the RTM_NEWLINK.

Before this patch, vxlan_fdb_alloc() and vxlan_fdb_append() hard-coded
GFP_ATOMIC without __GFP_ACCOUNT, so nothing on the
vxlan_vnilist_update_group() walk was charged. Isn't the accounting, and
the force-charging, new behaviour added by this patch rather than kept?

The message also doesn't mention this vxlan_changelink() rollback call,
which now gets GFP_ATOMIC | __GFP_ACCOUNT. The rollback re-creates the
conf.vni default entry as accounted. vxlan_dev_create() and the forward
vxlan_fdb_update() call in vxlan_changelink() create the same kind of
entry unaccounted. Is that inconsistency intended?

[ ... ]

> diff --git a/drivers/net/vxlan/vxlan_vnifilter.c b/drivers/net/vxlan/vxlan_vnifilter.c
> index 4a631fcdf23ab..4b43674cceff0 100644
> --- a/drivers/net/vxlan/vxlan_vnifilter.c
> +++ b/drivers/net/vxlan/vxlan_vnifilter.c

[ ... ]

> @@ -636,7 +637,8 @@ static int vxlan_vni_update_group(struct vxlan_dev *vxlan,
>  					     oldrip, newrip,
>  					     cfg->remote_ifindex,
>  					     cfg->remote_ifindex,
> -					     extack);
> +					     extack,
> +					     GFP_NOWAIT | __GFP_ACCOUNT);
>  	if (ret)
>  		goto out;

[Severity: High]
With GFP_NOWAIT | __GFP_ACCOUNT, try_charge_memcg() fails without reclaim
once the memcg is at its limit. That means this call can now routinely
return -ENOMEM on the create path. Does vxlan_vni_add() handle that
failure?

By the time vxlan_vni_update_group() runs, the node is already published:

drivers/net/vxlan/vxlan_vnifilter.c:vxlan_vni_add() {
    ...
	err = rhashtable_lookup_insert_fast(&vg->vni_hash,
					    &vninode->vnode,
					    vxlan_vni_rht_params);
    ...
	__vxlan_vni_add_list(vxlan, vg, vninode);

	if (vxlan->dev->flags & IFF_UP)
		vxlan_vs_add_del_vninode(vxlan, vninode, false);

	err = vxlan_vni_update_group(vxlan, vninode, group, true, &changed,
				     extack);

	vxlan_vnifilter_notify(vxlan, vninode, RTM_NEWTUNNEL);

	return err;
}

On failure, goto out skips recording vninode->remote_ip and skips the
IGMP join. The node still stays in vni_hash, vni_list and the socket VNI
hash. RTM_NEWTUNNEL is sent anyway, while the requester gets -ENOMEM. The
VNI then receives traffic but has no default all-zeros FDB entry.

Suppose the request is retried without a group while cfg->remote_ip is
set. vxlan_vni_add() finds the node and calls vxlan_vni_update() ->
vxlan_vni_update_group(create=false). old_remote_ip is still any, so
oldrip and newrip both point at &cfg->remote_ip, and this check returns 0:

	if (!create && oldrip && newrip && vxlan_addr_equal(oldrip, newrip))
		return 0;

Wouldn't the retry report success without ever installing the default FDB
entry? Deleting and re-adding the VNI seems to be the only way to recover.

For a range add, vxlan_vni_add_del() also stops at the first error. The
failing VNI and all VNIs added before it stay installed.

The missing unwind in vxlan_vni_add() predates this patch. It was hard to
hit while GFP_ATOMIC forced the charge through. The commit message says:

  The failure
  is clean -- the new entry is allocated before the old is freed, so an
  add that fails leaves the existing entry intact and returns the error;
  no established FDB state is destroyed and no false success is returned.
  Creating a VNI is gated the same way by the previous patch's node and
  stats (GFP_KERNEL_ACCOUNT, hard-bounded).

Should vxlan_vni_add() unlink and free the node, and skip the
notification, when vxlan_vni_update_group() fails, before this path
switches to GFP_NOWAIT?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261014123814.388557-1-alishmery18%40gmail.com
