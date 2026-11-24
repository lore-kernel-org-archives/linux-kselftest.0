Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795535796;
	b=oLELV17Sqtr7P5PJgVa9yguR7+t300+tjmUHtoyv3xUahfCibo3XMExgn6OnDqX8D16g
	 QUsA7wSFtZ7FrAaiH8JDdK942bkvOrbnLPqEuUJLf3H56P3UL/+j4QpIHyYBGlJnZOjfb
	 W7TvbZG3vstqtzUiadvJYHY4er/3nT7EOjkMCJx46we69xsk4aC3dKjWVmbqeS4YzW05c
	 Xjc8NRW1+9SJ96AMtnFyCu1akZMNFM/j0MU688OdcLwfU7ew5ZGRuv6qLlMfj2UJBg5iL
	 fxpPpBFVSpTS9YMma/zN7CR1COWc3yQGDW0n1kkTVpf/ru7on6qk087FHDMKRWkia5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795535796;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=cp9qvJzAYDDQdk38T0+e5AQe8omtVBjXWGNOkDO7CrY=;
	b=GGVPYO82lLwvAUtkXx/A2k/u0aeNJaTLcH3gePzM6HysVa/WK/5HZzHJx8yUBpq2qndw
	 ot32Y7FkJKQUH2BBo7pLVNLcmgVeQiN2Oj+SemaJ2Ii8QJm4BP5bcl/aEOwUgNDAJfILZ
	 86EVbGV4U1ke+SgV/A3etMQPnfjgoDUOGanpmK4eKylDebqlnnjTGXtt3wPhaoYvfqROu
	 oyNhIth9+cEoTtm0aOj6LCaZ96Kb6Rawa9d6cWLS9IarUQT+99Lw2cCbPiSC5mPSZ+vKH
	 RBWH2amsFLXL8yOfJZCfo5kQj2Y/I2jxy/R4wnelrvyjvVdGHVZNDvhEN0YYtxxgxcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j0t+J8Ce;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE06606A327;
	Tue, 24 Nov 2026 15:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j0t+J8Ce
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C2BB1F000D4;
	Tue, 24 Nov 2026 15:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795535795;
	bh=cp9qvJzAYDDQdk38T0+e5AQe8omtVBjXWGNOkDO7CrY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=j0t+J8CeRganGFdwxySeSsw/MNGzMiwH6I3Hgz25CS/gZceM5Lnth6f9FvgGq12S9
	 xmci9Ar3KEedv7ftTaHvxdjR+3G3XnqfDNzJpzBRFILLIPKGdGs7893MNC9PIKyBFu
	 D3Lk/ot7c9qA+dkNbQdh8dwRBbv3reLCvmPl1tj0TG9Ecb7QIvTFRKp6MbIhKybvq+
	 p0cMqhgPGRhE5x6zpvt0i8nTitPYKB7+Yewje64KugW3xdUjD10l5LrkRf5nOK4Kjz
	 nHsA0Zy85f05PSNw0q9f8BnXGhZYyXdPog+44fbEUFm5oANQ5CSShY66FFrICXmJ/8
	 HzzLFzrY6/1qA==
Subject: Re: [PATCH net v8 1/2] genetlink: Reject joining multicast groups no
 family owns
From: netdev-bot+sashiko@kernel.org
To: anilkaushikwireless@gmail.com
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, idosch@nvidia.com,
 nicolas.dichtel@6wind.com, jacob.e.keller@intel.com, jiri@resnulli.us,
 fw@strlen.de, martineau@kernel.org, v3rdant.xiang@gmail.com,
 aliceryhl@google.com, linux-kernel@vger.kernel.org, nhorman@tuxdriver.com,
 shuah@kernel.org, linux-kselftest@vger.kernel.org
Date: Tue, 24 Nov 2026 15:56:34 +0000
Message-ID: <179553579407.3135.13476478403966318528@kernel.org>
In-Reply-To: <20261123155503.2497063-2-anilkaushikwireless@gmail.com>
References: <20261123155503.2497063-2-anilkaushikwireless@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] Check-then-act race (TOCTOU) between the ownership/capability
  check in genl_bind() and the point where af_netlink sets the…

