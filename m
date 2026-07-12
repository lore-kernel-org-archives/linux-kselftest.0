Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402A1373BE4;
	Sun, 12 Jul 2026 07:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783840353; cv=none; b=fWj0Og0BYd/Hi068nBne1edfQ82vcLzlQD4gOcEed23hVPRuT8rJo9EMVUXmqKBscc8As+koZDJku/2W9COJQPcsb6AMcRIHCvSf2J1kQR7PuqIl2mKb8kaGJxVzoMWQSLOiPOUZHhxg+rGpATX3yCIdpAwYeeRusE9HrjSKw3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783840353; c=relaxed/simple;
	bh=co9Sb5QxtNPAwXjEDe/Y7fKs3jpA+dxwar7P3/WJCyI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=YtyRpekPFmaTsFw6khnP/P0DlURMoyoZFENaaUKO7I5Xj4WopMaPliCbQLnU7Ls23axsivDkZZMqCWJI84aHefjax+DyJO4GYLnZFVYn4qjSerSKvBBIQoz9kr8cPOd5MbQ+0ZtcSfb6ujovdmt38Rq/5+Mvqij5Fd3btpARTz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=En5tPSqw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="En5tPSqw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A7FC1F000E9;
	Sun, 12 Jul 2026 07:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1783840351;
	bh=Tpvt6EUERrPYZS7ccCTbDt56ATJBy7ak6+GhKYojzk8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=En5tPSqw1Mre1BipmFeL1T0ps63smtlA2dNlL24BxEx+sWM2i/t5uRUJRbvS3ZUZG
	 PPe0HZC38SnbxTFwsR8Fh+IiBOxH0MeV2SoSpL0n9nCdU+KTRiGXJ9IAXb3xUQoxQU
	 TyqI9pwTlStRkhdoKw1kuBcAmecaRjITTXftzwN8=
Date: Sun, 12 Jul 2026 00:12:30 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Muchun Song <songmuchun@bytedance.com>
Cc: David Hildenbrand <david@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren
 Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, muchun.song@linux.dev
Subject: Re: [PATCH] selftests/mm: remove obsolete hugetlb vmemmap test
Message-Id: <20260712001230.5c3491ee33460c98bef8c22a@linux-foundation.org>
In-Reply-To: <20260710092427.3459121-1-songmuchun@bytedance.com>
References: <20260710092427.3459121-1-songmuchun@bytedance.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

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
> 
> ...
>
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

We should leave these .gitignore entries in place.  Please see
https://lore.kernel.org/CAHk-=wiHK5_oBUdUiNAaevmN9f-ORe+QBqbRefAZaw-RbgEn3w@mail.gmail.com

I'll queue a -fix for this.


