Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0083C873B
	for <linux-kselftest@vger.kernel.org>; Tue, 14 Apr 2026 09:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776160037; cv=none; b=c3fIQeuo3R6SwEhV0rjv3FiCe18PchjNC8Uoe8fisHT7WX16f5w9FYXVFGTH0/FIbNoDYZtn7tZ+2KPOBqc6sZBjiBvyJL2XKOj/5vFZBfMpO4yWQEqsU3mnyvXA4kgOtRdno/ZqWMvandmcbM66UK5xB6ha+nOMFaLGGzmPKQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776160037; c=relaxed/simple;
	bh=3nLNLQY/FGetYY0hQ2Ckpl5LT5IYhZTMc+wZFqrFgZc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KXs/b+RWQqJQ3wt8I1bh+/v87hzL5p88YjkW1LCd7RQuD0LNR4re3ezEAgRUp6hyyIGBwscI0qB9AHvuBKA0ym6VNt38kYX/i8LqdkCBOtJ01PBiBK/ZVOSQB6vuGkDoy3KD51jYTaBin22sn4qVHElBxeQa9UMuyIlCUaWDICk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XYLfwE7v; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XYLfwE7v"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43cfac48bc7so3680633f8f.0
        for <linux-kselftest@vger.kernel.org>; Tue, 14 Apr 2026 02:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776160034; x=1776764834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+4CBGPNUZVh6VtntpItYJ/x6BwDqFr0ckEOccx/tIqk=;
        b=XYLfwE7vy6Pd+cXHpJvRdGGj3K2f/wQfXNhbtucXwdvYBQNNhJL5wnoS40Pf8WsvZc
         UDAGZUoi75vtCypuwrBZq51lMDOth6CrPSWxL2ojlF7cia0v1DmuF+ToKnIotyrTuMjP
         NdE70fNmNckkKxGLI0yyc1X0HeSlCINwn0namkt8YWOXapXkJT2Jto1Jc/P/QKDDwNTq
         FVQtdlTpWwdqs6A0ZSNJQzZCPEJtMgMcfXEFBVx2qfnQsv46pbdzpUZcU6QNSR94VFSd
         46oYxCTXc7RyxZ5brockNG8mtyJ4IWm65svPCq/dgD7JB6Y0r9VTNoDunU1/8oodLCA8
         ztoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776160034; x=1776764834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+4CBGPNUZVh6VtntpItYJ/x6BwDqFr0ckEOccx/tIqk=;
        b=Fs6UJdA4rbzD09fZNJN3UW8YemCjbcDaBZXmNj4q57bZppIaCUtsjLJDSChu3GwPEi
         7PP8snjske8qwxei2eiZEHeeQQHCkK7l9XYFCCDnn6OPJGUecavMYh1LtJXPTaXJLuX4
         5xZtVicIWmcokKVToetApwHCnz/sXPcqT7toapQIQBfka7iN8SScXy6LIimK9P1TQdE5
         dHrt2zEen8MaIU9ovDM4qLoy3XtgYmznXLV/kyRqsmsTda2RdqOrO86fI/DCnmQpZzdZ
         nIZZ+qh90KFr/5WBBRYFXhHnfjWOudKMo4UDLnBsZbiXEil7DUNhxIs+TzON3rkByfcq
         aX0A==
X-Forwarded-Encrypted: i=1; AFNElJ9mr9vkevln0MM+tLBAqxQ6QlF2DG2H0DonVnY6LGf/6SqtJeLhuj80Pk5Ro0iSoP6cPiYzWeCAfkAuvuogitY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdo3viRDIV6exYrU6LDQ3yLQl5PRrrghPPEJLJ4C9eTmgrUmRx
	7fXrvXmU9g8+/1oNysa71BQl/q24xYFUerJte/ideHIxVYfQq5okYDo1
X-Gm-Gg: AeBDievkU8tTtVB1KCnquSNCBsVaJkxEz+RBihcxl3B6CTMeR2dU1OM/VOcDBHajSno
	bBHs7zKYN1+f7+IDWhf9QD8gAgRnwIpX1hnEhT1G38xusofApGYNiQZvxhKOkOjc3OGyFn8nYlR
	yosrr2njKsK5AhUeY0LN1PfOjvDNG1fkvggxLtUFOx7gKllCXN9JTuRbEpyu3oSuZ/OdkODKJuc
	pT9u7nlXo6LxRzkomWt26v/aBk3alEQ0PCb3aYfTdYn8fLhR1rtBPE4FLghGZDkVBFgMkuvfjan
	L/axPXuwvEgRfcTd7WtOtJFjiAd1aI9bHQDFtq+7tfivaVHxRt7ST9dG9+s1AbQt9vZReBSBtnr
	hU+C7SHv2pcjZO7FMzMCUuFMz+jlpRKo4nGTVzLQAVyQkrcCBxT2BSs+6nWSkm70MSnrhlGEY6c
	73mFW4wvAWCqasc05rGV1fkE5BMpz0FLLXdteRzpHxOOG6vbWhjwYS2mVBUz+O+fUs
X-Received: by 2002:a05:6000:268a:b0:43d:7403:4b60 with SMTP id ffacd0b85a97d-43d74034c72mr14460452f8f.3.1776160034363;
        Tue, 14 Apr 2026 02:47:14 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63de2e4csm40900179f8f.2.2026.04.14.02.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 02:47:14 -0700 (PDT)
Date: Tue, 14 Apr 2026 10:47:12 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org,
 shuah@kernel.org, ljs@kernel.org, Liam.Howlett@oracle.com,
 vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, ryan.roberts@arm.com,
 anshuman.khandual@arm.com, Sarthak Sharma <sarthak.sharma@arm.com>
