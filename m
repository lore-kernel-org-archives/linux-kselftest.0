Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBD703F0AB8
	for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 11:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790074843; cv=none; b=ecxnbf+QyybW67QPpss2LcAbLdiFLt4ntkZFGZrSp9zJiAr4b4U8WGvm7avnEYqbBSfG5r6czHSyH68onuh7BfK8ir6yRu802rSFpMN3QumDi3Y2N6bxBSt5yh/T0pmgSPhcHZHix0DqcxSiiWu9mfx5Egb8ADSHhDWKv2q49qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790074843; c=relaxed/simple;
	bh=sCGJKJu06WGX5ZXMD1wiK+itIKpSyKGUkjJcYtBZYZk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qjnN+qZ6fwF74cGevpg5oU7IkVdzHfW/AC/83KVjEimg9HY5fG5vowXOZHSzrxW/Gbgr0A10ezkoZyb8AWm0aTWMxt2X4r4KUh/ZxWB/zY72t6XV2aC+IRYT5e4I6CreAGmZyGcudolkWEhPTSwg/nhVdTTSg0lpajrthl/YX6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=gNzzJTtA; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="gNzzJTtA"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 70AF91BC0;
	Tue, 22 Sep 2026 04:00:33 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CD5753F632;
	Tue, 22 Sep 2026 04:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790074837; bh=sCGJKJu06WGX5ZXMD1wiK+itIKpSyKGUkjJcYtBZYZk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gNzzJTtAlj1gqc8JnXFuW/55mMyEf5glksxJbZdJ1TjZk67cIvjWS7BF88wv3UUTc
	 3bdSRG0RbWUZdZ7ma2GXnUY7gRE4eo6i51vDC5HwzTd1QrB/os2dzGqp0yhdvfBURo
	 dQD36QBZs5qhIR7aG/KrWCqLNo+54YUE/vCKsibs=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-kselftest@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	shuah@kernel.org,
	broonie@kernel.org,
	usama.anjum@arm.com,
	mark.rutland@arm.com,
	will@kernel.org,
	catalin.marinas@arm.com
Subject: [PATCH 2/2] kselftest/arm64/mte: Use MTE safe memory accessors
Date: Tue, 22 Sep 2026 11:59:59 +0100
Message-Id: <20260922105959.129380-3-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260922105959.129380-1-vladimir.murzin@arm.com>
References: <20260922105959.129380-1-vladimir.murzin@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use MTE safe memory accessors instead of library functions with
arbitrary implementations.

Also, for consistency, use accessors even for byte size accesses.

Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 tools/testing/selftests/arm64/mte/check_buffer_fill.c  | 10 +++++-----
 tools/testing/selftests/arm64/mte/check_child_memory.c |  6 +++---
 .../selftests/arm64/mte/check_hugetlb_options.c        |  4 ++--
 tools/testing/selftests/arm64/mte/check_mmap_options.c | 10 +++++-----
 .../testing/selftests/arm64/mte/check_tags_inclusion.c |  4 ++--
 5 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/tools/testing/selftests/arm64/mte/check_buffer_fill.c b/tools/testing/selftests/arm64/mte/check_buffer_fill.c
index 039b1d7d8566..54e1dcaf52ac 100644
--- a/tools/testing/selftests/arm64/mte/check_buffer_fill.c
+++ b/tools/testing/selftests/arm64/mte/check_buffer_fill.c
@@ -41,7 +41,7 @@ static int check_buffer_by_byte(int mem_type, int mode)
 		mte_initialize_current_context(mode, (uintptr_t)ptr, sizes[i]);
 		/* Set some value in tagged memory */
 		for (j = 0; j < sizes[i]; j++)
-			ptr[j] = '1';
+			memset_safe(&ptr[j], '1', 1);
 		mte_wait_after_trig();
 		err = cur_mte_cxt.fault_valid;
 		/* Check the buffer whether it is filled. */
