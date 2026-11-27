Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.75
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795759274;
	b=kBvDkMlHlU2/cdfZR2b+LJoruRBx6/mKaU71Pv9stPbAgTWAsp87VeMZG4YN7w/ntr2p
	 B8gD1n1laFSNCbq/aqDepmtPltdzYIAr0/YykhuPKcPCgh6Sg4jirXbuok4P+4hnpHVrY
	 BgcP5c40JuMwjzaAXCpD4bIb04ULJliuWQa57gcgMcWU3axc/IyD/cN2ungFMT6GdC7W0
	 abftaXa3mz9RwgGqvkuw3/ZlBjL0p+pPth1aCh16tFnfSx7TcU/fLWYCKd+JenwMKiOPQ
	 9gYKs9wMQNVi4ZrhM6/kGvopb99vHF45+RpWimbeJzbczXxC5191lSXcaKNsS0A81BA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795759274;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=nrXUyBnnLMn4mqMV0QE9b5zcQInsdQBriad2AyK2+Eo=;
	b=eNkrx6IU9uqPs+oyTzTOxty1bgMgdusTiMwMcYoGwEUsY9U1RAW9XFZEdQkTqMUJFq5v
	 iELtquA/nihqzKHECQGtn8E469BR/fPQccqDPXCKDaP+NonL9saU3UtXEmLOJRGWjlSFA
	 GtRkVP3k54EesvfXv+ISFiSEQrCuV9NZuSQ0qiGJBET3JWBfixjG7hV4UMVv5NGhzlcZa
	 JjO4ODdCQlZn/NHpEbT9NZ2XFmaY5VsAPi/QpCHP6KiqkJDDX0ZX2SQVkMOqYs+UK8S0t
	 L3ulXKu161MJe6tPpNdzHcNY6QIhRhuW1c8rf2wOZenR4JindTqK007vPlQDfMNBLlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Y5sBkEAp;
	arc=none smtp.remote-ip=95.215.58.75
Received: from mta1.migadu.com (out-75.mta1.migadu.com [95.215.58.75])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D62606A31C
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 06:01:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98D62606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Y5sBkEAp
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=7VngrNZEXiKoDUMjMc/nzPenWV2Zy0/emms0Y+lumzs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795759270; v=1; x=1796364070;
 b=Y5sBkEApFsaG7tDNVA61iRZ4F35l421r6lYOjienw2wc71fpUfYJS4oFsuZOprbajPMWb2Kd
 9usp5H8ixhueAERbI0YLoOwHmmbj1ZDIMlXKoxFC3spponR6w+jpLJl2ott7gOdh7Vz3+vTY7NP
 PXHHL3qGfL5jdPEUKM7zdtKo=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 9ad39df9598d294b;
	Fri, 27 Nov 2026 06:01:10 +0000
X-Mizu-Trace-ID: 9ad39df9598d294b
X-Migadu-Flow: FLOW_OUT
Date: Fri, 27 Nov 2026 14:00:58 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: netdev-bot+sashiko@kernel.org
Cc: jv@jvosburgh.net, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
	tonghao@bamaicloud.com, razor@blackwall.org, shuah@kernel.org,
	jiangjiehua1@huawei.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net 2/3] bonding: update slave array on link change for
 broadcast mode
Message-ID: <awkcmoDW5AHqJujs@fedora>
References: <20261126-bond_broadcast_updelay-v1-2-188e5538d6ca@kylinos.cn>
 <179574935712.3135.18271637068349106750@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179574935712.3135.18271637068349106750@kernel.org>

On Fri, Nov 27, 2026 at 03:15:57AM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 2 · Low: 1
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] The commit message says the patch makes the broadcast
>   usable_slaves snapshot 'follow link transitions the same way balance-…
> - [Medium] Because broadcast now publishes usable_slaves (the revert,
>   which this patch relies on), switching a broadcast bond to balance-rr…
> - [Low] The series ordering is not bisect-safe, and the dependency
>   between the two patches is not recorded in tags.
> 
> --
> 
> bonding: update slave array on link change for broadcast mode
> 
> This adds a BOND_MODE_BROADCAST case to bond_miimon_link_change(), so the
> usable_slaves snapshot is rebuilt on miimon link transitions. That keeps
> the ignore_updelay decision in bond_miimon_inspect() in line with the
> current slave link states. It depends on a revert of 45fc134bcfad so that
> bond_set_slave_arr() publishes the array for broadcast.
> 
> > Add the broadcast case so the snapshot follows link transitions the
> > same way balance-xor does. This needs the revert of 45fc134bcfad as
> > a prerequisite: with 45fc134bcfad applied, bond_set_slave_arr()
> > discards the refreshed array for broadcast.
> >
> > Fixes: e0caeb24f538 ("net: bonding: update the slave array for broadcast mode")
> 
> [Severity: Low]
> Is the series order bisect-safe? The revert of 45fc134bcfad is applied
> before this patch. On its own, it makes bond_set_slave_arr() publish
> usable_slaves for broadcast again, but nothing rebuilds the array on
> miimon link changes yet.
> 
> At that intermediate commit, a batch enslave with updelay leaves the new
> slaves in BOND_LINK_BACK. The snapshot taken at enslave time then has
> count == 0 and is never refreshed, so bond_miimon_inspect() ignores
> updelay permanently. That is the bug 45fc134bcfad fixed.
> 
> If this patch went first, it would be a no-op under 45fc134bcfad, and
> every commit in the series would be correct.
> 
> Also, this patch carries Fixes: e0caeb24f538, but the revert it depends on
> has no Fixes: tag and no dependency annotation. 45fc134bcfad is likely
> already in stable trees.
> 
> Would a tag-driven backport of only this patch leave the stale snapshot
> behaviour unchanged there?

