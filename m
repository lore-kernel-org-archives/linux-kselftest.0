Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050103644A0
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 00:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785285808; cv=none; b=lKcJ8kEhrMxQJWXXFUOUIXQ6lfNNUXXNqgK4qQ+m0l8Lq6UTH1hLy48un5lcfa0cNcnjN7BgoEO+b5Yqi27CYe9VMzoHaj9dZ0cu2XJ2YN9RUQ1s3GSAeoztNvz1kPQbtysu6MfzBOFBteQQa2/UV9/NQ5tyqISeXzfRjBV1S88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785285808; c=relaxed/simple;
	bh=APYCemeVpFyyQFz6LEPXl8WGerHiLbS1D/pRVvv203w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OMYPaBs7TdsM/TWbdjRYoahCd+NFBJ5CYs3bO0Kd5Q1DkFnPzDtc6dtWxFu0bwftQ17IPbFQP7flTIPJLDTtn5OOD7IaVD8Oz1Qyz/i0GXrY9jI5akAagEmP93cLvCOEsPrtBbT++82Md/p2MrxRXDZEJB0fTJuqn7cm1t0nco4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sogQOZSj; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sogQOZSj"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4956242332dso3088705e9.2
        for <linux-kselftest@vger.kernel.org>; Tue, 28 Jul 2026 17:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785285805; x=1785890605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r4Gw4ioSscdZva3p6jvwUu/0HqrTnRkxRU/WO0C15fA=;
        b=sogQOZSj7xcs0FbY4THWDXfEjHj7eVtr4mZFVnUe2n/38bsyQ+osbul3t1/oLWWhop
         t2YaGqOCLp+Pg0/1iX38RhdKdlevACgcX9yEzVwsyi8uEnXyu87Hbjhinp6BD5ja0OCb
         wZgYI9aSCGTQJk2zzwsIdFXxEJTZglCAOraHoGmDTm7gLLCymuW+COQ/000uiLTnbc7x
         tgw1rx769ZDsK40Flsj5UkP0SyzQ+l/sOU+nYLgbkU/7ch/4HZCaSZy6k10mIP01vHDt
         tFkFgl1yOv0a/PPO1ms9iM2p/YB+0/jziphlErczOQ4kD7FR3631Gyx+cTimWCiuR7CI
         mLJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785285805; x=1785890605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r4Gw4ioSscdZva3p6jvwUu/0HqrTnRkxRU/WO0C15fA=;
        b=DphnnBWCgtgoUzHImgzVmkkwaoKLmraTgK5QJ5zsS1Dpy2tThK3Uq86m4xg8Pgnax9
         99KrxWKkyih8TXjlK5V78zanJpUYi3JX+2YBw7agfiHeFhJXbN6bN3zwtkFPe7AqW2I9
         iKwizq89HbaSckYSAX6BV/iT/0cjTviCaPf1gHeqFiiiKzyJ3VP0wjA913a0PKbL2xeJ
         mAzY3KJc7YEUvZK39ieb4xBD5CLR0rlFSklrA9pFmYB/MDM+e3PMp5UU3b8r9m7qgLyH
         gJIvvH0MIK2SErN5inLEPe5qy24OpsJZHqR4P7pazQseaDF6g8V1qbutL8rCx0jlMx/P
         wXhg==
X-Forwarded-Encrypted: i=1; AHgh+RoSeJz+MN62BiKPpJpltMfzhkcQmorUoVF1WNTCMTbkHrpOmVrYF+Sb+JOmYSU0JSVGQyqrjLOkOLLXNerRaco=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAOjD2cWd123kQExVdI3eCqgafwPF1ZskQ6NyJYpm1AAKQcV4d
	E0+tGh/OmbbQuG8xCqfAUQlAlcnBlxq05cUUHv9RY7IorrbQs2Gk6kLG
