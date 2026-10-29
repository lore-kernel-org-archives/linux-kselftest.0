Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.153
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793313504;
	b=ksODPv6D7XFfayy+IO/gvPOcZAi6Qr2fsy5FAgJSbx9vj5Iv3/yURJ+PvCd2tNIA+hIg
	 qq7OTnd3tVJyTXgah2MNlMQ7/OGIwnTLYUJjYH0eIOVq1xphoTtw/xXuqquoWIWdNpdDR
	 P5AOaWwNhztLMLKwyFZoZUGDLiRes8qPyNZs0hcmsFIg2/R1gb+4V3O14QS4squX4foXA
	 2B1F3frWa4eM3nrbveJMZtyoiHKOtIigIvfzxLZ6I/AOhcwgJFyAEMwVD0jGFwNcHBQ9U
	 by4IqiS8yAkuCFdABxVGiDcOEPOuljh+wRzFMvFcGh1UYA+40DqRBTto0XSKjmYh/bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793313504;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Content-Type:Content-Transfer-Encoding:MIME-Version:From:To:
	 Cc:Subject:In-reply-to:References:Date:Message-id:Reply-To;
	bh=39dB8LcIZiFSE6DpD6XH0mtOgLinGSkIXMTWMCW2lVg=;
	b=15XCkI23DsDHVf1LhVdWvcha55AwsnVFFInmN8hGW08VjJRdS0A30NvI3IlfBLsabl6E
	 C+nLiQU+plr9xKyWtIKK0rmVEDvtReG1NsInxzUAXMYoIpXD516pNf0ZfdqqY/XWW86tE
	 Db+xjTIq0Ard9UdZeeHXpilYQfa6Ro9EcSe96wqRVMa7K7PQp4Avvh4gU5pQIprcKZDdi
	 fLlHAneKJqA8NXrXiUHknz6deAsNGjdnt1Fm1IHwBe8WZ0NQWnrzb2VRuQMC6rAiE2oui
	 P2vQfXcCno4iY3zWJhjeyF32HAWAW6+/HKMiRJMWhbg7AK0ctHfXwuAXMZNoQSnu5Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ownmail.net;
	spf=pass smtp.mailfrom=ownmail.net;
	dkim=pass header.d=ownmail.net header.i=@ownmail.net header.a=rsa-sha256 header.s=fm2 header.b=Et+VI9lN;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=WcHLJsqD;
	arc=none smtp.remote-ip=202.12.124.153
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34BC606A31A
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 22:38:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E34BC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ownmail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ownmail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ownmail.net header.i=@ownmail.net header.a=rsa-sha256 header.s=fm2 header.b=Et+VI9lN;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=WcHLJsqD
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 3A31B7A00F0
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 18:38:23 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Thu, 29 Oct 2026 18:38:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:reply-to:subject:subject:to:to; s=fm2; t=
	1793313503; x=1793399903; bh=39dB8LcIZiFSE6DpD6XH0mtOgLinGSkIXMT
	WMCW2lVg=; b=Et+VI9lN8WTwl6YZW21uA14Ol7NFhpVTLKs0UtWiLHgnIJWwWFU
	aX7NRjoYswsJK/2lwJgtOiPcSUdfxdzUrKBwbR6wZ6p9OKiXtPZ6MwpkQAQq+vpR
	wC+tOWuxOW11YgTuNcXzDfnzJwTCHIbVe86mLcQfBPN3CVd0GN4l5FicqX5IHiGx
	r3mMtpdwvRiAVbdWTKxcU8H14AzxpzATxmsV07DlTjqBdertQgT/5evG5NPpSB0i
	SqLgCgdmBhpXGXb/peSGvvOg8CeSZjaxq35Bip+QsKZ4h6kdi3q5HbSndjv38IBu
	qkx8ts8ifE50rGJdZC04fPLraer7nzsOOuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793313503; x=
	1793399903; bh=39dB8LcIZiFSE6DpD6XH0mtOgLinGSkIXMTWMCW2lVg=; b=W
	cHLJsqDnv2pUg7LMU+8ZoZ+LCMFkXRgzE8X6eUKK9kujZyj/78el0oEkRbrg380p
	q3HITi+DqkCku1PbgREDrGRoEcRftwRuvUQ7Vb+SQpEqb3wZ0NC7xemQ3Tdg1eCw
	sJaZO0jQdZUmjne0eYbVLgBKXUwo8P0rOgvvaNLrAv/LWHr1N4QsVr8SHGeVCv1x
	N9LoRJz9raRiZ7f0oOnJnetRNgMxH+8WxAHqgADusG7LUdG+T5cld8o0cjRVfdDG
	ntFO92rX0a/kJ/irniLTuEif1BRmZHSCHX8soEiZeOVRmMOANt9RPGQFdI/Gu0Qz
	ZtQ7NnwT65ZWKH8HE36iQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=ownmail.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793313503; d=ownmail.net;
	mf=PG5laWxiQG93bm1haWwubmV0Pg==;
	rt=PGxpbnV4LWtzZWxmdGVzdEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:YR9Hw8gvaviHH3JehWKXUNR6eDtURmnlAJGePHQIIsIPttM
	2KSXJk85RA0MZPrJfgS7z+lNFZFsgTDyTigdyOEUJUYpQsLFem/YzfoT3cBYph6J
	U5SfcFvSTbt5I+TcyYOq1eoBILDFMmSZwF1Lh1IcecxVMup23xIgFVIUKcuqR5TZ
	Xgo50pryjXk4wtM8Foaxt2TP0Fr6eu312ni8uQXb4kgF831Ebv6SCv8lo6JK9A+O
	8SXX5qOY7nXBVs9lkUrsUEq5z0WuKKbcPnlwdwWcj0Ju8JMflk+WwrpwTQ8N7TWm
	9ZJW2qnKxG6CI3NbvsmjstQNhAoE7C/Z9ODz8Kg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,reply-to,
	subject,to;
