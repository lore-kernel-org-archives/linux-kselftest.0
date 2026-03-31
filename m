Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAC83EDAAF
	for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 09:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774950074; cv=none; b=Rn0/GXGDlnLT1tH9+mDrm3EbNuI+sxEfLR47pMcelS1Fxg+AzH2/kak+l8AZjDlFyS0jccRmYUOR4FzeBctFY0gMPe53Mz7ScX+N349W2kXWw8kJ7IUvnBgb9xj3qZ3krlT6UuV6dDz1F0sOIrj5vvyn63nmrHrJ5/zIti9HyN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774950074; c=relaxed/simple;
	bh=rQBh02MaAajKMfKDC8YMNgw3hVbVvfm1kxuP49DEQG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LiIFYE4k8yIFT8bcZjLjvLIpc3e4yfGM1/givJ29vedPc9cXt8OPk9Vrl2zqsucO7p6864KYLBYWFLO/fnHUL8Vd3Gsy+btQZba5Zx51H7LVApyoh8cSaXWQ9NnEXsUjc2NX25Fq6E1r9+VoGMOGWEkNTh8DZ7ljspPQZZu8qh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LHVA964S; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LHVA964S"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-486fd27754bso54136565e9.3
        for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 02:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774950071; x=1775554871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SsziD70VgpPgjTdfHcq7GvG3ra662CqVO4P1uVRU6Ec=;
        b=LHVA964SVm14THwbjTqDB3ocvdVbXmAt5uWQg0I/W5iB0YDKc0L4MQwkLIdMoJqloW
         su0Adq7oqcoA5Y00iRuIuQe086M6i1rIBe/kUAluJ3+XSQ781Hwzu1R5qBbipuTMDX1C
         FZcuyIdfzgdf2nCh+o6H0X8OFU8HWyB2R7KmD3gyOYjgKRk5dlsxlAXUww3jtgQDacBr
         lHXITDgQ8imXaqZPdRYOasXwN74r6n/opcpPuSpkYww8F0xUxNq4oXZ1iwSzjW9xQedW
         gDDch+txYqvdJUDuqi2n2t0u4NhunIJdMthjgOFHlQQZqKEiwY2AokYjcfESt4StNgSn
         C4lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774950071; x=1775554871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SsziD70VgpPgjTdfHcq7GvG3ra662CqVO4P1uVRU6Ec=;
        b=G3yA+A3KeLKGkQfrqkXwUdJeYO9h9qcvcJfALv14NU/D4bsH5rSPU7o79BVbO06HFq
         mSmx1WoHErXcH1GTyAVEpDKIkwopJ/8aAww5fYHsofUXXTHJ1mhzWJCwe/FtJRUgj88G
         7e8kRq+YfeYTJDkzGJrGTHmElT0OGgNbSTI+NZIlihvb6XlRZfSOXUMQQDS9N13k4Hoe
         3w6fxcSofJQvs73deC7VTjQxZboBfQKm2JKs2CijxMmKW4pTY7YH/J9dzFHQ2x8ytPuT
         cyu5lJeFVQ+caR+DrDJ6rAH01rkZiwTXEdIWXYqgdO1Zdz9tvCVaOX10Qm7XRB1WlJ4m
         slQA==
X-Forwarded-Encrypted: i=1; AJvYcCXvQtsYto3chaTD5oS+2Rcvpn6x36ImSE9+zRyneFrXsqiNnmpbkvYsz9KY4IqDjDBgLrMhfSCJezK+8xXKDx4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBMJQeDX5HI2P8zJQvhNP0KR94HnseaMmJjkfU7Gu0qd5HjeJC
	Ih++nJV4eASRn4Xs7vK+J2UFVQ1i73AL3EsNEgcD/rkmB0zGSflrjV0PzcIbHtrHQfo=
