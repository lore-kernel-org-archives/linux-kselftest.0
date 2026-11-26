Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795732464;
	b=O7H7Pv5F+3wlmEk6Htx5130kAFJEecwcG+sMOOJJaGkbL/2TZ6lMoFQh2+O9Rh6//Eb4
	 dVLDi+nLIi1NAMEOqAWIKn7Ps7E3eCgizzK1nJbb2uHRa0ZysBUdUcGXNowbRyxjWiU5k
	 a4P9TnVPmg4zFjs3N+aixIku+fQu8hF0cM7LwE2dYQiC5YKHxZ/BD2q1MOT8y8Yul5kp9
	 N+kLdtEGDBCoHeWJNli3H5stw9XCupY4M+OhUhxRFLHu8Rgn/p591gqUQHO3vp4SwnIA/
	 YgYJYY85IWsdCoesWIHLa/IMr8LyrAMkrkSAx8N5JX3iMUl4S1qSkyBpYklmeiiyCDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795732464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Qh0Uz68UQSqKpHmXMQ02Xo7A++oK8SwXXUxEW1LI41k=;
	b=qYcV5eAuHzPfWDwQC/76do8TxN9aXtEjcypx7hSQVfqn/vBAw57E/czF0Qk3KXN7eGTM
	 regTug9hcXVKD5DGleRr7kBf17HM+nEnQ1BRvWHlPfKML+sCLHMPbsEd0+LjEsnvIMdla
	 rcEYCyEE/mVFViNV5jbApXx7e59adxymZdR9w5nhLm/Km6TURMvvmUztrxdHqBxuCmuok
	 eFE0tXFX9ifPxtBaiQk4FFFGyrOGe7LvjKStvtvzXqpMLJf1ZmL9zk99SSLq2piQDEWRp
	 3IN3lqoEvHdzy1b2KMDa6jaF+TWZXarJhwCTbz4lkYseUlRcBhMSWZpa3AccfwW1w+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hrpYdX77;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FD3606A31E
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 22:34:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96FD3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hrpYdX77
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so96634245e9.1
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 14:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795732462; x=1796337262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qh0Uz68UQSqKpHmXMQ02Xo7A++oK8SwXXUxEW1LI41k=;
        b=hrpYdX77eoWiubw8+l9KGvcWAQuELLVCTC51UYyQ3I6tkSLWbyjfg9qc51/t4+cWHZ
         QGNcIc0+w09f2tVEeiyN4iqOHjwKyKtUSP2rnC7yRel4waRBMdz8Jc0Z/5DaTGE1bp0V
         0eN3Y+1bL3cUKFtw4CJ54vTndLPv6Eho5aipZxoH2ikIx6y48willxkYUwZUOFSw8Npf
         3U2EygGfLVjk6riLY2O0HNij3fzuLoO6v8dxyxo2mBaORU9MuDVApEW3AN2+UtAilSxF
         CaA50WY/0fB16Bq2mpJS5jE+dduX5lMU5D1M+9uDT5dVVSLfH2VT9dj7HJWHWbbrQjAm
         H7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795732462; x=1796337262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qh0Uz68UQSqKpHmXMQ02Xo7A++oK8SwXXUxEW1LI41k=;
        b=0WMa4M7g1jYhYh5W6MNDP6YHys0heT+vvplAGaRPwGCBE6k8A9nIODfT0D4+TeGrLn
         irt7X7GgnoPFsPvifQzYYXCe1jjcNkHQYu93cHoy5boNV4NugKJeHP+ARXbabgh9Trl/
         YMP9nlM4ed8J7IOLQgB9WMC/zR9OlIZj+ybG9aoa4vUftLNEVRzcPoNOeO9+GtZbK3aS
         5iKzJzt3kAtCRGguK/IQG3oMRNgBKrVBdpZOIssmHNyIJesKQPqvzqHT/BOaM/pLfuHJ
         I9QObK84IVw+R9XOoo+pdSghkSmL6vFdanneP85mNSQUxNzoT3CtqQQ5IFeaXNlLEtCP
         1hPw==
