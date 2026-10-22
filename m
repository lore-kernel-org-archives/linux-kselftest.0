Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.145
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792647062;
	b=QbfT15f9Zz63635wPnUSnTMw7f5Nh44YjNgWUVg9as3J77VS53JOyKPtt2D7qJcw+8Wy
	 ygEuP57tBMNGzP1EDdfZ71CHSG1qbhLkla2cHBIF9o0uiuffkBFpyRJVF8lq1D8p1Ewsj
	 tIm9bNnusq2AMqC7mE3rrA1IbuWUuS7zV9m17rpk5NAxYCwISERDC9I7TWBCkSnUr1rdQ
	 6eqEOUHULJKPct1VcWvWVUUAqM8LHRui7J/aSWh97TdFOgxWvbr5Khp1xgug/brlSresV
	 E5o4yx6wW/3+NYnt0qMITu7Lc5p/74JhHGzYmN+GPIbK81umr1kySRJxvS1kMEy+Gvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792647062;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Content-Type:Content-Transfer-Encoding:MIME-Version:From:To:
	 Cc:Subject:In-reply-to:References:Date:Message-id:Reply-To;
	bh=KrNmVxfHiLZER1bGGXBgc0X6S0B/+VSvffOFdu+/g74=;
	b=sWn0mR32qHC4R/ZPW+VCTI5PGW/UdyJlNEHRigLuYVPof2Nm9E+OBTwd09+s171ULEB0
	 4nH2iqsDYrUIKfTJ5iCNOPNSF54Nma+DvxrkQ1PUdsE4jP0QaZdSIVlaJQ91R1e8/I4Au
	 tK1NB7vEppooxsrVyORKqEiYNJIhUrM/ijahMtyu60OD0Si2CUsHYbDTP0sedfikklx1N
	 w/4U6R945QTnBsxm++0gcOWsrR8pMWnfl72oteBWFepVzGtZNvEEpXUZLld14FXGbudGI
	 xa/B6hwVRxDlK1NNtljN4twbD/3Qc9/LJDmCRxomrt6XC3jRDKmx5HVy9O34YpiTRyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ownmail.net;
	spf=pass smtp.mailfrom=ownmail.net;
	dkim=pass header.d=ownmail.net header.i=@ownmail.net header.a=rsa-sha256 header.s=fm2 header.b="CV4WjF/H";
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=X07PoCFG;
	arc=none smtp.remote-ip=103.168.172.145
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF10606A31A
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 05:31:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FF10606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ownmail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ownmail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ownmail.net header.i=@ownmail.net header.a=rsa-sha256 header.s=fm2 header.b=CV4WjF/H;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=X07PoCFG
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 3A3B6EC01EB
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 01:31:01 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Thu, 22 Oct 2026 01:31:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:reply-to:subject:subject:to:to; s=fm2; t=
	1792647061; x=1792733461; bh=KrNmVxfHiLZER1bGGXBgc0X6S0B/+VSvffO
	Fdu+/g74=; b=CV4WjF/HRaaNwt9D6WgBMCE5JOFMgRAHDLGZcjuwv/kTY2cQt/9
	Ob3us0V223FFoWfj6K5wxiO6YKfNFwk4MEOAPIhfcQB1fRwr9BievhPD/46uY+ui
	yI35byNZwJ/vmRDR6Tu8k8ZJaGKlcdVvkGZ7MaCyZBS+cnWXr4bpN7RftgoDPkpZ
	1AqKiEB+Xg8uYdVwDmr59lXC6CbtrpTq150MRWe0JdXcuWo3Q3x5h+orens85T+H
	xC5Ong6Drk7JXZik7BCjRTY+hJyGsnSRP1MrsaEIcEj4e+iHVs1RnDnbHv5gSCy6
	BsYVyrGxhFAEE4eNbwOOk3FdiEgR7TKGiZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792647061; x=
	1792733461; bh=KrNmVxfHiLZER1bGGXBgc0X6S0B/+VSvffOFdu+/g74=; b=X
	07PoCFGbh3M5GtmTrXC5vuV997EeO78pqTlLJHNlDLi4NatBSqiwRdvjxDsx5iVG
	qBtH8PtZzKVtyta21oBAzXG71EhqE4lYG8M/IOVfa6ltr+gVBjQES2MMPvSYubaR
	R6JPGCKt9ZS3Vszdlg0duunb2RmiHpRKpJZZqo+s6+5wZNXtzP10XKzrfvx0TILV
	fjR0t1+PApOpdaHeb1l7oqlvwAYOyVWPfXtOPnc+dSPWf2ZZ57ShPqVSnxgDxncN
	vOypgEvsiNpWwUwCzsouVBUyd4S2pZRoyBrj+62XIz1pYeY2RyTyeNQWxgrkrVeG
	yMxxNGWLq3EtHf663cWjA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=ownmail.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792647061; d=ownmail.net;
	mf=PG5laWxiQG93bm1haWwubmV0Pg==;
	rt=PGxpbnV4LWtzZWxmdGVzdEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:ctjzzYAHRUOtmh5qWjLRTR//U9CARFgCwByW8AeKa9Zj8NN
	RM06XV8ZnA5KbPowCMzIP3rW9VhmE1nKqn7lP1PZRCUZZMs65VsAPsEK+0ucWYGv
	a3Zje5zGsVW909+CLPdX8lgUVnY02Hp6RT8+Q2WKZmYVp86KwbMdvti9y4MlcfGp
	fCpp/RUm+sW9v5n+4+5uBmVitPAdoHKukXcT84Rq58fUp1nefDORDyqFXE3EmqCU
	TF8dD1EsVtF/GCMKuDbK6Acp3Mkx21kcbbk9FrheCMQdLp2on7XTXzKh8IpiREPh
	CrPZy6a4v4npBJBL4T3Xjv+QW1zu7q/bqMjGeAA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,reply-to,
	subject,to;