--

genetlink: Reject joining multicast groups no family owns

With this commit, genl_bind() returns -ENOENT when no genetlink family
owns the requested multicast group. Unprivileged users can then no longer
join free group IDs that a privileged family takes later. netlink_bind()
skips such IDs in a bind() mask instead of failing, and
setsockopt(NETLINK_ADD_MEMBERSHIP) returns the error.

Link: https://lore.kernel.org/netdev/179324692107.3134.14443689892607921337@kernel.org/

> diff --git a/net/netlink/genetlink.c b/net/netlink/genetlink.c
> index 5cc1037d4917e..e5d4f3c4e22ac 100644
> --- a/net/netlink/genetlink.c
> +++ b/net/netlink/genetlink.c

[ ... ]

> @@ -1825,7 +1827,7 @@ static int genl_bind(struct net *net, int group)
>  {
>  	const struct genl_family *family;
>  	unsigned int id;
> -	int ret = 0;
> +	int ret = -ENOENT;
>  
>  	down_read(&cb_lock);
>  
> @@ -1841,6 +1843,7 @@ static int genl_bind(struct net *net, int group)
>  			continue;
>  
>  		grp = &family->mcgrps[i];
> +		ret = 0;
>  		if ((grp->flags & GENL_MCAST_CAP_NET_ADMIN) &&
>  		    !ns_capable(net->user_ns, CAP_NET_ADMIN))
>  			ret = -EPERM;

[Severity: Medium]
The commit message says "This does not cover a family that is
unregistered between the check and the point where the membership bit is
set."

Can that window still leave a socket as a member of a group ID that no
family owns? That is the state this patch is meant to prevent.

genl_bind() decides ownership under down_read(&cb_lock). It then drops
cb_lock and returns 0. The caller sets the bit later, and holds only
netlink_table_grab() when it does:

netlink_bind()
    err = nlk->netlink_bind(net, group + 1);  /* cb_lock taken, dropped */
    ...
    netlink_table_grab();
    ...
    nlk->groups[0] = (nlk->groups[0] & ~0xffffffffUL) | groups;

netlink_setsockopt(NETLINK_ADD_MEMBERSHIP) follows the same pattern
through netlink_update_socket_mc().

One possible interleaving:

CPU0                              CPU1
bind() to group X of family F
  genl_bind() returns 0
  up_read(&cb_lock)
                                  genl_unregister_family(F)
                                    genl_lock_all()
                                    genl_unregister_mc_groups()
                                      __netlink_clear_multicast_users(X)
                                        /* CPU0 bit not set yet */
                                      clear_bit(X, mc_groups)
                                    idr_remove()
  netlink_table_grab()
  sets bit X in nlk->groups

After this, the socket is a member of X and X has no owner.

A later family G can be given X by find_first_zero_bit() in
genl_allocate_reserve_groups(). An unprivileged user can trigger that
registration with CTRL_CMD_GETFAMILY -> request_module().

Nothing checks the socket again. It would get G's notifications even when
the group has GENL_MCAST_CAP_NET_ADMIN or GENL_MCAST_CAP_SYS_ADMIN set.

The unregister side usually needs a privileged rmmod, but an unprivileged
user can keep calling bind() until an admin unloads a module.

Module init error paths, such as ila_init(), seg6_init() and fou_init(),
can also unregister a family. That can happen after a request_module()
the attacker triggered, if init fails partway.

There is also a side effect. F->bind(i) ran for the old family, but on
close genl_unbind() would call G->unbind(i). The family bind and unbind
callbacks could then get out of balance.

Could this be closed fully? One option is to recheck ownership, or a
registration generation, under netlink_table_grab() before setting the
bit. Another is to clear stale members of a group ID when it is given to
a new family.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261123155503.2497063-1-anilkaushikwireless%40gmail.com
