Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794901126;
	b=cj8ngZDW8nrInyjTbB4GKkHTm9ivNtZF2kwvDUiUSkQyA1CvgrmNrvRxb/Ys2wrRnu5m
	 g0Q8l+HKFdyGCW5OaiP1r4iVxACwLuPdV+jGWGNZX3cr8r2UAcHlCSXYPdoOegGge7zqy
	 GNxyNnddPRuO/eN0PZjT85WmJ/1yFVeEjYXvlmijU2sAUIu/yaLSGh7ruFW8uRMfT35pf
	 K1PRBwB69dVS6LxyYN8RYQCzBvgwtnsVgtqsz/EXPnsQkjvXgwcN5jroe1Tdhpp7gdoef
	 RIQhjYp6NXsayy5DJFac1SKso0ufA+cMDt7bzcFAWXxKVmuOYfCAt+RclYUbpkUSNZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794901126;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Bq1xM5S6cCDzBWNgh8mhLU4r4aKno2jWbKQ7mURNMgw=;
	b=GINSj69kZnSS5RW4sg40EEVn69Pb2RvPrY6bcOIlq4y0MCTCR7p0eoSdIIcvOZ9dJBZe
	 Kxk8+Q2Xzfp3ZLGdaQQ69rVHEJynRHc8mWKZidIChQ0/53kYl+WI7UVoCoyc2ENCMm5il
	 mlVkyXXnsga0QOwPs/TdiuwNoB6gboehFxhlqadhvSvIFHGWJpGCfOPk9HD1bNqMPxQms
	 PQRTc3jK6uoohLF30xgUQEtTn055ZDe+L0XJJf1B0J78BgKvDt85gXNuRwxL2lkmhKZhF
	 W0sKI3oNrJK+blevSdc53uokIKZ1XUvoQOEP444d4dE+vRZUq+HtRi4TdEOEuPulbKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sifive.com;
	spf=pass smtp.mailfrom=sifive.com;
	dkim=pass header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=mMjRGyas;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE13C606A8B0
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 07:38:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE13C606A8B0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=mMjRGyas
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1ae58d17cd9so3492508c88.1
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 23:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1794901125; x=1795505925; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bq1xM5S6cCDzBWNgh8mhLU4r4aKno2jWbKQ7mURNMgw=;
        b=mMjRGyas8GPoobfDp3x7Ob/H/vcaTrG60wiUbSN6OWJ4U0pFJbfmR/Z+a2nL3/ZiqR
         yPiVQHgVRf+j+w8AqIer3e/C2NCUx1qt0PMoIRY46vOwRapKEmHG3yBY+IOyQPyUStH+
         AARpiNked9HTICog6AisrSH/tkmArBs0TQpc8MCGkQARS8SsawugeuVKKMQnjj3EGqmP
         6wzHBnV67ktrzqlDzg74QcRL7/NfUlfYFDsbN/OSvsPqye/7Jy9DEL1ZkTg35Ej3lnfS
         6svnIIJhIn1+pZxQzM13U8Py9CpLpN8QR4WTBU7YW1uzFRJy/rGVsEaJi1FjnQAmOZFo
         0TgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794901125; x=1795505925;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bq1xM5S6cCDzBWNgh8mhLU4r4aKno2jWbKQ7mURNMgw=;
        b=nrJKV6qZ3YC218vyp2p5oLm9Uq58SC23/LF/nblcCk476lnUWk/vodWC2Xu4IugZcW
         9xVjogbU0/IAYmHyLHxrtLGFU9lZsL60L9IYfBh0h82C7iDgG969vN0t/c2UhFsA/mTI
         RbUyW/yvGJV35AD38oB/etmE4Ny7iJV85uFltlPnB/iAddwcE6G3U7OUsIlje6S0f04j
         etUALrXskAoQSeB/7ujQsyBdIft1tA27OWrIUuXWqTpnFOKontrNe+/FjKzHVwUS5Pyb
         Mft3AVjFS+Wre+SswQO7Z8T4lqlsWuBdozdbSQkwvz7QD5n8V1YWYWwGsuU0GQgvYlR7
         ZyQA==
X-Forwarded-Encrypted: i=1; AL+hErFKDxcGIJsPs3DQltH7J8waaTqBsA82Le2Nw6HGfroOYq/2jUaLz2z6ubmvqUvuGtCyegH9p8H/VwglrVOy1k0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9eUh1u01eCdemxs983rSS3jAF0+R6yx0ZAXgjzc+4uqWcDR9+3
	hUDgXMuoxNMznzAzQQNGwQo62EvKyCTVKIuvaw6GGmSIcONNScgFLsxUBQO39Y89ab8=
X-Gm-Gg: AZFdTZdaCriyhqARmb9pOcJ27T4zc4KajybTTv+2nt9JzxCeaS5WVriigAwf/nvHAAM
	2C2n+fRRMY7eN7XO/XxexXElxN1xMnIOizeg8FhzFctiLdmuCYJxDLCET8QASJjnI2gpL0Y/bol
	eqDSg3Hbm6IcmFsA+r+lE7MwuA5skr991iIt5+Cx6FguBG/KGNe320FzaflA5Td0LAorYrv08+Z
	VylX2icmL6WHqeauXvr9/3TcifBknLNQMDoz5I/4JalW37Qj1RzFa6ggpnMu65xTgYeWy4EeTju
	oeKLMIIxK2vKtKWcz+yFm3iLDuS3WA3JepmnDOu2uyZifVfDezoK4Nmv1t0f1PpiR3RnYTGG+Od
	OvP6VfFxLPWI8nSTejfn7cycrN076CDAsxLQHwnbKBRKBNkGIGGGUResgCOz2PF2p9rdGsth6u1
	zv8Y+FoAHk08u1BwoFSuIhb4Zd2JgCoTCfYTVxNk3BEa5Y+3j4/MFSRqVrFElJ5o2DEWgdE4q9w
	kqYrxXHd6urXwADL11iLm1O+kKGn2UJpVww8uU5rp9Y/TkJXzBJMBUZDXUvFNrujo/aPgnRcMmf
	+Q61phk/FGV0RnSOXnW37ojSuMiT4O6KosiQOD0ssNH4J8bUSSJlRBnd5DakxKyvYhU=
