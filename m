Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151A42F616A
	for <linux-kselftest@vger.kernel.org>; Sat, 28 Mar 2026 14:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774709597; cv=none; b=hLtmj2VeqfgWCBm3Q5sI0+lPvC7qhO/CSMYfGxJ0d67k+rSctlIzYjmEeQqsQpM2bUcNEFU6yvOyzDqy2rhJullKEZFf6Mvems6NznGN8x+M77N/A8U2oCn3BCYSGUZyRlQoNY7o7hxwAUM4rERo3cODdLfQ4gkT5pMdTrTlr4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774709597; c=relaxed/simple;
	bh=+JvJUtFV1FwOAyBEZih9NfIXAfatfUjyA2bfmrJIeeY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kWJTMH3ZZ7TZCUyyakCXh5LiW0ZNr+qJkkotyZFxS322wYE4H4VP0N19y35F+ROgLQPzUfXKq3apl/jIxjetIjqOgqnDDSjiE0ppSuUy34d3IoaTqmxhtoy0mygdZpsG7siehVCGbk0FWqVwTxJu7ClRddT+XdkfS9//czlWj6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UTzUi5xV; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UTzUi5xV"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a27b5ad832so3543420e87.2
        for <linux-kselftest@vger.kernel.org>; Sat, 28 Mar 2026 07:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774709591; x=1775314391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CnDYuCPPOC0a7dKZYCydLNtXkl+EJ9KEblo4sLyQOoE=;
        b=UTzUi5xVy9sC5+LgHu60Zdxy/mrmClqPNFH3sCbog7g4wVe4/Qb54xZbn65Hprar9E
         ZEqlPJ3cvuz1PDsvuPhBjJcOt4J2gq9FmxXi0kq0OdSEIc5tf9dZT+h1fJAoe0TxdBjB
         NfqfAU3Ox4eTbuXKho3WTrV/ok9nnaeYE/XoNWHLbfnXEI2AHr3F3ho8We+2wFuViPAO
         gBK+aQH+9JTB88sy0Sj2gtD4OsobT+RNTs8nY/LFxHcN7d+CY9N/+0KbqrN1O/w8mguK
         OJXZs8xS49EIyUIWeACi25xRKnlhviCYMgPzP0c0aLAWgDRGcUyqBnqpNkxTD1bbPoBB
         Bn5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774709591; x=1775314391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CnDYuCPPOC0a7dKZYCydLNtXkl+EJ9KEblo4sLyQOoE=;
        b=aMuQ0zuXYtqty/SYePVmCinxXC1If+eG7TNdqpHMYer/qUq2aOsXt1l2XLsAdsAMfI
         aIjWARiFmBzkwZQN2iXQ1LTpZTNbYL3Zl0fUlEwEC1EO36bE9BCZGJbe30dQGap11IJk
         PE64XKF0BUBC2t3IKmjTRrssOrvCKccJonrM8t0NraQ9u9CXQD31ZzKLbcR6KS0TdWiK
         gc++FTh9GsgeTeA4tk3GPQO7B81KrVsARv0dozXUDxZNs/ljuSCW5YaMajC28Ze+EBxx
         GqcX8S5z2b9s2Q7ZIwasdlaZCa8ZonKmydmu3dlXZ9lXjXrrnCI03CYRnK9caP+xbRpF
         ASyw==
X-Forwarded-Encrypted: i=1; AJvYcCX1dYJbDhJQ8YfBWpFSbtm9eMnTMaa9Qs7QihztfbNN3zXmnnazCQVvpJlv1z1DTMmO/Q6oJTLZIRmWZ9Sw2h0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7vKTI+IB10ImmGo8djotNl/B1nGEP7QCgNUl23RTTB+H26SBZ
	o69wokoQpe77Dc8vChTyfAjp8y0ac7Kyd92A1I5SdKw8pq9fyX+9594R5aF0uvTogB9BQ4+F6ST
	4TJ3Z/uk=
