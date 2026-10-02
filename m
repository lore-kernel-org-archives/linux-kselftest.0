Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8E742E40C;
	Fri,  2 Oct 2026 16:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790960227; cv=none; b=Tj65yzSK4jeutrMtqBQziH4/IbslXULxaTnSuT43Bd8t9t5R03xOpSTqCu8BWaPxTaL3+Zuo+O7w8QnSVgYomC6cDEeaVLjSRwQxpdpovc50m2OK8qlfWvbbX8SmdgyXaDqAFXtPtB2g3yKCFQ8oBXr3e8c+ND0JzdH5gzHtrlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790960227; c=relaxed/simple;
	bh=zG9FokP3EUaSV1KtLWdmJ7eppjshL3/JRZmMUxMadzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mjU03fhVPOOYhmVRmyjdutJxoX3xugjbHWpeR8XQuk2SGfPDrlO3TRZJPs0lTmaRv5Rtcas9c84wvFRol2PVLaQJNOVQF/SIlUhkePkgdLS9VL6VnQzzaZaOLav858qYZmB/nzqxXNPkRam5Ff7XJ4TjGP88zwoZ5mGp8BGmKOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Slte560H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Slte560H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E07EB1F000FF;
	Fri,  2 Oct 2026 16:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790960224;
	bh=sXVuvGOQOjvrXGiQDdOkCRR6Ejb5KpU1lvo2yZ1e36o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Slte560H+S7gHf+9/BiTpdAVgvg6S33E+8N5hkjj1JsG2jl2JQMhga/l6PEpJnAtO
	 aqD9xWUN/tlSl+SkRvkHssem/UxyG7AXXmxyB9Z9H5dhgZcJEuTUqKQTzFPx1lcaAR
	 DeQhFDoMIHkU43+UYNna0b9DHsP40GcmV3eKtvS5OgOEdq9vg04R5+opICUFM3h/kX
	 W3X5ZHwcXvznNCoycGcz+F/mDjdjQmpKG1swIZ1R5qo1/VQ+mo6M/6e/rCGu7Its2A
	 vS4jG72VpkJlX5cZn0FJAWOloOBahtHkQ2iM/wi16fn1CbVL5BCNgP3m3zWtmd1YDA
	 NO7AMLNJqQYsQ==
Date: Fri, 2 Oct 2026 17:56:59 +0100
From: Simon Horman <horms@kernel.org>
To: Victor Nogueira <victor@mojatatu.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, jhs@mojatatu.com, jiri@resnulli.us,
	netdev@vger.kernel.org, Eric Dumazet <edumazet@kernel.org>,
	hybris <hybris@mojatatu.ai>, Sashiko <sashiko-bot@kernel.org>,
	Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net 2/2] selftests: tc-testing: add cls_route
 no-routing-attribute change tests
Message-ID: <20261002165659.GK13925@horms.kernel.org>
References: <QDISC-0JB3.v1.20260929143022@mojatatu.com>
 <QDISC-0JB3.v1.20260923100921@mojatatu.com.2>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <QDISC-0JB3.v1.20260923100921@mojatatu.com.2>

On Thu, Oct 01, 2026 at 12:32:01PM -0300, Victor Nogueira wrote:
> Add a boundary pair for route4 change without a routing attribute:
> 
> - a classid-only change of a wildcard filter (handle 0xffff8000) is a
>   metadata-only update and must succeed;
> - the same change on a non-wildcard handle (0x10001) would rekey the
>   filter to the wildcard bucket, leaving the handle userspace stored stale,
>   and must be rejected with -EINVAL.
> 
> The change of a wildcard filter is the flow iproute2 uses by default
> ("tc filter add ... route classid X:Y" gives handle 0xffff8000).
> 
> Reviewed-by: Jamal Hadi Salim <jhs@mojatatu.com>
> Signed-off-by: Victor Nogueira <victor@mojatatu.com>

Reviewed-by: Simon Horman <horms@kernel.org>

