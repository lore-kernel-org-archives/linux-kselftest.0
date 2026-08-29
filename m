Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB9A37F8AF
	for <linux-kselftest@vger.kernel.org>; Sat, 29 Aug 2026 09:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787995232; cv=none; b=AFOKR1hojrdaB/WQXKPCXOGow9hOjAHu+8WJ01rgbqfSsmu7UA6D1VTt3EiqOe1uV0gP9bcJ2cCgHQWf9kzWH72hG3pKX1ww8vfqZt5/O5kQEl3vmKfb7P0zPqkwJcrV/Key2MsdHUbxiyCRkkFQvSv8gEy/iwYp1+OgQOIRDWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787995232; c=relaxed/simple;
	bh=6xB3Jge7LArgZShSPxVIn+W+Gb3KQ8XI4Vfm6TKvBqM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bpkNUwK+1nX4XJMoQj1va1o9Th+nYjc2HX1hE/BZowNtLFctvWsy97LU5nDybuu8NC8y9r+nFX+2ar7XHYaKDQ7JT//U2z3ubtSENlvxYDdVSo4Uo7Ss2Sdg5VdHIWD+yharTCMZ12HknxganiORUB7Q4qKAI4Ymoq7ewm4gtWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qK33L+Pz; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qK33L+Pz"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso18018265e9.1
        for <linux-kselftest@vger.kernel.org>; Sat, 29 Aug 2026 02:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787995229; x=1788600029; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TYT9XbnSth8ElP68C5cM1zVyZdxbC9TKhXrTevWufdw=;
        b=qK33L+Pzsr/wdT7gA79Jq03PHfJdCk/rYkcMkaYx4QwLxBgV3luWavzuOPbtxpsmjG
         EA69oplpajb8d2uLl7guL1uHCC9oiZW4gP0nNaAHi+CEMISfl0Kw5YmMdGUz/dTvSoFb
         MC4qq1Yc57aKlhnwBslktfVDvGBSSITzJAoIayY7RMliQRU38SPfV005CWWEyiygrwo1
         fsbXaCHaSWo+hWNVlrj4nFQdqRSPn1FvsuvJcZLrMEb5yHF9NRTXHmaMNIjfeJOGfZj2
         sgtgZ5woBcZ5rM4akd4I8mKKuput/f7kXRXYXuNRhlXJb29pop8TfmQO0EjQTtARAv+6
         wo7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787995229; x=1788600029;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TYT9XbnSth8ElP68C5cM1zVyZdxbC9TKhXrTevWufdw=;
        b=hcgmoke/aBrbbGYaIbmBqW9HnApI2w17M9x3Vp/Q9pMoGK+YnvDEYW7RQNAZ2/mFbX
         eL9fYxDgXJOfkfAlyuEdpbfiwhdlqvyeWbjgy2ae9Er6NV3AAijM4dq1ktbK1+sqDbrm
         e75PfQyD3v0fmIHjcvrrHz5qQY6D4OFo/mIN+8N9JyRTZYliSmWu77ptzH24EPG2iXqw
         eZK8L8Pk74enDVKJv3/P8d5r+QkpITLC0dcZbeXuPH9gWFiAlmUNKl7bUJSqbwXcJlmE
         DCRpD1YmvCfU95+1lkE0WZnhR2Jx5ENKDfyswX807TTPnNohLctyMhCO5Ap6vTILjx/C
         DAsw==
X-Forwarded-Encrypted: i=1; AHgh+Rq6yxQwTDycqiiyJqRph06XQTEYLTnmZH6G+HtVgvzbdu/hFd+ImU2UFNLakEZ6VIr19HdXZ6JPT1vlzW9VArE=@vger.kernel.org
X-Gm-Message-State: AFuF++n1mh213vWky1GTySow9zB13S6FtkeiZ9esC2JqBwwytKLT7xQW
	jR50Tsl+EzD9r++Vr03o4/l9L5yrAS6h8tnigHU/fhf3qtBDfnUSwhVz