X-Forwarded-Encrypted: i=1; AL+hErEtFakfYKeCPJDMR3xBxDSf/YfpwXBfKvxqQ7XbsX4UEd1T+MBIdwsVjz67CYNWq42scLXk72Th7FuGLm6hCXw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XBKigqPj4+fChkDcCCw93MoE4DqoStKGESP+rGJ642Xgv11IB
	XbQUDXMMVx9sPZAhQqhdpZ0xOUEkw9ltYaet9jR03RGxXe4+kF/+klEP
X-Gm-Gg: AZFdTZe3UwE+22IUafaA+4qOm332tD8RwLc2giYS4jBMCUOliT7y95KYf7IRjJx7dEw
	zXCjXO03eyp3gldff+hz1KlY3wfUYw34rhFPgEBD7MkSCHEGbTDy1UIJzNEqpBQpb8SVJ09io7P
	o3lWUInywVzb0apI4PlsORlJJrL/511OPraHjmmuNqltU/ZpLQeWfUWSKgNp2iQeWWuRkb6kkWy
	hiQ+yuFW9iotFhJWjyJBnpZTA/+4G6BgABpulXkuy2tcTdD78Y983tVyAryytMlYklrMsLEbh5E
	vuKW8XBiguw9qTftqPZY1C/n8JuYeTNReZu9XhQiwH5qV/h2Zn7kK9Zliowzsqo9+4A4ABam/tz
	ycdXk5yAWIghbtxbQDlRxxeNet6cWQxw3pmG2KNfaBMVtUZEzK81y+jRPZALOYzKpkvJQw9L8rW
	BbE5Hjl2KiisTIV2La096LIZ/0mJXTWqrf7pSypA4iMTFPLmUA4u6hq4DS71qdytUa56qXCDEcg
	oUdgZVSEGgCm3uH1DjZfv8+PFbgIxIA6Iq0bGvYUCcOiO+3t67WXKSQ05MbnfiUKN1+jnLAAtoW
	I5NXzDIm/xv8GoxwHsSEqZ7lv2dp6p8=
X-Received: by 2002:a05:600c:1d09:b0:4bb:66fd:ad68 with SMTP id 5b1f17b1804b1-4bb888160cdmr478819035e9.14.1795732461607;
        Thu, 26 Nov 2026 14:34:21 -0800 (PST)
