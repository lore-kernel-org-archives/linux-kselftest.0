Received: from flow-a6-smtp.messagingengine.com (flow-a6-smtp.messagingengine.com [103.168.172.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F95234D90C;
	Tue, 11 Aug 2026 16:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786467534; cv=none; b=ljGxNnub/OjMhbdxG5tU5kXGuJULMUQyyj7cglI3PoSY0EY/jMbpVXcKpeffMsefNZRvWVaayrWjG/5jifsoS+lboNAbvnQTgxogmTZC6uNN94brjMi/UXS6e0jVF//97U1X6+r18f4PdQ5SIUeLKXBJsbwb41Is6p82ftLQ3pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786467534; c=relaxed/simple;
	bh=gMqlF/D6+JFVkHUqdhJ/c7btsZHh8yXgKeSwMrQ3zRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MgmsAsTUhSjKI4uCgp9GDzoXs2mUabGC4gU+gKmZIY4MSZdJULfqbRfuNhQvW7ABLAf5sILaC9Js2eVN5YelXgiuLk1sVjk70j/e96MdHe597UBABIzgFdXIk+w4IQjm8IdRjHdLyPLVb7KIftAuPmMeiPUrZoJkQiF4+DZHajQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=hSQFwMB+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Gts6PYdY; arc=none smtp.client-ip=103.168.172.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="hSQFwMB+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Gts6PYdY"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.phl.internal (Postfix) with ESMTP id 25FB31380437;
	Tue, 11 Aug 2026 12:58:51 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Tue, 11 Aug 2026 12:58:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1786467531; x=
	1786474731; bh=TjyAvX7Mugue+C5cYh+R1a7/5p4l8Irr+ax7oHoUcio=; b=h
	SQFwMB+XetV9+hyyHHxogEKB2YDwOPjRDNI52tI2w9feqalcTr+bd1BTZ1sKa4xr
	gGF+EbMb614itLTZR7PNJMNVVog+FIL5bN65sU2N+VbAzEIgaJSJ/5HMvHhFaypi
	RuM2kzzFKlB3YZjsYuARHTQUQHusi3SkT6AWc8Boji4E0IIWPWJ+90ZEHcj/UM21
	KsYgsxk6iDjjTB8h19N459e+aYJJMt++4ljEoQxjkTf9MIhseLXYNO1saFwHHEFW
	ahLuTOf2uFXS1NyJlLwC0T6EIn5iigzG8+Sr+b4Uy9Vcb2YkF4hb/0nuqe6eUJug
	zstTBrBulAfPRws80dqww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1786467531; x=1786474731; bh=TjyAvX7Mugue+C5cYh+R1a7/5p4l8Irr+ax
	7oHoUcio=; b=Gts6PYdYpzbZm+JHlw4zdQRDReNiMeaypzlpXJ7DISg8QYcr41q
	/7xkSl0T82xmcaWXOq79yORI5DJBL0YCbNu803OYoPQO3/WoykwcJiFgRVOO0zvX
	xdJvKSxUSbVOG9aYeOKjEZKUDgdFpWP8HuGuNzIqjN8lt83P/O3Q+9bGkJbcxyAy
	bOk31cyOpsCi2CVM7PXITBBuUG7FA8igyNEq2MHoleRD+mRtuSvfpyT+YHspYgMY
	KBFnz2XBx+wYzP5BabvbwVt1HskfUTNCOLEyBJ7rHUbbXKajrzOAsT84CD+VJERn
	s/iaEV0DBlM1PqS+6YKIi+SKOo7xVujNkHw==
X-ME-Sender: <xms:ylR7agnVyLXt57mfNJTAqkJUVRgSEZtjj0VSTBC6_pF3zvYwmqqrVA>
    <xme:ylR7atdV6iRwGP556xrHjmG8zmONPqURMAYY7h3qZpqnw21P_hHQpbBvKwDicVa83
    CAjMhwarW5i7abFupQotQMcxv7vSq37h9bkTjZP4S47uPT6ksvmTF0>
X-ME-Received: <xmr:ylR7akN8kCwbLJyXMylgfSEiHFj84_8l_yR5EmUP9E-Nf3g3H-MN7s3GuZc>
X-ME-Proxy-Cause: dmFkZTGw/dvbcaEj2HngP33VDAg9eCbiq0lwbqHTn2QAHQczq+P2RKDp+L8ud0Spkr0mhk
    3uDL/BCZgN9VBSnXxgqgZmjprKpgFZCp9D7x5ua2QdXa8Y3zq2jFdoTz+wMcpgHeI+dZMv
    SH3nFGwlFziDUIaHYaLWqOBy0TSFxRiM+s9hg1mDYkmth4uP8oXNyv6Xr7cFS7ZMYoupr+
    JjHmtkfeO0jrGgEmm5N1yLT5ZvMVq5j3TaMJMixbHC3ieE50Rn1Tzv6oyFX+2ZghkjdR60
    h2pwdEs6Y2LSL3tQnMz/EVeo4YapSMlo4GYY0Y44Ov9KhB6d1btj8zbKNkgL/98kdsDhGK
    D9atn1Her8TmYPe+HvKEbXY9gJdp+hFiEy997w9uyjKgg108vLs/nEPVEm7oeI+Cud0fVv
    2uLCiuBNEGs9i+C+6gyKxbBxh0jpKynfpA0PZHJ7SLVbotgrX6StpXKMu6/j2GVfriPnmR
    TilxE+3Ojf+x17pITfhU9f+KyC0dJHpk2oemh1NHBYYNUT1fMK5BzB3i4L4Ji13rD96OfW
    NobxrnpwSmEkA/7i/yfqzT2KE4YqdAVn+BDGgZaJBPBYyMMjBoqCGKB9OOjKHn3oxI++1O
    3AiTfaFLnGJzkzZi9A9GjXD6CNsgRQpR2HzCjSqvmKFys3rZxggvsj0uFXiw
X-ME-Proxy: <xmx:ylR7agMuyidBzdKUldr4igDduleH70rXOyrDW3rWnWvhXvl9XawgNA>
    <xmx:ylR7at6YfL_eTGP9rvVq5nQgu1IxIhGjY0I9NuGwqQ-WsFIUn5tBGg>
    <xmx:ylR7asam06tmpINrcvxWcvE4IgplarF_0SIgGJng6doHA_gaRupRDg>
    <xmx:ylR7atF0lHg9u-3aYD32lFFRjKhvAnSfStaB3KF6mSwgr3RO-fiXYg>
    <xmx:y1R7akL3f04RQ37VXqAHBMwA5ZZZQG_hpcbyQggrqITDtd4YK2ykpBZV>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Aug 2026 12:58:49 -0400 (EDT)
Date: Tue, 11 Aug 2026 17:58:48 +0100
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	nico.pache@linux.dev, baolin.wang@linux.alibaba.com, baohua@kernel.org, 
	dev.jain@arm.com, hughd@google.com, lance.yang@linux.dev, liam@infradead.org, 
	mhocko@suse.com, rppt@kernel.org, ryan.roberts@arm.com, shuah@kernel.org, 
	surenb@google.com, usama.arif@linux.dev, vbabka@kernel.org, ziy@nvidia.com, 
	usama.anjum@arm.com, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/17] selftests/mm: improve khugepaged coverage
Message-ID: <antUso_Mfdh3EiHk@thinkstation>
References: <20260807113647.3744609-1-kirill@shutemov.name>
 <f9e0fe38-47de-4577-b638-1142d4ffbe6c-agordeev@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9e0fe38-47de-4577-b638-1142d4ffbe6c-agordeev@linux.ibm.com>

On Mon, Aug 10, 2026 at 02:58:43PM +0200, Alexander Gordeev wrote:
> On Fri, Aug 07, 2026 at 12:36:30PM +0100, Kiryl Shutsemau wrote:
> 
> Hi Kiryl,
> 
> ...
> >  - Dropped the swap-skip patch, an equivalent has landed
> >    (Alexander Gordeev).
> 
> And dropped [1] following David feedback [2]. Would you pursue the proper fix?

Yes.  v3 will handle the failure rather than predict it.

is_swap_enabled() already skips these cases when no swap is active, so what
is left is swap that exists but cannot take what the case asks for.  The
series already has swapout_range(), which reissues MADV_PAGEOUT for up to two
seconds and reports whether the count arrived; I will make the two cases skip
when it does not.  That covers swap too small, swap full, a memcg limit and a
folio still under writeback, without reading /proc/meminfo for any of them.

An error from madvise() itself stays a hard failure -- that is the kernel
refusing, not the machine being short of swap.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
