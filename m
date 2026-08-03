Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8B3345EA5
	for <linux-kselftest@vger.kernel.org>; Mon,  3 Aug 2026 22:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785795463; cv=none; b=MLZyV7lTyUfsx4qonnZvYZ6rP2V2AcA6+ifs7vLE02IjDUsQ4HLdrsMEd8oGJPw7J2BfZPjM+SK0WePLzuSkVz0h7T44jP/ZLWJFxIZk9obSRdgiCtyBihauuNib+LexqmQAL8s9DnI0y1dPriIYLt0azjaCT+WIaYIdrnJYQpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785795463; c=relaxed/simple;
	bh=AWyaxEsP6mmHFlqBTRUgz9wFg1WLWuZjyRWlVEu8Zdk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rrivhuR7a4KAZIY1COGClEkWZ6XQ3O3LGNnAbKb3C3+H0VvXsnesPH0rD29KOkqjwPIYAhyBBvWeKpNoIVhBGkfqxebMXg7QDcmoi1wE3ocWaOcGh3E0ugck3UxL27Aqd7KwjeIq90Eo3wjHMJNvU50DXV7oH+1y0CmMQpXTdok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--pratmal.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cGevAKZa; arc=none smtp.client-ip=209.85.210.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--pratmal.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cGevAKZa"
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84eee2147ffso3268469b3a.0
        for <linux-kselftest@vger.kernel.org>; Mon, 03 Aug 2026 15:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785795461; x=1786400261; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TAWFWvnBUh9ir1S9XV305sn5ZoY+nCCz6Prdpi+wHYw=;
        b=cGevAKZazMsw3WF9bHMOBwuwUNjC4oDoHPXGBW+eTvF8+z0ftO1zHA6jlj2CLHWhKk
         Y3ZEzP/yGgYPI4OPNyzH7KPQBfE4zBTBlDMT+KDdeZXcK9t5LfbWUyVF+83QdbNbQ+UW
         Wwek8nWmVgBHNONLJStFt2s6KqToisQ8YFRyTFyFzLyQkwC60ToKax7gPRl5lThoXgml
         9LR4xjYV5ALWUxfRQMrQcqDhXOYzQtj+/7Q1CsBxBffa1E/bFJ+fecQHPFZBIrsKLwNb
         yPr8ONFQ6Jx2xdoHQGFg0WBkaI3woHcM5jI7hN597uBWyL71kKZPC1WwUG54ObWYs+yj
         jc8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785795461; x=1786400261;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TAWFWvnBUh9ir1S9XV305sn5ZoY+nCCz6Prdpi+wHYw=;
        b=Qr/GDo4ZJsYljsUcJJs3EhS9dLSFsVvrwYTFb32IKeaRBD9b1Djc/RSfert8xjgcoV
         n8KfdutSBnVA64SOcUthcGp3iMfTymf/cipjNji2VGHxaTL8+pqJ46lmo7dULd32odTj
         XVRbnKV+OTPbf+TJwXpchRfJzOpkaNdVn32gI1QXVo5oGQtQtBi72Fb2j46XsaF5NdbK
         12dgagz/Lq7jlHC9cLc+nbb2nLecGpRrdArgCz+mskNFi9u/cFOniRWW0KtNRHdfQ5sa
         pBKRsNVKTqqYkByDT6Lj9B5MQZmYVE+4LjA4gKlJ2dp6MgLElzbEXrJkcwvm+oYd7H8y
         6Vgg==
X-Forwarded-Encrypted: i=1; AHgh+RrD5EuT2Zv4ldtKWQVdnuUwqhYez08a9tMWkz9W77BM8JinW9aD9EOIwTgtS2tNi7KPEaFSCmzbxx6D3edh3A0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwohhTVleUN66SCAcgsBRk/6hMAe9JubAIoPh1XxpIQP1f3qFKN
	rr5MsB6Hd4h9qwg4YmOf4Oo0MIh6W2TyGILs+RNbSIar6/Z1YWHj4Jk2F42zuGpylMKP1fOBjyE
	yEOu3zX7Vlg==
