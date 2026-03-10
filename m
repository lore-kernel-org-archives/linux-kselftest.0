Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1114F3A452A;
	Tue, 10 Mar 2026 02:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773110410; cv=none; b=JT+ahX3Nxpz0M6EPpYUG6PeGLwKjO0HNm7PSW07ikZiw+aYYdGHfu0SRROcDfK0EvCRiV/cYqygvJ3NW1yV4zFxfDc4y5mq9YzQaZUCSLJBgwcHfu99+VVCRhKr6RSVO/WHm1GsMljiq10BbNpT0moAH/jOjl9BHd8Ns9EEpbLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773110410; c=relaxed/simple;
	bh=jtURVR/RJJ8ou1akY/yhxYsyOa33Va3g1WfXd9H2qRM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T333ZMF9bqinSj0LFnr040HFTBalJFy4vEYbNEhre/ZkDsdEPsXWIIAT8gq2s1wongTxn/V//Z4YUR5/zpJxY6r9IFNyCOYY5BF38mPTv3HIu+0RTGV0TYSPJkCAAWZugbpPOcxmmYZcUaJfacJ3iOhyPvV3AyqMxUP/NPBxlW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TuHB2PGt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TuHB2PGt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B069C2BC9E;
	Tue, 10 Mar 2026 02:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773110409;
	bh=jtURVR/RJJ8ou1akY/yhxYsyOa33Va3g1WfXd9H2qRM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=TuHB2PGtKz1oiYrvEOvWJodV5e028ijyNCLok9OF79V1uDVtJ/z12HbnRUEDXkXUT
	 fnyc2ut1PncKKyiBzlYDWfhvjXp3SpbnVveNnMwhDQUIghjUb7SF7lt7seJPR8Yf5c
	 ARooEk0p8n6mzd+1ORkk5AugDJWeuPXo8I/wizZRRv9nRDmFOCDF99JfHjcqwsuQth
	 EbdFLBoggt+jd/xsZVPZujm6650KEr4n6fPhQSrGBwlO8vVtDiqAE8oSNAx7mcLcyd
	 Tm84Pi031VeNm1OCr605Xo2d5qnpZ1d5KFu6NvTmFEdZXeWJMzJ9PfFuMLUw4mVaY6
	 XMkBqP8HJWicQ==
Date: Mon, 9 Mar 2026 19:40:08 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Gal Pressman <gal@nvidia.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, <netdev@vger.kernel.org>, Simon Horman
 <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, "Breno Leitao"
 <leitao@debian.org>, David Wei <dw@davidwei.uk>,
 <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH net v2 0/2] selftests: net: fix cmd.process() timeout
 handling
Message-ID: <20260309194008.10f24ba9@kernel.org>
In-Reply-To: <20260308192126.2490631-1-gal@nvidia.com>
References: <20260308192126.2490631-1-gal@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 8 Mar 2026 21:21:24 +0200 Gal Pressman wrote:
> Pass the timeout argument correctly in cmd.process().
> As Jakub noted, fixing the timeout broke the bpftrace() command in
> netpoll_basic.py, so fix it first.

patchwork says this didn't get selftest-ed which usually means there's
going to be a conflict with net-next. Can you respin this against
net-next? 
