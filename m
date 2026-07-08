Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6FA3B8D7B
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Jul 2026 03:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783481800; cv=none; b=Wgy3lCDA9tozLytJ6OMPuElU4b4I7ljoLImsc+0Ez4kuop0atVqsfNAicFp7xJDfbaaK2T3w8X3MJtIwNZw8m+r/baoiAAdKQGsTpb+pq1NW6LVAEvtFhJ0ZZCA83A4qpahAOFXtFOHIOHJZm96rYhdH9gvR+S2rJBUaCapifds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783481800; c=relaxed/simple;
	bh=flhGK1cZlSB5RszV7FH4hbM+9rZBqj+41XqhLfCb3Wo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rjt2wsu2Pt9X4ASazWCbGds+rSU4xjpoB/swQKo+DUWbzb1vM0BL99HMRVDVK6eSRK8lfue+qo4TSsRQJ/vGZt3HV4HHs2hImDYxDZvjvlLMgNgXXGVQC1Ui0cSn4mo5st2B5wNYYVSQc9US5PRrubJHaeITYJ9Cp/eCQmgcca8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dQnWkSTK; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dQnWkSTK"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c96bfabc8d4so102904a12.3
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Jul 2026 20:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783481798; x=1784086598; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2zWjmjX847p2DKDjhGEU6haOXKl59H/UFpmrJDlC52A=;
        b=dQnWkSTKGgbufwbCsK1u0oif25AJoQCQk4qazMrgwH4q33KYhbHMumF84f4o/6y/JL
         N1RXX6oI5DjvNX5CTRVky5blPf2XtXJHeJxrCjFLqoKb+FAAuERhyujKQlLk4qqXj1tQ
         xWBYFcp1XmnZRJ9dtVKYfMUNEsnE3XftDyn8VCI50SRw5bUj2qLN0NjfJZklbVYp1ZxJ
         6tj8G/siS2A6diW/8K9SXcyOdoJtp7IJN0ZWAuuDq4GEGI59+53hj5bcYUiiMKo0kMsm
         cwl5s81Oq7hFgeSTDCMRIiZJwvayYBTlJlltBVJcFjDrT4R54PMQHptQDT0LD70t9+zG
         jm/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783481798; x=1784086598;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2zWjmjX847p2DKDjhGEU6haOXKl59H/UFpmrJDlC52A=;
        b=ooxXOChakw1d6mrLZbx7XOyKjqrCZ/jeI/mQrGbsWOdpZO3YrIZvWZwTxJ6SwZtxBj
         YwCqZS8yKxOYgPM9g8UfF0sGm46XmpvdmpqN3kmNpN6B9M7gxCfKQ1uhwbXd+Cvy9DnK
         PHVcXR1koBsCnMJZb+sfmD+qEAINf1Fxvt4jU0/v6jUd/Z2JvbEbt0BjIC3yXXuJIK/M
         UI3QOE5BRDo0JjZNSMo22tqQyvLwzc7AhsnLZCNHfmbkrYeGhPUzCUSQ+UixEvr9d2xD
         ZLKQrkNb1/TshC93G5702Drc1q13JturVv52UVQqwtQQfcDKvLrESH/J9GSRZ9Kn/m0x
         jUfg==
X-Forwarded-Encrypted: i=1; AHgh+RoTpshbRueBOwJgXE88BZbTwhd+uX9S2QRqoXXP8R00DoYkOY38NdxcOyQp96078r1yRN6ifLWT9Ao+5MECmcc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5W7e+mDdJnp5XAOFZlyiIzMAJtuLReQIflt4bf4OnU8tGJDRG
	L203ReJ5ZPMGA/TvJNs8WFr6ea3f9xoAQB+T2YIZr0UPzzxmgZN2QEYb7Z7tV0xR
