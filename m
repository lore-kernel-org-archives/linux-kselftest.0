Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794932045;
	b=sXDzh/2ln5SxH7Hfps0888tALzuqUdn5i7W3NWKXbcH/vob8k0L+KMUf27piQjPyJVog
	 /pmcdf/qGJXpqkzi/ZCR74RG0ORd2Fs+eUUtVZP227O5iA+Wdunldi2RtNxPGj9y450TT
	 anXcBy/fTlgAAHkUAbjc+2MvgFZSv/6Ot41VOA09B6XgDXs9MoZzZ/MvGf9P5nw7wuOSi
	 P1D+9vQuZqE4tg21lo65jEgBJw0C0HeEIB1tgYMhhQVH9QV1wX716CerUuUVYIjkKtYcR
	 wb7TnLfdA40/gXX9esklHzLsboQMkjatUjz3/4mNJGZf6DEqkwn8ol78BNpDGyZQ4UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794932045;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=2GB8yrCh15PzKnWWii1+rdwb9F4gbHq8S/zUVposLqc=;
	b=CWx/R84tvg9U5k99c+ruc3oDwzBeO1q4WJ73SdJdKNj7cpoisvXDMVinPhRZhbms1IbO
	 doKwvQ9rKzIqEYhKsrJsY9fGoVk80Sw8iq/x0/dUoSx8S5CK8UI6ctqPJWdE1nLc1lDK3
	 8QATwDUyGHdwzoWggCfLmH2vRYD9Gr8exwdsOFZwyHRFg9FmNYIExiH+CSjHGkWt5X36L
	 67jSBZgwEz/JcIxsmmscMqAX6z6kdOOf48aAcYKiGp3WxdG4OB26oIRmb0UnUpKgkFQff
	 TVthskp8Nczjp5AGiL6/UUI9lkcQByF9+rfHh8T5Z1oG7cgKyRohE4xKfDpotslTlbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SUUaCxyE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781AC606A336;
	Tue, 17 Nov 2026 16:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SUUaCxyE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99BA41F000C5;
	Tue, 17 Nov 2026 16:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794932045;
	bh=2GB8yrCh15PzKnWWii1+rdwb9F4gbHq8S/zUVposLqc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=SUUaCxyEJAr9sFQpR9cYGiM8ZssslZmtENDRxbVOROPtjr+4okMvRrCvlqciEcy+D
	 oQo3Q/24waMzaeuTq+AbQIV1lG4bm1C63m6wMMV65my7rc5EEJ3OLYdIbm28pPpT4x
	 t5UsxVIR5xbXHfogsbYLFp8sb8tvlEyUOAMeoLiQqegc2jkLN8cWE7bBHvljYg6v9y
	 lXeNhumCFcES68xB+T0TXg7tkwYfE37dvg6x72+0IEAsv+54qTpdlPl+xEPRQavSCM
	 yvnOYUQLVPjks/adjm/fjLzh1mIFTa5I/qpLXEGC5fUp9/FYMDR7jb9Otqrp2krEjn
	 4v/0ZUdKhH+qQ==
Subject: Re: [PATCH net v4 1/2] vxlan: reset the remote's dst cache when
 snooping moves a MAC
From: netdev-bot+sashiko@kernel.org
To: ilskdw@gmail.com
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 kuniyu@google.com, mschiffer@universe-factory.net, nicolas.dichtel@6wind.com,
 shuah@kernel.org, linux-kselftest@vger.kernel.org
Date: Tue, 17 Nov 2026 16:14:04 +0000
Message-ID: <179493204412.3136.9530927866932224793@kernel.org>
In-Reply-To: <20261113155133.75090-2-ilskdw@gmail.com>
References: <20261113155133.75090-2-ilskdw@gmail.com>
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

Critical: 0 · High: 0 · Medium: 4 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] On a switchdev-offloaded device, the snoop migration path can
  now hit a notifier rejection that it ignores.
- [Medium] A packet from the same remote now erases a user-configured
  `via <dev>` on a dynamic FDB entry.
