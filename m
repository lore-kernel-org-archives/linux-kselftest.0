Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4698125A0;
	Sat, 11 Jul 2026 00:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783729947; cv=none; b=WSDl5fXrnbdnU0p6+7KMJmbn8n4PEinGsjHzoStxj2U1QloT2X8lQ3Dwif1znbvwrFpyVyiO8s99sQgO7sj5AYJQo6/IWxXlp4E5whH9zTrqSzK6hVE27CMYa7XREFLVk+C0Y3MGpHKBvhGgxIuyBVC0UmtSbG8MHr/twePGeWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783729947; c=relaxed/simple;
	bh=txoD/LR5g1Z6qIOvLXdrGX/lpEywWtb/N64E0mokMqg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T6ddkedQCChc4Q7DDMek/pXJD2WiodHeWKX5l5gPzML/qT+EI68mTZzd3MNnVKM8WaupDNOQX5UaIdDswaRG4o+T40zTvnzbzPEbVcmSNwbmKXzIRo4dUiTU7RNPoESOebC25MgnnzfAOGFApn8Kble5Rzm5T9uT3QOz28zuTTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fbpGi1y9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fbpGi1y9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA2AA1F000E9;
	Sat, 11 Jul 2026 00:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783729945;
	bh=O94T837359p5/1+I5KrV7oXNHB34fvrkADLpD0vBISo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fbpGi1y9TAMeC8S1d+Mt8Ak4Q9UfxJ3DzSFKxt7fP6P6JdoUOCm2TV6KIhs9FczX7
	 dctEH2co+Y/neXeCeUx5sOvnF1JEkDb2IXIsn6YNi+ZzH8Sal3vLTeHt9B8H1R4TqP
	 hoykd/sktfwieRnftMgVsvY8marBmlcb5sC8AMd8wUsBH7y0JvSRir/kjc4NDpBnYK
	 ErrsXoGS+z4zeIwsomsxGxyfbsTo/L189C8UbFNu8a3Zoex5/6g27Uz5Nom39hApTv
	 kUBmo1i55K9g0hS8/oe8aHEWRhiztsJavFzCsRXrhVue9celdaRonrOaMNi/Zwzdam
	 REZpW/zAFMskg==
From: SJ Park <sj@kernel.org>
To: Muchun Song <songmuchun@bytedance.com>
Cc: SJ Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	muchun.song@linux.dev
Subject: Re: [PATCH] selftests/mm: remove obsolete hugetlb vmemmap test
Date: Fri, 10 Jul 2026 17:32:14 -0700
Message-ID: <20260711003215.32222-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260710092427.3459121-1-songmuchun@bytedance.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 10 Jul 2026 17:24:27 +0800 Muchun Song <songmuchun@bytedance.com> wrote:

> The hugetlb vmemmap selftest was added to check the old HVO
> layout where tail vmemmap pages reused the head page.  That
> assumption no longer matches the current HVO mapping layout.
> 
> HVO now keeps a private backing page for the head vmemmap page
> and remaps redundant tail vmemmap pages to a shared read-only
> backing page.  The old page flag check is therefore testing an
> obsolete implementation detail rather than the current ABI or
> behavior.
> 
> Remove the stale test and its build, run, and ignore entries.

Nice!

> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>

Reviewed-by: SJ Park <sj@kernel.org>

> ---
>  tools/testing/selftests/mm/.gitignore        |   2 -
>  tools/testing/selftests/mm/Makefile          |   1 -
>  tools/testing/selftests/mm/hugetlb-vmemmap.c | 132 -------------------
>  tools/testing/selftests/mm/run_vmtests.sh    |   1 -
>  4 files changed, 136 deletions(-)
>  delete mode 100644 tools/testing/selftests/mm/hugetlb-vmemmap.c
> 
> diff --git a/tools/testing/selftests/mm/.gitignore b/tools/testing/selftests/mm/.gitignore
> index 9ccd9e1447e6..227476d8ff1f 100644
> --- a/tools/testing/selftests/mm/.gitignore
> +++ b/tools/testing/selftests/mm/.gitignore
> @@ -3,11 +3,9 @@ cow
>  hugepage-mmap
>  hugepage-mremap
>  hugepage-shm
> -hugepage-vmemmap
>  hugetlb-mmap
>  hugetlb-mremap
>  hugetlb-shm
> -hugetlb-vmemmap
>  hugetlb-madvise
>  hugetlb-read-hwpoison
>  hugetlb-soft-offline

I remember Linus argued [1] we shouldn't remove names from giignore.  I don't
really care, so feel free to add my R-b: tag.  I just wanted to call out,
though.

[1] https://lore.kernel.org/all/CAHk-=whVY4mq1Fd=Vhwy0dK8fR5cOLkiy1OZMG4QyEMaGEd9ZQ@mail.gmail.com/


Thanks,
SJ

[...]
