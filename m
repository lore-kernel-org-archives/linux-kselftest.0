Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794807171;
	b=cvP5Ixls8q4LjLVpcw8xiPH3SPGa8yVbjl58s+lQGDjchRqIqtmBTU8gcnUCXjlowQdB
	 qeHr9Hj1ekkTNslBc8qHuw55CIVfAHjfDQiqUcG9Mcmb2E+fhId3EPJsqU/nFMP8kJ3TD
	 yF9iUOPQRSqJowa5RkHs8DE4rQ+v2nurxBWxT2vkR8dpFERjWWowZdFfNz5cGusPqA+V7
	 W6fzSyf7Xsqng9/G4iZmMHyWHyCRgkd9tKvELUdUHYtru3pHrVToHjN40RRQmYj5j8kgE
	 7MZEzxITKZyJRx8rSgweAYm+ejdj15NDxaCTew5VBXb8RI3XczsMqNZbX2wdPYKLxBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794807171;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=SFn2WlVxw0kCG/YWdNkma4tjLFQtGi86pLgIVwkVUIw=;
	b=1xT8uYUN8llfnK+9+Dy1R6XPPeSPelelikC0YSJz3WtyHTFc357QqCG4z6GD0h3Hf8Jv
	 7jAzEeyRf7hQw3z+BG1i3i3mH8Zwgw6mjCAnXgyHwCFGt4QR6mjTyCivhiMvQNtu6Hmdu
	 fKD5LwOPmkgN9XxB8B5pLZdT+XB5PGDRRmnCiI47jMYfb7i6KGeyFY6eSVUZfXAdR4q+4
	 MaMRR+jZ9rQno7j5qAffutcfLi4fwnbkqNTQvY19AlMG79i68XwKPQFQVu9faZi7nPR0f
	 vpmdbTZXTKCbJqVSNuMuAMh9rx1CE7f3rgU2qQtyzweb0/xE/qDtwPhTlCvw9A5CkzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Uq/MnQSc";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A664A606A31C;
	Mon, 16 Nov 2026 05:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Uq/MnQSc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F69F1F000C4;
	Mon, 16 Nov 2026 05:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794807171;
	bh=SFn2WlVxw0kCG/YWdNkma4tjLFQtGi86pLgIVwkVUIw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Uq/MnQScS4Ld0P375a5S4oMVSvaeKhTVNe7TOm8r5h+x84Y6C8OxTRvNykZiUM0EI
	 S1eO9vlUE6COgKxb9jJH6UOyVtWY/KLTy575gTpkx6rLUfQX+fBFMG5E3LgrYzeUtN
	 Wok+tFZeFpksCPnfS+HKldkR6FqKdNkfFc13xi80GC9vYpqvhckBbLfppZS8BphY/i
	 jCE1I3NwJtuj7rF1JOMHRdVoDqwckPEe2+U8DQz92dbBauKSUvMzgMffkutOkvtb7U
	 7UC/ehWuRSIaWJygC0u/TjYAj80JBoEKpBH/N0gACpYd2xkMh2+aqpEAM1s583M/yq
	 U9tC8DsFQ4VUg==
Subject: Re: [PATCH net-next v5 3/8] vxlan: vnifilter: bound the number of
 VNIs one request may touch
From: netdev-bot+sashiko@kernel.org
To: alishmery18@gmail.com
Cc: netdev@vger.kernel.org, idosch@nvidia.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, edumazet@kernel.org,
 andrew+netdev@lunn.ch, horms@kernel.org, razor@blackwall.org,
 roopa@nvidia.com, kuniyu@google.com, petrm@nvidia.com, aroulin@nvidia.com,
 shuah@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Mon, 16 Nov 2026 05:32:49 +0000
Message-ID: <179480716972.3136.12449306559082331677@kernel.org>
In-Reply-To: <20261114221412.255825-4-alishmery18@gmail.com>
References: <20261114221412.255825-4-alishmery18@gmail.com>
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

Critical: 0 · High: 0 · Medium: 1 · Low: 3

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] RTM_NEWTUNNEL/RTM_DELTUNNEL requests that work today now fail
  with -EINVAL whenever the spans of their entries add up to more than…
- [Low] The patch caps the number of VNIs one request walks.
- [Low] The commit message calls the change net-next hardening and "not a
  backport candidate".
- [Low] The comment on vxlan_vni_filter_entry_range() says sharing the
  helper means the count in vxlan_vnifilter_check_msg() "cannot drift…

--

vxlan: vnifilter: bound the number of VNIs one request may touch

This commit adds vxlan_vnifilter_check_msg(). It sums the VNI spans of
every VXLAN_VNIFILTER_ENTRY in an RTM_NEWTUNNEL or RTM_DELTUNNEL message.
If the total is over VXLAN_VNI_FILTER_MSG_MAX (4096), the whole message
is rejected with -EINVAL before any entry is applied. Range extraction is
now shared with vxlan_process_vni_filter() through the new
vxlan_vni_filter_entry_range() helper.

> This is hardening for net-next -- a policy narrowing of what a single
> message may ask for -- and is not a backport candidate.

[Severity: Low]
Could the commit message say who can trigger the unbounded walk? Stable
reviewers need that to decide on a backport.

RTM_NEWTUNNEL is registered without DOIT_UNLOCKED. The only permission
check is in rtnetlink_rcv_msg():

	if (kind != RTNL_KIND_GET && !netlink_net_capable(skb, CAP_NET_ADMIN))
		return -EPERM;

So root in a user namespace can create a vnifilter vxlan device in its
own netns. It can then send one entry spanning 0 to 0xffffff, which
vni_filter_vni_range accepts.

