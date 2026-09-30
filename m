Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7174E39C657;
	Wed, 30 Sep 2026 03:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790740345; cv=none; b=SLDEy8jN0Ya/BjRpXanLH8C1bT+Xg7HmaGP0hO9erahlDsdCy4bYvt3fyhEjLNn40F7lWolz1N7sQoJBxUzqX9xisK7Do+xpv/70oyNKQGN5QPaVWuEmXUnfHf7htmAIamlbAyTPbPC2XkzFo3Tfzx2FiaWooAroif7swSU7wHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790740345; c=relaxed/simple;
	bh=UuNXPGBLpIKfaZhSZgnggv0bl/B49zvjstr72vtxk9w=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=t1c4c+DHkIKTOqHm0R7DtXBC/M9LnZ5yHYyGUNo03cQMsfchdPmdjGBtPSuGEGVjFFOmXhpNkW4yJvZyinx7A5JyXJYBHzvWaMMyq6iCzc+eOfJIecyxGLBcSPHyAedNDzcHU6p/TAV03Zq3dC+kp87B7EKPFm90/8vYV3mu70E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mVlnf78L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mVlnf78L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98BB91F000FF;
	Wed, 30 Sep 2026 03:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790740344;
	bh=LDCef2ZrQIA1ANH641ejY76T8PtvFvddxBQ3hNBYUds=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=mVlnf78LwlPGD7U/fjchquRJnL/2geGGvCQNa6nYb6hiWNacZS66ReqOL7UC9xUaE
	 IttlHUT+1OmJeY++2u4nWVcjVxQdIMpMYZv9XHD6yXToxVkoSyDsgpLyXiKGfLq+UQ
	 GmV26pi8TDU+aOj4qVivngUNRFn8ZjRs6bRkge+HENhIzM3JEhEvyxf8gB0x3Peqwz
	 cp07aATuDTawyU9PpA/JNzWs2wcAsRM2zgWGefST3GkUmk0vGXOwwLmduRM7V8xOnT
	 Gn0OwMmtFSrdAC7RrHTxxefitZ8IT376BF2fkfqVOs8co6Az8xBjGjaZQbENWQHt5i
	 j17BI+3bImzDw==
Subject:
 Re: [PATCH net-next v3 5/6] vxlan: vnifilter: account per-VNI memory to memcg
From: netdev-bot+sashiko@kernel.org
To: alishmery18@gmail.com
Cc: netdev@vger.kernel.org, idosch@nvidia.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, edumazet@google.com,
 andrew+netdev@lunn.ch, horms@kernel.org, razor@blackwall.org,
 roopa@nvidia.com, shuah@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Wed, 30 Sep 2026 03:52:23 +0000
Message-ID: <179074034317.434549.11265028313535602829@kernel.org>
In-Reply-To: <20260927215209.2581830-6-alishmery18@gmail.com>
References: <20260927215209.2581830-6-alishmery18@gmail.com>
X-sashiko-severity: High
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

Critical: 0 · High: 1 · Medium: 0 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The per-VNI accounting in commit "vxlan: vnifilter: account per-
  VNI memory to memcg" is incomplete, and its commit message overstates…
