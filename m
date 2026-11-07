Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794017258;
	b=oQ747xb5261f9e/Fudy2LQxEE+21/XDig9VCsHJ/fnfpq58p2WC4+g7Dg9RAnHeVPqeo
	 G77nyy6mh9nBWpa4rcR0xJr0+YfiX7vWJMtZdyK15Rd+8/eqwWYlII9tVrvEKBEtKxzYz
	 M0y4JShCzFOdzccqsx3LtCinCmKWXHg65mv2rjZHv3+lBNgu6nzuQc3d5XrHV44nt0BmF
	 iTmXGvQ/ONHSr/GoOIOBof8PatlxCTBifFcKfoc+jvKqIBResqPIV9FAklX4vq5Xeeih3
	 GglmQ8CIB8a/i2JPetqheN3ZViPeuxrD1XWtHxQwbQtRjEWorszUAsMKGmSGV9PxqeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794017258;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jgk8DixY24E26V4XJB1u3Oe+xB4rWD8lAtM07IEQQco=;
	b=ialLReE3HsFcO+l9r+lhIsEFvUBu/a9CNMDMgtjGxlES4kbvwokdTY6Xy93hsYM0AneQ
	 7lWCwDOV1JnrxbJ0vCedE6CsiJxdQhrYm5J4DNd87moETmUtft+CiZhSAYXNLR6nkVHET
	 qMeFionJ/ri0Cd+G1IDVtw72PKXmP2envQYsIFxXFLfooK0i9Cdk5cE7MEVMDTbxqbbsB
	 KBinG9nhdKThV5doC0XOHP2f9hjvhRy28pIX8xH09DJzu61o22HBGIH4InFjm9kdGOlzD
	 8AqfSZRsfucjZxlQF7nYk9ao9K59HarePrfgB3SUo+dTPUwFCOmMhJUIumQpnmvRa+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iqIjkgrr;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB529606A33F
	for <linux-kselftest@vger.kernel.org>; Sat,  7 Nov 2026 02:07:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB529606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iqIjkgrr
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-3678f64d078so1542337eec.1
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Nov 2026 18:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794017257; x=1794622057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jgk8DixY24E26V4XJB1u3Oe+xB4rWD8lAtM07IEQQco=;
        b=iqIjkgrrIeWYnDYr6CJUEONr/hXa3PS/Mw0hCaaNnIWr87/JSAZx3db1FnB1TQ/2F5
         ExH3Rchs3aN3OYdQAkl2H7uHyw3/hOllezc+eGHnVnuUpA/9+HAP6oSbsy1HQrdqLvJi
         j9a2V2iW0n2ygHpRO/mbvySvssF3maTHFv+whBSPgsXrwamFb568fMBuhWRZC+M0z8vN
         2TrbG4HSmjAeWGWAeIP0baYf2ZtapC9XQHQNbQAfkq5DD8WfW9Qwi9+UWTpMRxW9sWxA
         mta6IYCx2w+S94kU0CHOEXyXXWovSEWEji8Bd0J2BRKapg2IAcqp5s3B/U6flLbTNwWI
         fkmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794017257; x=1794622057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jgk8DixY24E26V4XJB1u3Oe+xB4rWD8lAtM07IEQQco=;
        b=AwerNL8s608nj+bnFbb1NT9eVfSj8oLdP6bnLdrYFXmNznXOCDGgkt/kWAmLelFaA1
         xCKgz9gSFI2G3K0LhYIt70AoVBQRXZ+ctkkeQQrM52EdPRFCQ+qJYY4Os/ronumyh+Tw
         LiS6u2Hp6Swk8hKySTTZFQYOXK27jlwL82PNaaBHIRtmJd3u+bKyf5HkfSzfkAHxite/
         P3Ki8rLGnAOgcP+C9KysNYjhlGLA2Lct3ZPTWGfoadCocJlKOF7rV8xz4N5iOSj5s7Pw
         8CUvMaPOR4a47SB3yPVnyW7tSkkPOlIZDT+ADyrN9f+cpV7Tdr6/apchg1aSVoFggzLD
         MLrQ==
