Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852293793C1
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Jul 2026 20:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782939374; cv=none; b=U8M2aPU3DffdQgSZj59ArDgmgA9kclnZcB2ExgvSJ5u8eZB9keLxAAd/FmVOTNVL1+HadKpNmcQJFTdX89Yuf0GVoQWT3HDeV1xxPfLPbyXWWsBu6O3k0OqsO35XNacvRb7F/ot+g9YnLIILMxeTeE/JMPbUy4gAfVsGcHIePSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782939374; c=relaxed/simple;
	bh=K+VK7byg5S8cMNYoHj9J69XbRyDkz0NV05GFcO0pyAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eP8iMYJGuDVZsv67V5wSF6i4HbZ59NT3v4yyj3N+Yna8w4C9N7XnuGdY7pD2Mm5PRBkF288sA8DElF0T2MHbiCV9VYM9TkyQDzXd3SAZNARcLr4jDLaCUQlUm0MIi9ENo+gLfkCpcJJ/x1xz5ankta3Kpt+ce+KRw5e8y1ZMbFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=XwZhNVxB; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="XwZhNVxB"
Message-ID: <7ea61c14-3b43-4e5a-b0d0-4ea69bbe0097@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782939361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F6FBu8HceUpdw44ysEgYmeU2G+E3tC7Rf63pXIGOv3E=;
	b=XwZhNVxBTG8b2as5/ffLC3DPj6ELrYjk/9ael7uI7kRXDAEx6i6smzZRKlxqQdjhB2hcFZ
	LaZuqDfj4LsDrdI6+vxzQ8XEhR0msMfdMa3OqGsu92D4zyna6dZtbJW1PTxpeBfnO01o1r
	5IhwWvGqpp8qGd9Ovc/rmWeR6arrzhA=
Date: Wed, 1 Jul 2026 21:55:35 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net-next 3/3] selftests: net: check multicast group user
 count
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, David Ahern <dsahern@kernel.org>,
 Donald Hunter <donald.hunter@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Ido Schimmel <idosch@nvidia.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>,
 Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
References: <20260630110207.37841-1-sigefriedhyy@gmail.com>
 <20260630110207.37841-4-sigefriedhyy@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20260630110207.37841-4-sigefriedhyy@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 30/06/2026 12:02, Yuyang Huang wrote:
> Extend the RTM_GETMULTICAST dump test to verify IFA_MC_USERS for both
> IPv4 and IPv6 multicast groups.
> 
> Run each protocol test in a fresh network namespace to avoid changing
> host-network state or racing with unrelated multicast users. Join a
> fixed multicast group twice using separate sockets and check that the
> reported user count increases by two.
> 
> Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
> ---
>   tools/testing/selftests/net/rtnetlink.py | 101 ++++++++++++++++++++---
>   1 file changed, 90 insertions(+), 11 deletions(-)
> 

Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
