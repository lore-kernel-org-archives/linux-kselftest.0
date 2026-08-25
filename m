Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E11222370A;
	Tue, 25 Aug 2026 11:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787656777; cv=none; b=pjrDgq/qfsIbC4M8Rkj23p6KD/2OGWcv9JznFs2tNpIJ1fWpU4yL7XIx7Yb1VDCRuxCw8zS34VixBT7pP9gB9DD8tHvmTLWSj3dpuaDYMrzIfASIWBDdw0mNxAave++jJfMGCuFI8zIlE9M5oQoWm62MR/lxSrP6blw+5VnqQko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787656777; c=relaxed/simple;
	bh=UlQShURGaz0JVYO7ZvgZQI1iWoR0Mg28sCCyyy4X/vc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F1I7BoVAiWamNstCcv/a2+pcX44cWIXKQI1fozqh1G0JnAo7Cz5KMCi5aqa032tggYrO8tBiNPzoxgwWEh74+vTdxvrDN/59B6w9poxBZQn5qTwoRlRFmcLRUTn4qtwaFw6mtieHKj3MNSM4//VCESjC4Tqi7a80XNSYZFGtjb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=vQ3tQhEz; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="vQ3tQhEz"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA07A1688;
	Tue, 25 Aug 2026 04:19:30 -0700 (PDT)
Received: from e142334-100.cambridge.arm.com (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 01A063F66F;
	Tue, 25 Aug 2026 04:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787656774; bh=UlQShURGaz0JVYO7ZvgZQI1iWoR0Mg28sCCyyy4X/vc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vQ3tQhEz9FmxiPbfML0RqRRNwc7/gBKKsZXZjIA1jLIAsGANK70L8XKcLDLtQ9Ikc
	 a5zQgujbvIU/sMjT4FVVTVVoTAVczwHbPIzHwEAjgOzhmGQlwd2kOci5STpDTFmYxc
	 Nz4qZ+8IBNIGzznDyH5NRSW54AfcBzq+f7cIdaYk=
From: Muhammad Usama Anjum <usama.anjum@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Amit Daniel Kachhap <amit.kachhap@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Mark Brown <broonie@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)),
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK)
Cc: Muhammad Usama Anjum <usama.anjum@arm.com>
Subject: [PATCH v3 1/4] selftests/arm64: Print missing MTE TAP headers
Date: Tue, 25 Aug 2026 12:18:34 +0100
Message-ID: <20260825111929.2882324-2-usama.anjum@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260825111929.2882324-1-usama.anjum@arm.com>
References: <20260825111929.2882324-1-usama.anjum@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Most MTE tests set a TAP plan and emit results without first printing
the TAP version header. Direct execution therefore starts with a plan
such as "1..20" instead of "TAP version 13".

The problem is particularly visible in the GCR_EL1 context-switch test.
It prints its plan before forking 1,024 child processes. When stdout is
fully buffered, the plan remains in the stdio buffer. Each child inherits
the pending "1..1" line and flushes its copy from exit(), producing
repeated plan lines.

ksft_print_header() prints the TAP header and enables line buffering.
Call it in every MTE test that is missing it. In the GCR_EL1 test, call
it before the plan so the plan is flushed before the children are
forked. In the remaining tests, call it before setup and prerequisite
checks so early failures and whole-test skips also retain the header.

Fixes: 29f080881601 ("kselftest/arm64: check GCR_EL1 after context switch")
Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
---
Changes since v2:
- Fold the remaining MTE TAP header additions into this patch.
- Retain the Fixes tag only for check_gcr_el1_cswitch.c, where missing
  ksft_print_header() causes duplicate "1..1" plan lines.
- Drop the Reviewed-by tag because the combined patch was not reviewed.

Changes since v1:
- Explain how line buffering prevents duplicate plan lines.
- Use the selftests/arm64 subject prefix.
---
 tools/testing/selftests/arm64/mte/check_buffer_fill.c     | 2 ++
 tools/testing/selftests/arm64/mte/check_child_memory.c    | 2 ++
 tools/testing/selftests/arm64/mte/check_gcr_el1_cswitch.c | 1 +
 tools/testing/selftests/arm64/mte/check_hugetlb_options.c | 2 ++
 tools/testing/selftests/arm64/mte/check_ksm_options.c     | 2 ++
 tools/testing/selftests/arm64/mte/check_mmap_options.c    | 2 ++
 tools/testing/selftests/arm64/mte/check_tags_inclusion.c  | 2 ++
 tools/testing/selftests/arm64/mte/check_user_mem.c        | 2 ++
 8 files changed, 15 insertions(+)

diff --git a/tools/testing/selftests/arm64/mte/check_buffer_fill.c b/tools/testing/selftests/arm64/mte/check_buffer_fill.c
index ff4e075033493..039b1d7d85663 100644
--- a/tools/testing/selftests/arm64/mte/check_buffer_fill.c
+++ b/tools/testing/selftests/arm64/mte/check_buffer_fill.c
@@ -406,6 +406,8 @@ int main(int argc, char *argv[])
 	size_t page_size = getpagesize();
 	int item = ARRAY_SIZE(sizes);
 
