Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795749358;
	b=dlPP2FGiaL694cHVh6P0NWZ5/s+9B25JdXgrfqzUqmRBs4Msal9rQVP8CkqfIyGP7Epv
	 yyJJsRo8FsK8v+0ijJLjAOaaCfI+7EGR/jQRjr/aqwNS3LCv3Nf8/9kRl+rHucPKBZKDI
	 HGt0dz+TMjUDHXhSjB8iP1mfSLuPBwtSfnr6bTR+ytoru8UpHeY26KUFZXzFkPSIZMDtV
	 O5xqWe+uU9cpYmumqZw4d6ZLMcmbP+6v4kKyAxQqwo0q5H5j8ivECKESf8iEXafHLwM4N
	 mrPqjHFrS4tBCOgen2HWYgbtDIOSOAC+eh5/QVxTXq/NLPLTihYxJ5xKC+aDQ7vP6hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795749358;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=NexVNqunXuB86kwix8gWk/1ouKqyr5xdOMHE2DlkftI=;
	b=ZrXV4J313aob1N4K5BHzC1sTvaQdKvSPO/UFiGXU9ZmbFSwe5txRaumqhMWZKXCWvyWf
	 u2pulZil/RP/+zWpB5OulXjLZYO/42I/JzrB119Bt5uf12jwbFs1Fziq6kqbIwE1fHLt7
	 bv602DifFgoYhgPvphWnOwNqAM8kXKOv7ngmnp1nVp1HO570S+QsIGm/wl8sYv0yoDFlK
	 KIr45FZcxLWX1dhXKUzS/uiqqGORZHMYPbzi0U7aNCbkKY6lMlR6yE+JbD0ITrcUYn9w5
	 L9oSD5/mtzWws2CbpelB/ICuuU9Fu6XEcK8sXg+MIQUL8Vr29c5qx9ctwiZGCHRk98Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iiZB8FMA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13DE606A31C;
	Fri, 27 Nov 2026 03:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iiZB8FMA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8554C1F000C1;
	Fri, 27 Nov 2026 03:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795749358;
	bh=NexVNqunXuB86kwix8gWk/1ouKqyr5xdOMHE2DlkftI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=iiZB8FMA2CQdQhDUAzXYjRX0rP1wEJj59/QpYimn4FkiMvOwgLy6uTUQoBi4A2VSA
	 Zf+cPc+JzQFngyusHuY98jcWQ4G6011HTQ9p6C/qiNjV+nEs1I3N6YARDjv8EML/Vn
	 O0McEyv4wY2vdo/4A/3++AAVJTHr53q0tmzzHVexEwrfMEeuS9Bd65w3tM7AmRkbWF
	 cW0kuTH8Lh3QUDIwVCEa2NoZPGdLYBAh1goi9FFoDlVidnrk6vtLyKWzjACNO1c4s4
	 CvBg2fTnsfjmUILqogEny97lQL8jKajxH7RAGQeRLvxZ8QkR8WVBrDxIAqV7l6+7pP
	 gJdgBg10jLanQ==
Subject: Re: [PATCH net 2/3] bonding: update slave array on link change for
 broadcast mode
From: netdev-bot+sashiko@kernel.org
To: hangbin.liu@linux.dev
Cc: jv@jvosburgh.net, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 tonghao@bamaicloud.com, razor@blackwall.org, shuah@kernel.org,
 jiangjiehua1@huawei.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Date: Fri, 27 Nov 2026 03:15:57 +0000
Message-ID: <179574935712.3135.18271637068349106750@kernel.org>
In-Reply-To: <20261126-bond_broadcast_updelay-v1-2-188e5538d6ca@kylinos.cn>
References: <20261126-bond_broadcast_updelay-v1-2-188e5538d6ca@kylinos.cn>
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

Critical: 0 · High: 0 · Medium: 2 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The commit message says the patch makes the broadcast
  usable_slaves snapshot 'follow link transitions the same way balance-…
- [Medium] Because broadcast now publishes usable_slaves (the revert,
  which this patch relies on), switching a broadcast bond to balance-rr…
- [Low] The series ordering is not bisect-safe, and the dependency
  between the two patches is not recorded in tags.

--

bonding: update slave array on link change for broadcast mode

This adds a BOND_MODE_BROADCAST case to bond_miimon_link_change(), so the
usable_slaves snapshot is rebuilt on miimon link transitions. That keeps
the ignore_updelay decision in bond_miimon_inspect() in line with the
current slave link states. It depends on a revert of 45fc134bcfad so that
bond_set_slave_arr() publishes the array for broadcast.

> Add the broadcast case so the snapshot follows link transitions the
> same way balance-xor does. This needs the revert of 45fc134bcfad as
> a prerequisite: with 45fc134bcfad applied, bond_set_slave_arr()
> discards the refreshed array for broadcast.
>
> Fixes: e0caeb24f538 ("net: bonding: update the slave array for broadcast mode")

