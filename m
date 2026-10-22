Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.145
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792646801;
	b=z1tutr4mltgttQY2zcVLCFgr/+ID0fcQUOPVwuc2z4lpM6mcHgz+Ykv1JV4jr+YzekJl
	 eGVnT2jXOXjlq8AVktyakY1ezZWX2SPWZFdwUou9SsIodp2ASkqf1pchRV5/XiVzLU20g
	 GjeAthN1YJe/17cFauwqcWaSTWpNwDHths3iM9caZ75uMUauU++QqZY0qqCmqaLT3chHd
	 DTugnMAgqGez2mlWyaRN4QEgjoE6Jh8A1yZLwK2w+3oxL5S12B651RtmRLMjwFoViOm7/
	 9YwFuTpMsKS0dXR1z9zQKYI3dIos2qbgpIeJZ6me4dO1zSi5RYb7u405NWn9FrCFm1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792646801;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Content-Type:Content-Transfer-Encoding:MIME-Version:From:To:
	 Cc:Subject:In-reply-to:References:Date:Message-id:Reply-To;
	bh=qLa/EmD70xEMVdOXv8RltotmDuP+MWYCsFlczDyCkdc=;
	b=xvD0uyYZ8ipwAZMWmF3+/zjMGs6naw+ysAh+vPSzBzXy2psHGhVbat+tZPqI14WmPbd1
	 5GO3twOxCO3tQdR0OKzc0304VWCw6oSiflzJsl+GBrldr7DtipvqbZ2v0tQZnoWd8ndY5
	 Vi9RQgfZcO5+WlMNFNe07kFsD1x3AduHjvB3xTkkkSwO1+KFi9D63e9E40aTwqPGEmXAA
	 pBTf1Gfvjdj8jmM2cQtQo1UCImzFB1dlkg0C6qb/DI+orrywYERieXRlsyXjdnS3gH4mZ
	 1sZ1lITPbqAmkHBpC1O2gPntjFe4OLpyyzoHy0uOLZK8sxr/8VryZbc5Iz1xOuZ58pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ownmail.net;
	spf=pass smtp.mailfrom=ownmail.net;
	dkim=temperror header.d=ownmail.net header.i=@ownmail.net header.a=rsa-sha256 header.s=fm2 header.b=SXKEZCx7;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=gbtovc8o;
	arc=none smtp.remote-ip=103.168.172.145
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20F8606A319
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 05:26:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F20F8606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ownmail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ownmail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=ownmail.net header.i=@ownmail.net header.a=rsa-sha256 header.s=fm2 header.b=SXKEZCx7;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=gbtovc8o
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 27633EC01EB
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 01:26:35 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Thu, 22 Oct 2026 01:26:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:reply-to:subject:subject:to:to; s=fm2; t=
	1792646795; x=1792733195; bh=qLa/EmD70xEMVdOXv8RltotmDuP+MWYCsFl
	czDyCkdc=; b=SXKEZCx7MtQr/5ZtUs/M7XKGLXBe1Iih19mlaohCncmaKiyCKz6
	qlcC+atmmcbMS/UuNb7xH1OxmEbApkB79ye1CwCmKWXvbgAqSUwRcxUsGD1OtwnC
	CRiPwOTBMVYiAQlkkIQeB+7ylprvgo+arZ+0k84dj51KPnEWAe9oCgw5peb+ersQ
	NuwGLwd4bcWWckv5mWsnr08r2jzPLN5H/66jnbgY5v9vEu7wxtwUPL+wtwzWnX+j
	MMzkI+hFueYwoPiebhd4ESUsfKIT+JtO/9NBKkAWWi9kC3yEknc3BE1jloJ2jPIh
	XccslOSThM3OXE5Hu0vgUWJ98DSxGjo3/gw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792646795; x=
	1792733195; bh=qLa/EmD70xEMVdOXv8RltotmDuP+MWYCsFlczDyCkdc=; b=g
	btovc8oHTgwafGyzj/8f+u5fk6IeoV6bRxBL6pn1ksEjr+sJFMKvZAf2aXeppg9M
	OjnvDPgVULGLhABjPNYy+ovgmPOJ5HZN8/BBSrzZYolCLAl78cEOpbPV/qJBZ+lT
	8cp2jG/be4+j16L8FmrFYblLqVdIDsJrMY0CVx4xYuxTgnCICzj21rwQzdVysC9l
	fv5uBW99F8iv11a6HnO9I+tQ0F6EjcuwuGPHmFXDBxLLjjE8OX510lnTgSOs4x6d
	VRInfMVXEeFoAEws2M/JI3mRdiVxdXzjVUK4YNEOfPm9psCnyeNy2ydkfZyjzyyu
	P9BiHtwctKHZ5HFPZyPKQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=ownmail.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792646795; d=ownmail.net;
	mf=PG5laWxiQG93bm1haWwubmV0Pg==;
	rt=PGxpbnV4LWtzZWxmdGVzdEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:g/JzkEJiRxxrs0lw2rUhhdtLKwo3ihnWqG2lAD1vLJFrjwS
	5D6f9rsI58o81J9LPaAXsFCgDWhAPqhZ0Ipifv/vfMbHsvW9HvBHYp0BJLosUTYx
	Db0sGQrwPOwvfl3I44U65lZoNEQGIDFfsgdHkcHbvdNh/z7Lf9M94njkmOdIHfNx
	ftY2rH9989pE71tAbo2ozNyJlK6rFqgpSzJs199ft61N1b0AfmkxsP4h/LaYqO31
	6dzO8xhdtaDBHBklB95dOIAtOPKO+bA/RaOfXDa1rMZDyCQJ6u09otjXn4NBmGx8
	BOWeZImcfmfeMkfMUPrkhAibTcVZGfFY0M9WXpg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,reply-to,
	subject,to;
