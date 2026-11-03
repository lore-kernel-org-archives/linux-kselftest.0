Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793748194;
	b=NMIcxan3oZWuZgPgjV+fZMBpQMtn3LSy6J6mY+5CjRugazsgF1dzJUXXubjS0LXv3/1S
	 AGc3zjDrfVo3P/5uqX0+lACUeCqdB+QWRci9H0QvI0EgmlqfpjO3hZbJMb8SOLfqj5QXl
	 byPMfV1jGP1Rs2/BrWfyOJz7GXcC4NTC1vyASgE2DWp5kR079h26UFotT04iTeHoHEZTC
	 GNgGDwoFfJG+o1zbEzNPr/X3S0DZIjz1AAxBLcO7mNdywNpYQ+5+PxyTAu1P+6wZjBrLa
	 1WBih9NlWkN3IbleHVAh8i7tANin+v7A9bvio9TeVYNhaK+WzmbGcTQubjgK/if4uMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793748194;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cSmLYuREQ2//vWlinxm+BhFVoxU9Wq39k8PHH/kS3cw=;
	b=Ev5GLaLE5ZuMQkzuVg6HkwCHNJnmybopUR5XMAeyrRG1T1neZam8Z0fx0NOGVy0KR3Nz
	 aZSFPfXRGV38PT0OoonekN0qsIIJwC54P6DWMWRTeN10tMPI86M5N14f+5q2UmD8CX4rT
	 mYB4ubrOiE9UOrMNjaricCU6aruCkjUOJC3BQRWOV+zhJHV3gAA8g82wl5KWKO54k6Cvc
	 dVfJ2XdSWePDBF2m/6tCNQzQ3k51Y+QwRwDnYWVDuL90tq/pUdt23iUsTDyJt9HVEAXMv
	 zhTM1bgCQOYrl91zE/gtNFwBnuPgc1RA3q1CVj6SxFGC23b543kLhdTow+ldiCasbnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UKtgzhia;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62F5606A328;
	Tue,  3 Nov 2026 23:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UKtgzhia
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D5F91F00919;
	Tue,  3 Nov 2026 23:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793748191;
	bh=cSmLYuREQ2//vWlinxm+BhFVoxU9Wq39k8PHH/kS3cw=;
	h=From:To:Cc:Subject:Date;
	b=UKtgzhiaChyk+WCzVo7VWNI7+SvtQu/xL0H8olst8nZ9RA61pwuRq3ThM/Oo6fjc0
	 Ml19Clwv+vTxaEPMjYIq4q60sNmVyjp24QFF02AY4AwZPH0RV1rYuTeptU2PqS3P9U
	 Uhzt/fNvW4uEGKxyflyasiIt3ni1wJOgZtxxLy8xAqC1jTwMUUBREqpSe4Yl5s70Dk
	 IDvfRkVKUh4vD8s53V6AVv1mDyRDpxtXQJPfev3YnLqFt4Qorl/lq9iT9ggeUi4ffU
	 zoJjqvICfNdcqNp4/LEcC7nEw6ooz13mz6Z33uHGnXA+CJX2VXF8tLwQp62276EIA5
	 BlIo2ByVqju0g==
From: Sasha Levin <sashal@kernel.org>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Shuah Khan <shuah@kernel.org>
Cc: Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/powerpc: override EMIT_TESTS instead of the emit_tests rule
Date: Tue,  3 Nov 2026 18:23:07 -0500
Message-ID: <20261103232307.1924618-3-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The powerpc Makefiles include lib.mk and then define their own
emit_tests rule, so every selftests build that includes powerpc warns,
on any architecture:

  Makefile:60: warning: overriding recipe for target 'emit_tests'
  ../lib.mk:183: warning: ignoring old recipe for target 'emit_tests'

