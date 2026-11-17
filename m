Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794921273;
	b=U7Z+J0pyh0TfR8kQEzZhdF6GWqZ66ldi4f0JJYRPu/mReitdj70J+70dtsri2pIEnnzn
	 qU1YfYfijLjvOpMNddmN50Lwhtc56kKyC3lu8XmKrxMWSe9p2E+spmm9JcZA9eoNcmU9E
	 JoPbJvtWl0AgwUYwQOi7mymAti6d0VabDTAB+BnutTs7+C5htef2dzA/2POaKG5cPtiN1
	 gSCwoYNulaQnzUuvroRRiQn5uxjKvnKkmuVL/vnay3Nj5L5fpCtWvITlc31rcedYTOtLX
	 mG0z1C/ZlxO6OmkubthtyLStFzZ9AAxYROgC6S/9KBOjYSGjoOdLdBjHjfgUqxNij6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794921273;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=looekHX6e4twtMbip1bgNp1IjZhQATWC2oHECjkf+og=;
	b=TRVs61OCL6y1nf1hG+rHjs9Bn4zUjOmUeT0XKxrDNaCX9rbFewsh9xFnkbLlXCWujdSq
	 hVlFei3a5nXzKGkd1TPoOMIuOR/mUSa5rY5jhpCik7nMOqna9hUZgtg8sKAPey+wqNDP2
	 dcyAbmEieTBMuL2aAuGofaaPRLZC4VTdvuE2ZwC0dCLsv96vsm8MewXFZh9EUXRJNDwnB
	 UrAFSqRivZZA39JWfMCecv/V4vzcZjzaFlaAEdEqE/OSP8tuKEviwayrfcidEcoNZipHr
	 MuAsLGfjssROIjdEMv57T3wi0H/u20i364g4OiXhFRwOwTkQoBwTkSGRs1J68q+zCBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="XlK+Tqm/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9027A606A323;
	Tue, 17 Nov 2026 13:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XlK+Tqm/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 892641F000C5;
	Tue, 17 Nov 2026 13:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794921273;
	bh=looekHX6e4twtMbip1bgNp1IjZhQATWC2oHECjkf+og=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=XlK+Tqm/K663qlZkdPbxZn4U3nXLQJMHlLNERHT2hrrE26QbfB4T8BAjvdmD+wUFG
	 WqujEynx89dBb06dfG2iGIRJIYyqtOONfzlMSveNnEpleGExFUCQ/+W+Mokjc38xWo
	 XM8YbKkrYWwEPK6KfGK84hKSRgqRdx0w4m07sL+LSna5cFntC3X3Fu8PsVWCnP1sh1
	 Ow8xfdgqfLpNaSZ074ISy37f8M9BNY+zQ+d4++RpBdHp+StAq3ob5YWwScN2CNkL+H
	 UlHcHOuGdjkQhZwsjb5DXwYL6UOz1alZcriDCRDH7r1oyVZtrDKr7CW0JGDCAe75n8
	 FeS0G9j2BXcxg==
Subject: Re: [PATCH net-next v3 1/3] ipv4: Only lower the pmtu of the other
 paths of a multipath route
From: netdev-bot+sashiko@kernel.org
To: deliran@verdict.gg
Cc: dsahern@kernel.org, idosch@nvidia.com, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 shuah@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Date: Tue, 17 Nov 2026 13:14:32 +0000
Message-ID: <179492127205.3136.8000731978199996430@kernel.org>
In-Reply-To: <20261113122237.88990-2-deliran@verdict.gg>
References: <20261113122237.88990-2-deliran@verdict.gg>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 (1) · Low: 2 (1)

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] In __ip_rt_update_pmtu() (net/ipv4/route.c), the new per-path
  check is written as `if (!lock && mtu > fib_nhc_mtu(...)) continue;`,…
- [Low] The comment on fib_nhc_mtu() (net/ipv4/route.c) says it returns
  the mtu 'as ipv4_mtu() would report it', but it treats an exception…
- [Low] The commit message says the patch will 'Skip a path when the mtu
  would not lower what that path uses now', but __ip_rt_update_pmtu()…