X-Gm-Gg: ATEYQzwYIlWHCNDnq0oAx9XVAc8l+fgulj7CjqBgH1wtIKeDISzVX24uC3QlAGy2oJ5
	aO4BnVKIOa/0xtDXxTmDLcmc42TLB/E76uNyWBGwtrMwiqeQB18FtPcM/jRuTdwTdTErKMwzI11
	qlsNtYYj6LX+W3WYFfV383820bwscdhjHc1fFh3V1zSmySRA22TeTrqgcW0uVgoBfhtuaqkAJYa
	hRDYGYOs9mEFDNs/9pu3uaV4FL96Keuv6Nn7Mem+VMPhvwrQkcBEtjYR8DbgSSt3RAtJTPjC4q0
	b64W2Pq/2vKvVHpyDfn6P4SHZTMJvxLgxFvwWwg0HHWEATbw21wqOycT3N0GxB37X2+fbek5tAL
	jhWu2JFIoKIITr2y7h2b2gAeiuBG1sqjCAptOaNurgvvA6meY8RJZH3JtAElJ0zEA7ufWvw/kym
	UZjzoZ743G0hq8DvHvOcskgsFGQJqtUuPnyWW7v7Ip9lDd3JxSloCOAxvVHZrIRg==
X-Received: by 2002:a05:600d:1c:b0:485:3f17:425 with SMTP id 5b1f17b1804b1-48727ec7681mr82529125e9.21.1774708015839;
        Sat, 28 Mar 2026 07:26:55 -0700 (PDT)
Received: from f16.localdomain ([121.167.230.140])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76916da892sm1874017a12.14.2026.03.28.07.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 07:26:54 -0700 (PDT)
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
Subject: [PATCH bpf-next 2/2] selftests/bpf: add test for address-based single kprobe attach
Date: Sat, 28 Mar 2026 23:26:09 +0900
Message-ID: <20260328142643.627560-3-hoyeon.lee@suse.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260328142643.627560-1-hoyeon.lee@suse.com>
References: <20260328142643.627560-1-hoyeon.lee@suse.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

attach_probe already verifies manual single-kprobe attaches with
func_name and optional offset.

This commit adds address-based single-kprobe attach subtests for the
two underlying attach paths, legacy tracefs/debugfs and PMU-based
non-legacy. The new subtests resolve SYS_NANOSLEEP_KPROBE_NAME through
kallsyms, pass the result through bpf_kprobe_opts.addr, and verify that
kprobe and kretprobe are still triggered.

Signed-off-by: Hoyeon Lee <hoyeon.lee@suse.com>
---
 .../selftests/bpf/prog_tests/attach_probe.c   | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/tools/testing/selftests/bpf/prog_tests/attach_probe.c b/tools/testing/selftests/bpf/prog_tests/attach_probe.c
index 9e77e5da7097..64f2ed75779d 100644
--- a/tools/testing/selftests/bpf/prog_tests/attach_probe.c
+++ b/tools/testing/selftests/bpf/prog_tests/attach_probe.c
@@ -123,6 +123,51 @@ static void test_attach_probe_manual(enum probe_attach_mode attach_mode)
 	test_attach_probe_manual__destroy(skel);
 }
 
+/* manual attach address-based kprobe/kretprobe testings */
+static void test_attach_kprobe_by_addr(enum probe_attach_mode attach_mode)
+{
+	DECLARE_LIBBPF_OPTS(bpf_kprobe_opts, kprobe_opts);
+	struct bpf_link *kprobe_link, *kretprobe_link;
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
+	kprobe_opts.addr = func_addr;
+	kprobe_link = bpf_program__attach_kprobe_opts(skel->progs.handle_kprobe,
+						      NULL, &kprobe_opts);
+	if (!ASSERT_OK_PTR(kprobe_link, "attach_kprobe_by_addr"))
+		goto cleanup;
+	skel->links.handle_kprobe = kprobe_link;
+
+	kprobe_opts.retprobe = true;
+	kretprobe_link = bpf_program__attach_kprobe_opts(skel->progs.handle_kretprobe,
+							 NULL, &kprobe_opts);
+	if (!ASSERT_OK_PTR(kretprobe_link, "attach_kretprobe_by_addr"))
+		goto cleanup;
+	skel->links.handle_kretprobe = kretprobe_link;
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
 /* attach uprobe/uretprobe long event name testings */
 static void test_attach_uprobe_long_event_name(void)
 {
@@ -416,6 +461,10 @@ void test_attach_probe(void)
 		test_attach_probe_manual(PROBE_ATTACH_MODE_PERF);
 	if (test__start_subtest("manual-link"))
 		test_attach_probe_manual(PROBE_ATTACH_MODE_LINK);
+	if (test__start_subtest("kprobe-legacy-by-addr"))
+		test_attach_kprobe_by_addr(PROBE_ATTACH_MODE_LEGACY);
+	if (test__start_subtest("kprobe-perf-by-addr"))
+		test_attach_kprobe_by_addr(PROBE_ATTACH_MODE_PERF);
 
 	if (test__start_subtest("auto"))
 		test_attach_probe_auto(skel);
-- 
2.52.0

