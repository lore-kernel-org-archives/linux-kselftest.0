Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA5E3101D2
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Mar 2026 07:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772435696; cv=none; b=rcuy9kp+Una2HJr+5CoNJK18DhxPHfgX8TKK5pcJrUDlegrTrsiBo9GYOuDn/Z687robd9n4z4J+4bWG2XOYrLcddfugdkoos9Wvd2WIURbzPGEVk7T3ltOI1If+tZ5/fLjOf3rt5e1B4iJu/ObnwQ6r/uNFlQjIqcs5x3s+ew8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772435696; c=relaxed/simple;
	bh=IqIHegnKM2HEYo0MpRxqsAMyp5aspxcpxaEEy/gmTyM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fUQgKE2czzECkLOnvBpkF/vxkbNG6Bb9n9SwM8qQaPmQ0JZgf6rtBgXPJSzuB2q3s4gvU+IfPCoEmbP8He9vnLExqvvMr5ScSgobuVYN0mpm7bGCUNV7y430dMrBZxLz7Gn+DAx55aC/HuVgquVM09o9AIXiSI7Rf4WnF7NkrcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VcNGxVgd; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VcNGxVgd"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-45effa36240so3329784b6e.1
        for <linux-kselftest@vger.kernel.org>; Sun, 01 Mar 2026 23:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772435694; x=1773040494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qx9IFITrMKLlkT1svVa6s0PRctPgUnyk1fnGEcICs8I=;
        b=VcNGxVgdjWhfMnCnYrF+n2JyqEAbhhLuu39zn+/iCshka7PuUK1jegg9Yd7ituNwUU
         zXCxulUA6TLaz31OlVAAd+ev42Ok3PVa+ZePEA6u+VSX1OzkTVUu4XKxnHO7w1VSP31R
         KSFHRwAlHMnjlcCUiRZ5rSr9PVzbrn2A7eSSyjdq7srWTEiXHKNRoaI+i/b+Yl9HUfSN
         AQzfx8aDnATnMaUFlCAHNFwjF+UnzS1aBiOlTSa64rPGv1E5Hqe68JiTYVq5ntbNRuWE
         SbfPdrqp2bqpvz1YKwZNc5p5n73mCnd0a+ifbljEPcLoc6XeBMXSFvRSDLYVTFdRgXTi
         Zohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772435694; x=1773040494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qx9IFITrMKLlkT1svVa6s0PRctPgUnyk1fnGEcICs8I=;
        b=gIeGMxm9f8SGViaB7jBAFR88KBNC8woRYKQwiokTKfa6i0fTUBjgXjQLCfeAmnl4+Z
         o42Lf/7cdVZSLaABnYmNrjEK+hxWPZt2FmtC6fTBqnS49PEsLphYfxQ+ypF/oyVDDvSi
         yQyEfjJ8fazqLmXg7NstMC8onZiU5U4V/XS/j2kknkteWGS++z0ZFVD+nwFA3WE9HiQc
         ocNqLXjCI/Q9I/1NR2bQyruuL2vuAvNFmKlbQR71+tJkNMEeeTRTfbR1NgHZzuzsJiep
         /RAZ6ciw4bqrSG45OYP8mJcvBfN+jAnWewiAwlp4JNqC/khn4mNKgkX6GwOlEOKo9c8k
         HKEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQJu0CwyoyGUCEQT1XwoG1i03Bm7Vj9dUJk0C9BZBSKtv/iFoA/2gNw5K13gn2ezrZnCuEvryeyGVPtlrDqr4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbCjfNRyQTAhG6CXdF4M6+HKvy7RKRex9v+cJjsBcxGPSfy9F6
	bpvYFN0AR400/l9gzVCrbbtQoBlr2Jzb1rgl41e6YGUHuDxeG5U8I3ar
