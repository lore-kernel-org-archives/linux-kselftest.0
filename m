Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A373928640B;
	Sat,  8 Aug 2026 16:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786207973; cv=none; b=o+8cPuOAmxp4WrRvfgMexikSx0NETfJD5zrchBcRZvwJe9EWKbP5U1uidZRWiJhghBuBuc4Oo2/ebuhL38EVUITRmkVhBfuqpelIKctrhU8Lybejc0App2B/uwnQsVT8JuvqOEs9KRnLdPixMBdOUnMWuJhe85QHLo3I7sTk+nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786207973; c=relaxed/simple;
	bh=B45CNzD5WP53ELm7PS5h9+/Hdv0ju90U0LHMXQEVSEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ATWHb7UeYySDs3MjNBoeQZnnxEqUD8jYw5YnoZ8yWVHB3cLLqT7JX9PdQ1JgyCE/sZnkWorgVJSOavCJSvkOmrVJ7e8o4nGDnw2Gxe2Os7FHjf4hyvBUELuObtf4aCFShGUZFYYEGehNoOT4+ZY0ffg9x4UiHRa3+5K4ob2AHBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=Uhd8thgJ; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="Uhd8thgJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Gbn1/mfOu1+/sla+IHGuOxuqsEjsN/jwE0Evx83UDMM=; b=Uhd8thgJUY7HMgVP/Tj9e2w082
	rDbd/dth1nELJmsRW0GtEIlYZaU2bwLdU7Wbw93xIRZnt/1lPGaOAmrV9tFasCZB9FIbaHq8pyaKK
	I1QlhjcFkPmj5nJIcVNE+iyHO0JsmXXEpO74I6Qv/ImG+Sz+YSw5BCKJJ0eTiralyZhw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wskHe-00Gjvb-3a; Sat, 08 Aug 2026 18:52:30 +0200
Date: Sat, 8 Aug 2026 18:52:30 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
	shuah@kernel.org, dsahern@kernel.org, idosch@nvidia.com,
	ioana.ciornei@nxp.com, petrm@nvidia.com,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next 2/2] selftests: drv-net: let ethtool stats
 settle before reading
Message-ID: <529d558c-7f6f-4654-be6a-65f55cda4001@lunn.ch>
References: <20260808163653.2460381-1-kuba@kernel.org>
 <20260808163653.2460381-2-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260808163653.2460381-2-kuba@kernel.org>

On Sat, Aug 08, 2026 at 09:36:53AM -0700, Jakub Kicinski wrote:
> Some devices refresh the statistics exposed via ethtool only
> periodically, every stats-block-usecs (as reported by ethtool -c).

Interesting. I did not know that existed. Which also suggests not many
drivers actually set it.

I will keep an eye out for drivers which should set this, but don't.

  Andrew
