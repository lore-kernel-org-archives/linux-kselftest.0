Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF50C3921E6;
	Wed, 30 Sep 2026 03:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790740343; cv=none; b=iW3ygV5E1n/D4h/hViBwfuEGwdzQjThj09Rxt5RN11WEyblm7NcjhyhYYJ9FpD1Lyob3vuSLg9r3zbIycH0GueIDe1AwhvRC+PPcjie4aVYn0G3K+ahtkdenau6maegC/3B28WdD7+8iRlt7U8rT6ueO39rU6SeSXGqVZWaiIls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790740343; c=relaxed/simple;
	bh=YdiXFHOiEJNV0QDGIm8u6eOt/stAb3WIYoG8AKuX9tU=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Zm49O2hWs/ms/IeAm5NGfi7SthGugxrEJsyifL/wmssu09TGl5QImn9FLKW7DwsyX3BMo8u7019zwbTXuy+qxu3fzUjzHixadc5rGbtcgMOvl0+1/rPjr58F1sx1TOoOALvP3Y03c9NPmPxU/NPpPvKU6JKjjzL+NDm0dT7hLNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L8BCV4J7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L8BCV4J7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D73411F000FF;
	Wed, 30 Sep 2026 03:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790740341;
	bh=lIaHWQukOG20sGvSPj5jA8NFd4ZOLSKKkuI12eMmL/Q=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=L8BCV4J7rdYHtOyovhcRpIlG6fZZcvwK+EHahjp/zRl7kEI9OZ6aI/MxHHAa85Q3a
	 /NqicC1NXMO3kZYCVnLTf3ap5k5jUNR6TMX++UcPH1ppkKQ2lE5piVJ5pwVKTsIjP5
	 z0A9YzA6NVkfSts9insp8ttafbgi4u4CHd8xTiQFOStn2R9kDhsRFIo4L7io9nbilo
	 xYE8TXqx7C4X9XJfWFr+70SzF4yL33n6y/lEJuagJ7Cr0f+sACvUtExZuWbMDb77CN
	 yQOCBj1zDf/jjOf7gHi9UbtBqvHPdglMEOlaW0D0qauysWk09hylxbTQhZr6fFh9r3
	 WIk7UYoUqH+aw==
Subject: Re: [PATCH net-next v3 3/6] vxlan: vnifilter: bound the number of
 VNIs one request may touch
From: netdev-bot+sashiko@kernel.org
To: alishmery18@gmail.com
Cc: netdev@vger.kernel.org, idosch@nvidia.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, edumazet@google.com,
 andrew+netdev@lunn.ch, horms@kernel.org, razor@blackwall.org,
 roopa@nvidia.com, shuah@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Wed, 30 Sep 2026 03:52:20 +0000
Message-ID: <179074034041.434549.3857875143564705061@kernel.org>
In-Reply-To: <20260927215209.2581830-4-alishmery18@gmail.com>
References: <20260927215209.2581830-4-alishmery18@gmail.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The changelog justifies capping delete as well as add by saying
  the two "both walk the same span and hold rtnl the same way".
- [Low] The commit message says the 4096 limit follows "the usable VLAN
  ID space".
- [Low] At this commit, the dump path can emit a VXLAN_VNIFILTER_ENTRY
  that the new request parser refuses.

--

vxlan: vnifilter: bound the number of VNIs one request may touch

This patch caps the number of VNIs that one RTM_NEWTUNNEL or RTM_DELTUNNEL
message may add or delete at 4096. The count is summed across all
VXLAN_VNIFILTER_ENTRY attributes and checked in a new
vxlan_vnifilter_check_msg() before any entry is applied. The range
extraction moves into vxlan_vni_filter_entry_range() so the check and the
dispatch path use the same range.

> That walk is the cost being bounded, not the memory: an add allocates a
> VNI node and a per-CPU stats block per VNI, a delete creates neither,
> but both walk the same span and hold rtnl the same way, so both are
> bounded.

[Severity: Low]
Is "both walk the same span" accurate for delete? vxlan_vni_del() returns
-ENOENT for a VNI that is not installed:

