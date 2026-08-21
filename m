Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A9F54C6F08;
	Fri, 21 Aug 2026 14:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787321768; cv=none; b=pE+J1wg/imeZG64QMq+XJYLEOC3ugj/3fqwnc0+A5UGyvP2wM6AzJkXR7JpQHhgG7uJKIwAu44i3/gi9hdXVyniO/DQr84isNhRIZ/brIduiHHLq+/2hwTx/au7YJFEDlv5DNKyuZwkBrSgtpnfity9GwId4+jyEXvhc94x+COQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787321768; c=relaxed/simple;
	bh=Gxs5Zr+QF55DCl6dC8K9VHi+T/trfWwC5Dw24lTRc7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YOREN2l3mrlzfAOYGmnpYUtkSVir4TKJudSZDEiv5LWaNlCfSOeb6bjrhS9Slib/d/PHT7w2l4EqlJoEZToGD73t4uV6LqklRCuilubl+zw3VwvVLYUABEbRmjKo309K64iiQaeUhKSwkcPvGWek5Ev0tzd9RsdR15/2sn3XR2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=vkAEXPiJ; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="vkAEXPiJ"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C398153B;
	Fri, 21 Aug 2026 07:16:02 -0700 (PDT)
Received: from e142334-100.cambridge.arm.com (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D7AC03F85F;
	Fri, 21 Aug 2026 07:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787321766; bh=Gxs5Zr+QF55DCl6dC8K9VHi+T/trfWwC5Dw24lTRc7c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vkAEXPiJep+/iEoq2CrJWmSStN4H19aZxb6Hho6hBWYwy1UP1/PF64rOZWhjq+aDh
	 2QfD1Mu6+Jfh8j5LtsE9VrfImB7SX17BMg2d5Ads2/EchScHmibSOldcJsCXhtXN7O
	 MN9nyFm1hryOlls9mIsD2Fo2cxTbO/qkfLlYj0SQ=
From: Muhammad Usama Anjum <usama.anjum@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Amit Daniel Kachhap <amit.kachhap@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)),
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK)
Cc: Muhammad Usama Anjum <usama.anjum@arm.com>
Subject: [PATCH v2 2/5] selftests/arm64: Print missing MTE TAP headers
Date: Fri, 21 Aug 2026 15:15:50 +0100
Message-ID: <20260821141556.4065894-3-usama.anjum@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260821141556.4065894-1-usama.anjum@arm.com>
References: <20260821141556.4065894-1-usama.anjum@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Most of the remaining MTE tests set a TAP plan and emit results without
first printing the TAP version header. Direct execution therefore starts
with a plan such as "1..20" instead of "TAP version 13".

Print the header in every remaining MTE test that is missing it. Do so
before setup and prerequisite checks so early failures and whole-test
skips also retain the header.

Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
---
Newly introduced. This is an output-format consistency change and does
not fix duplicated output or alter test execution behavior.
---
 tools/testing/selftests/arm64/mte/check_buffer_fill.c     | 2 ++
 tools/testing/selftests/arm64/mte/check_child_memory.c    | 2 ++
 tools/testing/selftests/arm64/mte/check_hugetlb_options.c | 2 ++
 tools/testing/selftests/arm64/mte/check_ksm_options.c     | 2 ++
 tools/testing/selftests/arm64/mte/check_mmap_options.c    | 2 ++
 tools/testing/selftests/arm64/mte/check_tags_inclusion.c  | 2 ++
 tools/testing/selftests/arm64/mte/check_user_mem.c        | 2 ++
 7 files changed, 14 insertions(+)

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

