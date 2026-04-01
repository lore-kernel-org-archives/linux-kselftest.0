Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094653815CE
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Apr 2026 05:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775021160; cv=none; b=AS33/z91KHikr5WKN/HfsTM6mzdkM+6WPsG3WKUt2m6LZP8BdolIO/H4ziLANSZ0wFuI22lOiF5Clh62S+5ed9ZJh/e0Nqm1W/nvQDAXaUMpYxq5daCJn2AQqaWmizWKBCa//7HzgVLqb+59SuLBkqZAsEqtsQ+OcZQ0cgltPlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775021160; c=relaxed/simple;
	bh=Bx7ZKiCR+YTeCEb1pdcIvvplXe6zg+4+eQLydO/doHo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=poEX0WInr/ZQMV94F9Ffjj2d94kIUf7o1YG3+uI4A/s1hp+Yp4UtTcD4Mte1PeydgYhDfrqXcYoj8MdeND89i5N0PChgXO6AICT9wZIHASUl7F98f5MA9YrIEcvJSljnh2JbsMqepK5Jwk3CwM+bMmlhpH1Wj87ENlAIskaWHSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=KI7+qQko; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KI7+qQko"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-486ff201041so63039535e9.1
        for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 22:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775021157; x=1775625957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HqiSmwJgQ4+uNqG6p5uMKmapSGc5Bt2MrHRQWhazOtk=;
        b=KI7+qQkoOiS7ZG4ZywCKk4keIhNQYAsdsEzC6ou6emWJgkYF41M9q8WoSNmGxWWgkN
         VSD6Ih4GXXlS2/SII4MT9cY1tRXNhq4q0VKn15/F2dop4nY9h2k3q0oVhlip//yM6GR5
         NrGZR8/bR8v1TQKkOYPdGh0S4Kc0sZgZVdHng1xVjLPGBv8dqJQbMbqKKqZauoPmvh9I
         0uuyn2U6IeWIuwPVh2RSFgaXXheo/5uTbe6XsOstwRV8t2IH7yfo999TjNst8tdLIfnd
         QWW1boXsyXJcukwaRzpfBGuvdV9mLvtnDOEcFjywRjJGmTEWZn8UeWJp0jQTPiWTJSPs
         Zwcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775021157; x=1775625957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HqiSmwJgQ4+uNqG6p5uMKmapSGc5Bt2MrHRQWhazOtk=;
        b=HPXKsE8pyLpPsu95iklK46Rngr7jFVgTTyADgF0MaMLff8Hx8Gwu929w7bPdfU3bdd
         lq6W8waj5+Da6uZWQymQnLwRoMetPIphlYj4Vwk+v/AsxQ6yOCvYojQiH2s07Ai+LJFK
         1hyy8oWtPGnLWNpwQNFAmsqoLjXhOmu3x/7tVtxrYWSjJU/tV2KaeK8tMi6Bn49y87DB
         DFzOaRgJJJY9Q4Dvhseg5OWYfurlkTEmaF3eyh+KpmDSq/DZCU10jiFF3uMHMh3Z+63z
         1DTiH3xi+bQQYZrlj4xfo3N+fHZrT+dNEvkl1WeCbBNBoyKjX+LpmC8LLUn1RuvGt4XB
         WcIQ==
X-Forwarded-Encrypted: i=1; AJvYcCX32QV64kFRdAzV93UZ4Vtma5Eg3AbLgPRhRaaKKA0IT7ksSYJ2Io3PsRIIVS5/QVwlfz0FExpcUYZRMfddnMQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNpprfqumdhRLitcGHKZIfaU0aNtd457HmBiXm3vpb8DUpozVO
	q2K0ETh8f00lGQ4LSCm6/Q7mlFFit7CHuJXVmRN45yS0NpZUv1DJj8nUqYt37NCYJ+w=
X-Gm-Gg: ATEYQzwt7TCMZx2TI0gF6+iSnz8Pvosx0bL4CGNtCsnmu93dtzKRjBnwf5BJdzTjHGA
	ZcybGwzG266ULmghByDTBhad/gWUZxWP68vzGYtW0eHkMnRczVigBatKipzQA2RFdAqA/eJRotn
	ojM5x6LEwgDsrjIDjWGuITmLbfRrQL19GOW+fkp2JmagwdKbmy1/j26sqxT2gTUZ2bnpV1TPVZV
	8PHItq3gciQEKXYWxMFBrzNadaGnTFE08z24odw1XC2GRxVdXVZBAI3jYZTeIJoQp7W8lVStUxG
	iDon4MoMZ8kepYVba/wMNkFCtpDi0h46i9LG6BFYqwrPQy/5WBBA32d2eGp2r266dXdg8RNXUYI
	nj/Bh8Y/I4F6StPw5+GTgRvC+8fmAOeJvPWlkXsFJz+fDmbnxAm1yr7CyAztO0TIrpHv3J3ZOXn
	GCBNbHw+u5WEvxchdOSilHnc0AUvI5gpDV5WfqLSK3alG2tKBQHMPaZlmGeaKigg==
X-Received: by 2002:a05:600c:4f95:b0:477:a1a2:d829 with SMTP id 5b1f17b1804b1-4888356754dmr32735925e9.13.1775021157359;
        Tue, 31 Mar 2026 22:25:57 -0700 (PDT)
Received: from f16.localdomain ([121.167.230.140])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca843b818sm15308214b3a.6.2026.03.31.22.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 22:25:56 -0700 (PDT)
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
Subject: [PATCH bpf-next v5 2/2] selftests/bpf: add test for raw-address single kprobe attach
Date: Wed,  1 Apr 2026 14:25:11 +0900
Message-ID: <20260401052544.100968-3-hoyeon.lee@suse.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260401052544.100968-1-hoyeon.lee@suse.com>
References: <20260401052544.100968-1-hoyeon.lee@suse.com>
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
index 9e77e5da7097..a41542f4b35d 100644
--- a/tools/testing/selftests/bpf/prog_tests/attach_probe.c
+++ b/tools/testing/selftests/bpf/prog_tests/attach_probe.c
@@ -123,6 +123,82 @@ static void test_attach_probe_manual(enum probe_attach_mode attach_mode)
 	test_attach_probe_manual__destroy(skel);
 }
 
+/* manual attach address-based kprobe/kretprobe testings */
+static void test_attach_kprobe_by_addr(enum probe_attach_mode attach_mode)
+{
+	LIBBPF_OPTS(bpf_kprobe_opts, kprobe_opts);
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
+	LIBBPF_OPTS(bpf_kprobe_opts, kprobe_opts);
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
+		ASSERT_EQ(libbpf_get_error(skel->links.handle_kprobe),
+			  -EOPNOTSUPP, "attach_kprobe_legacy_by_addr_err");
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
