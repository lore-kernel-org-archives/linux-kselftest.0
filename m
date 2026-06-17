Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDCA3DDDA0
	for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 09:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781689015; cv=none; b=eR6gw9ioXA/hOoGKwaHq0IGgSPtnzmMJjX2lgafGOyCNa+hIvEEhA4dOe/XCGN7MpvPcVdlXHKZKHTftl31P4y63tQIYWx82URTGb1TvNWW6Gx1Zs5cu5gzOg/aV0PhIcF+RG4LVH5wSdX48DJilCIIjH56TR1BIccnIvY6Ebr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781689015; c=relaxed/simple;
	bh=PdBtwKgFqyMGtomh7hTUPsscrriY96d4wUo+kESMV6s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PJH4kTXpsWTzxvp1M09WGDKJCg6YQ15TN8D8VQwADjyVRMxUzRs6aAcgnQy/lhE+i1Aainw/Nt+ycD3bT9xUUwB23O2FVwaxgZxS+7XH5xt2xBW90m4Nt2sVOtXi4hzZ5AWzke52b74oXJnXPnYAq4nlQkz7zMKOWWjliXPuapI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P2uObVUW; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P2uObVUW"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84231305a80so3238674b3a.0
        for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 02:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781689012; x=1782293812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5HGsJuBJyPxuBJWOZpUxJqFkb8helZpMElVirEJAoUU=;
        b=P2uObVUWQDzWZwNk/QWV/rrp23bBAIo0SmfraD9noK8JbCi5hI7Xfwfx3xgUlTr3FM
         EV+wjcIPCWnstK6iSe5US6+Ocy92HHT8Bu5M2Xw3Id1pFJkj2gAZG05WwZZ2OLBX9xmn
         rK0yINbI+f30A3e5dUgnRcOYh8VRa+mQtivTpOsD/2QHcwhP3bpXABdzj90MvpQ2l/5V
         cvwzccJKCr+kF00nPKW8Dms9R44mUHW4cc7oTaSaVUOxD2W0zMfcnEQ6lfND6w4PIrlT
         GbE+KdD/CwjzAONSCaYe8Q+VHYKIsy2q0ybc3hqoSdyxJkfAlPQEZkv1APeNFRIPkgu6
         Hw+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781689012; x=1782293812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5HGsJuBJyPxuBJWOZpUxJqFkb8helZpMElVirEJAoUU=;
        b=TN6/MwoAgfRf8+nXGF7Bk1VQMsGHR+Jl5FD9vVIcCSLmRo4LIeT8ZfbCDDFdyi3avD
         +K2P1rfCf9+EN1gM1MWv2cQ+OzdVj/RoRIpFUmfGDGjQDpIRAi03yFaxq3/luFgMEQSR
         B92LemcMEMd1HNvi84Dyc0OqJz0LAdYtMYiXiT55wZMyh0N3oOzAJav03iuUG0R+nD//
         2DUmPVtbybdFSPYvEAUk03eN7QXvuLBD3v6NoIU8hpUI97Qb9uVo8uWjTrrmsZGKGFeB
         pSLJDCE2b/extLvj1LTQgPy1vLBgdbvi46gMjwy0iNRZb3Aw21qm/Xah39rPzRCE4LSe
         HuDw==
X-Forwarded-Encrypted: i=1; AFNElJ/kwAXfIGDstJRO1bj5/RQXjXsGIt3dpjuhoMxbDy5bGTJ73cG7zexCg/S5JuPiHS491+34greSY0qnp9sc5B8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNlZZzORXQv3ecp5Bky3X87P43tgzMPMNWdosbeow6KGWHcf7A
	ZbRGUZki20SMS4ZUnqFhp4sNyGJ6QPuELJE81CsdQ7BkivXvlXlR5uG3
X-Gm-Gg: Acq92OEBc9bMbZ6L19dWLMdD5Gjt6dyqO7hTOoqFskErez2wWJQqaOj/LhOkOQSk37v
	YVTCfUqM7fMC2qKwX5RDQWBL9AQRgSr2XkvTWe/uWgWWNcss+5CYt9Gl2UEZ/L50bJPoDytEKRg
	cwDyN3KCpSEyH9XWBSXGPLBUCcvmryiUBKYGNRQ5ic26B+GoG99PbvWyKwTYbbewHcrCslOd6nX
	dwQVBC9NyP27V/VWdgmoJd7C2i2JWlZEZdpg/QMkh61UlFISf5GcnJ5BKbvXdHv447XAMVu8dwI
	xZO4D36DEb1iW/68ns6zWtl3e9BlWvUBylESqrqzjIYwVH46/MxRuaONHSb1jIlpxtu8PQ7qrGn
	jVNJzqdjtECClFfCDd46+HGrPgvh99k4oravQozAbNq5Mt4TwJdpJfpmOcO2VVsnCzIT7sXNikO
	TvOegPhdzYTDBHgRRlh5sL4AwKZvMORSVVQj/DIejIJKyi0HZR5OTGeosvjjrFVts=
X-Received: by 2002:a05:6a00:3697:b0:83f:250d:59c with SMTP id d2e1a72fcca58-845245b79e6mr3179862b3a.39.1781689012085;
        Wed, 17 Jun 2026 02:36:52 -0700 (PDT)
Received: from localhost.localdomain ([2a12:a304:100::206b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b0226acsm15521653b3a.48.2026.06.17.02.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 02:36:51 -0700 (PDT)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: bpf@vger.kernel.org
Cc: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	memxor@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	toke@redhat.com,
	lorenzo@kernel.org,
	paul.chaignon@gmail.com,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH bpf v3 2/2] selftests/bpf: Cover partial copy of non-linear test_run output
Date: Wed, 17 Jun 2026 17:35:57 +0800
Message-ID: <20260617093557.63880-3-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617093557.63880-1-sun.jian.kdev@gmail.com>
References: <20260617093557.63880-1-sun.jian.kdev@gmail.com>
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
 .../selftests/bpf/prog_tests/prog_run_opts.c  | 70 +++++++++++++++++++
 .../selftests/bpf/progs/test_pkt_access.c     | 12 ++++
 2 files changed, 82 insertions(+)

diff --git a/tools/testing/selftests/bpf/prog_tests/prog_run_opts.c b/tools/testing/selftests/bpf/prog_tests/prog_run_opts.c
index 01f1d1b6715a..9cc898e6a9f7 100644
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
+	__u8 out[SHORT_OUT_LEN];
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
+	ASSERT_EQ(err, -ENOSPC, "skb_nonlinear_partial_err");
+	ASSERT_EQ(topts.data_size_out, sizeof(pkt), "skb_nonlinear_partial_data_size_out");
+	ASSERT_OK(memcmp(out, pkt, sizeof(out)), "skb_nonlinear_partial_data_out");
+}
+
+static void test_xdp_nonlinear_data_out_partial(struct test_pkt_access *skel)
+{
+	LIBBPF_OPTS(bpf_test_run_opts, topts);
+	__u8 pkt[NONLINEAR_PKT_LEN];
+	__u8 out[SHORT_OUT_LEN];
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
+	ASSERT_EQ(err, -ENOSPC, "xdp_nonlinear_partial_err");
+	ASSERT_EQ(topts.data_size_out, sizeof(pkt), "xdp_nonlinear_partial_data_size_out");
+	ASSERT_OK(memcmp(out, pkt, sizeof(out)), "xdp_nonlinear_partial_data_out");
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