+	ksft_print_header();
+
 	sizes[item - 3] = page_size - 1;
 	sizes[item - 2] = page_size;
 	sizes[item - 1] = page_size + 1;
diff --git a/tools/testing/selftests/arm64/mte/check_child_memory.c b/tools/testing/selftests/arm64/mte/check_child_memory.c
index 5e97ee792e4d2..e6a8acca2a941 100644
--- a/tools/testing/selftests/arm64/mte/check_child_memory.c
+++ b/tools/testing/selftests/arm64/mte/check_child_memory.c
@@ -146,6 +146,8 @@ int main(int argc, char *argv[])
 	int err;
 	int item = ARRAY_SIZE(sizes);
 
+	ksft_print_header();
+
 	page_size = getpagesize();
 	if (!page_size) {
 		ksft_print_msg("ERR: Unable to get page size\n");
diff --git a/tools/testing/selftests/arm64/mte/check_gcr_el1_cswitch.c b/tools/testing/selftests/arm64/mte/check_gcr_el1_cswitch.c
index 325bca0de0f6e..d23f154d3288c 100644
--- a/tools/testing/selftests/arm64/mte/check_gcr_el1_cswitch.c
+++ b/tools/testing/selftests/arm64/mte/check_gcr_el1_cswitch.c
@@ -131,6 +131,7 @@ int main(int argc, char *argv[])
 	if (err)
 		return err;
 
+	ksft_print_header();
 	ksft_set_plan(1);
 
 	evaluate_test(mte_gcr_fork_test(),
diff --git a/tools/testing/selftests/arm64/mte/check_hugetlb_options.c b/tools/testing/selftests/arm64/mte/check_hugetlb_options.c
index aad1234c7e0fe..23e4a7a9950c1 100644
--- a/tools/testing/selftests/arm64/mte/check_hugetlb_options.c
+++ b/tools/testing/selftests/arm64/mte/check_hugetlb_options.c
@@ -230,6 +230,8 @@ int main(int argc, char *argv[])
 	void *map_ptr;
 	unsigned long map_size;
 
+	ksft_print_header();
+
 	err = mte_default_setup();
 	if (err)
 		return err;
diff --git a/tools/testing/selftests/arm64/mte/check_ksm_options.c b/tools/testing/selftests/arm64/mte/check_ksm_options.c
index 0cf5faef17248..866f0929b6647 100644
--- a/tools/testing/selftests/arm64/mte/check_ksm_options.c
+++ b/tools/testing/selftests/arm64/mte/check_ksm_options.c
@@ -132,6 +132,8 @@ int main(int argc, char *argv[])
 {
 	int err;
 
+	ksft_print_header();
+
 	err = mte_default_setup();
 	if (err)
 		return err;
diff --git a/tools/testing/selftests/arm64/mte/check_mmap_options.c b/tools/testing/selftests/arm64/mte/check_mmap_options.c
index c100af3012cbb..492f2cd41f43b 100644
--- a/tools/testing/selftests/arm64/mte/check_mmap_options.c
+++ b/tools/testing/selftests/arm64/mte/check_mmap_options.c
@@ -945,6 +945,8 @@ int main(int argc, char *argv[])
 		},
 	};
 
+	ksft_print_header();
+
 	err = mte_default_setup();
 	if (err)
 		return err;
diff --git a/tools/testing/selftests/arm64/mte/check_tags_inclusion.c b/tools/testing/selftests/arm64/mte/check_tags_inclusion.c
index 4b764f2a81857..6b4fa6705d7c1 100644
--- a/tools/testing/selftests/arm64/mte/check_tags_inclusion.c
+++ b/tools/testing/selftests/arm64/mte/check_tags_inclusion.c
@@ -175,6 +175,8 @@ int main(int argc, char *argv[])
 {
 	int err;
 
+	ksft_print_header();
+
 	err = mte_default_setup();
 	if (err)
 		return err;
diff --git a/tools/testing/selftests/arm64/mte/check_user_mem.c b/tools/testing/selftests/arm64/mte/check_user_mem.c
index fb7936c4e0978..af343aa617323 100644
--- a/tools/testing/selftests/arm64/mte/check_user_mem.c
+++ b/tools/testing/selftests/arm64/mte/check_user_mem.c
@@ -201,6 +201,8 @@ int main(int argc, char *argv[])
 	int tag_offsets[] = {page_sz, MT_GRANULE_SIZE};
 	char test_name[TEST_NAME_MAX];
 
+	ksft_print_header();
+
 	page_sz = getpagesize();
 	if (!page_sz) {
 		ksft_print_msg("ERR: Unable to get page size\n");
-- 
2.47.3

