Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6563655D4;
	Tue, 12 May 2026 23:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778630202; cv=none; b=MvP/BjagbDQP+n57UzWd8Qovi0MxyCIwsVKBJzcWWAPub38Ip8MD+NRtpwGAo7d1iXclkuIQCHNYT74r5ZGge7s7ZboZ+Xlmt9YWQATyFyvqkxV1D71O9LXsTcIOCwVNiH3lVbmoMZ5rjIyAqgTHc2SGpPLt8TNU0pWg+O+NGpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778630202; c=relaxed/simple;
	bh=O9+vFtQJ1OxM9xBTPkg7zSPs5fLrZMg/EyiOeBqJPhU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X8ib1cPWOpnjlb+z1D2gn8xLfT5ekSYYR2++KyGqfYhR7WWjyNS7cKGQfwk2Nu0ZuhU356r6hyAtpjTHF5NnLaE3vuOqUwupC0HK+uHo0qqNPNzypyt9qkE4zv7871aj4nNc2B/v4j1L5gj8NyO9IYjWkC3Ak6F3WsmQrklHj7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DH9SNWvj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DH9SNWvj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DA74C2BCB0;
	Tue, 12 May 2026 23:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778630202;
	bh=O9+vFtQJ1OxM9xBTPkg7zSPs5fLrZMg/EyiOeBqJPhU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DH9SNWvjqn/VlBHbanvjYpVjlXVctgjFIQNPIszIB/D4F7Obrxj+effV9eaNZNFGW
	 IAM2xOLuyCiuqf8giQIkMPdRzcam6ROhK9BwtOPBM8J76j8d3xQ8f+1CBjNB/MlrhW
	 EM6Bztb0lEyh9layxobE4YKQmN10LC6Jtz3h7f9bYEFMl9uDzA9EOdo+P00z7SPGou
	 /jqUWdJupFJYKUu5O527qSDBqElr6bkUBfM248YhhVxH7l+0pU58mfbQODHA738Zyv
	 9351BAAsO/krE9fa99bBKb06+bx6iZNyB86Mbc7dP5X/fdl+vT9QhWW1U2j+U+pC0R
	 cFVy7OmhAB7/w==
Date: Tue, 12 May 2026 16:56:41 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Fernando Fernandez Mancera <fmancera@suse.de>, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, horms@kernel.org, pabeni@redhat.com,
 edumazet@google.com, dsahern@kernel.org, davem@davemloft.net
Subject: Re: [PATCH 2/2 net v4] selftests: fib_tests: add temporary IPv6
 address renewal test
Message-ID: <20260512165641.1f557ba8@kernel.org>
In-Reply-To: <agLenteVpazkwn0j@gmail.com>
References: <20260511122645.6233-2-fmancera@suse.de>
	<20260511122645.6233-3-fmancera@suse.de>
	<agIKdx3q9ewyhq7r@gmail.com>
	<20260511170848.756e9347@kernel.org>
	<agLenteVpazkwn0j@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 12 May 2026 01:08:15 -0700 Breno Leitao wrote:
> On Mon, May 11, 2026 at 05:08:48PM -0700, Jakub Kicinski wrote:
> > On Mon, 11 May 2026 10:01:00 -0700 Breno Leitao wrote:  
> > > Should you check for ra6 before the "setup" above?  
> >
> > Not really. AI bots love to complain about this. But "ra6 command
> > not found" is as good of a message as the explicit skip, honestly.  
> 
> Right, but why call setup() before checking if ra6 is available?

You cut off the sentence from my response which told you why.

Checking dependencies is not a priority for our tests.
