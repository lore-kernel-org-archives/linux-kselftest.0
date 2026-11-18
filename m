Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794985615;
	b=1LLkmXyOUvprU9c1qskO54IMlaGMxo7KHK3/Mcv1A5efbX7iK1JpYsleRV9+PqyICjcO
	 UiBJBn7yYszLIvzkG6tJluAIdCW86tzZmkUKMRtHk5z9vV4mGZtT7KHrkZREjoClh13FH
	 rhdiNjpKyyFs0xt5ddX3jnYfKjetpF2MxYnCR75YnMq2VuLn7IFcrXJfG/gD1qEWX1kM4
	 9MUelndJu6x1GauQLZoVAGKNfLh8xHk/MkE3soriKc18sF1QJ7AcJ+3rdeZaeHNWnIgwe
	 7ojlonHvgdlRgfU42QOX22JOfYqnB8QXUkseD0OSGHvcL+LTTzKdQAETAYa1n7GZyZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794985615;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=lavIvmK0urfTHmvVury1Glpuztzy8qTc3/egbY5arcE=;
	b=PnHSlEe31xNgh9SQO3TJsndJhTjeUnO9/WUd8cV/h88CAl3u3tsz9eSbdnE0DzKivS0V
	 0Uc84EY9xu3oAaFGcmyokvvgmkX9KauZATRkSpW3mJdt1GY5G78FLuLpIboifCN7LCGFQ
	 oQVPfYpql+7RJanorvhcyA5M511swHIGxJxWHiYw7IqDJx0BFvsAMcLBp4Ss0/ZLWy9zc
	 Fei38/3DxZ/JwXgcYSjrvBPELqMktML5E/Q32lY0e0W+GO+sGgzlaRtwcJIdpTgpMAxgv
	 liMbCc19WqTqUqYJehdjuLHaQkPyMBGeEgy9NJYFDEXhULjaxtStGS3CLnc8X7gnFuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=dJJzPrgL;
	arc=none smtp.remote-ip=95.215.58.34
Received: from mta1.migadu.com (out-34.mta1.migadu.com [95.215.58.34])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E500A606A325
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 07:06:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E500A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=dJJzPrgL
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=6DGn/R9oKAsdK87b39nDdkeh8fsr4sCIVdI0Xj/b8fk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794985613; v=1; x=1795590413;
 b=dJJzPrgLrI63mNW7x06jI8qibtBICPfeWiToWIxtxRy0RXH+poXP0quG8BLWZiDWgR18k+2O
 XC3fz1ShL6+kmL5JgsWpxTEl9jc9H8oPXaiR14g/7pWlfnZgxcz5mFpt/eaUlCMJjryxAabtjow
 dhL4zQy/g7qXhm4vIvLRAhzk=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 52a0c46646173832;
	Wed, 18 Nov 2026 07:06:52 +0000
X-Mizu-Trace-ID: 52a0c46646173832
X-Migadu-Flow: FLOW_OUT
Date: Wed, 18 Nov 2026 15:06:38 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Andrea Mayer <andrea.mayer@uniroma2.it>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Hangbin Liu <liuhangbin@kylinos.cn>,
	Stefano Salsano <stefano.salsano@uniroma2.it>,
	Justin Iurman <justin.iurman@gmail.com>,
	Andrea Mayer <andrea@common-net.org>
Subject: Re: [PATCH net-next v3 5/5] selftests: seg6: add PSP flavor testing
 for SRv6 End.X
Message-ID: <av1OftpFCWPLimPx@fedora>
References: <20261112-srv6_flavors_endx-v3-0-c9177bbbd965@kylinos.cn>
 <20261112-srv6_flavors_endx-v3-5-c9177bbbd965@kylinos.cn>
 <20261117035021.e724668d726ecce54e091288@uniroma2.it>
 <avwUzLyWxZl9cBIX@fedora>
 <20261118035010.e028076fbd99fbcddd937156@uniroma2.it>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118035010.e028076fbd99fbcddd937156@uniroma2.it>

Hi Andrea,
On Wed, Nov 18, 2026 at 03:50:10AM +0100, Andrea Mayer wrote:
> > > 
> > > Without NEXT-C-SID, get_rt_sid() drops the adjacency, as the Sashiko
> > > review also notes: "4>2:psp:End.X" and "4>3:psp:End.X" would both get
> > > fcff:4::0af1. I think each adjacency should have its own SID. The
> > > SID could carry the adjacency, as the C-SID already does. Then
> > > __setup_rt_policy() needs the new SID. Calling get_rt_sid() there,
> > > as suggested above, would do that.
> >
> > Hmm, do you want to set the adjacency like xaf1 or xxa1?
> > e.g. ffcf:4::2af1 for 4>2:psp:End.X, ffcf:4::3af1 for 4>3:psp:End.X
> > or
> > ffcf:4::42a1 for 4>2:psp:End.X, ffcf:4::43a1 for 4>3:psp:End.X?
> >
> > The second one may also need to adjust the End address. e.g.
> > fcff:x::ef1 -> fcff:x::e1
> 
> The first one you propose, fcff:4::2af1, seems reasonable. The adjacency
> takes the place of the leading 0 of the Function (0af1 -> 2af1). Towards
> the host the 0 stays, as in the C-SID, and the End SIDs do not change.

What about noflv? e.g. 3>4:noflv:End.X, should we use addr like
fcff:3::4a?

Thanks
Hangbin
