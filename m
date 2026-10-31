Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793438424;
	b=iLbZObrh3nxMRzZ55GdbeYJaOJIOlkoZY4QtYKN4GZzN+04/gUfw6uQGavWVwKw+acJv
	 xBGnMK2t9Diso1y8Kxf1ikHNvS4FflWbq8Xqgk2blMn1uuk0S0d49FTkJm4pGH/Dn077W
	 uZK7y8XXHvFRot4s/KaDKoVPHxBGkyuKAK/JawApHPfEFAf2w1Eqbq9XSWmCldJq6pCBN
	 eGXxKfuQBrnoqDcgvd+G47fGyYtQgZ4upzAsj6GjGDY1O5DoBmyhFMu5xR0o+rGExCj6l
	 7y6sGEcbNwPdmvhd+SmlTkHdEZjf5JUeA4+0HzIwbWoXqv3OGwcyY51ZljEv7x9FGoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793438424;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=dLwZlfqngcUMXWHHM0GFPkimZNPQuLtLOOkOpLsUjjg=;
	b=aTIJoriWatyNpE7xzb55RXPYJkZvfFT0Dj/VwUIe6hJV8pbRhNc48XGtsPke5uNiLF8K
	 unKZ6/32S0/BwzOfXXsLhLHdXzmStN5IsssMlfBTr09sHQFuUelK6FUhzlp4MoIWew/sy
	 LuV+WwOK1OdgBOMAgX/cNhibvzsxlagqQwzvqLpIbZZRo05fPbtMYcqNqvOWhX1E9tfAi
	 Ng/re5PPwFh2D2NBVDC9Lp0mnbQAs1I5QkI1AeqchHyjrJsNCBKhxvSVCU8TNzE7befA+
	 N58t3Z+c9R9wRCmhYF+6IHsHH0RcNrCxPNkz6JeU5zrqcdf5ziV+zoEVHt1OUPnBXRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="VRaEF/4D";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C834B606A31A;
	Sat, 31 Oct 2026 09:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VRaEF/4D
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44E1A1F000C1;
	Sat, 31 Oct 2026 09:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793438423;
	bh=dLwZlfqngcUMXWHHM0GFPkimZNPQuLtLOOkOpLsUjjg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VRaEF/4DeMBVRS71BuPehLobGcZjQr4lbt3Eg5H3r0+MSS/zy7bVsOkDYlcOX2x8t
	 ef/45OQj6sN9w7U1GRdYDZPpCYIPwBvWc93HADX7RFUBJsbXgkUt7juyplVQnOTmge
	 t5bjZ0D9tQed9CbbBroLcc7+hGf2dtFjrjkFWbZTUM8rwn4Ndux5b/2VQa/X648bNV
	 V220Z2PhgazW5bp+GQrfoq3zNnJuN7bx69Ix4qS1/HWYSuKtMWCS4Z++lGdcN91Glx
	 39nz0LpcCAVE/g8qhcslvcIR4JDwOHgF+iZeF7vyQZrQzFidDp8WaoS64i33vvXsG2
	 m3cFWvjbE+6TA==
Date: Sat, 31 Oct 2026 11:20:14 +0200
From: Mike Rapoport <rppt@kernel.org>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Peter Xu <peterx@redhat.com>, Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>
Subject: Re: [PATCH 0/2] mm/userfaultfd: recheck WP registration in the
 hugetlb UFFDIO_COPY retry
Message-ID: <auWyzvThW5EAT_XQ@kernel.org>
References: <20261029221129.89068-1-azpijr@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029221129.89068-1-azpijr@gmail.com>

Hi Jose,

On Thu, Oct 29, 2026 at 11:11:00PM +0100, Jose A. Perez de Azpillaga wrote:
> The urgent fixes made hugetlb_fault() tolerate uffd bits left in VMAs
> that are no longer registered for them, and asked for follow-ups that
> remove the sources [1]. This is one: a hugetlb UFFDIO_COPY_MODE_WP copy
> that has to fault in its source page doesn't recheck the WP registration
> before retrying, so re-registering the range without WP in that window
> leaves a uffd-wp PTE behind.
> 
> Patch 1 adds the check the non-hugetlb retry already gets from
> mfill_get_vma(). Patch 2 adds a uffd-unit-tests case for it, which fails
> on hugetlb without patch 1.
> 
> Question:
> 
> - The non-hugetlb retry compares the whole mfill_retry_state. hugetlb
>   copies into a freshly allocated folio, so only WP seemed to matter
>   there. Mike, would you rather have the full comparison on both paths?

Let's keep things simple and easily backportable :)

Since hugetlb does not leave a folio from the original VMA behind there's
no inconsistency we need to worry about.
 
> The other source 6/10 of [1] mentions, UFFDIO_COPY in MODE_WP racing
> with UFFDIO_UNREGISTER [2], is closed by "mm/userfaultfd: write-lock the
> VMA before waking waiters when unregistering" [3].
> 
> Based on mm-unstable.
> 
> Tested on x86_64 in QEMU.
> 
> [1] https://lore.kernel.org/20261015-urgent_fixes-v1-0-42796911043b@kernel.org
> [2] https://lore.kernel.org/20261015-urgent_fixes-v1-6-42796911043b@kernel.org
> [3] https://lore.kernel.org/20261027-fixes_core-v1-23-6f74bec9a5bb@kernel.org (v1, now 23/47 in v2)
> 
> Jose A. Perez de Azpillaga (2):
>   mm/userfaultfd: recheck WP registration in the hugetlb UFFDIO_COPY
>     retry
>   selftests/mm: add a uffd test for re-registering during UFFDIO_COPY
> 
>  mm/userfaultfd.c                             |   4 +
>  tools/testing/selftests/mm/uffd-unit-tests.c | 105 +++++++++++++++++++
>  2 files changed, 109 insertions(+)
> 
> 
> base-commit: 24d45a1475dd4c671feb1df705f67ef2fc293969
> -- 
> 2.55.0
> 

-- 
Sincerely yours,
Mike.
