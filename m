Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.145
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793387050;
	b=zS++xF5krRJOCKZBejuWWuECtuzT4fg1P3XtFCnVImj+uGsqOip5mZuHBubTL6dI2A+P
	 PXqN2+M3zvGfsWerE/ZVf7CKloXXvBUuYc9xp4QPVVHvHl5bjblgFt2qW67YIxvs76+j7
	 A/ZiUcNoP7jQ10o4QYV/x3vu4GplL40BhM7Y7M8x8zacDDhqs/B1YGeXloK9DNRruB4xq
	 QJrrxa91f/ENynfggQrWvgESC7mVTgNn+Ok2NlnU7hNSP2LJuvjBFCQJQz6Olbb7p/T87
	 cE1c9FyKeeiQr6sGxLBkQl8HdO6S6HTLvKg9Eez9Xg9EMwRev9c/jligP7LRi+XwMag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793387050;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=cYVDAfGu21tw8B4SsY7KTa+EHXRT8hV/QKN7JLK9TAU=;
	b=enF/xVsnGDlMlyu23MsVKbZsqMTO41V3fD6efrPFO4jGlL1I0oLESj6C6k7fqzdAtVcC
	 hfRWhpH/X2abMi3cUra9L8YcpeCaAeZTrzSQt8+8nHF0qAZOf316P8GyfBhNQuln2wsIz
	 A3OksvDVbXN6FsUg/n1s4z5Y/7g94kxs009dCT2IabIjbA5dMlswSLzpeDDhjkUkl713Y
	 U11Qpf3NILZSQbRygu212N1YYVAxatMPvay/TEdWWE8Yz824FB6Nrb8DSmv3j0jadcfS0
	 ORc7ctLf+ri9Bx6edQoGkwihl1zkN5erZNnWxk1yMLj0volLDpNEkv8S0CdE/bRi48w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bsbernd.com;
	spf=pass smtp.mailfrom=bsbernd.com;
	dkim=pass header.d=bsbernd.com header.i=@bsbernd.com header.a=rsa-sha256 header.s=fm1 header.b=V5d6RUpT;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=ceY2zdYE;
	arc=none smtp.remote-ip=103.168.172.145
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A548E606A31C
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 19:04:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A548E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bsbernd.com header.i=@bsbernd.com header.a=rsa-sha256 header.s=fm1 header.b=V5d6RUpT;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=ceY2zdYE
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 7A29FEC0596
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 15:04:03 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Fri, 30 Oct 2026 15:04:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1793387043;
	 x=1793473443; bh=cYVDAfGu21tw8B4SsY7KTa+EHXRT8hV/QKN7JLK9TAU=; b=
	V5d6RUpTicfIhe0AxolL4QxYG21F0bNNbESm/QvyT+gvHGLlf7WGbhEnpT82TDQh
	473dLcaoP+Hcxnusw0COqVMbzWg2LxGu0TySeSxogcKN7YEUit2vHXBybyiUi7ij
	TAlMJvNQ5k2EFNrz0USqC84mTzE0P5qt1FIJ2qvyHkZpEyBvBCjIYwVAsTBSNi5+
	frN+JVkbN1qIj98x6S2eQmyDzYpvlEydcFPEw0wQrN+kz4ThD8vClNTvbVro3ctk
	vXO+YF0yDCrHrQlF0Uuk9EyphtPGpNAezqFyDu2W/H1jelWZuvdKS7LqPtyCCtbE
	ObV0Lj7fK4l42Mqm+C2i/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793387043; x=
	1793473443; bh=cYVDAfGu21tw8B4SsY7KTa+EHXRT8hV/QKN7JLK9TAU=; b=c
	eY2zdYEg1BV2iKEB8nZGiC3B1aDTAHfWTqNmyW7k96rO6IazFkOnaondXrsde59U
	CMvhFSROsnpsregFHRLRDJa1nTSxI1xnpXumROi1FbnKCs3FAZwu24i5jNdyb9jU
	cUvr1oH4k+LvWmoEJsXqmZzyOvjBBft5JGL56HluWeZaMX79yeygDiqn095doJDT
	1xWSRpnGP3Jch9fhtf11lrBbVo2FT3CdZF0O4owrnM1EbAbtBVxZ+G77tXJcOnTM
	hoOu1onPnc+ooBV9RI2RPpj+tIwFIUjMXRS7gP/n0Wh1yDhfDL2J0cJPQdZ5dD28
	Vrop7K/masqbMOaBhkFrA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=bsbernd.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793387043; d=bsbernd.com;
	mf=PGJlcm5kQGJzYmVybmQuY29tPg==;
	rt=PGxpbnV4LWtzZWxmdGVzdEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:LEyBh2DiBq5fyDMQxwJOUlV31SHEgJ7Eaka+R/ucjOgsVCD
	N0/z6dRCwmYaOzE86zUA9pVgNPp4beAHtHSMR2pVMOKOFEZUctcpRVyCmpi8MNAx
	fwNa7Tl7HatTfqF5Xx43nLoknOSy8SSs2/d4ugys7Lxa1EaaQ0U3gvbMvSSFuN2/
	ll1Uho2HH2K4q/n+5tLGiC/WLQE/JN2K5nJlq8g+7Dlfrm30LZBcHW1SfSEoIPkX
	9wGVJktfCEAe4GLk+FOl3QOQiG6GQ2QOVutFxKyfYl+XzgAhjj4oza7fKxcrWIOM
	ameZe4X+OevL96OUL/OCVKZ3JBBMCZD/Cp8mDhg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=14;
	hn=cc,content-language,content-transfer-encoding,content-type,
	date,feedback-id,from,in-reply-to,message-id,mime-version,
	references,subject,to,user-agent;
