Received: from mail-dy1-f202.google.com (mail-dy1-f202.google.com [74.125.82.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3530E36309C
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Apr 2026 18:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776796228; cv=none; b=a1zAX+8GjHR+nyiihJM9lTOGiC02jPlFHndCrm/zb0Kju5m6rk1zWLFNDPxWbEJhklfouGkNrzhx8tyN1ZZzr7Y4ScZmf1NiA5LcAtYmfusH+5RVZ+E4WRazvZoiZc1I3G53/5WDvn02OR48i3KUTAfpkY17bEp71iM+8o3TefA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776796228; c=relaxed/simple;
	bh=E9Sag1aNatvSWiMy8pJBN9tWHnqzLKMOx7NGZq3NpP4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=lXAvrl+ThY/r0NzIM7Ws5eoJXqF0S5Jsb1iowefVNlL7XJ3OtmTMhqstc6CSKKZ/NXfa/s6PbSuNPUdltfMFMGosELJsr7TAePpHOGI55lNW+IpaeqzKCJ5aITgpvKTYJ9po8J2AQTYvUVXi8VU/qDyneQao7sEX+ypcH3qIJgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--pratmal.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G3NMN8rU; arc=none smtp.client-ip=74.125.82.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--pratmal.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G3NMN8rU"
Received: by mail-dy1-f202.google.com with SMTP id 5a478bee46e88-2ddd8ef5343so4379621eec.1
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Apr 2026 11:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776796220; x=1777401020; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I7gCU+7+MVJ8oLDIS9623dDF2RYQtZ2sejtpCDF2UxY=;
        b=G3NMN8rUdGeT/1YjgXB2p4JByPoyT3qcAKYbCVrzbi0qK3tyD3PgkKjh9OY1nx2ID+
         7P/9wJEwtleE82dGagzqXIJKAc7a3etnD8UoijlNFvf4JzxOvGNOD+sCwMZEl7H90j1k
         hN1arqBjeLxJKNTEKu//atedf7zgN+9BW/DhsoC3N7lLceXEiCUttXEoiepj9objtDmS
         hULbccMAdHySjXZohAdR8dMk/4Z7OqCuWFplF3/6w6cBh3Yh/gAeCWSlXFOW/sRyFqz7
         PgJXKfeS4w162aP31gxcEI/M1YlMWuVjseTG/falPKTCj/mtNzamOCn4fsPogOWeC7F0
         YfyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776796220; x=1777401020;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I7gCU+7+MVJ8oLDIS9623dDF2RYQtZ2sejtpCDF2UxY=;
        b=DLoJ1dcji48UHWQbQ7L6TuYZydKFN3IKD5pBSj2SDQib8Uml68dvcSUVbwgs/5q0Ev
         JwBwEe4b7L+YAYUNWqBrG4NfFlRDIernhjk4tjjRldNTeoQ9oJffszf12FZxyQO1lwwb
         VGdmXxYnhTt0e+XzGa/AoJgM53kgQnt02YweF+X/vqftWEXncaeX5vhiN5+Pr6Yy9CU0
         uaCdDWLE0zmp1y0DBk7qWnyqLVIB4qHyYeXxffgjs2LTZmfzzGzcgf5VX7uFrHMZMlWm
         MDCY9r39XIQG8ptQWTSAvj8C+jne6zK8prlIYkGTOGi2fdtDKgwiLZ3rr2JmER+nwq2V
         YNBw==
X-Forwarded-Encrypted: i=1; AFNElJ+7UAd+GDfqvpLK/CaRjFu2KaRnwbx7je+tMT0B7vIz+ErTqapHJ2cHgtQCu2XxqFWzx3ykxHWnIbWzxs+5+OA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSbQIN1ci0i8RwYvlm8PT+ngjWX6t7iPoRbhmS7DjJmY4q9Wbd
	VdvYc5sVRfuw2sFnBqQhrme7rq2+WkOUYiKaf7ps4dWmyjIHAOSnVTlKg+4w3sPKn4uAty5lfSE
	/PUOmcWDzNQ==
X-Received: from dyclw17.prod.google.com ([2002:a05:693c:2111:b0:2d9:472c:9184])
 (user=pratmal job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:d70d:b0:2d3:f3fc:bb6b
 with SMTP id 5a478bee46e88-2e4646cca96mr11336030eec.1.1776796219319; Tue, 21
 Apr 2026 11:30:19 -0700 (PDT)
Date: Tue, 21 Apr 2026 18:30:00 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.rc1.555.g9c883467ad-goog
Message-ID: <20260421183000.1541546-1-pratmal@google.com>
Subject: [RFC PATCH] selftests/mm: use pattern matching in .gitignore
From: pratmal@google.com
To: akpm@linux-foundation.org, shuah@kernel.org
Cc: yosryahmed@google.com, david@kernel.org, ljs@kernel.org, 
	Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org, 
	surenb@google.com, mhocko@suse.com, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Pratyush Mallick <pratmal@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Pratyush Mallick <pratmal@google.com>

The current .gitignore hardcodes each generated test binary by name,
requiring updates every time a new test is added.

Switch to the patten-matching approach similar to KVM:selftests.
Ignore everything by default and then allow source extensions (.c, .h, .sh)
and tracked non-source files.

Signed-off-by: Pratyush Mallick <pratmal@google.com>
---
 tools/testing/selftests/mm/.gitignore | 72 ++++-----------------------
 1 file changed, 11 insertions(+), 61 deletions(-)

diff --git a/tools/testing/selftests/mm/.gitignore b/tools/testing/selftests/mm/.gitignore
index 83ad9454dd9d..92f9205d3996 100644
--- a/tools/testing/selftests/mm/.gitignore
+++ b/tools/testing/selftests/mm/.gitignore
@@ -1,63 +1,13 @@
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
+*
+!/**/
+!*.c
+!*.h
+!*.sh
+!.gitignore
+!Makefile
+!config
+!settings
+#Re-ignore generated files
 local_config.h
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
+*.mod.c
-- 
2.54.0.rc1.555.g9c883467ad-goog