Subject: Re: [PATCH] selftests/mm: Simplify byte pattern checking in
 mremap_test
Message-ID: <20260414104712.2b634741@pumpkin>
In-Reply-To: <134c372e-5c9e-493d-b954-d9954546beaf@kernel.org>
References: <20260410143031.148173-1-dev.jain@arm.com>
	<5297e0da-d8ec-49df-9b32-0d9f907588d6@kernel.org>
	<8b5544eb-5ec0-4c85-a2da-7a454fa606dc@arm.com>
	<134c372e-5c9e-493d-b954-d9954546beaf@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 14 Apr 2026 10:01:57 +0200
"David Hildenbrand (Arm)" <david@kernel.org> wrote:

> On 4/14/26 07:09, Dev Jain wrote:
> > 
> > 
> > On 14/04/26 12:57 am, David Hildenbrand (Arm) wrote:  
> >> On 4/10/26 16:30, Dev Jain wrote:  
> >>> The original version of mremap_test (7df666253f26: "kselftests: vm: add
> >>> mremap tests") validated remapped contents byte-by-byte and printed a
> >>> mismatch index in case the bytes streams are not equal. That made
> >>> validation expensive in both cases: for "no mismatch" (the common case when
> >>> mremap is not buggy), it still walked all bytes in C; for "mismatch", it
> >>> broke out of the loop after printing the mismatch index.
> >>>
> >>> Later, my commit 7033c6cc9620 ("selftests/mm: mremap_test: optimize
> >>> execution time from minutes to seconds using chunkwise memcmp") tried to
> >>> optimize both cases by using chunk-wise memcmp() and only scanning bytes
> >>> within a range which has been determined by memcmp as mismatching.
> >>>
> >>> But get_sqrt() in that commit is buggy: `high = mid - 1` is applied
> >>> unconditionally. This makes the speed of checking the mismatch index
> >>> suboptimal.  
> >>
> >> So is that the only problem with 7033c6cc9620: the speed?  
> > 
> > Yes.
> > 
> > I'll explain the algorithm in 7033c6cc9620.
> > 
> > The problem statement is: given two buffers of equal length n, find the
> > first mismatch index.
> > 
> > Algorithm: Divide the buffers into sqrt(n) chunks. Do a memcmp() over
> > each chunk. If all of them succeed, the buffers are equal, giving the
> > result in O(sqrt(n)) * t, where t = time taken by memcmp().
> > 
> > Otherwise, worst case is that we find the mismatch in the last chunk.
> > Now brute-force iterate this chunk to find the mismatch. Since chunk
> > size is sqrt(n), complexity is again
> > sqrt(n) * t + sqrt(n) = O(sqrt(n)) * t.
> > 
> > So if get_sqrt() computes a wrong square root, we lose this time
> > complexity.  
> 
> Ah, thanks for clarifying.
> 
> > 
> > Maybe there is an optimal value of x = #number of chunks of the buffer,
> > which may not be sqrt(n).
> > 
> > But given the information we have, a CS course on algorithms will
> > say this is one of the optimal ways to do it.
> >   
> >>  
> >>>
> >>> The mismatch index does not provide useful debugging value here: if
> >>> validation fails, we know mremap behavior is wrong, and the specific byte
> >>> offset does not make root-causing easier.  
> >>
> >> Fully agreed.
> >>  
> >>>
> >>> So instead of fixing get_sqrt(), bite the bullet, drop mismatch index
> >>> scanning and just compare the two byte streams with memcmp().  
> >>
> >> How does this affect the execution time of the test?  
> > 
> > I just checked with ./mremap_test -t 0, the variance is very high on my
> > system.
> > 
> > In the common case of the test passing:
> > 
> > before patch, there are multiple sub-length calls to memcmp.
> > after patch, there is a single full-length call to memcmp.
> > 
> > So the time should reduce but may not be very distinguishable.  
> 
> Okay, so doesn't matter. I agree that we should simplify all that.
> 
> The exact index is irrelevant. Whoever wants to debug the test failure
> could modify the test to find that out. It's one of the tests we don't
> really expect to fail (often).
> 
> >   
> >>  
> >>>
> >>> Reported-by: Sarthak Sharma <sarthak.sharma@arm.com>
> >>> Signed-off-by: Dev Jain <dev.jain@arm.com>  
> >>
> >> Fixes: 7033c6cc9620 ("selftests/mm: mremap_test: optimize execution time
> >> from minutes to seconds using chunkwise memcmp")
> >>
> >> ?  
> > 
> > Not needed. 7033c6cc9620 does not create any incorrectness in the checking
> > of mismatch index.  
> 
> Yes, agreed.
> 
> 
> I would suggest to rewrite/simplify/clarify the patch description, not
> talking about "buggy" etc, focusing on the simplification.
> 
> "
> The original version of mremap_test (7df666253f26: "kselftests: vm: add
> mremap tests") validated remapped contents byte-by-byte and printed a
> mismatch index in case the bytes streams didn't match. That was rather
> inefficient, especially also if the test passed.
> 
> Later, commit 7033c6cc9620 ("selftests/mm: mremap_test: optimize
> execution time from minutes to seconds using chunkwise memcmp") used
> memcmp() on bigger chunks, to fallback to byte-wise scanning to detect
> the problematic index only if it discovered a problem.
> 
> However, the implementation is overly complicated (e.g., get_sqrt() is
> currently not optimal) and we don't really have to report the exact
> index: whoever debugs the failing test can figure that out.
> 
> Let's simplify by just comparing both byte streams with memcmp() and not
> detecting the exact failed index.
> "

ISTM that if you get a failure it doesn't really matter how long a
second scan takes.
So a simple byte loop that reports the offset and data of the first
error and counts the number of errors is more than enough.

	David


