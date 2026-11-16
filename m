Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794807173;
	b=CZ1y9GeOQd+WvlO6LyMPuo9d92SjHFcWq4MDyYJsjIQ74mjgS34DpGfpFZm/PQS2F+am
	 OhVgTuzd9a5ByI1RtxfMvulnC17Vd+2wR40GatxvbM4clWtVo0jj8JgoZX54zEk+bGUYy
	 d4NDCofzWcmzGkmfGWShdJpftC8ip43sjfyOAxPaP5KwRbsC9JvAvNmg/IVXOclhjjq1K
	 cBMTzjw8lANa9oTA7WSUg5/ZyHC/H2N6q0BmZ5Elo+pXU5HwRQ78TjQqQ8IqS1eM8kVgd
	 sIoH/FwA+faiUPBMglYFgAlyLGUDOiEGLxcjRSBGGPnrVAdFZYT1JWuWFy4ZmvP/WEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794807173;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=douqLaofwr9UvuTKqzhW38JwSiM5sayiSfiJVWEbrBY=;
	b=bmcgtFKWnu3bKpeusgNZhB4PN/3rk+ZZAuQbft8Qh9k4Rgn5HqqgEygz8WhJlzwNm25P
	 uKR5HgP82BmGeoVYr4hH5yjtpTODGbQsDL0kXt/MDiZIOym982CU2fUBeMD4H/lX5gz73
	 ap7SgGcW3uai5i+Vf184izWkUhl2sJxbGLoEraC0NixtPeKymxZsFUGWALInbqOeBJske
	 6Ugpi/pXt8ymoSxynJYdZU5rbJRS8YfZmqokF9/iBFICe7DyjFdGyDq25BNSYRGR04p6l
	 fSLS8wUywapLgYkAw9WI/yhCAkzJnvhaTvcY73c6aHU+xCKOtHe7p5MRK2VBVpbZyfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bGvOsCif;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E5F606A33A;
	Mon, 16 Nov 2026 05:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bGvOsCif
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA5DC1F000C4;
	Mon, 16 Nov 2026 05:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794807172;
	bh=douqLaofwr9UvuTKqzhW38JwSiM5sayiSfiJVWEbrBY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=bGvOsCifrc5y5Ypj5DriWtJWjDaVh/uS6DScPAEpIM0zVVeRqcvPFV4JQzqU4+kfH
	 Pq0REHu1/h8PwGh5+Zng1KSEX6XnCmMj9daUofYWbiHAqtftw4FbKZDNvK5muuPm72
	 CC3QRCImYoEyOnKUjV7Eh010yPLs4YNPHy+lT0PXKDS7nIoMlOJsVssT5Xlngwdi3j
	 8QPbaikk+FkCEisiy6BXJstUEfp6/IOc/nwsO8dqm7uI4xKNrj/lmr/giSDTFNHe0n
	 vIo9zu1Q1HXrHQpvAEUwakBJmunxvRpc9NlqYAghMRyx4/7iylVgOz7kZ534N/CWBy
	 J2JMwcvyQxKYA==
Subject: Re: [PATCH net-next v5 5/8] vxlan: leave FDB state and flags
 unchanged when an update fails
From: netdev-bot+sashiko@kernel.org
To: alishmery18@gmail.com
Cc: netdev@vger.kernel.org, idosch@nvidia.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, edumazet@kernel.org,
 andrew+netdev@lunn.ch, horms@kernel.org, razor@blackwall.org,
 roopa@nvidia.com, kuniyu@google.com, petrm@nvidia.com, aroulin@nvidia.com,
 shuah@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Mon, 16 Nov 2026 05:32:51 +0000
Message-ID: <179480717141.3136.11745110042567184221@kernel.org>
In-Reply-To: <20261114221412.255825-6-alishmery18@gmail.com>
References: <20261114221412.255825-6-alishmery18@gmail.com>
X-sashiko-severity: High
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

Critical: 0 · High: 1 · Medium: 0 · Low: 1 (2)

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] On the switchdev-veto exit, vxlan_fdb_update_existing()
  (drivers/net/vxlan/vxlan_core.c) still publishes the requested state…
