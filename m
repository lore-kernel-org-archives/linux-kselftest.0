Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6173B330662;
	Mon, 25 May 2026 16:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779725338; cv=none; b=pFa8wf6CIismF7QKlbfxHwog+SXnnJaCzYcwnm5DQ9XDbYCYvo6jVmngFpo/9WntbDlp6Dv8Q8otLU5AB/ii1nwppHN8bQFF8U6jR8tIDUUqprOrhwMcFYbdmeoxLmPnZS4mP5Bc5LPMJ0rFhCeNrl+tW9iRNQz8hch3ofJKw08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779725338; c=relaxed/simple;
	bh=rM9BwRER1boellkdKnucpko4Y9X0/MCLHSciP9OkkHI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bN052mXQ6tzP2VvvTt2rg79Wwu3LrDnXJbW1sZ1LtlmPtCn8+oKK5EpgmeLLVM/JTxfihJ7px/Zpf/WUud+Sr/CJAiu04nzL6LjWmTMyLgVpYxH+sIJsWJYvJUJu826/JgV+NrxL/j35cKC1T3KjI7r/8he6/BMcgeaaiNJAYEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jaABHnP+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jaABHnP+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D1D11F000E9;
	Mon, 25 May 2026 16:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779725336;
	bh=oOU5uSkrhQLxIuSJAd+ojMDsW+n2wuLgMmdSPIARMBI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=jaABHnP+F70I3OmQph8YY4YBrDnDFK2YCngQ5uh6hBh8bRENishIEvf/A54Q++c/N
	 OWi+phYPtHu/OPtxmQgddABrDBcoGkHoVYQ+AJ2BRLVVXjomJ+cA8tp8SeatNS3A8x
	 mHCXAdkKiFQS+Fj6ZnLZS4tQoRL8PYglFG2rPWLfHTxHBQJp86WJy8LDWb/RWPEWWI
	 tr1tLCdV9OqvAisRn/g3AM4RWjZvMJ+U+PcyLsw2lLFpRv3MSt5QqXWO9P2Hfbe3Qg
	 wqGhBNzJ/kURg5zp4rBPmePFKynCX0ULwaTkdQ1MuNntb0gJMFDg6BDaAzhFC0wCQV
	 4ljp1MlKPBG5g==
Date: Mon, 25 May 2026 09:08:55 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Fernando Fernandez Mancera <fmancera@suse.de>
Cc: Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, horms@kernel.org, edumazet@google.com,
 dsahern@kernel.org, davem@davemloft.net
Subject: Re: [PATCH 3/3 net-next v4] selftests: net: add test for IPv4
 devconf netlink notifications
Message-ID: <20260525090855.43cf453a@kernel.org>
In-Reply-To: <7fb927ab-591c-4c07-9f85-31697b80a366@suse.de>
References: <20260510081528.5257-1-fmancera@suse.de>
	<20260510081528.5257-3-fmancera@suse.de>
	<20260513193544.47970cb8@kernel.org>
	<bd560c89-c71f-4ef5-a0fd-5ea096a0f767@suse.de>
	<20260514162429.366b94c9@kernel.org>
	<f528360c-18b3-46e5-8ba8-88f921203716@suse.de>
	<20260515181623.5a44140e@kernel.org>
	<f5cae72f-93c7-41d7-b7db-2b60281afb72@suse.de>
	<20260518142346.4c0903de@kernel.org>
	<54f7f213-9783-42c0-8ae8-51a6b65b7b5d@redhat.com>
	<6539e000-2bb5-4cda-a8b7-b09e5e0d66a9@suse.de>
	<7fb927ab-591c-4c07-9f85-31697b80a366@suse.de>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 25 May 2026 17:53:04 +0200 Fernando Fernandez Mancera wrote:
> On 5/19/26 9:24 AM, Fernando Fernandez Mancera wrote:
> > On 5/19/26 9:17 AM, Paolo Abeni wrote:  
> >> Ideally I think extending iproute2 would be the better solution.
> >> @Fernando: perhaps you could update the self-test accordingly, adding an
> >> explicit check for the iproute subcommand. If `ip netconf set` is not
> >> available skip the test, so that iproute2 patches could land later.
> >>
> >> Does the above look feasible?
> >>  
> > 
> > Yep. I agree. Okay, let's do that :-)  
> 
> As discussed in the thread, Jakub can you pick the other patches or 
> should I repost the series without the selftest? I am now working on the 
> iproute extension FWIW.

How long will the iproute2 extension take? If it's matter of days maybe
we should wait and base the selftest on it?
