Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4318E35CBB6;
	Wed, 11 Feb 2026 21:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770846201; cv=none; b=hl6mx3Z/v9v6bhNC6wZQwgNW3VXuEP1PXZag5V6wSDk6bRTwxKbUJkth3Ms9ezO7THbPOWdiQ9MFs7/iPEe8ZoQzLRYo0boqj7IqFwE/15EsjVkBcb6hl2uo7F0jo2AnDdgKaqVQRbmpPyJPbbJEfHQFWwsvoohnRobUOtzLQEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770846201; c=relaxed/simple;
	bh=bNROb0Xm5noBpNAsZ86T2IEmyxyNRIYb+fro2hrL7VE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tle34z+c8/Yq67q1C45E6R7dxLENKng8e3TWQSHlDPKszWCk+QkoGn/lNeZVuJbBf8nuP3cTvn+os+Hxm0X+iG+jEgLbALIAW1mJjoPz8imOhBEiy7i491r8F84yQX0a5H6+PyRkwLf7dwGA3Wu9D7ke9Bhc8AxhKUJNgXvM3xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d7GwLPJq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d7GwLPJq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3100BC4CEF7;
	Wed, 11 Feb 2026 21:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770846200;
	bh=bNROb0Xm5noBpNAsZ86T2IEmyxyNRIYb+fro2hrL7VE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=d7GwLPJqptyvu2mMgLGqSkQahZxDJTuw6WPZDdRR153DQiX7ILoOXpHjo+AFvNDeH
	 vLJyxe5+WZt4ltQITakdwkfg0IzORzDNmU1Vx430VEm6YRXEe45Nd+qhM0YBV1h86s
	 xwhOdj99IJaYoHN8XgBFMVNuU/Zf0Tm+7CcFMxnsNbAVQL51A9sHpg2P1JvJlNvRTj
	 +TAqm+SCYbi3fKMVd66WoCOTAuzvcg2NGdOzJCqHRZriLynBT/jsFqo7oEhcigkh4D
	 xmTzHOmNF5N8B+ZYurWvuXU6whSv1/8ZsrdNEpTpZOfgCBQ7eHn9zCPeaEpGkRqKt6
	 73ov9q/gQqH2Q==
Date: Wed, 11 Feb 2026 13:43:19 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Yael Chemla <ychemla@nvidia.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, Willem de
 Bruijn <willemb@google.com>, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, Tariq Toukan <tariqt@nvidia.com>, Gal
 Pressman <gal@nvidia.com>, noren@nvidia.com
Subject: Re: [PATCH net-next v2 1/2] selftests: drv-net: rss: validate min
 RSS table size
Message-ID: <20260211134319.39710c1d@kernel.org>
In-Reply-To: <9f535014-80eb-4f57-b047-3638579bde9a@nvidia.com>
References: <20260131225454.1225151-1-kuba@kernel.org>
	<9f535014-80eb-4f57-b047-3638579bde9a@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 11 Feb 2026 22:10:56 +0200 Yael Chemla wrote:
> Thanks for the test addition. I wanted to raise a concern regarding the
> spread factor requirement that may apply to mlx5 and potentially other
> drivers as well.
> The real issue arises when the hardware's maximum RQT (indirection
> table) size isn't large enough to accommodate both the desired number of
> channels and a spread factor of 4. RX queues/channels serve multiple
> purposes beyond RSS - they're also used for XDP, AF_XDP, and direct
> queue steering via ntuple filters or TC.
> Artificially limiting the number of channels based solely on RSS spread
> requirements would be overly restrictive for these non-RSS use cases.
> In such scenarios, we'd rather have a slightly degraded spread factor
> (< 4) than limit channel availability.
> We'd appreciate any feedback on this approach.

That's fine. In fact IIRC ixgbe (infamously) had more queues than 
it could fit in its RSS table. So none of this is new. At the same
time if user _does_ want to use a lot of queues in the main context
fewer than 4x entries in the indir table is inadequate.

The test is based on production experience, and provides valuable
guidance to device developers.

I'm not sure what you want me to say here.
