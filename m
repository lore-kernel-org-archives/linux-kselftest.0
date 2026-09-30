Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4759224676D;
	Wed, 30 Sep 2026 03:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790740340; cv=none; b=PLuUH4iF9fk7e2j1oZoYz9xBe/Y9nZR6FKb/Dr830HGolEgeMSDr8QyeJElH357SUdbOK7CSATjR8Pn5/XlkryjGhYYcBFFKotc+8g1ttZ49xTjNhvguw4Es2pRfendAeb9S5A/KYSCdZEVnE9G+ZVInDn7QqmoNm2oNapqO7rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790740340; c=relaxed/simple;
	bh=sR1Z2Tu0TX4h7028aVqo9aEPtibcKb0vO2MekE8kzaw=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jX0vqPzlr01U1hzYborplgixZA4oo9/Oer6zmP6l55ZCsftOe8nfFOR/Kk9Zdlp4wey4tKguAquqlFI98FAapdFcF6+0QGM0NT5AnHhQS/snA5FVyEu/p9kxaR5KKRtINgDOzbWa4XLV1mbWgWECRCTdJjBYxbCZYdsA56i91lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q2YqnDlo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q2YqnDlo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F9FB1F000FF;
	Wed, 30 Sep 2026 03:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790740338;
	bh=9cNnFGoevFOeZWAWTmFPoocbC2E0QbIOFTTZj5dLcYc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Q2YqnDlozdrcagf4UodP7SOEorFQH2mBPBEPyWDLjKKl8nrwD6pJUFL4d6xr7Pas/
	 w0+tLGIrQ8dydFlofWU4+c11ikxAXMDjpWfLoS5ZLNbXswBwbRNWaZCNvCp5gyiVvi
	 etjongacgsh5A2c7uY7ICzRy8aqJ40YEI4YEhHqa8j/60OyUCv9sWzBbOTnvFhmy1e
	 1Zoulh8sGaZclQshVhsg9kcri8AjXVwiHdhbUpfyLtmjkmdWunn8eaBLIi3tkolazz
	 ZGRudO+9zbM3k4jrixxZGZr8EQD7/78OvicUPNodeVTVlTQknqvqLjjuwk67PDeKKb
	 ZDYH/7yaQb3OA==
Subject: Re: [PATCH net-next v3 1/6] vxlan: vnifilter: validate the
 VXLAN_VNIFILTER_ENTRY nest
From: netdev-bot+sashiko@kernel.org
To: alishmery18@gmail.com
Cc: netdev@vger.kernel.org, idosch@nvidia.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, edumazet@google.com,
 andrew+netdev@lunn.ch, horms@kernel.org, razor@blackwall.org,
 roopa@nvidia.com, shuah@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Wed, 30 Sep 2026 03:52:17 +0000
Message-ID: <179074033755.434549.2348132981395970201@kernel.org>
In-Reply-To: <20260927215209.2581830-2-alishmery18@gmail.com>
References: <20260927215209.2581830-2-alishmery18@gmail.com>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 1 (1) · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The commit message says more than the patch does.

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, and later patches
  in the series fix it (baseline decision: discard).

--

vxlan: vnifilter: validate the VXLAN_VNIFILTER_ENTRY nest

This patch links the VXLAN_VNIFILTER_ENTRY nest in vni_filter_policy to
vni_filter_entry_policy with NLA_POLICY_NESTED(). The entry attributes are
then checked by nlmsg_parse() in vxlan_vnifilter_process() before any entry
is dispatched. The goal is to reject a message that carries an invalid
entry as a whole.

Link: https://lore.kernel.org/netdev/20260921150904.65a704eb@kernel.org/

> Link the nest to vni_filter_entry_policy with NLA_POLICY_NESTED() so the
> whole message is validated up front, before any entry is acted on. A
> message carrying an invalid entry is now rejected as a unit and installs
> nothing.

[Severity: High]
Is this claim accurate? NLA_POLICY_NESTED() moves only the attribute
policy checks (type, length, unknown attributes) ahead of dispatch. Two
other checks that make an entry invalid still run one entry at a time in
vxlan_process_vni_filter():

drivers/net/vxlan/vxlan_vnifilter.c:vxlan_process_vni_filter() {
    ...
	if (!vni_start && !vni_end) {
		NL_SET_ERR_MSG_ATTR(extack, nlvnifilter,
				    "vni start nor end found in vni entry");
		return -EINVAL;
	}
    ...
	if (vxlan_addr_multicast(&group) && !vxlan->default_dst.remote_ifindex) {
		NL_SET_ERR_MSG(extack,
			       "Local interface required for multicast remote group");

		return -EINVAL;
	}
    ...
}