@@ -82,7 +82,7 @@ static int check_buffer_underflow_by_byte(int mem_type, int mode,
 		/* Set some value in tagged memory and make the buffer underflow */
 		for (j = sizes[i] - 1; (j >= -underflow_range) &&
 				       (!cur_mte_cxt.fault_valid); j--) {
-			ptr[j] = '1';
+			memset_safe(&ptr[j], '1', 1);
 			last_index = j;
 		}
 		mte_wait_after_trig();
@@ -180,7 +180,7 @@ static int check_buffer_overflow_by_byte(int mem_type, int mode,
 		/* Set some value in tagged memory and make the buffer underflow */
 		for (j = 0, last_index = 0 ; (j < (sizes[i] + overflow_range)) &&
 					     (cur_mte_cxt.fault_valid == false); j++) {
-			ptr[j] = '1';
+			memset_safe(&ptr[j], '1', 1);
 			last_index = j;
 		}
 		mte_wait_after_trig();
@@ -308,8 +308,8 @@ static int check_buffer_by_block_iterate(int mem_type, int mode, size_t size)
 		result = KSFT_PASS;
 		mte_initialize_current_context(mode, (uintptr_t)dst, size);
 		/* Set some value in memory and copy*/
-		memset((void *)src, (int)'1', size);
-		memcpy((void *)dst, (void *)src, size);
+		memset_safe((void *)src, (int)'1', size);
+		memcpy_safe((void *)dst, (void *)src, size);
 		mte_wait_after_trig();
 		if (cur_mte_cxt.fault_valid) {
 			result = KSFT_FAIL;
diff --git a/tools/testing/selftests/arm64/mte/check_child_memory.c b/tools/testing/selftests/arm64/mte/check_child_memory.c
index e6a8acca2a94..5c62359e5682 100644
--- a/tools/testing/selftests/arm64/mte/check_child_memory.c
+++ b/tools/testing/selftests/arm64/mte/check_child_memory.c
@@ -41,7 +41,7 @@ static int check_child_tag_inheritance(char *ptr, int size, int mode)
 	} else if (child == 0) {
 		mte_initialize_current_context(mode, (uintptr_t)ptr, size);
 		/* Do copy on write */
-		memset(ptr, '1', size);
+		memset_safe(ptr, '1', size);
 		mte_wait_after_trig();
 		if (cur_mte_cxt.fault_valid == true) {
 			fault = 1;
@@ -56,14 +56,14 @@ static int check_child_tag_inheritance(char *ptr, int size, int mode)
 			}
 		}
 		mte_initialize_current_context(mode, (uintptr_t)ptr, -UNDERFLOW);
-		memset(ptr - UNDERFLOW, '2', UNDERFLOW);
+		memset_safe(ptr - UNDERFLOW, '2', UNDERFLOW);
 		mte_wait_after_trig();
 		if (cur_mte_cxt.fault_valid == false) {
 			fault = 1;
 			goto check_child_tag_inheritance_err;
 		}
 		mte_initialize_current_context(mode, (uintptr_t)ptr, size + OVERFLOW);
-		memset(ptr + size, '3', OVERFLOW);
+		memset_safe(ptr + size, '3', OVERFLOW);
 		mte_wait_after_trig();
 		if (cur_mte_cxt.fault_valid == false) {
 			fault = 1;
diff --git a/tools/testing/selftests/arm64/mte/check_hugetlb_options.c b/tools/testing/selftests/arm64/mte/check_hugetlb_options.c
index 23e4a7a9950c..85f1574b88be 100644
--- a/tools/testing/selftests/arm64/mte/check_hugetlb_options.c
+++ b/tools/testing/selftests/arm64/mte/check_hugetlb_options.c
@@ -106,7 +106,7 @@ static int check_child_tag_inheritance(char *ptr, int size, int mode)
 	} else if (child == 0) {
 		mte_initialize_current_context(mode, (uintptr_t)ptr, size);
 		/* Do copy on write */
-		memset(ptr, '1', size);
+		memset_safe(ptr, '1', size);
 		mte_wait_after_trig();
 		if (cur_mte_cxt.fault_valid == true) {
 			fault = 1;
@@ -135,7 +135,7 @@ static int check_child_tag_inheritance(char *ptr, int size, int mode)
 static int check_mte_memory(char *ptr, int size, int mode, int tag_check)
 {
 	mte_initialize_current_context(mode, (uintptr_t)ptr, size);
-	memset(ptr, '1', size);
+	memset_safe(ptr, '1', size);
 	mte_wait_after_trig();
 	if (cur_mte_cxt.fault_valid == true)
 		return KSFT_FAIL;
diff --git a/tools/testing/selftests/arm64/mte/check_mmap_options.c b/tools/testing/selftests/arm64/mte/check_mmap_options.c
index 492f2cd41f43..0f4d43fe80f2 100644
--- a/tools/testing/selftests/arm64/mte/check_mmap_options.c
+++ b/tools/testing/selftests/arm64/mte/check_mmap_options.c
@@ -72,13 +72,13 @@ static int check_mte_memory(char *ptr, int size, int mode,
 		ptr = mte_insert_atag(ptr);
 
 	mte_initialize_current_context(mode, (uintptr_t)ptr, size);
-	memset(ptr, '1', size);
+	memset_safe(ptr, '1', size);
 	mte_wait_after_trig();
 	if (cur_mte_cxt.fault_valid == true)
 		return KSFT_FAIL;
 
 	mte_initialize_current_context(mode, (uintptr_t)ptr, -UNDERFLOW);
-	memset(ptr - UNDERFLOW, '2', UNDERFLOW);
+	memset_safe(ptr - UNDERFLOW, '2', UNDERFLOW);
 	mte_wait_after_trig();
 	if (cur_mte_cxt.fault_valid == false && tag_check == TAG_CHECK_ON)
 		return KSFT_FAIL;
@@ -86,7 +86,7 @@ static int check_mte_memory(char *ptr, int size, int mode,
 		return KSFT_FAIL;
 
 	mte_initialize_current_context(mode, (uintptr_t)ptr, size + OVERFLOW);
-	memset(ptr + size, '3', OVERFLOW);
+	memset_safe(ptr + size, '3', OVERFLOW);
 	mte_wait_after_trig();
 	if (cur_mte_cxt.fault_valid == false && tag_check == TAG_CHECK_ON)
 		return KSFT_FAIL;
@@ -95,13 +95,13 @@ static int check_mte_memory(char *ptr, int size, int mode,
 
 	if (tag_op == TAG_OP_STONLY) {
 		mte_initialize_current_context(mode, (uintptr_t)ptr, -UNDERFLOW);
-		memcpy(buf, ptr - UNDERFLOW, MT_GRANULE_SIZE);
+		memcpy_safe(buf, ptr - UNDERFLOW, MT_GRANULE_SIZE);
 		mte_wait_after_trig();
 		if (cur_mte_cxt.fault_valid == true)
 			return KSFT_FAIL;
 
 		mte_initialize_current_context(mode, (uintptr_t)ptr, size + OVERFLOW);
-		memcpy(buf, ptr + size, MT_GRANULE_SIZE);
+		memcpy_safe(buf, ptr + size, MT_GRANULE_SIZE);
 		mte_wait_after_trig();
 		if (cur_mte_cxt.fault_valid == true)
 			return KSFT_FAIL;
diff --git a/tools/testing/selftests/arm64/mte/check_tags_inclusion.c b/tools/testing/selftests/arm64/mte/check_tags_inclusion.c
index 6b4fa6705d7c..bc39be231ae2 100644
--- a/tools/testing/selftests/arm64/mte/check_tags_inclusion.c
+++ b/tools/testing/selftests/arm64/mte/check_tags_inclusion.c
@@ -23,7 +23,7 @@ static int verify_mte_pointer_validity(char *ptr, int mode)
 {
 	mte_initialize_current_context(mode, (uintptr_t)ptr, BUFFER_SIZE);
 	/* Check the validity of the tagged pointer */
-	memset(ptr, '1', BUFFER_SIZE);
+	memset_safe(ptr, '1', BUFFER_SIZE);
 	mte_wait_after_trig();
 	if (cur_mte_cxt.fault_valid) {
 		ksft_print_msg("Unexpected fault recorded for %p-%p in mode %x\n",
@@ -159,7 +159,7 @@ static int check_none_included_tags(int mem_type, int mode)
 		}
 		mte_initialize_current_context(mode, (uintptr_t)ptr, BUFFER_SIZE);
 		/* Check the write validity of the untagged pointer */
-		memset(ptr, '1', BUFFER_SIZE);
+		memset_safe(ptr, '1', BUFFER_SIZE);
 		mte_wait_after_trig();
 		if (cur_mte_cxt.fault_valid)
 			break;
-- 
2.34.1