X-Forwarded-Encrypted: i=1; AKwUvBwoTeojlH4W354hMQ0ZwYAll8Xkcws5mSzHXNS6yUH9vgvFHsztpuTlWkrlNBQb/LTytmr1WbdOiG63Cmr49/k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/I1BqsZ5bhARaG2LKMu2/XkukRgqsaGzaBVapuB9hI6wjub6QW
	2lPIiMoInidzeMo9uGVRqlrQeiQZ4vL4+0bouMSP9AZLkn8BX0qU69Rn
X-Gm-Gg: AYBFou26ompxj0R/MMVnThgWheFR1hC7X0b/RwbsBUevE7X9R54OC1FQSp94rmdn7tq
	SSTaDXW2Y0Qv4DWwLp7BRAGbaEiJ/tqERyprK9PR+vB4CeNuy1LGoCMJB+NffrtEGaUn5e4YuT9
	U59a/vdUPnta8VXM0JfEgHtdFk04teCWOO3j0muO7zMx9gI81pbfnQuHzzi10q1COTfN1RRtWKM
	Y/KwPrsW3Z5wrdGrIJT/FF+PXp0ryI3F/nBxLIvYTfbgDUvj/xb7dtJ8F5nvjSmrvBf6dx75YF4
	ncA2LYjt5oUidv+QyYb84edN6oLQCa7R//t6UxazDeAisEqfh9swJqP/JdRaFGm/TyR97Z/6buc
	I0khYC40ku9pqMp/jsm+mTAldtSXpnjjGGRbGete0TIdHzs/CGmxW9Zeqp5BHAnI09uKqz10Cap
	u1Rv1vX1MetW6FuaObb90b8Ca0ww1NPi3afpRRxKKT0OCnsg+30mhDnhNVZ5dj5gHpk10njARab
	IIkuPNGBp/FO2xEZeUaxa6l9MgIZpZ4jvT+egBGXVWUv8m0IdrfZjz2UyJ+RgKDXIZtMvfzWkPW
	MTp6Wzmcc+NET+VcMmZm3KlGfm1nfOJ5HjgweWgMKC6FHzs37wZVSTtMC+5ijGp/ilPm02uiRJs
	5HgyF4a8B0kYcSgVxCnkXVq6BCK9LGZV2XvBYRg==
X-Received: by 2002:a05:7022:f107:b0:1a9:c9fe:12c7 with SMTP id a92af1059eb24-1b25d305915mr4978473c88.9.1794017256653;
        Fri, 06 Nov 2026 18:07:36 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e485ce2sm9338497c88.7.2026.11.06.18.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:07:36 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: ast@kernel.org,
	bpf@vger.kernel.org
Cc: andrii@kernel.org,
	qmo@kernel.org,
	daniel@iogearbox.net,
	yonghong.song@linux.dev,
	eddyz87@gmail.com,
	ihor.solodrai@linux.dev,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH bpf-next v4 3/3] selftests/bpf: Cover enum signedness in data dumps and map fields
Date: Sat,  7 Nov 2026 02:07:25 +0000
Message-ID: <20261107020725.36675-4-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261107020725.36675-1-dennylin0707@gmail.com>
References: <20261107020725.36675-1-dennylin0707@gmail.com>
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

Exercise unsigned enum values with their high bit set and signed
controls through libbpf's data dumper. Include ordinary enums stored in
eight bytes and check that wider data cannot match an enumerator only
through its low 32 bits.

Extend bpftool_map_dump with BTF-backed array maps and check both JSON
and plain output. Cover narrow unsigned names, signed and unsigned
numeric output, wider ordinary enums and unmatched ENUM64 values.
Initialize map data at its actual width so the stored bytes match the
value width on big-endian hosts.

Also use an open-only arena skeleton to check an enum-backed map_extra
value with bit 31 set. The object is not loaded into the kernel, so the
test needs neither arena support nor mmap.

