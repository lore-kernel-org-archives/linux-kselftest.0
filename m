Received: from flow-b1-smtp.messagingengine.com (flow-b1-smtp.messagingengine.com [202.12.124.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92C945041C;
	Wed,  5 Aug 2026 15:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785942935; cv=none; b=u0J35y/nnDqYKlJ23uiV8BBYHgzHcJ1KghzaLxI24/+MjVptnw2fmvmL3KmaZNjuk6b8wOhqaNK/T+znDoXgmCQc0rlDHxulRaejo/STonB5MvGuM9vgGucaXuiRLknokuxENRVGV1q6CsAT5zifjfRFIlx+57KGPy7w164VE8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785942935; c=relaxed/simple;
	bh=4Z9NHe04aMxn6iWLwYna3TY5WUs3hJKRi5ykMvHL1Z8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ero6JHHcTLuDgrZfApqczry5J/KU4PjfJwYTOjOmwqa/dlexEqP+w6VhNmaYD+7La05tqJevEm2DMpyDu5kOT55EWp52UoiaKhiAth3clcJGanjBQA78e8MFmjeI0hRcW0CxKe3Tb9Cf731niqu0CC5KvrHOk8lGcEwgiGfD4Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=CV16dChQ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=BrkCumcS; arc=none smtp.client-ip=202.12.124.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="CV16dChQ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="BrkCumcS"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailflow.stl.internal (Postfix) with ESMTP id 77BBF13001B1;
	Wed,  5 Aug 2026 11:15:25 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Wed, 05 Aug 2026 11:15:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1785942925; x=1785950125; bh=U7ZkDliwRfxhvVTQMfE6v/Ojz2Rmn9+3
	4DO9xroTB1E=; b=CV16dChQ5cM5hNAW2Xpz1qNJpSQFxsNzwTScqiWyrQlluc/E
	ZFKqQczPOSUsA9Vxt5qXDBq+ApY6rJ/BXHyZRFyljNZhcuzlUCOQ7R/G1LTAEhy1
	IxA290pnEXJ6pqnNcsxpX6wKjG3fkxc7adu5yGhxTGBxM4CYVpswo9bizhNqOEfM
	BwZllnnVo+1mj0jiF/JquD4NAu0KPERBz2xnfFig9serGOpFnz/VfekMThWJhiy2
	xVS2nGmHfb5EgLmRZob/+XosVo92W3Rquq32vl3nmcRE9lIt2cyuJo/s/ku2q07R
	zRWE8V1VVoicdDIAFPuPxBjEb1ApFbQb8TXqag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1785942925; x=
	1785950125; bh=U7ZkDliwRfxhvVTQMfE6v/Ojz2Rmn9+34DO9xroTB1E=; b=B
	rkCumcSu1eHyLBD3L8/6qpJ7NjR3/c4/OP8fmym4j9kyI1dyDFjet/ZYtmcQe0fM
	OCSuv49cCjdk2oOd7I1d9Ahd7qwjRbEclDLNa5gI9/iR22zO4zqRR96O2Rh2lTTE
	LuHSf5KK4K4e7k3eAPJkn4XQv8iJISND8X+PjS2CBwMyw37NK6Hrqc2QPhoIDXc0
	WgJcg9x1x3vGSFtLad1zHVdH/InzfY1x9c89LtNnI5SszS3fyMLryGcB+KsmOUzK
	bv0HwcHFM5iVitUq/CCDWmVEqmw/+vkHaePSVLCOpbcdASPiJYNyOgouw3R1bM9g
	rwE9wQTO0FClXfmc6aeUw==
X-ME-Sender: <xms:jVNzapcFQGW0a4umdWMy8Dyqn0wCOd0Zx63GWgSjDhr-OMpV4Q2P9A>
    <xme:jVNzahept3Q22xii7irx8XCYvF9Nv-u3z8VopB8FDyDbfXhqlNuuDqQKoBRXpJd5v
    JCelOpuR5z-bsnLWBRlnVCf7SPMbiTQTQ8I8tFUyP_1fCAf-QF_7lc>
X-ME-Received: <xmr:jVNzakR3U3R-wUnoX4cHF_6onJ-lPSmUfBQX9BZpsN8BhQF_grIfOnRApkY>
X-ME-Proxy-Cause: dmFkZTFHKfj67EM/RMXyAf8uRwuo4d07TxotiadWQn4kDCiLCwUYzIuTbRY0RQpqX1k6oT
    WhTK1MOY3WugcZC52K6LXS1Rl3mBLj4Ydb/byy10WXX4yQi8pS1xDlrsOpEcGgy7a7AZoi
    98lQtQp6JVBcANtP5P0BIFc32itP8/jhbG2tyfi2fKtKxnb9ghmdFsDUE7bqwkkR7Yvw0l
    i/G5WnwWrqwe76bY+cx4Au05hC+Ivxa14J26Fgx2R3u+UI2ASEvRk5kw9iNsEtAu/rP6f2
    MVh/CfN4p4xRMbrhEycC2/Kf8tHkS7P0O/aL+LzcQiVtX7lqrcR/V09fdS3w/RWkCAdIpb
    i4lsQQepRlniLqqftZOHcYZ8KgDi2xU8bSle35erJaDDYsFmaAURN6wGQh5U7B4XI04Uso
    8X1i5GlrW84Sd8Akb0Uk8/qfTHSEHdXmn4DhzmoVAFeWBlq7TqXJdjxXE+97Gpyr5GhFVy
    nMrucB/VyyG5aBahifVcC+/4e2cw9da0TU23ve+UKw3DkTkdTfSDv4puLLPVP95se+oflH
    NYELDcUsbrfkctuBFqs8cXsupQ8mBdUtiA1iRYeHhBpa4i2B1UZXSL7EwDrM4LLaCL9a64
    MGJTxaWsmwawyKe9I3H1xO5E4+Lwqo9kuAeTqnmIXerZqi/PgwsvLc3rDZpA
X-ME-Proxy: <xmx:jVNzanglh1oS_QB8HX3EJJQCK94KPROnnypZQyqOnoiUb4wyIk4tQw>
    <xmx:jVNzaoplAwdiady-jvq_6NGkObtaLgMLr6Ej4ThsxTRCwewm6MGSvw>
    <xmx:jVNzavPOdAz2PEl3eKqpwIMCVtCYzbSuOujXd-j3ivnrZHBmScmQLw>
    <xmx:jVNzauZ9ixV-ySuyac-A3FHPvJRcpnFyVm93EklMeNSvOuws6rE-aQ>
    <xmx:jVNzarB_1VzbTWyZx8QhvBUG35ENdZ-8Qc3KAtl4QIXut_m5ZoUsEkm->
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Aug 2026 11:15:24 -0400 (EDT)
Date: Wed, 5 Aug 2026 16:15:23 +0100
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Nico Pache <nico.pache@linux.dev>, Barry Song <baohua@kernel.org>, Dev Jain <dev.jain@arm.com>, 
	Hugh Dickins <hughd@google.com>, Lance Yang <lance.yang@linux.dev>, 
	"Liam R. Howlett" <liam@infradead.org>, Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Shuah Khan <shuah@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Usama Arif <usama.arif@linux.dev>, 
	Vlastimil Babka <vbabka@kernel.org>, Zi Yan <ziy@nvidia.com>, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/16] selftests/mm: improve khugepaged coverage
Message-ID: <anNTWtDac3b-u0sf@thinkstation>
References: <20260802195254.1937477-1-kirill@shutemov.name>
 <f9f01bc0-490b-4d06-85a0-e4693b80696c@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f9f01bc0-490b-4d06-85a0-e4693b80696c@linux.alibaba.com>

On Mon, Aug 03, 2026 at 09:21:09AM +0800, Baolin Wang wrote:
> 
> 
> On 8/3/26 3:52 AM, Kiryl Shutsemau wrote:
> > From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> > 
> > mTHP collapse went in for 7.2 with no functional selftest coverage. Every
> > khugepaged collapse case is PMD-shaped, down to the detection: it reads
> > smaps AnonHugePages, which cannot see anything below the PMD order.
> 
> Yes, I’ve already sent out several versions of mTHP collapse test cases[1].
> Not sure if you’ve seen my patchset, and it looks like some of our work
> overlaps :(

My bad. I've missed it. Acked now.

I will rebase my patches on top of yours and removing duplication.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