- [Medium] The patch adds two unlocked stores, rdst->remote_ifindex and
  rdst->offloaded, to fields that every other writer updates under…
- [Medium] The stale dst-cache blackhole that the commit claims to fix
  can still happen through a race with a concurrent transmitter.

--

vxlan: reset the remote's dst cache when snooping moves a MAC

When a known MAC arrives from a different remote, this patch makes the
migration branch of vxlan_snoop() reset the remote's dst_cache, update
remote_ifindex and clear offloaded. That matches what vxlan_fdb_replace()
already does for netlink updates. The goal is to stop routing with a stale
cached dst after a MAC move, and to stop the repeated RTM_NEWNEIGH
notifications when a MAC moves between link-local and other IPv6 addresses.

> diff --git a/drivers/net/vxlan/vxlan_core.c b/drivers/net/vxlan/vxlan_core.c
> index d11028b374721..6bc54642e7f45 100644
> --- a/drivers/net/vxlan/vxlan_core.c
> +++ b/drivers/net/vxlan/vxlan_core.c
> @@ -1482,7 +1482,10 @@ static enum skb_drop_reason vxlan_snoop(struct net_device *dev,
>  				    "%pM migrated from %pIS to %pIS\n",
>  				    src_mac, &rdst->remote_ip.sa, &src_ip->sa);
>  
> +		dst_cache_reset(&rdst->dst_cache);
>  		rdst->remote_ip = *src_ip;

[Severity: Medium]
Can a transmitter on another CPU still fill the cache with a dst for the
old remote after this reset?

dst_cache_reset() only records a timestamp:

static inline void dst_cache_reset(struct dst_cache *dst_cache)
{
	WRITE_ONCE(dst_cache->reset_ts, jiffies);
}

vxlan_xmit_one() reads rdst->remote_ip into the flow key before it reaches
dst_cache_get_ip4()/dst_cache_get_ip6() through udp_tunnel_dst_lookup().
dst_cache_per_cpu_get() treats an entry as valid while
time_after(refresh_ts, reset_ts), and sets refresh_ts = jiffies on a miss.

Consider this sequence:

CPU0 (vxlan_xmit_one)                 CPU1 (vxlan_snoop)
reads rdst->remote_ip (old)
                                      dst_cache_reset(), reset_ts = J
<jiffies advances to J+1>
dst_cache_get misses,
  refresh_ts = J+1
                                      rdst->remote_ip = *src_ip
routes the old address,
dst_cache_set_ip4/ip6()

>From then on, CPU0 reads the new remote_ip, but dst_cache_per_cpu_get()
returns the dst for the old remote because time_after(J+1, J) is true.

Wouldn't that be the same blackhole the changelog describes, lasting until
the route is invalidated (for example by "ip route flush cache")?

Moving the address store ahead of the reset doesn't close the window.
Nothing orders the reset_ts store against the remote_ip store for lockless
readers on weakly ordered CPUs.

The window is narrow because it needs a jiffies tick at the right moment.
It is widest in the live migration case this patch targets, where traffic
flows both ways during the move. On PREEMPT_RT, the xmit path can also be
preempted between reading the IP and the cache lookup.
vxlan_fdb_replace() has the same weakness.

> +		rdst->remote_ifindex = ifindex;

[Severity: Medium]
Could a packet from the same remote now erase a user-configured "via <dev>"
on a dynamic FDB entry?

For IPv4 or global IPv6 sources, vxlan_snoop() keeps ifindex at 0. Only
link-local IPv6 sources get src_ifindex. vxlan_fdb_parse() accepts
NDA_IFINDEX for any address family, so a dynamic entry such as:

  bridge fdb add MAC dev vxlan0 dst 10.0.0.2 via eth1 dynamic

has remote_ifindex set to eth1. The first packet from 10.0.0.2 with that
inner source MAC fails the early return:

		if (likely(vxlan_addr_equal(&rdst->remote_ip, src_ip) &&
			   rdst->remote_ifindex == ifindex))
			return SKB_NOT_DROPPED_YET;

