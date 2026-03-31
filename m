Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D566F4035C9
	for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 15:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774970728; cv=none; b=ozaQ/rDHeFXF6walUwzGGviiyZFrQMgAMLSOr1sEZTz+Is2T1aSUv8010S7SpDDX//nXhPZ/+wbqmIUo+i3LeIxtR6V9RvHZOO28EwVvZlyJZXqKV8PkKu0yPbS642+x/u9aDlsuGCHWAgRe0bn8XiggwdsMNVrpcGyNBPPRr1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774970728; c=relaxed/simple;
	bh=rQBh02MaAajKMfKDC8YMNgw3hVbVvfm1kxuP49DEQG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cBIoMh2wkDbQpXAWw8e4nh2NqfheIOrCGCNmBouzLI/1YeX0PnVjYVpmfJeeqdEugKK1iVlxXjP8xIm8CQ8UbJVKzxoMRQG32d+cEyNGoFjpQzuST8nIuHRVLum9Nb650Mtgn7ONsGNnBNxCbK1Hdi8KNX/c/wQwgzQDTjQwcIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ckLFKafb; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ckLFKafb"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b980785a0bfso823381066b.3
        for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 08:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774970723; x=1775575523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SsziD70VgpPgjTdfHcq7GvG3ra662CqVO4P1uVRU6Ec=;
        b=ckLFKafbvdz9cqr2ZRSkVDQVXu744rMOuN/MlVSTqcJf3JfvDMtLKm/hC6k00tkChi
         WE4IsezwxptukObTtAGC53RKlI6pDTJL8lbB7mMXGA8UdgmB1mQ8Eh/b4lQcgUmyO9ln
         SAGI1OxBpPmBqP2itNU18rq1EUBVxlFPDdBgJDf1uDiDeeGjjUmdhNTnHtWh+mJHKBYS
         REHEaX842O5YaUaUkNg6AqOVpFTWBPtaZdzAj9C/7skHmX1mfv3nLqlMcFtA8/L74HG1
         Sq4ZCTorh4igPwV2ZTTr2LJ4oMqDF6zOL9+d4K6Zsquz65Jhx+8jneeXo41WwvpJiQpR
         M1vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774970723; x=1775575523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SsziD70VgpPgjTdfHcq7GvG3ra662CqVO4P1uVRU6Ec=;
        b=o5rIBa/BSNaLbWQ5FmOlkf7cuXW8kuG5dkLOiXqQDbLw0UDSRUkns7oN+iNddKGeVk
         yBWSieFkapjGEI2dAHIZC9ALmBNnpXDw0PREhtzuoSsYW7HN3aTVe+Vyi1schFeWHDzP
         IXx57CjoLOb7lULtfbBAUEQuYPCKEzxO66PwqXWik1MbpJZCc8tu6sS8DeftD+IbnIqN
         AUA22laAvFBlIzj05nRQXWz8RKVghu/Z0Oe+cDyg0ziEn/CCi5cl73Wu8+pbAFfLkj48
         YgTJICXmxSh1gKvz344cbC3LD06R8i2It5uwlrdBLfOKm1K2kanoy0XBYqwRSTi3c5Zi
         iirQ==
X-Forwarded-Encrypted: i=1; AJvYcCUD9KycMTN6gXOG4mJ3zcSpdSKHkB9ZO2cQxJ+wBebS/wf3EF4bvuQFH9MXizVuedrzothAAyOA39PwmHI93/U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFeMm10XvnykhA5j/fP2W+5touBdQTGiKmcgYhL8DUJI+kQza/
	OW4ECypLuFbhZW5Q6WD57qQIrZFmNu3SDdiADZYOhQ3RBVj/c3fJvtJ5pDCI1V27a7c=
X-Gm-Gg: ATEYQzxDPiM7GEogsTDeuq4haj6JjW5U20Mc3y9DCp2R+kBtbukYABp2pzM2glDbh7J
	gOrb4+D7wqzxORK9YtWJbrKZulf9J8tXKT2BN8atWGcYkXzgLTMmAQDj0Zeb5adUzl+R0MFUW62
	qK5WaXIuQBDhmgYmHzCzzDsAADdEgn1VG6mgQ4oRadXfuzmc/ANSJ2OKu/JtwwqTBixhewtVNvC
	jjbaFh8Q5VA42WgijWICE22Asne5z8OXWHjyHXUyqKDWm/UZSSxQTdmQxxacqLnf2BJtp0UcpHn
	0H0P11hLXyaDXP8AGz+jDEfMnzMXq++wN3zHe90jpc0nO7FPii4C4woh4Y38uqYF1JXQ82zorjY
	zaofYLpweHKtdy9d989n/XnG3fh2HiF4ll+m5fjAuPpT0gIwV76MorB1Xa9HWh/7g054VsGg/bk
	PNlsd9zYVlGGyvkGDiK7KIt/SJW0MPtGWUZKHgH0racdoTb5BS/3nTwpO1ogOE9A==
X-Received: by 2002:a17:907:e8a:b0:b97:eae9:d45e with SMTP id a640c23a62f3a-b9c13cc4dd3mr1812466b.50.1774970722671;
        Tue, 31 Mar 2026 08:25:22 -0700 (PDT)
Received: from f16.localdomain ([121.167.230.140])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dba558226sm1264003a91.2.2026.03.31.08.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 08:25:21 -0700 (PDT)
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
Subject: [PATCH bpf-next v4 2/2] selftests/bpf: add test for raw-address single kprobe attach
Date: Wed,  1 Apr 2026 00:24:36 +0900
Message-ID: <20260331152509.70468-3-hoyeon.lee@suse.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260331152509.70468-1-hoyeon.lee@suse.com>
References: <20260331152509.70468-1-hoyeon.lee@suse.com>
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

