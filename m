Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795749357;
	b=jTpZ3ha09NZ1aGx4/h6KgbwyftKy/Qw9Z3m9D5eAKDmtkq4JQQnv9jd0N3EFAbm5iypC
	 SmUaZnXq0mu6JECCGyU4KjrmTSAstUq6UjsgPyEdfsaWCci4+K/pEBlVtBy8YAHY/E8aI
	 rOSpHtW53v7TOcaEvG46Xbfahb3/z1fjqJnVHicObU+QGxIE0l3JScKgIu0F3idY8lvoC
	 ejAIAGcgSNTYbqGvzX6Z+MdQDAqBwyryfK4K42bLOTmFkIZV0MVhr1lJkpvsTWVjFZ0Te
	 zHrLzRpCugfjiZQG6OaNlKyOfAKdP6kZKI8vyF4b7DPGx0Smkztdemn3t4agJtie52w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795749357;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=zacDcZZkB0SgR1IDOo839AuEOBLi4HSRGIYFOfbcasw=;
	b=LzzX9RuAYGwow5AKqoBCsM06M/4zK9/s6LK/f86Ar8lUm+EVp3OHf2fV86F8zgGJJU/n
	 a4YGtn1lno2CJrD5raSjJpPNwbyDUZCIaVuS4ykxf+HhEqamsOhvFyy1WrQYspN5RJLU3
	 RlxaJ1IV2rV/GAHPZUNfO42+GLjk+LboipktiWdO6VHg4xGGOVplu8SZ89E7d9+wVZKTH
	 xsIgYQYoPdkFQ2BaBnguJgEWLDudmT94xy6kTctURkxa6fWOQ4H2J6xn0DzVSuigFLycu
	 pIVLDuOCE7UOYsIvcpqCQCawlU/0YsKMKohYLm3WSjjNN6jTdA/Kb7wRiB65wrtQ8eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G9LFas5B;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E69F606A31E;
	Fri, 27 Nov 2026 03:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G9LFas5B
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C76301F000C1;
	Fri, 27 Nov 2026 03:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795749356;
	bh=zacDcZZkB0SgR1IDOo839AuEOBLi4HSRGIYFOfbcasw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=G9LFas5BPBTw99X+KtzXq0mMuRbxNxAz02QeK3RoHBkOiF2kpU7Dg0FnjIfnf2ZQX
	 Kb2aBITCjy0rM3SD/A0jvOPgGGXr2RYRbxrTl6OTM07GuLStW5e1pQ4I53DuI/TGw7
	 lyVJXIr1pE4imG+RMQUK1mi0inPMIxWoGOW0dHmyLOniIj07mUsUcqMkj48jkFj0mO
	 gz+hAQeYlQBDnlHNCJ4SMAOqSympGqz0+Fxf1Vjk6mePjjDOFu2u3SSFF985nfUroL
	 lcuAeRbDs0EAMI//uj/PZnijOaZBT5eVLam4hDwKFQffvIPGA4g6gRBjQ5ipHGhxmW
	 VKoBQplAvELLw==
Subject: Re: [PATCH net 1/3] Revert "bonding: do not set usable_slaves for
 broadcast mode"
From: netdev-bot+sashiko@kernel.org
To: hangbin.liu@linux.dev
Cc: jv@jvosburgh.net, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 tonghao@bamaicloud.com, razor@blackwall.org, shuah@kernel.org,
 jiangjiehua1@huawei.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Date: Fri, 27 Nov 2026 03:15:55 +0000
Message-ID: <179574935536.3135.14725054266290783008@kernel.org>
In-Reply-To: <20261126-bond_broadcast_updelay-v1-1-188e5538d6ca@kylinos.cn>
References: <20261126-bond_broadcast_updelay-v1-1-188e5538d6ca@kylinos.cn>
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

- [Low] Commit trailer and tagging problems on the revert.
- [Low] Comments no longer match how broadcast mode uses usable_slaves.

--

Revert "bonding: do not set usable_slaves for broadcast mode"

