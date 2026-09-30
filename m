Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568BC37AA86;
	Wed, 30 Sep 2026 03:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790740341; cv=none; b=QiyoXeDZTRTscPsOeucQDjvPUvOnAkuNbRDDNZ3HWFPVZhYayN6kLeeTIIvkiEmJQKPNlo77sfGl97DIAGMlR07dquImgF/udZgz2XZojqxbdkqCZVMAajo/UEjqQgRZoCzELSklnWAcKYzZm9MdAbFC6GpG7jIxbXOkIBtUhec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790740341; c=relaxed/simple;
	bh=PQulKUagK/hx+K9OD+4u1945gC9NJnHDw3gILbmknhM=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jR+o52F6dTpeVJCa9CgMD+zmdNb8OkGW4uLonQXrJjbaJIpR5XnAt/CLL6Z7VQcl2qp0s+fFHxrvCBH8m+4J+t1V3MOCwUuJUvRKXI4b7OKtJNu30IRXlazBE6xZRTIttpAp8bZ59BFZnvWk5TD4MYYAlUUTtXlgvuZgLzu9N9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Er6B4J08; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Er6B4J08"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BA351F00893;
	Wed, 30 Sep 2026 03:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790740340;
	bh=uIWHzJ+gZ7ymB62EEMiGcRSLYz+rrOzqCzhM7YIXV30=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Er6B4J08oVt0vXHJisLC+ZUQL7aqru7ADxFQ/tb79HMLU+lONsobtXK4DrZN84oDk
	 epajy9GkLFlOlp1haOcI+DAS7cYDGg0bf7uLrfsiLy1mLYGTAgN1VKKKE1EYaEqaG4
	 dAQ76FhMuYa1dwhro4JF6Da/MTXDpibFhMWSSqZD3uYROk7O4gd12h9yP3KGBb9NKV
	 A4RJr+a8AnQlncfiBzkuo05y0HKImonyPlW2Vtztbc1Vb5s8Hey9RKxWykM95H4G+E
	 Uah5+qUZ+9iOitTxeSVjspEBAfej6Y4aQKe4+rcSTFasJEtvUUviqmzpKuz8wPRRyh
	 8iNUDjGU3xaVg==
Subject: Re: [PATCH net-next v3 2/6] vxlan: vnifilter: reject VNIs outside the
 24-bit space
From: netdev-bot+sashiko@kernel.org
To: alishmery18@gmail.com
Cc: netdev@vger.kernel.org, idosch@nvidia.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, edumazet@google.com,
 andrew+netdev@lunn.ch, horms@kernel.org, razor@blackwall.org,
 roopa@nvidia.com, shuah@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Wed, 30 Sep 2026 03:52:19 +0000
Message-ID: <179074033905.434549.17567477957506954682@kernel.org>
In-Reply-To: <20260927215209.2581830-3-alishmery18@gmail.com>
References: <20260927215209.2581830-3-alishmery18@gmail.com>
X-sashiko-severity: Medium
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

Critical: 0 · High: 0 · Medium: 1 (1) · Low: 0 (3)

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] This commit fixes a real denial-of-service that users can
  trigger, but it has no Fixes: tag and no stable marking.

