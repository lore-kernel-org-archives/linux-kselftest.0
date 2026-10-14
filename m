Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B154A418368;
	Wed, 14 Oct 2026 20:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792008086; cv=none; b=D4qexKjShdethqyYB6z9ORbAobsNQruhErhTMz67GvxOF5NjFDxLJUZi3zuiS+5TrbmOteF8n549EioZ29zkPIh32YBcAmb4DWPCtqF0AKkktkiExu4U/6yOxrXM0RV3n7/MJJDrtBKCRD4T1aVBgC/Rre72jlKV0vrpB4mfolw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792008086; c=relaxed/simple;
	bh=FfJa+D/XDk1R4OQzRAosPwG7PGjn6eHL6MAjz87AzZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r7eFzObnlLhDqt2hxwPsd/PhsEiRE0c3wFbXXc5Np+CY/5+KUp8lR0Jsmx8RVyhkXyTKgXCxmQPInNJeXzocHnhNlnHcULIj11UmH/EzKTqiIvGGXTp166vTQBPsLpuZ6lB8mrJsW7mgEvGMmqId2EskS8FgQwtJ1E9OR8n4UwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U6jHo78e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U6jHo78e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB6511F000C9;
	Wed, 14 Oct 2026 20:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792008083;
	bh=rA58PSq59ct6hyQRhMEzlraWcFyA2/zxWUU6GgU+788=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=U6jHo78e72z2xYPYD5ffo2o4IhU2p9EYuHvk1szfldPP2qD5DbpzmUx77WUQYLT/x
	 tHTEOgNDtKxDXMooe4WsZ1VxS/H7OpVDqsX3NmUts14zSNB+syl3VTjH4WexpLYGTk
	 uWDkvCsyBSRWTuqcJupKDP236eN9O0IwqLakRjSY6evQZoNAytL80ugjyrKPmZn85w
	 kHsrmB6VBuALEuyQFIKXmyKCZuHpsHfOpkARVtDrm9qe4+syOmXKVQy+VNk5tT8XsN
	 zVIqi5TmF9H0giqEB3Pn70IijK5lXLVHSvThJfosysipf3VcfgZic6YcGmtw2WMWRn
	 UxKg67QWUcDZw==
From: Sasha Levin <sashal@kernel.org>
To: Shuah Khan <shuah@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Mark Brown <broonie@kernel.org>,
	=?UTF-8?q?Ricardo=20B=2E=20Marli=C3=A8re?= <rbm@suse.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] kselftest/arm64: keep building and installing after a subdirectory fails
Date: Wed, 14 Oct 2026 16:01:12 -0400
Message-ID: <20261014200115.1363363-5-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261014200115.1363363-1-sashal@kernel.org>
References: <20261014200115.1363363-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The arm64 suite builds and installs its subdirectories in shell loops
whose status is that of the last subdirectory. A failure in an earlier
subdirectory is therefore lost unless FORCE_TARGETS is set, while a
failure in the last one fails "make all" and, through "install: all",
drops the installation of every other arm64 test as well.

Make each loop fail only when no subdirectory succeeds, which matches
how the top-level selftests Makefile treats its targets, and keep
stopping at the first failure when FORCE_TARGETS is set. When a build
report is requested, record each subdirectory as arm64/<subdir> so that
a partially built suite is visible even though make succeeds.

Invoke the subdirectories with $(MAKE) rather than make. The command
line variables already reach them through MAKEFLAGS either way, but
$(MAKE) lets them use the parent's jobserver and makes -n, -t and -q
apply to them.

Fixes: 313a4db7f338 ("kselftest: arm64: extend toplevel skeleton Makefile")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/testing/selftests/arm64/Makefile | 43 +++++++++++++++++---------
 1 file changed, 29 insertions(+), 14 deletions(-)