Suggested-by: Alexei Starovoitov <ast@kernel.org>
Acked-by: Quentin Monnet <qmo@kernel.org>
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
Changes in v4:
- Remove legacy-name and ambiguous narrow-alias cases, following the
  decision to rely on kflag.
- Add an open-only skeleton test for the map_extra parser.
- Remove four unrelated libbpf numeric-fallback cases.

 .../bpf/prog_tests/bpftool_map_dump.c         | 162 ++++++++++++++++++
 .../selftests/bpf/prog_tests/btf_dump.c       |  77 +++++++++
 .../selftests/bpf/prog_tests/map_extra.c      |  19 ++
 .../selftests/bpf/progs/test_map_extra.c      |  12 ++
 4 files changed, 270 insertions(+)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/map_extra.c
 create mode 100644 tools/testing/selftests/bpf/progs/test_map_extra.c

diff --git a/tools/testing/selftests/bpf/prog_tests/bpftool_map_dump.c b/tools/testing/selftests/bpf/prog_tests/bpftool_map_dump.c
index 187b3f784307..8002c24d02de 100644
--- a/tools/testing/selftests/bpf/prog_tests/bpftool_map_dump.c
+++ b/tools/testing/selftests/bpf/prog_tests/bpftool_map_dump.c
@@ -7,6 +7,7 @@
 
 #define PIN_PATH	"/sys/fs/bpf/test_bpftool_map_dump_sk_storage"
 #define QUEUE_PIN_PATH	"/sys/fs/bpf/test_bpftool_map_dump_queue"
+#define ENUM_PIN_PATH	"/sys/fs/bpf/test_bpftool_map_dump_enum"
 #define JSON_ERROR	"{\"error\":\"can't dump sk_storage map"
 
 /* An empty socket storage map with an int value. */
@@ -124,10 +125,171 @@ static void test_queue(void)
 	close(map_fd);
 }
 