X-Received: by 2002:a05:7301:1810:b0:381:610e:4045 with SMTP id 5a478bee46e88-381610e40ebmr1137700eec.8.1794901124708;
        Mon, 16 Nov 2026 23:38:44 -0800 (PST)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38116afd7f7sm5190967eec.17.2026.11.16.23.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 23:38:44 -0800 (PST)
From: Nylon Chen <nylon.chen@sifive.com>
Date: Mon, 16 Nov 2026 23:38:38 -0800
Subject: [PATCH 2/2] selftests/riscv: Add vector misaligned load/store
 tests
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-riscv-vector-misaligned-v1-2-6c4d0ca905b7@sifive.com>
References: <20261116-riscv-vector-misaligned-v1-0-6c4d0ca905b7@sifive.com>
In-Reply-To: <20261116-riscv-vector-misaligned-v1-0-6c4d0ca905b7@sifive.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Nylon Chen <nylon.chen@sifive.com>, 
 Yeting Kuo <yeting.kuo@sifive.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794901121; l=30486;
 i=nylon.chen@sifive.com; s=20260310; h=from:subject:message-id;
 bh=cucAsBHXdr13plVMqPvS//NcNRD5TsQvaW5PNj6lvzw=;
 b=WxDvtTXlI3Cs1opaqtEvn7qF7kwF9iuNb8SYZcBrqS/1PvSM7iYJPDXK/V+HUrTzDaykJZT2X
 +YZMHQ+UGhXBJKC0F3KmRliREh+FS5rFslJheb5tqRzaWfswBhCnGnp
X-Developer-Key: i=nylon.chen@sifive.com; a=ed25519;
 pk=+xtFLLbXfGd50d5UhR9oBzLTh+JLft7T60t3u7YMZPI=

Add a new kselftest for RISC-V vector misaligned load/store operations.
This test covers various vector instruction types including:
- Unit-stride and strided load/store
- Indexed ordered and unordered load/store
- Fault-only-first loads
- Whole register load/store
- Segment load/store (unit-stride, strided, indexed)

The test uses macros to generate test functions for different element
widths (16/32/64-bit) and segment configurations (nf=2,4,8), reducing
code duplication significantly.

The test properly uses kselftest APIs:
- ksft_print_header() and ksft_set_plan() for initialization
- ksft_test_result_pass/fail() for reporting test results
- ksft_finished() for proper exit handling

Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
Signed-off-by: Yeting Kuo <yeting.kuo@sifive.com>
---
 tools/testing/selftests/riscv/vector/Makefile      |   5 +-
 .../testing/selftests/riscv/vector/v_misaligned.c  | 169 +++++++
 .../testing/selftests/riscv/vector/v_misaligned.h  | 530 +++++++++++++++++++++
 3 files changed, 703 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/riscv/vector/Makefile b/tools/testing/selftests/riscv/vector/Makefile
index 0ed09b69dd8a..79f475251797 100644
--- a/tools/testing/selftests/riscv/vector/Makefile
+++ b/tools/testing/selftests/riscv/vector/Makefile
@@ -3,7 +3,7 @@
 # Originally tools/testing/arm64/abi/Makefile
 
 TEST_GEN_PROGS := v_initval vstate_prctl vstate_ptrace validate_v_ptrace \
-		  v_uaccess_stress
+		  v_uaccess_stress v_misaligned
 TEST_GEN_PROGS_EXTENDED := vstate_exec_nolibc v_exec_initval_nolibc
 TEST_GEN_LIBS := v_helpers.c sys_hwprobe.c
 