X-Gm-Gg: AR+sD11qfeTjCvJl8wVc8yN0FEeCbPFBhR5QpvoaH8h2echpHI7JaUCcsiNgt1ihUK4
	m+tVY2zUIl8f1fz6oIg005MMN4xz1m6jGGv70WX5jrd5UAg0Eou35Wyd/e9YIk58KvZSdg/SLl0
	hkyFEZ48zw3lTrLwf7UEKh9vcaaSC0mcl0BYmHCdSc434fxbnLbPn3JqFbGL8hPA9IzrBHbEwi4
	6ai42b1QxUGWtR9YwxhG9yqCDxYgrFkCNPuN2MvUlWjGp3MbxtF8Hna+igq48bIrCKmklSrL3qF
	q5eLS1nNDuSStQMwoOc5N/uY0ZOzgOZHUqHRUxX6IgwKPHTRKCY9W0OYm0h/G61ZXtokYYQV4/Z
	m1xrlJ7XgGqEEUzaNkAiYmjbTOalemN0DVA3mZt4uJbV/i9xeI/zYcA4ofq/3TeNgj7VMK5yivM
	/q6bh5pgD6jUovq4UQ5YbX6fvhywQ4Bf7KjSme6uumUddQzoV4lkPnEpjosHP0V/fLTl/apzRjV
	4m5EWvqiPsjVqcgGgccxUC97TD1RS9j7FZ5YmFGqHD4CNa+dRHGJJ9j+UGRpBoxbZ+YlQRF1/PM
	9ljK6/lVzAA6OlGXvVls
X-Received: by 2002:a05:600c:1908:b0:49b:9113:e03c with SMTP id 5b1f17b1804b1-49b91c26365mr146312215e9.8.1787995228439;
        Sat, 29 Aug 2026 02:20:28 -0700 (PDT)