X-Received: from dybb26.prod.google.com ([2002:a05:693c:609a:b0:30e:953c:b434])
 (user=pratmal job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:7a95:b0:3c1:85d:fa2f
 with SMTP id adf61e73a8af0-3c92a89c7bbmr13299159637.36.1785795460577; Mon, 03
 Aug 2026 15:17:40 -0700 (PDT)
Date: Mon,  3 Aug 2026 22:17:32 +0000
In-Reply-To: <20260803221732.3651981-1-pratmal@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260803221732.3651981-1-pratmal@google.com>
X-Mailer: git-send-email 2.55.0.571.g244d577d93-goog
Message-ID: <20260803221732.3651981-3-pratmal@google.com>
Subject: [PATCH v4 2/2] selftests/mm: use pattern matching in .gitignore
From: pratmal@google.com
To: Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>
Cc: SeongJae Park <sj@kernel.org>, Sarthak Sharma <sarthak.sharma@arm.com>, 
	Yosry Ahmed <yosry@kernel.org>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pratyush Mallick <pratmal@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Pratyush Mallick <pratmal@google.com>

The current .gitignore hardcodes each generated test binary by name,
requiring updates every time a new test is added.

Switch to the pattern-matching approach similar to KVM:selftests.
Ignore everything by default and then allow source extensions (.c, .h, .sh)
and tracked non-source files.

Note that local_config.h was renamed to local_config.h_gen in a previous
patch so that un-ignoring *.h files does not cause generated build
artifacts to become untracked.

Reviewed-by: Lorenzo Stoakes <ljs@kernel.org>
Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Suggested-by: Yosry Ahmed <yosry@kernel.org>
Signed-off-by: Pratyush Mallick <pratmal@google.com>
---
 tools/testing/selftests/mm/.gitignore | 71 ++++-----------------------
 1 file changed, 9 insertions(+), 62 deletions(-)

diff --git a/tools/testing/selftests/mm/.gitignore b/tools/testing/selftests/mm/.gitignore
index 83ad9454dd9d..fcd892ed21e3 100644
--- a/tools/testing/selftests/mm/.gitignore
+++ b/tools/testing/selftests/mm/.gitignore
@@ -1,63 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0-only
-cow
-hugepage-mmap
-hugepage-mremap
-hugepage-shm
-hugepage-vmemmap
-hugetlb-madvise
-hugetlb-read-hwpoison
-hugetlb-soft-offline
-khugepaged
-map_hugetlb
-map_populate
-thuge-gen
-compaction_test
-memory-failure
-migration
-mlock2-tests
-mrelease_test
-mremap_dontunmap
-mremap_test
-on-fault-limit
-transhuge-stress
-pagemap_ioctl
-pfnmap
-process_madv
-*.tmp*
-protection_keys
-protection_keys_32
-protection_keys_64
-madv_populate
-uffd-stress
-uffd-unit-tests
-uffd-wp-mremap
-mlock-intersect-test
-mlock-random-test
-virtual_address_range
-gup_test
-va_128TBswitch
-map_fixed_noreplace
-write_to_hugetlbfs
-hmm-tests
-memfd_secret
-soft-dirty
-split_huge_page_test
-ksm_tests
-local_config.h
-local_config.mk
-ksm_functional_tests
-mdwe_test
-gup_longterm
-mkdirty
-va_high_addr_switch
-hugetlb_fault_after_madv
-hugetlb_madv_vs_map
-mseal_test
-droppable
-hugetlb_dio
-pkey_sighandler_tests_32
-pkey_sighandler_tests_64
-guard-regions
-merge
-prctl_thp_disable
-rmap
+*
+!/**/
+!*.c
+!*.h
+!*.sh
+!.gitignore
+!Makefile
+!config
+!settings
-- 
2.55.0.571.g244d577d93-goog

