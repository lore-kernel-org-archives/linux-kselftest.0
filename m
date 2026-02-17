Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DD8307AF4;
	Tue, 17 Feb 2026 21:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771365449; cv=none; b=DCO5D0i9+R2K6UPPlo3jXkRPIuMnBIzOWmzktLIJQLbMuaDjnnR6Bi+rTDVw/SpL0jMeGdG45GSs8KPGZVSmzw//VM1RA+QoWiP8icmc+o+WzMJLqNGTTXZEozEn1ZyMxHFag4KNyE6GFdOZm8KZReKKbuMQIEKr/oA5t/eUIoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771365449; c=relaxed/simple;
	bh=W2ufsggH08gRrzRS8U3a7gxMcAG32wbvfRiJBlb3ok8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qj/Bv2CNC0mFYmU1RaXNl+eBNjYu6HaEfYsPmtAMWNfO7OLKvRjLWGcA5zYqNNfjK/fORAvl2Sn82MDDxLE6APzX+kd4PQwXnaDRp9GlSLG2kvN4kyyoa73GBMf/1IYmTolyE1cB8TH+AamkNKPuJV4kkn0fHJ51156CRK3JA8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z6CpNMAK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z6CpNMAK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 291E9C4CEF7;
	Tue, 17 Feb 2026 21:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771365448;
	bh=W2ufsggH08gRrzRS8U3a7gxMcAG32wbvfRiJBlb3ok8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Z6CpNMAKalMr82UTRBK+jZMkmJehFyxbR6DqneuqV/5ciIqv5gkjXEeZAKIBuMz3S
	 vNhQLCBln42y7kTFPl7ujqB0gxFxPIs1FG9waFdr/Tr6fzMcbLkX9iLY3Z1g1wimac
	 6qyDmtXGkw2nwLKnKvMBMwVVtYfF2tSnT9+gBBWxGUEUHxftir2Lf3nvao4lhPWoLE
	 agSlllEbKVJGozxif+yOl7K89vd/6/i+O1kPSO17JgPG3Tt99kqHzr2SsHmzOJcOK7
	 4Q3AQiCwASr5XNiE7z+ex1W4InDl7lOeV7CmHBNrihtLTuzjxc3cd0vO91p2qoUl60
	 LehtYQ/CHS97w==
Date: Tue, 17 Feb 2026 13:57:27 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Tariq Toukan <ttoukan.linux@gmail.com>
Cc: Yael Chemla <ychemla@nvidia.com>, davem@davemloft.net,
 netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
 andrew+netdev@lunn.ch, horms@kernel.org, Willem de Bruijn
 <willemb@google.com>, shuah@kernel.org, linux-kselftest@vger.kernel.org,
 Tariq Toukan <tariqt@nvidia.com>, Gal Pressman <gal@nvidia.com>,
 noren@nvidia.com
Subject: Re: [PATCH net-next v2 1/2] selftests: drv-net: rss: validate min
 RSS table size
Message-ID: <20260217135727.292acc4e@kernel.org>
In-Reply-To: <ba1885cc-57e7-488b-946b-d08c1644dcaa@gmail.com>
References: <20260131225454.1225151-1-kuba@kernel.org>
	<9f535014-80eb-4f57-b047-3638579bde9a@nvidia.com>
	<20260211134319.39710c1d@kernel.org>
	<dbbe9690-996f-4a63-90a0-baec52c27236@gmail.com>
	<20260212172215.0a3295a0@kernel.org>
	<ba1885cc-57e7-488b-946b-d08c1644dcaa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 16 Feb 2026 10:28:52 +0200 Tariq Toukan wrote:
> >> This ignores multiple other considerations:
> >>
> >> 1. Existing behavior: In general, mlx5e today implies 2x factor, so it
> >> would fail this new test.
> >>
> >> 2. Device resources: In large scale (high num of channels, or high num
> >> of netdevs on the same chip, or both), it is not obvious that increasing
> >> the indirection table size is still desirable, or even possible. To pass
> >> the selftest, you'll have to limit the max number of channels.
> >>
> >> 3. ch_max should win: Related to point #2. Driver should not enforce
> >> limitations on supported ch_max just to fulfill the recommendation and
> >> pass the test. I prefer flexibility, give the admin the control. That
> >> means, driver would use 4x factor (or larger) whenever possible, but
> >> would not block configurations in which the 4x factor cannot be satisfied.  
> > 
> > Oh I see.. I wasn't aware the CX7 has a limitation of the indirection
> > table size.  
> 
> There is a limitation, we read it from FW.
> It's usually not small, much larger than 256.
> 
> But currently it can vary according to FW decisions in scale (resource 
> management).
> 
> > I wrote the test because of a similar limitation in a
> > different NIC, but that one has been fixed.. I have limited access to
> > CX7 NICs, the one I tested on maxed out at 63 queues so the test has
> > passed.
> > 
> > Is it not possible to create an indirection table larger than 256
> > entries?  
> 
> It is possible, depending on the exposed FW capability.
> As of today, there are high-scale configurations (many VFs for example) 
> where the FW exposed cap is lowered.

Not entirely sure what you expect the outcome of this discussion to be.

The 2x indirection table has been proven inadequate for real production
use. I'm not talking about some theory or benchmarks, actual workloads
reported machines/NICs with such table as unusable (workload starts
choking way before reaching expected machine capacity).

That said I just checked out of curiosity and the OCP NIC spec also
states:

  The minimum supported indirection table size MUST be 128. The minimum
  SHOULD be at least 4 times the number of supported receive queues.

so I guess the 4x isn't exactly a new recommendation.
