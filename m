Received: from mail-dy1-f202.google.com (mail-dy1-f202.google.com [74.125.82.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4D843DA59
	for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 17:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778520908; cv=none; b=ppZyYtdbnUui7unHRekJ/OTLQBaIK1jOVgGOUowlbixDKJeg810nfwt7k1T/dE5I9IJEcISzvukPq6js+N9mi2lrAVDuzNU5ewH1uz4/lJhs16/9AQMTguMmScefgXSP90Cdx4zrtIT2M419orYXz1Y/E4IhdIBOf7VUbZiakBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778520908; c=relaxed/simple;
	bh=MVId46DsyO/71Ut4uRbFT5PuxmvQZIzwL7wQt6UCLH0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bI9IAzyvyaukXAzos8C+Lw8q3I9UYiDsad8EBgbpXK5wDsj65aqTXB1pxBNCg0MFNySutaUS1hJBnrzwWYV6qMEmRYyfgK8pGV8MCFm7D5tqUaXEgFQSUhqozM/75Fc8uT4UvQnzgPKsiX48xUEZS4luYbeva+y1wpIbYwozjcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--pratmal.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K4LktsOD; arc=none smtp.client-ip=74.125.82.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--pratmal.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K4LktsOD"
Received: by mail-dy1-f202.google.com with SMTP id 5a478bee46e88-2ee5b73c5f2so4978456eec.0
        for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 10:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778520906; x=1779125706; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=iMFaYjsKt3zyNcL9dbclqKxgsJAOumGvBRCpsgs54Z8=;
        b=K4LktsODLQPwtR8U19fQFTZ4xvJuMOwdm5aagip6grp+frZPYI9O+N3Z37AjIuqueD
         2fuvwCuST7J8E42pD6ljFdvi+DLsKusjjboUs5q8zxq+8/Mw4JMKMmsh5PEPQAKcgNJH
         4y/0N48aLycu5YXyphT8ZtExSpU+0IuTtFuRyWWMM7T4CJeOld/YEp3E9sHtU81/pSai
         dpycZGU7NyG+MaRUUlc9Hb0NQCgQ3MJH3tS0JAwWFehcG0i0iAaVFad1BLtUuY12trkO
         MyBlgmCl9VTUSiUfKUvovma/+08SxaRK/q5Oby+qlT3FYo/68RdLClvgJtyuiOBruzKq
         u6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778520906; x=1779125706;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iMFaYjsKt3zyNcL9dbclqKxgsJAOumGvBRCpsgs54Z8=;
        b=q8H8bQrtjIr+7v+5UtQk96dsxomemYC61hV1jaT9jLv0TiuBs2hDmYqiDpW/XRyjx5
         k6K5Tii6ElUFe4OuiIxupccAmtpCVOxB0AzUQ/jR9l5H87E/LqXcou8EAYC6zC08/HIP
         Q0NKKiXpWRKmMg/LgGJohcBkpYGdbGHXvWuXdgaYhd3vJnqD41Ys0VMi0xBhfbjlIpvk
         Aj/NFpWeT9PeV404BnSNefXxj74EG30oFhtkbixjKT0FqjS5ylX2AZlEUqR1fWC55f9m
         hLfIbGMcASEBjleYJ7aL1oW4GV1RoByoJN23sL2QWsIV4JLEFLRq6gJaxRe62N5jHepl
         RzRQ==
X-Forwarded-Encrypted: i=1; AFNElJ9cHMePIRYx9EcdeucQxogKzf0akTdNsijZkkuexVx6617C21ybKfK2KUGUMuB+2swKR1cCc83IGgg3p8KpCsQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiGWbyGgfz+uH3/kFFPecym2P09Sg1Rsi2k3t6e0xWTWPMfkh5
	igMFMr998f1wmZeWjxxUqzrIjWKDdcjzlEP279Cd/hKqMhqE4EkhxkLi2FHv5y+Uw1m46ajeBYm
	R4kHMTZvUuQ==
X-Received: from dybvv23.prod.google.com ([2002:a05:7300:f897:b0:2fc:f65c:1e7f])
 (user=pratmal job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:d704:b0:2c1:7b61:8731
 with SMTP id 5a478bee46e88-2f5490931d5mr13087576eec.10.1778520905905; Mon, 11
 May 2026 10:35:05 -0700 (PDT)
Date: Mon, 11 May 2026 17:34:10 +0000
In-Reply-To: <20260511173411.267628-1-pratmal@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260511173411.267628-1-pratmal@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260511173411.267628-2-pratmal@google.com>
Subject: [PATCH v3 1/2] selftests/mm: use pattern matching in .gitignore
From: pratmal@google.com
To: akpm@linux-foundation.org, shuah@kernel.org
Cc: yosry@kernel.org, david@kernel.org, ljs@kernel.org, 
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

Note that un-ignoring *.h files causes the generated local_config.h
build artifact to incorrectly become untracked. A subsequent patch
will rename this header to resolve the issue.

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
2.54.0.563.g4f69b47b94-goog

