Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCCC403AE1;
	Fri, 12 Jun 2026 17:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781283877; cv=none; b=rZ0gQovH7c3qQhDtX3lvZicJ32z0W4hfFr/8OXU5HLe/6FoDMGy+QehWNHR3OCpghPpEz2rIq5tvEZbZFCGCM0Y7FOrEtmJr94cf/z0bfMdQs5qYqJjO3LVm9W6f8fX8gu5/28H0h2Bknd4F3Pxmj6RNPilNAJ0pa8hPifUYJ5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781283877; c=relaxed/simple;
	bh=w9rB03p6uNf6v+e3HDd0+4lcc0LC1WNGF2W3+/a4vJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=chY2ORbD1TJV44MxMbXIWsuLDDp+E1Ka0MYngAQHl4qApcYFmznSLAhU4FiLlyAZOaUCfO1ACOymon0lx88miL2heXPEutrgyqCR2s67VHz/kql9JF69SHKLopy04OWuM5l1Y/9EVzCjEj/LcUFa0FeNV4uyQiJcsZy5sgd5je4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b=SkCA5wn7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="SkCA5wn7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5804A1F000E9;
	Fri, 12 Jun 2026 17:04:34 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=SkCA5wn7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1781283873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XtNLc2MCDhGhm4G2cttMK4Gp2TnrnlYCYBd7sz+n4j0=;
	b=SkCA5wn7FcRWHDB77LQw/14w6pahdvrLSr51m2na5mZ8EuON9aLbb518bl6CR8GAANx6mK
	SGq+vTqROsfdrCd3B9T5y65W+G44LUgYXBqEJdYQOYbQ9hu8BLYYCMClpn6Z+GAQPdwOEa
	sSVSCCza0bG+SmaPxIoVMrprCygE3V0=
Received: 
	by mail.zx2c4.com (OpenSMTPD) with ESMTPSA id 3a28b952 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Fri, 12 Jun 2026 17:04:32 +0000 (UTC)
Date: Fri, 12 Jun 2026 19:04:15 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
	Anthony Yznaga <anthony.yznaga@oracle.com>,
	Mark Brown <broonie@kernel.org>,
	Sarthak Sharma <sarthak.sharma@arm.com>, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	Aishwarya TCV <Aishwarya.TCV@arm.com>
Subject: Re: [PATCH] selftests: mm: fix and speedup "droppable" test
Message-ID: <aiw8D_tdKYYNGyN_@zx2c4.com>
References: <20260611-droppable_test-v1-1-b6a73d99f658@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260611-droppable_test-v1-1-b6a73d99f658@kernel.org>

On Thu, Jun 11, 2026 at 12:01:55PM +0200, David Hildenbrand (Arm) wrote:
> The droppable test currently relies on creating memory pressure in a
> child process to trigger dropping the droppable pages.
> 
> That not only takes a long time on some machines (allocating and filling
> all that memory), on large machines this will not work as we hardcode the
> area size to 134217728 bytes.
> 
> ... further, we rely on timeouts to detect that memory was not dropped,
> which is really suboptimal.
> 
> Instead, let's just use MADV_PAGEOUT on a 2 MiB region. MADV_PAGEOUT works
> with droppable memory even without swap.
> 
> There is the low chance of MADV_PAGEOUT failing to drop a page because
> of speculative references. We'll wait 1s and retry 10 times to
> rule that unlikely case out as best as we can.
 
Wow, thanks! I wish I had realized the MADV_PAGEOUT behavior while developing
VM_DROPPABLE in the first place. That would have made development a lot easier.
I wound up just running this in a memory limited VM to test out the different
behaviors, which worked decent enough for verifying things. It would be
interesting to me to now experiment with vgetrandom behavior over intentionally
MADV_PAGEOUT'd droppable mappings, to fuzz that the careful bookchecking of
that works as intended against droppable mappings. Anyway, thanks and:

Reviewed-by: Jason A. Donenfeld <Jason@zx2c4.com>
