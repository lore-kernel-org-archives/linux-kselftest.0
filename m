Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50581DD525;
	Fri, 13 Mar 2026 12:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773404014; cv=none; b=Hgu6RiqdbztPtJG1Lnqkr71PpX0hcGtWmDPPdPU+y8OQHqu8RcDSMTpYDxBH5XbCaHZLkIZVHLcEHPTWh0x//JMGbCLGkeZiTYxOqdXR9H6DoM+3GZZbWE1jpVPAIVL35SXTN/Lz49Vj18ts9tOkgPlvlHj5q8ojTdmMj8l+lNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773404014; c=relaxed/simple;
	bh=x0L+UUd1mcB90gut7uy58LcQWmgnUYlF/geoDE6K61M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ntqk091TC0hFrcOgRkPEstsPFidqbnWVH+nfGK9DwgCXoWkw3N0cWZ2jObr4SgEr/h/1tJ2gmsDWnbjx6Swgm8KnxyksgU1jK8XHPShdAS/AJUEAguHbfun1uUPnAc8+aJ/GuWxbT7BdSzeMpdIGrVVGiSJZEWSDZCp6jSQsLpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=queasysnail.net; spf=pass smtp.mailfrom=queasysnail.net; dkim=pass (2048-bit key) header.d=queasysnail.net header.i=@queasysnail.net header.b=TkTGtYRT; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=vJhshjGN; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=queasysnail.net header.i=@queasysnail.net header.b="TkTGtYRT";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="vJhshjGN"
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfout.stl.internal (Postfix) with ESMTP id 766421D001BE;
	Fri, 13 Mar 2026 08:13:29 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Fri, 13 Mar 2026 08:13:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=queasysnail.net;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1773404009; x=
	1773490409; bh=cfi+FgdXOVCbi/A/05Y8huvpMIKeMYdFQM/36XiqOkI=; b=T
	kTGtYRTvd2gXKD5JfEaAJTXFtzfRDQSsh8hYtPhbk/dfwoP5oqU76IvZU16CcbSX
	qndVnmVvFk80v2fpE4UG6ZUrbt9tLgmgWMb9HBZ1MKiA+gw1UUEcQc6O7WMVRc43
	+T5lJA4DphlifgnJxjdARNrkTkm6X2lvMA5y/a3qLcyNht3zMUCfipu7SUU3aYj8
	c4Xn0tmDCNFXZuWGytaqSV2P2kpjCkvOhW8ZbiIvWuZXoRLyEZRq3OIHj3ymVp2K
	4bsqX0znZL/x9cS1U8V1IheFyg2F0w6S3moTL3TAeuNhj3mSy05KZHGkJCYsxxS6
	+o5r+zrqfDPNaiNBSco8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1773404009; x=1773490409; bh=cfi+FgdXOVCbi/A/05Y8huvpMIKeMYdFQM/
	36XiqOkI=; b=vJhshjGN7eAYzgtREzpeT3Qtwq3ESzugzxExG/OqrdTkyrdELnf
	c7xG0vknuiAtZqkRjARFKPYhDsM1KOTeC01RpG+JY4i+Vs0udsDtsUpymnVjEFMW
	TQTMbzYf4LY2ZKhCDgVoIqp7+DvWQke+dmOkqYOHa1q+3Fpw2SahJXs86XeX6DLd
	19MC3t/VRBQ77ayePo54YWVIR+kQXs5omCRG35WCLpyso9ATWrOmtq7LIlJy67UK
	MXo/Zo4XsWc14om8RJPHT6PBMvzlnupy0A1kLRl4cqqjKn+j7Regy8A4CX105SN6
	xmj3piaIeCvK90cwEREhiaxxCMbYKDeUE8w==
X-ME-Sender: <xms:aP-zadMfVEZ7lvyNYRUBYqv4I-ExRLwwZvFGIIAqHBwQTwxYSjq1mw>
    <xme:aP-zaYu6FXRtzpexz3mf3377rCzAOhxxJoUGvHAVpObfTlMrlXUtlOQTYB7RK3ni_
    hzix1A_Pz_NIF2HX5e_ixehUtXJn82VInlgO6ImdOVpRqSh5mD9Hkw>
X-ME-Received: <xmr:aP-zaa9unL-ok8tV2cdbNDQUnfHFKfekK-U8oYOqRPkBPKcJQmYTUO-k-3Be>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvkeelieefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomhepufgrsghrihhn
    rgcuffhusghrohgtrgcuoehsugesqhhuvggrshihshhnrghilhdrnhgvtheqnecuggftrf
    grthhtvghrnhepudekieeijedvfedugfeiiedujeeiheeihfekieffhefgheeludeifefg
    ueejkeejnecuffhomhgrihhnpehivghtfhdrohhrghenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsugesqhhuvggrshihshhnrghilhdrnhgv
    thdpnhgspghrtghpthhtohepudekpdhmohguvgepshhmthhpohhuthdprhgtphhtthhope
    ifihhlfhhrvggurdhophgvnhhsohhurhgtvgesghhmrghilhdrtghomhdprhgtphhtthho
    pehjohhhnhdrfhgrshhtrggsvghnugesghhmrghilhdrtghomhdprhgtphhtthhopehkuh
    gsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhf
    thdrnhgvthdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtg
    hpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehhohhrmhhs
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhrsggvtheslhifnhdrnhgvthdprh
    gtphhtthhopehskhhhrghnsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhg
X-ME-Proxy: <xmx:aP-zacHxek6p0-SD06HW_n7k2lJaqFzB46jFkrdzWyhpZEDn-EoWrQ>
    <xmx:aP-zaZQUL7d-DwYrF2lv5Eu4nxrMmhcJt4l5E9ZRIEZDqTivOZfRwA>
    <xmx:aP-zaatx7594jO25804KQTTx67LejvSF76sR7MYQ6iE57jJyUXQeZQ>
    <xmx:aP-zaWARXWKEDyUN5_Yc8AvyzDIZ4ND4x_F5TAyWgkzQgqbtLZV87Q>
    <xmx:af-zaZdBkpG9qqj1TLvmhc88oFnYh_V8ZfiJnL6GUFXG3DW79IFWyBla>
Feedback-ID: i934648bf:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Mar 2026 08:13:28 -0400 (EDT)
Date: Fri, 13 Mar 2026 13:13:26 +0100
From: Sabrina Dubroca <sd@queasysnail.net>
To: Wilfred Mallawa <wilfred.opensource@gmail.com>
Cc: John Fastabend <john.fastabend@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, netdev@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Alistair Francis <alistair.francis@wdc.com>,
	Damien Le'Moal <dlemoal@kernel.org>, Daiki Ueno <dueno@redhat.com>,
	Simo Sorce <ssorce@redhat.com>,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: Re: [RFC net-next 0/3] tls_sw: add tx record zero padding
Message-ID: <abP_Zvrgd5TDKsUP@krikkit>
References: <20260309054837.2299732-2-wilfred.opensource@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260309054837.2299732-2-wilfred.opensource@gmail.com>

Hi Wilfred,
Sorry for the delay, I'm juggling a few too many things at the moment.

2026-03-09, 15:48:35 +1000, Wilfred Mallawa wrote:
> From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> 
> Currently, for TLS 1.3, ktls does not support record zero padding [1].

to be precise: "on TX" (here, in the subject, and a few spots in the
rest of the series)

> Record zero padding is used to allow the sender to hide the size of the
> traffic patterns from an observer. TLS is susceptible to a variety of traffic
> analysis attacks based on observing the length and timing of encrypted
> packets [2]. Upcoming Western Digital NVMe-TCP hardware controllers
> implement TLS 1.3. Which from a security perspective, can benefit from having
> record zero padding enabled to mitigate against traffic analysis attacks [2].
> 
> Thus, for TX, this series adds support to adding randomized number of zero
> padding bytes to end-of-record (EOR) records that are not full. This
> feature is disabled by default and can be enabled by the new
> TLS_TX_RANDOM_PAD socket option. TLS_TX_RANDOM_PAD allows users to set an upper
> bound for the number of bytes to be used in zero padding, and can be set
> back to 0 to disable zero padding altogher. The number of zero padding bytes
> to append is determined by the remaining record room and the user specified
> upper bound (minimum of the two). That is
> rand([0, min(record_room, upper_bound)]).

From an API point of view, I'm not sure TLS_TX_RANDOM_PAD (and with
only an upper bound) is what we want. Passing {lower_bound,upper_bound}
via the setsockopt would be more flexible, allow to always pad if
userspace desires (maybe they're only sending very short records and
want to hide that with 1000B+ padding every time? no idea), and also
allow fixed-size padding if desired (by passing
lower_bound==upper_bound).
But I'm not involved in userspace libraries so I don't know.

I'm also worried about the (still WIP) 1.3 offload proposal. Are HW
implementations going to support this? Should we consider that as a
problem wrt transparency of HW offload in ktls?

> Also a selftest is added to test the usage of TLS_TX_RANDOM_PAD.
> However, it does not test for zero padding bytes as that is stripped in
> the ktls RX path.

Couldn't you use "raw RX" type tests and parse_tls_records to check
the padding?

> Additional testing done on a linux NVMe Target with
> TLS by issuing an FIO workload to the target and asserting that the target
> kernel sees and strips the zero padding attached.
> 
> [1] https://datatracker.ietf.org/doc/html/rfc8446#section-5.4l
> [2] https://datatracker.ietf.org/doc/html/rfc8446#appendix-E.3
> 
> Wilfred Mallawa (3):
>   net/tls_sw: support randomized zero padding
>   net/tls: add randomized zero padding socket option
>   selftest: tls: add tls record zero pad test

-- 
Sabrina