Pre-existing issues:
- [Medium] This patch adds a per-path check inside the multipath loop of
  __ip_rt_update_pmtu(), but the gates before the loop still depend only…
- [Low] The new skip check reads a path's current pmtu through
  fib_nhc_mtu() under rcu_read_lock() only, using plain loads of…

--

ipv4: Only lower the pmtu of the other paths of a multipath route

This commit changes __ip_rt_update_pmtu() so that, on a multipath route,
a nexthop is skipped when the reported mtu would not lower the mtu that
nexthop uses now. A new helper, fib_nhc_mtu(), computes that mtu. An mtu
that is locked because it is below ip_rt_min_pmtu is still written to
every nexthop.

> diff --git a/net/ipv4/route.c b/net/ipv4/route.c
> index d0a5f6d77094c..f0da009f41154 100644
> --- a/net/ipv4/route.c
> +++ b/net/ipv4/route.c

[ ... ]

> @@ -1046,6 +1048,26 @@ out:	kfree_skb_reason(skb, reason);
>  	return 0;
>  }
>  
> +#ifdef CONFIG_IP_ROUTE_MULTIPATH
> +/* The mtu a path currently uses for daddr, as ipv4_mtu() would report it. */
> +static u32 fib_nhc_mtu(struct fib_nh_common *nhc, const struct fib_info *fi,
> +		       __be32 daddr)
> +{
> +	struct fib_nh_exception *fnhe = find_exception(nhc, daddr);
> +	u32 mtu = 0;
> +
> +	if (fnhe && fnhe->fnhe_genid == fnhe_genid(dev_net(nhc->nhc_dev)))
> +		mtu = fnhe->fnhe_pmtu;

[Severity: Low]
Does this match what ipv4_mtu() reports when jiffies == fnhe_expires?

find_exception() removes the exception only when
time_after(jiffies, fnhe->fnhe_expires). At equality it still returns the
fnhe, so fnhe_pmtu gets used here.

ipv4_mtu()->ip_dst_mtu_maybe_forward() uses rt_pmtu only while it has
not expired:

	mtu = rt->rt_pmtu;
	if (mtu && time_before(jiffies, READ_ONCE(rt->dst.expires)))
		goto out;

The existing ip_mtu_from_fib_result() handles this case:

	fnhe = find_exception(nhc, daddr);
	if (fnhe && !time_after_eq(jiffies, fnhe->fnhe_expires))
		mtu = fnhe->fnhe_pmtu;

In that one-jiffy window, an expiring lower pmtu can cause a path to be
skipped. That path then falls back to its device mtu. Should the same
!time_after_eq() check be used here?

[ ... ]

> @@ -1085,6 +1107,14 @@ static void __ip_rt_update_pmtu(struct rtable *rt, struct flowi4 *fl4, u32 mtu)
>  				nhc = fib_info_nhc(res.fi, nhsel);
>  				if (!nhc)
>  					break;
> +				/* old_mtu above is the mtu of the path dst
> +				 * is on, don't raise what another path
> +				 * uses. A locked mtu clears DF and goes
> +				 * to every path.
> +				 */

[Severity: Medium]
This is a pre-existing issue and was not introduced by this patch. The
checks that run before this loop still look only at the path of the dst
that was looked up:

	old_mtu = ipv4_mtu(dst);
	if (old_mtu < mtu)
		return;
	...
	if (rt->rt_pmtu == mtu && !lock &&
	    time_before(jiffies, READ_ONCE(dst->expires) -
				 net->ipv4.ip_rt_mtu_expires / 2))
		goto out;

ipv4_update_pmtu() and __ipv4_sk_update_pmtu() build fl4 with
__build_flow_key(), which passes 0, 0 for the ports. With L4 multipath
hashing, the lookup can land on a different nexthop than the one the
flow uses.

For example, path A has mtu 9000 and path B has mtu 1400. An ICMP
reporting 1500 arrives for an unconnected UDP flow or a tunnel flow on
A, and the portless lookup picks B. Is the update then dropped before
any path is checked? If so, flows on A never learn their pmtu. TCP is
not affected, because inet_csk_update_pmtu() passes the socket's own dst.

Now that the loop checks each path, could the multipath case skip the
old_mtu early return?

> +				if (!lock &&
> +				    mtu > fib_nhc_mtu(nhc, res.fi, fl4->daddr))
> +					continue;

[Severity: High]
Can the locked branch still raise another path's mtu? When the reported
mtu is below ip_rt_min_pmtu, earlier in __ip_rt_update_pmtu() we have:

	if (mtu < net->ipv4.ip_rt_min_pmtu) {
		lock = true;
		mtu = min(old_mtu, net->ipv4.ip_rt_min_pmtu);
	}

old_mtu is ipv4_mtu(dst), so it only reflects the path of the dst that
was looked up. Because !lock short-circuits the check, this locked value
is written to every nexthop. It is never clamped to that nexthop's own
mtu.

A nexthop whose device mtu is below this value would get a locked pmtu
it cannot carry. That happens when the device mtu is below the default
min_pmtu of 552. It also happens when net.ipv4.route.min_pmtu has been
raised above a slower path's device mtu, for example min_pmtu=1400 with
a 1380 mtu tunnel nexthop. That sysctl has extra1 = &ip_min_valid_pmtu
but no upper bound. The write also replaces a lower locked pmtu that the
path learned earlier.

Clearing DF doesn't seem to help. ip_dst_mtu_maybe_forward() uses a
locked, unexpired rt_pmtu as is, with no cap at dev->mtu. It does this
for both local output and forwarding:

	if (READ_ONCE(net->ipv4.sysctl_ip_fwd_use_pmtu) ||
	    ip_mtu_locked(dst) ||
	    !forwarding) {
		mtu = rt->rt_pmtu;
		if (mtu && time_before(jiffies, READ_ONCE(rt->dst.expires)))
			goto out;
	}

Flows on that path would then build or fragment packets to the raised
size, and the fragments are still too big for the device. This lasts
until the exception expires.

The commit message describes exactly this failure:

  A path whose device or route mtu is below it, or that already
  learned a lower pmtu, ends up with a pmtu above what it can carry

It still seems reachable through the locked branch. The behaviour is
older than this patch, but the subject and the loop comment suggest it
is now covered.

Would passing min(mtu, fib_nhc_mtu(nhc, res.fi, fl4->daddr)) with lock
still set reach every path and clear DF without raising any of them?

[Severity: Low]
The commit message says:

  Skip a path when the mtu would not lower what that path uses now

The comparison is a strict >, so an mtu equal to the path's current mtu
is not skipped. fib_nhc_mtu() also ignores fnhe_mtu_locked. Both
ipv4_mtu() and the single-path code (if (ip_mtu_locked(dst)) return;)
honour it.

Suppose path B has a locked exception at 552 from an earlier ICMP below
min_pmtu. A non-locked update of exactly 552 then arrives for a flow on
path A. B is not skipped, and update_or_create_fnhe() does:

		if (pmtu) {
			fnhe->fnhe_pmtu = pmtu;
			fnhe->fnhe_mtu_locked = lock;
		}

Would this clear the lock on B? B would then send with DF set again, and
forwarding on B would stop using the pmtu. Should the check be >=, and
should a path with a locked exception be skipped?

>  				update_or_create_fnhe(nhc, fl4->daddr, 0, mtu, lock,
>  						      jiffies + net->ipv4.ip_rt_mtu_expires);

[Severity: Low]
This is a pre-existing pattern and was not introduced by this patch.
fib_nhc_mtu() reads fnhe_pmtu under rcu_read_lock() only. Then
update_or_create_fnhe() takes fnhe_lock and writes fnhe_pmtu without
comparing it again.

Two concurrent updates for the same daddr could race. Say one CPU
reports 1400 and another reports 1300, and both see path B at 1500.
Neither skips B, and they can finish in either order. B could end up at
1400 right after it learned 1300.

The single-path code has the same lockless check before
update_or_create_fnhe(). Is "don't raise what another path uses" meant
to hold under concurrent updates?

>  			}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261113122237.88990-1-deliran%40verdict.gg