Message-Instance: m=1; h=sha256:GJ9fIEhAAWVvEm6l7nB65LDWNZcyynBlOQf87Xosm3w=:SG1zBtFmdbw8Pqs1ZYzjFw/IGozPKTzhO0Fpu10JQx4=;
X-ME-Sender: <xms:IurkatfI8cTL2WhXNzRCkIF_orTOKowPbrR14WGcjSIWuuM8dGCWzA>
    <xme:IurkagJjJLvTfYcLIJnDquiGZue88E_lLFI-FbEfNsVw8EJYZo5N_5efYYEq__mGW
    s6NWp-z3mimYkfTXPt6oIEPh6ry4I9D4Vh3ZqWcv9eb8ANoTcR2>
X-ME-Received: <xmr:IurkaqwjyuKSHsPvddcumzQ2OVWhUn0MoGZ6iyj8LBK2U2cVldtQvg7SU6UlQA1o9CRm3lrOvgNgNhjvIWllke6TT6mBBoDEoi6vwepigZL4EK1msg>
X-ME-Proxy-Cause: dmFkZTEO+OiwYsZGLYiEqeEWlniUSUgrfOSvhBiT6vjhnKa9rY71lnQBvzv6vOmKSLeSvt
    j7S0Deu0nXp7TuIZJPE9OXCw9qvCV4bwyR567dyr4/zW81P27qFLEwYzpmXV5CxRGIKyQT
    nqc4kdC7LChm4De6LRWWR388VVNtUxxPwYVRL1exE8pO5GMMm0BhxIL7udWpluiw99Sk+z
    FH7Sk1npvSPetmU1IXxatbTEeXIAWEkyqnwy2CNYIewfKTuPF2chh+nIBZWxLrcryoQhdV
    4FlqXF3FaOsncC/UitXWE3bdmNvIKl85DCLFSRzR4C9RhbwenPfAr1fVh4RWuguVIpn3S2
    cOOgpfqJXW1k+HtKTPb5hEzUk5b/nBs6IOr3RL9tfhlmvvOgzaSGLI1c5OT2mQmwDbnS9G
    zDy8tuDjCY8pkLkYND12FXycRhphqq6cF2hsPSBEe65UsZJ1DgmiA2lmSEWnoVtfJHbwuq
    17ie0UklBh8g0RyNJMvwG+W2r1fUUv9ZZgASIrZSQvjv6ehskmAiV/6cjdXwq/0WpSNsVW
    fgzEegIb9kW7TZ5inMXiHH0bQt2FLy/S371s9S6j1SYmIakwkoOtDgn2Jk++InB4r+PziX
    GnrGSesbKcmmOKhUaJmvlLwIiEZ8J0e1MHXcDjv3ytrQvavThwe8bYTCdOtg
