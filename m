Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15B84B9230;
	Sun, 18 Oct 2026 13:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792329395; cv=none; b=i1Njglj6miy4ogTRLibyvt8vnU/34FgyQ0An1nyLzUYbUbBbqK7BUOgIYftzCRz08hE0bEbyvEsYBwybIM99cIvmpB4lo8dnkBLFF/Gc+AWxVY7+Jk2/aV9uP7LnYkSwH+oCvsQjfQyWBOFqXP24zYQMKB7Hx41x/dsL6LNdQOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792329395; c=relaxed/simple;
	bh=/9IUGDoGf/huyyJZYIO40N8NVdb65OVMZ2kjEX5fijw=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=f69R6dMx03zyC5wjLah1NWIHbC54YNC8zR3cX9PAnqu29R3Kc39sMFrRIIGT23ZsJefgJEbaM+x/LtYBXmnyVHVBj4nQqFzMrece0/3qo8Ye4bioUwZfjL9e7RbVaX84/xxDuKTMkshkJopGnBOGq95YICIwtnWRzWHnjC3lcYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ong0em6R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ong0em6R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E34161F000C6;
	Sun, 18 Oct 2026 13:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792329393;
	bh=sKltOVZ9nuP11H9dLZqZO4Bv1mo4TEV5/hw5LOnNVSI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Ong0em6RMLVKhKrlKnrBWDc/7gxamWKH9/x/e3YhLsLkW60nDdGLy344GSOrU9Ydg
	 KyJcVHlmcvG1Y2XuhTE38flJULAjBizVctki2CQZyNHuFOYQ9/StFqLT1Ct1GDRwlQ
	 NadazxGzhooS0+UtsrTT3I93jSahPzqvZG9EKL+jKjBuppr+988czXXhW7y+vLQbBy
	 buet74wHc+AE5uHD+B+PNxa+5yE0wGH3Gh3Pg7X8rnEgE4/G8XAWO/fhloxz/keB/A
	 w9lzmQjst8R/2AJ7Ztp/5/oDzK7fISnHL5V56GpMmWS887HchB/e1ZzVnv2oxieUkw
	 m/3g6UIRKpQAw==
Subject: Re: [PATCH net-next v4 4/7] vxlan: vnifilter: bound the number of
 VNIs one request may touch
From: netdev-bot+sashiko@kernel.org
To: alishmery18@gmail.com
Cc: netdev@vger.kernel.org, idosch@nvidia.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, edumazet@google.com,
 andrew+netdev@lunn.ch, horms@kernel.org, razor@blackwall.org,
 roopa@nvidia.com, shuah@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Sun, 18 Oct 2026 13:16:32 +0000
Message-ID: <179232939246.3135.13085822140784693158@kernel.org>
In-Reply-To: <20261014123814.388557-5-alishmery18@gmail.com>
References: <20261014123814.388557-5-alishmery18@gmail.com>
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

- [Low] The comment above VXLAN_VNI_FILTER_MSG_MAX in
  drivers/net/vxlan/vxlan_vnifilter.c says: "A later patch bounds a…

--

vxlan: vnifilter: bound the number of VNIs one request may touch

This commit adds vxlan_vnifilter_check_msg(). It adds up the VNI spans of
every VXLAN_VNIFILTER_ENTRY in an RTM_NEWTUNNEL or RTM_DELTUNNEL request.
If the total is more than VXLAN_VNI_FILTER_MSG_MAX, the whole message is
rejected before any entry is applied. The range extraction is moved into
vxlan_vni_filter_entry_range() so the check and the dispatch path use the
same logic.

> diff --git a/drivers/net/vxlan/vxlan_vnifilter.c b/drivers/net/vxlan/vxlan_vnifilter.c
> index 5beec29eb84a8..2999dd536625e 100644
> --- a/drivers/net/vxlan/vxlan_vnifilter.c
> +++ b/drivers/net/vxlan/vxlan_vnifilter.c

[ ... ]

> +/* Reject a request touching more than VXLAN_VNI_FILTER_MSG_MAX VNIs before any
> + * of its entries is acted on. Both add and delete walk the span one VNI at a
> + * time under rtnl_lock, so both are bounded. Entries are applied one at a time
> + * and each one notifies as it goes, so a limit checked inside the dispatch loop
> + * would leave the entries ahead of the offending one already applied.
> + */
> +static int vxlan_vnifilter_check_msg(const struct nlmsghdr *nlh,
> +				     struct netlink_ext_ack *extack)

[Severity: Low]
This isn't a bug, but should the comment above VXLAN_VNI_FILTER_MSG_MAX
be updated now that this function exists?

The preceding patch added this to the top of vxlan_vnifilter.c:

/* The dump coalesces a contiguous run of VNIs into entries, and packs entries
 * into netlink messages, of at most this many VNIs each, so every message the
 * dump emits stays within what the input path will accept on replay. A later
 * patch bounds a single RTM_NEWTUNNEL/RTM_DELTUNNEL request to the same number.
 */
#define VXLAN_VNI_FILTER_MSG_MAX	4096

This commit is the later patch that sentence refers to. Once it is
applied, the comment still describes the per-request limit as future work.
The text is also the same at the end of the series.

Could the last sentence say that vxlan_vnifilter_check_msg() applies the
same bound to a single request?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261014123814.388557-1-alishmery18%40gmail.com
