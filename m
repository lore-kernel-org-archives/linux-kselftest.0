Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795348926;
	b=zUrJjoVhLTAVtbW7hm0ykpUg4UqvdmZ0cWM5aHSCS2NSaN3Gt6dl59/m6XrNtv09Xaw3
	 AttHk6C7emkk/4Z3F05TswBhUJb0gW3jpSDM/nLXxloGNBJWQL2oAUb0wAA6bRZxADHsr
	 PvSJWRy76cNQTK6dcySFytVuKyliRCrFS2ci+8broqwZ+bQrOiLwjQ2usZKVMNIfztDD7
	 benyWP+JjqvWrLN5WUzGymenqQXPZALGSIxp2Pgo3V73OztAVLD5wD8Ra0xBRxsKa6h9Y
	 l25ChzjVB4SwrnrzqDsAUyCnGSTY6P/6JwzA0oW3VlDzfClaujF/r+9Zs6WY7v9bs5Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795348926;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=VDAY2l0Py9SC2OiRZKfmkxrUpoDnsAjefW9a1e5gT+g=;
	b=rHcK5NbaX9/eM6y9BUkZL0QjtIVeZ9+xJbiB/jmqjJWY+dP2VXK/NVtdBlrAGPnlqGPJ
	 Cq6Wm77e0cgVbGuki64jZykn1aGzbHvHHE+U4pM1WzMJHKq9M/NxRmAqMKKZDFTNifP+T
	 lGe3miXXJP1PEzJlnotZvGos5EwF/KFB5LoglxbjBU+MzCwCf67zJA4+n6QUmKQSRG3tz
	 poI164zpK9ZG/g/w0fNG6f3NGEFhZbcUAH+oFp8kTMgLOgc6X1FVvL9M7SNTPQZHSkLqi
	 SJxfqv1TXlu4c+JX6NkYboUBPwu7gdsGb+ZUSoy8KYTjIIioH7VwEUv6IyCNM+Dd4dQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=GSa20sQr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C1C606A330
	for <linux-kselftest@vger.kernel.org>; Sun, 22 Nov 2026 12:02:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7C1C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=GSa20sQr
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b2d14968c9so21409617b3.0
        for <linux-kselftest@vger.kernel.org>; Sun, 22 Nov 2026 04:02:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795348925; cv=none;
        d=google.com; s=arc-20260327;
        b=CJ2dhEaV6OXSbY5fC4XP+sN7C4tucPkIsQt8rrqfP7GFe7LvI64BY/mGCCvuWofWip
         Wf4OD0NRCioCkQgWjlZAa1wonCybb/5WeoSxvhosgGsAtoAan3P8OqDjyzc2RzcD2q7+
         LzlnoRZhggqsIR8Zj6Q5XE6vtQF7Ftiy0ASzB/pk2D/ssKwq3aPAzYjmIibrRBlwgGNb
         hiWqAcMVD7Wtej/rHprxPeoA4NlCO123Otb7Q+V0N33SWfr9/+JIY2PtYwh7QvFK+yLI
         XRBBeSIhXS2dQ14R/6/7OOJ2t7hhxELsYtPM+vLCixnSvRcpvmNEMjlWzo/NlsCQchyR
         lWyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=VDAY2l0Py9SC2OiRZKfmkxrUpoDnsAjefW9a1e5gT+g=;
        fh=BEolL9cAIY93eQeSP4tdN8V8jtRHimKnEqmdczldSN8=;
        b=I0bmF5Z1vV3NgY6FCppAFhiUdAR0TTTLUHfgnKcXjEEO6zf/O50KQeqbekkLg57m76
         lf/wpA/qYhtUUnk8Dv9wUaSkold53l4mJZxTKG95B2jjO9GB65zI/9XbaYRsFAmB/I4Q
         3PD5PdtTDVVlrKDEQgAmzk60XzYv4o2iN1EsbG5Da0SggBbL+DBUSKByLn0tPQfjreQs
         B3QOGHQHguIBIpLeBl0bCJCizltpkTIImQt9LmxMq1Zo6lyADxU225uqCEqs/qxo5rQk
         ds4GpEgfGXsJmA+MfsauRZejqAHKiws4gY/pSqyPqNIahW9ow7Bi4+0VtE9fzapU99wT
         a8wQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795348925; x=1795953725; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VDAY2l0Py9SC2OiRZKfmkxrUpoDnsAjefW9a1e5gT+g=;
        b=GSa20sQrHDNKTwqo480osbvm+10D+MIqy4bM6L+DapIHb2+q32BNJpyla/6tGUYXG7
         +LJhhd0SpTrDDH2g/XM8D1aHXxHPaaAkoPTyPApDq9UflQdqV7zoj0XLGRdw6ncSem79
         tcdx1fdOemsgY7A/iop/NZJHRVtlp/ZupsaqrTTIvwsBH0e3enpDWIwatPwA/uFEneZh
         2OCB8R9fL0TFOLbZDOciy33FJaka1jNWVeowsQq4eJfVNS1vJbqdJ/lbjELoUczjcDX5
         dNcR/NUkb+CLyr3k1Dr3lwiPEk6LpTTu3xV5UgDiMV2Wftlu1+gIYmfwIcGcFd/U9D8O
         Ahng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795348925; x=1795953725;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VDAY2l0Py9SC2OiRZKfmkxrUpoDnsAjefW9a1e5gT+g=;
        b=fNKGwBJeUdXYgEjF5vhhbn9jPAloMj73C7XsbOZ3oT4k+JyaiTl3OrzOKsLohznwgq
         V95fTA5yQ8jafU+mnxG+AVRgUFIQYs58zsRKeYTmufO1YzXsLwgqJ0ZilAgWMgTodhXZ
         7ACO2do9o6RuX4w4p+9ForKdW+ILNgM28ioA+b+jqiStTOdxyEGe8j2ArizkS8LVwkKA
         Lywq6vXopVmhrqscpqxBMlSva1e4XZ+V775bspE9wd7ub4TD6/rcyw/Zw3hwAattC3mY
         8jPrrBtCBnSmg6UNx8TuhpPJ1BeZfAjj5yizMfr/jHg0uVAcccBJWkSB/zHgvxDhx45j
         gBlw==