Message-Instance: m=1; h=sha256:oNhBPwopspZEN21OlEVLUUPEYyFDMXF8LcHEllyUSEU=:wvMvlHlj4ARsyMnSqAupzr4AUXxAIlYZXgcU2LMwmIA=;
X-ME-Sender: <xms:lJ_ZauD3QXRsHzrZBwyKzr4Eh0cnOrvOeA-tr3msfSNhH1dPTKRvtQ>
    <xme:lJ_Zatd_1pR1deyHH2ihZXj4DQZHNBc9_sO0SMSdMS9_8zmIxaHfu-oEd2thJlXZ7
    N1WxsU45t0l88FF0TqMsU0ImQjtEhJFPDSSkM9TuwOEEwf7q-U>
X-ME-Received: <xmr:lJ_Zal3I4-Na183wrFHSb8XDcLOnrEmzs-YKCZempYTMtq3Ezlu_4R-oGyBai_r27qPS9J9rgk0ctw8hI5l67KlxDDGd49E>
X-ME-Proxy-Cause: dmFkZTGfr19GTLDstmTgVBMe9esov4ItGM/J3Ym6yR/wkC2LWgH4c15+lbE//5JiqxYmse
    LsP+WczeufQ4M6DBvXw07DEfpbRPXpGEDCWkzuO9vqS4BLkbkcYM+ZBvS3KYQWsKx6gprp
    MlKTk8tNSOZ50wwODp2tUQYeUR0HNTAWdh5mBiAIrfMV0eldQenZIVbIqIqm3gSEmtRR6k
    9gQKNLnu79ATwBefQsww7ATKRoi6oVGPg9k5UXd9dOcc7P1ijsr5DzlwVVSlUR9NZDTElm
    SG/4KdehPUnZcBLXD5anaKP5euJZVUJvX1sZEYVn/8R2ctu7RZo+7ueia8rv5aXtp3WRVW
    WX2RZCkYbxx4d0pKyXUUihRVRWxf+iqDlZjOMweEnI+wdeNtGY0MQvEM7oJOiRSOOpe3yS
    whjaofxLaIYEmRTW2+NpWoe1dt4+PbwHzN4jUTm54qWDeFrtTRbsfojujxeAB/R5a7XObR
    MjAu0YaLdmCyKZgAuEwYGMlW/z6LdluXIV76Aj8aQTlUfhQSBseJGKnUoyQT3eusXTbBVt
    fap8g1mlqeDesNvB2tr10Eqco0Fi4BdgcL6MT8C2uQfEr9d8hoAENYfDjZpJmkDxuWOM9z
    jdIoNWshcO6h1YdZ/0Ck1EdgDgni5t+tN0NKLmAlS3GfxNBfkAe54ryTjfSg