- [Low] The patch fixes a bug userspace can trigger, carries four Fixes:
  tags (6681712d67ee, 906dc186e020, 61f46fe8c646, 1274e1cc4226), and is…

Pre-existing issues:
- [Low] When a switchdev driver vetoes the update,
  vxlan_fdb_update_existing() restores f->state and f->flags at…
- [Low] The comment the patch adds in vxlan_fdb_update_existing() (lines
  1038-1042) says the ageing timer reads f->state and f->flags without…

--

vxlan: leave FDB state and flags unchanged when an update fails

This commit moves the state and flags write in vxlan_fdb_update_existing()
so that it comes after the nexthop update, the non-unicast replace check
and the NLM_F_APPEND allocation. A request refused at any of those steps
no longer changes the entry. When a switchdev driver vetoes the
notification, the saved state and flags are written back.

> The patch "vxlan: vnifilter: account the default FDB entry to memcg"
> later in this series makes the NLM_F_APPEND allocation fail routinely
> at a memory cgroup limit, on the path that changes a vnifilter VNI's
> default entry; this is ordered before it so that failure leaves the
> entry as it was. Like the rest of the series it targets net-next.

[Severity: Low]
This isn't a bug, but could this patch go to net instead of net-next?

It carries four Fixes: tags. The bug it fixes is in released kernels and
userspace can trigger it: a refused RTM_NEWNEIGH, such as an NLM_F_REPLACE
of the all-zeros entry with NUD_REACHABLE that gets -EOPNOTSUPP, leaves the
entry dynamic, and vxlan_cleanup() then ages it out.

The dependency on the memcg patch only goes one way. The earlier patches in
the series don't touch drivers/net/vxlan/vxlan_core.c, so this one looks
like it applies on its own. The rest of the series could still follow in
net-next.

The series notes that net-next was suggested for the related "vxlan:
vnifilter: roll back a VNI add that fails" fix, so this may be the
maintainers' call.

> diff --git a/drivers/net/vxlan/vxlan_core.c b/drivers/net/vxlan/vxlan_core.c
> index d11028b374721..2303d652d3968 100644
> --- a/drivers/net/vxlan/vxlan_core.c
> +++ b/drivers/net/vxlan/vxlan_core.c

[ ... ]

> @@ -1048,6 +1035,23 @@ static int vxlan_fdb_update_existing(struct vxlan_dev *vxlan,
>  		notify |= rc;
>  	}
>  
> +	/* Do not allow an externally learned entry to take over an entry added
> +	 * by the user. The state and flags are written only after the steps
> +	 * above that can fail, so that a request they refuse never changes
> +	 * them, not even briefly: the ageing timer reads them without the lock.
> +	 */
> +	if (!(fdb_flags & NTF_EXT_LEARNED) ||
> +	    !(f->flags & NTF_VXLAN_ADDED_BY_USER)) {
> +		if (f->state != state) {
> +			f->state = state;
> +			notify = 1;
> +		}
> +		if (f->flags != fdb_flags) {
> +			f->flags = fdb_flags;
> +			notify = 1;
> +		}
> +	}

[Severity: High]
Can a request that a switchdev driver vetoes still get a permanent entry
aged out? On the veto path, the new state and flags are still written into
the live entry before vxlan_fdb_notify(). They only get their old values
back at err_restore.

vxlan_cleanup() reads them without hash_lock. Once it decides the entry has
expired, the only thing it rechecks under the lock is hlist_unhashed():

