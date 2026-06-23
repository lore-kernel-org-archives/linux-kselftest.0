Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E9E385D9C
	for <linux-kselftest@vger.kernel.org>; Tue, 23 Jun 2026 01:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782178863; cv=none; b=bZsREE3G94pA95yrT4SPSU3yyPbExLpTiywW5QizO2J6m569aux3v848JhXXwxw2tKQCWYPFkqcMFuDF+8PXu5sHEvXDl34JHZGORbCS7qdPMPV4czgwnRqGPUIWW8iilFcZ7jOVbHCblIltCXILghbqauiez2C8zhR3hnB+yQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782178863; c=relaxed/simple;
	bh=TeljXPih3XySpBflJVQVLxHCds/34/7xYyQklL7E838=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dFU6gc+XMhLaHiyZF4HK4kBf2EOz8QriEQf5+JPS0T39m0oVZVBOBTJExrKKkoy0Ec9SlPlu3k56gknW0KMVwpi0G8mQ5TK6gupxC2ukGJCEsTYLgMpuake8NCOkM5f0qafDdkWALqR2Lk8mJQK4UxaEpL89vLjGsHmscM0O21I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cdJmT8bU; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cdJmT8bU"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c88973b6965so240672a12.1
        for <linux-kselftest@vger.kernel.org>; Mon, 22 Jun 2026 18:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782178860; x=1782783660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dGVecrSz6dhJP1jTtBAIJOkndE4qmahRc7vcfNDXjzo=;
        b=cdJmT8bUvgv6nOcVBX7TUVeG9a+WndOa4sBxFrA7k8Vh2ZWTaTyaBZUQYY1sloZt5F
         r+qHxY92zLdyVLeVB5j2bVxYUUDEIWINUosiYpYzvHpia/xTxYWUHUstMEZLeE/PaqEQ
         vf7ojUb0mMBvPFmrtJOmu1Rfn9pDZbwXpv7/a+dd/jVTIBSlAL2h3SkqCoqTRxwPAB9d
         +FbIR86hR3PfeL63Ts2zFqsoBiCpIvryrlJv7WfY46IIlUtlxH3OrldnZdavQawaPhkM
         eOqXQq65J1vRtwd7aIevD/07QKsvj/LP3dKKZvPRqHLkJ8ypU+qppVklFYr8r9PfrdkU
         jD8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782178860; x=1782783660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dGVecrSz6dhJP1jTtBAIJOkndE4qmahRc7vcfNDXjzo=;
        b=DPaodsRhoPFm+PvxjhOUgRSjpVPenZsLF4NkkQDvf2NHlyhRuprWQI/XgK9OWQq1wV
         BFnMrGrmUwTL6oGA4d22acuYh2rpO1kyVkLFCNO1rrLStUz7EjCaqsf/MIlhfc1oAvoT
         1YnYkd51H14rXPs+RqPOTdgM6MxTSXH+ev5NbasQnm8tdOseRUIOngqccZ3PVwtVpR5N
         CuGQ9wGYSSTmipFoyZghjNz2ru4aezLvDojvSnK1CbbNZEyZecr0nurtI7W7i7ri762D
         9yGS88A+SaieY/qm0C7VSSA+1urYDWqfCcxqyjvfEF8INzs4/bp5+k4rqWeMefxvj7Es
         HZTg==
X-Forwarded-Encrypted: i=1; AHgh+RpqBo3IBptzHVPEaHkmxKNAHKsJsYgByZNyY++iiOYtIkfYcaWUU77/wXUnMoEBNupJ2KzRhoWFXmID164Uy48=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc39m5GNoaFMWm0SiCu3svEnSOUwkcTOPRGQga4fG0fN4VZh7+
	QsslyBAWDAcmN+zBujpyJLXY+HwMW2B4Cc+8ah98Ld93fy+vSeukbUge