Received: from thinkpad ([2a00:1370:81ac:4181:10b1:754b:3cfe:5139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm596347585e9.2.2026.11.26.14.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 14:34:21 -0800 (PST)
From: Andrey Zakharov <dedemorow@gmail.com>
To: tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org
Cc: hpa@zytor.com,
	david@davidgow.net,
	raemoar63@gmail.com,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	Andrey Zakharov <dedemorow@gmail.com>
Subject: [PATCH] x86/e820: Add KUnit tests for table sanitizing and range update
Date: Fri, 27 Nov 2026 01:34:00 +0300
Message-ID: <20261126223400.1549478-1-dedemorow@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are no KUnit tests under arch/x86, and I could not find any other
tests of the E820 table code. e820__update_table() sorts a table, resolves
overlaps in favour of the higher type, merges neighbours of the same
type and stops when the table is full. e820__range_update_table()
changes the type of a range and may split an entry. Both take the table
as an argument, so they can be tested on a table of the test's own,
without touching the memory map of the running kernel.

Add 20 test cases. For e820__update_table(): too few entries and an
entry that wraps around (both return -1 and leave the table alone),
unsorted input, nested and partial overlaps, merging of equal types,
types that must not be merged (PRAM and SOFT_RESERVED), zero-size
entries, the sample map from the comment above the function, and a
full table. For e820__range_update_table(): a range covering an entry,
splitting an entry, head and tail, no match, a size that would wrap
around, and several entries at once.

Both functions are __init, so the suite is registered with
kunit_test_init_section_suite() and runs during boot, before init
memory is freed. It can only be built in: X86_E820_KUNIT_TEST depends
on KUNIT=y.

Tested: built with gcc 16.2.1 and run with kunit.py (CONFIG_KUNIT=y and
CONFIG_X86_E820_KUNIT_TEST=y) under QEMU (TCG, on top of
next-20261126): 20 of 20 pass, and 20 of 20 with --arch=i386. To
check that the tests can fail, I
changed e820.c temporarily in three ways, one at a time: always
starting a new entry at a change point (4 tests fail), setting the
wrong new start when cutting the head of an entry in
__e820__range_update() (1 fails), and swapping the order of range
start and end at equal addresses in cpcompare() (1 fails). None of
these changes is part of this patch.

Not tested: a full build with KUNIT_ALL_TESTS (I only checked that it
selects the option), other values of MAX_NUMNODES, real hardware.

Signed-off-by: Andrey Zakharov <dedemorow@gmail.com>
---
 arch/x86/Kconfig.debug       |  15 ++
 arch/x86/kernel/Makefile     |   1 +
 arch/x86/kernel/e820_kunit.c | 368 +++++++++++++++++++++++++++++++++++
 3 files changed, 384 insertions(+)
 create mode 100644 arch/x86/kernel/e820_kunit.c

diff --git a/arch/x86/Kconfig.debug b/arch/x86/Kconfig.debug
index c95c3aaadf97..657e645a9bb0 100644
--- a/arch/x86/Kconfig.debug
+++ b/arch/x86/Kconfig.debug
@@ -110,6 +110,21 @@ config IOMMU_LEAK
 config HAVE_MMIOTRACE_SUPPORT
 	def_bool y
 
+config X86_E820_KUNIT_TEST
+	bool "KUnit tests for the x86 E820 memory map code" if !KUNIT_ALL_TESTS
+	depends on KUNIT=y
+	default KUNIT_ALL_TESTS
+	help
+	  Run KUnit tests for e820__update_table() and
+	  e820__range_update_table() during boot. The tests work on
+	  tables of their own and do not change the memory map of the
+	  running kernel.
+
+	  For more information on KUnit and unit tests in general please
+	  refer to the KUnit documentation in Documentation/dev-tools/kunit/.
+
+	  If unsure, say N.
+
 config X86_DECODER_SELFTEST
 	bool "x86 instruction decoder selftest"
 	depends on DEBUG_KERNEL && INSTRUCTION_DECODER
diff --git a/arch/x86/kernel/Makefile b/arch/x86/kernel/Makefile
index 702536938433..6930495fdf32 100644
--- a/arch/x86/kernel/Makefile
+++ b/arch/x86/kernel/Makefile
@@ -82,6 +82,7 @@ obj-$(CONFIG_X86_64)	+= sys_x86_64.o
 obj-$(CONFIG_X86_ESPFIX64)	+= espfix_64.o
 obj-$(CONFIG_SYSFS)	+= ksysfs.o
 obj-y			+= bootflag.o e820.o
+obj-$(CONFIG_X86_E820_KUNIT_TEST)	+= e820_kunit.o
 obj-y			+= pci-dma.o quirks.o kdebugfs.o
 obj-y			+= alternative.o i8253.o hw_breakpoint.o
 obj-y			+= tsc.o tsc_msr.o io_delay.o rtc.o
diff --git a/arch/x86/kernel/e820_kunit.c b/arch/x86/kernel/e820_kunit.c
new file mode 100644
index 000000000000..efd0323bcfc8
--- /dev/null
+++ b/arch/x86/kernel/e820_kunit.c
@@ -0,0 +1,368 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * KUnit tests for the E820 memory map code.
+ *
+ * e820__update_table() and e820__range_update_table() are __init functions
+ * that work on a table passed by the caller. The tests therefore run during
+ * boot, before the init sections are freed, and never touch the real map.
+ *
+ * The layouts are written in units of one 4K page.
+ */
+#include <kunit/test.h>
+#include <linux/init.h>
+#include <linux/limits.h>
+#include <linux/sizes.h>
+#include <linux/string.h>
+
+#include <asm/e820/api.h>
+#include <asm/e820/types.h>
+
+#define PG(n)        ((u64)(n) * SZ_4K)
+#define E(a, s, t)   { .addr = PG(a), .size = PG(s), .type = E820_TYPE_##t }
+#define CHECK_UPDATE(test, in, exp) \
+	check_update(test, in, ARRAY_SIZE(in), exp, ARRAY_SIZE(exp))
+
+static struct e820_table *__init new_table(struct kunit *test, const struct e820_entry *e, u32 n)
+{
+	struct e820_table *t = kunit_kzalloc(test, sizeof(*t), GFP_KERNEL);
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, t);
+	KUNIT_ASSERT_LE(test, n, (u32)E820_MAX_ENTRIES);
+	if (n)
+		memcpy(t->entries, e, n * sizeof(*e));
+	t->nr_entries = n;
+	return t;
+}
+
+static void __init expect_table(struct kunit *test, const struct e820_table *t,
+		const struct e820_entry *e, u32 n)
+{
+	u32 i;
+
+	KUNIT_ASSERT_EQ(test, t->nr_entries, n);
+	for (i = 0; i < n; i++) {
+		KUNIT_EXPECT_EQ_MSG(test, t->entries[i].addr, e[i].addr, "entry %u addr", i);
+		KUNIT_EXPECT_EQ_MSG(test, t->entries[i].size, e[i].size, "entry %u size", i);
+		KUNIT_EXPECT_EQ_MSG(test, (u32)t->entries[i].type, (u32)e[i].type,
+				"entry %u type", i);
+	}
+}
+
+static void __init check_update(struct kunit *test,
+		const struct e820_entry *in, u32 n_in,
+		const struct e820_entry *exp, u32 n_exp)
+{
+	struct e820_table *t = new_table(test, in, n_in);
+
+	KUNIT_EXPECT_EQ(test, e820__update_table(t), 0);
+	expect_table(test, t, exp, n_exp);
+}
+
+static void __init check_range_update(struct kunit *test,
+		const struct e820_entry *in, u32 n_in, u64 start, u64 size,
+		enum e820_type old_type, enum e820_type new_type, u64 ret,
+		const struct e820_entry *exp, u32 n_exp)
+{
+	struct e820_table *t = new_table(test, in, n_in);
+
+	KUNIT_EXPECT_EQ(test, e820__range_update_table(t, start, size, old_type, new_type), ret);
+	expect_table(test, t, exp, n_exp);
+}
+
+/* One entry, or none: nothing to sanitize. The table must stay as it was. */
+static void __init update_table_too_few(struct kunit *test)
+{
+	static const struct e820_entry in[] = { E(0, 4, RAM) };
+	struct e820_table *t = new_table(test, in, ARRAY_SIZE(in));
+
+	KUNIT_EXPECT_EQ(test, e820__update_table(t), -1);
+	expect_table(test, t, in, ARRAY_SIZE(in));
+
+	t = new_table(test, NULL, 0);
+	KUNIT_EXPECT_EQ(test, e820__update_table(t), -1);
+	KUNIT_EXPECT_EQ(test, t->nr_entries, 0);
+}
+
+/* An entry that wraps around through zero makes the whole table invalid. */
+static void __init update_table_overflow(struct kunit *test)
+{
+	static const struct e820_entry in[] = {
+		E(0, 1, RAM),
+		{ .addr = ULLONG_MAX - 0xfff, .size = SZ_8K, .type = E820_TYPE_RESERVED },
+	};
+	struct e820_table *t = new_table(test, in, ARRAY_SIZE(in));
+
+	KUNIT_EXPECT_EQ(test, e820__update_table(t), -1);
+	expect_table(test, t, in, ARRAY_SIZE(in));
+}
+
+static void __init update_table_unsorted_disjoint(struct kunit *test)
+{
+	static const struct e820_entry in[] = { E(4, 1, ACPI), E(0, 1, RESERVED), E(2, 1, RAM) };
+	static const struct e820_entry exp[] = { E(0, 1, RESERVED), E(2, 1, RAM), E(4, 1, ACPI) };
+
+	CHECK_UPDATE(test, in, exp);
+}
+
+/* A higher type inside a lower one splits it in three. */
+static void __init update_table_nested_higher_type(struct kunit *test)
+{
+	static const struct e820_entry in[] = { E(0, 4, RAM), E(1, 1, RESERVED) };
+	static const struct e820_entry exp[] = { E(0, 1, RAM), E(1, 1, RESERVED), E(2, 2, RAM) };
+
+	CHECK_UPDATE(test, in, exp);
+}
+
+static void __init update_table_partial_overlap(struct kunit *test)
+{
+	static const struct e820_entry in[] = { E(0, 2, RAM), E(1, 2, ACPI) };
+	static const struct e820_entry exp[] = { E(0, 1, RAM), E(1, 2, ACPI) };
+
+	CHECK_UPDATE(test, in, exp);
+}
+
+/* A lower type inside a higher one disappears. */
+static void __init update_table_lower_type_absorbed(struct kunit *test)
+{
+	static const struct e820_entry in[] = { E(0, 4, ACPI), E(1, 1, RAM) };
+	static const struct e820_entry exp[] = { E(0, 4, ACPI) };
+
+	CHECK_UPDATE(test, in, exp);
+}
+
+static void __init update_table_merges_same_type(struct kunit *test)
+{
+	static const struct e820_entry in[] = { E(0, 1, RAM), E(1, 1, RAM), E(2, 1, RAM) };
+	static const struct e820_entry exp[] = { E(0, 3, RAM) };
+
+	CHECK_UPDATE(test, in, exp);
+}
+
+static void __init update_table_duplicates(struct kunit *test)
+{
+	static const struct e820_entry in[] = { E(0, 2, RAM), E(0, 2, RAM) };
+	static const struct e820_entry exp[] = { E(0, 2, RAM) };
+
+	CHECK_UPDATE(test, in, exp);
+}
+
+/* Adjacent entries of different types stay separate, in any input order. */
+static void __init update_table_adjacent_types(struct kunit *test)
+{
+	static const struct e820_entry a[] = { E(0, 1, RAM), E(1, 1, RESERVED) };
+	static const struct e820_entry b[] = { E(1, 1, RESERVED), E(0, 1, RAM) };
+	static const struct e820_entry c[] = { E(0, 1, RESERVED), E(1, 1, RAM) };
+
+	CHECK_UPDATE(test, a, a);
+	CHECK_UPDATE(test, b, a);
+	CHECK_UPDATE(test, c, c);
+}
+
+/* These types describe distinct ranges, so adjacent ones are not merged. */
+static void __init update_table_no_merge_pram_soft_reserved(struct kunit *test)
+{
+	static const struct e820_entry pram[] = { E(0, 1, PRAM), E(1, 1, PRAM) };
+	static const struct e820_entry soft[] = { E(0, 1, SOFT_RESERVED), E(1, 1, SOFT_RESERVED) };
+
+	CHECK_UPDATE(test, pram, pram);
+	CHECK_UPDATE(test, soft, soft);
+}
+
+static void __init update_table_drops_empty_entries(struct kunit *test)
+{
+	static const struct e820_entry in[] = { E(0, 1, RAM), E(5, 0, RAM), E(2, 1, RESERVED) };
+	static const struct e820_entry exp[] = { E(0, 1, RAM), E(2, 1, RESERVED) };
+
+	CHECK_UPDATE(test, in, exp);
+}
+
+/* Converts rows like "__22__" to entries: column * 4K, run length * 4K, digit as type. */
+static void __init art_to_entries(const char * const *rows, u32 nrows, struct e820_entry *out)
+{
+	u32 i, start, end;
+
+	for (i = 0; i < nrows; i++) {
+		start = 0;
+		while (rows[i][start] == '_')
+			start++;
+		end = start;
+		while (rows[i][end] && rows[i][end] == rows[i][start])
+			end++;
+		out[i].addr = (u64)start * SZ_4K;
+		out[i].size = (u64)(end - start) * SZ_4K;
+		out[i].type = rows[i][start] - '0';
+	}
+}
+
+/* The example from the comment above e820__update_table(). */
+static void __init update_table_documented_example(struct kunit *test)
+{
+	static const char * const in_rows[] = {
+		"____22__________________",
+		"______________________4_",
+		"____1111________________",
+		"_44_____________________",
+		"11111111________________",
+		"____________________33__",
+		"___________44___________",
+		"__________33333_________",
+		"______________22________",
+		"___________________2222_",
+		"_________111111111______",
+		"_____________________11_",
+		"_________________4______",
+	};
+	static const char * const out_rows[] = {
+		"1_______________________",
+		"_44_____________________",
+		"___1____________________",
+		"____22__________________",
+		"______11________________",
+		"_________1______________",
+		"__________3_____________",
+		"___________44___________",
+		"_____________33_________",
+		"_______________2________",
+		"________________1_______",
+		"_________________4______",
+		"___________________2____",
+		"____________________33__",
+		"______________________4_",
+	};
+	struct e820_entry in[ARRAY_SIZE(in_rows)], exp[ARRAY_SIZE(out_rows)];
+
+	art_to_entries(in_rows, ARRAY_SIZE(in_rows), in);
+	art_to_entries(out_rows, ARRAY_SIZE(out_rows), exp);
+	CHECK_UPDATE(test, in, exp);
+}
+
+/*
+ * If the result does not fit, the table is cut at its capacity. This
+ * documents the current behaviour.
+ */
+static void __init update_table_full_table_truncates(struct kunit *test)
+{
+	struct e820_table *t = kunit_kzalloc(test, sizeof(*t), GFP_KERNEL);
+	u32 i;
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, t);
+
+	t->entries[0] = (struct e820_entry)E(0, 2 * E820_MAX_ENTRIES, RAM);
+	for (i = 1; i < E820_MAX_ENTRIES; i++) {
+		t->entries[i].addr = PG(2 * i - 1);
+		t->entries[i].size = PG(1);
+		t->entries[i].type = E820_TYPE_RESERVED;
+	}
+	t->nr_entries = E820_MAX_ENTRIES;
+
+	KUNIT_EXPECT_EQ(test, e820__update_table(t), 0);
+	KUNIT_ASSERT_EQ(test, t->nr_entries, (u32)E820_MAX_ENTRIES);
+	for (i = 0; i < E820_MAX_ENTRIES; i++) {
+		KUNIT_EXPECT_EQ_MSG(test, t->entries[i].addr, PG(i), "entry %u addr", i);
+		KUNIT_EXPECT_EQ_MSG(test, t->entries[i].size, PG(1), "entry %u size", i);
+		KUNIT_EXPECT_EQ_MSG(test, (u32)t->entries[i].type,
+				(u32)(i % 2 ? E820_TYPE_RESERVED : E820_TYPE_RAM),
+				"entry %u type", i);
+	}
+}
+
+static void __init range_update_covered(struct kunit *test)
+{
+	static const struct e820_entry in[] = { E(1, 4, RAM) };
+	static const struct e820_entry exp[] = { E(1, 4, RESERVED) };
+
+	check_range_update(test, in, ARRAY_SIZE(in), PG(0), PG(16),
+			E820_TYPE_RAM, E820_TYPE_RESERVED, PG(4), exp, ARRAY_SIZE(exp));
+}
+
+/* The new range is inside the entry: it is split, new pieces go to the end. */
+static void __init range_update_split(struct kunit *test)
+{
+	static const struct e820_entry in[] = { E(1, 4, RAM) };
+	static const struct e820_entry exp[] = { E(1, 1, RAM), E(2, 1, RESERVED), E(3, 2, RAM) };
+
+	check_range_update(test, in, ARRAY_SIZE(in), PG(2), PG(1),
+			E820_TYPE_RAM, E820_TYPE_RESERVED, PG(1), exp, ARRAY_SIZE(exp));
+}
+
+static void __init range_update_head(struct kunit *test)
+{
+	static const struct e820_entry in[] = { E(1, 4, RAM) };
+	static const struct e820_entry exp[] = { E(3, 2, RAM), E(1, 2, RESERVED) };
+
+	check_range_update(test, in, ARRAY_SIZE(in), PG(0), PG(3),
+			E820_TYPE_RAM, E820_TYPE_RESERVED, PG(2), exp, ARRAY_SIZE(exp));
+}
+
+static void __init range_update_tail(struct kunit *test)
+{
+	static const struct e820_entry in[] = { E(1, 4, RAM) };
+	static const struct e820_entry exp[] = { E(1, 3, RAM), E(4, 1, RESERVED) };
+
+	check_range_update(test, in, ARRAY_SIZE(in), PG(4), PG(4),
+			E820_TYPE_RAM, E820_TYPE_RESERVED, PG(1), exp, ARRAY_SIZE(exp));
+}
+
+/* No overlap, or a different old type: nothing changes. */
+static void __init range_update_no_match(struct kunit *test)
+{
+	static const struct e820_entry in[] = { E(1, 4, RAM) };
+
+	check_range_update(test, in, ARRAY_SIZE(in), PG(8), PG(1),
+			E820_TYPE_RAM, E820_TYPE_RESERVED, 0, in, ARRAY_SIZE(in));
+	check_range_update(test, in, ARRAY_SIZE(in), PG(0), PG(16),
+			E820_TYPE_ACPI, E820_TYPE_RESERVED, 0, in, ARRAY_SIZE(in));
+}
+
+/* A size that would wrap around is cut at the end of the address space. */
+static void __init range_update_clamps_size(struct kunit *test)
+{
+	static const struct e820_entry in[] = {
+		{ .addr = ULLONG_MAX - 0xffff, .size = 0xffff, .type = E820_TYPE_RAM },
+	};
+	static const struct e820_entry exp[] = {
+		{ .addr = ULLONG_MAX - 0xffff, .size = 0xffff, .type = E820_TYPE_RESERVED },
+	};
+
+	check_range_update(test, in, ARRAY_SIZE(in), ULLONG_MAX - 0xffff, ULLONG_MAX,
+			E820_TYPE_RAM, E820_TYPE_RESERVED, 0xffff, exp, ARRAY_SIZE(exp));
+}
+
+static void __init range_update_several_entries(struct kunit *test)
+{
+	static const struct e820_entry in[] = { E(0, 1, RAM), E(2, 1, RAM), E(4, 1, ACPI) };
+	static const struct e820_entry exp[] = { E(0, 1, NVS), E(2, 1, NVS), E(4, 1, ACPI) };
+
+	check_range_update(test, in, ARRAY_SIZE(in), PG(0), PG(8),
+			E820_TYPE_RAM, E820_TYPE_NVS, PG(2), exp, ARRAY_SIZE(exp));
+}
+
+static struct kunit_case __refdata e820_test_cases[] = {
+	KUNIT_CASE(update_table_too_few),
+	KUNIT_CASE(update_table_overflow),
+	KUNIT_CASE(update_table_unsorted_disjoint),
+	KUNIT_CASE(update_table_nested_higher_type),
+	KUNIT_CASE(update_table_partial_overlap),
+	KUNIT_CASE(update_table_lower_type_absorbed),
+	KUNIT_CASE(update_table_merges_same_type),
+	KUNIT_CASE(update_table_duplicates),
+	KUNIT_CASE(update_table_adjacent_types),
+	KUNIT_CASE(update_table_no_merge_pram_soft_reserved),
+	KUNIT_CASE(update_table_drops_empty_entries),
+	KUNIT_CASE(update_table_documented_example),
+	KUNIT_CASE(update_table_full_table_truncates),
+	KUNIT_CASE(range_update_covered),
+	KUNIT_CASE(range_update_split),
+	KUNIT_CASE(range_update_head),
+	KUNIT_CASE(range_update_tail),
+	KUNIT_CASE(range_update_no_match),
+	KUNIT_CASE(range_update_clamps_size),
+	KUNIT_CASE(range_update_several_entries),
+	{}
+};
+
+static struct kunit_suite e820_test_suite = {
+	.name = "e820",
+	.test_cases = e820_test_cases,
+};
+kunit_test_init_section_suite(e820_test_suite);
-- 
2.56.1