X-Gm-Gg: AR+sD13likc8ukfr1wFlTXgTGR8VpaIPqAqZOmnF6Zee5oIe3FfD0JFbvpCSdOj6Od5
	HIiAIplLkAtP3KRuSzpYNEZ1u9gi8ph5X9xjzscFGj27zoWxHOXKwOe1eVbvR7rt/ttNE2yOO9R
	AagBi+JEm9Sp+tmQRBGqKAh6FG516slScrTFF+aSePLZQr4fiEX9G4AAlZ1rok2nR3Q5CsD/JyE
	kzrnmAy7WJNLL9w2p6h9B/ROv7QEigGTe2y2rVEsgn65+CcvW1YQ3r+flzWK5X+WePdAi6wOi5B
	hUV34rOUNusxWHzptXqK1o+MlU3VgZyNKDD0yRfLYubUvQOC6VYJKz5tWxjVpM+sRUuYjMVXhVD
	MGksbjPh4W28I45hYcQofq73N3hXT20D79a6gbalaLTitkqc2+2INXn0K9PgiRtt8YzCIv26nYm
	SsVpzpMqBL5aIhQrvym478ur7QalZ1c17cOWHXG1n2c8ktJ8V1sXWRNYT29QaDuuguUzPbEwZAP
	+mN1Aoz5FRFQyH++XWuFUcSxnVQBumuqL0AST/BwSvsBmexZFO1f6AdNWzCdP9G11ImXawSis2E
	4OeGWz78ee/K1eIZqFIg4YEJznWvX/YmV5YwvCYm8wYBp8YJoQKTKMedKe89sh0uYoBW5yX4yFu
	0F8JC7JhAita4m7jj2g==