drivers/net/vxlan/vxlan_core.c:vxlan_cleanup() {
    ...
		if (f->state & (NUD_PERMANENT | NUD_NOARP))
			continue;

		if (f->flags & NTF_EXT_LEARNED)
			continue;
    ...
		timeout = READ_ONCE(f->updated) + cfg->age_interval * HZ;
		if (time_before_eq(timeout, jiffies)) {
			spin_lock(&vxlan->hash_lock);
			if (!hlist_unhashed(&f->fdb_node)) {
				...
				f->state = NUD_STALE;
				vxlan_fdb_destroy(vxlan, f, true, true);
			}
    ...
}

Take a NUD_PERMANENT entry whose f->updated is older than age_interval, and
a request that makes it dynamic and then gets vetoed:

CPU1 (hash_lock held)
vxlan_fdb_update_existing()
  f->state = state;
                                  CPU2
                                  vxlan_cleanup()
                                    sees f->state without NUD_PERMANENT
                                    sees the old, expired f->updated
                                    spin_lock(&vxlan->hash_lock) waits
  WRITE_ONCE(f->updated, jiffies);
  vxlan_fdb_notify() is vetoed
  f->state = old_state;
  hash_lock released
                                    hlist_unhashed() is false
                                    vxlan_fdb_destroy()

On x86 the window is the gap between the f->state store and
WRITE_ONCE(f->updated). On arm64 or powerpc nothing orders the plain
f->state load against READ_ONCE(f->updated), so the window could span the
whole notifier call.

Flags have the same window. A vetoed user request on an NTF_EXT_LEARNED
entry clears NTF_EXT_LEARNED for a moment.

An in-tree driver can veto. mlxsw_sp_switchdev_event() returns NOTIFY_BAD
in two cases:

- mlxsw_sp_switchdev_vxlan_work_prepare() rejects the remote, for example
  an NLM_F_REPLACE that changes the remote port and the state together.
- Its GFP_ATOMIC allocation fails.

The commit message says:

    The switchdev notification reports the new state, so it still
    follows the write

Is that accurate for the state? vxlan_fdb_switchdev_notifier_info() takes
only this field from the entry:

	fdb_info->added_by_user = fdb->flags & NTF_VXLAN_ADDED_BY_USER;

It never reads fdb->state. Only the rtnl part, __vxlan_fdb_notify(), needs
the new state, and it runs after the switchdev call.

Would either of these work instead?

- Make the switchdev call before the new state is written.
- Recheck state, flags, nh and updated under hash_lock in vxlan_cleanup().

The second would also close the race with a successful update that the
commit message leaves open. Nothing later in the series touches this code
or vxlan_cleanup().

> +
>  	if (ndm_flags & NTF_USE)
>  		WRITE_ONCE(f->updated, jiffies);

[Severity: Low]
This isn't a bug introduced by this patch, but the new comment says the
ageing timer reads f->state and f->flags without the lock, and the stores
above are plain.

f->updated is written with WRITE_ONCE() here, and vxlan_cleanup() reads it
with READ_ONCE(). f->state and f->flags are read there with plain loads.

Should f->state and f->flags also use WRITE_ONCE() and READ_ONCE()? As
written, KCSAN would report these accesses as data races, and the patch
adds two more plain stores at err_restore.

> @@ -1066,13 +1070,17 @@ static int vxlan_fdb_update_existing(struct vxlan_dev *vxlan,
>  
>  err_notify:
>  	if (nhid)
> -		return err;
> +		goto err_restore;
>  	if ((flags & NLM_F_REPLACE) && rc)
>  		*rd = oldrd;
>  	else if ((flags & NLM_F_APPEND) && rc) {
>  		list_del_rcu(&rd->list);
>  		call_rcu(&rd->rcu, vxlan_dst_free);
>  	}
> +err_restore:
> +	/* The notification was vetoed: put back the state and flags. */
> +	f->state = old_state;
> +	f->flags = old_flags;

[Severity: Low]
This is a pre-existing issue, but f->updated isn't restored here. It is set
to jiffies before vxlan_fdb_notify(), both in the notify block and when
NTF_USE is set.

So a vetoed request still refreshes the ageing timestamp. Userspace can see
that through NDA_CACHEINFO, and a dynamic entry gets up to one more
age_interval.

Should f->updated also be put back on a veto? The old code did the same
thing, and the commit title only covers state and flags.

Separately, the nhid branch of err_notify looks unreachable.
first_remote_rtnl() returns NULL when f->nh is set, so vxlan_fdb_notify()
never makes the switchdev call for nexthop entries.

>  	return err;
>  }

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261114221412.255825-1-alishmery18%40gmail.com
