Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6F23B2FD9;
	Tue, 17 Mar 2026 22:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773788041; cv=none; b=FHqrilG+AFOrXX8s4F9sJS7mcHZyYKI7P+esmH4hkN5mKjigIqzWV2KJJlWZT1fQYkCO4qiovZBMRQ6xUV0qu8JhBJAxXy0igBO3eYfiyP5xVKJo1jZ6ThTUxcr0rZYgjRHNNpW+tVGCrCBlx4ALODQ67F2W7pEI15kXzpcTeE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773788041; c=relaxed/simple;
	bh=FAObWFLkD069InRJHS6MNR6EjyuV+FnW18Rz4FFWxpY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nW0CpJmNsNXuYIFUMvwNPIMgOU+p9bQMTexBIVCn1D2/c0tX5lJbPlDY3YGXLRP1U4LJN7aW1K89KqUWtSkj6LobJwec3pWgmD9Bnu8ZlotEqDJx2OLMrtpQB4Elo13lPB6QCtFJAOjwVSc2BP+Zx68+WXLOXvO49QoDLF6aK+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TMQkI9fH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TMQkI9fH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3657C4CEF7;
	Tue, 17 Mar 2026 22:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773788040;
	bh=FAObWFLkD069InRJHS6MNR6EjyuV+FnW18Rz4FFWxpY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=TMQkI9fHTKCGKLyQQZySbwqwXFeM9iSmrObVq8Tco+BxzMNvl5aUXZQ4QTA6M5USy
	 UU6tS+PBzcHPRQZNRtHoCqeW2Ji5IpLt4iX1LFj7c6QaAGyq9qUQc458JKmlNUFQZS
	 0DAPgmVOLrwpWuZ9YUOJTFUplEc1kHXw9zCztG/CGJIq+fcITU/iE321mxzG/wykxk
	 3MAkpiJspySH+DveerQnnNfdSH9UqNCLgSHWfCOwtIHnIMGN/lsEO4/dhmcQUYVj5W
	 8ER4N4DDLQ2gG44EmoVkcfcEQLXT1oz7K7Cl4PKdfmutmqqtSNe53QT3VHYM6ZmMy+
	 SQCfeCGeyQ7tw==
Date: Tue, 17 Mar 2026 15:53:59 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Michael Chan <michael.chan@broadcom.com>, Pavan Chebbi
 <pavan.chebbi@broadcom.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, Willem de Bruijn
 <willemb@google.com>, Shuah Khan <shuah@kernel.org>, Maxime Chevallier
 <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next v5 2/3] bnxt_en: Resize RSS contexts on channel
 count change
Message-ID: <20260317155359.33b855b1@kernel.org>
In-Reply-To: <20260317083339.2811865-3-bjorn@kernel.org>
References: <20260317083339.2811865-1-bjorn@kernel.org>
	<20260317083339.2811865-3-bjorn@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 17 Mar 2026 09:33:35 +0100 Bj=C3=B6rn T=C3=B6pel wrote:
> +		if (netif_is_rxfh_configured(dev) &&
> +		    !ethtool_rxfh_can_resize(bp->rss_indir_tbl,
> +					old_tbl_size, new_tbl_size,
> +					dev->ethtool->rss_indir_user_size)) {
> +			netdev_warn(dev, "RSS table resize not possible\n");
> +			return -EINVAL;
> +		}

Now that we know the size of the table that user has set=20
we can skip the netif_is_rxfh_configured(dev) and depend fully on
ethtool_rxfh_can_resize(... rss_indir_user_size) ?

Otherwise we're not making much use of dev->ethtool->rss_indir_user_size
(the one for the default context / context 0).
Regardless of the table size user provided IFF_RXFH_CONFIGURED will be
set.

Which brings me to my last point - I think you can delete
IFF_RXFH_CONFIGURED and have netif_is_rxfh_configured(dev)
operate on ..user_size ? We should probably have a new helper
for when driver lost control over rings and has to reset indir table
forgetting user config (bnxt mlx5 clearing IFF_RXFH_CONFIGURED).
Helper should clear the state and issue a Netlink notification?
