Received: from flow-a6-smtp.messagingengine.com (flow-a6-smtp.messagingengine.com [103.168.172.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FACF4334C5;
	Tue, 11 Aug 2026 16:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786467582; cv=none; b=HV79wpOho57OF6H045rhYis3StCy08WLtIaINZdk5aRnpu23yllnwMez960PLgpfwJSnErYVFOK5Ip/DMEEEdNJIgzTttUQJGyGc8MLKFEhyqKszmgKXiQ+7m8zAOyLBbdDZeYfKmLl6/QL2GzZ8lmZVo//j7ewAgnNS9lFu5YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786467582; c=relaxed/simple;
	bh=K7l1mTcciEUKmuGrFplGbiYlE0ZmLe/blxu/UC/UHog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=osyeGEZ+Y9zJzGJsf8UfYWi+8m9ELx6wkghUeiolSmwA8ljMewJyeAxSnXPhCvLhqkvw/EFqTVqe4TofC3qKnkdBlyAvfFK3v/wgwqupSUz3+2lifM68Ly6zq8kJp4KS4mGdiF8FGb790EKkigiT86d2wil09QrAzWW1JSJ+9AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=e5CiQphU; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=aTysU3L2; arc=none smtp.client-ip=103.168.172.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="e5CiQphU";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="aTysU3L2"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailflow.phl.internal (Postfix) with ESMTP id 530C01380437;
	Tue, 11 Aug 2026 12:59:40 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Tue, 11 Aug 2026 12:59:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1786467580; x=
	1786474780; bh=a/IPx4KtYlUFdbmjZIHL+vVayMdCY5hwV0MPIJboBbg=; b=e
	5CiQphUz8BkmYjXYETqskSStaJPNv8tvT/ODXWdlx6QfdB1TP3xMcRLsnTVVoufD
	gol6hCqLPTjLnmzbeQcLELABeQomiW6YdYeLHvuaRtircZs8ruwz3bcP8x6aPODi
	lz+jAgoF1Z446UKM3lUwGgwWNRgc+T/Y5/pOVhEX5qI7oy28lIYEb3LpYMQ3/22F
	yIjHoIlbhA5VNT6lPbT2PHY3O5vinSwP219jHPKzpZNrhQG+gyewYld80Kf6ibB/
	T+xacI53DsWHraPzFu+e+fNyI/24Bm2I6CSocn/bjhudlLVh543ngN86zcAkVGU5
	4WIDIhqYGc40OEsbyADzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1786467580; x=1786474780; bh=a/IPx4KtYlUFdbmjZIHL+vVayMdCY5hwV0M
	PIJboBbg=; b=aTysU3L2mtfRzQDtQsFHQjeGlLucbkOLenYjx1Mf3D5YD4OOmlQ
	yECQIG2pd3rTY7L9zY2ve7KvzT3A73wIQhSD8nu94UIdCv+MWI14CnZdRsA8uy+B
	YWSQkdUWd/bWA176oJ6n8F/ZKZW0LhQDroAKkZVjuIaWQqpu+IAIRp/0kK+lRFN/
	ZVDbKZQfzalZP4nqtSr1z5EbaLdnQBjzqm+I79PiWBTeYPWiQm3CGOjOD43ep2GA
	GSQ3fj5AH+/Q5sEOlWcSF/hZqSWYG8u+DFqU1h7qi2/ahBcnbgSWDUgx5dwfeT1c
	KFMoIQ9w/1cLTk1cfqVODqLZdnjelg9y7/A==
X-ME-Sender: <xms:_FR7an5SoV9M-_P6FikbkEqXCHkS-KEpco9_qu0ICTZollMUdSoYSg>
    <xme:_FR7al4ZbE9UxO9Hs0x5YraRl9jCTK8NhxyQ_pKL0T-70cHGPgIZU6QAZzaJPch9R
    uPFP-r0gleSE4LmdICTsdyBScE1CUjRmLVGZRMHnWI9uSvlMyBWPg>
X-ME-Received: <xmr:_FR7aoJUVo0GRDy5wvyAfD8tXYOR7L9gXNPHK4BCDGXBOuledr2bVm5HR5o>
X-ME-Proxy-Cause: dmFkZTFJB1O9zKJAg+fSg1tJ5bwBvVvABgj+vqmdhVx2D/MjfMXbwCFNKEbltsl8EEvEtG
    4thUp46lahlnREv9JgiK4QfbzG2pgttOEFqRUWh5mvKTEqsyv2D+4VlCuUKMQ/M7pyzPnU
    16IJYDjoXjq3+RPwxxLgh+AJBuNtME7bv4mQr5qaYllb7ykwd7fbeInQAqB4rIEC+3FeHY
    DV0SyexRRlvueW+vvKp24X9E6FOo47n0o0yI1M6QPP5Eun05sKXRPhrzy7P/g2pa1ezVEg
    VGlu267qK3l6duQTkkKjr8N+pskDWpTe+JopNqUrrJWllBpfrrg1hV/yz3CwqXXdMpEznF
    sQLaRe5uKf794ipICvZMteBuhmrMmfuhKr3QmVS/S2pXj2/FLMynLeShDS4aMln1w9EP0A
    pqvemdcoe4NzmD80VXDmYAtHDB0gfcRqKF6zsbDQVpM21JnEYSk1ydLXNVsMVav3GBIywi
    hQPnqaWFPEVLFxE1ukh/MfwZ49XADNiBFgicP+T/lGnJIqigoOGUyXasVesxWJhDCVUUJX
    LFoV4iyAeSWgJJ5H3bwDYapWuPihvRYAuoavv5svgiDBC8o4yT+GY+Vb+1vxHFbtrsCp8q
    GAQdhmxTnIdreJewmmPQSq71P9t4/nBMtAGyJloOFgCGvscFN96znGh4XR+g
X-ME-Proxy: <xmx:_FR7avEW04U0sNOB2QgnMzM1ospr1vsnsablPob81dailu1cW5IlhA>
    <xmx:_FR7at1mcIf2N0MVGWQtVENK2mhtgNwatXTGeRdPC2-sTfcbcIt9IA>
    <xmx:_FR7apzoGtZWKzvap_N_VJaFkYxbpMJQZmPqUU552ri0nUctduZbqA>
    <xmx:_FR7avFEmlPXpgXINeHsfcTH1K3Gyq0CXwak_cX75t8NSSB5OHt1zQ>
    <xmx:_FR7auXAGyTGy5DdbS3r_1xgiY9tAOZfnJ0zceQCJxF9wVk8hORK3Gf9>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Aug 2026 12:59:39 -0400 (EDT)
Date: Tue, 11 Aug 2026 17:59:38 +0100
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Muhammad Usama Anjum <usama.anjum@arm.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	nico.pache@linux.dev, baolin.wang@linux.alibaba.com, baohua@kernel.org, 
	dev.jain@arm.com, hughd@google.com, lance.yang@linux.dev, liam@infradead.org, 
	mhocko@suse.com, rppt@kernel.org, ryan.roberts@arm.com, shuah@kernel.org, 
	surenb@google.com, usama.arif@linux.dev, vbabka@kernel.org, ziy@nvidia.com, 
	agordeev@linux.ibm.com, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/17] selftests/mm: improve khugepaged coverage
Message-ID: <antU5wZkq4eoLhXg@thinkstation>
References: <20260807113647.3744609-1-kirill@shutemov.name>
 <e1364571-376a-40c1-937c-40f68b06b09d@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1364571-376a-40c1-937c-40f68b06b09d@arm.com>

On Tue, Aug 11, 2026 at 12:40:51PM +0100, Muhammad Usama Anjum wrote:
> > Tested on mm-new (8086604be973), with KASAN, lockdep, DEBUG_VM and
> > page_table_check, in 16G guests:
> > 
> >   x86-64 4K     190 pass, 1 skip, 0 fail
> >   arm64 64K     228 pass, 5 skip, 0 fail
> > 
> > The skips are structural: mixed sources declines at the smallest order, and
> > at 64K collapse_compound_extreme and the shmem components skip as above.
> I've tested them on arm64 vm and more tests are passing instead of getting
> skipped. Hence:
> 
> Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>

Thanks!

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