@@ -40,4 +40,7 @@ $(OUTPUT)/validate_v_ptrace: validate_v_ptrace.c $(OUTPUT)/sys_hwprobe.o $(OUTPU
 $(OUTPUT)/v_uaccess_stress: v_uaccess_stress.c
 	$(CC) -static -o $@ $(CFLAGS) $(LDFLAGS) $^
 
+$(OUTPUT)/v_misaligned: v_misaligned.c
+	$(CC) -static -o $@ $(CFLAGS) $(LDFLAGS) -march=rv64imafdcvh -mabi=lp64d $^
+
 EXTRA_CLEAN += $(TEST_GEN_OBJ)
diff --git a/tools/testing/selftests/riscv/vector/v_misaligned.c b/tools/testing/selftests/riscv/vector/v_misaligned.c
new file mode 100644
index 000000000000..c0439a633280
--- /dev/null
+++ b/tools/testing/selftests/riscv/vector/v_misaligned.c
@@ -0,0 +1,169 @@
+// SPDX-License-Identifier: BSD-2-Clause
+/*
+ * Copyright (c) 2025 SiFive Inc.
+ *
+ * Authors:
+ *   Nylon Chen <nylon.chen@sifive.com>
+ *   Zong Li <zong.li@sifive.com>
+ */
+
+#include "v_misaligned.h"
+
+/* Strided load/store tests (16/32/64-bit) */
+DEFINE_STRIDED_TEST(16, uint16_t, 0x1234, 0x1111, 2)
+DEFINE_STRIDED_TEST(32, uint32_t, 0x12345678, 0x11111111, 4)
+DEFINE_STRIDED_TEST(64, uint64_t, 0x1234567890abcdefULL, 0x1111111111111111ULL, 8)
+
+/* Unit-stride load/store tests (16/32/64-bit) */
+DEFINE_UNIT_STRIDE_TEST(16, uint16_t, 0x1234, 0x1111)
+DEFINE_UNIT_STRIDE_TEST(32, uint32_t, 0x12345678, 0x11111111)
+DEFINE_UNIT_STRIDE_TEST(64, uint64_t, 0x1234567890abcdefULL, 0x1111111111111111ULL)
+
+/* Indexed ordered load/store tests (16/32/64-bit) */
+DEFINE_INDEXED_ORDERED_TEST(16, uint16_t, 0x1234, 0x1111, 2)
+DEFINE_INDEXED_ORDERED_TEST(32, uint32_t, 0x12345678, 0x11111111, 4)
+DEFINE_INDEXED_ORDERED_TEST(64, uint64_t, 0x1234567890abcdefULL, 0x1111111111111111ULL, 8)
+
+/* Indexed unordered load/store tests (16/32/64-bit) */
+DEFINE_INDEXED_UNORDERED_TEST(16, uint16_t, 0x1234, 0x1111, 2)
+DEFINE_INDEXED_UNORDERED_TEST(32, uint32_t, 0x12345678, 0x11111111, 4)
+DEFINE_INDEXED_UNORDERED_TEST(64, uint64_t, 0x1234567890abcdefULL, 0x1111111111111111ULL, 8)
+
+/* Fault-only-first load tests (16/32/64-bit) */
+DEFINE_FAULT_ONLY_FIRST_TEST(16, uint16_t, 0x1234, 0x1111)
+DEFINE_FAULT_ONLY_FIRST_TEST(32, uint32_t, 0x12345678, 0x11111111)
+DEFINE_FAULT_ONLY_FIRST_TEST(64, uint64_t, 0x1234567890abcdefULL, 0x1111111111111111ULL)
+
+/* Whole register load/store tests (16/32/64-bit) */
+DEFINE_WHOLE_REG_TEST(16, uint16_t)
+DEFINE_WHOLE_REG_TEST(32, uint32_t)
+DEFINE_WHOLE_REG_TEST(64, uint64_t)
+
+/* Strided segment load/store tests (eew x nf combinations) */
+DEFINE_STRIDED_SEGMENT_TEST(16, 2)
+DEFINE_STRIDED_SEGMENT_TEST(16, 4)
+DEFINE_STRIDED_SEGMENT_TEST(16, 8)
+DEFINE_STRIDED_SEGMENT_TEST(32, 2)
+DEFINE_STRIDED_SEGMENT_TEST(32, 4)
+DEFINE_STRIDED_SEGMENT_TEST(32, 8)
+DEFINE_STRIDED_SEGMENT_TEST(64, 2)
+DEFINE_STRIDED_SEGMENT_TEST(64, 4)
+DEFINE_STRIDED_SEGMENT_TEST(64, 8)
+
+/* Unit-stride segment load/store tests (eew x nf combinations) */
+DEFINE_UNIT_STRIDE_SEGMENT_TEST(16, 2)
+DEFINE_UNIT_STRIDE_SEGMENT_TEST(16, 4)
+DEFINE_UNIT_STRIDE_SEGMENT_TEST(16, 8)
+DEFINE_UNIT_STRIDE_SEGMENT_TEST(32, 2)
+DEFINE_UNIT_STRIDE_SEGMENT_TEST(32, 4)
+DEFINE_UNIT_STRIDE_SEGMENT_TEST(32, 8)
+DEFINE_UNIT_STRIDE_SEGMENT_TEST(64, 2)
+DEFINE_UNIT_STRIDE_SEGMENT_TEST(64, 4)
+DEFINE_UNIT_STRIDE_SEGMENT_TEST(64, 8)
+
+/* Indexed unordered segment load/store tests (eew x nf combinations) */
+DEFINE_INDEXED_UNORDERED_SEGMENT_TEST(16, 2, uint16_t)
+DEFINE_INDEXED_UNORDERED_SEGMENT_TEST(16, 4, uint16_t)
+DEFINE_INDEXED_UNORDERED_SEGMENT_TEST(16, 8, uint16_t)
+DEFINE_INDEXED_UNORDERED_SEGMENT_TEST(32, 2, uint32_t)
+DEFINE_INDEXED_UNORDERED_SEGMENT_TEST(32, 4, uint32_t)
+DEFINE_INDEXED_UNORDERED_SEGMENT_TEST(32, 8, uint32_t)
+DEFINE_INDEXED_UNORDERED_SEGMENT_TEST(64, 2, uint64_t)
+DEFINE_INDEXED_UNORDERED_SEGMENT_TEST(64, 4, uint64_t)
+DEFINE_INDEXED_UNORDERED_SEGMENT_TEST(64, 8, uint64_t)
+
+/* Indexed ordered segment load/store tests (eew x nf combinations) */
+DEFINE_INDEXED_ORDERED_SEGMENT_TEST(16, 2, uint16_t)
+DEFINE_INDEXED_ORDERED_SEGMENT_TEST(16, 4, uint16_t)
+DEFINE_INDEXED_ORDERED_SEGMENT_TEST(16, 8, uint16_t)
+DEFINE_INDEXED_ORDERED_SEGMENT_TEST(32, 2, uint32_t)
+DEFINE_INDEXED_ORDERED_SEGMENT_TEST(32, 4, uint32_t)
+DEFINE_INDEXED_ORDERED_SEGMENT_TEST(32, 8, uint32_t)
+DEFINE_INDEXED_ORDERED_SEGMENT_TEST(64, 2, uint64_t)
+DEFINE_INDEXED_ORDERED_SEGMENT_TEST(64, 4, uint64_t)
+DEFINE_INDEXED_ORDERED_SEGMENT_TEST(64, 8, uint64_t)
+
+int main(void)
+{
+	ksft_print_header();
+	ksft_set_plan(54);
+
+	int VLEN = csr_read(CSR_VLENB);
+	int VEC_LEN = VLEN / 8;
+
+	/* stride */
+	test_misaligned_strided_load_store_16(VEC_LEN);
+	test_misaligned_strided_load_store_32(VEC_LEN);
+	test_misaligned_strided_load_store_64(VEC_LEN);
+
+	/* unit-stride  */
+	test_misaligned_unit_stride_load_store_16(VEC_LEN);
+	test_misaligned_unit_stride_load_store_32(VEC_LEN);
+	test_misaligned_unit_stride_load_store_64(VEC_LEN);
+
+	/* indexed_ordered  */
+	test_indexed_ordered_load_store_16(VEC_LEN);
+	test_indexed_ordered_load_store_32(VEC_LEN);
+	test_indexed_ordered_load_store_64(VEC_LEN);
+
+	/* indexed_unordered  */
+	test_indexed_unordered_load_store_16(VEC_LEN);
+	test_indexed_unordered_load_store_32(VEC_LEN);
+	test_indexed_unordered_load_store_64(VEC_LEN);
+
+	/* fault_only_first */
+	test_fault_only_first_load_16_misaligned(VEC_LEN);
+	test_fault_only_first_load_32_misaligned(VEC_LEN);
+	test_fault_only_first_load_64_misaligned(VEC_LEN);
+
+	/* whole_reg  */
+	whole_reg_16(VLEN);
+	whole_reg_32(VLEN);
+	whole_reg_64(VLEN);
+
+	/* unit-stride segment */
+	test_misaligned_unit_stride_segment_load_store_16_2(VEC_LEN);
+	test_misaligned_unit_stride_segment_load_store_16_4(VEC_LEN);
+	test_misaligned_unit_stride_segment_load_store_16_8(VEC_LEN);
+	test_misaligned_unit_stride_segment_load_store_32_2(VEC_LEN);
+	test_misaligned_unit_stride_segment_load_store_32_4(VEC_LEN);
+	test_misaligned_unit_stride_segment_load_store_32_8(VEC_LEN);
+	test_misaligned_unit_stride_segment_load_store_64_2(VEC_LEN);
+	test_misaligned_unit_stride_segment_load_store_64_4(VEC_LEN);
+	test_misaligned_unit_stride_segment_load_store_64_8(VEC_LEN);
+
+	/* strided segment */
+	test_misaligned_strided_segment_load_store_16_2(VEC_LEN);
+	test_misaligned_strided_segment_load_store_16_4(VEC_LEN);
+	test_misaligned_strided_segment_load_store_16_8(VEC_LEN);
+	test_misaligned_strided_segment_load_store_32_2(VEC_LEN);
+	test_misaligned_strided_segment_load_store_32_4(VEC_LEN);
+	test_misaligned_strided_segment_load_store_32_8(VEC_LEN);
+	test_misaligned_strided_segment_load_store_64_2(VEC_LEN);
+	test_misaligned_strided_segment_load_store_64_4(VEC_LEN);
+	test_misaligned_strided_segment_load_store_64_8(VEC_LEN);
+
+	/* indexed unordered segment */
+	test_misaligned_indexed_unordered_segment_load_store_16_2(VEC_LEN);
+	test_misaligned_indexed_unordered_segment_load_store_16_4(VEC_LEN);
+	test_misaligned_indexed_unordered_segment_load_store_16_8(VEC_LEN);
+	test_misaligned_indexed_unordered_segment_load_store_32_2(VEC_LEN);
+	test_misaligned_indexed_unordered_segment_load_store_32_4(VEC_LEN);
+	test_misaligned_indexed_unordered_segment_load_store_32_8(VEC_LEN);
+	test_misaligned_indexed_unordered_segment_load_store_64_2(VEC_LEN);
+	test_misaligned_indexed_unordered_segment_load_store_64_4(VEC_LEN);
+	test_misaligned_indexed_unordered_segment_load_store_64_8(VEC_LEN);
+
+	/* indexed ordered segment */
+	test_misaligned_indexed_ordered_segment_load_store_16_2(VEC_LEN);
+	test_misaligned_indexed_ordered_segment_load_store_16_4(VEC_LEN);
+	test_misaligned_indexed_ordered_segment_load_store_16_8(VEC_LEN);
+	test_misaligned_indexed_ordered_segment_load_store_32_2(VEC_LEN);
+	test_misaligned_indexed_ordered_segment_load_store_32_4(VEC_LEN);
+	test_misaligned_indexed_ordered_segment_load_store_32_8(VEC_LEN);
+	test_misaligned_indexed_ordered_segment_load_store_64_2(VEC_LEN);
+	test_misaligned_indexed_ordered_segment_load_store_64_4(VEC_LEN);
+	test_misaligned_indexed_ordered_segment_load_store_64_8(VEC_LEN);
+
+	ksft_finished();
+}
diff --git a/tools/testing/selftests/riscv/vector/v_misaligned.h b/tools/testing/selftests/riscv/vector/v_misaligned.h
new file mode 100644
index 000000000000..fe9d53cfe9fc
--- /dev/null
+++ b/tools/testing/selftests/riscv/vector/v_misaligned.h
@@ -0,0 +1,530 @@
+/* SPDX-License-Identifier: BSD-2-Clause
+ *
+ * Copyright (c) 2025 SiFive Inc.
+ *
+ * Authors:
+ *   Nylon Chen <nylon.chen@sifive.com>
+ *   Zong Li <zong.li@sifive.com>
+ */
+
+#ifndef _V_MISALIGNED_H
+#define _V_MISALIGNED_H
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <stdint.h>
+#include "../../kselftest_harness.h"
+
+#define __ASM_STR(x)	#x
+
+#define CSR_VSTART	0x8
+#define CSR_VLENB	0xc22
+
+#define OFFSET		1
+
+#define csr_read(csr)						\
+({								\
+	register unsigned long __v;				\
+	__asm__ __volatile__("csrr %0, " __ASM_STR(csr)		\
+		: "=r" (__v)					\
+		:						\
+		: "memory");					\
+	__v;							\
+})
+
+#define csr_write(csr, val)					\
+({								\
+	unsigned long __v = (unsigned long)(val);		\
+	__asm__ __volatile__("csrw " __ASM_STR(csr) ", %0"	\
+		:						\
+		: "rK" (__v)					\
+		: "memory");					\
+})
+
+static inline int check_result(const void *expected, const void *actual,
+			       size_t element_size, size_t vec_len)
+{
+	const uint8_t *expected_bytes = (const uint8_t *)expected;
+	const uint8_t *actual_bytes = (const uint8_t *)actual;
+
+	for (size_t i = 0; i < vec_len; i++) {
+		for (size_t j = 0; j < element_size; j++) {
+			if (expected_bytes[i * element_size + j] !=
+			    actual_bytes[i * element_size + j]) {
+				fprintf(stderr,
+					"Error: Expected 0x%02x, got 0x%02x at byte %zu of element %zu\n",
+					expected_bytes[i * element_size + j],
+					actual_bytes[i * element_size + j], j, i);
+				return 0;
+			}
+		}
+	}
+	return 1;
+}
+
+/*
+ * Macro to define strided load/store test functions
+ */
+#define DEFINE_STRIDED_TEST(bits, type, init_val, fill_val, stride_val)		\
+void test_misaligned_strided_load_store_##bits(int VEC_LEN)			\
+{										\
+	ksft_print_msg("start\n");						\
+	type *src_vec = (type *)calloc(VEC_LEN + OFFSET, sizeof(type));		\
+	type *dst_vec = (type *)calloc(VEC_LEN + OFFSET, sizeof(type));		\
+	if (!src_vec || !dst_vec) {						\
+		fprintf(stderr, "Error: Memory allocation failed\n");		\
+		free(src_vec);							\
+		free(dst_vec);							\
+		return;								\
+	}									\
+	for (size_t i = 0; i < VEC_LEN; i++) {					\
+		src_vec[i] = (init_val) + (i * (fill_val));			\
+		dst_vec[i] = (type)-1;						\
+	}									\
+	type *misaligned_load_addr = (type *)((uint8_t *)src_vec + OFFSET);	\
+	type *misaligned_store_addr = (type *)((uint8_t *)dst_vec + OFFSET);	\
+	asm volatile("vsetvli zero, %0, e" #bits ", m1\n\t"			\
+		     "vlse" #bits ".v v1, (%1), %3\n\t"				\
+		     "vsse" #bits ".v v1, (%2), %3\n\t"				\
+		     :								\
+		     : "r"(VEC_LEN), "r"(misaligned_load_addr),			\
+		       "r"(misaligned_store_addr), "r"(stride_val)		\
+		     : "memory", "v1");						\
+	if (!check_result(misaligned_load_addr, misaligned_store_addr,		\
+			  sizeof(type), VEC_LEN)) {				\
+		ksft_test_result_fail("strided " #bits " fail\n");		\
+		free(src_vec);							\
+		free(dst_vec);							\
+		return;								\
+	}									\
+	ksft_test_result_pass("strided " #bits " pass\n");			\
+	free(src_vec);								\
+	free(dst_vec);								\
+}
+
+/*
+ * Macro to define unit-stride load/store test functions
+ */
+#define DEFINE_UNIT_STRIDE_TEST(bits, type, init_val, fill_val)			\
+void test_misaligned_unit_stride_load_store_##bits(int VEC_LEN)			\
+{										\
+	ksft_print_msg("start\n");						\
+	type *src_vec = (type *)calloc(VEC_LEN + OFFSET, sizeof(type));		\
+	type *dst_vec = (type *)calloc(VEC_LEN + OFFSET, sizeof(type));		\
+	if (!src_vec || !dst_vec) {						\
+		fprintf(stderr, "Error: Memory allocation failed\n");		\
+		free(src_vec);							\
+		free(dst_vec);							\
+		return;								\
+	}									\
+	for (size_t i = 0; i < VEC_LEN; i++) {					\
+		src_vec[i + OFFSET] = (init_val) + (i * (fill_val));		\
+		dst_vec[i + OFFSET] = (type)-1;					\
+	}									\
+	type *misaligned_load_addr = (type *)((uint8_t *)src_vec + OFFSET);	\
+	type *misaligned_store_addr = (type *)((uint8_t *)dst_vec + OFFSET);	\
+	asm volatile("vsetvli zero, %0, e" #bits ", m1\n\t"			\
+		     "vle" #bits ".v v1, (%1)\n\t"				\
+		     "vse" #bits ".v v1, (%2)\n\t"				\
+		     :								\
+		     : "r"(VEC_LEN), "r"(misaligned_load_addr),			\
+		       "r"(misaligned_store_addr)				\
+		     : "memory", "v1");						\
+	if (!check_result(misaligned_load_addr, misaligned_store_addr,		\
+			  sizeof(type), VEC_LEN)) {				\
+		ksft_test_result_fail("unit_stride " #bits " fail\n");		\
+		free(src_vec);							\
+		free(dst_vec);							\
+		return;								\
+	}									\
+	ksft_test_result_pass("unit_stride " #bits " pass\n");			\
+	free(src_vec);								\
+	free(dst_vec);								\
+}
+
+/*
+ * Macro to define indexed ordered load/store test functions
+ */
+#define DEFINE_INDEXED_ORDERED_TEST(bits, type, init_val, fill_val, idx_mul)	\
+void test_indexed_ordered_load_store_##bits(int VEC_LEN)			\
+{										\
+	ksft_print_msg("start\n");						\
+	type *src_vec = (type *)calloc(VEC_LEN + OFFSET, sizeof(type));		\
+	type *dst_vec = (type *)calloc(VEC_LEN + OFFSET, sizeof(type));		\
+	type *index_vec = (type *)calloc(VEC_LEN, sizeof(type));		\
+	if (!src_vec || !dst_vec || !index_vec) {				\
+		fprintf(stderr, "Error: Memory allocation failed\n");		\
+		free(src_vec);							\
+		free(dst_vec);							\
+		free(index_vec);						\
+		return;								\
+	}									\
+	for (size_t i = 0; i < VEC_LEN; i++) {					\
+		src_vec[i] = (init_val) + (i * (fill_val));			\
+		dst_vec[i] = (type)-1;						\
+		index_vec[i] = i * (idx_mul);					\
+	}									\
+	type *misaligned_load_addr = (type *)((uint8_t *)src_vec + OFFSET);	\
+	type *misaligned_store_addr = (type *)((uint8_t *)dst_vec + OFFSET);	\
+	asm volatile("vsetvli zero, %0, e" #bits ", m1\n\t"			\
+		     "vle" #bits ".v v2, (%3)\n\t"				\
+		     "vloxei" #bits ".v v1, (%1), v2\n\t"			\
+		     "vsoxei" #bits ".v v1, (%2), v2\n\t"			\
+		     :								\
+		     : "r"(VEC_LEN), "r"(misaligned_load_addr),			\
+		       "r"(misaligned_store_addr), "r"(index_vec)		\
+		     : "memory", "v1", "v2");					\
+	if (!check_result(misaligned_load_addr, misaligned_store_addr,		\
+			  sizeof(type), VEC_LEN)) {				\
+		ksft_test_result_fail("indexed_ordered " #bits " fail\n");	\
+		free(src_vec);							\
+		free(dst_vec);							\
+		free(index_vec);						\
+		return;								\
+	}									\
+	ksft_test_result_pass("indexed_ordered " #bits " pass\n");		\
+	free(src_vec);								\
+	free(dst_vec);								\
+	free(index_vec);							\
+}
+
+
+/*
+ * Macro to define indexed unordered load/store test functions
+ */
+#define DEFINE_INDEXED_UNORDERED_TEST(bits, type, init_val, fill_val, idx_mul)	\
+void test_indexed_unordered_load_store_##bits(int VEC_LEN)			\
+{										\
+	ksft_print_msg("start\n");						\
+	type *src_vec = (type *)calloc(VEC_LEN + OFFSET, sizeof(type));		\
+	type *dst_vec = (type *)calloc(VEC_LEN + OFFSET, sizeof(type));		\
+	type *index_vec = (type *)calloc(VEC_LEN, sizeof(type));		\
+	if (!src_vec || !dst_vec || !index_vec) {				\
+		fprintf(stderr, "Error: Memory allocation failed\n");		\
+		free(src_vec);							\
+		free(dst_vec);							\
+		free(index_vec);						\
+		return;								\
+	}									\
+	for (size_t i = 0; i < VEC_LEN; i++) {					\
+		src_vec[i] = (init_val) + (i * (fill_val));			\
+		dst_vec[i] = (type)-1;						\
+		index_vec[i] = i * (idx_mul);					\
+	}									\
+	type *misaligned_load_addr = (type *)((uint8_t *)src_vec + OFFSET);	\
+	type *misaligned_store_addr = (type *)((uint8_t *)dst_vec + OFFSET);	\
+	asm volatile("vsetvli zero, %0, e" #bits ", m1\n\t"			\
+		     "vle" #bits ".v v2, (%3)\n\t"				\
+		     "vluxei" #bits ".v v1, (%1), v2\n\t"			\
+		     "vsuxei" #bits ".v v1, (%2), v2\n\t"			\
+		     :								\
+		     : "r"(VEC_LEN), "r"(misaligned_load_addr),			\
+		       "r"(misaligned_store_addr), "r"(index_vec)		\
+		     : "memory", "v1", "v2");					\
+	if (!check_result(misaligned_load_addr, misaligned_store_addr,		\
+			  sizeof(type), VEC_LEN)) {				\
+		ksft_test_result_fail("indexed_unordered " #bits " fail\n");	\
+		free(src_vec);							\
+		free(dst_vec);							\
+		free(index_vec);						\
+		return;								\
+	}									\
+	ksft_test_result_pass("indexed_unordered " #bits " pass\n");		\
+	free(src_vec);								\
+	free(dst_vec);								\
+	free(index_vec);							\
+}
+
+/*
+ * Macro to define fault-only-first load test functions
+ */
+#define DEFINE_FAULT_ONLY_FIRST_TEST(bits, type, init_val, fill_val)		\
+void test_fault_only_first_load_##bits##_misaligned(int VEC_LEN)		\
+{										\
+	ksft_print_msg("start\n");						\
+	type *src_vec = (type *)calloc(VEC_LEN + OFFSET, sizeof(type));		\
+	type *dst_vec = (type *)calloc(VEC_LEN + OFFSET, sizeof(type));		\
+	if (!src_vec || !dst_vec) {						\
+		fprintf(stderr, "Error: Memory allocation failed\n");		\
+		free(src_vec);							\
+		free(dst_vec);							\
+		return;								\
+	}									\
+	for (size_t i = 0; i < VEC_LEN; i++) {					\
+		src_vec[i + OFFSET] = (init_val) + (i * (fill_val));		\
+		dst_vec[i + OFFSET] = (type)-1;					\
+	}									\
+	type *misaligned_load_addr = (type *)((uint8_t *)src_vec + OFFSET);	\
+	type *misaligned_store_addr = (type *)((uint8_t *)dst_vec + OFFSET);	\
+	asm volatile("vsetvli zero, %0, e" #bits ", m1\n\t"			\
+		     "vle" #bits "ff.v v1, (%1)\n\t"				\
+		     "vse" #bits ".v v1, (%2)\n\t"				\
+		     :								\
+		     : "r"(VEC_LEN), "r"(misaligned_load_addr),			\
+		       "r"(misaligned_store_addr)				\
+		     : "memory", "v1");						\
+	if (!check_result(misaligned_load_addr, misaligned_store_addr,		\
+			  sizeof(type), VEC_LEN)) {				\
+		ksft_test_result_fail("fault_only_first " #bits " fail\n");	\
+		free(src_vec);							\
+		free(dst_vec);							\
+		return;								\
+	}									\
+	ksft_test_result_pass("fault_only_first " #bits " pass\n");		\
+	free(src_vec);								\
+	free(dst_vec);								\
+}
+
+/*
+ * Macro to define unit-stride segment load/store test functions
+ */
+#define DEFINE_UNIT_STRIDE_SEGMENT_TEST(bits, nf_val)				\
+void test_misaligned_unit_stride_segment_load_store_##bits##_##nf_val(int VEC_LEN) \
+{										\
+	ksft_print_msg("start\n");						\
+	size_t eew = bits;							\
+	size_t nf = nf_val;							\
+	size_t element_size = eew / 8;						\
+	size_t total_size = VEC_LEN * nf * element_size;			\
+	uint8_t *src_vec = (uint8_t *)calloc(total_size + OFFSET, 1);		\
+	uint8_t *dst_vec = (uint8_t *)calloc(total_size + OFFSET, 1);		\
+	if (!src_vec || !dst_vec) {						\
+		fprintf(stderr, "Error: Memory allocation failed\n");		\
+		free(src_vec);							\
+		free(dst_vec);							\
+		return;								\
+	}									\
+	for (size_t i = 0; i < total_size; i++) {				\
+		src_vec[i + OFFSET] = (uint8_t)(i + 1);				\
+		dst_vec[i + OFFSET] = 0xff;					\
+	}									\
+	uint8_t *misaligned_load_addr = src_vec + OFFSET;			\
+	uint8_t *misaligned_store_addr = dst_vec + OFFSET;			\
+	asm volatile("vsetvli zero, %0, e" #bits ", m1\n\t"			\
+		     "vlseg" #nf_val "e" #bits ".v v8, (%1)\n\t"			\
+		     "vsseg" #nf_val "e" #bits ".v v8, (%2)\n\t"			\
+		     :								\
+		     : "r"(VEC_LEN), "r"(misaligned_load_addr),			\
+		       "r"(misaligned_store_addr)				\
+		     : "memory", "v8");						\
+	if (!check_result(misaligned_load_addr, misaligned_store_addr,		\
+			  element_size, VEC_LEN * nf)) {			\
+		ksft_test_result_fail("unit_stride_segment " #bits "_" #nf_val " fail\n"); \
+		free(src_vec);							\
+		free(dst_vec);							\
+		return;								\
+	}									\
+	ksft_test_result_pass("unit_stride_segment " #bits "_" #nf_val " pass\n"); \
+	free(src_vec);								\
+	free(dst_vec);								\
+}
+
+/*
+ * Macro to define strided segment load/store test functions
+ */
+#define DEFINE_STRIDED_SEGMENT_TEST(bits, nf_val)				\
+void test_misaligned_strided_segment_load_store_##bits##_##nf_val(int VEC_LEN)	\
+{										\
+	ksft_print_msg("start\n");						\
+	size_t eew = bits;							\
+	size_t nf = nf_val;							\
+	size_t element_size = eew / 8;						\
+	size_t total_size = VEC_LEN * nf * element_size;			\
+	uint8_t *src_vec = (uint8_t *)calloc(total_size + OFFSET, 1);		\
+	uint8_t *dst_vec = (uint8_t *)calloc(total_size + OFFSET, 1);		\
+	if (!src_vec || !dst_vec) {						\
+		fprintf(stderr, "Error: Memory allocation failed\n");		\
+		free(src_vec);							\
+		free(dst_vec);							\
+		return;								\
+	}									\
+	for (size_t i = 0; i < total_size; i++) {				\
+		src_vec[i + OFFSET] = (uint8_t)(i + 1);				\
+		dst_vec[i + OFFSET] = 0xff;					\
+	}									\
+	uint8_t *misaligned_load_addr = src_vec + OFFSET;			\
+	uint8_t *misaligned_store_addr = dst_vec + OFFSET;			\
+	size_t stride = nf * element_size;					\
+	asm volatile("vsetvli zero, %0, e" #bits ", m1\n\t"			\
+		     "vlsseg" #nf_val "e" #bits ".v v8, (%1), %2\n\t"		\
+		     "vssseg" #nf_val "e" #bits ".v v8, (%3), %2\n\t"		\
+		     :								\
+		     : "r"(VEC_LEN), "r"(misaligned_load_addr),			\
+		       "r"(stride), "r"(misaligned_store_addr)			\
+		     : "memory", "v8");						\
+	if (!check_result(misaligned_load_addr, misaligned_store_addr,		\
+			  element_size, VEC_LEN * nf)) {			\
+		ksft_test_result_fail("strided_segment " #bits "_" #nf_val " fail\n"); \
+		free(src_vec);							\
+		free(dst_vec);							\
+		return;								\
+	}									\
+	ksft_test_result_pass("strided_segment " #bits "_" #nf_val " pass\n"); \
+	free(src_vec);								\
+	free(dst_vec);								\
+}
+
+
+/*
+ * Macro to define indexed unordered segment load/store test functions
+ */
+#define DEFINE_INDEXED_UNORDERED_SEGMENT_TEST(bits, nf_val, idx_type)		\
+void test_misaligned_indexed_unordered_segment_load_store_##bits##_##nf_val(int VEC_LEN) \
+{										\
+	ksft_print_msg("start\n");						\
+	size_t eew = bits;							\
+	size_t nf = nf_val;							\
+	size_t element_size = eew / 8;						\
+	size_t total_size = VEC_LEN * nf * element_size;			\
+	uint8_t *src_vec = (uint8_t *)calloc(total_size + OFFSET, 1);		\
+	uint8_t *dst_vec = (uint8_t *)calloc(total_size + OFFSET, 1);		\
+	idx_type *index_vec = (idx_type *)calloc(VEC_LEN, sizeof(idx_type));	\
+	if (!src_vec || !dst_vec || !index_vec) {				\
+		fprintf(stderr, "Error: Memory allocation failed\n");		\
+		free(src_vec);							\
+		free(dst_vec);							\
+		free(index_vec);						\
+		return;								\
+	}									\
+	for (size_t i = 0; i < total_size; i++) {				\
+		src_vec[i + OFFSET] = (uint8_t)(i + 1);				\
+		dst_vec[i + OFFSET] = 0xff;					\
+	}									\
+	for (size_t i = 0; i < VEC_LEN; i++)					\
+		index_vec[i] = i * nf * element_size;				\
+	uint8_t *misaligned_load_addr = src_vec + OFFSET;			\
+	uint8_t *misaligned_store_addr = dst_vec + OFFSET;			\
+	asm volatile("vsetvli zero, %0, e" #bits ", m1\n\t"			\
+		     "vle" #bits ".v v16, (%3)\n\t"				\
+		     "vluxseg" #nf_val "ei" #bits ".v v8, (%1), v16\n\t"		\
+		     "vsuxseg" #nf_val "ei" #bits ".v v8, (%2), v16\n\t"		\
+		     :								\
+		     : "r"(VEC_LEN), "r"(misaligned_load_addr),			\
+		       "r"(misaligned_store_addr), "r"(index_vec)		\
+		     : "memory", "v8", "v16");					\
+	if (!check_result(misaligned_load_addr, misaligned_store_addr,		\
+			  element_size, VEC_LEN * nf)) {			\
+		ksft_test_result_fail("indexed_unordered_segment " #bits "_" #nf_val " fail\n"); \
+		free(src_vec);							\
+		free(dst_vec);							\
+		free(index_vec);						\
+		return;								\
+	}									\
+	ksft_test_result_pass("indexed_unordered_segment " #bits "_" #nf_val " pass\n"); \
+	free(src_vec);								\
+	free(dst_vec);								\
+	free(index_vec);							\
+}
+
+/*
+ * Macro to define indexed ordered segment load/store test functions
+ */
+#define DEFINE_INDEXED_ORDERED_SEGMENT_TEST(bits, nf_val, idx_type)		\
+void test_misaligned_indexed_ordered_segment_load_store_##bits##_##nf_val(int VEC_LEN) \
+{										\
+	ksft_print_msg("start\n");						\
+	size_t eew = bits;							\
+	size_t nf = nf_val;							\
+	size_t element_size = eew / 8;						\
+	size_t total_size = VEC_LEN * nf * element_size;			\
+	uint8_t *src_vec = (uint8_t *)calloc(total_size + OFFSET, 1);		\
+	uint8_t *dst_vec = (uint8_t *)calloc(total_size + OFFSET, 1);		\
+	idx_type *index_vec = (idx_type *)calloc(VEC_LEN, sizeof(idx_type));	\
+	if (!src_vec || !dst_vec || !index_vec) {				\
+		fprintf(stderr, "Error: Memory allocation failed\n");		\
+		free(src_vec);							\
+		free(dst_vec);							\
+		free(index_vec);						\
+		return;								\
+	}									\
+	for (size_t i = 0; i < total_size; i++) {				\
+		src_vec[i + OFFSET] = (uint8_t)(i + 1);				\
+		dst_vec[i + OFFSET] = 0xff;					\
+	}									\
+	for (size_t i = 0; i < VEC_LEN; i++)					\
+		index_vec[i] = i * nf * element_size;				\
+	uint8_t *misaligned_load_addr = src_vec + OFFSET;			\
+	uint8_t *misaligned_store_addr = dst_vec + OFFSET;			\
+	asm volatile("vsetvli zero, %0, e" #bits ", m1\n\t"			\
+		     "vle" #bits ".v v16, (%3)\n\t"				\
+		     "vloxseg" #nf_val "ei" #bits ".v v8, (%1), v16\n\t"		\
+		     "vsoxseg" #nf_val "ei" #bits ".v v8, (%2), v16\n\t"		\
+		     :								\
+		     : "r"(VEC_LEN), "r"(misaligned_load_addr),			\
+		       "r"(misaligned_store_addr), "r"(index_vec)		\
+		     : "memory", "v8", "v16");					\
+	if (!check_result(misaligned_load_addr, misaligned_store_addr,		\
+			  element_size, VEC_LEN * nf)) {			\
+		ksft_test_result_fail("indexed_ordered_segment " #bits "_" #nf_val " fail\n"); \
+		free(src_vec);							\
+		free(dst_vec);							\
+		free(index_vec);						\
+		return;								\
+	}									\
+	ksft_test_result_pass("indexed_ordered_segment " #bits "_" #nf_val " pass\n"); \
+	free(src_vec);								\
+	free(dst_vec);								\
+	free(index_vec);							\
+}
+
+/*
+ * Macro to define whole register load/store test functions
+ */
+#define DEFINE_WHOLE_REG_TEST(bits, type)					\
+void whole_reg_##bits(int VLEN)							\
+{										\
+	type *src = (type *)calloc(8 * VLEN + OFFSET, sizeof(type));		\
+	type *dst = (type *)calloc(8 * VLEN + OFFSET, sizeof(type));		\
+	if (!src || !dst) {							\
+		ksft_test_result_fail("whole_reg " #bits " memory alloc fail\n"); \
+		free(src);							\
+		free(dst);							\
+		return;								\
+	}									\
+	for (int i = 0; i < VLEN; i++)						\
+		src[i] = i;							\
+	type *misaligned_load_addr = (type *)((uint8_t *)src + OFFSET);		\
+	type *misaligned_store_addr = (type *)((uint8_t *)dst + OFFSET);	\
+	asm volatile("vl1re" #bits ".v v1, (%0)" :: "r"(misaligned_load_addr));	\
+	asm volatile("vs1r.v v1, (%0)" :: "r"(misaligned_store_addr));		\
+	if (!check_result(misaligned_load_addr, misaligned_store_addr,		\
+			  sizeof(type), VLEN / 8 / 2)) {			\
+		ksft_test_result_fail("whole_reg " #bits " vl1re fail\n");	\
+		free(src);							\
+		free(dst);							\
+		return;								\
+	}									\
+	asm volatile("vl2re" #bits ".v v2, (%0)" :: "r"(misaligned_load_addr));	\
+	asm volatile("vs2r.v v2, (%0)" :: "r"(misaligned_store_addr));		\
+	if (!check_result(misaligned_load_addr, misaligned_store_addr,		\
+			  sizeof(type), VLEN / 8)) {				\
+		ksft_test_result_fail("whole_reg " #bits " vl2re fail\n");	\
+		free(src);							\
+		free(dst);							\
+		return;								\
+	}									\
+	asm volatile("vl4re" #bits ".v v4, (%0)" :: "r"(misaligned_load_addr));	\
+	asm volatile("vs4r.v v4, (%0)" :: "r"(misaligned_store_addr));		\
+	if (!check_result(misaligned_load_addr, misaligned_store_addr,		\
+			  sizeof(type), VLEN / 4)) {				\
+		ksft_test_result_fail("whole_reg " #bits " vl4re fail\n");	\
+		free(src);							\
+		free(dst);							\
+		return;								\
+	}									\
+	asm volatile("vl8re" #bits ".v v8, (%0)" :: "r"(misaligned_load_addr));	\
+	asm volatile("vs8r.v v8, (%0)" :: "r"(misaligned_store_addr));		\
+	if (!check_result(misaligned_load_addr, misaligned_store_addr,		\
+			  sizeof(type), VLEN / 2)) {				\
+		ksft_test_result_fail("whole_reg " #bits " vl8re fail\n");	\
+		free(src);							\
+		free(dst);							\
+		return;								\
+	}									\
+	ksft_test_result_pass("whole_reg " #bits " pass\n");			\
+	free(src);								\
+	free(dst);								\
+}
+
+#endif /* _V_MISALIGNED_H */

-- 
2.56.0

