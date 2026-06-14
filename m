Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95D82EDD6B
	for <linux-kselftest@vger.kernel.org>; Sun, 14 Jun 2026 16:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781454892; cv=none; b=Ie+vjaewih4pdpGDse6rCJsTlhFysffdlCeuxTkCtiWczKVDCy0WZzv2ObowmdSA/GgLQSP7PY1azmgbvJnJVKBj6LjqhMRjGsRDRk5GAy4Z0nfErpyoXyuYUGdPBpiorUPQT/k6ngq2fvVOKr85pzr326WXU/hTb/P3HjJ/2Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781454892; c=relaxed/simple;
	bh=JOEI8vu/7HAwBxTRs1BHdDZNqxm4ZVt72nXf1bK2VVE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W2cXt1dltzEfoLIUtjTbJl38H2QLTtm7DNJkK2gsj3SuWFNsxMH6LGT8fqjtiG5UVfl0idcJINwnUZTpGI0MRElcqWQerST/iJfEgVgUhacU9gQqQZUsBW9rM4wldoHOR5k6xY5fmOMD3v3ds0QxnbmZNHF1B2yXFc1JIXIKhLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wws5WHjS; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wws5WHjS"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490afc47455so10518665e9.2
        for <linux-kselftest@vger.kernel.org>; Sun, 14 Jun 2026 09:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781454889; x=1782059689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ie7W0/36/mBiMATry4KLDy87C2gkFpZRNsB/aUK3ZIM=;
        b=Wws5WHjSbtocO+zba8s1Wy8edJiBVsKmvPmNq953tp/BdGGRc6umjVtK08lXWw5XJi
         ft1YDNLBgxk4GIjuP1OwHI4oir0IIu7BbvyQzw8O/ko6biQ/hUs6n3g1wVqXlGR4HrVK
         uAQa0HLxah4A5tqsSG04lFwyd+tIB+puSsEZiVMWQohVSIOiZr6uLtZuTrQ3a4NW37Oy
         U8HcajOxMwAA3qjVQrxc+gJu5BQ0aBBa7ZDBM1fMb/Ms+y7siAWoc0hg2kNKWL4pxtHm
         POPTk6xZP0awDmvUK8SlH+8VfWbAl6hkfPky7qeVGQDhNOE9Opn7u5o+BTRGHZQqE2Os
         3sjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781454889; x=1782059689;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ie7W0/36/mBiMATry4KLDy87C2gkFpZRNsB/aUK3ZIM=;
        b=HbAAbOI1Y9UErUcO1EnWGjsd4x9sC+RQcLfyvbQph8liErnmZZaGHLPASbOICbrIzT
         j1joH0OVIyf8lFD+7D6r4iqv1S5R3CrTV8Lio+YAw992P/sxJRg/0dOYikitGTPmilQb
         gDwAhsv/wbqy5L2reU0Lu2S5ljypRqtELmkszd1OE7L9LEznUEIgGBxrTkUSRZvVIUxs
         GUmPp48gem1j1GrS3om5DfpdvU8mdMOvmSJxc0mVcfWsZ6cM9Pkak1csN/GW1Vc6XFQ/
         tKCfdPx81xKt0K7JKmlvKdUv7VhpXkERQYm17TXqj1IbLzIMGzExaBJlImP9vrGqcKDp
         1ltg==
X-Gm-Message-State: AOJu0YzAQq+DvZjjcwNPSTK/vZUk9Fgv6yto/5pE1yDTHLWpuMI2aJLJ
	MMp/sjftNXhzAnQ36E+aDRK5hpBPCNhQJoAShKR7kbzhLDvvtal0zJg2
X-Gm-Gg: Acq92OFzbK/LUKenKBoRwi5oqSpo8INwu8ZIJzHxEuus/ppl3b7ovKtFdmhxsHOQ3OB
	2cVrCY6Li9GwlArn9N1IF/HBcIz7SGWepqJpFUNnleVBLJXPZax4lS4pcZBbsoNHSu3Qh/hVHMD
	FM0dq2lctSoIfQoHjUAM8B/+3pQH+UI94247gX8KGNEATG6e77w7AARZoqRnxX59+THRxFyzev9
	mr2Na55KET8/dRihJSqbUL8z4AyJ2JcFK9LKQZkUyrBPRgTujW5CtraE+Ygj08UWsQFfO8JXqFu
	OUVkt8GgF9HuxvT5mPZ/q1LbAhpbyKhEcnwh2XwnNQkGA8mK2XnzJxsXc0yVITNkq7QQdadedAM
	1TfKPe78wo4HSIQ/0J9D2AzMHvEgMIqhRxw71ugNZUcvGqfruFWqY5mvLhZjuPKRQEO7wxDcp3z
	vA5B/ZnnOMDOkv7diXA0PPKrJeGClC4kWWPJ8HTsvi4AfaSkCWivpI5VKOZTuzMZbXVB6y/UJ0o
	rGz2kSKkym1cnE=