X-Forwarded-Encrypted: i=1; AL+hErFnVGR7tKGlRw2n3FBaS6wWBdBDCtxcPEvtPbhts+Q00YFtMuwbh4sre32s57AA/wxNwd8hBkhWoxyRKDcjdUQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nHLAV3ETmpOVTP8BgTcoPPKHmXo7he1iUcFZkiWSa6HHve7gh
	J8GZ475RsYu4mx4j1h1JUcSOez7yr6qVyuzdif3j89AlEYJJC4ODrPSR+OC2GIs/jy3sj8pjlYG
	sq+DFO1oSxhJiF81ac+q5iVDaGup2JXywA7S3WML2
X-Gm-Gg: AZFdTZequWqJHP9+zQUK9Rvm8ZD8nREO08vkst7dQrerUfki/2UBGTgL1fnF4LfLBxm
	n+X0MN3kt3DwqHy+6+FGbJPsJ/80TZ8E8ZVIHCVCrmmnd5oZfK4wa1/6x11qNpy1VtopZ7XcDTr
	GHVPt71uI+4/nsLtWspk/1kCJdAvRd2zmgKr5Yrb3Go3QifODIojvDLPeBEiOLTorR4dOxRxffm
	Ki5IuE10/bGe+9Id6kX/e0JyHSM8PNXSl8eto4u0gHYkkvYdgH6Z2HUUCmP++VfU6fYjJPZo5QM
	5grdI13FoU3pv6p0q5HWGB5WTDJTrwQfL6rxrt9gWJY9Jxt7fg0SEnjDRJqaoAAi4Hg7SuhRkkP
	OFt+KxuId7NgDfwgnm+jz7zPFutalcCMBVRsOAOEkmuRslUvuyIIICQ8on3/izx3xkmx30Bygzi
	xAGZG+TcxhodODkGFTYfJzL5HnhFcuazewqaCbj4559C2UZ7kqBR0P35nSJZCrtVvBa0jfvIlHU
	89j0vTArsd/4LgZeGbb4TEAxiSw0GHwSHd8TG9Qlcx+aX/AiYa2MH5te59wzHqL+GfA0avGvdGZ
	UVr2NkBw72z0NES7WQW4Fu73m95sS3LQ1v3uC6bpxJn754nG5urqtWlKsfVlP2pzgNepzlQ2BRG
	s5j49EShvmupSZf//LL8RS5zT4yTYpI5+lCXfj2Z3uKmsMmCW6j8=
X-Received: by 2002:a05:690c:88d:b0:8b0:d646:95ae with SMTP id
 00721157ae682-8b520436e42mr29583277b3.18.1795348924716; Sun, 22 Nov 2026
 04:02:04 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Julius Bairaktaris <julius@bairaktaris.de>
Date: Sun, 22 Nov 2026 12:01:29 +0000
X-Gm-Features: Aa3M54pGP5Y5GelDYyIRXPac7qaJVRqnpPRHmYC1fODXTa_3sxZD5zd8Qe6ua_w
Message-ID: <CAC1t37+WBG97C5ZeimO9SXAKChk0BU1kRC5E6yKAaOHXvWDpMg@mail.gmail.com>
Subject: Re: [PATCH nf-next v11 2/3] netfilter: flowtable: tear down direct
 xmit flows when the fdb entry moves
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter-devel@vger.kernel.org, Florian Westphal <fw@strlen.de>, 
	Phil Sutter <phil@nwl.cc>, Nikolay Aleksandrov <razor@blackwall.org>, Ido Schimmel <idosch@nvidia.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Eric Woudstra <ericwouds@gmail.com>, netdev@vger.kernel.org, 
	bridge@lists.linux.dev, coreteam@netfilter.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Nov 21, 2026 at 10:10:15PM +0100, Pablo Neira Ayuso wrote:
> > +struct flow_offload_br_outer {
> > + u16 vid;
> > + u8 present:1,
> > + link_vlans:2,
> > + link_untag:1,
> > + link_8021ad:1,
> > + inner_tag:1;
> > +};
>
> What scenario are you trying to support with this?

A vlan device of one bridge as port of another: br1.100 is a port of
br0, which has the router address, and the host moves from rr0, a port
of br1, to rr2, a port of br0. nf-next offloads the flow to rr0. After
the move only br0's entry changes; br1's still points to rr0 until it
ages out, so the gc must also look the host up in br0, through br1.100.
That is the "stackout" case of 3/3, which stalls on nf-next.

And thanks for the review! Can I send out the other patches to get
some sashiko reviews, or do you want to keep the rule of 1 patch at a
time?

Julius
