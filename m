Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23298408006
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Jul 2026 09:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783501352; cv=none; b=UIHA6nDHchof3LhmeCTvRtlqdpL26Q/HHoUCHShvZ5v7LhRTFw2matprw5J39sggEVEzSdqAxVmd/XzdXg9edOboPEDRB9ua0k4Kv8ywGV2lBl5r+5FjudxFClEB+cGHHc/30X+PBrD8SltXj7u/i0tLA1VyMUjCHX1iDJhWRlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783501352; c=relaxed/simple;
	bh=FzKeTeF8JA+KsfuZhglVYUhLx5S0Q2O5ea+96KMWWzY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ITm1CNFneBpwpMWWqEIRHCHgjniHnnJuvQSxo7H87SmOGHVRqwPuVcZ4g/eYdaiBeXCuegxkqMfPUMihNaoobTISfc2I04pET02R+Dbd2WyJalH5hAfoxJKeHC0w16nwa7hWOYqwCPT/5bHKDH+eCJGD7EeVCNyUR+DeO34A/aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DfwSfWkZ; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DfwSfWkZ"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38759bcd877so401509a91.2
        for <linux-kselftest@vger.kernel.org>; Wed, 08 Jul 2026 02:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783501348; x=1784106148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VGJwch6uaoT+4VIjlzymTYDaLAmgt0JW6oLszFG1Jaw=;
        b=DfwSfWkZi6CUlYoRujaPJqqShrHgWvJWQWZuvubHmwzOcTZXAKUssFB+RiPG2SU3vP
         2T0L+k27SLUlsxRkF6LkApH3sg4bAfrePSCDiPba8z4llEyYpmZWVirqfizUs3eT/EiR
         kdPKs0EUNalZnoKYqABT2kgbGQe0ABWIL9Gmkw04xIoX9GlBqZtRHrU/QAJ9uZuKDcwa
         GqrTbrw9BD6DOQQOuOeTxq7Nu26CeyHhcCWvMkJnrKdfi7ZLM3fw73uJtM6iujiNq/Ku
         +HCZTo9n41D2Kydz5XE2YHGYxQixHRigqYbLlLbxZ7RiiuVTJUgF9ma4WVjrKpD1PTuV
         O6wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783501348; x=1784106148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VGJwch6uaoT+4VIjlzymTYDaLAmgt0JW6oLszFG1Jaw=;
        b=nnL76AvyCNQ9xbm1UZ6P3b1lmzmONoGJBipi29LcClr4coGxrC59cVZ813tWPhj0o+
         18cp47Pa7qZwQ4hRW9YfKS6kIHOd7bsiyifT77Wn+6/E7751WVsuYIOXu9UaUuFyEbey
         1XU5GiG6eBm2UYZHnbLQDb9V0oPEjLB68t3BQPGaFzmY3MwEii9yXVvbhibl8e9fm+Hq
         LH+NKjQI3Farxmcs+2pGnFcBF8jyXzMSlYmxwCqrHC+VpUwdxLSCkHtP5mvKwKsRP6wy
         0sRcn8oYkkGdTKJI0IlnSzQsT/owrs8ofdw3oJFbJRuw3LjEHdd3vA83qkDZyjI1qHCg
         H2jg==
X-Forwarded-Encrypted: i=1; AHgh+RpPxTBmVvXTN+ljJKdJLo10/CNDks1ISJZpV4vtRP0TKR5IHwz7Kpkxoo4QNz5FM7ynfCzNL7H0r3wwPDKvHhM=@vger.kernel.org
X-Gm-Message-State: AOJu0YydJuvWxg05cTMiCS4SLLGI9acTHck1E4myEW8ivkYobyKXvco7
	zrzvV3o6tvzJVFQLsI5Ag72iU7mr1DTMut2x3JYBmhpv2M9OBjXwOJw8