X-Gm-Gg: ATEYQzzqjS2fCW8T3Dd9bSpLqivWEzJqSG9c8HXJpalqG70WL7pBOT4DBx5Sd1KS5+f
	1FrWVWRF9VCd6gNLxuOTXNhXWN3tZYSkApn+JZGaLtgWI7C8EWJQ4U3iJod3vE5yJ0MMySkbj8S
	0iRti8SRL7O23KDI55wgu603sK98okKtU0yAktlryulAZ7oVb5EB2JDxfHwec1WOx7BM1xmg4Tb
	7c7j1VFrVj8x3ye16rbnvxdE7Hq3oftxB5DG6Vg0PYhO65EVZeJpVawqLX5WGFlWmTDFjt+6eq1
	ejsdjRd6yV4jad8gFwX5h+b7ACnli8sHGM2cmQuWexVXaEDp5v6q+83ROVuTv+9KYfAfP4lEYps
	IoFUmNSaDtIFMvIht448Z2FdEsaSvXyU7xbC9KY61W3XztkuQFQnqh5AHrloG6+9lMzEvXD4Nrw
	5jktcu9fAZG0ZqBRJAYO7fGkVkJsNTwqa1vaWho+k6M8W04hwGzseLBvyPQBho6w==
X-Received: by 2002:a05:600c:870f:b0:488:80b6:873a with SMTP id 5b1f17b1804b1-48880b6936emr1354875e9.21.1774950071278;
        Tue, 31 Mar 2026 02:41:11 -0700 (PDT)
Received: from f16.localdomain ([121.167.230.140])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427afbe0sm130079565ad.72.2026.03.31.02.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 02:41:10 -0700 (PDT)
From: Hoyeon Lee <hoyeon.lee@suse.com>
To: bpf@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>
Cc: Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Feng Yang <yangfeng@kylinos.cn>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v3 2/2] selftests/bpf: add test for raw-address single kprobe attach
Date: Tue, 31 Mar 2026 18:37:47 +0900
Message-ID: <20260331094058.49229-3-hoyeon.lee@suse.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260331094058.49229-1-hoyeon.lee@suse.com>
References: <20260331094058.49229-1-hoyeon.lee@suse.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, attach_probe covers manual single-kprobe attaches by
func_name, but not the raw-address form that the PMU-based
single-kprobe path can accept.

This commit adds PERF and LINK raw-address subtests by resolving
SYS_NANOSLEEP_KPROBE_NAME through kallsyms, passing the absolute address
in bpf_kprobe_opts.offset with func_name = NULL, and verifying that
kprobe and kretprobe are still triggered. It also verifies that LEGACY
rejects the same form.

Signed-off-by: Hoyeon Lee <hoyeon.lee@suse.com>
---
 .../selftests/bpf/prog_tests/attach_probe.c   | 82 +++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/tools/testing/selftests/bpf/prog_tests/attach_probe.c b/tools/testing/selftests/bpf/prog_tests/attach_probe.c
index 9e77e5da7097..817c4794d54e 100644
--- a/tools/testing/selftests/bpf/prog_tests/attach_probe.c
+++ b/tools/testing/selftests/bpf/prog_tests/attach_probe.c
@@ -123,6 +123,82 @@ static void test_attach_probe_manual(enum probe_attach_mode attach_mode)
 	test_attach_probe_manual__destroy(skel);
 }
 
