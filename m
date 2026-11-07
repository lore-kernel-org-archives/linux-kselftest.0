Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=63.250.43.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794057112;
	b=pRTiwNNJXbDkEktzYZhL3HQr5sHWWk5op0tIXOzlL65+ocBKQoiREodTlvxGIUiomtch
	 xWsAC52OH2xQfsV/rNW6t4EnL78moQ0Z5j2pqNyd2+hnOogQQF7uuP33rSZ0bL6Mi7Yjy
	 WoqkvH06YDhyikZDyetSdSkqkFPahUxlE+i3mnLCL2PUe14L991h2DFu2TaPg7I1Q1bNR
	 3lffoKx2Na/GIGRKZcVV/QHRkx01DRjbcTgCObia4voHmmcMjuiTc+d1E2KY+NVkbY97c
	 ur2YXWKpogB/AK7DG9brmi82ZP+Gfy9rpuFDCzRMv8SNREPZKGG26kG6Uu+lzA2NRvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794057112;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Envelope-From;
	bh=GgI/x1dzeiHjej3+sEtAVwlD1r1Q46EDbhqhaRpxRhY=;
	b=XKgr+SpVIw4nkXeCgujgDV5k2tOsYDrN/qO7GgvAsKRPPTnydWPaYD8pdTyiFp7kzcht
	 HYgl6VD1r958E/9lhKpEHucKu2CZUz3A7nMbOn8EsMn1mu9WsHMfnBX9Nn94kyY4MtSGx
	 mottf54dsII5PBzxta05XagtzJjhnMmkQOuJQQRdkhmy7ISBW2UZbxsZT0/cQgVngZMig
	 qN7h6+GcF1Hzj1XRzLe7NnCE0rbbyVarQ2dlndnbVV/GSsyYUnuGayYpX7gU4yF3sS20N
	 26T68bCZA9wO/P+DqkJrNNSPyx4Di6Iwa1xrluKhoL6ZDprV2vA969NbNsqb3rC9cVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tychen.cc;
	spf=pass smtp.mailfrom=tychen.cc;
	dkim=pass header.d=tychen.cc header.i=@tychen.cc header.a=rsa-sha256 header.s=spacemail header.b=LHRUvQId;
	arc=none smtp.remote-ip=63.250.43.122
