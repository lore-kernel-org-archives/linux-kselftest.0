Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B4143800C;
	Fri, 24 Jul 2026 13:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784900505; cv=none; b=JXwZ8l5e7L8LeDcPTBwcjafA5/0gOCqX1Q2v3aDiYBQ0+WUAzO3jrtKATO8KwAt3RQDuepBfRohw3jZ7Nh42nGEcMN73TLIfBog4Tqhu98+7K0/OyIjWigV+fzM2XogSox95sXMpl67yJi1m1uyTlFMnbBlKdFXSuG10Ocd2AH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784900505; c=relaxed/simple;
	bh=bHlWrg1n5M2GGH5ZJYmYQmJB7YhlckE5v8nUR+H29/I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j+l1jsedHz69DFsmcPkGAFFPEz6MycpcmHhAuvwc7aTr+3SWEoB8i8A4+7iFARgLRoLaBct3zwLTA0Akp2BBshEWllY3rYRqHez5gYNxtT3S+cBCXJaog1iAbScsN7MsDXrMc10ytr+itIbzE0jC8MRdKpZTtwS3Z2lwFsSbBak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HZH3bpzo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HZH3bpzo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2BC31F000E9;
	Fri, 24 Jul 2026 13:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784900504;
	bh=Zg7HowN6IRRJBpxgazAB8Kza0YO7lDR5qQTnS09VSew=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=HZH3bpzoIaTWaDx2KT4J0S8BzFj30XbHBfcT97HzPy9fdv1c+n2/9iWZ48h19gzWH
	 APBIUfHmb+pOew9wxlc3ILBEXho80ziVxE4Y+RNOVsmzZ12lU9KrLKurSYlAtnBYeo
	 W5HsVZJED8MTZnk2kffBxhohq2JZ23UkPMB/pSv3QOl+0h2PBDsCDMSxBHCJnzFREq
	 ZYh2vrpnhk4I6hsBlkTenA8sCcHrhiKcR8oC45d9Jbc8faKRCmte4kvcQqp8gGyp5+
	 xDfkV2OT9mjYP3qdaJw3TfEwRbmjfSRk65B52Puqf2XrDSR+g4vtuQ8wzVQP8OoixN
	 yVWfujl/lLBjw==
Date: Fri, 24 Jul 2026 06:41:43 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jack Ma <jack4it@gmail.com>
Cc: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v5 0/3] net: nexthop: per-nexthop UDP dst port
 for fdb (VXLAN) nexthops
Message-ID: <20260724064143.09de074e@kernel.org>
In-Reply-To: <20260724-b4-vxlan-fdb-port-v5-0-cd1c6aeee058@gmail.com>
References: <20260724-b4-vxlan-fdb-port-v5-0-cd1c6aeee058@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 24 Jul 2026 00:26:15 +0000 Jack Ma wrote:
> A matching iproute2 change adds the `dst_port` keyword to `ip nexthop`; it
> will be posted to the iproute2 list alongside this series.

Please push the latest patches out to GH so that we can point our CI 
at them and validate the selftest.