This reverts commit 45fc134bcfad. That commit stopped publishing
bond->usable_slaves in broadcast mode, so updelay was no longer ignored
when there were no active slaves. A follow-up patch in the series
rebuilds the slave array on link changes for broadcast mode.

> Revert "bonding: do not set usable_slaves for broadcast mode"
>
> This reverts commit 45fc134bcfadde456639c1b1e206e6918d69a553.

[ ... ]

>     Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>

[Severity: Low]
The From: address is Hangbin Liu <hangbin.liu@linux.dev>, but the
Signed-off-by: address is Hangbin Liu <liuhangbin@kylinos.cn>. Checkpatch
reports this as FROM_SIGN_OFF_MISMATCH. The other two patches in the series
have the same mismatch.

Should this revert carry a Fixes: tag, or a stable dependency note?

Commit 45fc134bcfad went in through net with its own Fixes: e0caeb24f538,
so it has probably reached stable. The follow-up "bonding: update slave
array on link change for broadcast mode" has Fixes: e0caeb24f538 and says
it needs this revert first. None of the tags tell stable tooling about
that ordering.

If only the follow-up is backported, it has no effect. The
bond_set_slave_arr() from 45fc134bcfad still drops usable_slaves for
broadcast mode.

If only this revert is backported, the bug that 45fc134bcfad fixed comes
back: in broadcast mode the stale, empty usable_slaves array makes the
bond always ignore updelay.

> diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_main.c
> index 042d7c75548fa..d6675e87d06b6 100644
> --- a/drivers/net/bonding/bond_main.c
> +++ b/drivers/net/bonding/bond_main.c
> @@ -5140,18 +5140,13 @@ static void bond_set_slave_arr(struct bonding *bond,
>  {
>  	struct bond_up_slave *usable, *all;
>
> -	all = rtnl_dereference(bond->all_slaves);
> -	rcu_assign_pointer(bond->all_slaves, all_slaves);
> -	kfree_rcu(all, rcu);
> -
> -	if (BOND_MODE(bond) == BOND_MODE_BROADCAST) {
> -		kfree_rcu(usable_slaves, rcu);
> -		return;
> -	}
> -
>  	usable = rtnl_dereference(bond->usable_slaves);
>  	rcu_assign_pointer(bond->usable_slaves, usable_slaves);
>  	kfree_rcu(usable, rcu);

[Severity: Low]
This isn't a bug, but after this revert bond->usable_slaves is published
for BOND_MODE_BROADCAST too. Should the related comments in bond_main.c be
updated to match?

The comment above bond_update_slave_arr() still lists only the xmit-hash
modes:

drivers/net/bonding/bond_main.c:
/* Build the usable slaves array in control path for modes that use xmit-hash
 * to determine the slave interface -
 * (a) BOND_MODE_8023AD
 * (b) BOND_MODE_XOR
 * (c) (BOND_MODE_TLB || BOND_MODE_ALB) && tlb_dynamic_lb == 0

The call site in bond_enslave() explains the broadcast case only in terms
of all_slaves:

	/* broadcast mode uses the all_slaves to loop through slaves. */
	if (bond_mode_can_use_xmit_hash(bond) ||
	    BOND_MODE(bond) == BOND_MODE_BROADCAST)
		bond_update_slave_arr(bond, NULL);

However, bond_miimon_inspect() now relies on the broadcast-mode
usable_slaves to decide ignore_updelay:

		usable_slaves = rcu_dereference(bond->usable_slaves);

		if (usable_slaves && usable_slaves->count == 0)
			ignore_updelay = true;

The rest of the series does not change either comment. Neither comment
says that broadcast mode must keep usable_slaves current on link changes,
which the follow-up patch makes a requirement.

> +
> +	all = rtnl_dereference(bond->all_slaves);
> +	rcu_assign_pointer(bond->all_slaves, all_slaves);
> +	kfree_rcu(all, rcu);
>  }

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261126-bond_broadcast_updelay-v1-0-188e5538d6ca%40kylinos.cn