Received: from out-2uec-a122.jellyfish.systems (out-2uec-a122.jellyfish.systems [63.250.43.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37885606A326
	for <linux-kselftest@vger.kernel.org>; Sat,  7 Nov 2026 13:11:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37885606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tychen.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tychen.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.a=rsa-sha256 header.s=spacemail header.b=LHRUvQId
Received: from fedora (ec2-52-197-241-54.ap-northeast-1.compute.amazonaws.com [52.197.241.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4jMGdy4wwwz8sWN;
	Sat, 07 Nov 2026 13:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tychen.cc;
	s=spacemail; t=1794057098;
	bh=GgI/x1dzeiHjej3+sEtAVwlD1r1Q46EDbhqhaRpxRhY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LHRUvQIdnUtbZGf/jtQGI0DuDSPEhjIDXh9AMZBOfITCiOETz7QPH0U6xk0VWSg4Z
	 8aGCRHr8lCBIxa1+DkJ9L1/Hb2blGc3YWXp3iXVvejdyh7/4gNpgHmqzKgH6nug5Ct
	 oQPDJMQiClhWIrV3RO1LfVVy0AWZ33BvY0eoLTAmhN9pIJNfl2I10ftAstvcEYO62A
	 w/ETlkrn2Zf3iZqdKKVVEaCOeH4IgY0v6ah0yIgFfSvbrd2OUdrG5F5k9HskynUx5l
	 iNk7GcAPUTxoaWTkRPVHiP7OXOCLezdcuia31snb5UEmGS1HMq9LOh76VgYFEhHiAF
	 47YCBLgbFsZSQ==
From: Tianyi Chen <hi@tychen.cc>
To: bpf@vger.kernel.org
Cc: Tianyi Chen <hi@tychen.cc>,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	yatsenko@meta.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf 2/2] selftests/bpf: Cover RHASH batch cursor loss
Date: Sat,  7 Nov 2026 22:11:20 +0900
Message-ID: <4b4cccc3b706a54ef42ba3c09b40954883661e6a.1794056839.git.hi@tychen.cc>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1794056839.git.hi@tychen.cc>
References: <cover.1794056839.git.hi@tychen.cc>
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
X-Envelope-From: hi@tychen.cc

Check normal completion and missing input cursors for both batch lookup
operations. Exercise a concurrent delete within a lookup batch by
repeatedly removing and reinserting the first key while the other keys
remain present. Every walk that reports end-of-iteration must include
those unchanged keys; a lost cursor may instead return EAGAIN.

Pre-size the map and keep its population stable to avoid testing the
separate best-effort behavior during resizing.

Assisted-by: LLM
Signed-off-by: Tianyi Chen <hi@tychen.cc>
---
 .../selftests/bpf/prog_tests/rhash_batch.c    | 181 ++++++++++++++++++
 1 file changed, 181 insertions(+)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/rhash_batch.c

diff --git a/tools/testing/selftests/bpf/prog_tests/rhash_batch.c b/tools/testing/selftests/bpf/prog_tests/rhash_batch.c
new file mode 100644
index 000000000000..bba9062afd12
--- /dev/null
+++ b/tools/testing/selftests/bpf/prog_tests/rhash_batch.c
@@ -0,0 +1,181 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <test_progs.h>
+#include <pthread.h>
+
+#define ENTRIES 64
+#define VALUE_SIZE 4000
+
+static int create_map(__u32 entries)
+{
+	LIBBPF_OPTS(bpf_map_create_opts, opts,
+		.map_flags = BPF_F_NO_PREALLOC,
+		.map_extra = entries);
+	char value[VALUE_SIZE] = {};
+	__u64 key;
+	int fd;
+
+	fd = bpf_map_create(BPF_MAP_TYPE_RHASH, "rhash_batch", sizeof(key),
+			    sizeof(value), entries, &opts);
+	if (!ASSERT_OK_FD(fd, "map_create"))
+		return -1;
+	for (key = 0; key < entries; key++) {
+		if (!ASSERT_OK(bpf_map_update_elem(fd, &key, value, BPF_ANY), "map_update")) {
+			close(fd);
+			return -1;
+		}
+	}
+	return fd;
+}
+
+static int lookup_batch(int fd, void *in, void *out, void *keys,
+			void *values, __u32 *count, bool delete)
+{
+	if (delete)
+		return bpf_map_lookup_and_delete_batch(fd, in, out, keys, values, count, NULL);
+	return bpf_map_lookup_batch(fd, in, out, keys, values, count, NULL);
+}
+
+static void test_batch(bool delete, bool lost_cursor)
+{
+	__u64 key, cursor, seen = 0;
+	char value[VALUE_SIZE];
+	__u32 count;
+	int fd, err;
+	void *in = NULL;
+
+	/* Two entries fit in the minimum table, including while deleting. */
+	fd = create_map(2);
+	if (fd < 0)
+		return;
+	if (lost_cursor) {
+		count = 1;
+		err = lookup_batch(fd, NULL, &cursor, &key, value, &count, delete);
+		if (!ASSERT_OK(err, "first_batch") || !ASSERT_EQ(count, 1, "first_count") ||
+		    !ASSERT_OK(bpf_map_delete_elem(fd, &cursor), "delete_cursor"))
+			goto out;
+		count = 1;
+		err = lookup_batch(fd, &cursor, &cursor, &key, value, &count, delete);
+		ASSERT_EQ(err, -EAGAIN, "lost_cursor");
+		ASSERT_EQ(count, 0, "lost_count");
+		goto out;
+	}
+	do {
+		count = 1;
+		err = lookup_batch(fd, in, &cursor, &key, value, &count, delete);
+		if (!ASSERT_TRUE(!err || err == -ENOENT, "batch_result") ||
+		    !ASSERT_EQ(count, 1, "batch_count") ||
+		    !ASSERT_LT(key, 2, "key_range") ||
+		    !ASSERT_EQ(seen & (1ULL << key), 0, "unique_key"))
+			goto out;
+		seen |= 1ULL << key;
+		in = &cursor;
+	} while (!err);
+	ASSERT_EQ(seen, 3, "all_keys");
+	if (delete) {
+		ASSERT_EQ(bpf_map_get_next_key(fd, NULL, &cursor), -ENOENT, "empty_map");
+		count = 1;
+		err = lookup_batch(fd, NULL, &cursor, &key, value, &count, true);
+		ASSERT_EQ(err, -ENOENT, "empty_batch");
+		ASSERT_EQ(count, 0, "empty_count");
+	}
+out:
+	close(fd);
+}
+
+struct race_ctx {
+	int fd;
+	__u64 key;
+	bool stop;
+	int err;
+	unsigned int updates;
+};
+
+static void *update_key(void *arg)
+{
+	struct race_ctx *ctx = arg;
+	char value[VALUE_SIZE] = {};
+
+	while (!__atomic_load_n(&ctx->stop, __ATOMIC_RELAXED)) {
+		ctx->err = bpf_map_delete_elem(ctx->fd, &ctx->key);
+		if (ctx->err)
+			break;
+		ctx->err = bpf_map_update_elem(ctx->fd, &ctx->key, value, BPF_ANY);
+		if (ctx->err)
+			break;
+		ctx->updates++;
+	}
+	return NULL;
+}
+
+static void test_concurrent_delete(void)
+{
+	struct race_ctx ctx = {};
+	__u64 keys[ENTRIES], cursor, seen = 0, expected;
+	unsigned int completed = 0, attempt;
+	__u32 count, i;
+	void *in = NULL, *values;
+	pthread_t thread;
+	int err;
+
+	ctx.fd = create_map(ENTRIES);
+	if (ctx.fd < 0)
+		return;
+	values = malloc(ENTRIES * VALUE_SIZE);
+	if (!ASSERT_OK_PTR(values, "values"))
+		goto close;
+	if (!ASSERT_OK(bpf_map_get_next_key(ctx.fd, NULL, &ctx.key), "first_key"))
+		goto out;
+	expected = ~(1ULL << ctx.key);
+	if (!ASSERT_OK(pthread_create(&thread, NULL, update_key, &ctx), "thread_create"))
+		goto out;
+	/* Only the first key changes; no resize is needed at this load. */
+	for (attempt = 0; attempt < 5000; attempt++) {
+		count = ENTRIES;
+		err = bpf_map_lookup_batch(ctx.fd, in, &cursor, keys, values, &count, NULL);
+		if (err == -EAGAIN) {
+			in = NULL;
+			seen = 0;
+			continue;
+		}
+		if (!ASSERT_TRUE(!err || err == -ENOENT, "batch_result"))
+			break;
+		for (i = 0; i < count; i++) {
+			if (!ASSERT_LT(keys[i], ENTRIES, "key_range"))
+				goto stop;
+			seen |= 1ULL << keys[i];
+		}
+		if (err == -ENOENT) {
+			if (!ASSERT_EQ(seen & expected, expected, "persistent_keys"))
+				break;
+			completed++;
+			in = NULL;
+			seen = 0;
+		} else {
+			in = &cursor;
+		}
+	}
+stop:
+	__atomic_store_n(&ctx.stop, true, __ATOMIC_RELAXED);
+	pthread_join(thread, NULL);
+	ASSERT_OK(ctx.err, "writer_result");
+	ASSERT_GT(ctx.updates, 0, "concurrent_updates");
+	ASSERT_GT(completed, 0, "completed_walks");
+out:
+	free(values);
+close:
+	close(ctx.fd);
+}
+
+void test_rhash_batch(void)
+{
+	if (test__start_subtest("lookup"))
+		test_batch(false, false);
+	if (test__start_subtest("lookup_delete"))
+		test_batch(true, false);
+	if (test__start_subtest("lost_lookup_cursor"))
+		test_batch(false, true);
+	if (test__start_subtest("lost_delete_cursor"))
+		test_batch(true, true);
+	if (test__start_subtest("concurrent_delete"))
+		test_concurrent_delete();
+}
-- 
2.56.0

