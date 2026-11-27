Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.29.242.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795767167;
	b=X736m7SEioM6OONzqpe3k/1i8N2o9TQkWQVK1spPgbfes9GgYfNMbntqG6XhkoT+ku/h
	 8X16wirrNtObwF38QX6rYJ+vdwkCGLK5d9xgbk2cbkkN9xKAIr+r0pnoEMptVU8f9THNP
	 QKT1Y8pcZ9iz6o/Ww++SHX7AFogz6vBuwI6kgeDtzoc0bjM3ffqd6FQ+w6ZnCvwqddoR0
	 vehkUSdmELbb4JIwG9EwtzvvZaCGU8WBQHNcEy834HVMGuLmZbgV4PrWC0EUIDZm1XM1q
	 8ft+klZ5eKwEMrO1V1jM6Vw1R4OXcXsOIiyJ45zIj3n/BcvKpo7iUdOWZTJXJOJE/mQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795767167;
	h=DMARC-Filter:DKIM-Signature:Received:X-Spam-Checker-Version:
	 X-Spam-Level:X-Spam-Status:DKIM-Signature:Received:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=UVp50XBywV99FACSVt9cm51aFsFHhx5d/a2cQJcC4Ug=;
	b=btcVhlqbf9MP/5SzKBVTEz8BKTO5/V9mBIh/4ZVKKjP5aM335APUHxv5ib/q4UBcrxdK
	 6d2/qoFu9NigCip9LIAYeNMWVkX4JdYWBQ0vYxHZ1rwDYsDNo+djnGIyVVgcKnx4jNXmr
	 KiWzmmdyIVmym6edQoGkrukgyHFxX72qC2xjpxfIGWe/HSRtPvaQN8yKUKrKUhuMgQ9vx
	 EysJ3tlInRtTpw1aE5Ttsnp0UECPgIPXAEcZh/ZwPCUOTiYoy8gdPb2klcrnZLHKJ3tTk
	 IzZRxZ24yClscxl95pCvKpgK7zUUveDXsBQk/9EHmlpaehAwOT7nQCrX2x1gVJW8ZUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=davidgow.net;
	spf=pass smtp.mailfrom=davidgow.net;
	dkim=pass header.d=davidgow.net header.i=@davidgow.net header.a=rsa-sha256 header.s=201606 header.b=oLEmPrB6;
	dkim=pass header.d=davidgow.net header.i=@davidgow.net header.a=rsa-sha256 header.s=201606 header.b=EqXHbfIo;
	arc=none smtp.remote-ip=203.29.242.92
Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D02E606A31C;
	Fri, 27 Nov 2026 08:12:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D02E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=davidgow.net header.i=@davidgow.net header.a=rsa-sha256 header.s=201606 header.b=oLEmPrB6;
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.a=rsa-sha256 header.s=201606 header.b=EqXHbfIo
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1795767164;
	bh=6QV2+MTDL5qJCAiu5Ap8b8zmPUof06wxJb4TGreoSr8=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=oLEmPrB6KIruFGK4sqp9oo1Vt1u5teW9zlYoXFReIXVTyL1PZA5oVSRPMBcYP/t7a
	 5KRkUVXIR4IELi2iyW9+XXtIG5LuVNzCR1AezFS5zZ3nr5IrQs2juW8elV5+vlnq/w
	 cCVPUx0+2T2h6Y6NGLEWEPPx0/0Lm3cxKsFfs7rXzPez9YHYa0NNsExCm4dTY+dDLl
	 gxq0l+wNE4SK2w7CLnwmiv4ToAPjEZAtNazHimp4K9HAKwkgdDN2RY8pCUiBOCsUbf
	 nFz+opkrCNQbunwD+q5I7PR3jY+amAdoOybVTNAykPS40pQvHaqYAJ3te4AI9OxaV/
	 MBQl55QJYZbQLYI2M3ch8OzaMsH3gNrbRYBq1UkbC4bexsCXJ9OiQeo/22lfkTDVqT
	 4z8aHlIh0eR+xBef1zjXdEjhxYFr2sHVt2IqP75teA47fJnLqbhMmq6MtMtdntG6gz
	 YG5TzOJH8bpjOxlqcoqx77f9GHLZPANdKmGbJzJ8y2xmlpnW2AdKMxvXTHpk7pSSvR
	 Z17DHTRNvb6I6Wk0Um2oCxq/GzSVGTtWqW2dtGKEJN1hoeEajFSA1eQRyhCtWJyUkB
	 C4/D5eXGnmsreH+KtlCPAjxS0Jdj8T1O+t0LiybnJkVAQ2XIMyuY2RFKDMxVDWW4j5
	 I19xwWr1pI16D/c1ksNfjmsc=
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id B708E1EADE3; Fri, 27 Nov 2026 16:12:44 +0800 (AWST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1795767161;
	bh=6QV2+MTDL5qJCAiu5Ap8b8zmPUof06wxJb4TGreoSr8=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=EqXHbfIoybMo50TL0qLBb84jz2aV7+eMKoxgJdY/UAfFlvI2x2V0gAPPxHR9aC65f
	 hdxYRnhvFpLHRVOApK7tZ2TJuv+LS0PWQ2aDSHLRdTT82irxpl3Xzdn11ngSVxJU1t
	 2v/C1MHkIISDds6EiaaKvcPe9Z7qmNWMGqTdudE5g7THV5/usjcznzzoSEbwnxtYDc
	 hczgL4/ssqdM+jal+ER2nd2VXHyX5M0YOk39wT2lCYlFQ4oBexY80iCL5osMTRV8CG
	 ibxP0E9JXy+MjZLxT1a55PHsm59H9l5rOCDaBHp7pG0b/J6MzqX0MuJxxpPmA9Z3lQ
	 TmamriaHze0V/34UgPd0bEs5VoxOBoEDTWMxSIM5nc56IVU+PS2JtChUFN9eu2WyAP
	 SJdJ+Qn/ISg15GbSpBwxkjvMj34FE4gDsYHK5+Xug5ooEllRwrsHulRW7aTGwGnUpe
	 kb4rtJUq/DvwEg7/EUzxkkRV4WAHOg237Y6NrNXiAORpcAiedpawB2thsuAo1mPA7P
	 CFTdwBBCxVYT1gTVAfW0e+U4sYeZ9wzgRxowiLExjgvKeL3ITgaa6EQda/NrwGjhov
	 UKaUWy1jK7AcU2c7JZOXQGgRwiFoz+yumfF/fWKxrxhdnFxDRkTa0XyPrrJEgYM/U8
	 NujQcSefkpilzYGNVQM+ccas=
Received: from shelley.lan (unknown [IPv6:2001:8003:8802:7000::41b])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 40FB31EADC9;
	Fri, 27 Nov 2026 16:12:41 +0800 (AWST)
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
Subject: Re: [PATCH] x86/e820: Add KUnit tests for table sanitizing and
 range update
From: David Gow <david@davidgow.net>
To: Andrey Zakharov <dedemorow@gmail.com>
Cc: tglx@kernel.org, mingo@redhat.com, bp@alien8.de, 
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
 david@davidgow.net, raemoar63@gmail.com, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
In-Reply-To: <20261126223400.1549478-1-dedemorow@gmail.com>
References: <20261126223400.1549478-1-dedemorow@gmail.com>
Date: Fri, 27 Nov 2026 16:12:25 +0800
Message-Id: <179576714578.1671685.15482503905360730523.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6841; i=david@davidgow.net;
 h=from:subject:message-id; bh=6QV2+MTDL5qJCAiu5Ap8b8zmPUof06wxJb4TGreoSr8=;
 b=owEBiQJ2/ZANAwAIAcYipzoZDNtCAcsmYgBrCTt1koUFcFQA8vSqtSzRVYhyJT57Me/7adu+R
 tOB9wlzTFSJAk8EAAEIADkWIQSmmTCaqhqZOsxDGC7GIqc6GQzbQgUCawk7dRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQxiKnOhkM20KOYBAAnP1VxvPNZyPKA2l68Kc/vK5iM5Guzlf
 tl2rpqHeBfsykoecjk4T5KPgm+a+ANk9B0LnurZcRcx6fRC5UdQBkUmFMoWPTxvPjxnOaWSqXSF
 oAV3sSyLVZjOmuinXG27ym8oVx5EmyhXoHgTZvsWGphYWS1HB9qUHPIvEzDP7BjgTT4z7J3BPDT
 u+XjXJphNNBPxKSR6MAEV9BNGhe6yDT1GbqvvGLEzbxsy/Vgrsqpa48vP2cjkz2lzgbQHXerv1F
 OAK0JYQ9MTm+V194ulYQ+cGeKNaCZqU7mTaa9eyRe7Y+9B8Vn++9qRxo2XT5/d+4A5xoNOFChnN
 MoCMF5gwjrk8R49OPaZ8QzorCQiL6RuaQzAEcc9RLgHbzaridiQq3dcSdbd0jAYtBHfOHyNdWDQ
 aZgZbKPXH8kjkDUxe5bwn5Et6YMz8GeeyXqZ1NCexdHrm56TWYwQ84X7DstO1chp1hv56MRgKSM
 4cXXlEtxbQ7l7I06IQjlmaS03BB82RMh9Ior8oEKrl5qLTpZZsUdqBOmS1BkuYFUiJpqc4fhcki
 L2g2nqTFCntwRhWvZ+c5ukvmGfKmqUs1PxjuUMsQM4KZSO2heiwBc0nhVjPhdsHbrm9fszEkEjU
 1m2QwtVFihDs6fWw2EJdjlMAPpEPvK22ZBnuoz3/MUZviirAUAoU=
X-Developer-Key: i=david@davidgow.net; a=openpgp;
 fpr=3B0A53B1D9DF6AAC59C230322A821C5AD66AB03F

> There are no KUnit tests under arch/x86, and I could not find any other
> tests of the E820 table code. e820__update_table() sorts a table, resolves
> overlaps in favour of the higher type, merges neighbours of the same
> type and stops when the table is full. e820__range_update_table()
> changes the type of a range and may split an entry. Both take the table
> as an argument, so they can be tested on a table of the test's own,
> without touching the memory map of the running kernel.
> 
> Add 20 test cases. For e820__update_table(): too few entries and an
> entry that wraps around (both return -1 and leave the table alone),
> unsorted input, nested and partial overlaps, merging of equal types,
> types that must not be merged (PRAM and SOFT_RESERVED), zero-size
> entries, the sample map from the comment above the function, and a
> full table. For e820__range_update_table(): a range covering an entry,
> splitting an entry, head and tail, no match, a size that would wrap
> around, and several entries at once.
> 
> Both functions are __init, so the suite is registered with
> kunit_test_init_section_suite() and runs during boot, before init
> memory is freed. It can only be built in: X86_E820_KUNIT_TEST depends
> on KUNIT=y.
> 
> Tested: built with gcc 16.2.1 and run with kunit.py (CONFIG_KUNIT=y and
> CONFIG_X86_E820_KUNIT_TEST=y) under QEMU (TCG, on top of
> next-20261126): 20 of 20 pass, and 20 of 20 with --arch=i386. To
> check that the tests can fail, I
> changed e820.c temporarily in three ways, one at a time: always
> starting a new entry at a change point (4 tests fail), setting the
> wrong new start when cutting the head of an entry in
> __e820__range_update() (1 fails), and swapping the order of range
> start and end at equal addresses in cpcompare() (1 fails). None of
> these changes is part of this patch.
> 
> Not tested: a full build with KUNIT_ALL_TESTS (I only checked that it
> selects the option), other values of MAX_NUMNODES, real hardware.
> 
> Signed-off-by: Andrey Zakharov <dedemorow@gmail.com>
>

This looks great for me from a KUnit point of view, and it passes here.

I do think there'd be some benefit going forward to extending this to cover
other parts of the e820 handling code: in particular the code for putting
the e820 memory map together from different BIOS memory maps. That's
the area which has had any issues I've hit.

This is definitely something for a separate follow-up patch, though, not a
reason to reject this as-is. I did do a quick hack for what it could look like
to use KUnit stubs and resources to intercept changes to the real e820 table.
If there's interest and I have time, I can polish it up:
--8<--
diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
index 0967b485f38b..a74e342d911b 100644
--- a/arch/x86/kernel/e820.c
+++ b/arch/x86/kernel/e820.c
@@ -16,6 +16,9 @@
 #include <linux/sort.h>
 #include <linux/kvm_types.h>
 
+#include <kunit/static_stub.h>
+#include <kunit/visibility.h>
+
 #include <asm/e820/api.h>
 #include <asm/setup.h>
 
@@ -162,7 +165,7 @@ int e820__get_entry_type(u64 start, u64 end)
 /*
  * Add a memory region to the kernel E820 map.
  */
-__init static void __e820__range_add(struct e820_table *table, u64 start, u64 size, enum e820_type type)
+__init VISIBLE_IF_KUNIT void __e820__range_add(struct e820_table *table, u64 start, u64 size, enum e820_type type)
 {
 	u32 idx = table->nr_entries;
 	struct e820_entry *entry_new;
@@ -181,6 +184,7 @@ __init static void __e820__range_add(struct e820_table *table, u64 start, u64 si
 
 	table->nr_entries++;
 }
+EXPORT_SYMBOL_IF_KUNIT(__e820__range_add);
 
 __init void e820__range_add(u64 start, u64 size, enum e820_type type)
 {
@@ -446,7 +450,7 @@ __init int e820__update_table(struct e820_table *table)
  *
  * Sanity-check it while we're at it..
  */
-__init static int append_e820_table(struct boot_e820_entry *entries, u32 nr_entries)
+__init VISIBLE_IF_KUNIT int append_e820_table(struct boot_e820_entry *entries, u32 nr_entries)
 {
 	struct boot_e820_entry *entry = entries;
 
@@ -471,6 +475,7 @@ __init static int append_e820_table(struct boot_e820_entry *entries, u32 nr_entr
 	}
 	return 0;
 }
+EXPORT_SYMBOL_IF_KUNIT(append_e820_table);
 
 __init static u64
 __e820__range_update(struct e820_table *table, u64 start, u64 size, enum e820_type old_type, enum e820_type new_type)
diff --git a/arch/x86/kernel/e820_kunit.c b/arch/x86/kernel/e820_kunit.c
index efd0323bcfc8..be593fe6d0ec 100644
--- a/arch/x86/kernel/e820_kunit.c
+++ b/arch/x86/kernel/e820_kunit.c
@@ -9,6 +9,9 @@
  * The layouts are written in units of one 4K page.
  */
 #include <kunit/test.h>
+#include <kunit/test-bug.h>
+#include <kunit/static_stub.h>
+#include <kunit/visibility.h>
 #include <linux/init.h>
 #include <linux/limits.h>
 #include <linux/sizes.h>
@@ -337,6 +340,34 @@ static void __init range_update_several_entries(struct kunit *test)
 			E820_TYPE_RAM, E820_TYPE_NVS, PG(2), exp, ARRAY_SIZE(exp));
 }
 
+
+__init VISIBLE_IF_KUNIT void __e820__range_add(struct e820_table *table, u64 start, u64 size, enum e820_type type);
+static void __init fake_e820_range_add(u64 start, u64 size, enum e820_type type)
+{
+	struct kunit *test = kunit_get_current_test();
+	struct kunit_resource *e820_resource = kunit_find_named_resource(test, "e820_table");
+	struct e820_table *table = (struct e820_table *)e820_resource->data;
+
+	__e820__range_add(table, start, size, type);
+
+	kunit_put_resource(e820_resource);
+}
+
+static struct kunit_resource e820_resource;
+__init VISIBLE_IF_KUNIT int append_e820_table(struct boot_e820_entry *entries, u32 nr_entries);
+static void __init append_e820_table_empty(struct kunit *test)
+{
+	struct e820_table *empty_table = new_table(test, NULL, 0);
+	KUNIT_ASSERT_EQ(test, kunit_add_named_resource(test, NULL, NULL, &e820_resource, "e820_table", empty_table), 0);
+	kunit_get_resource(&e820_resource);
+	kunit_activate_static_stub(test, e820__range_add, fake_e820_range_add);
+
+	/* Ensure an empty table doesn't get updated. */
+	KUNIT_EXPECT_EQ(test, append_e820_table(NULL, 0), -ENOENT);
+	KUNIT_EXPECT_EQ(test, empty_table->nr_entries, 0);
+
+}
+
 static struct kunit_case __refdata e820_test_cases[] = {
 	KUNIT_CASE(update_table_too_few),
 	KUNIT_CASE(update_table_overflow),
@@ -358,6 +389,7 @@ static struct kunit_case __refdata e820_test_cases[] = {
 	KUNIT_CASE(range_update_no_match),
 	KUNIT_CASE(range_update_clamps_size),
 	KUNIT_CASE(range_update_several_entries),
+	KUNIT_CASE(append_e820_table_empty),
 	{}
 };
 
-->8--

Regardless, this looks pretty good as-is to me.

Reviewed-by: David Gow <david@davidgow.net>

Cheers,
-- David

-- 
David Gow <david@davidgow.net>