Received: from localhost.localdomain (dynamic-077-007-015-136.77.7.pool.telefonica.de. [77.7.15.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b91c510c9sm80468505e9.0.2026.08.29.02.20.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 29 Aug 2026 02:20:28 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Haren Myneni <haren@us.ibm.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Dan Streetman <ddstreet@ieee.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/3] lib/842: add KUnit tests for the decompressor
Date: Sat, 29 Aug 2026 11:18:51 +0200
Message-Id: <e9659617ce2f1466f227d562f47b961f340ab3c7.1787978627.git.kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <cover.1787978627.git.kmehltretter@gmail.com>
References: <cover.1787978627.git.kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add table-driven tests for the 842 decompressor's output and history
validation.

Three malformed streams cover an indexed copy larger than the remaining
output, short data larger than the remaining output, and a repeat after
fewer than eight output bytes. Every case checks the return value, output
length and fixed guard bands on both sides of the output. Successful cases
also check complete contents from a poison-filled destination. The repeat
vector's CRC includes the leading guard byte, so the unfixed decoder
successfully validates the CRC after reading before the buffer.

Three valid streams cover the same boundaries at equality: an I8 index
consuming the final eight bytes, five short-data bytes consuming the final
five, and a repeat with exactly one block of history.

On an unmodified baseline the malformed cases fail and the boundary cases
pass; with the preceding fixes all six pass.

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Review notes:

  - CONFIG_842_DECOMPRESS_KUNIT_TEST=m selects 842_DECOMPRESS=m.
  - A fixed x86_64 CONFIG_PROVE_LOCKING=y run passes all six cases without
    a lockdep report.

 MAINTAINERS                      |   1 +
 lib/Kconfig.debug                |  15 ++++
 lib/tests/842_decompress_kunit.c | 144 +++++++++++++++++++++++++++++++
 lib/tests/Makefile               |   1 +
 4 files changed, 161 insertions(+)
 create mode 100644 lib/tests/842_decompress_kunit.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 98c528c99917a..4456261cf5ea4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12459,6 +12459,7 @@ F:	drivers/crypto/nx/Makefile
 F:	drivers/crypto/nx/nx-842*
 F:	include/linux/sw842.h
 F:	lib/842/
+F:	lib/tests/842_decompress_kunit.c
 
 IBM Power in-Nest Crypto Acceleration
 M:	Breno Leitão <leitao@debian.org>
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 134b15a44625e..48201092b3df6 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2225,6 +2225,21 @@ menuconfig RUNTIME_TESTING_MENU
 
 if RUNTIME_TESTING_MENU
 
+config 842_DECOMPRESS_KUNIT_TEST
+	tristate "KUnit tests for the 842 decompressor" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	select 842_DECOMPRESS
+	default KUNIT_ALL_TESTS
+	help
+	  Enable stream-validation and boundary tests for the software 842
+	  decompressor. The tests exercise indexed copies, short data and
+	  repeat operations at valid and invalid output or history boundaries.
+
+	  For more information on KUnit and unit tests in general, refer to
+	  Documentation/dev-tools/kunit/.
+
+	  If unsure, say N.
+
 config TEST_DHRY
 	tristate "Dhrystone benchmark test"
 	help
diff --git a/lib/tests/842_decompress_kunit.c b/lib/tests/842_decompress_kunit.c
new file mode 100644
index 0000000000000..11202ba9539bc
--- /dev/null
+++ b/lib/tests/842_decompress_kunit.c
@@ -0,0 +1,144 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <kunit/test.h>
+#include <linux/sw842.h>
+
+#define SW842_GUARD_SIZE	8
+#define SW842_MAX_OUTPUT	16
+#define SW842_GUARD_BYTE	0x42
+#define SW842_OUTPUT_POISON	0x5a
+
+/* ZEROS, I8(0), END, CRC32. */
+static const u8 sw842_index_exact_fit[] = {
+	0xe6, 0x40, 0x3c, 0x00, 0x00, 0x00, 0x00,
+};
+
+/* D8(eight zero bytes), I8(0), END, CRC32. */
+static const u8 sw842_index_output_overflow[] = {
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x06, 0x40, 0x3c, 0x00, 0x00, 0x00, 0x00,
+};
+
+/* ZEROS, SHORT_DATA(01 02 03 04 05), END, CRC32. */
+static const u8 sw842_short_data_exact_fit[] = {
+	0xe7, 0x68, 0x08, 0x10, 0x18, 0x20,
+	0x2f, 0xa9, 0x67, 0xfc, 0x07, 0xc0,
+};
+
+/* ZEROS, SHORT_DATA(five zero bytes), END, CRC32. */
+static const u8 sw842_short_data_output_overflow[] = {
+	0xe7, 0x48, 0x07, 0x80, 0x00, 0x00, 0x00, 0x00,
+};
+
+/* ZEROS, REPEAT(one block), END, CRC32. */
+static const u8 sw842_repeat_exact_history[] = {
+	0xe6, 0xc0, 0xf0, 0x00, 0x00, 0x00, 0x00,
+};
+
+/*
+ * SHORT_DATA(seven zero bytes), REPEAT(one block), END, CRC32.
+ * CRC32 includes SW842_GUARD_BYTE copied from before output into byte 7.
+ */
+static const u8 sw842_repeat_without_full_history[] = {
+	0xef, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0xd8, 0x1e, 0x09, 0xa3, 0x1d, 0xd6,
+};
+
+static const u8 sw842_zero_output[SW842_MAX_OUTPUT];
+static const u8 sw842_short_data_output[] = {
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+	0x01, 0x02, 0x03, 0x04, 0x05,
+};
+
+struct sw842_decompress_test_case {
+	const char *name;
+	const u8 *compressed;
+	unsigned int compressed_len;
+	const u8 *expected_output;
+	unsigned int output_capacity;
+	int expected_ret;
+};
+
+#define SW842_DECOMPRESS_CASE(_name, _compressed, _compressed_len, _expected, \
+			      _capacity, _ret) \
+	{ \
+		.name = _name, \
+		.compressed = _compressed, \
+		.compressed_len = _compressed_len, \
+		.expected_output = _expected, \
+		.output_capacity = _capacity, \
+		.expected_ret = _ret, \
+	}
+
+static const struct sw842_decompress_test_case sw842_decompress_cases[] = {
+	SW842_DECOMPRESS_CASE("index_exact_fit", sw842_index_exact_fit,
+			      ARRAY_SIZE(sw842_index_exact_fit),
+			      sw842_zero_output, 16, 0),
+	SW842_DECOMPRESS_CASE("index_output_overflow",
+			      sw842_index_output_overflow,
+			      ARRAY_SIZE(sw842_index_output_overflow),
+			      sw842_zero_output, 8, -ENOSPC),
+	SW842_DECOMPRESS_CASE("short_data_exact_fit",
+			      sw842_short_data_exact_fit,
+			      ARRAY_SIZE(sw842_short_data_exact_fit),
+			      sw842_short_data_output,
+			      sizeof(sw842_short_data_output), 0),
+	SW842_DECOMPRESS_CASE("short_data_output_overflow",
+			      sw842_short_data_output_overflow,
+			      ARRAY_SIZE(sw842_short_data_output_overflow),
+			      sw842_zero_output, 8, -ENOSPC),
+	SW842_DECOMPRESS_CASE("repeat_exact_history",
+			      sw842_repeat_exact_history,
+			      ARRAY_SIZE(sw842_repeat_exact_history),
+			      sw842_zero_output, 16, 0),
+	SW842_DECOMPRESS_CASE("repeat_without_full_history",
+			      sw842_repeat_without_full_history,
+			      ARRAY_SIZE(sw842_repeat_without_full_history),
+			      sw842_zero_output, 15, -EINVAL),
+};
+
+KUNIT_ARRAY_PARAM_DESC(sw842_decompress, sw842_decompress_cases, name);
+
+static void sw842_decompress_test(struct kunit *test)
+{
+	const struct sw842_decompress_test_case *test_case = test->param_value;
+	u8 storage[SW842_GUARD_SIZE + SW842_MAX_OUTPUT + SW842_GUARD_SIZE];
+	u8 expected_guard[SW842_GUARD_SIZE];
+	u8 *output = storage + SW842_GUARD_SIZE;
+	unsigned int output_len = test_case->output_capacity;
+	int ret;
+
+	KUNIT_ASSERT_LE(test, test_case->output_capacity, SW842_MAX_OUTPUT);
+	memset(storage, SW842_GUARD_BYTE, sizeof(storage));
+	memset(expected_guard, SW842_GUARD_BYTE, sizeof(expected_guard));
+	memset(output, SW842_OUTPUT_POISON, test_case->output_capacity);
+
+	ret = sw842_decompress(test_case->compressed,
+			       test_case->compressed_len, output, &output_len);
+
+	KUNIT_EXPECT_EQ(test, ret, test_case->expected_ret);
+	/* Every successful case is an exact-fit boundary test. */
+	KUNIT_EXPECT_EQ(test, output_len,
+			test_case->expected_ret ? 0U : test_case->output_capacity);
+	if (!test_case->expected_ret)
+		KUNIT_EXPECT_MEMEQ(test, output, test_case->expected_output,
+				   test_case->output_capacity);
+	KUNIT_EXPECT_MEMEQ(test, storage, expected_guard, SW842_GUARD_SIZE);
+	KUNIT_EXPECT_MEMEQ(test, output + test_case->output_capacity,
+			   expected_guard, SW842_GUARD_SIZE);
+}
+
+static struct kunit_case sw842_decompress_test_cases[] = {
+	KUNIT_CASE_PARAM(sw842_decompress_test, sw842_decompress_gen_params),
+	{}
+};
+
+static struct kunit_suite sw842_decompress_test_suite = {
+	.name = "842-decompress",
+	.test_cases = sw842_decompress_test_cases,
+};
+
+kunit_test_suite(sw842_decompress_test_suite);
+
+MODULE_DESCRIPTION("Software 842 decompressor KUnit tests");
+MODULE_LICENSE("GPL");
diff --git a/lib/tests/Makefile b/lib/tests/Makefile
index 3cac3b63a7522..89ce3acad9c39 100644
--- a/lib/tests/Makefile
+++ b/lib/tests/Makefile
@@ -4,6 +4,7 @@
 
 # KUnit tests
 CFLAGS_bitfield_kunit.o := $(DISABLE_STRUCTLEAK_PLUGIN)
+obj-$(CONFIG_842_DECOMPRESS_KUNIT_TEST) += 842_decompress_kunit.o
 obj-$(CONFIG_BASE64_KUNIT) += base64_kunit.o
 obj-$(CONFIG_BITOPS_KUNIT) += bitops_kunit.o
 obj-$(CONFIG_BITFIELD_KUNIT) += bitfield_kunit.o
-- 
2.53.0