+/* manual attach address-based kprobe/kretprobe testings */
+static void test_attach_kprobe_by_addr(enum probe_attach_mode attach_mode)
+{
+	DECLARE_LIBBPF_OPTS(bpf_kprobe_opts, kprobe_opts);
+	struct test_attach_probe_manual *skel;
+	unsigned long func_addr;
+
+	if (!ASSERT_OK(load_kallsyms(), "load_kallsyms"))
+		return;
+
+	func_addr = ksym_get_addr(SYS_NANOSLEEP_KPROBE_NAME);
+	if (!ASSERT_NEQ(func_addr, 0UL, "func_addr"))
+		return;
+
+	skel = test_attach_probe_manual__open_and_load();
+	if (!ASSERT_OK_PTR(skel, "skel_kprobe_manual_open_and_load"))
+		return;
+
+	kprobe_opts.attach_mode = attach_mode;
+	kprobe_opts.retprobe = false;
+	kprobe_opts.offset = func_addr;
+	skel->links.handle_kprobe =
+		bpf_program__attach_kprobe_opts(skel->progs.handle_kprobe,
+						NULL, &kprobe_opts);
+	if (!ASSERT_OK_PTR(skel->links.handle_kprobe, "attach_kprobe_by_addr"))
+		goto cleanup;
+
+	kprobe_opts.retprobe = true;
+	skel->links.handle_kretprobe =
+		bpf_program__attach_kprobe_opts(skel->progs.handle_kretprobe,
+						NULL, &kprobe_opts);
+	if (!ASSERT_OK_PTR(skel->links.handle_kretprobe,
+			   "attach_kretprobe_by_addr"))
+		goto cleanup;
+
+	/* trigger & validate kprobe && kretprobe */
+	usleep(1);
+
+	ASSERT_EQ(skel->bss->kprobe_res, 1, "check_kprobe_res");
+	ASSERT_EQ(skel->bss->kretprobe_res, 2, "check_kretprobe_res");
+
+cleanup:
+	test_attach_probe_manual__destroy(skel);
+}
+
+/* reject legacy address-based kprobe attach */
+static void test_attach_kprobe_legacy_by_addr_reject(void)
+{
+	DECLARE_LIBBPF_OPTS(bpf_kprobe_opts, kprobe_opts);
+	struct test_attach_probe_manual *skel;
+	unsigned long func_addr;
+
+	if (!ASSERT_OK(load_kallsyms(), "load_kallsyms"))
+		return;
+
+	func_addr = ksym_get_addr(SYS_NANOSLEEP_KPROBE_NAME);
+	if (!ASSERT_NEQ(func_addr, 0UL, "func_addr"))
+		return;
+
+	skel = test_attach_probe_manual__open_and_load();
+	if (!ASSERT_OK_PTR(skel, "skel_kprobe_manual_open_and_load"))
+		return;
+
+	kprobe_opts.attach_mode = PROBE_ATTACH_MODE_LEGACY;
+	kprobe_opts.offset = func_addr;
+	skel->links.handle_kprobe =
+		bpf_program__attach_kprobe_opts(skel->progs.handle_kprobe,
+						NULL, &kprobe_opts);
+	if (ASSERT_ERR_PTR(skel->links.handle_kprobe,
+			   "attach_kprobe_legacy_by_addr"))
+		ASSERT_EQ(libbpf_get_error(skel->links.handle_kprobe), -ENOTSUP,
+			  "attach_kprobe_legacy_by_addr_err");
+
+	test_attach_probe_manual__destroy(skel);
+}
+
 /* attach uprobe/uretprobe long event name testings */
 static void test_attach_uprobe_long_event_name(void)
 {
@@ -416,6 +492,12 @@ void test_attach_probe(void)
 		test_attach_probe_manual(PROBE_ATTACH_MODE_PERF);
 	if (test__start_subtest("manual-link"))
 		test_attach_probe_manual(PROBE_ATTACH_MODE_LINK);
+	if (test__start_subtest("kprobe-perf-by-addr"))
+		test_attach_kprobe_by_addr(PROBE_ATTACH_MODE_PERF);
+	if (test__start_subtest("kprobe-link-by-addr"))
+		test_attach_kprobe_by_addr(PROBE_ATTACH_MODE_LINK);
+	if (test__start_subtest("kprobe-legacy-by-addr-reject"))
+		test_attach_kprobe_legacy_by_addr_reject();
 
 	if (test__start_subtest("auto"))
 		test_attach_probe_auto(skel);
-- 
2.52.0