X-ME-Proxy: <xmx:lJ_ZasiTXRvJP77MLBwiQlQj14mt-A2hN9l3054Ugn7JXA7xSvOf5A>
    <xmx:lJ_ZammYBC8nAuKOIIZAku8Irm-3mfWoZ4jy8Wpj2x3UiH8B4gQjWA>
    <xmx:lJ_ZaqYheyyOqMS8Ol0fDC6PZ3LKPIHJ4Oyo_j6xjUtSqMkR-zwvNg>
    <xmx:lJ_ZapGwVv3zloPvRG3AyMQRnKVvy9ySWKC2LWgVNNbBBAqV8tgegw>
    <xmx:lZ_ZanH2FhMH5-3WiMc8AD_cibdEfG2vh_JPxPmTn-hJmi9fcUTA2t6_>
Feedback-ID: i9d664b8f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Oct 2026 01:30:57 -0400 (EDT)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
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
Subject: Re: [PATCH 0/3] fuse: atomic open
In-reply-to: <20261022014616.2503204-1-jamz@amazon.com>
References: <20261020141647.3271341-1-jamz@amazon.com>
  <179253922666.1724252.16392934420146585044@noble.neil.brown.name>
  <20261022014616.2503204-1-jamz@amazon.com>
Date: Thu, 22 Oct 2026 16:30:56 +1100
Message-id: <179264705605.1724252.2909888897996466348@noble.neil.brown.name>
Reply-To: NeilBrown <neil@brown.name>

On Thu, 22 Oct 2026, Jimmy Zuber wrote:
> On Wed, 21 Oct 2026, NeilBrown wrote:
> > This all looks like a reasonably sensible design. As permission checking
> > happens in the client, not on the server, it is appropriate that
> > FUSE_OPEN_ATOMIC only opens the file if it actually created it.
> > So it doesn't make sense to implement O_TRUNC.
> >
> > However the code seems to suggest that the server might open the file if
> > it was found to already exist.  In that case, were does the permission
> > check happen...
> >
> > Maybe I need a more explicit statement of what FUSE_OPEN_ATOMIC is meant
> > to do in the various cases.  Or maybe I just don't know enough about
> > fuse.
>=20
> FUSE_OPEN_ATOMIC will open an existing regular file unless O_TRUNC is
> specified. If the server opens an existing file, the kernel will perform a
> permission check after the reply (do_open() calls may_open()). If that
> permission check fails, we will release the file. This matches other file
> systems that support atomic_open(), such as ceph, where a file can be opened
> before a kernel check is performed. Servers that don't want this should just
> return the entry only to have the kernel check permissions and open. I'll t=
ry
> to make the expected behavior of FUSE_OPEN_ATOMIC implementations more clear
> in v2.

It seems a little odd performing the "open" before any permission check,
but I can see how it might work, and as you say the server an refuse if
it has reason too.

Thanks for the clarification.

NeilBrown


>=20
> > There is work underway to support O_CREAT|O_DIRECTORY so that a
> > directory can be created and opened in a single operation.  Would it
> > make sense to include this in FUSE_OPEN_ATOMIC ??
>=20
> Oh thanks for the heads up. This would be a nice fit. If that series is
> accepted I can update this one accordingly. That said, even with that series
> it might be nice to have an init flag in case implementations want to
> selectively support atomic file but not directory open/create (ENOSYS is too
> coarse grained).
>=20