X-Gm-Gg: AfdE7clwXe/+V7Be1VjHfpVp0RX7uYrRsbzh96KupGr21mTYxwxEMMlBGhvDieuYDMk
	FEeZKgHyWAUoT/Jem87Po1EPNIK1IoHiYoh2Gk8YnwOYr6Yi/B/CBqijdig2rVPKFfOvd5y4iH9
	xZIMI8EP8z7LEAZ126jFXtOjcFMLO+K1h8G3Wu9TavQjnMkvKTVIplqS1viWWvlQNIW3TXScwS9
	UbjVb/eXOT/baaHuVB6DJzuR0mdXDuyW7CE+JIer10GuSJWn0On1ystqe0VmvNILcOgIgF18u9t
	kaIdErlFFW62MQ/JxEpd3m8nQaCG2GGLzFvOxJpN0SBYtl8FoX5AM3QD5e2AFQp6uHGhLwkcjCL
	Vmx7FbI9f7X3uoRzE/MlpMf5UVMwtGxiI/ySH3XPKpFHxdBUpIwpV8r5tTqphDPn0VGkVQP9wkO
	ZoJWN5/XsrpOC04a0eR5oC1rVC+grsxdYzAZrfk0z556cKR7xFH4XlcAfevzKgrJ9TOTpc86cxe
	PfY+R676zg=
X-Received: by 2002:a17:903:4b4f:b0:2ba:6601:8e3d with SMTP id d9443c01a7336-2c7c3d5e7a0mr11648095ad.9.1782178859632;
        Mon, 22 Jun 2026 18:40:59 -0700 (PDT)
Received: from localhost.localdomain ([202.8.105.120])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7444aad83sm90093085ad.79.2026.06.22.18.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 18:40:59 -0700 (PDT)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: bpf@vger.kernel.org
Cc: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	paul.chaignon@gmail.com,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH bpf v4] selftests/bpf: Cover partial copy of non-linear test_run output
Date: Tue, 23 Jun 2026 09:40:27 +0800
Message-ID: <20260623014027.402820-1-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

prog_run_opts already verifies that BPF_PROG_TEST_RUN returns -ENOSPC
for a short data_out buffer while still reporting the full output size
through data_size_out.

Add the same coverage for non-linear test_run output. Use pass-through
TC and XDP programs with a 9000-byte packet, a 64-byte linear data area,
and a 100-byte data_out buffer. The expected output spans both the linear
data and the first fragment.

Verify that test_run returns -ENOSPC, reports the full packet length
through data_size_out, and copies the packet prefix into data_out for
both non-linear skb and XDP frags paths.

Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---

v4:
- Send only the selftest patch; the fix patch has been applied to bpf/master.
- Initialize data_out buffers to avoid reading uninitialized stack memory if
  bpf_prog_test_run_opts() fails unexpectedly.

 .../selftests/bpf/prog_tests/prog_run_opts.c  | 70 +++++++++++++++++++
 .../selftests/bpf/progs/test_pkt_access.c     | 12 ++++
 2 files changed, 82 insertions(+)

diff --git a/tools/testing/selftests/bpf/prog_tests/prog_run_opts.c b/tools/testing/selftests/bpf/prog_tests/prog_run_opts.c
index 01f1d1b6715a..beb6fa78fd94 100644
--- a/tools/testing/selftests/bpf/prog_tests/prog_run_opts.c
+++ b/tools/testing/selftests/bpf/prog_tests/prog_run_opts.c
@@ -4,6 +4,10 @@
 
 #include "test_pkt_access.skel.h"
 
+#define NONLINEAR_PKT_LEN 9000
+#define NONLINEAR_LINEAR_DATA_LEN 64
+#define SHORT_OUT_LEN 100
+
 static const __u32 duration;
 
 static void check_run_cnt(int prog_fd, __u64 run_cnt)
@@ -20,6 +24,69 @@ static void check_run_cnt(int prog_fd, __u64 run_cnt)
 	      "incorrect number of repetitions, want %llu have %llu\n", run_cnt, info.run_cnt);
 }
 