Message-Instance: m=1; h=sha256:Ele97RBpmlYCB2A3FLVm4YCuqeQ4DE6b+VmWqXtb4GQ=:rBtXpz72tYKqW1h3pK9tfu7v5ah1kiGLRCu7FmLpkYQ=;
X-ME-Sender: <xms:ip7ZavdkBidNGsT5AcnaKhzqtIIFStDGs9H0ijMlHe4vzcWFWyVPVQ>
    <xme:ip7ZaqKcr69bbkgSsGZvUabz_8h7wwO2M8pEjos-LJh601D00WHlnNla657sSqD_G
    OpBsi5r6NKdZz33wk92mNwjY3MluR-D7RWJ7-Hz59mg52V2Nw>
X-ME-Received: <xmr:ip7ZasxsV_c0hhL8525MsaKz7FwxJq3vSGKwyn9Tw5pXRZaIh9w4Lh3swCB1TcCA7_SksvvkrgtB1n6sPaL_-80JQadXxl8>
X-ME-Proxy-Cause: dmFkZTF4bnYP18RZlecGXM3LlQHt+aYGrG70QPof3wTJc9NDjbFa8I+byFBBM1Kpeer9Jb
    McA/QWqFmOddUU4F+/aM4YGHXQ4gyk7OIP2W/8wINGYnoALRARZKVtbDPEbtq4d+m9UCJr
    93bnTlFpP1UH48dWzIrips84tr1zn6JkzDKm2o/9wXxz5fLNG4xa+KQjihVFDXByrvgMuy
    617FHbcFFyo2tKrjWcVtvysjDpjwl1Qh8qGbrjuwKRAtn/N0JCtDUYTfQwJOmHhn6RbRAA
    xUf4sZkmjWWAjGd+Nab8WSPCdvkXx116b2OSJdPsg88ZPpdXHKLWqQbnSsAzba0JAq51Z5
    5yDdACe6e/Tnx2oT0whJmLTGMKzfvhu8P6cMrRL9OuUdgCzLPPmf70C3sgYIJzMav0Gag7
    3LOZ1Kj4sJEFOXUV41FzjDpshMBG85V/d/GUTj2k93M4OIzZ72TzGe9NJu1XcyTbjbu9do
    AI7zUCuBa8Zttxdp2F8JFroaNN/KEN25DiyDDo0U4S9+WU/NW+y+JIROak7dEDf40O0zzl
    N3uN2vooL1Z2au7GZdJxWNYF9zvyYUPxRzdT1G/dUaduTSTS421njeU0dIwcdRnmMXc9Pu
    iPw/QuXNf0BbRH3WU9ygdyNSpdfoiN7/g7xq+2fGJvTeqWh5fmr0W+DmT8lw