X-ME-Proxy: <xmx:IurkamtuT0jpX_8cY1jck4SpdXlZ154loJk5SUpgas4GtIiAOP8wGA>
    <xmx:IurkatAhsYQz1QVPjFqF_Hzo74qr08nEnolKYy2glY-XuF1Jw9qcCw>
    <xmx:IurkaoEsWKeDd00VLHQBm0QvHKBrbLvrYkvXDZWqni9DYlDG6bYs7Q>
    <xmx:IurkatARGdEXcKHnvNRgJRsNLwVycPbn3wWL8_C0pA1Ew-XAi3kixA>
    <xmx:I-rkagyUhBGaWhPeEsfakV4m8Eqa5PhVQqhXLOMd_s72ijJoADN_hd4O>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Oct 2026 15:04:01 -0400 (EDT)
Message-ID: <6bb36b51-cbf7-432d-b837-29ab4f7ef789@bsbernd.com>
Date: Fri, 30 Oct 2026 20:03:58 +0100
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] fuse: add FUSE_OPEN_ATOMIC
To: Jimmy Zuber <jamz@amazon.com>, NeilBrown <neilb@ownmail.net>
Cc: Miklos Szeredi <miklos@szeredi.hu>, fuse-devel@lists.linux.dev,
 linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Jim Harris <jiharris@nvidia.com>, Horst Birthelmer <horst@birthelmer.de>,
 Luis Henriques <luis@igalia.com>
References: <179331349568.1157394.13124360154896615084@noble.neil.brown.name>
 <20261030183631.2126171-1-jamz@amazon.com>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <20261030183631.2126171-1-jamz@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/30/26 19:36, Jimmy Zuber wrote:
> On Fri, 30 Oct 2026, NeilBrown wrote:
>> The /proc different seems cosmetic and probably of no consequence.
>> The nlink issue might be significant - I cannot say.
>> It might be nice to include a comment where d_instantiate() is used,
>> explaining why d_tmpfile() was avoided(?).
> 
> I dug into this a bit more. I couldn't find a FUSE server that actually
> implements FUSE_TMPFILE, besides the example servers in some FUSE
> libraries. However, switching to d_tmpfile() is a behavior change that's
> unrelated to the core of the atomic open series. I'd be happy to cut a
> separate patch series for it if you think it's an important improvement,
> but I want to keep things decoupled. In v7 of the atomic open series
> I'll make the "why" of d_instantiate() clear, i.e. that it is uniform
> with the rest of the fuse kernel module.


It took me a while to find the link.



https://lore.kernel.org/all/20220922084442.2401223-1-mszeredi@redhat.com/

In [PATCH v4 09/10] vfs: open inside ->tmpfile()

<quote>
This is in preparation for adding tmpfile support to fuse, which requires
that the tmpfile creation and opening are done as a single operation.

Replace the 'struct dentry *' argument of i_op->tmpfile with
'struct file *'.

Call finish_open_simple() as the last thing in ->tmpfile() instances (may
be omitted in the error case).

Change d_tmpfile() argument to 'struct file *' as well to make callers more
readable.
</quote>