drivers/net/vxlan/vxlan_vnifilter.c:vxlan_vni_del() {
    ...
	vninode = rhashtable_lookup_fast(&vg->vni_hash, &v,
					 vxlan_vni_rht_params);
	if (!vninode) {
		err = -ENOENT;
		goto out;
	}
    ...
}

vxlan_vni_add_del() then stops the walk at the first error:

		if (err)
			goto out;

So an RTM_DELTUNNEL walk covers the full span only when every VNI in it is
installed. That worst case can happen after several capped adds, so there
is still a reason to bound delete. The wording could be more precise,
though.

The changelog says that installs can be split across requests and that
vxlan_vnigroup_uninit() is exempt. It does not say that a user who
installed a contiguous run of more than 4096 VNIs can no longer delete it
in one message. The same applies to re-issuing RTM_NEWTUNNEL over that run
to change the group. vxlan_vnifilter_check_msg() charges the full requested
span, whatever is actually installed.

Could the changelog spell out this user-visible narrowing?

> The limit is 4096, following the usable VLAN ID space, since vnifilter
> is mainly used on bridged devices where the VNI is derived from the
> VLAN.

[Severity: Low]
This isn't a bug, but is "usable" the right word here? The usable 802.1Q
VLAN IDs are 1..4094. br_vlan_valid_id() in net/bridge/br_private.h only
accepts:

	bool ret = vid > 0 && vid < VLAN_VID_MASK;

4096 is the size of the full 12-bit VID field, which includes the reserved
IDs 0 and 4095. The in-code comment on VXLAN_VNI_FILTER_MSG_MAX says "the
VLAN ID space", which reads fine.

> diff --git a/drivers/net/vxlan/vxlan_vnifilter.c b/drivers/net/vxlan/vxlan_vnifilter.c
> index 9cffaf4998a98..13f4e115701ac 100644
> --- a/drivers/net/vxlan/vxlan_vnifilter.c
> +++ b/drivers/net/vxlan/vxlan_vnifilter.c

[ ... ]

> +static int vxlan_vnifilter_check_msg(const struct nlmsghdr *nlh,
> +				     struct netlink_ext_ack *extack)
> +{
> +	struct nlattr *vattrs[VXLAN_VNIFILTER_ENTRY_MAX + 1];
> +	struct nlattr *attr;
> +	u32 vnis = 0;
> +	int err, rem;
> +
> +	nlmsg_for_each_attr_type(attr, VXLAN_VNIFILTER_ENTRY, nlh,
> +				 sizeof(struct tunnel_msg), rem) {

[ ... ]

> +		vnis += vni_end - vni_start + 1;
> +		if (vnis > VXLAN_VNI_FILTER_MSG_MAX) {
> +			NL_SET_ERR_MSG_ATTR_FMT(extack, attr,
> +						"Request asks for more than %u VNIs",
> +						VXLAN_VNI_FILTER_MSG_MAX);
> +			return -EINVAL;
> +		}

[Severity: Low]
At this point in the series, can a dump emit an entry that this check then
rejects?

vxlan_vnifilter_dump_dev() merges any contiguous run of VNIs with the same
remote into a single START/END entry. It puts no bound on the span:

drivers/net/vxlan/vxlan_vnifilter.c:vxlan_vnifilter_dump_dev() {
    ...
		if (!dump_stats && vnirange(vend, v) == 1 &&
		    vxlan_addr_equal(&v->remote_ip, &vend->remote_ip)) {
			goto update_end;
    ...
}

A device can still hold more than 4096 contiguous VNIs installed over
several requests, because vxlan_vni_rht_params uses
.max_size = VXLAN_N_VID. If such a dumped entry is replayed in one
RTM_NEWTUNNEL, vxlan_vnifilter_check_msg() returns -EINVAL.

The next patch in the series, "vxlan: vnifilter: clamp the dumped VNI
range to the request limit", fixes this. It adds
vnirange(vbegin, v) < VXLAN_VNI_FILTER_MSG_MAX to the merge condition, and
the selftest commit checks the dump/replay round trip.

Would it make sense to put the clamp before this patch, or fold it in, so
dump and request stay consistent at every commit in the series?

> +	}
> +
> +	return 0;
> +}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260927215209.2581830-1-alishmery18%40gmail.com
