Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2973E40DFCE;
	Tue, 31 Mar 2026 00:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774915481; cv=none; b=sgTXQurQP219ZP0FEOHisUvKCzn4mBLYw7bPPNK/KHRHl/UB/kNt/fdDUXY7rH8QnxI/a6iIXP3NZ5hZqrOohkrDQR0vy6kcvljBxvihryvgksR0cwBx9IWolE3PtyewM2bZVjwLrE9Y5LZaER8mwC8YeQDzKsE8XIgilUYpWDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774915481; c=relaxed/simple;
	bh=ep9Eo/xNT3JPvWHxwOfM+K/RIfc0fvWxzAemEzUAq0g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rsP+dwXUpSWGQHpQ4aRTpIpWJ0lsjgmhYDhr+eVXl0JPPkSyX+AI3t6Xq8gowvCM1Ss+w4wP1Y41y54oR7eUIJNuFKFRyPHit2OTT1UeFQ5ONSVAuHOjWAZ2+/kQ9zUipUlf/mIf149w/DisrRErk3OYMQ/K2Y+FeFFZT9ylb7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QKALKGVg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QKALKGVg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44C1DC19423;
	Tue, 31 Mar 2026 00:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774915480;
	bh=ep9Eo/xNT3JPvWHxwOfM+K/RIfc0fvWxzAemEzUAq0g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=QKALKGVg9EOxjhIU06BEPpusqkLzlnE9OZ4m3CCxvoRNS+wgXHXhWWyyZe/8+EnKX
	 6TrUVLibZkInqt1Myo83fDXAwahguKT0yI/pk9juk3ehFsxv7LGQVQCReqRtyh3fZT
	 Zh0laWbqEvbOvDF/2ZTKXAO/sP1rmsj3PwJZdecDUigFWGU8Ta0ZHL9obCIN1VlE9q
	 UNF4HuQSBWf1ah+p6htmNoBNbhi05dE1Kp3LuwXUfnmrF6gPl2Yv73IawxCPhkm2HN
	 RjPpDJNIUe+jt5LHM22xImqxMeEinLLVTEdDkyTGLRg7Xsx5cn6bnCcdv5qeJz5M/q
	 BDWYKdGbh9KSw==
Date: Mon, 30 Mar 2026 17:04:39 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Petr Machata <petrm@nvidia.com>
Cc: Ioana Ciornei <ioana.ciornei@nxp.com>, <netdev@vger.kernel.org>, Andrew
 Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon
 Horman <horms@kernel.org>, <linux-kernel@vger.kernel.org>,
 <willemb@google.com>, <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH net-next v4 02/10] selftests: net: add helpers for
 running a command on other targets
Message-ID: <20260330170439.35ef3cac@kernel.org>
In-Reply-To: <871ph15zip.fsf@nvidia.com>
References: <20260326132828.805703-1-ioana.ciornei@nxp.com>
	<20260326132828.805703-3-ioana.ciornei@nxp.com>
	<871ph15zip.fsf@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 30 Mar 2026 13:02:12 +0200 Petr Machata wrote:
> > +run_on()
> > +{
> > +	local iface=$1; shift
> > +	local target="local:"
> > +
> > +	if declare -p TARGETS &>/dev/null; then
> > +		target="${TARGETS[$iface]}"  
> 
> So I think Jakub's runs fail because there's a shell export somewhere
> that gets inherited through make to the launched test. I guess it would
> be enough for the test to validate that TARGETS is an array, because
> those don't get inherited.

Great catch, FWIW. Yes TARGETS is what ksft makefiles use to define
the group of tests. We do 

  make ... TARGETS=drivers/net ... run_tests