The message says one request can cover the whole 24-bit space. The only
timing it gives is for 1M VNIs (1.6 s). Scaled linearly, the full 16M
range would hold the global rtnl_lock for about 25 s. It would also
allocate a node and a per-CPU stats block per VNI, and before this series
that memory was not memcg-accounted.

Whether this belongs in stable is for the maintainers to decide. Could
the message state the user-namespace reachability and the hold time for
the full range?

> diff --git a/drivers/net/vxlan/vxlan_vnifilter.c b/drivers/net/vxlan/vxlan_vnifilter.c
> index 66a27198c65d2..127ed5b2a2eb7 100644
> --- a/drivers/net/vxlan/vxlan_vnifilter.c
> +++ b/drivers/net/vxlan/vxlan_vnifilter.c

[ ... ]

> +/* Reject a request touching more than VXLAN_VNI_FILTER_MSG_MAX VNIs before any
> + * of its entries is acted on. Both add and delete walk the span one VNI at a
> + * time under rtnl_lock, so both are bounded. Entries are applied one at a time
> + * and each one notifies as it goes, so a limit checked inside the dispatch loop
> + * would leave the entries ahead of the offending one already applied.
> + */

[Severity: Low]
Does capping the number of VNIs fully bound the rtnl hold time? For each
new VNI the walk goes through
vxlan_vni_add_del()->vxlan_vni_add()->vxlan_vni_in_use(). That last
function loops over every vxlan device in the netns:

drivers/net/vxlan/vxlan_core.c:vxlan_vni_in_use() {
    ...
	list_for_each_entry(tmp, &vn->vxlan_list, next) {
		...
		if (tmp_cfg->flags & VXLAN_F_VNIFILTER) {
			if (!vxlan_vnifilter_lookup(tmp, vni))
				continue;
    ...
}

A request within the cap therefore still costs about 4096 * D steps
under rtnl_lock, where D is the number of vxlan devices in the netns. The
caller controls D.

This per-step cost was there before, and the patch does bound the walk
length as it says. The commit message says "That walk is the cost being
bounded". Could it also mention this second factor?

> +static int vxlan_vnifilter_check_msg(const struct nlmsghdr *nlh,
> +				     struct netlink_ext_ack *extack)
> +{

[ ... ]

> +		vxlan_vni_filter_entry_range(vattrs, &vni_start, &vni_end);
> +
> +		/* A start above the end selects no VNI and costs nothing;
> +		 * leave it behaving as it does today.
> +		 */
> +		if (vni_end < vni_start)
> +			continue;

[Severity: Low]
Does the comment on vxlan_vni_filter_entry_range() still hold for an
entry with neither VXLAN_VNIFILTER_ENTRY_START nor
VXLAN_VNIFILTER_ENTRY_END? It says the count "cannot drift from the range
vxlan_process_vni_filter() then acts on". The same question applies to
START set to 0 with END absent or 0.

The helper returns vni_start == vni_end == 0 for these entries. The check
above only skips inverted ranges, so such an entry is counted as one VNI.
vxlan_process_vni_filter() never walks such an entry; it rejects it:

	if (!vni_start && !vni_end) {
		NL_SET_ERR_MSG_ATTR(extack, nlvnifilter,
				    "vni start nor end found in vni entry");
		return -EINVAL;
	}

Take a message whose valid entries add up to exactly 4096 VNIs plus one
empty entry. The extack points at the empty entry and says "Request asks
for more than 4096 VNIs" instead of reporting the missing start/end.

Both paths return -EINVAL, so only the diagnostic and the comment are
affected. Could vxlan_vnifilter_check_msg() report this entry the same
way vxlan_process_vni_filter() does?

> +
> +		/* vni_filter_entry_policy has already bounded both endpoints
> +		 * below VXLAN_N_VID, so one entry adds at most VXLAN_N_VID and
> +		 * vnis cannot wrap before the test below rejects it.
> +		 */
> +		vnis += vni_end - vni_start + 1;
> +		if (vnis > VXLAN_VNI_FILTER_MSG_MAX) {
> +			NL_SET_ERR_MSG_ATTR_FMT(extack, attr,
> +						"Request asks for more than %u VNIs",
> +						VXLAN_VNI_FILTER_MSG_MAX);
> +			return -EINVAL;
> +		}

[Severity: Medium]
This rejects requests that work today. bridge(8) puts each range, or
each comma-separated item, into one VXLAN_VNIFILTER_ENTRY of a single
message. Each of these now fails with -EINVAL:

  bridge vni add dev vxlan0 vni 10000-20000

  a single range covering the whole 24-bit space

  re-adding more than 4096 existing VNIs to change their group

There is no opt-out. Before this patch the only limit was the policy
maximum of VXLAN_N_VID - 1.

The series' own selftest ("selftests: net: test the vxlan vnifilter
request limit and dump replay") expects "bridge vni add dev vxlan-ext1
vni 20000-24096" to fail. Its comment notes that bridge(8) sends one
entry per comma-separated item in a single message. That selftest does
cover the 4096 accept and 4097 reject cases for add and delete.

The commit message says the space "can still be installed in more than
one request". Even so, scripts and configs that use one large range will
break on a kernel upgrade.

The 4096 figure also comes from the VLAN ID space, which does not apply
to collect_md vnifilter devices used without VLAN-derived VNIs.

Should the commit message say that existing bridge(8) usage with ranges
over 4096 VNIs will stop working?

> +	}
> +
> +	return 0;
> +}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261114221412.255825-1-alishmery18%40gmail.com