lib.mk used to keep the recipe in an EMIT_TESTS variable that Makefiles
could override, as they still do with RUN_TESTS, INSTALL_RULE and
CLEAN. Commit d4e59a536f50 ("selftests: Use runner.sh for emit
targets") dropped the variable, and commit 58b33e78a317
("selftests/powerpc: Fix emit_tests to work with run_kselftest.sh")
then replaced the powerpc EMIT_TESTS definitions with rules.

Bring EMIT_TESTS back in lib.mk and override it in the powerpc Makefiles
again. Mark the lib.mk recipe with '+', so that the powerpc sub-makes
still get the jobserver, as they did when $(MAKE) was in the rule
itself. The emitted test lists don't change.

Fixes: 58b33e78a317 ("selftests/powerpc: Fix emit_tests to work with run_kselftest.sh")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
Checked with "make ARCH=powerpc emit_tests" in
tools/testing/selftests/powerpc, which lists the same 186 tests as
before, and with an x86_64 selftests install, whose kselftest-list.txt
doesn't change. make -j2 --jobserver-style=pipe doesn't warn about the
jobserver.

 tools/testing/selftests/lib.mk               | 6 +++++-
 tools/testing/selftests/powerpc/Makefile     | 3 ++-
 tools/testing/selftests/powerpc/pmu/Makefile | 3 ++-
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
index 881f13ee2c8ac..506cb26510e4d 100644
--- a/tools/testing/selftests/lib.mk
+++ b/tools/testing/selftests/lib.mk
@@ -179,11 +179,15 @@ else
 	$(error Error: set INSTALL_PATH to use install)
 endif
 
-emit_tests:
+define EMIT_TESTS
 	for TEST in $(TEST_GEN_PROGS) $(TEST_CUSTOM_PROGS) $(TEST_PROGS); do \
 		BASENAME_TEST=`basename $$TEST`;	\
 		echo "$(COLLECTION):$$BASENAME_TEST";	\
 	done
+endef
+
+emit_tests:
+	+$(EMIT_TESTS)
 
 # define if isn't already. It is undefined in make O= case.
 ifeq ($(RM),)
diff --git a/tools/testing/selftests/powerpc/Makefile b/tools/testing/selftests/powerpc/Makefile
index b175e94e1901d..aeab9366d09bf 100644
--- a/tools/testing/selftests/powerpc/Makefile
+++ b/tools/testing/selftests/powerpc/Makefile
@@ -56,11 +56,12 @@ override define INSTALL_RULE
 	done;
 endef
 
-emit_tests:
+override define EMIT_TESTS
 	+@for TARGET in $(SUB_DIRS); do \
 		BUILD_TARGET=$(OUTPUT)/$$TARGET;	\
 		$(MAKE) OUTPUT=$$BUILD_TARGET COLLECTION=$(COLLECTION)/$$TARGET -s -C $$TARGET $@;\
 	done;
+endef
 
 override define CLEAN
 	+@for TARGET in $(SUB_DIRS); do \
diff --git a/tools/testing/selftests/powerpc/pmu/Makefile b/tools/testing/selftests/powerpc/pmu/Makefile
index 7e9dbf3d0d092..3aca10223f0ff 100644
--- a/tools/testing/selftests/powerpc/pmu/Makefile
+++ b/tools/testing/selftests/powerpc/pmu/Makefile
@@ -37,7 +37,7 @@ override define RUN_TESTS
 	done;
 endef
 
-emit_tests:
+override define EMIT_TESTS
 	for TEST in $(TEST_GEN_PROGS); do \
 		BASENAME_TEST=`basename $$TEST`;	\
 		echo "$(COLLECTION):$$BASENAME_TEST";	\
@@ -46,6 +46,7 @@ emit_tests:
 		BUILD_TARGET=$(OUTPUT)/$$TARGET; \
 		$(MAKE) OUTPUT=$$BUILD_TARGET COLLECTION=$(COLLECTION)/$$TARGET -s -C $$TARGET emit_tests; \
 	done;
+endef
 
 DEFAULT_INSTALL_RULE := $(INSTALL_RULE)
 override define INSTALL_RULE
-- 
2.53.0

