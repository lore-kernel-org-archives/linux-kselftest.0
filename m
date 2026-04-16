Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EC1282F13;
	Thu, 16 Apr 2026 13:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776345685; cv=none; b=bObo8qBYlVpleo56ZUMIIfZeC4/ySQ7K2mVDSdkfUyMNn0X/kn7d6gzwAk8QdCGFiPt0crh1188Pa5Nj9y62/9D6nmnEP58ABb/KO8wbG3HYj+04/cVBgW3Cdq+mv1NM0EBuCfbU3o6p4bixoczb+VgwwGLihmfGHxF7qzHUJ/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776345685; c=relaxed/simple;
	bh=KNEH2B/3cKbD4Ox1zRhS7kvDtEqd+S+LnelX9B3Saws=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hBLO6N/rplNrYsbULmscWj1ZbURFNzou78TY0U9t+PmhGzEmqBjKtbQTtY6rShTnT/xORw2t7o19+q7OTgXYMjDKy1FUISrHPXzq3wJGX29SthjOvlM7GC9EE+utGAebYWZmc2sEfkw4UOsk8bOU1NXOhgklsg5S+GuXr8JJJ5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nvddPm9z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nvddPm9z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B293C2BCAF;
	Thu, 16 Apr 2026 13:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776345685;
	bh=KNEH2B/3cKbD4Ox1zRhS7kvDtEqd+S+LnelX9B3Saws=;
	h=From:Date:Subject:To:Cc:From;
	b=nvddPm9zFGhCr2/s0pn+MxNCEuGvCkMbrh+s+cEE9ek2Wv38lmuveKmggalzvDGt6
	 tn/K0DndCEXGIpPeXiYOvdpw1EhmnwPlKTN581fx5lWxjDzqlOaj+CF7MXK/Sdnews
	 Yvz1MaHCWG+OkjA46/n0UnIbn13YQPBLdRODiC2x5vQOlUAWjifNTRj3FBZSeDO91C
	 BHDg2wsvUJdfLcZLLr2rHAcit/SG5OjUca24hcwHBV1MQysxTtt7kfB7G5YvxO/Pgs
	 gm1JwPzrZrfqeUfNzaIageP+hRnFyT3wX7wj8H8RhPaLqSc/oiE7bI3//tQrq4V0rM
	 dNBiScoG0imCA==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 16 Apr 2026 14:19:24 +0100
Subject: [PATCH] selftests: Deescalate error reporting
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-selftests-deescalate-error-reporting-v1-1-38e7c0536227@kernel.org>
X-B4-Tracking: v=1; b=H4sIANzh4GkC/yXNQQrCMBBG4auUWTvQhtiiVxEXSfq3RkpSZlIRS
 u9u1OW3eW8nhUQoXZudBK+oMaeK7tRQeLg0g+NYTaY1fWu7nhXLVKBFeQQ0uMUVMESysGDNUmK
 a2Tp7Meeh894MVFOrYIrv3+Z2/1s3/0Qo3zYdxwfx1iIDiAAAAA==
X-Change-ID: 20260416-selftests-deescalate-error-reporting-4a492571bb27
To: Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2914; i=broonie@kernel.org;
 h=from:subject:message-id; bh=KNEH2B/3cKbD4Ox1zRhS7kvDtEqd+S+LnelX9B3Saws=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp4OJSxFETLAxIv/KVZfqbD2g6pIHysqHfOdoPU
 Cds2dpd5EaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaeDiUgAKCRAk1otyXVSH
 0NqpB/9/DUzVLyRrJVcL7bBio8tC3sw7UmnQzCqfgqHyUmz37to0X+CBAkXUX4jkWjevPuzVTqz
 W5pK19oD/XmwCe5hFoNIsHaJoF3w2gZode42ToXZmf44wvV6fKpqhgB33nixTStDTLqwtpgS7Jz
 rouCTcYSM1k/DSHHK9bSZtQK9dQ5DKeOuTlwQZk4XT2T9bSq5DjlqPEFHPxY+X6zqPa5eDn8R3D
 gdznwhR1rvE9QYuBJ3tmR8b69EHmQ4+9zuiY8odHQz0V3w8bQZN9XhPNn+vWbqqDUnz/nmlJaoj
 EBt4DrAF4j4Zdaaniil7N2q2eJz5L+bmvBN2JdH4PaHWkAsi
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

Commit 7e47389142b8 ("selftests: Preserve subtarget failures in
all/install") updated the propagation of errors from indivdual kselftest
targets to be similar to that seen with FORCE_TARGETS.  While it would
be really nice to be in a position to do this currently it is premature
to do this as the default behaviour.

At present we default to trying to build all selftests but a combination
of code quality issues and build dependencies mean that it is almost
certain that at least one of them will fail to build (for example,
several depend on clang so don't work in a GCC container) and a top
level failure in the kselftest build reported.  Further, the resulting
failures mean that the install target does not run at all so any build
problem is escallated to a complete failure to produce a kselftest
tarball so CI systems that run into issues loose all selftests coverage.
This has been causing disruption to a range of CI systems including
KernelCI, mine and Arm's internal one.

Revert the commit, users who need this behaviour should be able to use
FORCE_TARGETS for the time being.  At present users that do this (such
as linux-next) are most likely building a subset of targets known to
succeed in their environments.

Fixes: 7e47389142b8 ("selftests: Preserve subtarget failures in all/install")
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/Makefile | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index 0949f370ad78..450f13ba4cca 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -209,14 +209,14 @@ export KHDR_INCLUDES
 .DEFAULT_GOAL := all
 
 all:
-	@ret=0;							\
+	@ret=1;							\
 	for TARGET in $(TARGETS) $(INSTALL_DEP_TARGETS); do	\
 		BUILD_TARGET=$$BUILD/$$TARGET;			\
 		mkdir $$BUILD_TARGET  -p;			\
 		$(MAKE) OUTPUT=$$BUILD_TARGET -C $$TARGET	\
 				O=$(abs_objtree)		\
 				$(if $(FORCE_TARGETS),|| exit);	\
-		[ $$? -eq 0 ] || ret=1;			\
+		ret=$$((ret * $$?));				\
 	done; exit $$ret;
 
 run_tests: all
@@ -274,7 +274,7 @@ ifdef INSTALL_PATH
 	install -m 744 kselftest/ksft.py $(INSTALL_PATH)/kselftest/
 	install -m 744 run_kselftest.sh $(INSTALL_PATH)/
 	rm -f $(TEST_LIST)
-	@ret=0;	\
+	@ret=1;	\
 	for TARGET in $(TARGETS) $(INSTALL_DEP_TARGETS); do \
 		BUILD_TARGET=$$BUILD/$$TARGET;	\
 		$(MAKE) OUTPUT=$$BUILD_TARGET -C $$TARGET install \
@@ -283,7 +283,7 @@ ifdef INSTALL_PATH
 				OBJ_PATH=$(INSTALL_PATH) \
 				O=$(abs_objtree)		\
 				$(if $(FORCE_TARGETS),|| exit);	\
-		[ $$? -eq 0 ] || ret=1;		\
+		ret=$$((ret * $$?));		\
 	done; exit $$ret;
 
 

---
base-commit: 7e47389142b8ada66280be71e01a3238751086f0
change-id: 20260416-selftests-deescalate-error-reporting-4a492571bb27

Best regards,
--  
Mark Brown <broonie@kernel.org>

