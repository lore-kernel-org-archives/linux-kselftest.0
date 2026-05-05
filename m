Received: from mail-dy1-f202.google.com (mail-dy1-f202.google.com [74.125.82.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFCF481A8A
	for <linux-kselftest@vger.kernel.org>; Tue,  5 May 2026 15:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777994569; cv=none; b=i4qYKxuHZq3TZWQx2eFlcn7A6pxam1DNhDi82nGB8j/DEBCJX2vVMufi1YfHMDdYwd762plRm4YxleMCKcrq9X9aNlBvhQZPcUrTHkfw6F6KeU55Qu8BcrmYDCSmc/vyU2perYVggKaRAENz3uIb0eq69D8K5ZqEttHjUaFt9po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777994569; c=relaxed/simple;
	bh=BBj9236F3gxFXxux6687Dg8lWeCYKB6BgIqL7cgXBtM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=p/Z9zoewcPKUG21f5bzGijtEo8q0K6hiJ/uE9hXgLaiIVk0qvt6QdT1sil00IfHoVFBO4Wve1ZLbp13l7wzivbQ/gYN4AR8hDaGCB0VrBVx4Hb4vRBFSVlfaUcLMTqqsZYqS1RvPtZiP4sGTviq6aOo4mRVki/PF9f6X7+jOVLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--pratmal.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kuiHQZBI; arc=none smtp.client-ip=74.125.82.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--pratmal.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kuiHQZBI"
Received: by mail-dy1-f202.google.com with SMTP id 5a478bee46e88-2f525565b33so112202eec.0
        for <linux-kselftest@vger.kernel.org>; Tue, 05 May 2026 08:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777994564; x=1778599364; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UOjyVgTc9j8m+n6ADmeYm9LZ9JNWTd7uheWYAzKXHUM=;
        b=kuiHQZBICdoUySoqirRlSKp8HUU0kOjgPwhSjdf1DMUFlHmaIUuQ7w2CZtyOc69LfX
         u15pxc8NzzupsSHlCGKxTDWAAqBHFhI76JU2356oljwKZn9AAIjBj0whW0pFuOe6TMMV
         J2DuCHj3GpGt4XS5wi1Hwn7IUMsAPyqBjm0008ejeSsze9VgLhJAjYzMho8XkR6U39iO
         JZknSt7vx2o5u/I5+u11QmVHQcGtxV25qtNrXfAPf7vXiOCI9jIxruJY0OU99xL9qPye
         20EHfiryYMnT65AlFnU0v7ANInTfPl+TgLpLeuxbWQvsAEPfZIWGFit3AcO7ZV73o0Y7
         YxZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777994564; x=1778599364;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UOjyVgTc9j8m+n6ADmeYm9LZ9JNWTd7uheWYAzKXHUM=;
        b=AUWCFkFNRFFWjURlqdyE0GhVlHebwCw00UEKNZQJnbTnb7A9OZBniqX4p5DH3iabrF
         uLQDuQM9kjVNUGEiQHb/FY61LesYNF2jSaCXRCduAQFCV68sYk/HJkb0MLuW7L0Cccph
         NufdGj8ZTEr79/w6hKfV9SYyVaRvf1VRuV/ZqKwrdbi9aVMqWAqJMYPr1oaOsIuwZYvp
         UpP3HfI+OBj22rdYCi3jjlbgzRLPpUCxwAVNnFq7xM2sHyRediJ6FzlQQ17DONVEoiMr
         L+GM/Bw021nbu3hHJHJuEbFsNuCrut0CA/43mA5mnvGLRwVMi4FVpku/HGUxnubeUz3d
         NAyw==
X-Forwarded-Encrypted: i=1; AFNElJ+NHhMLKTmqjdkunXKTkdA/4xHnsUO53jm4LsOTZ9K8d1GeJbmduiI1oGOQKLGSEvsDCnv+DY3Qt+dX26AybCo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxP7C5ep+n9t/bbIHrUx+bVF6I9PhFTTFBMxtaBOTM5P7Yr50aV
	DnQ5RwIS7ybu9YFmY/JWcldFnW80ShgVDZ1FmGiZIPRe3dWMx8vk+japeqlWfLm9fwUwGqldcUT
	igGK2Kphgbw==
X-Received: from dycaq14.prod.google.com ([2002:a05:7301:7e0e:b0:2f0:4bf1:a4a2])
 (user=pratmal job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:1609:b0:2f2:b544:2fca
 with SMTP id 5a478bee46e88-2f2b54431f7mr2282471eec.33.1777994563675; Tue, 05
 May 2026 08:22:43 -0700 (PDT)
Date: Tue,  5 May 2026 15:22:28 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260505152228.124065-1-pratmal@google.com>
Subject: [PATCH v2] selftests/mm: use pattern matching in .gitignore
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

To avoid un-ignoring the generated headers, rename local_config.h to
local_config.h_gen.

Acked-by: Lorenzo Stoakes <ljs@kernel.org>
Reviewed-by: Yosry Ahmed <yosryahmed@google.com>
Reviewed-by: David Hildenbrand <david@kernel.org>
Signed-off-by: Pratyush Mallick <pratmal@google.com>
---
Changelog since v1 (RFC):
- Renamed local_config.h to local_config.h_gen to avoid conflict with !*.h.
- Updated Makefile, check_config.sh, and affected .c files for the rename.
- Removed *.mod.c as it was unnecessary.

 tools/testing/selftests/mm/.gitignore      | 71 +++-------------------
 tools/testing/selftests/mm/Makefile        |  6 +-
 tools/testing/selftests/mm/check_config.sh |  2 +-
 tools/testing/selftests/mm/cow.c           |  2 +-
 tools/testing/selftests/mm/gup_longterm.c  |  2 +-
 5 files changed, 15 insertions(+), 68 deletions(-)

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
diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
index 7a5de4e9bf52..32f4b016b74f 100644
--- a/tools/testing/selftests/mm/Makefile
+++ b/tools/testing/selftests/mm/Makefile
@@ -5,7 +5,7 @@
 # script so kunit knows to run it, and add it to the list below.
 # If you do not YOUR TESTS WILL NOT RUN IN THE CI.
 
-LOCAL_HDRS += $(selfdir)/mm/local_config.h $(top_srcdir)/mm/gup_test.h
+LOCAL_HDRS += $(selfdir)/mm/local_config.h_gen $(top_srcdir)/mm/gup_test.h
 LOCAL_HDRS += $(selfdir)/mm/mseal_helpers.h
 
 include local_config.mk
@@ -259,10 +259,10 @@ $(OUTPUT)/migration: LDLIBS += -lnuma
 
 $(OUTPUT)/rmap: LDLIBS += -lnuma
 
-local_config.mk local_config.h: check_config.sh
+local_config.mk local_config.h_gen: check_config.sh
 	CC="$(CC)" CFLAGS="$(CFLAGS)" ./check_config.sh
 
-EXTRA_CLEAN += local_config.mk local_config.h
+EXTRA_CLEAN += local_config.mk local_config.h_gen
 
 ifeq ($(IOURING_EXTRA_LIBS),)
 all: warn_missing_liburing
diff --git a/tools/testing/selftests/mm/check_config.sh b/tools/testing/selftests/mm/check_config.sh
index b84c82bbf875..b46bf2d2e7f8 100755
--- a/tools/testing/selftests/mm/check_config.sh
+++ b/tools/testing/selftests/mm/check_config.sh
@@ -4,7 +4,7 @@
 # Probe for libraries and create header files to record the results. Both C
 # header files and Makefile include fragments are created.
 
-OUTPUT_H_FILE=local_config.h
+OUTPUT_H_FILE=local_config.h_gen
 OUTPUT_MKFILE=local_config.mk
 
 tmpname=$(mktemp)
diff --git a/tools/testing/selftests/mm/cow.c b/tools/testing/selftests/mm/cow.c
index d9c69c04b67d..87710c5a2d3c 100644
--- a/tools/testing/selftests/mm/cow.c
+++ b/tools/testing/selftests/mm/cow.c
@@ -21,7 +21,7 @@
 #include <sys/wait.h>
 #include <linux/memfd.h>
 
-#include "local_config.h"
+#include "local_config.h_gen"
 #ifdef LOCAL_CONFIG_HAVE_LIBURING
 #include <liburing.h>
 #endif /* LOCAL_CONFIG_HAVE_LIBURING */
diff --git a/tools/testing/selftests/mm/gup_longterm.c b/tools/testing/selftests/mm/gup_longterm.c
index f61150d28eb2..00ea0dd2f655 100644
--- a/tools/testing/selftests/mm/gup_longterm.c
+++ b/tools/testing/selftests/mm/gup_longterm.c
@@ -21,7 +21,7 @@
 #include <linux/magic.h>
 #include <linux/memfd.h>
 
-#include "local_config.h"
+#include "local_config.h_gen"
 #ifdef LOCAL_CONFIG_HAVE_LIBURING
 #include <liburing.h>
 #endif /* LOCAL_CONFIG_HAVE_LIBURING */
-- 
2.54.0.545.g6539524ca2-goog