X-Gm-Gg: AfdE7cnflJMiHNFXBc/k6KGqsyndPIcwZ5YiclFp3KziBd0W3tMKuJXsriV6twFTW2i
	Ocy5E7ek5hoLYh6WrR9ZNIiKl/pMuLzc1JfeZEMl9s7DWTERz/C5XE89vjKrs5MDeXYqp7YycWD
	IDI9WZhMZc5gXxzcbdL3fLXqMJi9ATCr9rRhMiQDD9teFfgJZSJ58tWPo4VLY8mUJ3+E/8Xbf6z
	4FoKzGV4GFC8TzzmVWgpfdcjQWcsFK9haIKKzuD1tFsJinyKeKGMwkHO1Lq1HDYV8gTxRVwW2mU
	TUDcXy6YFDNS5GhrSwQIo//znCUI5LyuvhzFO87efI+pJsFhS4ZSwacXNfxAhwoXLoxl/j0qqZm
	yTI7EU6CBCYsNKdcttzOunwV5TP/NIVU5k85ISRs4ECm9lovALa9JlsuAbV4wVnL9KM6uFqn+Xo
	WbEqSZboGWVXjZIMf19ABDKK+vsuk3/NVmyzKPP6LT2gL1mqWYNQ==
X-Received: by 2002:a05:6a21:e083:b0:3b2:a8cd:ef4a with SMTP id adf61e73a8af0-3c0bd0207b7mr633916637.30.1783481798022;
        Tue, 07 Jul 2026 20:36:38 -0700 (PDT)
Received: from [10.0.0.65] ([2601:647:6700:64d0::94ac])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174accae5sm21092850eec.29.2026.07.07.20.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 20:36:37 -0700 (PDT)
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
Date: Tue, 07 Jul 2026 20:34:34 -0700
Subject: [PATCH v3 11/17] KVM: riscv: selftests: Add mmio test
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-riscv_insn_table-v3-11-3f8e5f75ba97@gmail.com>
References: <20260707-riscv_insn_table-v3-0-3f8e5f75ba97@gmail.com>
In-Reply-To: <20260707-riscv_insn_table-v3-0-3f8e5f75ba97@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Nam Cao <namcao@linutronix.de>, Alexandre Ghiti <alex@ghiti.fr>, 
 Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Conor Dooley <conor@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>, 
 Jesse Taube <jtaubepe@redhat.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783481777; l=7342;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=flhGK1cZlSB5RszV7FH4hbM+9rZBqj+41XqhLfCb3Wo=;
 b=7z/sq1C5QkABZJ08eLwPrGCQCGs4rIkpvETSlgM26LZdj47BbE0APnCXxkYDsFFGp+9PCA7BC
 rj0oOqSFdX/DoKumtNDJAqKygQdAEps8OnXHRd8G3BqJjiMoZGF9FAF
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=

Use the test KVM device to validate that reads and writes to a device
are properly emulated by KVM. This test checks all load and store
instructions that are emulated by KVM.

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
---
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 tools/testing/selftests/kvm/riscv/mmio_test.c | 189 ++++++++++++++++++++++++++
 2 files changed, 190 insertions(+)

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 9118a5a51b89..07a5fc2bf67c 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -214,6 +214,7 @@ TEST_GEN_PROGS_s390 += mmu_stress_test
 TEST_GEN_PROGS_riscv = $(TEST_GEN_PROGS_COMMON)
 TEST_GEN_PROGS_riscv += riscv/sbi_pmu_test
 TEST_GEN_PROGS_riscv += riscv/ebreak_test
+TEST_GEN_PROGS_riscv += riscv/mmio_test
 TEST_GEN_PROGS_riscv += access_tracking_perf_test
 TEST_GEN_PROGS_riscv += arch_timer
 TEST_GEN_PROGS_riscv += coalesced_io_test
