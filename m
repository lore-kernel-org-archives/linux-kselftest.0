Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E29F32B118;
	Mon, 28 Sep 2026 17:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790617473; cv=none; b=HgZZbcoMuzZ/T2AMaFL+e9bf5q689sOPpJVOisrHKpCGWYLoRXVwB8Uzmuua9ZO+SBg4GTBklTIJ+/Zt5a5vxnR3bc+jB4vWUa8DnvXDHPQ+ucD8Z0enhU1dZXeayz8/qIJQgcUmsPVxrXltRlniRzPnVONpDlzLjDK62Re7/hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790617473; c=relaxed/simple;
	bh=N4Jv5wZSGhYQNl6VnhTVbc8kkvGlTQgFnahhA7vDUhk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D11+oUcXULFULRWWhlzsWOzeaXdSwncinP5NOcXEgH65hPteRl8rH6xXdNuBep2cLZ+6QWA9AsjO/az3ilknGbjMudl4DSTDXbXn5fu/salU8kSUd6TeT9NIGg0qJGNTldEKf3jbv4NA3R5tkxWgHX2M5UffbQZq1GDM6V1rraM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J0+IRFej; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J0+IRFej"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C333A1F00893;
	Mon, 28 Sep 2026 17:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790617471;
	bh=LX4LuZoDt/rc49RibEVXEdvKwPqqL8FWf86//5s3GWg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=J0+IRFej6Ee9mLg3nwYKPtM9sakauE1HtnsRSt6dDvCyYqnDkrf0hqcU/indoztfw
	 tpJNmwpqO5FB9cm4qdb2dgu3bnQF+S+G+G96yg7zi1/DUvTYDZ1m57tFZbVB+1QvYA
	 Cb1X7yg0HHE5LZjhuUscUwuRv0Haz4rV6767L/dH9YXXgll2E5w/QP70MMnUTWRGyc
	 dMSQLdE1P0GOgBsDICf/XKCm2enP+cKProuH/REprJrXhaFQKZoPVt2SHZsjCJSVqD
	 PSh6kuhrxw5zK44KgzXVq9CVQZInBvJA7PtDR10mzvMnLxgs9NNVAoMrUHh24Fz2BS
	 jNBcYQu7hHPJg==
From: SJ Park <sj@kernel.org>
To: Carlos Llamas <cmllamas@google.com>
Cc: SJ Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	kernel-team@android.com,
	linux-kernel@vger.kernel.org,
	"open list:MEMORY MANAGEMENT - MISC" <linux-mm@kvack.org>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH] selftests/mm: cleanup -Wformat issues in hugetlb-mmap
Date: Mon, 28 Sep 2026 10:44:25 -0700
Message-ID: <20260928174425.19155-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927162419.820609-1-cmllamas@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 27 Sep 2026 16:24:18 +0000 Carlos Llamas <cmllamas@google.com> wrote:

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

Looks good to me.

> 
> Cc: Mike Rapoport <rppt@kernel.org>
> Signed-off-by: Carlos Llamas <cmllamas@google.com>

Reviewed-by: SJ Park <sj@kernel.org>


Thanks,
SJ

[...]
