Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD00472096;
	Sun, 18 Oct 2026 13:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792329392; cv=none; b=XEiDRe9gVYjiS2ENdxH/xTsLVqGmYpjs2JPTSxkebaMmCYAnzv/Lw6uwZdTNTRX5I2OBj+HJIpeMbb9am6EWLj0U2vd63B3og+QsujFa+CJ+/VS3rA9QfjQvA/zzXVzGxEdFPmKQ2jzfcaFIFzUW1HYvyH+PkkCONmA82vRDHJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792329392; c=relaxed/simple;
	bh=BMiujbuuvShvw1tci0C9Aiti6g9ahVFG+/l/Nsvyy9I=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=o5YUC/EoivlNfhJQIWlO776OknnQ9hG2eo3H67tOgH438xTcN6DxTXwcVqDLxNoFcT8HNGd4CD4OW0Jx7DWs5rMQjRtzxN7uR9S1j7QIvbqycmdgEr+6HmpMwb0LJHhiVTD6Y6THtcMzvZfe7NHQ/wvlDIw2o6ZGxvQibsYby3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fnkr5u6c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fnkr5u6c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36B3F1F000C4;
	Sun, 18 Oct 2026 13:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792329390;
	bh=o7bz9p1eiAeuyp5fpXe1YTtCSbS/DPsAoSvBWo9gMgY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Fnkr5u6cAwYHLRb+BpIPFTLwkgVcsQqjtIRSmeoIbuEWtlVE1BEqRkJKTbOoXrABS
	 2GsbJd/8YY2WaaM82GspAnajAKW8RbkupJn1THvyYLPbAOQDBUjfQZ4PZqsnwdwexZ
	 vaHIeYEqOOCAZf2w0ndgBbRrPyAqc77rCoUgEI9Sb631MlqBlrBfGIPA6+ZcNOQ6Wb
	 qoRiRoQBDCuSHr574ySfn6H6ny3yI+NGnheR8zVb9Eu3VmLTOiypkZqSwMEsDUinYU
	 WZm6n5Dd/tM7RzFaIC/6KS7l6qNwgwXhGQOlr39fnmE1gPN3mfltkBpMR7cD11WDbK
	 R9jee703hFEzw==
Subject: Re: [PATCH net-next v4 2/7] vxlan: vnifilter: reject VNIs outside the
 24-bit space
From: netdev-bot+sashiko@kernel.org
To: alishmery18@gmail.com
Cc: netdev@vger.kernel.org, idosch@nvidia.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, edumazet@google.com,
 andrew+netdev@lunn.ch, horms@kernel.org, razor@blackwall.org,
 roopa@nvidia.com, shuah@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Sun, 18 Oct 2026 13:16:29 +0000
Message-ID: <179232938969.3135.9434590437128823317@kernel.org>
In-Reply-To: <20261014123814.388557-3-alishmery18@gmail.com>
References: <20261014123814.388557-3-alishmery18@gmail.com>
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

- [Low] This patch fixes long-standing defects in vxlan_vni_add_del() and
  vni_filter_entry_policy, but it has no Fixes: tag and is posted to…

--

vxlan: vnifilter: reject VNIs outside the 24-bit space

This patch adds NLA_POLICY_FULL_RANGE() checks to
VXLAN_VNIFILTER_ENTRY_START and VXLAN_VNIFILTER_ENTRY_END, which limits
both to VXLAN_N_VID - 1. It also changes the loop counter in
vxlan_vni_add_del() from int to u32, so a range that ends at 0xffffffff
can no longer wrap.

> How many VNIs a single in-range request may span is a
> separate question, bounded by the next patch; that limit is not a policy
> check and does run in the handler.

[ ... ]

> Assisted-by: LLM
> Signed-off-by: Ali Firas <alishmery18@gmail.com>
>
> ---
> v4: no functional change; rebased onto net-next.

[Severity: Low]
Should this patch have a Fixes: tag and go to net instead of net-next?

The int loop counter and the plain NLA_U32 policy entries seem to date
from commit f9c4bb0b245c ("vxlan: vni filtering support on collect
metadata device"), which was merged in v5.18:

    int v, err = 0;
    ...
    for (v = start_vni; v <= end_vni; v++) {

Since then, a request that carries only
VXLAN_VNIFILTER_ENTRY_START=0xffffffff passes this check in
vxlan_process_vni_filter():

    if (!vni_start && !vni_end) {

The loop in vxlan_vni_add_del() then visits 0xffffffff, 0, 1, and so on.
Each pass allocates a vxlan_vni_node and a per-CPU stats block under
rtnl_lock, and the loop only stops on an error such as -E2BIG from the
rhashtable or -ENOMEM. VNIs at or above VXLAN_N_VID are also stored,
while vxlan_vni_field() truncates them on the wire.

Anyone with CAP_NET_ADMIN over the netns can reach this, including root
in a user namespace.

Without a Fixes: tag, will the 24-bit aliasing fix and the signed
overflow fix reach stable kernels?

A backport would also need the preceding commit "vxlan: vnifilter:
validate the VXLAN_VNIFILTER_ENTRY nest". Without its NLA_POLICY_NESTED()
link, the new range policy is only applied per entry, by the
nla_parse_nested() call in vxlan_process_vni_filter().

The commit message also says the span is "bounded by the next patch".
The next patch in the series looks like "vxlan: vnifilter: clamp the
dumped VNI range to the request limit". The cap itself is in "vxlan:
vnifilter: bound the number of VNIs one request may touch", and that
patch says it is not a backport candidate.

Could the reference be corrected so backporters get accurate dependency
information?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261014123814.388557-1-alishmery18%40gmail.com
