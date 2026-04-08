Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F19E339878;
	Wed,  8 Apr 2026 03:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775618442; cv=none; b=PNmPGRpdaRbn71dK2Suqgc8OdC6EpwyvvMVinT24XZbWdDKmMGHoApcT1rCpGpO4aEAbTmp2wEH/UZcS1EHM3V9vtD8B4cMieRgmx86Po2WjfYtjm+uZxtTGEPKLQMlHWaRbaj1cRL2P9LrGE0oUXB2FMm1t7X0MCKWR8idPz18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775618442; c=relaxed/simple;
	bh=5fYzSbBIZzanHUvf0syDINfh8n0Pv92cWbRWWT6sQlM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jf86RWQ+xP1FLKFgKJ4xaWFQGqatvmPxk+HlCOxlTqGQ9cbc66eUJCNasj1rvAYI50j/f9cF2Kl5FYTXP4wkOLq89YgAHALsh/O4C3a8NLFCoyS+qCV2/o6of3HPYJkHcSgVVDPg7dq+2N9EAh868nRumZRRcZpEUA1yGZZvauE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jf0yA7A/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jf0yA7A/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FB66C19424;
	Wed,  8 Apr 2026 03:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775618441;
	bh=5fYzSbBIZzanHUvf0syDINfh8n0Pv92cWbRWWT6sQlM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jf0yA7A/hRCssN9FSok+C6KPjJXlVcbkdiuxpEQAonTrWPsN+dEmaS03gV1TOP/eW
	 APRup4CR+fM7FMNi/x/SX01VVKn2bknK3S2+dUo1C48bkilBRRmY7zvty+O2IeiRnL
	 QO6i2zmdtVAo/2J2ZuzijUC3mAcnC1rqjGY+N1b+5ihsRFZ4Ll0y0xjWq3yoB32OuH
	 Sqj09br+OcbowVyW1oWQ7HtJc+kHVTREeHXsrg8aLddR6YUuNS70DUuzO5EHkqOJxb
	 RKOizVOaQ3+qrUR6kzs22cuS/ICoM26JdCnPP+1458gb16GWaTK7ukbaWUThgqH/XM
	 UdgAqcI07COfg==
From: Jakub Kicinski <kuba@kernel.org>
To: andrea.mayer@uniroma2.it
Cc: Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	horms@kernel.org,
	dsahern@kernel.org,
	david.lebrun@uclouvain.be,
	stefano.salsano@uniroma2.it,
	paolo.lungaroni@uniroma2.it,
	nicolas.dichtel@6wind.com,
	justin.iurman@gmail.com,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net v3 1/2] seg6: separate dst_cache for input and output paths in seg6 lwtunnel
Date: Tue,  7 Apr 2026 20:20:38 -0700
Message-ID: <20260408032039.314762-1-kuba@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260404004405.4057-2-andrea.mayer@uniroma2.it>
References: <20260404004405.4057-2-andrea.mayer@uniroma2.it>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is an AI-generated review of your patch. The human sending this
email says "Seems orthogonal but also legit"
---
seg6: separate dst_cache for input and output paths in seg6 lwtunnel

This commit splits the shared seg6 lwtunnel dst_cache into separate input
and output caches to prevent blind reuse across different routing contexts.

> diff --git a/net/ipv6/seg6_iptunnel.c b/net/ipv6/seg6_iptunnel.c
> index 3e1b9991131a2..d6a0f7df90807 100644
> --- a/net/ipv6/seg6_iptunnel.c
> +++ b/net/ipv6/seg6_iptunnel.c

[ ... ]

> @@ -504,7 +505,7 @@ static int seg6_input_core(struct net *net, struct sock *sk,
>  		/* cache only if we don't create a dst reference loop */
>  		if (!dst->error && lwtst != dst->lwtstate) {
>  			local_bh_disable();
> -			dst_cache_set_ip6(&slwt->cache, dst,
> +			dst_cache_set_ip6(&slwt->cache_input, dst,
>  					  &ipv6_hdr(skb)->saddr);
>  			local_bh_enable();
>  		}

This code appears to cache the dst entry resolved just prior by calling
ip6_route_input(skb).

Does ip6_route_input() assign a NOREF dst to the skb?

If so, this dst is protected only by RCU. If the underlying route is
concurrently deleted, its refcount can drop to zero. When
dst_cache_set_ip6() is called, it attempts to use dst_hold(dst).

If the refcount is already zero, dst_hold() will warn and skip incrementing
the refcount, but dst_cache_set_ip6() will still store the pointer.

Could this cause the cache to hold a dangling pointer, leading to a
use-after-free once the RCU grace period expires?

Should this path use skb_dst_force(skb) or dst_hold_safe(dst) to safely
upgrade the dst to a refcounted reference before it is cached?
-- 
pw-bot: cr
