Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879AB37757D;
	Fri, 31 Jul 2026 20:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785531116; cv=none; b=MvH/mQh9awSxTOf9v660YKDD6vEDCSzq8QTPjiAf4+foLXVMfpJkoM2++0JJ5MRoLmsJTxsPShhXq/xfriOS0k+k4ieQKe/nY5uni5FICkEifN1VQnad8SkOu5xsnZlxC2vWeCC+zALeaX7ocIHMfv+I/pPVgQ4meenCsT9lkT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785531116; c=relaxed/simple;
	bh=GJ5LmgPC4TEjYq3Z1NrIggZZfJeakFkQR4490y54zBE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=e9zESTX3WB7uVhpx3xxhMIQsTurbdgoVZKwSZPP9k2YzEBH5wod5fdSvd6p/qSROmCVlI3TjjYOeWCzHzCqDTBRSonoAMHjiQ/+OD2jFDMKqKhs+q3PJoIsznTD575lf+WYlnIl8W6wmad+Jg4IA/XPW5HZ+PbDnBVgrBypC8L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EXdyf0hs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EXdyf0hs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C70B1F00AC4;
	Fri, 31 Jul 2026 20:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785531115;
	bh=MBI+DxucX7uN1fwo7HqSW/JtnIQy5htPAaDCcSSW7Vw=;
	h=From:Date:Subject:To:Cc;
	b=EXdyf0hss9aPzJ/i4db3jAzDgBxtdTxeow2HG5hN/IvQdlkLz/vWEyzORxxFphV1l
	 s+dYGQeQAH7+DQHzi6XP+arKsqfNQx8SkaIDjmHRadMj1fe/tp48HBSragg4uDUZqc
	 46rQLfJVpgD2PWvAIT5qWVruziRvg3bAYDpNa8UdqPHs4E7+tXozF9O1w9/vd2qLav
	 kh9fv216jztT7MJkApuaVUu7zSODOA36UKti5uKd4ELAeuVKw41aStz5792/qGHCcr
	 OGaop1ezSS4v+Q6KFGvbV8/bMKc17I9Gf0gHT9FQfOVScyynYgY83KIx5JcauSniiM
	 33L/LZGiKevHw==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 31 Jul 2026 21:50:52 +0100
Subject: [PATCH] kselftest/arm64: Don't write to P0 in irritator on SME
 only systems
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-arm64-sve-test-sme-only-v1-1-eb559009dce8@kernel.org>
X-B4-Tracking: v=1; b=H4sIAKsKbWoC/yXMQQrCMBBG4auUWTuQ1hDRq4iLmP7REZtKJhZL6
 d0bdfkt3ltIkQVKp2ahjElUxlTR7hoKd59uYOmrqTOdM4d9yz4PzrJO4AItrAN4TM+ZrbOw5ti
 HGD3V+pUR5fM7ny9/6/v6QCjfHa3rBu0kex97AAAA
X-Change-ID: 20260731-arm64-sve-test-sme-only-464e409dcffa
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1755; i=broonie@kernel.org;
 h=from:subject:message-id; bh=GJ5LmgPC4TEjYq3Z1NrIggZZfJeakFkQR4490y54zBE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqbQroWQFZFzuMZ5bOpnu6Yh4Qh7/o/9MFxgpIr
 uBHWDg1W+mJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCam0K6AAKCRAk1otyXVSH
 0M8kB/sEm5oMNxHsgcp5vf8BiN9HkeZiuzvNcdvl/YJmB8C/sEYwRwd+bf5Jrx06BnwOlc+ZgXC
 IsVfXJT8NkUapMMiu1f5QxH0ccop31qu39HG8yaPF7KvzhS0wB08/Ea8vLpLlhR/fFO4Sz2+cpl
 KVHC2ZQtkLEwb2+I0UlEloNyTqQ9L194ytGj3SkdzufS8WHqURSJYjts/529IujGO7mKycjHolq
 8Ju+wBVHWCzS0/XJf70kjAoQZJWzEKb3+3f0rfwJFtDq4KgPrG6DTeQkBiiuVr4S40A6APGHvh6
 9Np3TyvAf1Inqng9TjwdZMplFJI58paTiKdSjFgS0Nn3bQTs
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

Commit 3e360ef0c0a1f ("kselftest/arm64: Corrupt P0 in the irritator when
testing SSVE") added corruption of P0 to the sve-test case in order to
ensure that the predicate registers were covered as part of the
corruption.  On SME only systems this results in an illegal instruction
since signal handlers are run out of streaming mode and the predicate
registers do not exist out of streaming mode without SVE.  Switch to
entering and exiting streaming mode in the irritator, this will reset
all relevant registers to 0 if they somehow weren't already by the
signal entry.

Fixes: 3e360ef0c0a1f ("kselftest/arm64: Corrupt P0 in the irritator when testing SSVE")
Reported-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/fp/sve-test.S | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/arm64/fp/sve-test.S b/tools/testing/selftests/arm64/fp/sve-test.S
index 80e072f221cd..7ef7835389e7 100644
--- a/tools/testing/selftests/arm64/fp/sve-test.S
+++ b/tools/testing/selftests/arm64/fp/sve-test.S
@@ -298,15 +298,20 @@ function irritator_handler
 	add	x0, x0, #1
 	str	x0, [x2, #ucontext_regs + 8 * 23]
 
+#ifndef SSVE
 	// Corrupt some random Z-regs
 	movi	v0.8b, #1
 	movi	v9.16b, #2
 	movi	v31.8b, #3
 	// And P0
 	ptrue	p0.d
-#ifndef SSVE
 	// And FFR
 	wrffr	p15.b
+#else
+	// Enter and exit streaming mode, will reset all of the V, Z, P
+	// and FFR registers that the system has.
+	smstart_sm
+	smstop
 #endif
 
 	ret

---
base-commit: f5098b6bae761e346ebcd9da7f95622c04733cff
change-id: 20260731-arm64-sve-test-sme-only-464e409dcffa

Best regards,
--  
Mark Brown <broonie@kernel.org>