An empty VXLAN_VNIFILTER_ENTRY nest gets through the new policy, because
validate_nla() returns before it applies the nested policy:

lib/nlattr.c:validate_nla() {
    ...
	case NLA_NESTED:
		/* a nested attributes is allowed to be empty; if its not,
		 * it must have a size of at least NLA_HDRLEN.
		 */
		if (attrlen == 0)
			break;
    ...
}

An entry with only START=0, or with only GROUP, also gets through.

vxlan_vnifilter_process() applies entries in order, stops at the first
error and does not roll anything back:

	nlmsg_for_each_attr_type(attr, VXLAN_VNIFILTER_ENTRY, nlh,
				 sizeof(*tmsg), rem) {
		err = vxlan_process_vni_filter(vxlan, attr, nlh->nlmsg_type,
					       extack);
		vnis++;
		if (err)
			break;
	}

Take an RTM_NEWTUNNEL to a vnifilter device with entry1 {START=100} and
entry2 {}. Entry2 could also be {START=0}, or {START=200, GROUP=239.1.1.1}
on a device with no remote_ifindex. That message passes nlmsg_parse().
Then:

vxlan_vnifilter_process()
  vxlan_process_vni_filter(entry1)
    vxlan_vni_add_del()
      vxlan_vni_add()
        inserts VNI 100, vxlan_vnifilter_notify(..., RTM_NEWTUNNEL)
  vxlan_process_vni_filter(entry2)
    returns -EINVAL

RTM_DELTUNNEL works the same way: earlier deletes are applied and notified.

Isn't this the same "first entry valid, second invalid" case the commit
message says is now fixed?

Later in the series, the vxlan_vnifilter_check_msg() pre-pass from "vxlan:
vnifilter: bound the number of VNIs one request may touch" counts an empty
entry as one VNI. It does neither of these checks, so the case can still
happen at the end of the series.

Should the commit message say that only policy-level invalid entries are
now all-or-nothing? The alternative is to run the START/END presence check
and the multicast/remote_ifindex check over every entry before any entry is
applied.

> diff --git a/drivers/net/vxlan/vxlan_vnifilter.c b/drivers/net/vxlan/vxlan_vnifilter.c
> index dd94085e08865..d391ec5796610 100644
> --- a/drivers/net/vxlan/vxlan_vnifilter.c
> +++ b/drivers/net/vxlan/vxlan_vnifilter.c
> @@ -467,7 +467,7 @@ static const struct nla_policy vni_filter_entry_policy[VXLAN_VNIFILTER_ENTRY_MAX
>  };
>  
>  static const struct nla_policy vni_filter_policy[VXLAN_VNIFILTER_MAX + 1] = {
> -	[VXLAN_VNIFILTER_ENTRY] = { .type = NLA_NESTED },
> +	[VXLAN_VNIFILTER_ENTRY] = NLA_POLICY_NESTED(vni_filter_entry_policy),
>  };

[Severity: High]
This isn't a bug introduced by this patch, but at this commit the entry
policy that is now linked still has no range check on START and END:

	[VXLAN_VNIFILTER_ENTRY_START] = { .type = NLA_U32 },
	[VXLAN_VNIFILTER_ENTRY_END] = { .type = NLA_U32 },

vxlan_process_vni_filter() hands any values other than both-zero to
vxlan_vni_add_del(). That function loops with a signed counter:

	int v, err = 0;
	...
	for (v = start_vni; v <= end_vni; v++) {

With START=0xffffffff and no END, v starts at -1. Compared with the __u32
end_vni it becomes 0xffffffff, and v++ then climbs up from 0.

Can this loop run for a very long time under RTNL? Each iteration allocates
a vxlan_vni_node with per-CPU stats and sends a notification. The loop only
stops on an error.

VNIs >= VXLAN_N_VID are also accepted and stored, so they alias on the
wire.

Later patches in this series fix this. "vxlan: vnifilter: reject VNIs
outside the 24-bit space" adds NLA_POLICY_FULL_RANGE(NLA_U32,
&vni_filter_vni_range) to START and END, and makes the loop counter u32.
"vxlan: vnifilter: bound the number of VNIs one request may touch" caps the
total span at VXLAN_VNI_FILTER_MSG_MAX before dispatch.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260927215209.2581830-1-alishmery18%40gmail.com