X-Received: by 2002:a7b:cbc3:0:b0:48a:5565:ec3d with SMTP id 5b1f17b1804b1-490ec502d01mr96781235e9.22.1781454889048;
        Sun, 14 Jun 2026 09:34:49 -0700 (PDT)
Received: from ds-pc.. (host86-147-161-204.range86-147.btcentralplus.com. [86.147.161.204])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2637ccsm25885849f8f.6.2026.06.14.09.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 09:34:48 -0700 (PDT)
From: Dhiraj Shah <find.dhiraj@gmail.com>
To: bpf@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	andrii@kernel.org,
	eddyz87@gmail.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	shuah@kernel.org
Subject: [PATCH] selftests/bpf: Add arena direct-value boundary test
Date: Sun, 14 Jun 2026 17:33:52 +0100
Message-ID: <20260614163352.1060813-1-find.dhiraj@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add coverage for direct map value access against BPF_MAP_TYPE_ARENA.
For a one-page arena, an offset of PAGE_SIZE - 1 is valid, while
PAGE_SIZE is one byte past the end of the mapping and must be rejected.

This covers the off-by-one case in arena direct-value range checking.

Signed-off-by: Dhiraj Shah <find.dhiraj@gmail.com>
---
 .../bpf/prog_tests/arena_direct_value.c       | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/arena_direct_value.c

diff --git a/tools/testing/selftests/bpf/prog_tests/arena_direct_value.c b/tools/testing/selftests/bpf/prog_tests/arena_direct_value.c
new file mode 100644
index 000000000000..00e65af5df6c
--- /dev/null
+++ b/tools/testing/selftests/bpf/prog_tests/arena_direct_value.c
@@ -0,0 +1,65 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <test_progs.h>
+#include <bpf/bpf.h>
+#include <linux/filter.h>
+#include <sys/mman.h>
+#include <sys/user.h>
+#ifndef PAGE_SIZE
+#include <unistd.h>
+#define PAGE_SIZE getpagesize()
+#endif
+
+static int create_arena(void)
+{
+	LIBBPF_OPTS(bpf_map_create_opts, opts,
+		    .map_flags = BPF_F_MMAPABLE,
+	);
+
+	return bpf_map_create(BPF_MAP_TYPE_ARENA, "arena", 0, 0, 1, &opts);
+}
+
+static int load_direct_value_prog(int map_fd, int off)
+{
+	struct bpf_insn insns[] = {
+		BPF_LD_MAP_VALUE(BPF_REG_1, map_fd, off),
+		BPF_MOV64_IMM(BPF_REG_0, 0),
+		BPF_EXIT_INSN(),
+	};
+
+	return bpf_prog_load(BPF_PROG_TYPE_SOCKET_FILTER, NULL, "GPL",
+			     insns, ARRAY_SIZE(insns), NULL);
+}
+
+static void test_direct_value_boundary(void)
+{
+	void *area = MAP_FAILED;
+	int map_fd, prog_fd;
+
+	map_fd = create_arena();
+	if (!ASSERT_OK_FD(map_fd, "create_arena"))
+		return;
+
+	area = mmap(NULL, PAGE_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, map_fd, 0);
+	if (!ASSERT_NEQ(area, MAP_FAILED, "arena_mmap"))
+		goto out;
+
+	prog_fd = load_direct_value_prog(map_fd, PAGE_SIZE - 1);
+	if (ASSERT_OK_FD(prog_fd, "last_valid_byte"))
+		close(prog_fd);
+
+	prog_fd = load_direct_value_prog(map_fd, PAGE_SIZE);
+	if (!ASSERT_LT(prog_fd, 0, "one_past_end"))
+		close(prog_fd);
+
+out:
+	if (area != MAP_FAILED)
+		munmap(area, PAGE_SIZE);
+	close(map_fd);
+}
+
+void test_arena_direct_value(void)
+{
+	if (test__start_subtest("direct_value_boundary"))
+		test_direct_value_boundary();
+}
-- 
2.43.0

