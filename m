Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BB648986F;
	Wed, 14 Oct 2026 20:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792008103; cv=none; b=EYYGGnHIfCQzfdML+vdpit6cPC/3ToAqtkezqxhyBU94zhrBXeCzxkNArq6mttiICMKciw6i3xmqxsNSnLgpSiK1x9m8iVfKTGJKxBGmt+ZMwbbhTIPgAXA2kaYsLYzgRPFfkyDx06n/S9ckyujsDvrHeN6ShvugnPQmJhnAxoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792008103; c=relaxed/simple;
	bh=wy7bVben1MnHFFymYdvheYcrztgkFwAZNagHQIUBBR4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s0mZgZ9tqiijuNBvj4QS5Xo/nO8vGP7bjaAiiZqoULj7Jah8eKEmlXnHQvXpqse1e/Yf62FAz7KLk8qWo80EWwzP6hQTFrq02h0qnVsAt1UvA+yJ/VriXHPkMQQXEV8+vUFI1vpf1t2XGeMFj8ZE0H7Iq4eacaLg3c8ubjnUNWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bzWATHB6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bzWATHB6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F7FD1F000C4;
	Wed, 14 Oct 2026 20:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792008102;
	bh=kvH9a/W89tZJwkWJJfa80zFGn++eJmb59weeXs/8uuU=;
	h=From:To:Cc:Subject:Date;
	b=bzWATHB6HSA28GRD/qm5bsV1FMCHzOzRoDkZ2kjxBjGX8jrn8Z0kDjFh/OdsVCOZz
	 3WQwRMs2XLPqgG6Fua94ELep1HkGBbxnuqC2VjrH30DL/l8oVBQCBBJwh6WGUkVmkR
	 o5kijjef0BgAFGpSK8alQyNzUt5TdSiyjlBFWWTGjgWoWaI6yzou+9yjEvt6T/CgZ9
	 BdQ2JiBrOIftEUL187otPtjH3e7Nu10/nA7jYtzsC3r/cjyfA39hfEHGO3NZVpSUVm
	 ZMN2WTp5lnTwWrWf1LkR8MKktI/Ubp2evsykersbwlbI58aku36XJ35yUeIKGCBI7M
	 nS+eh5QAxzPQg==
From: Sasha Levin <sashal@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kselftest/arm64: signal: copy each test binary only once
Date: Wed, 14 Oct 2026 16:01:40 -0400
Message-ID: <20261014200140.1364282-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The signal tests are built in testcases/ and then copied to the output
directory. The copy rule lists every generated program as a target and
copies all of them in each recipe:

  $(TEST_GEN_PROGS): $(PROGS)
          cp $(PROGS) $(OUTPUT)/

In a parallel build make runs that recipe once for each program, so
several cp processes write the same destination files at the same time.
cp then fails with "cannot create regular file ...: File exists", which
fails the arm64 build even though every test compiled. A cross build of
the arm64 signal tests at -j8 hit this in all of 8 runs.

Use a static pattern rule so that each output depends on, and copies,
only its own binary.

Fixes: f96bf4340316 ("kselftest: arm64: mangle_pstate_invalid_compat_toggle and common utils")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/testing/selftests/arm64/signal/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/arm64/signal/Makefile b/tools/testing/selftests/arm64/signal/Makefile
index 1381039fb36f9..c4df4be41636c 100644
--- a/tools/testing/selftests/arm64/signal/Makefile
+++ b/tools/testing/selftests/arm64/signal/Makefile
@@ -17,8 +17,8 @@ TEST_GEN_PROGS := $(notdir $(PROGS))
 # the toplevel makefile
 include ../../lib.mk
 
-$(TEST_GEN_PROGS): $(PROGS)
-	cp $(PROGS) $(OUTPUT)/
+$(TEST_GEN_PROGS): $(OUTPUT)/%: testcases/%
+	cp $< $@
 
 # Common test-unit targets to build common-layout test-cases executables
 # Needs secondary expansion to properly include the testcase c-file in pre-reqs

base-commit: 4eb2586bd40db27d77cc5b724ca9386ed0c71d53
-- 
2.53.0