+enum enum_dump_kind {
+	DUMP_ENUM_UNSIGNED,
+	DUMP_ENUM_SIGNED,
+	DUMP_ENUM64_UNSIGNED,
+	DUMP_ENUM64_SIGNED,
+};
+
+struct enum_dump_test {
+	const char *name;
+	enum enum_dump_kind kind;
+	__u32 size;
+	__u64 value;
+	const char *expected;
+};
+
+static const struct enum_dump_test enum_dump_tests[] = {
+	{ "enum_u8_name", DUMP_ENUM_UNSIGNED, 1, 0xff, "\"MAX\"" },
+	{ "enum_u8_unknown", DUMP_ENUM_UNSIGNED, 1, (__u64)-22, "234" },
+	{ "enum_u16_name", DUMP_ENUM_UNSIGNED, 2, 0xffff, "\"MAX\"" },
+	{ "enum_u16_unknown", DUMP_ENUM_UNSIGNED, 2, (__u64)-22, "65514" },
+	{ "enum_u32_high", DUMP_ENUM_UNSIGNED, 4, 0x80000000, "\"HIGH\"" },
+	{ "enum_u32_max", DUMP_ENUM_UNSIGNED, 4, 0xffffffff, "\"MAX\"" },
+	{ "enum_u32_unknown", DUMP_ENUM_UNSIGNED, 4, (__u64)-22, "4294967274" },
+	{ "enum_s8_name", DUMP_ENUM_SIGNED, 1, (__u64)-1, "\"NEG\"" },
+	{ "enum_s8_unknown", DUMP_ENUM_SIGNED, 1, (__u64)-22, "-22" },
+	{ "enum_s16_name", DUMP_ENUM_SIGNED, 2, (__u64)-1, "\"NEG\"" },
+	{ "enum_s32_name", DUMP_ENUM_SIGNED, 4, (__u64)-1, "\"NEG\"" },
+	{ "enum_s32_unknown", DUMP_ENUM_SIGNED, 4, (__u64)-22, "-22" },
+	{ "enum_wide_name", DUMP_ENUM_UNSIGNED, 8, 0xffffffff, "\"MAX\"" },
+	{ "enum_wide_unknown", DUMP_ENUM_UNSIGNED, 8, 0x1ffffffffULL, "8589934591" },
+	{ "enum64_unsigned", DUMP_ENUM64_UNSIGNED, 8, (1ULL << 63) | 1,
+	  "9223372036854775809" },
+	{ "enum64_signed", DUMP_ENUM64_SIGNED, 8, (__u64)-22, "-22" },
+};
+
+static int add_enum_dump_values(struct btf *btf, const struct enum_dump_test *test)
+{
+	__u64 max = test->size == 1 ? 0xff : test->size == 2 ? 0xffff : 0xffffffff;
+	int err;
+
+	switch (test->kind) {
+	case DUMP_ENUM_UNSIGNED:
+		err = btf__add_enum_value(btf, "HIGH", (max >> 1) + 1);
+		return err ?: btf__add_enum_value(btf, "MAX", max);
+	case DUMP_ENUM_SIGNED:
+		return btf__add_enum_value(btf, "NEG", -1);
+	case DUMP_ENUM64_UNSIGNED:
+		err = btf__add_enum64_value(btf, "HIGH", 1ULL << 63);
+		return err ?: btf__add_enum64_value(btf, "LOW", 1);
+	case DUMP_ENUM64_SIGNED:
+		return btf__add_enum64_value(btf, "NEG", (__u64)-1);
+	default:
+		return -EINVAL;
+	}
+}
+
+static int create_enum_dump_map(const struct enum_dump_test *test)
+{
+	LIBBPF_OPTS(bpf_map_create_opts, opts);
+	bool enum64 = test->kind == DUMP_ENUM64_UNSIGNED ||
+		      test->kind == DUMP_ENUM64_SIGNED;
+	struct btf *btf;
+	int key_id, value_id, fd = -1;
+
+	btf = btf__new_empty();
+	if (!ASSERT_OK_PTR(btf, "btf__new_empty"))
+		return -1;
+
+	key_id = btf__add_int(btf, "int", 4, BTF_INT_SIGNED);
+	if (!ASSERT_GT(key_id, 0, "btf__add_int"))
+		goto out;
+	if (enum64)
+		value_id = btf__add_enum64(btf, "enum_value", test->size,
+					   test->kind == DUMP_ENUM64_SIGNED);
+	else
+		value_id = btf__add_enum(btf, "enum_value", test->size);
+	if (!ASSERT_GT(value_id, 0, "add enum"))
+		goto out;
+	if (!ASSERT_OK(add_enum_dump_values(btf, test), "add enum values"))
+		goto out;
+	if (!ASSERT_OK(btf__load_into_kernel(btf), "btf__load_into_kernel"))
+		goto out;
+
+	opts.btf_fd = btf__fd(btf);
+	opts.btf_key_type_id = key_id;
+	opts.btf_value_type_id = value_id;
+	fd = bpf_map_create(BPF_MAP_TYPE_ARRAY, "enum_dump", sizeof(__u32),
+			    test->size, 1, &opts);
+	ASSERT_OK_FD(fd, "bpf_map_create");
+out:
+	btf__free(btf);
+	return fd;
+}
+
+static void test_enum_dump(const struct enum_dump_test *test)
+{
+	union {
+		__u8 val8;
+		__u16 val16;
+		__u32 val32;
+		__u64 val64;
+	} value;
+	char output[1024] = {}, expected[128];
+	__u32 key = 0;
+	int map_fd, ret;
+
+	/* Store the value at its native width, including on big-endian hosts. */
+	switch (test->size) {
+	case 1:
+		value.val8 = (__u8)test->value;
+		break;
+	case 2:
+		value.val16 = (__u16)test->value;
+		break;
+	case 4:
+		value.val32 = (__u32)test->value;
+		break;
+	case 8:
+		value.val64 = test->value;
+		break;
+	default:
+		PRINT_FAIL("unexpected enum size %u (expected 1, 2, 4 or 8)\n", test->size);
+		return;
+	}
+
+	map_fd = create_enum_dump_map(test);
+	if (map_fd < 0)
+		return;
+	if (!ASSERT_OK(bpf_map_update_elem(map_fd, &key, &value, BPF_ANY),
+		       "update enum value"))
+		goto out;
+	if (!ASSERT_OK(bpf_obj_pin(map_fd, ENUM_PIN_PATH), "pin enum map"))
+		goto out;
+
+	ret = get_bpftool_command_output("-j map dump pinned " ENUM_PIN_PATH,
+					 output, sizeof(output));
+	if (!ASSERT_OK(ret, "json enum dump"))
+		goto out;
+	snprintf(expected, sizeof(expected), "\"formatted\":{\"key\":0,\"value\":%s}",
+		 test->expected);
+	ASSERT_HAS_SUBSTR(output, expected, "json enum value");
+
+	memset(output, 0, sizeof(output));
+	ret = get_bpftool_command_output("map dump pinned " ENUM_PIN_PATH,
+					 output, sizeof(output));
+	if (!ASSERT_OK(ret, "plain enum dump"))
+		goto out;
+	snprintf(expected, sizeof(expected), "\"value\": %s\n", test->expected);
+	ASSERT_HAS_SUBSTR(output, expected, "plain enum value");
+out:
+	unlink(ENUM_PIN_PATH);
+	close(map_fd);
+}
+
 void test_bpftool_map_dump(void)
 {
+	size_t i;
+
 	if (test__start_subtest("sk_storage"))
 		test_sk_storage();
 	if (test__start_subtest("queue"))
 		test_queue();
+
+	for (i = 0; i < ARRAY_SIZE(enum_dump_tests); i++) {
+		if (test__start_subtest(enum_dump_tests[i].name))
+			test_enum_dump(&enum_dump_tests[i]);
+	}
 }
