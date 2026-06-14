Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A072E7162
	for <linux-kselftest@vger.kernel.org>; Sun, 14 Jun 2026 18:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781460312; cv=none; b=t43XYxEhUK9+vjefTNVS2WEpOzkO6bdmW4ocLV9Eogbtx79SDWgfW9r8qlRsUcoZAH3PUrj1zV5Ij7BrGWcm+DxTVNgx6uBU6poIytXfD/WfF2YK+SghSpGxRvQaN46RgRzsZWJUr6wf6mXVH+H3YENqDejhynOAK25KU0ACsQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781460312; c=relaxed/simple;
	bh=JW8FVJjTWsEThSF8JuDPEQLVO8P4vvAGBguPLz2MzXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L7VwEZTN/d7KwlMnu1VxM704eLE2egwtzG8L4Z+n87Rd/7uoi6ny3GDNxGvRsOFrDgWH473YeoNAkBmax1RfBSz1Jj0kE94Khc2/Zsrn7tEo4HCFySl1maGeXoMZ3ZdxtwczxKsdaKrnyIKJDOuw2RN+V/Q9ZiipOvDghtMBjpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fl4uK8Bs; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fl4uK8Bs"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490ac357c55so24452615e9.1
        for <linux-kselftest@vger.kernel.org>; Sun, 14 Jun 2026 11:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781460309; x=1782065109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ODX1HfUpj996EHRxNq42AhNa5RpVxfOswnO9waGWRWU=;
        b=Fl4uK8BsJaZJVqgss5hjKhcnd5Y12cSDM9HyD7qTiBSnX8H8JuXzMKvycKW/iwWPGz
         6en+ISzeURkRnKGV98nxK0GfZlc/Lxz+x8ISsNvO5OYSVwkw3PkmwD9UQPVV/SLJskzI
         VtUSrXSCYvHohqidwpH3wmlVulFlt5d0/Tf3NbrqHGgkFFdluXk3ifKlgl3crzW4oIQ4
         6MHFGyoEe8KrCml7MmQRy1OEabM7/HjQVFcsks5o5RJ0j9o14EzMHaLY1L+40qCrcEQX
         ZtrLSlDYwBqtUNRqbZyPGwwyx0i1k5ZpZoUJrzSdfUywYCKhvTqSq9dGsIklXpIYhrQQ
         +r6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781460309; x=1782065109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ODX1HfUpj996EHRxNq42AhNa5RpVxfOswnO9waGWRWU=;
        b=XVVKobyHDGCDkXvn7ZXfcufFytcT7yYC927Q0BFl5BB8Q7MOju8OtEmy1duAHxoeWx
         u+edP4diPiM36Oaw0dYRbmu0L6Ve9k0N7QJd9azYp68vmm+HvbKY2ccZTKLI42iRc9vC
         YC7/2zjCTwoRkpnjyUsLQ6KPC57j5ftPufdw3WnPpwx70ZIMcG+iw6oJK03EawJP1Pkc
         jd5faSK6xEVcPXZX2yGNaU7G0wV1Mlo+lW8bRE8s7cdxJRPPmIQUOZZ2f2Gq7qoyGUJD
         of8geAvu9/wh19w7NBT2FVyy0YgNrlQHXkZa0p7+RxpxA297xmxz3AHDFfjyTowJdyFY
         YwoQ==
X-Gm-Message-State: AOJu0Yy/KQSjN2CuHKXgoZRbcds1BZfo54Zs/uX5uXlE1YVPX4IuzLsr
	KU6FlOCgbuckDxQxr2yIO2zbMujILHYVWReW72FXLW8ox+5QxkyFSIKH
X-Gm-Gg: Acq92OGOJgFE1GwCcMHpTv2/tsRkEo1wd3jtWbJf2a5IcygayLOTBg7pcHbmVLzI5Tq
	ioB7SwaoY9GC2O8V7JmVHxc5oTTkFw7edNR7dRHj821zdtCMB2ZTHIEEvoyFoF3bREQkk6lWpNL
	hCBox1Z3KmXY/fErTvjooCfzRpFsEus1YppzWZWKxY2Chh882/HMRgglLPFYtUN/fGgECBHy0RY
	wy0n7QNd5UQlEzKdXy35Lhf6QzJgu1lQa1L6f74SSqUD+rKljWtUkQ75G+9R/1oWbdq8skHbYIt
	ByVKqwSuKhm6awFuLPPQR5wm+nwJRQw9CODwNX48sbZtHgM9MINXVFut3nWWxqanY0lJtW/Uc3x
	72XIfnchFhrZBjoFaH/w29CZkFfD9jHMKJZtDXhu7By71hyb0zb9eR7EgawSHFaK5+dp6BSLIyy
	/lYzTi8KIkxTpBNb7TrfyDN6VSuGeH8MDdZjTjGAPi7g+9tzXvn1j3Xq/PHiyci1BmEUI9C8S3+
	0n4
X-Received: by 2002:a05:600c:3b16:b0:491:e3be:1363 with SMTP id 5b1f17b1804b1-491e3be13b3mr127467695e9.0.1781460309301;
        Sun, 14 Jun 2026 11:05:09 -0700 (PDT)
Received: from ds-pc.. (host86-147-161-204.range86-147.btcentralplus.com. [86.147.161.204])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49220345528sm205543945e9.8.2026.06.14.11.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 11:05:08 -0700 (PDT)
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
Subject: [PATCH v2] selftests/bpf: Add arena direct-value boundary test
Date: Sun, 14 Jun 2026 19:04:40 +0100
Message-ID: <20260614180440.1073941-1-find.dhiraj@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260614163352.1060813-1-find.dhiraj@gmail.com>
References: <20260614163352.1060813-1-find.dhiraj@gmail.com>
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

Skip the test when arena maps are not supported by the target
architecture.

This covers the off-by-one case in arena direct-value range checking.

Signed-off-by: Dhiraj Shah <find.dhiraj@gmail.com>
---
Changes in v2:
- Skip the test when BPF_MAP_TYPE_ARENA is unsupported.

 .../bpf/prog_tests/arena_direct_value.c       | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/arena_direct_value.c

diff --git a/tools/testing/selftests/bpf/prog_tests/arena_direct_value.c b/tools/testing/selftests/bpf/prog_tests/arena_direct_value.c
new file mode 100644
index 000000000000..d58790a66cc8
--- /dev/null
+++ b/tools/testing/selftests/bpf/prog_tests/arena_direct_value.c
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <test_progs.h>
+#include <bpf/bpf.h>
+#include <errno.h>
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
+	if (map_fd < 0 && errno == EOPNOTSUPP) {
+		test__skip();
+		return;
+	}
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

