Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0235316192
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Apr 2026 07:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775027302; cv=none; b=BsZBg7Vc6xU4IleuhWqtg4o7q35OKn/IaxGw92Cbg4r3WIiqTCFcd4xvmYDNKMjH+dm+lVjQ1ZkfbdOZ+vOf80BzwaUNr/i2pg/xMEOuM426oKaSMWk3mWCF79s7WNsH3KQBXb/a1KYBJduha3fB0oFrsxokslGFVjWnfVY6qrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775027302; c=relaxed/simple;
	bh=CcYQvslZdIP7G54tjs43uDnqtNjfbS0YKu4qfnTDKDY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TLxU/aC79VSuN09MkHlEGlX6H5kJn62pr6TiGiMuByR27odHxCNpa2PrzoIH+LHsbdrWdKq/zWAVyUwAGYIkr/4KEqjyYpyNzZBLagIFNzIkeeCLa9kmCdqS/ZxJe36g1/KuS0dQ2X2wqYjO8GWz0B7pUPCHmdt+VvE1m9x1570=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=WDhzaJTl; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="WDhzaJTl"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso67154895e9.2
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Apr 2026 00:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775027299; x=1775632099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UDRli6b8x7cS211Z9QsZ2vSa08qxxmWI+BT+EqkhoSk=;
        b=WDhzaJTlfjZ6J+sVVNGwQGwONu2UtCOth+rQkLGeT56TIOJBGwvaerFhTv2K8HlEyl
         wv7YOauAFrhMX9AUnnUxrrAeNPbyZvXhNWL1Gfq4EfatTYPM/Stl7B/HTYvhqubb/y+3
         DEOEvq7O04EEcPxp3iPG+zU2Lb+c0xeWv4mE71ZRh2cyHMVWw6LITspasvwVUwCA8GxQ
         JygQODFcz+Sr2rkZml+1UaMkP50hRCEZNj2efcxEPgsIoBqREP3Ci6thLnB1q099oZal
         5QvFiWWz06iILrTIDc3DF5qnmAWPIe3reRDOzyg+R6P/Qo137X9zgtf2rmKowLisrdRy
         Kwyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775027299; x=1775632099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UDRli6b8x7cS211Z9QsZ2vSa08qxxmWI+BT+EqkhoSk=;
        b=akkwNILloV8To57Jbyc5jOWF6cFavmOxxp+yALu6RFMCXJGa2xAmOqKJpnEdddL4Kn
         eZdbwmW9rgUwAE9DvEeeDdRqJCqqJmF1bf08On7uG6mp9eho5qMftHdDTaSfV4aJkE/p
         C5H6HUCAC5YN4NFcJgaFtTtUM9vMKf+zAATVrNKpai7r6arlNbLFwRFpChf2mQI9I75f
         qN5kWbPK/OlnWDpMuB2FaTZcqLzuX9Kga2+Z40EkQvLJKIK/NDGTe5Wxv6GJX9LZSZBK
         Yc7sgSkX4Bxi3rOSQkDGoSSqUt/D4pbjEsqCZfYF9brBybeZ829cEYrteJnwZwCS4qkD
         Mlww==
X-Forwarded-Encrypted: i=1; AJvYcCW6ax3N6VWgCFLSvunqhBkCpY3jvNyqtGi7oSqweOtHcfj+OE0V2u3GTNGGIO3rqVVV5Umpz8fKdErMeBBOKFk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo6RAQ8b3gnsTGDrmxUHr52H+08nYlzhO9hKGFrL4G9hfu0NZe
	SUipne0JlKxbg5C3NyG6uFuUEKEtqak2QIareCRMTSRYqhSTMefZYdKJ3BE6tBPPuLI=
X-Gm-Gg: ATEYQzxBHZY/CVI0lFZnip96RHMtsgPRhATPiq6Y7fREgUCN8MTdg7DtGqrFvh+CdDy
	fqWl6++1awGBOsRxs65mAyJh40sqU2cK1d9fqh2RWcEaNLrLb7a9JGpeZn2uOZcBsy71kbeWnlm
	MF3I+6B9ag0FQNhnkdChugLCU4zL52m6jU4IUxD/s+w2KNt+JZCnrtpq+vQJR5mQt1AzMT4BIhn
	+0z60sa22dhgR4WfljxPvPxKsXVUnIi6AdjiL5YGkydUcunfv83PHDhZVtvkJB6R1IC0qz67Uya
	58FfJ2xBDGLlHcRlVsSXmVzHI0hPnonjfMgUg5xQ942xc+nYjewCBF21qzZ1wtcXWPHmjCwbYy/
	z62IY0Yh8p6krV/9DPm6lY7jhPZK/WXCOufBuCrTMW5FIYq1jeXCyA9QT7bbbeQ9XfW4j2xODOj
	yFJr5xT8MoLSK3YYySZsSzwMy2mm+Rs15kC1/fE60bAnBeX+2dsFnisLcI
X-Received: by 2002:a05:600c:1f11:b0:47e:e076:c7a5 with SMTP id 5b1f17b1804b1-4888356dac4mr35676565e9.11.1775027299200;
        Wed, 01 Apr 2026 00:08:19 -0700 (PDT)
Received: from f16.suse.cz ([121.167.230.140])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d58a887e3sm15355778e0c.18.2026.04.01.00.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 00:08:17 -0700 (PDT)
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
Subject: [PATCH bpf-next v6 3/3] selftests/bpf: add test for raw-address single kprobe attach
Date: Wed,  1 Apr 2026 16:05:04 +0900
Message-ID: <20260401070738.122709-4-hoyeon.lee@suse.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260401070738.122709-1-hoyeon.lee@suse.com>
References: <20260401070738.122709-1-hoyeon.lee@suse.com>
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

This commit adds PERF and LINK raw-address coverage. It resolves
SYS_NANOSLEEP_KPROBE_NAME through kallsyms, passes the absolute address
in bpf_kprobe_opts.offset with func_name = NULL, and verifies that
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