diff --git a/tools/testing/selftests/bpf/prog_tests/btf_dump.c b/tools/testing/selftests/bpf/prog_tests/btf_dump.c
index bfa74db17987..b2af060fe5b5 100644
--- a/tools/testing/selftests/bpf/prog_tests/btf_dump.c
+++ b/tools/testing/selftests/bpf/prog_tests/btf_dump.c
@@ -977,6 +977,80 @@ static void test_btf_dump_enum_data(struct btf *btf, struct btf_dump *d,
 				sizeof(enum bpf_cmd) - 1, "", BPF_MAP_CREATE);
 }
 
+static void test_btf_dump_enum_values(void)
+{
+	LIBBPF_OPTS(btf_dump_type_data_opts, opts,
+		    .compact = true,
+		    .skip_names = true);
+	struct {
+		const char *name;
+		__u32 size;
+		__s64 enum_value;
+		union {
+			__u8 u8;
+			__u16 u16;
+			__u32 u32;
+			__u64 u64;
+		} data;
+		const char *expected;
+	} cases[] = {
+		{ "unsigned_byte", 1, 0xff, { .u8 = 0xff }, "VALUE" },
+		{ "unsigned_short", 2, 0xffff, { .u16 = 0xffff }, "VALUE" },
+		{ "unsigned_high", 4, 0x80000000LL,
+		  { .u32 = 0x80000000U }, "VALUE" },
+		{ "unsigned_max", 4, 0xffffffffLL,
+		  { .u32 = 0xffffffffU }, "VALUE" },
+		{ "signed_value", 4, -1, { .u32 = (__u32)-1 }, "VALUE" },
+		{ "unsigned_wide", 8, 0xffffffffLL,
+		  { .u64 = 0xffffffffULL }, "VALUE" },
+		/*
+		 * Wider data must not match an enumerator through its low 32 bits.
+		 * Check numeric output without requiring an exact value.
+		 */
+		{ "wide_unknown", 8, 0xffffffffLL,
+		  { .u64 = 0x1ffffffffULL }, NULL },
+	};
+	struct btf_dump *d;
+	struct btf *btf;
+	int ids[ARRAY_SIZE(cases)];
+	char str[STRSIZE];
+	int err, i;
+
+	btf = btf__new_empty();
+	if (!ASSERT_OK_PTR(btf, "new_empty"))
+		return;
+	for (i = 0; i < ARRAY_SIZE(cases); i++) {
+		ids[i] = btf__add_enum(btf, cases[i].name, cases[i].size);
+		if (!ASSERT_GT(ids[i], 0, "add_enum"))
+			goto free_btf;
+		err = btf__add_enum_value(btf, "VALUE", cases[i].enum_value);
+		if (!ASSERT_OK(err, "add_enum_value"))
+			goto free_btf;
+	}
+
+	d = btf_dump__new(btf, btf_dump_snprintf, str, NULL);
+	if (!ASSERT_OK_PTR(d, "btf_dump__new"))
+		goto free_btf;
+
+	for (i = 0; i < ARRAY_SIZE(cases); i++) {
+		str[0] = '\0';
+		err = btf_dump__dump_type_data(d, ids[i], &cases[i].data,
+					       cases[i].size, &opts);
+		ASSERT_EQ(err, cases[i].size, cases[i].name);
+		if (cases[i].expected) {
+			ASSERT_STREQ(str, cases[i].expected, cases[i].name);
+		} else {
+			ASSERT_NEQ(str[0], '\0', cases[i].name);
+			ASSERT_EQ(strspn(str, "0123456789"), strlen(str),
+				  cases[i].name);
+		}
+	}
+
+	btf_dump__free(d);
+free_btf:
+	btf__free(btf);
+}
+
 static void test_btf_dump_struct_data(struct btf *btf, struct btf_dump *d,
 				      char *str)
 {
@@ -1421,6 +1495,9 @@ void test_btf_dump() {
 	if (test__start_subtest("btf_dump: type_tags"))
 		test_btf_dump_type_tags();
 
+	if (test__start_subtest("btf_dump: enum_values"))
+		test_btf_dump_enum_values();
+
 	btf = libbpf_find_kernel_btf();
 	if (!ASSERT_OK_PTR(btf, "no kernel BTF found"))
 		return;
diff --git a/tools/testing/selftests/bpf/prog_tests/map_extra.c b/tools/testing/selftests/bpf/prog_tests/map_extra.c
new file mode 100644
index 000000000000..cbb1881ba693
--- /dev/null
+++ b/tools/testing/selftests/bpf/prog_tests/map_extra.c
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <test_progs.h>
+#include "test_map_extra.skel.h"
+
+void test_map_extra(void)
+{
+	struct test_map_extra *skel;
+
+	if (!test__start_subtest("enum32_high"))
+		return;
+
+	skel = test_map_extra__open();
+	if (!ASSERT_OK_PTR(skel, "test_map_extra__open"))
+		return;
+
+	ASSERT_EQ(bpf_map__map_extra(skel->maps.arena), 0x80000000ULL,
+		  "map_extra");
+	test_map_extra__destroy(skel);
+}
diff --git a/tools/testing/selftests/bpf/progs/test_map_extra.c b/tools/testing/selftests/bpf/progs/test_map_extra.c
new file mode 100644
index 000000000000..b6aa2341c115
--- /dev/null
+++ b/tools/testing/selftests/bpf/progs/test_map_extra.c
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/bpf.h>
+#include <bpf/bpf_helpers.h>
+
+struct {
+	__uint(type, BPF_MAP_TYPE_ARENA);
+	__uint(map_flags, BPF_F_MMAPABLE);
+	__uint(max_entries, 1);
+	__ulong(map_extra, 0x80000000U);
+} arena SEC(".maps");
+
+char LICENSE[] SEC("license") = "GPL";
-- 
2.43.0

