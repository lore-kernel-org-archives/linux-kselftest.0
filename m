Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6295B3D7D6C;
	Sun, 18 Oct 2026 13:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792329393; cv=none; b=HT4dNn54BLF1Gg4yiRveIZJrlIaD42EXuUfJcRUQtkZvRA4237JIPCS4kmXCZq4j8hlADRqn+HEaZCEM2JH9zCVirPoQD9+SG95K33VP6/ylVfg1mGaDkPBUvF+j29HbfBoDmAqHbqnBdTC4n/ZOKhYwJ8+34NEFDxg4gSkM7cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792329393; c=relaxed/simple;
	bh=lMpA+iuGf19MfP9l4fBkY32mAMfRHidLrvoEVP0o8E4=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SDoJh86cMKzaYXDQzuLCAn/hinIOS9Yh/h+VyJO5yGtzbivdZhdsU4OUSeHP3eBvMU3LJZTjDZIluw+USmGcHDx3QFdZDMSbmLhnRI0NwYJYIbFCCKIbHLHlxrFtwYRrjVS7zXL8mHzSkuNLvO6Dsen+lwRGIEzHU9LaTRiWX8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jmpqaUlI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jmpqaUlI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 837B91F000C5;
	Sun, 18 Oct 2026 13:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792329392;
	bh=ZVT/DgFM7AnSStXFdi7HK5nCvEMnh6FUs6WZ7gtrADc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=jmpqaUlIvgHwIljaM13zWigNQ43AfkkBOgYU9fq/RtuXUtn0llxalkwdz4OeAsWF7
	 +SZKMdQ4W88yikvb4AIqLDj+vsTqsOLfQNprlLq1FE+9C9xOJkmgmriVDt1hXhXA9K
	 HZ4YU6CK/XY3nyjD9BSKE6f/ioz2YpleYeOCkdUa0IEri4OKNR1je4yeOOZlnUhWp6
	 hcg1jpSUKJH+U6FfrfRB3Naq3kZGjSp78ML12XqAfbizff5+LPK69fV6xeJg5Rr6YZ
	 apH5JZP2WFDiIAx68ylYE/m4FoEn7fbLItPhqZlquv4I+PTG7lsyz4fxrCKrvyyC5c
	 Pi8nGpYHa+WaA==
Subject: Re: [PATCH net-next v4 3/7] vxlan: vnifilter: clamp the dumped VNI
 range to the request limit
From: netdev-bot+sashiko@kernel.org
To: alishmery18@gmail.com
Cc: netdev@vger.kernel.org, idosch@nvidia.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, edumazet@google.com,
 andrew+netdev@lunn.ch, horms@kernel.org, razor@blackwall.org,
 roopa@nvidia.com, shuah@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Sun, 18 Oct 2026 13:16:31 +0000
Message-ID: <179232939107.3135.8359039730969717990@kernel.org>
In-Reply-To: <20261014123814.388557-4-alishmery18@gmail.com>
References: <20261014123814.388557-4-alishmery18@gmail.com>
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
  drivers/net/vxlan/vxlan_vnifilter.c (lines 20-24) describes the order…

--

vxlan: vnifilter: clamp the dumped VNI range to the request limit

This commit adds VXLAN_VNI_FILTER_MSG_MAX and limits
vxlan_vnifilter_dump_dev() in two ways. A coalesced run of VNIs ends once
it reaches the limit, and each netlink message has a VNI budget. As a
result, no dumped message holds more VNIs than the input path accepts in
one request after a later patch in the series.

> diff --git a/drivers/net/vxlan/vxlan_vnifilter.c b/drivers/net/vxlan/vxlan_vnifilter.c
> index 9e15f4de75c99..5beec29eb84a8 100644
> --- a/drivers/net/vxlan/vxlan_vnifilter.c
> +++ b/drivers/net/vxlan/vxlan_vnifilter.c
> @@ -17,6 +17,13 @@
>  
>  #include "vxlan_private.h"
>  
> +/* The dump coalesces a contiguous run of VNIs into entries, and packs entries
> + * into netlink messages, of at most this many VNIs each, so every message the
> + * dump emits stays within what the input path will accept on replay. A later
> + * patch bounds a single RTM_NEWTUNNEL/RTM_DELTUNNEL request to the same number.
> + */
> +#define VXLAN_VNI_FILTER_MSG_MAX	4096

[Severity: Low]
This isn't a bug, but will the "A later patch bounds a single
RTM_NEWTUNNEL/RTM_DELTUNNEL request to the same number" sentence go stale
once the series is merged?

At the end of the series this comment is unchanged. By then, the commit
"vxlan: vnifilter: bound the number of VNIs one request may touch" has
added the request cap. vxlan_vnifilter_process() calls
vxlan_vnifilter_check_msg(), which does this:

    if (vnis > VXLAN_VNI_FILTER_MSG_MAX) {

Once merged, "a later patch" no longer points to anything. The comment
also doesn't say where the input-side limit is enforced.

Could the comment describe the invariant instead? For example, "must
match the per-request limit enforced by vxlan_vnifilter_check_msg()".
Another option is to move that sentence into the patch that adds the
cap.

The dump and input paths agree in the final tree, so this is only about
the comment text.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261014123814.388557-1-alishmery18%40gmail.com