+static void init_pkt(__u8 *pkt, size_t len)
+{
+	size_t i;
+
+	for (i = 0; i < len; i++)
+		pkt[i] = i & 0xff;
+}
+
+static void test_skb_nonlinear_data_out_partial(struct test_pkt_access *skel)
+{
+	LIBBPF_OPTS(bpf_test_run_opts, topts);
+	__u8 pkt[NONLINEAR_PKT_LEN];
+	__u8 out[SHORT_OUT_LEN] = {};
+	struct __sk_buff skb = {};
+	int prog_fd, err;
+
+	init_pkt(pkt, sizeof(pkt));
+
+	skb.data_end = NONLINEAR_LINEAR_DATA_LEN;
+
+	topts.data_in = pkt;
+	topts.data_size_in = sizeof(pkt);
+	topts.data_out = out;
+	topts.data_size_out = sizeof(out);
+	topts.ctx_in = &skb;
+	topts.ctx_size_in = sizeof(skb);
+
+	prog_fd = bpf_program__fd(skel->progs.tc_pass_prog);
+	err = bpf_prog_test_run_opts(prog_fd, &topts);
+
+	ASSERT_EQ(err, -ENOSPC, "skb_partial_err");
+	ASSERT_EQ(topts.data_size_out, sizeof(pkt), "skb_partial_size");
+	ASSERT_OK(memcmp(out, pkt, sizeof(out)), "skb_partial_data");
+}
+
+static void test_xdp_nonlinear_data_out_partial(struct test_pkt_access *skel)
+{
+	LIBBPF_OPTS(bpf_test_run_opts, topts);
+	__u8 pkt[NONLINEAR_PKT_LEN];
+	__u8 out[SHORT_OUT_LEN] = {};
+	struct xdp_md ctx = {};
+	int prog_fd, err;
+
+	init_pkt(pkt, sizeof(pkt));
+
+	ctx.data = 0;
+	ctx.data_end = NONLINEAR_LINEAR_DATA_LEN;
+
+	topts.data_in = pkt;
+	topts.data_size_in = sizeof(pkt);
+	topts.data_out = out;
+	topts.data_size_out = sizeof(out);
+	topts.ctx_in = &ctx;
+	topts.ctx_size_in = sizeof(ctx);
+
+	prog_fd = bpf_program__fd(skel->progs.xdp_frags_pass_prog);
+	err = bpf_prog_test_run_opts(prog_fd, &topts);
+
+	ASSERT_EQ(err, -ENOSPC, "xdp_partial_err");
+	ASSERT_EQ(topts.data_size_out, sizeof(pkt), "xdp_partial_size");
+	ASSERT_OK(memcmp(out, pkt, sizeof(out)), "xdp_partial_data");
+}
+
 void test_prog_run_opts(void)
 {
 	struct test_pkt_access *skel;
@@ -69,6 +136,9 @@ void test_prog_run_opts(void)
 	run_cnt += topts.repeat;
 	check_run_cnt(prog_fd, run_cnt);
 
+	test_skb_nonlinear_data_out_partial(skel);
+	test_xdp_nonlinear_data_out_partial(skel);
+
 cleanup:
 	if (skel)
 		test_pkt_access__destroy(skel);
diff --git a/tools/testing/selftests/bpf/progs/test_pkt_access.c b/tools/testing/selftests/bpf/progs/test_pkt_access.c
index bce7173152c6..cd284401eebd 100644
--- a/tools/testing/selftests/bpf/progs/test_pkt_access.c
+++ b/tools/testing/selftests/bpf/progs/test_pkt_access.c
@@ -150,3 +150,15 @@ int test_pkt_access(struct __sk_buff *skb)
 
 	return TC_ACT_UNSPEC;
 }
+
+SEC("tc")
+int tc_pass_prog(struct __sk_buff *skb)
+{
+	return TC_ACT_OK;
+}
+
+SEC("xdp.frags")
+int xdp_frags_pass_prog(struct xdp_md *ctx)
+{
+	return XDP_PASS;
+}
-- 
2.43.0

