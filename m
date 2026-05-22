Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B95B2264A8
	for <linux-kselftest@vger.kernel.org>; Fri, 22 May 2026 00:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779410993; cv=none; b=XXX7we+1jrsiPuQmv/q7BfNMnoiwFzLAufNVPeSQZmV2I9vpkZ8p5THrzZcs6G5tie2Qarzy0QP2KcmnTcCDU9OYqIQP/bUS7iF4XJS7BGN22ycwCNiylyCZ1PVJMecOM2OVrF8yUOM8y9ZKf9eOTcWcpoRHzFQio/reHverZQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779410993; c=relaxed/simple;
	bh=64cVfqex94nAMr5fv55AO0AprHOTrjc/7EZVpQiNEhs=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=frL8d2Aj4c9xIhv0M/HTN+HbQRidLlstjCG0h7Aia/q505/rPXseA+gD4WoVnE1gydPLkDnGUh8ZXcaI/4ao4dTwMlATfEx2rnAEX5Tbf84zFCtYY4sxgU0E6fq39/98t39g4R38l80hrMm7Rc/1rDw+EwWDKilSStv+U0rwUt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=srdsM9bI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="srdsM9bI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA3A11F00A3D;
	Fri, 22 May 2026 00:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1779410991;
	bh=WatfylbvkDV16JVW54t5ye7mqGpFdFgMUbBLkckIhZA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=srdsM9bIlN5tAruNPcPsu+oBY9hYfTznm+nyaoqIGACzwGFETHF3It+luHH+BfQK/
	 NO0MtYqZ2cag00gBYx8O/OuQdF0r/txQv3Yq1TNqft8h6ETAXI6g3bsPaQhKRHnhIh
	 b5jWrktauzYR/8bKAe+clWxSS59Yt+6876ycc88s=
Date: Thu, 21 May 2026 17:49:51 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Wei Yang <richard.weiyang@gmail.com>
Cc: Dev Jain <dev.jain@arm.com>, david@kernel.org, ljs@kernel.org,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: close fd on write error
Message-Id: <20260521174951.d16f76cc39cca19bb5d6ee70@linux-foundation.org>
In-Reply-To: <20260520093824.eannlavh64fpxyrz@master>
References: <20260520020336.28914-1-richard.weiyang@gmail.com>
	<20518530-12e3-4731-9b4a-54cc950239e2@arm.com>
	<20260520093824.eannlavh64fpxyrz@master>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 20 May 2026 09:38:24 +0000 Wei Yang <richard.weiyang@gmail.com> wrote:
>
> Subject: [PATCH] selftests/mm: close fd on write error
>

selftest/mm is a big place nowadays.  I'll rewrite this to
"selftests/mm/split_huge_page_test.c: ...".

> >I asked AI and it points to another problem:
> >
> >for (i = 0; i < nr_thps; i++) {
> >	if (is_backed_by_folio(page_area + i * pagesize, 0,
> >			       pagemap_fd, kpageflags_fd))
> >		continue;
> >	ksft_test_result_fail("THP %zu not split\n", i);
> >}
> >
> >ksft_test_result_pass("Split PTE-mapped huge pages successful\n");
> >
> >"If one THP is not split, it prints FAIL, but then falls through and also prints PASS.
> >
> >It should probably jump to out after the failure".
> >

https://sashiko.dev/#/patchset/20260520020336.28914-1-richard.weiyang@gmail.com
doesn't say this?


> Thanks for AI.
> 
> It looks we should "goto out" after ksft_test_result_fail().

I'll assume that's a separate patch.