Pre-existing issues:
- [Medium] At this commit, both endpoints are limited to 0..0xffffff, but
  a single RTM_NEWTUNNEL entry such as START=0 END=0xffffff (or END…
- [Low] The vxlan FDB netlink path takes NDA_VNI and NDA_SRC_VNI with
  nla_get_u32() and never checks them against VXLAN_N_VID.
- [Low] A reversed range (START > END, e.g. START=100 END=50) passes
  vxlan_process_vni_filter(), which rejects only `!vni_start &&…
- [Low] VNI 0 can be added as part of a range but cannot be added,
  updated, or deleted on its own.

--

vxlan: vnifilter: reject VNIs outside the 24-bit space

This commit adds NLA_POLICY_FULL_RANGE validation to the
VXLAN_VNIFILTER_ENTRY_START and VXLAN_VNIFILTER_ENTRY_END attributes. Both
are limited to 0..VXLAN_N_VID - 1. It also changes the loop counter in
vxlan_vni_add_del() from int to u32, which stops the loop from running
without bound when end_vni is 0xffffffff.

> diff --git a/drivers/net/vxlan/vxlan_vnifilter.c b/drivers/net/vxlan/vxlan_vnifilter.c
> index d391ec5796610..9cffaf4998a98 100644
> --- a/drivers/net/vxlan/vxlan_vnifilter.c
> +++ b/drivers/net/vxlan/vxlan_vnifilter.c
> @@ -459,9 +459,15 @@ static int vxlan_vnifilter_dump(struct sk_buff *skb, struct netlink_callback *cb
>  	return err;
>  }
>  
> +static const struct netlink_range_validation vni_filter_vni_range = {
> +	.max = VXLAN_N_VID - 1,
> +};
> +
>  static const struct nla_policy vni_filter_entry_policy[VXLAN_VNIFILTER_ENTRY_MAX + 1] = {
> -	[VXLAN_VNIFILTER_ENTRY_START] = { .type = NLA_U32 },
> -	[VXLAN_VNIFILTER_ENTRY_END] = { .type = NLA_U32 },
> +	[VXLAN_VNIFILTER_ENTRY_START] = NLA_POLICY_FULL_RANGE(NLA_U32,
> +							      &vni_filter_vni_range),
> +	[VXLAN_VNIFILTER_ENTRY_END] = NLA_POLICY_FULL_RANGE(NLA_U32,
> +							    &vni_filter_vni_range),
>  	[VXLAN_VNIFILTER_ENTRY_GROUP]	= NLA_POLICY_EXACT_LEN(sizeof_field(struct iphdr, daddr)),
>  	[VXLAN_VNIFILTER_ENTRY_GROUP6]	= NLA_POLICY_EXACT_LEN(sizeof(struct in6_addr)),
>  };

[Severity: Medium]
This fixes a problem that users can trigger, but the trailers have no
Fixes: tag:

    Assisted-by: LLM
    Signed-off-by: Ali Firas <alishmery18@gmail.com>

The bare NLA_U32 policy, the int loop counter and the loop in
vxlan_vni_add_del() all come from:

    f9c4bb0b245c ("vxlan: vni filtering support on collect metadata device")

Before this patch, a single RTM_NEWTUNNEL entry with START=0xffffffff
passed the !vni_start && !vni_end check in vxlan_process_vni_filter(). The
loop then stopped only when vxlan_vni_add() failed. That means either
-ENOMEM, or -E2BIG from the rhashtable: vxlan_vni_rht_params.max_size is
VXLAN_N_VID, so the limit is about 2^25 nodes.

Each iteration allocates a vxlan_vni_node and a per-CPU stats block, does
an rhashtable insert and sends a notification, all under rtnl_lock.
RTM_NEWTUNNEL only needs CAP_NET_ADMIN in the user namespace that owns the
netns.

Should this carry a Fixes: tag for f9c4bb0b245c so that stable kernels
pick it up?

A related point: the changelog says:

    With the nest now linked to this policy, an out-of-range endpoint is
    rejected during netlink policy validation, before
    vxlan_process_vni_filter() runs and before anything is allocated.

That depends on the preceding patch, "vxlan: vnifilter: validate the
VXLAN_VNIFILTER_ENTRY nest". If this patch is backported alone, the
rejection happens in the nla_parse_nested() call inside
vxlan_process_vni_filter(). By then, earlier entries in the same message
have already been applied.

If both patches are meant for stable, could the changelog state this
dependency?

[Severity: Low]
This isn't a bug introduced by this patch, but the FDB netlink path seems
to have the same class of problem. vxlan_fdb_parse() in
drivers/net/vxlan/vxlan_core.c only checks the length of NDA_VNI and
NDA_SRC_VNI:

	if (tb[NDA_VNI]) {
		if (nla_len(tb[NDA_VNI]) != sizeof(u32)) {
			NL_SET_ERR_MSG(extack, "Invalid vni");
			return -EINVAL;
		}
		*vni = cpu_to_be32(nla_get_u32(tb[NDA_VNI]));
	...
		*src_vni = cpu_to_be32(nla_get_u32(tb[NDA_SRC_VNI]));

The FDB get and bulk flush paths do not check the range either.

A remote_vni >= VXLAN_N_VID can be stored, and vxlan_vni_field() then drops
its top byte on transmit. A src_vni that large can never match a received
24-bit VNI.

IFLA_VXLAN_ID, vxlan_mdb.c and now vnifilter all enforce the 24-bit bound.
Would a follow-up doing the same for the FDB attributes make sense? Note
that vxlan_core.c uses cpu_to_be32(VXLAN_N_VID) internally as a sentinel
remote_vni.

> @@ -814,7 +820,8 @@ static int vxlan_vni_add_del(struct vxlan_dev *vxlan, __u32 start_vni,
>  			     int cmd, struct netlink_ext_ack *extack)
>  {
>  	struct vxlan_vni_group *vg;
> -	int v, err = 0;
> +	int err = 0;
> +	u32 v;
>  
>  	vg = rtnl_dereference(vxlan->vnigrp);
>  

[Severity: Medium]
This is a pre-existing issue, but with both endpoints capped at 0xffffff,
one entry with START=0 END=0xffffff still makes the loop in
vxlan_vni_add_del() run about 16.7M times under rtnl_lock, with no
cond_resched(). An entry with END alone does the same, because vni_start
then stays 0:

	for (v = start_vni; v <= end_vni; v++) {
		switch (cmd) {
		case RTM_NEWTUNNEL:
			err = vxlan_vni_add(vxlan, vg, v, group, extack);

Each iteration walks the netns vxlan_list in vxlan_vni_in_use(). It also
allocates a node and a per-CPU stats block with plain GFP_KERNEL, which is
not charged to memcg. A single message can carry many such entries.

The changelog leaves the span limit to the next patch, and later patches
in the series handle it:

  - "vxlan: vnifilter: bound the number of VNIs one request may touch"
    adds VXLAN_VNI_FILTER_MSG_MAX (4096). The limit is summed across all
    entries and checked in vxlan_vnifilter_check_msg() before the dispatch
    loop in vxlan_vnifilter_process().

  - "vxlan: vnifilter: account per-VNI memory to memcg" switches
    vxlan_vni_alloc() and the per-CPU stats allocation to
    GFP_KERNEL_ACCOUNT.

[Severity: Low]
This isn't a bug introduced by this patch, but a reversed range still
returns success. vxlan_process_vni_filter() only rejects the case where
both endpoints are zero:

	if (!vni_start && !vni_end) {

So START=100 END=50 reaches the loop in vxlan_vni_add_del(). The body
never runs, and 0 is returned for both RTM_NEWTUNNEL and RTM_DELTUNNEL.
The new range policy checks each endpoint on its own, not their order.

Later in the series, vxlan_vnifilter_check_msg() documents this as
intended:

	/* A start above the end selects no VNI and costs nothing; leave it
	   behaving as it does today. */

The selftest in that series also checks that an inverted range is
accepted as a no-op.

Is a success reply for a request that does nothing the intended uAPI
here?

[Severity: Low]
This is also a pre-existing issue: VNI 0 is handled inconsistently. With
START=0 END=1, the zero check passes and the loop calls vxlan_vni_add() for
v == 0, which inserts VNI 0.

A later request for VNI 0 alone (START=0, or START=0 END=0) is rejected in
vxlan_process_vni_filter():

	if (!vni_start && !vni_end) {
		NL_SET_ERR_MSG_ATTR(extack, nlvnifilter,
				    "vni start nor end found in vni entry");
		return -EINVAL;
	}

The check tests the endpoint values rather than whether the attributes
are present.

As a result, VNI 0 added through a range can only be removed by another
range that covers it, or by tearing down the device. VNI 0 is otherwise
valid: IFLA_VXLAN_ID accepts it, and the minimum of the new
vni_filter_vni_range is 0.

Should this check look at whether vattrs[VXLAN_VNIFILTER_ENTRY_START] and
vattrs[VXLAN_VNIFILTER_ENTRY_END] are present instead?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260927215209.2581830-1-alishmery18%40gmail.com
