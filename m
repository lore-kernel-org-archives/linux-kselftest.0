Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794531643;
	b=fpXpvKPJQtG7tztJT8LoB6S1OGrLj2a3RZOYZCLKc1nAJNDoul4jrLjm4cK+1UDbRhFN
	 2kiXYzM4nDSLbtxeaHDUVoM9WE+r9XFgqL5e8x2FpandlgPuoh8iyjQqYSqWBK4OqJMLi
	 pOgliO1AJpI6C2t5tzARGH+ji9XOba5V+JC0m+e9Q/RudqhTaaMIKUxDcRx42OJBTCamZ
	 QFaR4/MVBhyg4FAGoUk+6xG+fBjXp9xg5hhRpDyvpuGxd5+2ZlNexzL56CvbmvrqieEkr
	 8NsBznRA28wkC2z56oWUULa9X1NlyrxQY2dKXr9drcJg4VPqQiN++JojqiY7qIjeydA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794531643;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=oHikqOh7DkGiclKR+2Qu8TD9Ceidpi1IjM4zmil49x4=;
	b=Iy5u9EagDy+c03Rw7tZw9aVNZsbSfnElXER4/NDl/5Hcm71zy76+RRLIZr4NnG2aYVP0
	 Ywd9DaqWqI+e7/6C3YL9r2ZL1cL1lpQuWt8OvBKjJaHbduG8sESIBJMjy0fAbc+uKtLOx
	 z8LzxSgY9ApVsQ1ks+y9jbiSnCx8Ic2eYj6dmpPyXHSohTbI8tISE+L2yVw3Rcy7IW53n
	 tZQPEFMB4fv9ppZ3+7dh+wpsngOWf0+7OjOV9TqkPLWHYpzHbtQBb7x+bOlsQCqxj8/eg
	 Bxu0OKCjKqkjZPdl3dFFqMrHA6Tpd29o5zRkzlqk0vkSsVns/Crwzy/+ep97sfVu3gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Sex4w/NO";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A507F606A323;
	Fri, 13 Nov 2026 01:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sex4w/NO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E38971F000C4;
	Fri, 13 Nov 2026 01:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794531643;
	bh=oHikqOh7DkGiclKR+2Qu8TD9Ceidpi1IjM4zmil49x4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Sex4w/NOmZY5SRJ1EXZr+5Ysmn2MUBDL4k9wP/YgLwJX6Tk6y2ulBzU6LZY8GZktf
	 nZ3lE5FFTXM77N7JH1d0x//R5Mn16zavhpLjJVSNQAcf08EtTQoKmfwkL5ZVi/Jv8c
	 LRTLDXqZVAvXIoLuu59Vijv2WJdM0SoUdyaDcaTbxCYh1tcgB45wAWQHIhZ8LigTfy
	 GSaImjdG/735oNHjYhSICw9nKWBeD/tlLKIr+7hk9+EC9SyiLc1pxh0S1SwcJ5kQqP
	 SU/doM3Q57iIqdjmmg/kjj7w2ZGCDWZWyMWjcUdKsOj1w1JaknBN7jbahMDoQjEeU9
	 kqXgcVsKL+UJg==
Subject: Re: [PATCH net-next v2 1/3] ipv4: Don't raise a cached pmtu from
 another path's Packet Too Big
From: netdev-bot+sashiko@kernel.org
To: deliran@verdict.gg
Cc: dsahern@kernel.org, idosch@nvidia.com, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 shuah@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Date: Fri, 13 Nov 2026 01:00:42 +0000
Message-ID: <179453164247.2199510.13663242655786078100@kernel.org>
In-Reply-To: <20261110095903.84813-2-deliran@verdict.gg>
References: <20261110095903.84813-2-deliran@verdict.gg>
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

Thank you for your contribution! Sashiko AI review found 6 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 4

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The fix does not do "the same" as the early return in
  __ip_rt_update_pmtu(), as the commit message claims.
- [Medium] The new early exit in update_or_create_fnhe() ignores the
  `lock` argument, so it can drop an MTU-lock transition.
- [Low] Missing Fixes: tag.
- [Low] The commit message presents the raise as the normal result of a
  wider path's Fragmentation Needed ("update_or_create_fnhe() overwrites…
- [Low] No selftest exercises the new no-raise check in
  update_or_create_fnhe().
- [Low] The new comment in update_or_create_fnhe() (route.c:679-682)
  explains the check as stopping "a Packet Too Big from one path" from…

--

ipv4: Don't raise a cached pmtu from another path's Packet Too Big

