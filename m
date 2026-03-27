Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F563F87E3
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 14:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774620990; cv=none; b=dwaM+hXPGIudjEprbiaHtbrOZDpZl7yQmxPIdXdcuRTzF7qVJYlCEITpcCMQ/uBVDE87pyY51j+CAPKvZptIBZphbcq5G0+Nxnon1njz88o0Rp7/8ZhqOOORE2yUqSoBW9WkLSC7tA6kiiRZUnUtrVNGmKUJVNkaxveQm8y2GjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774620990; c=relaxed/simple;
	bh=nk/5ZakMJ+t2bnACkG2W+99kDbR1MO4cQq0DjDs269o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pO8enveoeV496UMCGUuaZ2ia9tGovON/PaZ5FRSu3vbzHnN5xK0wrDhcID9pdlLeY0KdWOua3I4whUdPv5SMkUQsTL+3m4TU3XEMUyHDJfbwvsbEPDAZKIzhs6KnRH4C/vlY1hYSUhfpb6k3ImHZy9WVIpT2/3m+UbwhP3LXLLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bBVk2nHT; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bBVk2nHT"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c757a9251faso981321a12.1
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 07:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774620985; x=1775225785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6aupF+DuW1/DcLr6AsgbIe6z0Vi4ttYW8cK5LaEjq3w=;
        b=bBVk2nHTC40dS0AyeaC0MCoeEtN5Bf+tnn3sfNcMhXGXO+XfJqN4Fn6KVL8sdrWkwC
         gnnaYgu8oQomOxYvq4SaUXaCF81lut0Z3ewvBFNCR9QOEsoWc4bFbcZkc6AXV4GCeM7L
         9HCOrLEk1gQOimME7WZbhZjWU7PbOkCTXwp5iqfK7P62rs+yFbeHHpNTC/d4/ZpYfrhq
         OdnzUPmTOh+opu9hcBmCR+6NnMySZv4SwX77hB2xtwQAmeIjjUMmZd81DuhtZlYEzjhM
         e2iwu0Ow3v53ROZbJ7vafnm89nTFBOspkLGHzHw+4kRXsOHanJqSPox+GqsJLqTtgr/C
         0NIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774620985; x=1775225785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6aupF+DuW1/DcLr6AsgbIe6z0Vi4ttYW8cK5LaEjq3w=;
        b=UfJp6Wo7ItSysxqMVfFmYjIQ5Tb9R4pcHJ6hzUbRAfkIlAvnu6fSrjD3akZWZHKHuy
         zV4305sujbtY26+WdaCPEErtG1k1RSo4izNcGRovPMDJJoOcxV7xZhi0ZHs2Ycx/6Z+k
         a7xvFa4ZOOTkvXG5Ss4it6raUHhgtjEjMb+1pRfAH3cEAp+lIBDRyssLUZRxcVb7vs3d
         ax5DuNEyt80v9i+oGyZj4J4YSuyYXLhD6/wTRu2/QZjoTDK8NPJfDNxmn9E1k9w2RWzE
         Y5ph6yGD2MtcS/hk6gfJtXXOtV4EThHB9IZtCrBakLsAC62kUZrv1lNIFxCl15vNOR/R
         mShg==
X-Forwarded-Encrypted: i=1; AJvYcCVUy0UQfeG4t3lxUTPwsMXxFdp7BZjURgcNSu2Z6asBeZZMjf/k23WSwxHZLZEWcsa8kzkffHIXkqzcHutS1vc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCa/Kx/ITXuah9DOxJl2+Per5goQx4Sn8XjcSNqIa+CLrb+7MT
	sDAdr4GJR7ZtlR592DNDB2a3vLkCaIRoKVixCBhHUbHrFw8WNK+ZIXGjo6IYFg==
X-Gm-Gg: ATEYQzyHG5f42fXVgEydgKqmvHyKua3UY1FbfjZwS4t6CjuBz06A+M3BK51d3zDxdYm
	2PpuWac/nELmyUpPaXazYqLKTXSeRKjyFepxRr0f/azu1CzuqGYj37UQyzudeOQgjiuKI/u/Nkm
	92OwYZSzY0iAaxcS1FxQJpJF0C+Pi1pD29iXPAhl+wfPVLQ7V54bdnq+yXNTkCYEU1s41blEy1l
	Ql6T+xlv4OMkAgE4P4LZfL7CaL6rF7An+MIwNsjcgokO37Su1Tt+1by5iusDDgp1NaYhLWPtXht
	2zsSgnDc+BdTlJ42I6pzCx/YltbdsgNJD8wvIWsaPW5LBGrlfPTbo6kUy3GrYpHZteedpJlFecE
	CE4PqQJk9amRcGsySjoE9AD4Sv8KjowFLJDTLP7SbZarhN24hoqgi35TfFfxHPmRoWzfgNq2tNi
	nkyk1M1mKpWWoArPvoS7CnR4mFVN4KixskrdVtR3JXb6X4SeeUuKE1L2Kc38ZQKOceZNkRd0xMq
	ay7Fha0WMVEPBA76I37oiCpQY+mtZe+MS0xvBP5sYQB
