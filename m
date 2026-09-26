Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2119342538;
	Sat, 26 Sep 2026 17:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790443420; cv=none; b=BEJaNrS+4wIsDihmhSM8AlBWFHo5Qk6rEcOFVg70VhJvrgQwvEybaU0dTmyVypmXEFOX4YYaVckYKlI6Kgb1VSyXMEygTCJmombAuWJHFlH+0rJG2XaJmIOGtiwqdQVtlngebBS4ZaweNW3CuyVZWvEuSdix0J8Ypi0ShRioFRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790443420; c=relaxed/simple;
	bh=hRDyPq1CVvhOw9qrN3HGP9rtYUySEH4FnosZitYy5Bc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U2Jeq/g9oBpsDtN7L/ZlEO4sv5oO5PhPuaKg2d3XkQKMPWygXy96axU8Gtkvd0Wp451OYGxVchNTEjJHwVPFyC2nxSLEdKJlq1EXkZfu2j3SMvLus1Neu800ioZn5KB3vQvWng2heHNlD5UpzUT5BbetsS9b30epWhsjrCxSkqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=nzpmTYr2; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="nzpmTYr2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1790442861; bh=CmHOlFDk6UlCjro58JazdZXiCkRh1EGL0ccmJxXEbZA=;
	h=From:Message-ID:From;
	b=nzpmTYr2i+M/D8y8su33VkAlKGNyEiJ7fU4D+9eORRUu83ud2GLLo9nqU9qZjmKa3
	 IbN86iRs4EWpEgxkdLIWmVXxSHW23TmZLItPmF6KrK8slxitpmaFL0PsdWcShPoVXs
	 BifCqlwUtzzuUypebBEUkwuzts1mlhYzYuZs+q9U=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id D4ADBC0023;
	Sat, 26 Sep 2026 19:14:20 +0200 (CEST)
Date: Sat, 26 Sep 2026 19:14:20 +0200
From: Willy Tarreau <w@1wt.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Danish Khateeb <danishkhateeb03@gmail.com>, Shuah Khan <shuah@kernel.org>,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] tools/nolibc: stop rounding malloc() sizes up to
 4096 bytes
Message-ID: <arf9bClKfvuztamr@1wt.eu>
References: <20260926152414.251214-1-danishkhateeb03@gmail.com>
 <20260926152414.251214-2-danishkhateeb03@gmail.com>
 <d64fa7c0-e853-42ba-be3d-11a236c5182b@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d64fa7c0-e853-42ba-be3d-11a236c5182b@t-8ch.de>

On Sat, Sep 26, 2026 at 05:50:28PM +0200, Thomas Weißschuh wrote:
> On 2026-09-26 10:24:13-0500, Danish Khateeb wrote:
> > malloc() rounds the size of each mapping up to a multiple of 4096,
> > presumably to align it to a page boundary. But the page size is not 4096
> > on all architectures, and mmap() and munmap() round the length up to the
> > page size themselves.
> > 
> > Drop the rounding. As heap->len is no longer rounded up, growing a block
> > with realloc() now always creates a new mapping.
> 
> The series looks good to me, but I want to hear from Willy before
> applying it.

Fine by me as well. I remembered there was something for mmap() that had
to be rounded to PAGE_SIZE but it's not len, it's the offset, so we're
fine here.

Also I've checked when __builtin_add_overflow() was added, and it's gcc 5
so we're fine here as well.

> > Assisted-by: LLM
> > Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
> 
> I'll add a Suggested-by here when applying.

For the series:
  Reviewed-by: Willy Tarreau <w@1wt.eu>

Thanks!
Willy
