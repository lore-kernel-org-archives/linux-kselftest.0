Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582623D45F7;
	Fri,  4 Sep 2026 08:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788510631; cv=none; b=Z9dogKX0luP51g8m0R1uvyVEpqDKvXgecz5sI8OXjpoHQOzLAQQcl+y67awn/edwTSwytP5rhpSLlP2bCCAJZRLdw+lb2VHazYHzqDoijB/IvkyId7gRFpM3DY1CBYGhoIJH+GYSYjEfUw7xZtQnjqZ2LpbLBKXNAsqUskm1RKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788510631; c=relaxed/simple;
	bh=+txI98bU7AZdaiB9Ur1ZPh7M8XhE0kJiLvXk4DRyEo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rBtPNz22JpgbYHpV28t+N6hKN+onD01qMY7mZWf1RKhEleclbAq3pg+ccFTcA1hROHYMd7gImTX8eYKFmiVOExu4Y9jOD8nZ13Dj1zYeeL2tf1eRMnCTS0RsA2H+j0Xb0HqDKj8Jt/9JgcMLdCVwJYQo2V04TPwfzA/w1Ge1Agc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CZqJMm1o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CZqJMm1o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 514681F00A3E;
	Fri,  4 Sep 2026 08:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788510630;
	bh=HCwmAHeu39K6xzdfz5VnsF0WOjtNpzC44nH7/8gOAy4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CZqJMm1ouNXl208Ft0fEiKxNfeGKvX/vYevqxvAjgt3mUsAZ4zWWoBKEtacdgNVu3
	 NdrOHI/Y0wj0v2Ky/CJtsjXKpIKZ97tpmngMWC7cMxUFniALxG1jJfft4N1rcKqni/
	 b7NxkjZVjN8OJsqWfTA5uPJ2K0frokB++G7PlG/GWxhj234dutpiPfJCbwwosOuKAD
	 3NDxzGcdT3YTgKPRwQGZ8cRLyFpJj6F9RPSgWzfvG51164YFMTEm6gBxQVibYZVFBe
	 jXY10+3ew/ThXJmthFtMLRRFJAHFPZURi3pBQuKzEr8ZMnpr0lVLV/iLUmEH39iMPO
	 1d2GzSKMmHT8w==
Date: Fri, 4 Sep 2026 11:30:23 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Song Hu <husong@kylinos.cn>, linux-mm@kvack.org, muchun.song@linux.dev,
	osalvador@suse.de, david@kernel.org, ljs@kernel.org,
	liam@infradead.org, vbabka@kernel.org, surenb@google.com,
	mhocko@suse.com, shuah@kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, Mina Almasry <almasrymina@google.com>
Subject: Re: [PATCH 2/2] selftests/mm: restore hidden hugetlb reservation
 scenarios
Message-ID: <apqBn7tWDHQeMrzB@kernel.org>
References: <20260714021630.1063823-1-husong@kylinos.cn>
 <20260901173748.fb7a442941102894a0c42baa@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901173748.fb7a442941102894a0c42baa@linux-foundation.org>

On Tue, Sep 01, 2026 at 05:37:48PM -0700, Andrew Morton wrote:
> On Tue, 14 Jul 2026 10:16:30 +0800 Song Hu <husong@kylinos.cn> wrote:
> 
> > A stray 'continue' in the main loop of charge_reserved_hugetlb.sh made
> > the "more than reservation", "more than cgroup limit", and "multiple
> > cgroups" scenarios unreachable, so they never ran.
> > 
> > Remove it so the first two run again.
> 
> OK.
> 
> > The third,
> > run_multiple_cgroup_test(), is separately broken -- a backslash
> > line-continuation breaks its local declarations and its hugetlb
> > reservation accounting does not charge as expected -- and has never run
> > in CI; skip it explicitly with a comment until fixed.
> 
> That's reasonable.  This code was added by Mina six years ago.  But
> he's still around so let's bug him with a cc ;)

And this code breaks our CI e.g:

https://github.com/linux-mm/linux-mm/actions/runs/33040981840/job/98414290236

> > Also correct two
> > `[[ "$method" == 2"" ]]` typos (harmless empty-string concatenation)
> > to plain `2`.
> 
> OK.
> 
> 
> 
> From: Song Hu <husong@kylinos.cn>
> Subject: selftests/mm: restore hidden hugetlb reservation scenarios
> Date: Tue, 14 Jul 2026 10:16:30 +0800
> 
> A stray 'continue' in the main loop of charge_reserved_hugetlb.sh made the
> "more than reservation", "more than cgroup limit", and "multiple cgroups"
> scenarios unreachable, so they never ran.
> 
> Remove it so the first two run again.  The third,
> run_multiple_cgroup_test(), is separately broken -- a backslash
> line-continuation breaks its local declarations and its hugetlb
> reservation accounting does not charge as expected -- and has never run in
> CI; skip it explicitly with a comment until fixed.  Also correct two `[[
> "$method" == 2"" ]]` typos (harmless empty-string concatenation) to plain
> `2`.
> 
> Link: https://lore.kernel.org/20260714021630.1063823-1-husong@kylinos.cn
> Signed-off-by: Song Hu <husong@kylinos.cn>
> Reviewed-by: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Liam R. Howlett <liam@infradead.org>
> Cc: Lorenzo Stoakes <ljs@kernel.org>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Muchun Song <muchun.song@linux.dev>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: Shuah Khan <shuah@kernel.org>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Vlastimil Babka <vbabka@kernel.org>
> Cc: Mina Almasry <almasrymina@google.com>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> ---
> 
>  tools/testing/selftests/mm/charge_reserved_hugetlb.sh |   14 +++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> --- a/tools/testing/selftests/mm/charge_reserved_hugetlb.sh~selftests-mm-restore-hidden-hugetlb-reservation-scenarios
> +++ a/tools/testing/selftests/mm/charge_reserved_hugetlb.sh
> @@ -439,11 +439,11 @@ for populate in "" "-o"; do
>          fi
>  
>          # Skip populated shmem tests. Doesn't seem to be supported.
> -        if [[ "$method" == 2"" ]] && [[ "$populate" == "-o" ]]; then
> +        if [[ "$method" == 2 ]] && [[ "$populate" == "-o" ]]; then
>            continue
>          fi
>  
> -        if [[ "$method" == 2"" ]] && [[ "$reserve" == "-n" ]]; then
> +        if [[ "$method" == 2 ]] && [[ "$reserve" == "-n" ]]; then
>            continue
>          fi
>  
> @@ -496,7 +496,6 @@ for populate in "" "-o"; do
>          echo 'PASS'
>  
>          cleanup
> -        continue
>          echo
>          echo
>          echo
> @@ -530,6 +529,15 @@ for populate in "" "-o"; do
>  
>          cleanup
>  
> +        # The "multiple cgroups" scenario (run_multiple_cgroup_test) is
> +        # multiply broken and has never run in CI: a backslash
> +        # line-continuation breaks its local declarations, it passes
> +        # reservation sizes in bytes rather than pages (unlike
> +        # run_test), and its assertions compare page counts to byte
> +        # values. Skip it until properly rewritten; the two scenarios
> +        # above are restored by this change.
> +        continue
> +
>          echo
>          echo
>          echo
> _
> 
> 

-- 
Sincerely yours,
Mike.
