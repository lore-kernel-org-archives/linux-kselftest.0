Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284292DF707;
	Fri, 27 Mar 2026 11:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774610050; cv=none; b=EJ8gpUOUVwUzhKMjwKunPR9V8x4dwcYsWVzvHgxG5gD7K66B2L//3k4HbY+h7nzf7foeF0bGQIid0yK9ecrgWyZO7fO1sHoTpx/H2eJ94/ZqzOdJRN8Q3kTPtVjTK203jrf2mVOWluSiXrcg4g03RlBzC86Tctx7LjDnBat4fSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774610050; c=relaxed/simple;
	bh=jELwswd/uYPzAV137eapCnhCT1uBdil42D5dYvNpMG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GpxRwRcLX+/9MICX2BQeybXjWZmiDnyXNCKjWcpzoQao+14pnskCGsaKnwELvyzPqym9Va7/0X3t9iKNh81RoCU312az2pLgzcn/xy1Uea3/Ku2JYfp9MSFIyGnauAJ9BPbPFvw/xRAhNMuva4P516i5kjh1lIdmlOH9vZ5ISjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QRn6p8Fo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QRn6p8Fo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFB01C19423;
	Fri, 27 Mar 2026 11:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774610049;
	bh=jELwswd/uYPzAV137eapCnhCT1uBdil42D5dYvNpMG4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QRn6p8FomfT9UzD59UdjGNoxWNuzRXV7BnOv2YdTuU+sGkaCWNeVMS+suez3EXmrm
	 oZOGH8VuEtYcUQn7BfGZLC6ffTuFe7Uq+MaDCx4Jhv2oeO0p1M2jUN4RNepaRZDSZB
	 kxM+uERaI26l9aMvrAlxYFhikfghtZRmmiV5uNoAqyEQq8VTGjs9L4EqI50lRcjyuf
	 pr/Qdwbp0ld6W7Vvn0mhR7H+G8HBsgp6gLjqvOXJj3QV7TapWUAmpGdlLys1nT8Kb9
	 OkL4lGiC5KdRKYX7iHv4AxLuVxxQNtdTZTgZghQo0/q6dVw2efMzOVS+JnFMO2yQ/S
	 mbRmcrthcrcMQ==
Date: Fri, 27 Mar 2026 11:14:04 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: akpm@linux-foundation.org
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, 
	Audra Mitchell <audra@redhat.com>, linux-kselftest@vger.kernel.org, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, shuah@kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: Fix soft-dirty kselftest supported check
Message-ID: <f00dce3f-d6dd-477e-bac5-b9b8253b03ba@lucifer.local>
References: <20260218184210.206466-1-audra@redhat.com>
 <c1b6f8eb-602b-4306-ad60-7a181fd94a45@kernel.org>
 <abludfGu4upPcyRI@fedora>
 <f635585f-7488-4bfe-8566-1c19f493c6a3@kernel.org>
 <815b2fc9-cee7-4bfa-8036-4b93d1b47b4e@lucifer.local>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <815b2fc9-cee7-4bfa-8036-4b93d1b47b4e@lucifer.local>

On Fri, Mar 27, 2026 at 10:52:24AM +0000, Lorenzo Stoakes (Oracle) wrote:
> OK again I'm starting to think we just shouldn't support fix-patches at all any
> more.
>
> This is an example  of a change being done in a fix-patch that's _really_
> causing issues.

I didn't see there was a v2 in-reply-to here sorry.

So in this case less fix patch more:

1. We shouldn't automatically take stuff to mm-unstable until it's settled

2. We should have clear separate branches for stuff-for-7.1 and stuff-for-7.2

3. We should build test stuff (!)

4. We should root cause the source of problems and update the thing that cause.

Part of the problem here is that mm-unstable is a totally unreliable base. Not
as bad as mm-new, but it's forgiveable that Audra didn't see Chris Down's patch
there because who knows when that went in etc.

if we had a for-7.1 git branch that only got stuff that had settled we'd not
have this issue.

And we could have a for-7.2 git branch for stuff that's arrived late.

We could have:

mm-untested (was mm-new)
mm-under-review (was mm-unstable) -> THIS doesn't go to -next
mm-for-7.1 (was mm-stable)        -> THIS goes to -next
mm-for-7.2 (fresh and new!)       -> THIS only goes to -next next cycle

And workflow could be:

-> patch comes in
go straight to mm-untested - we are undiscerning
[ make sure series gets build tested + self tests + etc ]
goes to mm-under-review
WEEKLY:
Stuff that has sub-M signoff and seen no further issues -> for-7.1 (i.e. next release)
if it's <= rc4 and no other reasons to hold off

OR for stuff that doesn't fit the rc4/no other reason criteria
-> for-7.2 if signoff and no issues

If things get reviewed and respun

-> back to mm-untested until tests pass no matter tags
-> (if stable) can jump right to for-7.1/for-7.2 if signed off already. if not then mm-under-review

This way we reduce chance of late yank, give reasonable rebase target of
for-[release you are interested in], documents and simplifies the process.

Thoughts?...

Cheers, Lorenzo