X-Gm-Gg: ATEYQzz8ocO4l8bqtg2gBQzD+FYEtkLa6RB6yhp9Ctu9IS32VFOp3BfZIvQdaBtBQz5
	5rQkpQEhx3fgskRF1mnyyH6achXwFiNX47an3V5KClWiV7vfgj1QnUgE8/qk7LlaXolA+iSXPbF
	L4NjUSGf8lW4H4PqDfePIKemgt+zCw+QLDaxTolSC/GWCA/o677fXRpn8P57UwsYCLWrxejSlXv
	uLPNr/GqHH1DnSr8nHi2a/JSWRYcveW5R2ZOnUHBat5EpQ6JpABRwkfK90jm8tUhf6mpo+o6q1a
	+4HTnC8HoW7f7uPKjk0qMYbHxAA2d01Qy7CLXtvitBwUjtTC6jnHufLuB1JTfUtbHpMhNSjXPIX
	wpOshvK9G115sMd/4UfSEnBgdB3yOPpECwhs2jrxn8LznD8wJKkPrWwoj53jS7O2sOIyst1X/B5
	opFVN/VzYSOa9dQCvWLtPYKpifkiMrj5+OrbjgB+RsTghazGS02/6t2muWAD8HUPpZFJ5x4pfxm
	95JUK4brwKhWaIe1VOYtJy9Iaf+aYtilMtmXfkyzIi0+/xdcOM=
X-Received: by 2002:a05:6808:1391:b0:45e:6cac:92c9 with SMTP id 5614622812f47-464be9fb4c3mr7130460b6e.27.1772435694139;
        Sun, 01 Mar 2026 23:14:54 -0800 (PST)
Received: from localhost.localdomain (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-464bb3ab494sm6867919b6e.8.2026.03.01.23.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 23:14:53 -0800 (PST)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: andrii@kernel.org,
	eddyz87@gmail.com
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	haoluo@google.com,
	jolsa@kernel.org,
	shuah@kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH] selftests/bpf: skip verif_scale_pyperf600 on -E2BIG jump complexity limit
Date: Mon,  2 Mar 2026 15:14:34 +0800
Message-ID: <20260302071434.311395-1-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

verif_scale_pyperf600 loads pyperf600.bpf.o, a large scale case produced
by partial LLVM unrolling.

On some kernel/toolchain combinations, the verifier rejects it with -E2BIG:

  The sequence of 8193 jumps is too complex.

This hits the verifier jump sequence complexity limit (8192).

Treat -E2BIG for this test as SKIP rather than FAIL. Other pyperf600
variants are unaffected.

Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---
 .../bpf/prog_tests/bpf_verif_scale.c          | 22 ++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/bpf_verif_scale.c b/tools/testing/selftests/bpf/prog_tests/bpf_verif_scale.c
index 73f669014b69..181acdddea1c 100644
--- a/tools/testing/selftests/bpf/prog_tests/bpf_verif_scale.c
+++ b/tools/testing/selftests/bpf/prog_tests/bpf_verif_scale.c
@@ -112,13 +112,33 @@ void test_verif_scale_pyperf180()
 
 void test_verif_scale_pyperf600()
 {
+	libbpf_print_fn_t old_print_fn = NULL;
+	int err;
+
 	/* partial unroll. llvm will unroll loop ~150 times.
 	 * C loop count -> 600.
 	 * Asm loop count -> 4.
 	 * 16k insns in loop body.
 	 * Total of 5 such loops. Total program size ~82k insns.
 	 */
-	scale_test("pyperf600.bpf.o", BPF_PROG_TYPE_RAW_TRACEPOINT, false);
+
+	if (env.verifier_stats) {
+		test__force_log();
+		old_print_fn = libbpf_set_print(libbpf_debug_print);
+	}
+
+	err = check_load("pyperf600.bpf.o", BPF_PROG_TYPE_RAW_TRACEPOINT);
+
+	if (env.verifier_stats)
+		libbpf_set_print(old_print_fn);
+
+	if (err == -E2BIG) {
+		test__skip();
+		return;
+	}
+
+	ASSERT_OK(err, "expect_success");
+
 }
 
 void test_verif_scale_pyperf600_bpf_loop(void)

base-commit: 11439c4635edd669ae435eec308f4ab8a0804808
-- 
2.43.0

