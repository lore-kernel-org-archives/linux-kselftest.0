Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7061A274B53;
	Mon, 28 Sep 2026 05:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790571684; cv=none; b=iKcFSDBOHkI3fQbkEN/J6rTdidHi+bmg5l/di0O8utTpwB7wTx1GOJ2u700PqZ2SGTSKm3+bzCjS+Kuit8FcSr17F32bFDQg/khE8sccafIhjbHFve61rTzdlOFqe+wB6JRMvvBc5IwDcFqSFtNrnIMOiLs/VmgUKOdFdaTh10g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790571684; c=relaxed/simple;
	bh=blpaJ8wcWFMmHEuh/IwWsHLK0u06RnOp2THrUaZWItg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ee7htMlRpQAoL84e1z4XrOFFB1OJWSvJj6p3qxJc959XS5IWAZK8JsKqBRcvlIYaaasf2qzjmsHJ2e0Hn8iwEOTdQdsfFHX0Ipi/D2b8jLefjtSgxwtB3HFQkmDIpL04akbTMgrXi2TcIrRTYR4UyYV5Yv4sfVhS+ifBk9IUlpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=DxwhNBix; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="DxwhNBix"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 489571595;
	Sun, 27 Sep 2026 22:01:18 -0700 (PDT)
Received: from [10.164.19.84] (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1C71A3F85F;
	Sun, 27 Sep 2026 22:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790571681; bh=blpaJ8wcWFMmHEuh/IwWsHLK0u06RnOp2THrUaZWItg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DxwhNBixws7b4cJQwt53rNViThM3Uifx/UbKR4I6HmyRWWsj7qhkW2k7XiqZ03sKb
	 KTWy6D+eK4tqEOsY+AjcGlYabO+sTTKAFgdIAyB4zl2Jm5XI7cD4f4VYAnEHior6VY
	 Ig9cZtTYH2sAqu0lmcJbm+vKkKMj0IwLTUY8dewM=
Message-ID: <5fd59b17-c10c-4c8d-ae92-2304393569df@arm.com>
Date: Mon, 28 Sep 2026 10:31:15 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/mm: cleanup -Wformat issues in hugetlb-mmap
To: Carlos Llamas <cmllamas@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org,
 "open list:MEMORY MANAGEMENT - MISC" <linux-mm@kvack.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
References: <20260927162419.820609-1-cmllamas@google.com>
Content-Language: en-US
From: Sarthak Sharma <sarthak.sharma@arm.com>
In-Reply-To: <20260927162419.820609-1-cmllamas@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/27/26 9:54 PM, Carlos Llamas wrote:
> Commit ae571cd6015c ("selftests/mm: hugetlb-mmap: add setup of HugeTLB
> pages") and commit 9c5a65f374f8 ("selftests/mm: merge map_hugetlb into
> hugepage-mmap") added logs of 'hugepage_size' which has a size_t type.
> However, the incorrect format specifier '%lu' was used which triggers
> -Wformat warnings when building for 32-bit:
> 
>   hugetlb-mmap.c:125:55: warning: format specifies type 'unsigned long'
>   but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
>     125 | ksft_print_msg("Default size hugepages (%lu kB)\n", hugepage_size >> 10);
>         |                                         ~~~         ^~~~~~~~~~~~~~~~~~~
>         |                                         %zu
> 
>   hugetlb-mmap.c:134:47: warning: format specifies type 'unsigned long'
>   but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
>     134 | ksft_exit_skip("Not enough %lu Kb pages\n", hugepage_size >> 10);
>         |                            ~~~              ^~~~~~~~~~~~~~~~~~~
>         |                            %zu
> 
> Fix this by switching to the expected '%zu' format specifier.
> 
> Cc: Mike Rapoport <rppt@kernel.org>
> Signed-off-by: Carlos Llamas <cmllamas@google.com>
LGTM, so:

Reviewed-by: Sarthak Sharma <sarthak.sharma@arm.com>