diff --git a/tools/testing/selftests/arm64/Makefile b/tools/testing/selftests/arm64/Makefile
index e456f3b62fa13..c787e848d4718 100644
--- a/tools/testing/selftests/arm64/Makefile
+++ b/tools/testing/selftests/arm64/Makefile
@@ -26,38 +26,53 @@ OUTPUT ?= $(CURDIR)
 export CFLAGS
 export top_srcdir
 
+include $(top_srcdir)/tools/testing/selftests/build_report.mk
+
 all:
-	@for DIR in $(ARM64_SUBTARGETS); do				\
+	@ret=$(if $(ARM64_SUBTARGETS),1,0);				\
+	for DIR in $(ARM64_SUBTARGETS); do				\
 		BUILD_TARGET=$(OUTPUT)/$$DIR;			\
-		mkdir -p $$BUILD_TARGET;			\
-		make OUTPUT=$$BUILD_TARGET -C $$DIR $@		\
-			$(if $(FORCE_TARGETS),|| exit); \
-	done
+		mkdir -p $$BUILD_TARGET &&			\
+		$(MAKE) OUTPUT=$$BUILD_TARGET -C $$DIR $@;	\
+		status=$$?;					\
+		$(call ksft_record_build_status,all,arm64/$$DIR); \
+		$(if $(FORCE_TARGETS),[ $$status -eq 0 ] || exit $$status;) \
+		[ $$status -eq 0 ] && ret=0;			\
+	done; exit $$ret
 
 install: all
-	@for DIR in $(ARM64_SUBTARGETS); do				\
+	@ret=$(if $(ARM64_SUBTARGETS),1,0);				\
+	for DIR in $(ARM64_SUBTARGETS); do				\
 		BUILD_TARGET=$(OUTPUT)/$$DIR;			\
-		make OUTPUT=$$BUILD_TARGET -C $$DIR $@		\
-			$(if $(FORCE_TARGETS),|| exit); \
-	done
+		$(MAKE) OUTPUT=$$BUILD_TARGET -C $$DIR $@;	\
+		status=$$?;					\
+		$(call ksft_record_build_status,install,arm64/$$DIR); \
+		$(if $(FORCE_TARGETS),[ $$status -eq 0 ] || exit $$status;) \
+		[ $$status -eq 0 ] && ret=0;			\
+	done; exit $$ret
 
 run_tests: all
 	@for DIR in $(ARM64_SUBTARGETS); do				\
 		BUILD_TARGET=$(OUTPUT)/$$DIR;			\
-		make OUTPUT=$$BUILD_TARGET -C $$DIR $@;		\
+		$(MAKE) OUTPUT=$$BUILD_TARGET -C $$DIR $@;	\
 	done
 
 # Avoid any output on non arm64 on emit_tests
 emit_tests:
-	@for DIR in $(ARM64_SUBTARGETS); do				\
+	@ret=$(if $(ARM64_SUBTARGETS),1,0);				\
+	for DIR in $(ARM64_SUBTARGETS); do				\
 		BUILD_TARGET=$(OUTPUT)/$$DIR;			\
-		make OUTPUT=$$BUILD_TARGET -C $$DIR $@;		\
-	done
+		$(MAKE) OUTPUT=$$BUILD_TARGET -C $$DIR $@;	\
+		status=$$?;					\
+		$(call ksft_record_build_status,install,arm64/$$DIR); \
+		$(if $(FORCE_TARGETS),[ $$status -eq 0 ] || exit $$status;) \
+		[ $$status -eq 0 ] && ret=0;			\
+	done; exit $$ret
 
 clean:
 	@for DIR in $(ARM64_SUBTARGETS); do				\
 		BUILD_TARGET=$(OUTPUT)/$$DIR;			\
-		make OUTPUT=$$BUILD_TARGET -C $$DIR $@;		\
+		$(MAKE) OUTPUT=$$BUILD_TARGET -C $$DIR $@;	\
 	done
 
 .PHONY: all clean install run_tests emit_tests
-- 
2.53.0

