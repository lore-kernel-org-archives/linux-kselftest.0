Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4190403B10;
	Fri, 10 Jul 2026 11:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783681291; cv=none; b=qmo6WtTBVztINTuU3tOD3mIJQDsUG1ehVXTazqspFqSbQqDQS+/rakQNfNJ3zXjLcxvmC6R2eCP0Sq5iISenN0enJTsdZC2fEp/5/5ogw27qcNpfPnO/2syhe5db1N/L5FiuVGO/C+cYxM3GhFW8vCd1OhTPM1r9Rrl6YcNwpLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783681291; c=relaxed/simple;
	bh=8xi/0lhPSxQTlfJQ4w5thzHX9bGE+TZ3W7tHjzlAHxw=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=LMRgD2uswc040/IeVhLE88eKu2a8p2V0F1QSDtlfxmOTUUihdQg6BnFL2SVjdZG87sG3E5Do7DW2LwCi3/+anfInFLbcBTuVo0Cr6fvnSyVJtH8iwnoSwzsLYWZE9cuYSr3xAQEPyhRedCDisZG6iW2QSaZP6+1wESyF2lDelZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mZFaJN/r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mZFaJN/r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B5DC1F000E9;
	Fri, 10 Jul 2026 11:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783681289;
	bh=u1in0J6DOoNo1KJyS0K46lG1NFXjsivGf2Yh7PbnBzU=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=mZFaJN/r2g8hweCNJ2/oa/yfwnFv5zbDApI8iMUpY+NUxNgiW/bsaO+kK+YQCW64z
	 PpaaHmSBJ3KX5fbgKV62ghk8ai+laPAHO70xaUO9vms4nDSieDvezlv/hcXvxFmtUX
	 Sb3mTwo8TGJ5qHoLpl6FwU+z8MBa07nPhprfiLUlUJp2c5+MwNCXkagCTBRcW/f2gE
	 qlbr9w7E/3nozUmz9Sq7E+/LnEUwKkvUZe8hrojnknH2jSFniKsuckcmkaLtWVIpXo
	 Bt6ScxK2RJiqXcPTJgjrwKzYWKNc3ve/vCBgit3SW+5V26w6V6c6AEJC0Jow8CE1hU
	 5Xw6vWJIEvOiA==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] selftests/mm: remove obsolete hugetlb vmemmap test
From: Lorenzo Stoakes <ljs@kernel.org>
To: Muchun Song <songmuchun@bytedance.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Shuah Khan <shuah@kernel.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, muchun.song@linux.dev
In-Reply-To: <20260710092427.3459121-1-songmuchun@bytedance.com>
References: <20260710092427.3459121-1-songmuchun@bytedance.com>
Date: Fri, 10 Jul 2026 12:01:09 +0100
Message-Id: <178368126920.320109.18235623374053703699.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1342; i=ljs@kernel.org;
 h=from:subject:message-id; bh=8xi/0lhPSxQTlfJQ4w5thzHX9bGE+TZ3W7tHjzlAHxw=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLICLvz6eM1gm4Vs6ZQVSXu3S3BeDt95g01jl8z0J7Fnb
 x+U+3dRoqOUhUGMi0FWTJHl+Rfx/UEiYfM6L/i7wcxhZQIZwsDFKQATubqG4Z/yr3V6yZrhaxQe
 KjvWhlz7efTn7OXXHH7GGakYnlMSPHSS4X/MBOO9t837V7KnFp64Lvf82uET7nzZkdw3uu3O3mp
 lb2UCAA==
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14

On Fri, 10 Jul 2026 17:24:27 +0800, Muchun Song <songmuchun@bytedance.com> wrote:
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
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>

LGTM, always happy to see red in the diffstat! And we definitely do not want a
test testing something that isn't real (...!).

>
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

It was here twice :) wow.

Reviewed-by: Lorenzo Stoakes <ljs@kernel.org>

-- 
Lorenzo Stoakes <ljs@kernel.org>