Message-Instance: m=1; h=sha256:YJTVjRO3KgeR1yC3zPShlEIEFX94Ek0eFafG0VD9Rdk=:HQnx1FvLy//Q8VAJrMpa83GqDNXduO9zCittHkseAJg=;
X-ME-Sender: <xms:3srjamSg0GFLwas1K9kwljo4ITu2h3xpyCdX1QA94dVe9GJXI-121A>
    <xme:3srjagvYqrdlovVCBj18YeDSXI6-5jTpb16ktty0khtIW35yA1IDjhGeGIPS-egY5
    _L_bXGN_LMjVrlNhGSI6D8PNII7gQB_IW0w1Ok4NntfoLjuAoQ>
X-ME-Received: <xmr:3srjaoEOfOcGgYBXg4uRh0vzqaGrspuy99u3uqi_qij4oM3Z7NyIf5Xzdu_oU4yXTA>
X-ME-Proxy-Cause: dmFkZTF29A9pmUV+SyCH7e09WNzmLTMnv0etSxjKXw4+LvTknRxz5S9iRYd2PAErEWxy4V
    ds7XprIor5LgVQQokg4NUvi3ROCbnNTHp+78ZLEARdPas/mwKvVJms1yVVM5GbgtJUkdRW
    aJwhstWzvzTJ5Q++91hkQ0NevSmfR0xTE1OwWmrsCx1ovhqwJy/zSZNMstjkC10FbJuxX6
    KYsvxBymb42+HNQbwJ+3xRcDjufT/uOQYhPvF/uyf5rWLZvM7BpfPpmnOxUsAMPs5FUJED
    Fi93dM9gqjWYbq9ccoefyJU4KBmWtUQy6PfiXNdL/B7yX7jIMFKsPss8L24fqrRRcyc2o9
    u8Y+wfJ8FRHYFrhIsLvAkJbYGvuC2xP0jH/9lpskMChDiL5gC1UnYgl2l1AhRjtKnnT+TA
    2oTMXINVVCyOWKAnygl39VUNB8Rs3GY4EyKtv7/As/LsfVZMkUhUYPG5/dl22S5JzY9Bp/
    n/njRaCgHZtmVzm50ubqXBb6VGV8i5FekoCx9Hdc5X3b7obyjza3beVPA8cCAgPV44EIKr
    /+p3z75v4ez5bHmBPDtygSjdlL5HfQ913vjvQLFbrcU3vIb+CmCWay9tkDZ6P1TD9+WCw3
    4DAmI+oZFZpM3fs5J4CCyZLCfqnL1+6fa/6kxt6gE76PUYikWLhUlR7lP8Pg
X-ME-Proxy: <xmx:3srjahzJZ1OspWb4E-ccUEXxLbrZ5oO6v7knxEoYSViU4w7bLJyHhg>
    <xmx:3srjai3FtjhK_RWq0RqdD6agOG7yUWq9cWEwTWssGkfLCIfpp3KRfw>
    <xmx:3srjahpJQJ6wOMqj3VCcJsEUxRD8pPsVAlY9YFZgvBlL8UHtTGvKdQ>
    <xmx:3srjavW0qobjVrEZW2_JDIHmvXV0OMg6jdmXrRXC8jpHcWlsMMvUDg>
    <xmx:38rjauUK4I5-zTI8VWrHN6cAWV4UHJJ_0ZO8aOywIsIXc5jVULmOQNKe>
Feedback-ID: i9d664b8f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Oct 2026 18:38:19 -0400 (EDT)
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
In-reply-to: <20261026170744.948701-1-jamz@amazon.com>
References: <20261020141647.3271341-1-jamz@amazon.com>
  <20261020141647.3271341-2-jamz@amazon.com>
  <179253863737.1724252.12836488084615923712@noble.neil.brown.name>
  <20261022014545.2495106-1-jamz@amazon.com>
  <179264679002.1724252.4479504779598097455@noble.neil.brown.name>
  <20261026170744.948701-1-jamz@amazon.com>
Date: Fri, 30 Oct 2026 09:38:15 +1100
Message-id: <179331349568.1157394.13124360154896615084@noble.neil.brown.name>
Reply-To: NeilBrown <neil@brown.name>

On Tue, 27 Oct 2026, Jimmy Zuber wrote:
> On Thu, 22 Oct 2026, NeilBrown wrote:
> > Almost all other filesystems use d_tmpfile() for tmp-files (which calls
> > d_instantiate). Is there a reason that fuse cannot use d_tmpfile()?
> 
> fuse_tmpfile() follows a slightly different pattern than d_tmpfile(). A
> fuse tmpfile shows up in /proc as "<dir>// (deleted)", whereas d_tmpfile()
> renames the dentry so that it shows up as "<dir>/#<ino> (deleted)". Also,
> fuse gets nlink for the tmpfile from the server, while d_tmpfile()
> decrements it. Reusing d_tmpfile() seems like it would be a behavior
> change, which I'd like to avoid.
> 

The /proc different seems cosmetic and probably of no consequence.
The nlink issue might be significant - I cannot say.
It might be nice to include a comment where d_instantiate() is used,
explaining why d_tmpfile() was avoided(?).

Thank for the explanation,
NeilBrown