because remote_ifindex is eth1 and ifindex is 0. The entry is not
NUD_PERMANENT or NUD_NOARP, so it enters the migration branch and logs
"migrated from 10.0.0.2 to 10.0.0.2".

With this patch, that branch overwrites remote_ifindex with 0, resets the
dst_cache and clears offloaded. vxlan_xmit_one() uses the field as the oif
for the underlay route lookup:

		ifindex = rdst->remote_ifindex;

Later packets to the MAC are then routed without the configured egress
interface. On multi-homed or VRF underlays, that can change the egress
device.

Before this patch, the same case sent a notification on every packet but
kept the configured interface. The commit message only covers link-local
moves and doesn't mention this case. Should remote_ifindex only be
rewritten when the remote actually changes?

> +		rdst->offloaded = false;

[Severity: Medium]
Can these new stores race with the other writers of these fields?

vxlan_snoop() runs in RX softirq under rcu_read_lock only, without
vxlan->hash_lock. vxlan_fdb_replace(), vxlan_fdb_offloaded_set() and
vxlan_fdb_clear_offload() all write remote_ip, remote_ifindex and
offloaded while holding hash_lock.

One interleaving involves vxlan_fdb_offloaded_set(). Under hash_lock, it
finds the rdst through vxlan_fdb_find_rdst() using the old (remote_ip,
port, vni, remote_ifindex). Snoop on another CPU then writes the new
remote and offloaded = false, and sends ADD_TO_DEVICE. After that,
vxlan_fdb_offloaded_set() resumes:

	rdst->offloaded = fdb_info->offloaded;

The entry now names the new remote but is marked offloaded for the old one.
The flag stays wrong if the driver rejects the new remote, as in the mlxsw
link-local case below.

Another interleaving involves two RX CPUs that see the same inner source
MAC, one from remote A (IPv6 link-local, ifindex X) and one from remote B
(global, ifindex 0). Both enter the migration branch, and the remote_ip
copy and remote_ifindex stores can interleave. That can leave A's address
with B's ifindex of 0, or a torn address.

vxlan_xmit_one() reads remote_ifindex and remote_ip with separate plain
loads, so it would route a link-local destination with oif 0.

The unlocked in-place remote_ip update predates this patch. These new
stores extend it to the fields the commit message says it keeps
consistent.

Would it work to take hash_lock and re-check the state here, as the
learn-new-entry branch already does?

>  		vxlan_fdb_notify(vxlan, f, rdst, RTM_NEWNEIGH, true, NULL);

[Severity: Medium]
What happens here when a switchdev driver rejects the new remote_ifindex?

With swdev_notify set, vxlan_fdb_notify() returns early when the notifier
fails:

		case RTM_NEWNEIGH:
			err = vxlan_fdb_switchdev_call_notifiers(vxlan, fdb, rd,
								 true, extack);
			if (err)
				return err;

vxlan_snoop() ignores that return value. With this patch, a snooped IPv6
link-local source now passes a non-zero remote_ifindex to the notifier,
and mlxsw_sp_switchdev_vxlan_work_prepare() in spectrum_switchdev.c
rejects it:

	if (vxlan_fdb_info->remote_ifindex) {
		NL_SET_ERR_MSG_MOD(extack, "VxLAN: FDB: Local interface is not supported");
		return -EOPNOTSUPP;
	}

__vxlan_fdb_notify() then never runs, so no RTM_NEWNEIGH reaches
userspace.

The snoop path also keeps the in-place change. On the same error,
vxlan_fdb_update_existing() restores the old rdst:

	if ((flags & NLM_F_REPLACE) && rc)
		*rd = oldrd;

Wouldn't the software FDB then point the MAC at (link-local IP, ifindex X)
with offloaded = false, while the hardware FDB still forwards to the old
global remote? Nothing in netlink would report the mismatch.

Before this patch, snoop never changed remote_ifindex, so this error path
was effectively unreachable from snoop. Whether it is reachable now
depends on such a packet reaching the software vxlan socket instead of
being decapsulated in hardware.

>  	} else {
>  		/* learned new entry */

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261113155133.75090-1-ilskdw%40gmail.com