X-Received: by 2002:a17:902:ce06:b0:2b0:5a4c:7266 with SMTP id d9443c01a7336-2b0cdc29022mr30209125ad.16.1774620984287;
        Fri, 27 Mar 2026 07:16:24 -0700 (PDT)
Received: from lab-kiba-ocxma-dut-01.. (191.68.231.218.rev.ocx2915.net. [218.231.68.191])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc8e958csm61371365ad.66.2026.03.27.07.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 07:16:23 -0700 (PDT)
From: Takeru Hayasaka <hayatake396@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org
Cc: bpf@vger.kernel.org,
	x86@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next 2/2] selftests/bpf: cover fentry on tailcalled programs
Date: Fri, 27 Mar 2026 14:16:02 +0000
Message-ID: <20260327141616.1961457-3-hayatake396@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327141616.1961457-1-hayatake396@gmail.com>
References: <20260327141616.1961457-1-hayatake396@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a small tailcall target/probe pair and a tailcalls subtest that
attaches fentry to the callee program.

The test first runs the callee directly and checks that fentry fires
exactly once, then runs the entry program, tail-calls into the callee
and checks that the same fentry also fires exactly once on the tail-call
path.

This covers both sides of the x86 change: direct entry must not
double-fire, while tail-called entry must now be observable.

Signed-off-by: Takeru Hayasaka <hayatake396@gmail.com>
---
 .../selftests/bpf/prog_tests/tailcalls.c      | 110 ++++++++++++++++++
 .../bpf/progs/tailcall_fentry_probe.c         |  16 +++
 .../bpf/progs/tailcall_fentry_target.c        |  27 +++++
 3 files changed, 153 insertions(+)
 create mode 100644 tools/testing/selftests/bpf/progs/tailcall_fentry_probe.c
 create mode 100644 tools/testing/selftests/bpf/progs/tailcall_fentry_target.c

diff --git a/tools/testing/selftests/bpf/prog_tests/tailcalls.c b/tools/testing/selftests/bpf/prog_tests/tailcalls.c
index 7d534fde0af9..ac05df65b666 100644
--- a/tools/testing/selftests/bpf/prog_tests/tailcalls.c
+++ b/tools/testing/selftests/bpf/prog_tests/tailcalls.c
@@ -1113,6 +1113,114 @@ static void test_tailcall_bpf2bpf_fentry_entry(void)
 	bpf_object__close(tgt_obj);
 }
 
