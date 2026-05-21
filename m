Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAC5349CC4;
	Thu, 21 May 2026 23:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779406391; cv=none; b=f2MXVDI/KGiZ7SvWSAaXk5x8BzNt+yQIKX6/wCcJ2WIhMqXj2227loNuO6VEFsDRSf2vP7b2EQPQCVdOnxA8jE8xoGFtXMwk+p0S6blDsFqzdVYfadHTs4OWj4jbnWNwBE52du5Dl6fdLQs/E0d34CbzeyyTCCi4jNQkgnJvlL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779406391; c=relaxed/simple;
	bh=xK2Ha68L1jsnnLSw3fkGFBma6xiILZJezBM+pkrvLHc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=o6CowfOlV4E3Hk2rWmJpNXLJmW5ztvoPM/LfGSq8Ew2JQBs/ZzYfn8c/FdQQrfMIXmOyN1vXNVWC2sU3+BEItOZJVljh+6jEBpFg/rJU3SOaYdupm2zs0u9MRjU0aa+yEAC6n7lUO7LWLW+zq9zBAzC4mTSVIoKqcWp8xSOffUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=B5hOJ1El; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="B5hOJ1El"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 738DB1F000E9;
	Thu, 21 May 2026 23:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1779406390;
	bh=AivDyEnvpyPmjIUTAgHTmNXJVE2IywT0hdhO6rhqLEk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=B5hOJ1ElllrFrloQ/p0k7RDgdXQc1ysB0bGPCNT9A7VTOG8AvvaU2KUKcZ1blYarq
	 4KnL0AIvmVxxhgHg9boc5OBOlAz8JjPaGwh4C90y1ab1EnEwd+5W/ekV0Cu/NiuLMh
	 3UQ8B7bK/3I4KDPEjTx0H4U1zc6pyHYVFUXC1d/Y=
Date: Thu, 21 May 2026 16:33:09 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Stanislav Kinsburskii <skinsburskii@gmail.com>
Cc: Liam.Howlett@oracle.com, david@kernel.org, jgg@ziepe.ca, corbet@lwn.net,
 leon@kernel.org, ljs@kernel.org, mhocko@suse.com, rppt@kernel.org,
 shuah@kernel.org, skhan@linuxfoundation.org, surenb@google.com,
 vbabka@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v3 0/3] mm/hmm: Add mmap lock-drop support for
 userfaultfd-backed mappings
Message-Id: <20260521163309.c5cc5d3f6cf16bac212cf90b@linux-foundation.org>
In-Reply-To: <177928604779.589431.14703161356676674288.stgit@skinsburskii>
References: <177928604779.589431.14703161356676674288.stgit@skinsburskii>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, 20 May 2026 07:09:19 -0700 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:

> This series extends the HMM framework to support userfaultfd-backed memory
> by allowing the mmap read lock to be dropped during hmm_range_fault().
> 
> Some page fault handlers — most notably userfaultfd — require the mmap lock
> to be released so that userspace can resolve the fault. The current HMM
> interface never sets FAULT_FLAG_ALLOW_RETRY, making it impossible to fault
> in pages from userfaultfd-registered regions.
> 
> This series follows the established int *locked pattern from
> get_user_pages_remote() in mm/gup.c. A new entry point,
> hmm_range_fault_unlockable(), accepts an int *locked parameter. When the
> mmap lock is dropped during fault resolution (VM_FAULT_RETRY or
> VM_FAULT_COMPLETED), the function returns 0 with *locked = 0, signalling
> the caller to restart its walk. The existing hmm_range_fault() is
> refactored into a thin wrapper that passes NULL, preserving current
> behavior for all existing callers.
> 
> Faulting hugetlb pages on the unlockable path is not supported because
> walk_hugetlb_range() unconditionally holds and releases
> hugetlb_vma_lock_read across the callback; if the mmap lock is dropped
> inside the callback, the VMA may be freed before the walk framework's
> unlock. Hugetlb pages already present in page tables are handled normally.
> Possible approaches to lift this limitation are documented in
> Documentation/mm/hmm.rst.

Thanks.  AI review identified one possible issue, possibly a duplicate
from the v2 series?

	https://sashiko.dev/#/patchset/177928604779.589431.14703161356676674288.stgit@skinsburskii

I'll take no action at this stage, shall await reviewer input.  Please
poke me in a week or so if nothing has happened.

Which is quite possible - things seem rather hectic at this time and
we're almost at -rc5!