This commit description already said it depends on the revert.

> 
> > diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_main.c
> > index d6675e87d06b6..b1efbdf597ec4 100644
> > --- a/drivers/net/bonding/bond_main.c
> > +++ b/drivers/net/bonding/bond_main.c
> > @@ -2780,6 +2780,7 @@ static void bond_miimon_link_change(struct bonding *bond,
> >  		bond_alb_handle_link_change(bond, slave, link);
> >  		break;
> >  	case BOND_MODE_XOR:
> > +	case BOND_MODE_BROADCAST:
> >  		bond_update_slave_arr(bond, NULL);
> >  		break;
> >  	}
> 
> [Severity: Medium]
> The commit message says the snapshot follows link transitions "the same
> way balance-xor does". Does that hold outside the MII monitor?
> 
> balance-xor also rebuilds the array when the ARP load-balance monitor
> changes a slave's link state. Broadcast is still left out there:
> 
> drivers/net/bonding/bond_main.c:bond_loadbalance_arp_mon() {
>     ...
> 		if (slave_state_changed) {
> 			bond_slave_state_change(bond);
> 			if (BOND_MODE(bond) == BOND_MODE_XOR)
> 				bond_update_slave_arr(bond, NULL);
> 		}
>     ...
> }
> 
> Broadcast can use ARP monitoring, because bond_mode_uses_arp() only
> excludes BOND_MODE_8023AD, BOND_MODE_TLB and BOND_MODE_ALB.
> bond_slave_netdev_event() also skips broadcast, since
> bond_mode_can_use_xmit_hash() is false for it. So under ARP monitoring,
> the broadcast snapshot keeps the state from the last enslave or release.
> 
> bond_option_miimon_set() can switch the bond from ARP monitoring to
> miimon at runtime. It zeroes arp_interval, cancels arp_work and queues
> mii_work, but it does not rebuild the slave array. params.updelay
> survives the switch.
> 
> For example, slaves enslaved with carrier under ARP monitoring are marked
> BOND_LINK_UP and counted in usable_slaves. Later the ARP monitor marks
> them BOND_LINK_DOWN, but the snapshot is not refreshed. Once miimon is
> enabled, bond_miimon_inspect() sees usable_slaves->count != 0:
> 
> 	if (usable_slaves && usable_slaves->count == 0)
> 		ignore_updelay = true;
> 
> Recovering slaves then wait out updelay even though the bond has no usable
> link.
> 
> The reverse case also happens. If slaves are enslaved without carrier,
> count == 0 and updelay is wrongly ignored. Either state lasts until the
> first miimon commit reaches bond_miimon_link_change().
> 
> Should BOND_MODE_BROADCAST also be added to the condition in
> bond_loadbalance_arp_mon()?

Ack, I will also handle the arp monitor.

> 
> [Severity: Medium]
> Now that broadcast publishes usable_slaves, does a switch from broadcast
> to balance-rr leave a stale snapshot behind?
> 
> Releasing the last broadcast slave goes through __bond_release_one():
> 
> 	if (bond_mode_can_use_xmit_hash(bond) ||
> 	    BOND_MODE(bond) == BOND_MODE_BROADCAST)
> 		bond_update_slave_arr(bond, slave);
> 
> This runs after bond_upper_dev_unlink(), so the slave list is already
> empty. The result is a non-NULL usable_slaves with count == 0, and after
> the revert that array is kept for broadcast.
> 
> Neither bond_option_mode_set() nor bond_close() resets the arrays.
> 
> In balance-rr, nothing rebuilds the array afterwards:
> 
>   - bond_enslave() and __bond_release_one() only rebuild for xmit-hash
>     modes or broadcast
>   - bond_open() and bond_slave_netdev_event() only rebuild when
>     bond_mode_can_use_xmit_hash() is true
>   - bond_miimon_link_change() has no BOND_MODE_ROUNDROBIN case
> 
> So in balance-rr, bond_miimon_inspect() would see count == 0 on every
> pass. It would set ignore_updelay = true and force slave->delay to 0 for
> every recovering slave.
> 
> Documentation/networking/bonding.rst section 13.1 says updelay is ignored
> only when the bond has no active links.
> 
> In the baseline tree with 45fc134bcfad, broadcast never published
> usable_slaves, so a switch from broadcast to balance-rr left it NULL. The
> same missing reset on mode change already existed for a switch from
> balance-xor to balance-rr.

This seems not broadcast only issue. The other xmit hash mode also have this
problem. Maybe we should set usable_array to NULL if it's length is 0? Need
to further checking.

Thanks
Hangbin
---
pw-bot: cr