[Severity: Low]
Is the series order bisect-safe? The revert of 45fc134bcfad is applied
before this patch. On its own, it makes bond_set_slave_arr() publish
usable_slaves for broadcast again, but nothing rebuilds the array on
miimon link changes yet.

At that intermediate commit, a batch enslave with updelay leaves the new
slaves in BOND_LINK_BACK. The snapshot taken at enslave time then has
count == 0 and is never refreshed, so bond_miimon_inspect() ignores
updelay permanently. That is the bug 45fc134bcfad fixed.

If this patch went first, it would be a no-op under 45fc134bcfad, and
every commit in the series would be correct.

Also, this patch carries Fixes: e0caeb24f538, but the revert it depends on
has no Fixes: tag and no dependency annotation. 45fc134bcfad is likely
already in stable trees.

Would a tag-driven backport of only this patch leave the stale snapshot
behaviour unchanged there?

> diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_main.c
> index d6675e87d06b6..b1efbdf597ec4 100644
> --- a/drivers/net/bonding/bond_main.c
> +++ b/drivers/net/bonding/bond_main.c
> @@ -2780,6 +2780,7 @@ static void bond_miimon_link_change(struct bonding *bond,
>  		bond_alb_handle_link_change(bond, slave, link);
>  		break;
>  	case BOND_MODE_XOR:
> +	case BOND_MODE_BROADCAST:
>  		bond_update_slave_arr(bond, NULL);
>  		break;
>  	}

[Severity: Medium]
The commit message says the snapshot follows link transitions "the same
way balance-xor does". Does that hold outside the MII monitor?

balance-xor also rebuilds the array when the ARP load-balance monitor
changes a slave's link state. Broadcast is still left out there:

drivers/net/bonding/bond_main.c:bond_loadbalance_arp_mon() {
    ...
		if (slave_state_changed) {
			bond_slave_state_change(bond);
			if (BOND_MODE(bond) == BOND_MODE_XOR)
				bond_update_slave_arr(bond, NULL);
		}
    ...
}

Broadcast can use ARP monitoring, because bond_mode_uses_arp() only
excludes BOND_MODE_8023AD, BOND_MODE_TLB and BOND_MODE_ALB.
bond_slave_netdev_event() also skips broadcast, since
bond_mode_can_use_xmit_hash() is false for it. So under ARP monitoring,
the broadcast snapshot keeps the state from the last enslave or release.

bond_option_miimon_set() can switch the bond from ARP monitoring to
miimon at runtime. It zeroes arp_interval, cancels arp_work and queues
mii_work, but it does not rebuild the slave array. params.updelay
survives the switch.

For example, slaves enslaved with carrier under ARP monitoring are marked
BOND_LINK_UP and counted in usable_slaves. Later the ARP monitor marks
them BOND_LINK_DOWN, but the snapshot is not refreshed. Once miimon is
enabled, bond_miimon_inspect() sees usable_slaves->count != 0:

	if (usable_slaves && usable_slaves->count == 0)
		ignore_updelay = true;

Recovering slaves then wait out updelay even though the bond has no usable
link.

The reverse case also happens. If slaves are enslaved without carrier,
count == 0 and updelay is wrongly ignored. Either state lasts until the
first miimon commit reaches bond_miimon_link_change().

Should BOND_MODE_BROADCAST also be added to the condition in
bond_loadbalance_arp_mon()?

[Severity: Medium]
Now that broadcast publishes usable_slaves, does a switch from broadcast
to balance-rr leave a stale snapshot behind?

Releasing the last broadcast slave goes through __bond_release_one():

	if (bond_mode_can_use_xmit_hash(bond) ||
	    BOND_MODE(bond) == BOND_MODE_BROADCAST)
		bond_update_slave_arr(bond, slave);

This runs after bond_upper_dev_unlink(), so the slave list is already
empty. The result is a non-NULL usable_slaves with count == 0, and after
the revert that array is kept for broadcast.

Neither bond_option_mode_set() nor bond_close() resets the arrays.

In balance-rr, nothing rebuilds the array afterwards:

  - bond_enslave() and __bond_release_one() only rebuild for xmit-hash
    modes or broadcast
  - bond_open() and bond_slave_netdev_event() only rebuild when
    bond_mode_can_use_xmit_hash() is true
  - bond_miimon_link_change() has no BOND_MODE_ROUNDROBIN case

So in balance-rr, bond_miimon_inspect() would see count == 0 on every
pass. It would set ignore_updelay = true and force slave->delay to 0 for
every recovering slave.

Documentation/networking/bonding.rst section 13.1 says updelay is ignored
only when the bond has no active links.

In the baseline tree with 45fc134bcfad, broadcast never published
usable_slaves, so a switch from broadcast to balance-rr left it NULL. The
same missing reset on mode change already existed for a switch from
balance-xor to balance-rr.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261126-bond_broadcast_updelay-v1-0-188e5538d6ca%40kylinos.cn
