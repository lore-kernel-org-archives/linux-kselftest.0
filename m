Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC653CF690;
	Mon,  3 Aug 2026 11:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785755118; cv=none; b=bnapHFI8Q9dH+sne0YQDdkYsBeRnNR7b15Ezs00oPUb/y2Ebri2BYMsR1SH2YZw1o7d/IYE3KmFAvQujMjfyZVV5wdp6FqpJZF1mbFzi3jKPK1bIXFEZ2oGaeTEeilGpKSL7P44vie3A7WMiUr0b0v8y0PliBiLciLmYSwZLcWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785755118; c=relaxed/simple;
	bh=lN5LqEf+uk1T6xWt+bHisxvHkurO9fRBbhlgza4HvUQ=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=mPfadbk1GNeKxjsc/NcR5ToLHCp3dNYsYhutK4apXdR4z0PF+35l5MJJnt+3J/cQjQlrqplzjSf8QQCTk/sivjUyfGqNp7uVq5RObZLhoRmwi35EClbs5PBX9snBJ5RCUWrcm8G0GfuJg9C12Ri3gAS8KCRxEX+oUmJVUgqPyGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h/CyDoWr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h/CyDoWr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B27561F000E9;
	Mon,  3 Aug 2026 11:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785755110;
	bh=tyP/Cdwf4PniO7raZAb+hbrsr712JwUYvH/yZlove1k=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=h/CyDoWr+dqXY2I6lkcbByCEhr+WWS3aEVMplzESHyFZDSujqYfL+SNEJRaITcaE5
	 X8OAw9vMFYO1XihYjXEdk/Nle+d9vshPp8vi7STfMfohs3cHZlvAUEKm4mK9qz4WzS
	 CVAOWOdLzUXuNRkFxnZ5yyKQ2ypbchzsqGlcTD1oiQao3Je2OE9uVvjpRLrvpEuFrf
	 CCVPqeadOcb8WpsupcFyUgHXVIzw1zt8q+0zVENH+cGiV7fAcmBQEpewoBuowxFJBC
	 MiZwgF4BJYINyF2I/nOPdimB+iQHlzlcAtqd2XdKB4P8OGhj2trcfpohKrXed9GI5X
	 BVPg28rIOiZ6g==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 06/16] selftests/mm: add khugepaged race harness
From: Mike Rapoport <rppt@kernel.org>
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Nico Pache <nico.pache@linux.dev>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, Barry Song <baohua@kernel.org>, 
 Dev Jain <dev.jain@arm.com>, Hugh Dickins <hughd@google.com>, 
 Lance Yang <lance.yang@linux.dev>, "Liam R. Howlett" <liam@infradead.org>, 
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, 
 Ryan Roberts <ryan.roberts@arm.com>, Shuah Khan <shuah@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Usama Arif <usama.arif@linux.dev>, 
 Vlastimil Babka <vbabka@kernel.org>, Zi Yan <ziy@nvidia.com>, 
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, "Kiryl Shutsemau (Meta)" <kas@kernel.org>
In-Reply-To: <20260802195254.1937477-7-kirill@shutemov.name>
References: <20260802195254.1937477-1-kirill@shutemov.name>
 <20260802195254.1937477-7-kirill@shutemov.name>
Date: Mon, 03 Aug 2026 14:04:23 +0300
Message-Id: <178575506331.1561566.172804163825999862.b4-review@b4>
X-Mailer: b4 0.16-dev

> Collapse serializes against faults, GUP, fork, mremap and zapping
> through a protocol of locks, TLB flushes and refcount checks; none of
> the khugepaged selftests exercise it under contention.
> 
> Add khugepaged_race: two faulters, MADV_DONTNEED, transient FOLL_PIN
> (gup_test), fork and mremap threads race one of three collapse
> drivers over the same ranges:
> 
>   stepped   khugepaged driven one full pass at a time via
>             khugepaged_full_pass() — deterministic extent per step;
>   free      free-running khugepaged (scan_sleep_millisecs=0) — soak;
>   madvise   MADV_COLLAPSE + MADV_DONTNEED loop — the PMD-order axis.
> 
> diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
> index 6f42e35b5227..a8b6b839cb97 100755
> --- a/tools/testing/selftests/mm/run_vmtests.sh
> +++ b/tools/testing/selftests/mm/run_vmtests.sh
> @@ -404,6 +404,13 @@ CATEGORY="cow" run_test ./cow
>  
>  CATEGORY="thp" run_test ./folio_order_check
>  
> +
> +CATEGORY="thp" run_test ./khugepaged_race -d 5 -m stepped
> +
> +CATEGORY="thp" run_test ./khugepaged_race -d 5 -m free
> +
> +CATEGORY="thp" run_test ./khugepaged_race -d 5 -m madvise

Please set the default duration so it will be 5 seconds for each mode
and make ./khugepaged_race run all the modes by default.

-- 
Sincerely yours,
Mike.