This commit adds a check to update_or_create_fnhe(). If an existing
exception is unexpired, has the same genid and has a lower cached pmtu
than the new value, the check leaves it alone. The goal is to stop the
multipath loop in __ip_rt_update_pmtu(), added by 7d3f3b4367f3, from
raising a narrower path's learned pmtu with a value from a wider path.

> Since commit 7d3f3b4367f3 ("net: ipv4: Cache pmtu for all packet paths
> if multipath enabled") __ip_rt_update_pmtu() updates the exception of
> every path of a multipath route, but update_or_create_fnhe() overwrites
> whatever pmtu a path already has. A Packet Too Big from a wider path
> thus raises the pmtu a narrower path has learned, and flows on that path
> blackhole until it gets its own Packet Too Big again.

[Severity: Low]
The message names 7d3f3b4367f3 as the origin of this behaviour. Should
there be a Fixes tag for it?

Fixes: 7d3f3b4367f3 ("net: ipv4: Cache pmtu for all packet paths if multipath enabled")

That commit is in released kernels. Without the tag, stable and backport
tooling may not connect this change to the trees that carry the multipath
loop in __ip_rt_update_pmtu().

> The early return in __ip_rt_update_pmtu() already keeps a pmtu from going
> up on the path the Packet Too Big was looked up on. Do the same for the
> other paths: leave an unexpired exception with a lower pmtu alone.

[Severity: Low]
Can the sequence in the first paragraph happen in normal operation?

When the narrower path's ICMP (say 1300) is processed, the multipath loop
in __ip_rt_update_pmtu() writes 1300, with the same expiry, into the
exception of every path:

    for (nhsel = 0; nhsel < fib_info_num_path(res.fi); nhsel++) {
        nhc = fib_info_nhc(res.fi, nhsel);
        ...
        update_or_create_fnhe(nhc, fl4->daddr, 0, mtu, lock,
                              jiffies + net->ipv4.ip_rt_mtu_expires);
    }

fill_route_from_fnhe() then updates each bound dst. The wider path's dst
also reports ipv4_mtu() == 1300, so a later, larger ICMP for it is dropped
by the existing early return:

    old_mtu = ipv4_mtu(dst);
    if (old_mtu < mtu)
        return;

So the raise only seems possible once the paths' exceptions have
diverged. That could happen through:

- fnhe_remove_oldest() evicting the exception on one nexthop
- a GFP_ATOMIC allocation failure
- a per-device MTU change via fib_nhc_update_mtu() and fnhe_update_pmtu()
- a nexthop shared between routes in different tables

Could the commit message say which of these scenarios is being fixed?

The message also says the change is for "the other paths", but the check
is in the shared helper. It applies to the single-path call as well:

    nhc = FIB_RES_NHC(res);
    update_or_create_fnhe(nhc, fl4->daddr, 0, mtu, lock,
                          jiffies + net->ipv4.ip_rt_mtu_expires);

It also applies to builds without CONFIG_IP_ROUTE_MULTIPATH. So
non-multipath behaviour changes whenever the dst passed in isn't bound to
the exception, for example when ip_rt_update_pmtu() clears flowi4_oif for
bridged encapsulations. Should the message mention this?

> diff --git a/net/ipv4/route.c b/net/ipv4/route.c
> index d0a5f6d77094c..596af782c1fbb 100644
> --- a/net/ipv4/route.c
> +++ b/net/ipv4/route.c
> @@ -676,6 +676,14 @@ static void update_or_create_fnhe(struct fib_nh_common *nhc, __be32 daddr,
>  	}
>  
>  	if (fnhe) {
> +		/* __ip_rt_update_pmtu() caches a pmtu on every path of a
> +		 * multipath route, don't let a Packet Too Big from one path
> +		 * raise the pmtu another path already learned.
> +		 */

[Severity: Low]
This isn't a bug, but the comment describes the check as one path versus
another on a multipath route. update_or_create_fnhe() has no idea which
path an update came from. The check applies to every caller that passes
a non-zero pmtu, including the single-path call in __ip_rt_update_pmtu()
and the nexthop the ICMP was actually looked up on. Could the comment
describe the real scope?

Also, "Packet Too Big" is the ICMPv6 message name and doesn't appear
anywhere else in net/ipv4/. On IPv4, updates reach this code from ICMP
Fragmentation Needed and from non-ICMP callers such as tunnel PMTU
handling. The subject and commit message use the same term.

> +		if (pmtu && fnhe->fnhe_genid == genid && fnhe->fnhe_pmtu &&
> +		    pmtu > fnhe->fnhe_pmtu &&
> +		    time_before(jiffies, fnhe->fnhe_expires))
> +			goto out_unlock;

[Severity: Medium]
Does this really do the same as the early return in
__ip_rt_update_pmtu(), as the commit message says?

The early return compares the new mtu with ipv4_mtu() of the looked-up
dst, which includes the device MTU. This check only fires when a sibling
nexthop already has an exception with a non-zero, same-genid, unexpired
fnhe_pmtu.

Some siblings still get the other path's value, with no comparison
against their own device MTU:

- a sibling with no exception (the else branch below)
- a redirect-only exception (fnhe_pmtu == 0)
- an expired exception

fill_route_from_fnhe() copies that value into rt_pmtu, and
ip_dst_mtu_maybe_forward() uses it before falling back to dev->mtu:

    mtu = rt->rt_pmtu;
    if (mtu && time_before(jiffies, READ_ONCE(rt->dst.expires)))
        goto out;

For example, take an ECMP route with path A on a 9000 MTU device, path B
on a 1400 MTU device, and no exception on B. A Fragmentation Needed of
1500 for a flow on A passes A's early return (9000 >= 1500), and the loop
creates an exception on B with pmtu 1500.

Local flows hashed to B then size packets for 1500. That comes from TCP
MSS via dst_mtu() and from the skb->len > mtu check in
__ip_finish_output(). These packets are larger than B's device MTU, so
they are dropped, and no ICMP comes back to correct it. This lasts until
ip_rt_mtu_expires and happens again each time A learns a new PMTU.

The sibling-path raise itself came in with 7d3f3b4367f3. Since this patch
sets out to stop it, can one path's PMTU update still raise another
path's effective MTU and blackhole it this way?

[Severity: Medium]
Can this early exit drop an MTU lock transition?

The check compares only the pmtu values, and it skips the
fnhe_mtu_locked = lock assignment below. In __ip_rt_update_pmtu(), an mtu
below ip_rt_min_pmtu is clamped up using the looked-up dst's MTU, and
that value is sent to every nexthop with lock set:

    if (mtu < net->ipv4.ip_rt_min_pmtu) {
        lock = true;
        mtu = min(old_mtu, net->ipv4.ip_rt_min_pmtu);
    }

The looked-up dst can belong to a different path than the affected flow.
__build_flow_key() passes 0, 0 for the ports to flowi4_init_output(), so
with fib_multipath_hash_policy=1 the lookup can pick path X while the
flow uses path B.

B can have an unexpired, unlocked exception with fnhe_pmtu below
ip_rt_min_pmtu. fnhe_update_pmtu() leaves it that way after B's device
MTU drops:

    if (fnhe->fnhe_mtu_locked) {
        if (new <= fnhe->fnhe_pmtu) {
            fnhe->fnhe_pmtu = new;
            fnhe->fnhe_mtu_locked = false;
        }
    } else if (new < fnhe->fnhe_pmtu || orig == fnhe->fnhe_pmtu) {
        fnhe->fnhe_pmtu = new;
    }

Raising the min_pmtu sysctl after a pmtu was learned has the same effect.

Say min_pmtu=1000, B is unlocked at 600, and X's effective MTU is 1500. A
Fragmentation Needed of 300 for B's flow gives mtu = min(1500, 1000) =
1000 with lock = true. For B, 1000 > 600 and the exception is unexpired,
so the code jumps to out_unlock.

B stays at 600 with fnhe_mtu_locked false. DF stays set while the next
hop only passes 300, so B's flows blackhole. X is now locked, so later
ICMPs that resolve to X hit this:

    if (ip_mtu_locked(dst))
        return;

B isn't corrected until its exception expires. Before this patch, B was
overwritten with 1000 and locked, so DF was cleared and the traffic was
fragmented and delivered.

Should the check only skip when !lock || fnhe->fnhe_mtu_locked? Or could
it set the lock without raising fnhe_pmtu?

[Severity: Low]
Does any selftest reach this check?

pmtu_ipv4_mp_exceptions in tools/testing/selftests/net/pmtu.sh uses 1500
on both legs, so pmtu > fnhe->fnhe_pmtu is never true.

pmtu_ipv4_mp_asym_exceptions comes later in the series ("selftests: net:
pmtu: Add IPv6 and asymmetric multipath tests"). It sends an 1800 byte
ping via R1, which creates both exceptions at 1400 through the else
branch. It then sends a 1350 byte ping via R2, which lowers both to 1300.
Neither step reaches the check.

Both IPv4 tests give the same result with or without this patch. They
would still pass if the check were removed or inverted. The selftest
commit message only says that the IPv6 tests fail without the preceding
fix.

Could a test case be added where a narrower path's unexpired exception
is offered a larger value from another path and has to keep its lower
pmtu?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261110095903.84813-1-deliran%40verdict.gg