X-Received: by 2002:a05:600c:3b0c:b0:495:4d2d:82f2 with SMTP id 5b1f17b1804b1-496c659dd2bmr53499995e9.26.1785285805037;
        Tue, 28 Jul 2026 17:43:25 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-b323-2b01-0d98-9fe8-a4cd-78ab.310.pool.telefonica.de. [2a02:3100:b323:2b01:d98:9fe8:a4cd:78ab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6aa3a88sm2827343f8f.6.2026.07.28.17.43.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 28 Jul 2026 17:43:24 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Karl Mehltretter <kmehltretter@gmail.com>
Subject: [PATCH 2/2] kselftest/arm64: fp-ptrace: Fix checks for inactive SVE and SSVE regsets
Date: Wed, 29 Jul 2026 02:42:55 +0200
Message-Id: <20260729004255.15630-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260729004255.15630-1-kmehltretter@gmail.com>
References: <20260729004255.15630-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The checks on the header size reported for the inactive regset of the
NT_ARM_SVE/NT_ARM_SSVE pair compare it against sizeof(sve), but sve is
a struct user_sve_header *, so this is 8 rather than the intended 16.
The kernel carried the identical typo when filling in the header, so
kernel and test agreed on the wrong value and the test passed.

Compare against sizeof(*sve), stop after the header checks for an
inactive regset since it has no payload to compare, and prefill the
buffer with a sentinel to verify that reading an inactive regset
leaves everything after the header untouched. This also covers the
getter's return value, which determines how many bytes ptrace copies
back to userspace.

Fixes: 864f3ddcd715 ("kselftest/arm64: fp-ptrace: Adjust to new inactive mode behaviour")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
With the size comparison fixed, fp-ptrace fails against kernels that
do not have the preceding regset fix.

 tools/testing/selftests/arm64/fp/fp-ptrace.c | 47 +++++++++++++++++---
 1 file changed, 41 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/arm64/fp/fp-ptrace.c b/tools/testing/selftests/arm64/fp/fp-ptrace.c
index 22c584b78be5..b435837c8c0e 100644
--- a/tools/testing/selftests/arm64/fp/fp-ptrace.c
+++ b/tools/testing/selftests/arm64/fp/fp-ptrace.c
@@ -65,6 +65,9 @@
 /* VL 128..2048 in powers of 2 */
 #define MAX_NUM_VLS 5
 
+/* Sentinel for detecting buffer bytes the kernel did not write */
+#define REGSET_SENTINEL 0xa5
+
 /*
  * FPMR bits we can set without doing feature checks to see if values
  * are valid.
@@ -181,6 +184,20 @@ static bool compare_buffer(const char *name, void *out,
 	return false;
 }
 
+static bool buffer_is_filled(const void *buffer, size_t size,
+			     unsigned char value)
+{
+	const unsigned char *bytes = buffer;
+	size_t i;
+
+	for (i = 0; i < size; i++) {
+		if (bytes[i] != value)
+			return false;
+	}
+
+	return true;
+}
+
 struct test_config {
 	int sve_vl_in;
 	int sve_vl_expected;
@@ -401,6 +418,7 @@ static bool check_ptrace_values_sve(pid_t child, struct test_config *config)
 	struct user_sve_header *sve;
 	struct user_fpsimd_state *fpsimd;
 	struct iovec iov;
+	size_t buf_size;
 	int ret, vq;
 	bool pass = true;
 
@@ -409,14 +427,16 @@ static bool check_ptrace_values_sve(pid_t child, struct test_config *config)
 
 	vq = __sve_vq_from_vl(config->sve_vl_in);
 
-	iov.iov_len = SVE_PT_SVE_OFFSET + SVE_PT_SVE_SIZE(vq, SVE_PT_REGS_SVE);
-	iov.iov_base = malloc(iov.iov_len);
+	buf_size = SVE_PT_SVE_OFFSET + SVE_PT_SVE_SIZE(vq, SVE_PT_REGS_SVE);
+	iov.iov_len = buf_size;
+	iov.iov_base = malloc(buf_size);
 	if (!iov.iov_base) {
 		ksft_print_msg("OOM allocating %lu byte SVE buffer\n",
 			       iov.iov_len);
 		return false;
 	}
 
+	memset(iov.iov_base, REGSET_SENTINEL, buf_size);
 	ret = ptrace(PTRACE_GETREGSET, child, NT_ARM_SVE, &iov);
 	if (ret != 0) {
 		ksft_print_msg("Failed to read initial SVE: %s (%d)\n",
@@ -440,10 +460,16 @@ static bool check_ptrace_values_sve(pid_t child, struct test_config *config)
 	}
 
 	if (svcr_in & SVCR_SM) {
-		if (sve->size != sizeof(sve)) {
+		if (sve->size != sizeof(*sve)) {
 			ksft_print_msg("NT_ARM_SVE reports data with PSTATE.SM\n");
 			pass = false;
 		}
+		if (!buffer_is_filled(iov.iov_base + sizeof(*sve),
+				      buf_size - sizeof(*sve), REGSET_SENTINEL)) {
+			ksft_print_msg("NT_ARM_SVE wrote beyond its header with PSTATE.SM\n");
+			pass = false;
+		}
+		goto out;
 	} else {
 		if (sve->size != SVE_PT_SIZE(vq, sve->flags)) {
 			ksft_print_msg("Mismatch in SVE header size: %d != %lu\n",
@@ -485,6 +511,7 @@ static bool check_ptrace_values_ssve(pid_t child, struct test_config *config)
 	struct user_sve_header *sve;
 	struct user_fpsimd_state *fpsimd;
 	struct iovec iov;
+	size_t buf_size;
 	int ret, vq;
 	bool pass = true;
 
@@ -493,14 +520,16 @@ static bool check_ptrace_values_ssve(pid_t child, struct test_config *config)
 
 	vq = __sve_vq_from_vl(config->sme_vl_in);
 
-	iov.iov_len = SVE_PT_SVE_OFFSET + SVE_PT_SVE_SIZE(vq, SVE_PT_REGS_SVE);
-	iov.iov_base = malloc(iov.iov_len);
+	buf_size = SVE_PT_SVE_OFFSET + SVE_PT_SVE_SIZE(vq, SVE_PT_REGS_SVE);
+	iov.iov_len = buf_size;
+	iov.iov_base = malloc(buf_size);
 	if (!iov.iov_base) {
 		ksft_print_msg("OOM allocating %lu byte SSVE buffer\n",
 			       iov.iov_len);
 		return false;
 	}
 
+	memset(iov.iov_base, REGSET_SENTINEL, buf_size);
 	ret = ptrace(PTRACE_GETREGSET, child, NT_ARM_SSVE, &iov);
 	if (ret != 0) {
 		ksft_print_msg("Failed to read initial SSVE: %s (%d)\n",
@@ -523,10 +552,16 @@ static bool check_ptrace_values_ssve(pid_t child, struct test_config *config)
 	}
 
 	if (!(svcr_in & SVCR_SM)) {
-		if (sve->size != sizeof(sve)) {
+		if (sve->size != sizeof(*sve)) {
 			ksft_print_msg("NT_ARM_SSVE reports data without PSTATE.SM\n");
 			pass = false;
 		}
+		if (!buffer_is_filled(iov.iov_base + sizeof(*sve),
+				      buf_size - sizeof(*sve), REGSET_SENTINEL)) {
+			ksft_print_msg("NT_ARM_SSVE wrote beyond its header without PSTATE.SM\n");
+			pass = false;
+		}
+		goto out;
 	} else {
 		if (sve->size != SVE_PT_SIZE(vq, sve->flags)) {
 			ksft_print_msg("Mismatch in SSVE header size: %d != %lu\n",
-- 
2.51.0

