Received: from flow-b8-smtp.messagingengine.com (flow-b8-smtp.messagingengine.com [202.12.124.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53522D739C;
	Sun, 23 Aug 2026 19:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.143
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787512667; cv=none; b=jGXqjtO5BGN2Y90R6KTi0JpyX73ZpXQOLUx4RHMeAE9g846uOp2FLDEtkGErEtTUzJudjk1rojL7BEYNAaExbC45JdEKFMhSBllNwMcuSqmdpqyi1ndgWgePDfWE8TJl+YiJgzt4dPnV1MTRTKSxKIrijJYtB8Elz2yEzzjvl8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787512667; c=relaxed/simple;
	bh=BjYny9cYKfuHknOmMbdeoFGgqyLyzgsv3AIF8eNWSdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ji+qrwLvgbYBemO/PxEEEuzlUqVUjcxk8jWZOhgq5sBiIULQMnD4xBxmmd46iPalqbr/CAVebHPf0Fgo99CgYYS6w8UJfYGpvuJV7I+SE7LZmooQ3vGlQ8mF09zQ0sSkWLmJH7etzuBeCyoSAs0cijtDtH3zJnB5yFLxuodHyuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=Sh172nvL; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=U8qMIjuW; arc=none smtp.client-ip=202.12.124.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="Sh172nvL";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="U8qMIjuW"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailflow.stl.internal (Postfix) with ESMTP id 8F87913000E2;
	Sun, 23 Aug 2026 15:17:43 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sun, 23 Aug 2026 15:17:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1787512663; x=
	1787519863; bh=0wLxy792B6yNuuTN2hFZ7joedHo9NROFJ3RumMARwe4=; b=S
	h172nvLnDkyAB1weLsxE1VwjgqoHALsfHUizskU3E3z31baxwgN+rW1PV9h79e3C
	84TIJB4elaZ6xWcLDZDEkQUADqoHGtBRewFTon3qC9tkFA7X2+tluK++KbOUmj9A
	WUnTMTvXpPFjcOWm54FjWs6WJ9o8nyntXF5BX+qSWZqOxq4m1Xhs7Ig02aSTpLrJ
	aaNbhKSmdZxSD2GbXmZt1NHTsjxmAzEE416BVjypZkiO42Ct9FAJ8N/aPKCL7K1q
	/6nz435RiaGaGgn8KTDj1yIQvQC7x3qLO/bfdnQTtRjOKEghTWAKIwrBwwVPjtL8
	l8jSldykja69bCnbss1og==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1787512663; x=1787519863; bh=0wLxy792B6yNuuTN2hFZ7joedHo9NROFJ3R
	umMARwe4=; b=U8qMIjuW70/dXCbpvwKxtBUmcsNKlSWGtC8DP27jJSw3dFa+qJR
	CAXLqVVJGP0QHLewjKcKipkSYrg/1JhdooBpXGRkFrvgvgiDXh92JqCGYE+TuGl8
	/iuRrdeZuTZwfT3wUpJtOBNBDhQGF+83DgS995i4jL94Sp6VXxiE3E0T2TsNa2b9
	HRRf67CFriTL2KOjUFRc/3c6aNydflTkMXpvPKjNaDb+Dgy5CuDUALZMxajwAtKU
	q02K/hTfErHbudYv8B+1kRlS9JpQAvo1bA7kn5v2M0PmSxxBF+U6rYlyMI4XpCdY
	xbfdxiMB149O7eSVe2z7b2rHfwZ9VxpDBng==
X-ME-Sender: <xms:VkeLam6xJ1jN4ngbIRqfCtnvcsyWVK5AHmD0y-o8_0L47t0lOBQHaw>
    <xme:VkeLatjqbES0ahdNINVRRmjsg72zGXz2VwnU5dfa39uyaADW124JWUAOgexBmxXGK
    bpvm9rq8kgwUuIRYBolkweSc0Omlubrdw3UJkmG7_bFPaldfu7MBFpo>
X-ME-Received: <xmr:VkeLarDT9CPjTGW61p6Jsqhoc9O8NZ106xWrj7vSXnvB_A087UHOcPCEccc>
X-ME-Proxy-Cause: dmFkZTFvj3ReSWIb55/gzqe1p2vADJpe2m938hpzU8Jp7sQQ+uDkp+Af7BRN+YUj5izGrP
    ozuQI6+mhwe05vF8+hIceVJhtt1lF1UWX+PMS29zLHNWwa39BloQnd5iwe2kKi9NCiuWjd
    AoJ0VbO1+/UwTRpxrTcW8DnKYlvqZtZ/K63Eq8Ad/8llZfx+26m8vP+SLHnA38cimd2o7j
    Hk5nbqLS1xqX7kWzc9TQstwh/PffKF9YfFowcjA9A8/TqWlG4FKoyX7nXQdsj9P6LrqfBC
    ovvkf1ZdC73R29CcITbF0ySlcxWl9XoA8//IwsOs3etdbiVdaNDoyfODSeYV3n7lBndkIF
    i0NacUKwx0cTYf94OCY15U/bvqUDAgUEZNv6ZQy/GV1L5x3fuHZxWO9uwIbYeubchNQsjJ
    C0TPVQ+JBNKfQ2eOG9Nlg+RTSa+65A3djLXMJ6bgpXqp6t18Sm1ld1JgYSeY1lRO0gRfR7
    4lc+MGguPN3TbtIpnwBXqV7bfmAYQ/0rZ4R4IL7SoGn59qriew3214fXxwirQicHxdgOEd
    rpApnVQooRr+E+/G5b93MS0peDpCOTYtZeoZdrhmpJrPDSunoGUBJcStTt2lw+39+nOU6X
    yJ5uAQ2h/Fm2kZJsyy4TAgikyNB+2MMUTTh3kRhsRmea8oQwEhP7kdLx+CWQ
X-ME-Proxy: <xmx:VkeLamxVi8L2vSLLy3s8GdNfNkJMPLYn4WV-kr9G1a4joGEKLyQaBg>
    <xmx:VkeLapO27o9snJry_3TK_bLugaYkcskVBYSBV_ekpYWYpj-OqqN39Q>
    <xmx:VkeLatfq9ktOAVIA_z5DgMCMx6pReY6NXRpfZiwE42_tJEVIw1JllQ>
    <xmx:VkeLag62a9T0KNyJrxbApaAzNu7We6qFPp3s6U4XqFNCVdmQWGOe9g>
    <xmx:V0eLasgDVUyQ9Nj9xGGyaGXOaIPKyEqKegRWKR1ktifySRG5-yGHhh9B>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 23 Aug 2026 15:17:41 -0400 (EDT)
Date: Sun, 23 Aug 2026 20:17:40 +0100
From: Kiryl Shutsemau <kirill@shutemov.name>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: akpm@linux-foundation.org, david@kernel.org, nico.pache@linux.dev, 
	baolin.wang@linux.alibaba.com, baohua@kernel.org, dev.jain@arm.com, hughd@google.com, 
	lance.yang@linux.dev, liam@infradead.org, mhocko@suse.com, rppt@kernel.org, 
	ryan.roberts@arm.com, shuah@kernel.org, surenb@google.com, usama.arif@linux.dev, 
	vbabka@kernel.org, ziy@nvidia.com, usama.anjum@arm.com, agordeev@linux.ibm.com, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 03/19] selftests/mm: scale khugepaged's collapse wait
 with the PMD size
Message-ID: <aotFuN5NTCnawTy3@thinkstation>
References: <20260815015901.1236937-1-kirill@shutemov.name>
 <20260815015901.1236937-4-kirill@shutemov.name>
 <aoQuCP87uX2kHl5q@lucifer>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aoQuCP87uX2kHl5q@lucifer>

On Tue, Aug 18, 2026 at 11:04:57AM +0100, Lorenzo Stoakes (ARM) wrote:
> On Sat, Aug 15, 2026 at 02:58:45AM +0100, Kiryl Shutsemau wrote:
> > From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> >
> > wait_for_scan() gives every case the same three seconds, whatever the huge
> > page costs to build.  collapse_full() asks for four of them: 8M at a 2M
> > PMD, but 2G at a 512M PMD -- arm64 with 64K base pages.
> >
> > Three seconds is thin at that size rather than generous.  Across 80 runs of
> > collapse_full() on arm64 with 64K pages the wait was half a second in 73 of
> > them, with a tail to two seconds.  The case has also timed out in a full
> > matrix run, reporting a failure for a collapse that was still going.
> >
> > Keep three seconds as the floor and add a second per 128M collapsed.  A 2M
> > PMD is unchanged.  A 512M PMD gets 19 seconds.
> 
> Yikes that does make this run really slow for 64 KiB page size machines and a
> key aim in the selftests is that they don't take too egregiously long to run.
> 
> Can this somehow be trimmed some other way?

It does not change how long the run takes.

The timeout is a ceiling on a poll loop, not a sleep: wait_for_scan()
breaks as soon as check_huge() sees the collapse, or as soon as
`full_scans` has advanced by two.

On arm64 with 64K pages the wait was half a second in 73 of 80 runs of
`collapse_full()`.  The 19 seconds is spent only when two khugepaged
passes have not completed in that time, which is the case this patch
exists to stop reporting as a failure. This can happen on very big
machines with high memory usage or in an emulator. I use QEMU TCG for
testing on ARM.

I will put that in the changelog for v5, with the before and after
runtime of the whole `./khugepaged` run.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
