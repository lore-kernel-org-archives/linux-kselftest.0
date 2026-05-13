Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5B52110E;
	Wed, 13 May 2026 00:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778630479; cv=none; b=gz/3HeY3FYXPuB1IkagUVZF/6/GoIAEVmF5roxS4gQoElLIOkbyWO7tf5d1evVLKiB8a6SlsCJ7u+tHbNgUczsYY1pFNLqpZ8zktecb+lu/Vif5desTM9uBITZ3RUH8gmZAi3WTk8bASo0gnZp4fRGh0vqMcdr5oRBRuZ8dT+pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778630479; c=relaxed/simple;
	bh=S/fn4xRDt8ObUwGysDc0YJsMyM1sgLP/VM/201wmV4I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=asNgDO2JddnHY8e4AdeLn88PovDbdSRSvf0j+7dTRrv/ErozxNCLkWaxik7CnP6IjynGyoXg4P+5Kb2kcwyn20Y7+CgB1rfhNgLX3G8Ncy+NPTuCWqD2FUn+ZRHn3mGEiLRsVP8vqKupkc9/znyyr1fVSf225dj46ocag56lxbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ULIax2fY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ULIax2fY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD6C4C2BCB0;
	Wed, 13 May 2026 00:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778630479;
	bh=S/fn4xRDt8ObUwGysDc0YJsMyM1sgLP/VM/201wmV4I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ULIax2fYfREUT1rsRJw09x8OSop8PSiDcz6Oc3F/oC6Cb3menW8GfaTuuCw8DjN6H
	 UqAGy/GN/5qNETdTBaITs5z+gMkyVVhzA9ZapVDGMgBydDRb9z9EeP1PRUuJGJUpBl
	 o6jH9QxjgZU9XLaIhMdFezr3ZvolpNWwAxU5r9Lhy8XnAufzSqnom6R/ifSnFzsxug
	 1+uu/sT5NX68GgS++/H5zGFdK4j+OJoF8nPPS6t+cuREMGVYJXBCd8cGWqSqRvGz8Z
	 Wa8P9ES7bOwAassG4Ua3/H/J6Oujaqc2NKx/1ys9t8y+P7huKli5Jzjxyhbv14XFtc
	 3zmNQ2AZIYR9g==
Date: Tue, 12 May 2026 17:01:17 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Ido Schimmel <idosch@nvidia.com>
Cc: Fernando Fernandez Mancera <fmancera@suse.de>, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, horms@kernel.org, pabeni@redhat.com,
 edumazet@google.com, dsahern@kernel.org, davem@davemloft.net,
 =?UTF-8?B?xYF1a2Fzeg==?= Stelmach <steelman@post.pl>
Subject: Re: [PATCH 1/2 net v4] ipv6: addrconf: fix temp address generation
 after prefix deprecation
Message-ID: <20260512170117.0d7034f3@kernel.org>
In-Reply-To: <20260511122645.6233-2-fmancera@suse.de>
References: <20260511122645.6233-2-fmancera@suse.de>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 11 May 2026 14:26:45 +0200 Fernando Fernandez Mancera wrote:
> When a router temporarily deprecates an IPv6 prefix (either by sending a
> Router Advertisement with Preferred Lifetime = 0 or by letting the
> lifetime expire) and later restores it, the kernel permanently loses its
> ability to generate temporary privacy addresses (RFC 8981) for that
> prefix.
> 
> This happens because the address worker attempts to generate a
> replacement temporary address when the current one nears expiration. As
> the base prefix is deprecated already, the generation fails after
> marking the temporary address as already having spawned a replacement
> (ifp->regen_count++).
> 
> When the router eventually restores the prefix, the temporary address
> becomes active again. However, once it naturally expires, the address
> worker sees this temporary address already tried to generate one and
> skips the regeneration.
> 
> Fix this by checking if all temporary addresses for a given prefix have
> already tried to spawn a replacement when processing a new RA. If so,
> spawn a new temporary address.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")

No feedback on the patch itself, but I wanted to check - Ido, do you
think this is worth handling as a fix? Sounds like this scenario never
worked.
