Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B001F3E6392;
	Tue, 29 Sep 2026 08:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790671013; cv=none; b=A2dILiokWnV4HcYX9gT9MZmS7W91pz3Yx42yhbp+sTsFj4n1tk9t7i62X/MhtITixZ5vajKLQncdZlNT+abpDZ/rN1WkO/Dt3Ps3Y+vZKOCemb2qfSrs/ylK8unnIWuAG1gSiVX651Xy2wHjLyO6hicXpIyrIyh+75OxcbBEAI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790671013; c=relaxed/simple;
	bh=d9zFpHqoZ0BWBxAoNBnLnApyzVmHDwEFjPEsjYrnQ2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UuXaSRhrNdLzL3PYb07R1n4HfYssa8yfLzk/ngdOC9RwxSDLlL3/oCuL12ULIP6xi20xl9NzbbJBlA5qoRnqnjRaOHnCViqvZ1uWEaml5vMhN3cRAynFr7ol86ViHQpy5K5MXOEdl61XoD7eRskNgbNokzBOY2zIn9nKOyTZ8Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dtaQjHCo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dtaQjHCo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 157F11F000FF;
	Tue, 29 Sep 2026 08:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790671012;
	bh=Rs1CkTi+9r9PKxnWBlU9VchKWdbkwnHkDzwKExg5G04=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dtaQjHCoL6wBCn3MwhzhQH0mBfkWaEv+gB3h/hMz8cLIo5a/sS9dmEGaW6dVX3vtf
	 D3KntZXSQ5UXPp9KoW/6dhulUn1hkeEekIITvia14D7NYUWPojxwHixV7cd+dAKfjT
	 1mcJqJG8N2mvNFN3VZc8U8IZkpL3e4oLxreL4Xlhws5tB1oGrzbGv98KMAWiYzFo2l
	 /TocQ0CXgEfBi4/rPYp8roSSYHRd9V/BzHuKOp0CJ6wfGbelpPlq+WqOf9QD/ywKIs
	 jqocYNSTAx1f+W+KqvdF+15rJX6M4P/swKM8sb4JIiqiqL6z7g3oAE7ArS/7Zq8NcI
	 seoj9aWR+ESVg==
Date: Tue, 29 Sep 2026 09:36:45 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Sarthak Sharma <sarthak.sharma@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, "Liam R . Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	John Hubbard <jhubbard@nvidia.com>, Kalesh Singh <kaleshsingh@google.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Park Tae-sun <ts930@dgu.ac.kr>, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 0/9] selftests/mm: improve mremap_test
Message-ID: <art4dfRkyu5OCwvd@gremlin>
References: <20260924050009.19974-1-sarthak.sharma@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924050009.19974-1-sarthak.sharma@arm.com>

On Thu, Sep 24, 2026 at 10:30:00AM +0530, Sarthak Sharma wrote:
> This series fixes several correctness issues in mremap_test and
> simplifies and strengthens its data validation.
>
> Patch 1 converts the mremap_test to use kselftest helpers, removes
> manual tracking of failed tests and corrects some spelling errors.
>
> Patches 2 to 5 fix userfaultfd skipping, unexpected mremap success
> handling, multi-VMA data validation and failure reporting when data
> corruption is detected.
>
> Patch 6 removes the randomization and uses a simple pattern based approach.
>
> Patch 7 removes perf tests and timing infrastructure.
>
> Patch 8 removes validation threshold and always validates complete mappings.
>
> Patch 9 strengthens the multi VMA validation by also checking the
> mapping state of holes after remapping.

Even if I don't get a chance to look through this, just want to say thanks for
taking a look at this! The mremap tests have always been hairy, when I added
extra tests there I didn't love what I saw so it's great to see it get some
attention! :)

>
> ---
> Sarthak Sharma (9):
>   selftests/mm: mremap_test: use kselftest helpers
>   selftests/mm: mremap_test: skip test when userfaultfd is unavailable
>   selftests/mm: mremap_test: fail unexpected mremap successes
>   selftests/mm: mremap_test: correct multiple VMA range size
>   selftests/mm: mremap_test: fail on data corruption
>   selftests/mm: mremap_test: replace random data with deterministic
>     pattern
>   selftests/mm: mremap_test: remove perf tests and timing
>   selftests/mm: mremap_test: remove validation threshold
>   selftests/mm: mremap_test: strengthen multi VMA validation
>
>  tools/testing/selftests/mm/mremap_test.c | 600 +++++++++--------------
>  1 file changed, 220 insertions(+), 380 deletions(-)
>
> --
> 2.53.0
>

--
Cheers, Lorenzo