+static void test_tailcall_fentry_tailcallee(void)
+{
+	struct bpf_object *tgt_obj = NULL, *fentry_obj = NULL;
+	struct bpf_map *prog_array, *data_map;
+	struct bpf_link *fentry_link = NULL;
+	struct bpf_program *prog;
+	int err, map_fd, callee_fd, main_fd, data_fd, i, val;
+	char buff[128] = {};
+
+	LIBBPF_OPTS(bpf_test_run_opts, topts,
+		    .data_in = buff,
+		    .data_size_in = sizeof(buff),
+		    .repeat = 1,
+	);
+
+	err = bpf_prog_test_load("tailcall_fentry_target.bpf.o",
+				 BPF_PROG_TYPE_SCHED_CLS,
+				 &tgt_obj, &main_fd);
+	if (!ASSERT_OK(err, "load tgt_obj"))
+		return;
+
+	prog_array = bpf_object__find_map_by_name(tgt_obj, "jmp_table");
+	if (!ASSERT_OK_PTR(prog_array, "find jmp_table map"))
+		goto out;
+
+	map_fd = bpf_map__fd(prog_array);
+	if (!ASSERT_FALSE(map_fd < 0, "find jmp_table map fd"))
+		goto out;
+
+	prog = bpf_object__find_program_by_name(tgt_obj, "entry");
+	if (!ASSERT_OK_PTR(prog, "find entry prog"))
+		goto out;
+
+	main_fd = bpf_program__fd(prog);
+	if (!ASSERT_FALSE(main_fd < 0, "find entry prog fd"))
+		goto out;
+
+	prog = bpf_object__find_program_by_name(tgt_obj, "callee");
+	if (!ASSERT_OK_PTR(prog, "find callee prog"))
+		goto out;
+
+	callee_fd = bpf_program__fd(prog);
+	if (!ASSERT_FALSE(callee_fd < 0, "find callee prog fd"))
+		goto out;
+
+	i = 0;
+	err = bpf_map_update_elem(map_fd, &i, &callee_fd, BPF_ANY);
+	if (!ASSERT_OK(err, "update jmp_table"))
+		goto out;
+
+	fentry_obj = bpf_object__open_file("tailcall_fentry_probe.bpf.o", NULL);
+	if (!ASSERT_OK_PTR(fentry_obj, "open fentry_obj file"))
+		goto out;
+
+	prog = bpf_object__find_program_by_name(fentry_obj, "fentry_callee");
+	if (!ASSERT_OK_PTR(prog, "find fentry prog"))
+		goto out;
+
+	err = bpf_program__set_attach_target(prog, callee_fd, "callee");
+	if (!ASSERT_OK(err, "set_attach_target callee"))
+		goto out;
+
+	err = bpf_object__load(fentry_obj);
+	if (!ASSERT_OK(err, "load fentry_obj"))
+		goto out;
+
+	fentry_link = bpf_program__attach_trace(prog);
+	if (!ASSERT_OK_PTR(fentry_link, "attach_trace"))
+		goto out;
+
+	data_map = bpf_object__find_map_by_name(fentry_obj, ".bss");
+	if (!ASSERT_FALSE(!data_map || !bpf_map__is_internal(data_map),
+			  "find tailcall_fentry_probe.bss map"))
+		goto out;
+
+	data_fd = bpf_map__fd(data_map);
+	if (!ASSERT_FALSE(data_fd < 0,
+			  "find tailcall_fentry_probe.bss map fd"))
+		goto out;
+
+	err = bpf_prog_test_run_opts(callee_fd, &topts);
+	ASSERT_OK(err, "direct callee");
+	ASSERT_EQ(topts.retval, 7, "direct callee retval");
+
+	i = 0;
+	err = bpf_map_lookup_elem(data_fd, &i, &val);
+	ASSERT_OK(err, "direct fentry count");
+	ASSERT_EQ(val, 1, "direct fentry count");
+
+	val = 0;
+	err = bpf_map_update_elem(data_fd, &i, &val, BPF_ANY);
+	ASSERT_OK(err, "reset fentry count");
+
+	err = bpf_prog_test_run_opts(main_fd, &topts);
+	ASSERT_OK(err, "tailcall");
+	ASSERT_EQ(topts.retval, 7, "tailcall retval");
+
+	i = 0;
+	err = bpf_map_lookup_elem(data_fd, &i, &val);
+	ASSERT_OK(err, "fentry count");
+	ASSERT_EQ(val, 1, "fentry count");
+
+out:
+	bpf_link__destroy(fentry_link);
+	bpf_object__close(fentry_obj);
+	bpf_object__close(tgt_obj);
+}
+
 #define JMP_TABLE "/sys/fs/bpf/jmp_table"
 
 static int poke_thread_exit;
@@ -1759,6 +1867,8 @@ void test_tailcalls(void)
 		test_tailcall_bpf2bpf_fentry_fexit();
 	if (test__start_subtest("tailcall_bpf2bpf_fentry_entry"))
 		test_tailcall_bpf2bpf_fentry_entry();
+	if (test__start_subtest("tailcall_fentry_tailcallee"))
+		test_tailcall_fentry_tailcallee();
 	if (test__start_subtest("tailcall_poke"))
 		test_tailcall_poke();
 	if (test__start_subtest("tailcall_bpf2bpf_hierarchy_1"))
diff --git a/tools/testing/selftests/bpf/progs/tailcall_fentry_probe.c b/tools/testing/selftests/bpf/progs/tailcall_fentry_probe.c
new file mode 100644
index 000000000000..b784aeffb316
--- /dev/null
+++ b/tools/testing/selftests/bpf/progs/tailcall_fentry_probe.c
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "vmlinux.h"
+
+#include <bpf/bpf_helpers.h>
+#include <bpf/bpf_tracing.h>
+
+int count = 0;
+
+SEC("fentry/callee")
+int BPF_PROG(fentry_callee, struct sk_buff *skb)
+{
+	count++;
+	return 0;
+}
+
+char _license[] SEC("license") = "GPL";
diff --git a/tools/testing/selftests/bpf/progs/tailcall_fentry_target.c b/tools/testing/selftests/bpf/progs/tailcall_fentry_target.c
new file mode 100644
index 000000000000..46da06ce323c
--- /dev/null
+++ b/tools/testing/selftests/bpf/progs/tailcall_fentry_target.c
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/bpf.h>
+
+#include <bpf/bpf_helpers.h>
+#include "bpf_legacy.h"
+
+struct {
+	__uint(type, BPF_MAP_TYPE_PROG_ARRAY);
+	__uint(max_entries, 1);
+	__uint(key_size, sizeof(__u32));
+	__uint(value_size, sizeof(__u32));
+} jmp_table SEC(".maps");
+
+SEC("tc")
+int callee(struct __sk_buff *skb)
+{
+	return 7;
+}
+
+SEC("tc")
+int entry(struct __sk_buff *skb)
+{
+	bpf_tail_call_static(skb, &jmp_table, 0);
+	return 0;
+}
+
+char __license[] SEC("license") = "GPL";
-- 
2.43.0

