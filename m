Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B642252FE34
	for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 18:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792001470; cv=none; b=qfMuSI4chP8ZgBlJa3nHpxKTpO7dPezuwS+1xTmg22+RWhzNsZTgrQL00jG8p2l9858+403F0IVdTiwHJBODQO74pa/GE4XSvt+7obBpYHmf9wmyhdpVeI4tjn/G/ZeP3WAhEQXDiNGwphB/n1ZOauN8WtdfJS3jfaPr8Tfiw7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792001470; c=relaxed/simple;
	bh=cu2sHALtqv5ecmM227kTCmouCknvQzS0Dzc+W+g/iPU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=P4a+BiHZ3dfVY6Yjn4fAqsjFj1UcwyBqHzEuhKQz5680DcZYTY2zhBEHnePsbra7IW5OqnzgG2VynoFSAbAeUl7KdErL80gK5NQtDMZWB1Lp2UwFKkTZGUcUDkApNsttyWxFkwWOzemGOcReTeo7xaRnqvs9LRNGAlvjWzv3oGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MyNsSdAy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MyNsSdAy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 155A91F000C6;
	Wed, 14 Oct 2026 18:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792001469;
	bh=5UgmxdDE9yT3RknEctQVruZQ4UimMTnDv4uzHyA68NM=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=MyNsSdAyjCJtDr1bD93cxoYoByhOo1RIkPLWpuEhkG6X2479wml1O7kqbsxeiQvd4
	 w0uAfLViolOSCTHsCMqxSKwThIxTJLK9brzLeQsnGNlKRtVoKicmjOb0cHCqp4PsEc
	 v+LsKWFqWVQ9PAgJv6F3zatAIixzYKxHSSgmPvOUpsk2ik57epbdXFo6OWH1Wp1WA9
	 kUCRyzYx3Qo6G/t/yRh0J1Dzzfcf4Fb/DmAbZEfMoNSVdLmCQhPM/q3qawAytIZN8P
	 JJtmGGwK23sW13L15rwTxBv48RE9R3TpassKoqjYTgSddXujCKZMZK4XA5So/xNBDs
	 WiRt0xrUfbDrg==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 74A0BF40066;
	Wed, 14 Oct 2026 14:11:08 -0400 (EDT)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-10.internal (MEProxy); Wed, 14 Oct 2026 14:11:08 -0400
X-ME-Sender: <xms:vMXPag7w9NMfqwo9J63oAsv0kt0_KTCzidPK0QwmX_U5v2tAIqg1mg>
    <xme:vMXPasudbZugUD8wHAieIHLYM9YuudQ6wazxfuKWHdzltIbXXGOofiu9RVeQ__MtG
    XHW2rMpqWpyIxfma_U37at08qeR5OxzcI9LMhvKh4vJ490l_DnIXeg>
X-ME-Proxy-Cause: dmFkZTFtfPM7eN4zSahqJ3Tnxkrn3Nn9BvKjPvJrLyx1KwHCIU4oqtIrxbMSfW96jzQhLy
    RyCdw2dB5b0XojkCaQUnBoCs2xvmIJdPK3WVBHUKdz0gGmYrsEwQLHxQ4J+zL3sMQpFMBe
    gbsOY5CqEOe7/qn6wJavzxWn6i1I9sNZz0na6RFoLrlN62RC96nS8GBUwXX6+GfkfFVbdy
    LRGqBY4McS9Whc36cR/VUMSVm0IubBIFfk9C1Vxzynx8FR4PdnAcc1M1T1LFoNDdXcZ8aP
    VOMi7fIgZvZSnP1PldAlhCbCx9SgtZ0q13dmoHvTL58MTnsO9sao4BVaPHn2U8WhkA2zBO
    HVh5LmsMJ2bRXi9IYtp072FUwD0ESlns5FqnKp+V5sYJ0gtb/p8XpJcxhF5RRFCthFF70l
    9sFKC7JXFRPPeaazMllHXMxMjZOCd2vr3aPJGBrIToudRUEM1gjXmHi+JRV6wYXDaRcROg
    XCXkSxVxm12sdW5RyTuKkYd2gFyacBIjwVLzWanCJKqpj8rU50SiDubAFJO47tzx21RlQN
    qsYHW5Kx0E8L2wc5Goox5fAl/1riY+qSsGpll/YRrzUAt4TIuDmpyPB0bFC27VXfuzeBOy
    y7CoJPZfpqNBXqE4yHdyjUlaJIKcf432QfWO9QpXTTxMFnYm5UCy4qkFV6BA
X-ME-Proxy: <xmx:vMXPanvSb3adEir0k09PVXgUPIYla8zmz2D9mpfIMPbxKhRCNvKR9g>
    <xmx:vMXPalJsxaX4fOW5xNZ7iATY8VZqAWlZ9wvi5UAr1wDnqsblrAzsfw>
    <xmx:vMXPauqt5mUdKd82VBA2IW67c0XtlvbOo8DwT90RWGNMMotxc2mzUQ>
    <xmx:vMXPagU89oCWs2DG5ZgjNWMYIOfO4O_PvODXsHDONPBj92Am0v3ZkQ>
    <xmx:vMXPar1Z15T0gtmq17_cDPe0TkUIY2inX06ekpOc_FoCrVCLA3WIqCmY>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 563A7782738; Wed, 14 Oct 2026 14:11:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AUo9oBqcZW_V
Date: Wed, 14 Oct 2026 14:10:48 -0400
From: "Chuck Lever" <cel@kernel.org>
To: netdev-bot+sashiko@kernel.org
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, pabeni@redhat.com, horms@kernel.org, davejwatson@fb.com,
 shuah@kernel.org, qingfang.deng@linux.dev, edumazet@kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Message-Id: <8f119949-4cf1-4f14-956f-e2a0df258065@slotpi15m67>
In-Reply-To: <179190789812.434549.8665010768729351575@kernel.org>
References: <20261012-tls-follow-on-v4-2-8cea429565da@kernel.org>
 <179190789812.434549.8665010768729351575@kernel.org>
Subject: Re: [PATCH net-next v4 2/9] tls: Check for a pending signal after an empty
 record
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Oct 13, 2026, netdev-bot+sashiko@kernel.org wrote:
>
> [Severity: High]
> Can callers that never get a signal still be held in tls_sw_recvmsg()
> for as long as the peer keeps sending empty records?

Yes, and this series leaves that hold in place. The cover letter
covers this case, so agentic review might have missed it: an
in-kernel caller of sock_recvmsg() cannot take a signal, so a
flood holds that caller as it does today, and SO_RCVTIMEO does
not bound these calls. This patch ends the hang for a reader
that a signal can reach.


-- 
Chuck Lever (Come to NFS bake-a-thon! https://nfsv4bat.org)