X-ME-Proxy: <xmx:ip7ZagtRqiGjCoUf9YpBXEwOk8JD9HydG_h52jxvd-hdZo34MS0BFg>
    <xmx:ip7ZavBff2NyW4dKOnsA6FdNSvUxB6exJS1rFoggeFVsY-FUz5wvYw>
    <xmx:ip7ZaiFgedbi-nJZikI_vGbB1NgscVcAPTa3dgdQmkvuB4YpIaNOkw>
    <xmx:ip7ZavDMHQ6LTJutzuW2h6MG_UDI8WjGSjhjUpc1bwAE6a_iSK8f7w>
    <xmx:i57ZaqwvI1zptwpWIfY3dDjQ325rf6Fb5AeYhNacMChUTzYGg3Nhb0Nx>
Feedback-ID: i9d664b8f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Oct 2026 01:26:31 -0400 (EDT)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: NeilBrown <neilb@ownmail.net>
To: "Jimmy Zuber" <jamz@amazon.com>
Cc: "Miklos Szeredi" <miklos@szeredi.hu>, fuse-devel@lists.linux.dev,
 linux-kselftest@vger.kernel.org, "Shuah Khan" <shuah@kernel.org>,
 "Bernd Schubert" <bernd@bsbernd.com>, "Jim Harris" <jiharris@nvidia.com>,
 "Horst Birthelmer" <horst@birthelmer.de>, "Luis Henriques" <luis@igalia.com>
Subject: Re: [PATCH 1/3] fuse: add FUSE_OPEN_ATOMIC
In-reply-to: <20261022014545.2495106-1-jamz@amazon.com>
References: <20261020141647.3271341-1-jamz@amazon.com>
  <20261020141647.3271341-2-jamz@amazon.com>
  <179253863737.1724252.12836488084615923712@noble.neil.brown.name>
  <20261022014545.2495106-1-jamz@amazon.com>
Date: Thu, 22 Oct 2026 16:26:30 +1100
Message-id: <179264679002.1724252.4479504779598097455@noble.neil.brown.name>
Reply-To: NeilBrown <neil@brown.name>

On Thu, 22 Oct 2026, Jimmy Zuber wrote:
> On Wed, 21 Oct 2026, NeilBrown wrote:
> > > +	d_drop(entry);
> > > +	res = d_splice_alias(inode, entry);
> >
> > As of f1ac607f786f d_splice_alias() handles hashed dentries
> > and the d_drop() is not needed and not wanted.
> 
> Thanks. I'll rebase onto 7.4-rc1 (will make note of the dependency), which
> has the commit f1ac607f786f.
> 
> > > -	d_instantiate(entry, inode);
> > > +	if (d_in_lookup(entry))
> > > +		d_splice_alias(inode, entry);
> > > +	else
> > > +		d_instantiate(entry, inode);
> >
> > Similar to above, d_splice_alias() is now sufficient for all cases.
> 
> Thanks, fuse_create_open() also handles FUSE_TMPFILE, which needs
> d_instantiate() for its dentry to stay unhashed. Otherwise I can have it use
> d_splice_alias().
> 

Almost all other filesystems use d_tmpfile() for tmp-files (which calls
d_instantiate). Is there a reason that fuse cannot use d_tmpfile()?

Thanks,
NeilBrown