X-Gm-Gg: AfdE7ckPuCkzhOTuLRhwlQnC8Ca7xjvq1ELxStiCN9YinqkYsyYU6E8CXz9v6zo40X/
	bEkwGIlhVZuRxzEMP/BLjw6jJ0Qai5YwVz93XSc3VB75Lseqr7ptAhTI1/+Q167uFH1rCD1j0Mg
	kmTYus9MImEXJX+DSLK5UurRUdjj5r1XSSLdNdb1IXvgncV+07ILJa9YS7D7dwtmwlGlTFkayG1
	WJ9uWpiBUZ8m4u34/V5S3ndpM9hWV5igXdfiIeF1fzv5DdqWFswWkMVtswpnz5xfq9Ih+bVpMde
	YS8yi073eRX6Xf75QlZBX4f1oVc8giTAAzdAWl+xxPkmfbjOoWPfdRa+WOwNlZUQgHhE/dBgSYa
	xluQrPRiQ2GS0G3itsMoT9vcOFFAkiu3JdjSSA4VMk+flpQO8K5KgfXBM/XNyeyvf8iHWFicoR5
	0vCZqSZ4hI3evnMOg0x0jNiNAU7hhZKqDVdnQa25MXclAcPQhRHjAJF4mUiuJKX+P4EfwiOQhWl
	FcSJkDPGAuvi/NGhHIs9a5OIiiGwcQmnw==
X-Received: by 2002:a17:90b:2f88:b0:36a:c4b:76cf with SMTP id 98e67ed59e1d1-38941acc562mr1783937a91.23.1783501347770;
        Wed, 08 Jul 2026 02:02:27 -0700 (PDT)
Received: from u2404-VMware-Virtual-Platform.tailf6b5e0.ts.net ([24.4.24.156])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174accb0esm19515493eec.30.2026.07.08.02.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 02:02:27 -0700 (PDT)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: bpf@vger.kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	john.fastabend@gmail.com,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	shuah@kernel.org,
	mmullins@fb.com,
	shung-hsi.yu@suse.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH bpf v4 2/2] selftests/bpf: Cover negative raw_tp writable buffer offsets
Date: Wed,  8 Jul 2026 02:01:51 -0700
Message-ID: <20260708090151.151729-3-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708090151.151729-1-sun.jian.kdev@gmail.com>
References: <20260708090151.151729-1-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add raw tracepoint writable coverage for buffer accesses involving
negative constant pointer adjustments.

The verifier case checks that a negative effective offset is rejected.
The attach-time case adds incremental coverage beyond the existing nbd
test and the verifier rejection case: it uses a negative var_off and a
positive instruction offset whose effective offset remains non-negative.
This exercises the checked access_end accounting path and verifies that
the resulting max_tp_access is still checked against nbd_send_request's
writable size at attach time.

Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---
 .../raw_tp_writable_reject_nbd_invalid.c      | 58 +++++++++++--------
 .../bpf/progs/verifier_raw_tp_writable.c      | 16 +++++
 2 files changed, 51 insertions(+), 23 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/raw_tp_writable_reject_nbd_invalid.c b/tools/testing/selftests/bpf/prog_tests/raw_tp_writable_reject_nbd_invalid.c
index 216b0dfac0fe..efe4cad47b28 100644
--- a/tools/testing/selftests/bpf/prog_tests/raw_tp_writable_reject_nbd_invalid.c
+++ b/tools/testing/selftests/bpf/prog_tests/raw_tp_writable_reject_nbd_invalid.c
@@ -4,12 +4,31 @@
 #include <linux/nbd.h>
 #include "bpf_util.h"
 
