Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834871EEA31;
	Thu, 26 Mar 2026 19:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774551823; cv=none; b=hnVH10yE1QqpLkPmysfIFiB9n8UCQrPV0eY2mncCLk7TiFfnuh7ZALh+OQmcV7QK7fgpTS9LQLxK8vaMkGc/17BEfGUIEAU+D1mA0McDFZ6A/IMcKfcoRr2ROtJ4fdZ2CrW9CCQTSPcqO6FbCMh8Gzmjxq5knoSE9HfSZyXEYNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774551823; c=relaxed/simple;
	bh=XhS3vsFXT6ameFcC2ocqdTNMuW6DssqcgyuUmYHgN1A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P6ktKJvtIwgER4JhclG/U4bboMagKuZQov0mhxGDbDJyU1tjqzRi3hrUXEVoylE/9rnBDx8JwvuyUtSSzs81isWSCmNRztXF9BjF2MH5ocrggUHrEog+FvoAXdHXulqSBOXwNBrKfOkGzfQiofT8qP8pwMCXcjeDgEiJPihHC3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oP0tU7kC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oP0tU7kC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC723C116C6;
	Thu, 26 Mar 2026 19:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774551823;
	bh=XhS3vsFXT6ameFcC2ocqdTNMuW6DssqcgyuUmYHgN1A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=oP0tU7kCos5UpGCBGT2uaUoTHNLK+I/vNvvf1lcp5fBz97vovM2fgg1GxN/Oe5BFC
	 hu5+5ZhVN8ov97no9b/y5WwzAspuJj8Y9VJIBlyQJwPwiNMMpdW783I7zMG9eINGki
	 ToBjPE1Zu6peLQyii6zEIuNLz9jycI2G0xxzCTxVFqCKCJFhcazfO9ZnEfNUiEJcfc
	 SPloJA9nARMtmQzekuvYGnMMg/B5gWc1XSrc52JB4wPNZkGR5CJe9sq3fdrzAtaSzj
	 ShWLPQq71oYD3R19hDCsdxNkFvuq/xQN5LvZpUwe924YdynyISpNFoDH3aF4UdHUdA
	 O6gFqQbHFKjfQ==
Date: Thu, 26 Mar 2026 12:03:42 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 linux-kernel@vger.kernel.org, petrm@nvidia.com, willemb@google.com,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v4 00/10] selftests: drivers: bash support for
 remote traffic generators
Message-ID: <20260326120342.6429fbdc@kernel.org>
In-Reply-To: <20260326132828.805703-1-ioana.ciornei@nxp.com>
References: <20260326132828.805703-1-ioana.ciornei@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 26 Mar 2026 15:28:18 +0200 Ioana Ciornei wrote:
> This patch set aims to add the necessary support so that bash written
> selftests are also able to easily run with a remote traffic generator
> system, either be it in another netns or one accessible through ssh.
> 
> This patch set is a result of the discussion from v1:
> https://lore.kernel.org/all/20260303084330.340b6459@kernel.org/
> Even though the python infrastructure is already established, some
> things are easier in bash and it would be a shame to leave behind the
> bash tests that we already have.

I think this introduces a bunch of regressions, eg:

https://netdev-ctrl.bots.linux.dev/logs/vmksft/forwarding/results/575622/4-local-termination-sh/stdout

https://netdev-ctrl.bots.linux.dev/logs/vmksft/netdevsim/results/575802/18-netcons-resume-sh/stdout