- [Low] The commit message credits commit c948f51c1654 ("memcg: enable
  accounting for net_device and Tx/Rx queues") with making "a…

--

vxlan: vnifilter: account per-VNI memory to memcg

This commit changes the struct vxlan_vni_node allocation and its per-CPU
stats block in vxlan_vni_alloc() from GFP_KERNEL to GFP_KERNEL_ACCOUNT.
Per-VNI memory added through the vnifilter netlink interface is then
charged to the caller's memcg.

> A netdevice's own
> queues, ethtool state and NAPI config are already GFP_KERNEL_ACCOUNT in
> alloc_netdev_mqs() (commit c948f51c1654 ("memcg: enable accounting for
> net_device and Tx/Rx queues")), so these per-VNI allocations are the
> unaccounted part of a device that a cgroup can grow one VNI at a time.

[Severity: Low]
Is this attribution accurate? Commit c948f51c1654 seems to change only
three allocations to GFP_KERNEL_ACCOUNT:

- the rx queues in netif_alloc_rx_queues()
- the tx queues in netif_alloc_netdev_queues()
- the net_device itself in alloc_netdev_mqs()

The accounted allocations of dev->ethtool, dev->cfg and dev->napi_config
in alloc_netdev_mqs() came from later commits:

net/core/dev.c:alloc_netdev_mqs() {
    ...
	dev->ethtool = kzalloc_obj(*dev->ethtool, GFP_KERNEL_ACCOUNT);
    ...
	dev->cfg = kzalloc_obj(*dev->cfg, GFP_KERNEL_ACCOUNT);
    ...
	dev->napi_config = kvzalloc(napi_config_sz, GFP_KERNEL_ACCOUNT);
    ...
}

Could the reference be corrected?

> diff --git a/drivers/net/vxlan/vxlan_vnifilter.c b/drivers/net/vxlan/vxlan_vnifilter.c
> index 92ea1fc94f458..3087877ed1cb9 100644
> --- a/drivers/net/vxlan/vxlan_vnifilter.c
> +++ b/drivers/net/vxlan/vxlan_vnifilter.c
> @@ -711,10 +711,11 @@ static struct vxlan_vni_node *vxlan_vni_alloc(struct vxlan_dev *vxlan,
>  {
>  	struct vxlan_vni_node *vninode;
>  
> -	vninode = kzalloc_obj(*vninode);
> +	vninode = kzalloc_obj(*vninode, GFP_KERNEL_ACCOUNT);
>  	if (!vninode)
>  		return NULL;
> -	vninode->stats = netdev_alloc_pcpu_stats(struct vxlan_vni_stats_pcpu);
> +	vninode->stats = __netdev_alloc_pcpu_stats(struct vxlan_vni_stats_pcpu,
> +						   GFP_KERNEL_ACCOUNT);

[Severity: High]
Is the per-VNI accounting complete? The commit message calls these two
allocations "the unaccounted part of a device that a cgroup can grow one
VNI at a time".

However, vxlan_vni_add(), the only caller, then creates a default FDB
entry for each VNI that has a remote address:

vxlan_vni_add()
  vxlan_vni_alloc()                 <- now accounted
  vxlan_vni_update_group(..., create=true, ...)
    vxlan_update_default_fdb_entry()
      spin_lock_bh(&vxlan->hash_lock)
      vxlan_fdb_update(..., NLM_F_APPEND | NLM_F_CREATE, ...)
        vxlan_fdb_create()
          vxlan_fdb_alloc()
          vxlan_fdb_append()

In vxlan_vni_update_group(), the remote address is the per-VNI group. If
no group is given and the device has a default remote, it is
vxlan->default_dst.remote_ip.

None of the allocations on that path are accounted:

drivers/net/vxlan/vxlan_core.c:vxlan_fdb_alloc() {
    ...
	f = kmalloc_obj(*f, GFP_ATOMIC);
    ...
}

drivers/net/vxlan/vxlan_core.c:vxlan_fdb_append() {
    ...
	rd = kmalloc_obj(*rd, GFP_ATOMIC);
    ...
	dst_cache_init(&rd->dst_cache, GFP_ATOMIC | __GFP_NOWARN);
    ...
}

The dst_cache_init() call makes a per-CPU allocation of struct
dst_cache_pcpu. Per CPU, that is about the same size as the
vxlan_vni_stats_pcpu block this patch now charges.

vxlan_fdb_create() only enforces cfg.addrmax when it is non-zero, and it
defaults to 0. A task with CAP_NET_ADMIN in its own netns might be inside
a user namespace, for example.

Could such a task still add VNIs one at a time and pin slab and per-CPU
memory that is never charged to its memcg?

vxlan_fdb_alloc() and vxlan_fdb_append() are also used by vxlan_snoop()
learning in softirq context. Charging current would be wrong there, so
any accounting would have to be limited to the netlink-driven create
path, for example by using GFP_ATOMIC | __GFP_ACCOUNT only there. No
later patch in this series seems to touch drivers/.

If extending the accounting isn't planned, could the commit message be
narrowed to what the patch actually covers?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260927215209.2581830-1-alishmery18%40gmail.com