-void test_raw_tp_writable_reject_nbd_invalid(void)
+static void check_nbd_attach_reject(const char *name,
+				    const struct bpf_insn *program, size_t prog_len)
 {
-	__u32 duration = 0;
+	LIBBPF_OPTS(bpf_prog_load_opts, opts);
 	char error[4096];
-	int bpf_fd = -1, tp_fd = -1;
+	int bpf_fd, tp_fd;
+
+	opts.log_level = 2;
+	opts.log_buf = error;
+	opts.log_size = sizeof(error);
+
+	bpf_fd = bpf_prog_load(BPF_PROG_TYPE_RAW_TRACEPOINT_WRITABLE, NULL, "GPL v2",
+			       program, prog_len, &opts);
+	if (!ASSERT_GE(bpf_fd, 0, "prog_load"))
+		return;
+
+	tp_fd = bpf_raw_tracepoint_open("nbd_send_request", bpf_fd);
+	if (!ASSERT_LT(tp_fd, 0, name))
+		close(tp_fd);
+
+	close(bpf_fd);
+}
 
+void test_raw_tp_writable_reject_nbd_invalid(void)
+{
 	const struct bpf_insn program[] = {
 		/* r6 is our tp buffer */
 		BPF_LDX_MEM(BPF_DW, BPF_REG_6, BPF_REG_1, 0),
@@ -19,25 +38,18 @@ void test_raw_tp_writable_reject_nbd_invalid(void)
 		BPF_EXIT_INSN(),
 	};
 
-	LIBBPF_OPTS(bpf_prog_load_opts, opts,
-		.log_level = 2,
-		.log_buf = error,
-		.log_size = sizeof(error),
-	);
-
-	bpf_fd = bpf_prog_load(BPF_PROG_TYPE_RAW_TRACEPOINT_WRITABLE, NULL, "GPL v2",
-			       program, ARRAY_SIZE(program),
-			       &opts);
-	if (CHECK(bpf_fd < 0, "bpf_raw_tracepoint_writable load",
-		  "failed: %d errno %d\n", bpf_fd, errno))
-		return;
-
-	tp_fd = bpf_raw_tracepoint_open("nbd_send_request", bpf_fd);
-	if (CHECK(tp_fd >= 0, "bpf_raw_tracepoint_writable open",
-		  "erroneously succeeded\n"))
-		goto out_bpffd;
+	const struct bpf_insn negative_var_off_program[] = {
+		BPF_LDX_MEM(BPF_DW, BPF_REG_6, BPF_REG_1, 0),
+		/* make var_off negative, but keep the effective access offset non-negative */
+		BPF_ALU64_IMM(BPF_ADD, BPF_REG_6, -8),
+		/* one byte beyond the end of the nbd_request struct */
+		BPF_LDX_MEM(BPF_B, BPF_REG_0, BPF_REG_6,
+			    sizeof(struct nbd_request) + 8),
+		BPF_EXIT_INSN(),
+	};
 
-	close(tp_fd);
-out_bpffd:
-	close(bpf_fd);
+	check_nbd_attach_reject("nbd_invalid", program, ARRAY_SIZE(program));
+	check_nbd_attach_reject("nbd_invalid_negative_var_off",
+				negative_var_off_program,
+				ARRAY_SIZE(negative_var_off_program));
 }
diff --git a/tools/testing/selftests/bpf/progs/verifier_raw_tp_writable.c b/tools/testing/selftests/bpf/progs/verifier_raw_tp_writable.c
index 14a0172e2141..4055a6443bc2 100644
--- a/tools/testing/selftests/bpf/progs/verifier_raw_tp_writable.c
+++ b/tools/testing/selftests/bpf/progs/verifier_raw_tp_writable.c
@@ -47,4 +47,20 @@ l0_%=:	/* shift the buffer pointer to a variable location */\
 	: __clobber_all);
 }
 
+SEC("raw_tracepoint.w")
+__description("raw_tracepoint_writable: reject negative const offset")
+__failure
+__msg("invalid negative tracepoint buffer offset")
+__naked void tracepoint_writable_reject_negative_const_offset(void)
+{
+	asm volatile ("					\
+	r6 = *(u64 *)(r1 + 0);				\
+	r6 += -8;					\
+	r0 = *(u64 *)(r6 + 0);				\
+	exit;						\
+"	:
+	:
+	: __clobber_all);
+}
+
 char _license[] SEC("license") = "GPL";
-- 
2.43.0