diff --git a/tools/testing/selftests/kvm/riscv/mmio_test.c b/tools/testing/selftests/kvm/riscv/mmio_test.c
new file mode 100644
index 000000000000..ea3837771a33
--- /dev/null
+++ b/tools/testing/selftests/kvm/riscv/mmio_test.c
@@ -0,0 +1,189 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * mmio_test.c - Tests the mmio functionality.
+ */
+#include "kvm_util.h"
+#include "ucall_common.h"
+
+#define MMIO_TEST_REGION 0x20000000
+
+#define test_standard_read(len, instruction, name, options)					\
+static void test_##name(void)									\
+{												\
+	unsigned long mmio_result, reference_result;						\
+	/* Configure the MMIO to return 0xff for each byte to check sign extension */		\
+	unsigned long reference = ((unsigned long)-1 >> ((sizeof(long) - len) * 8));		\
+	*((unsigned long *)MMIO_TEST_REGION) = reference;					\
+	/* Check that reads through MMIO are equivalent to standard reads. */			\
+	asm volatile (										\
+		".option push\n"								\
+		options										\
+		#instruction "	%[mmio_res], 0(%[region])\n"					\
+		#instruction "	%[ref_res], 0(%[ref])\n"					\
+		".option pop\n"									\
+		: [mmio_res] "=&cr" (mmio_result), [ref_res] "=&cr" (reference_result)		\
+		: [region] "cr" (MMIO_TEST_REGION), [ref] "cr" (&reference)			\
+	);											\
+	GUEST_ASSERT_EQ(mmio_result, reference_result);						\
+	GUEST_DONE();										\
+}
+
+#define test_sp_read(len, instruction, name)							\
+static void test_##name(void)									\
+{												\
+	unsigned long mmio_result, reference_result;						\
+	unsigned long tmp;									\
+	/* Configure the MMIO to return 0xff for each byte to check sign extension */		\
+	unsigned long reference = ((unsigned long)-1 >> ((sizeof(long) - len) * 8));		\
+	*(((unsigned long *)MMIO_TEST_REGION)) = reference;					\
+	/* Check that reads through MMIO are equivalent to standard reads. */			\
+	asm volatile (										\
+		"mv	%[tmp], sp\n"								\
+		"mv	sp, %[region]\n"							\
+		".option push\n"								\
+		".option arch,+c\n"								\
+		#instruction "	%[mmio_res], 0(sp)\n"						\
+		"mv	sp, %[ref]\n"								\
+		#instruction "	%[ref_res], 0(sp)\n"						\
+		".option pop\n"									\
+		"mv	sp, %[tmp]\n"								\
+		: [mmio_res]  "=&cr" (mmio_result), [ref_res] "=&cr" (reference_result),	\
+		  [tmp] "=&r" (tmp)								\
+		: [region] "r" (MMIO_TEST_REGION), [ref] "cr" (&reference)			\
+	);											\
+	GUEST_ASSERT_EQ(mmio_result, reference_result);						\
+	GUEST_DONE();										\
+}
+
+test_standard_read(1, lb, lb, "")
+test_standard_read(1, lbu, lbu, "")
+test_standard_read(2, lh, lh, "")
+test_standard_read(2, lhu, lhu, "")
+test_standard_read(4, lw, lw, "")
+test_standard_read(4, c.lw, c_lw, ".option arch,+c\n")
+test_sp_read(4, c.lwsp, c_lwsp)
+
+#if __riscv_xlen == 64
+test_standard_read(4, lwu, lwu, "")
+test_standard_read(8, ld, ld, "")
+test_standard_read(8, c.ld, c_ld, ".option arch,+c\n")
+test_sp_read(8, c.ldsp, c_ldsp)
+#endif
+
+#define test_standard_write(len, write, read, name, options)					\
+static void test_##name(void)									\
+{												\
+	unsigned long result;									\
+	unsigned long reference = (0x5555555555555555ULL >> ((sizeof(long) - len) * 8));	\
+	/* Check that we can write and then read the same value. */				\
+	asm volatile (										\
+		".option push\n"								\
+		options										\
+		#write "	%[ref], 0(%[region])\n"						\
+		#read "		%[res], 0(%[region])\n"						\
+		".option pop\n"									\
+		: [res] "=&cr" (result)								\
+		: [region] "cr" (MMIO_TEST_REGION), [ref] "cr" (reference)			\
+	);											\
+	GUEST_ASSERT_EQ(result, reference);							\
+	GUEST_DONE();										\
+}
+
+#define test_sp_write(len, write, read, name)							\
+static void test_##name(void)									\
+{												\
+	unsigned long result;									\
+	unsigned long tmp;									\
+	unsigned long reference = (0x5555555555555555ULL >> ((sizeof(long) - len) * 8));	\
+	/* Check that we can write and then read the same value. */				\
+	asm volatile (										\
+		"mv	%[tmp], sp\n"								\
+		"mv	sp, %[region]\n"							\
+		".option push\n"								\
+		".option arch,+c\n"								\
+		#write "	%[ref], 0(sp)\n"						\
+		#read "		%[res], 0(sp)\n"						\
+		".option pop\n"									\
+		"mv	sp, %[tmp]\n"								\
+		: [res] "=&cr" (result), [tmp] "=&r" (tmp)					\
+		: [region] "cr" (MMIO_TEST_REGION), [ref] "cr" (reference)			\
+	);											\
+	GUEST_ASSERT_EQ(result, reference);							\
+	GUEST_DONE();										\
+}
+
+test_standard_write(1, sb, lb, sb, "")
+test_standard_write(2, sh, lh, sh, "")
+test_standard_write(4, sw, lw, sw, "")
+test_standard_write(4, c.sw, c.lw, c_sw, ".option arch,+c\n")
+test_sp_write(4, c.swsp, c.lwsp, c_swsp)
+
+#if __riscv_xlen == 64
+test_standard_write(8, sd, ld, sd, "")
+test_standard_write(8, c.sd, c.ld, c_sd, ".option arch,+c\n")
+test_sp_write(8, c.sdsp, c.ldsp, c_sdsp)
+#endif
+
+static void run(void *guest_code, char *instruction)
+{
+	int fd;
+	struct ucall uc;
+	struct kvm_vm *vm;
+	struct kvm_vcpu *vcpu;
+
+	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
+	fd = kvm_create_device(vm, KVM_DEV_TYPE_TEST);
+
+	virt_map(vm, (unsigned long)MMIO_TEST_REGION, MMIO_TEST_REGION, 1);
+
+	vcpu_run(vcpu);
+
+	TEST_ASSERT(get_ucall(vcpu, &uc) == UCALL_DONE,
+		    "MMIO with instruction '%s' failed: '%s'", instruction,
+		    uc.buffer);
+
+	close(fd);
+	kvm_vm_free(vm);
+}
+
+void test_mmio_read_sign_extension(void)
+{
+	run(test_lb, "lb");
+	run(test_lbu, "lbu");
+	run(test_lh, "lh");
+	run(test_lhu, "lhu");
+	run(test_lw, "lw");
+	run(test_c_lw, "c.lw");
+	run(test_c_lwsp, "c.lwsp");
+
+#if __riscv_xlen == 64
+	run(test_lwu, "lwu");
+	run(test_ld, "ld");
+	run(test_c_ld, "c.ld");
+	run(test_c_ldsp, "c.ldsp");
+#endif
+}
+
+void test_mmio_write(void)
+{
+	run(test_sb, "sb");
+	run(test_sh, "sh");
+	run(test_sw, "sw");
+	run(test_c_sw, "c.sw");
+	run(test_c_swsp, "c.swsp");
+
+#if __riscv_xlen == 64
+	run(test_sd, "sd");
+	run(test_c_sd, "c.sd");
+	run(test_c_sdsp, "c.sdsp");
+#endif
+}
+
+int main(void)
+{
+	test_mmio_read_sign_extension();
+	test_mmio_write();
+
+	return 0;
+}
+

-- 
2.54.0

