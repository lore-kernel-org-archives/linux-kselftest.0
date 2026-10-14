Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446BA385D75;
	Wed, 14 Oct 2026 20:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792008082; cv=none; b=ZXXQjp+dEx6v/pTEY9XMO79Cs2o7sLh3a5S9l3TXI4MMwLPw3suZZ95pZNH20iRJ97uM9fLoO+7oIPu6glc3oxwPtqPYSD06onSWwyBhGxxvHInMn1KMTGegTK7q9jjsO+7VBku7tut03vNbcxIAAcfyktitKgTzb84fPOjj9aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792008082; c=relaxed/simple;
	bh=F8Io4wrMH5qEwkinlAkgOpNnMfKvLhnA2ldp5UPWSLY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LnwJ3nlHmy0EMgBYTo7et8RouqWEDhlyzHCtmTeJjFPjkaAcPer0yWyu/W3YeAGflE6zA1rP7eTf/JzmNZnJasaw1yXM2682CyNtc1YhtQpIMjVimjmwrrDvW9X0CGRLL9FaUwx/tpdtVB1qjA3DFnHvOTSh5mxy0rHjVjkYR6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e+phRhfh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e+phRhfh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 272E21F000C8;
	Wed, 14 Oct 2026 20:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792008081;
	bh=OR6QIYgjzi9W5ngPDakiyBdLmzWuTESeAzlQDSQm0Cg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=e+phRhfhb/yS+gwzYmM0yTvHZdmnWASACHQZAygWO84S3W0fZXEgMaKSRtF6sTZ39
	 fU0y3xIYr44gksklZbjSrdU3zwJvFzCM+xoG/6gYGoYnvqagq5df15cC8ug1vXfH5Q
	 AnIC81aXq1AMn/lS2q4bAg8XKNROJnN66wJhBMbcEHe2nLftI6zUkLNEGAd7koo9jo
	 Cpt1aBlJhO4jFIM9tom/RTSOm2qBXbBAQtDvuaR7MlaW7I8FZpatnzHiLq83T6XVQR
	 R2HSzWoaz3JbS820B0Xw+MAj5yCfIAqZEanuyjWslnPJfMt+Nmp19O6zluGCi6m08/
	 2WTWoAgDq0RNQ==
From: Sasha Levin <sashal@kernel.org>
To: Shuah Khan <shuah@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	=?UTF-8?q?Ricardo=20B=2E=20Marli=C3=A8re?= <rbm@suse.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] selftests: optionally record per-suite build and install results
Date: Wed, 14 Oct 2026 16:01:10 -0400
Message-ID: <20261014200115.1363363-3-sashal@kernel.org>
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

By default the selftests build and installation succeed as long as one
target succeeds, so that a single broken suite does not cost CI systems
the coverage of all others; commit cad6f32665cb ("selftests: Deescalate
error reporting") restored that policy after it had been tightened.
The exit status of make therefore cannot tell which suites failed, and
inspecting the installation is not reliable either: a suite whose
compilation failed can still install its scripts.

Add an opt-in report. When KSFT_BUILD_REPORT names an absolute file,
the all and install rules append one tab-separated record per target
with the phase, the target name and the exit status of its recursive
make. Generating the runlist is recorded as part of the install phase.
The records are written without changing which targets are built or
installed or the exit status of make, also with FORCE_TARGETS. Nothing
is recorded by make -n, -t or -q, including when the selftests are
built through the kernel's kselftest targets, which clear MAKEFLAGS.

The recording helper lives in a small fragment so that suites built
from subdirectories can add records for them, and the variable is
exported to sub-makes. A relative path is rejected, since every
recursive make runs in a different directory. Keep the exit status of
the runlist generation loop as before, and create an empty runlist for
installations in which no target emits tests.

Document the format, version 1, and how to read it.

Link: https://lore.kernel.org/r/20260416-selftests-deescalate-error-reporting-v1-1-38e7c0536227@kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 Documentation/dev-tools/kselftest.rst   | 38 +++++++++++++++++++++++++
 tools/testing/selftests/Makefile        | 31 ++++++++++++++------
 tools/testing/selftests/build_report.mk | 26 +++++++++++++++++
 3 files changed, 87 insertions(+), 8 deletions(-)
 create mode 100644 tools/testing/selftests/build_report.mk

diff --git a/Documentation/dev-tools/kselftest.rst b/Documentation/dev-tools/kselftest.rst
index fc4dc1f9dc931..0772525cbc627 100644
--- a/Documentation/dev-tools/kselftest.rst
+++ b/Documentation/dev-tools/kselftest.rst
@@ -133,6 +133,44 @@ build successfully; make will abort as soon as any target fails::
 This applies to both the ``all`` and ``install`` targets and is useful in
 CI environments where a silent partial build would be misleading.
 
+Recording suite build results
+=============================
+
+Since the build succeeds as long as one target builds, the exit status of
+make does not show which targets failed. Set ``KSFT_BUILD_REPORT`` to the
+absolute path of a file to have the ``all`` and ``install`` targets append
+a tab-separated record for each target they process::
+
+  $ : > /tmp/ksft-build.tsv
+  $ make -C tools/testing/selftests O=/tmp/kernel-build \
+        KSFT_BUILD_REPORT=/tmp/ksft-build.tsv install
+
+Each record holds the phase (``all`` or ``install``), a name and the exit
+status of that step. Recording does not change which targets are built or
+installed, or the exit status of make, also with ``FORCE_TARGETS=1``. The
+caller creates or truncates the report before a build; the rules only
+append to it. Nothing is recorded by ``make -n``, ``-t`` or ``-q``.
+
+The same name can appear several times: ``install`` builds the targets
+again, and generating ``kselftest-list.txt`` is recorded as part of the
+``install`` phase. Targets that are added automatically as installation
+dependencies of other targets, such as ``net/lib``, are recorded too.
+Suites that are built from several subdirectories may also record each
+subdirectory under its path, for example ``arm64/tags``; a failure there
+means that the suite was built or installed only partially. A record
+belongs to the target with the longest name that is equal to the record
+name or followed by ``/`` in it.
+
+A target was built and installed successfully only if all of its records
+have a zero status. Missing records do not show that a target was built.
+A successful target that installs no tests has no entries in
+``kselftest-list.txt``. Install the kernel headers with ``make headers``
+before building: a suite that fails because the headers are missing is
+recorded as failed even if a later step installs them.
+
+``KSFT_BUILD_REPORT_VERSION`` in tools/testing/selftests/Makefile gives the
+version of this format, currently ``1``.
+
 Running the full range hotplug selftests
 ========================================
 
diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index a442b239f0610..abbb854886cfb 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -180,6 +180,10 @@ endif
 # of the targets gets built.
 FORCE_TARGETS ?=
 
+# Remember dry runs for the build report before MAKEFLAGS may be cleared.
+KSFT_BUILD_REPORT_DRY_RUN := $(strip $(foreach f,n t q,$(findstring $(f),$(firstword -$(MAKEFLAGS)))))
+export KSFT_BUILD_REPORT_DRY_RUN
+
 # Clear LDFLAGS and MAKEFLAGS when implicit rules are missing.  This provides
 # implicit rules to sub-test Makefiles which avoids build failures in test
 # Makefile that don't have explicit build rules.
@@ -224,6 +228,10 @@ ARCH           ?= $(SUBARCH)
 export BUILD
 export KHDR_INCLUDES
 
+# Version of the optional KSFT_BUILD_REPORT format written by these rules.
+KSFT_BUILD_REPORT_VERSION := 1
+include $(top_srcdir)/tools/testing/selftests/build_report.mk
+
 # set default goal to all, so make without a target runs all, even when
 # all isn't the first target in the file.
 .DEFAULT_GOAL := all
@@ -232,11 +240,13 @@ all:
 	@ret=1;							\
 	for TARGET in $(TARGETS) $(INSTALL_DEP_TARGETS); do	\
 		BUILD_TARGET=$$BUILD/$$TARGET;			\
-		mkdir $$BUILD_TARGET  -p;			\
+		mkdir -p $$BUILD_TARGET &&			\
 		$(MAKE) OUTPUT=$$BUILD_TARGET -C $$TARGET	\
-				O=$(abs_objtree)		\
-				$(if $(FORCE_TARGETS),|| exit);	\
-		[ $$? -eq 0 ] && ret=0;				\
+				O=$(abs_objtree);		\
+		status=$$?;					\
+		$(call ksft_record_build_status,all,$$TARGET);	\
+		$(if $(FORCE_TARGETS),[ $$status -eq 0 ] || exit $$status;) \
+		[ $$status -eq 0 ] && ret=0;			\
 	done; exit $$ret;
 
 run_tests: all
@@ -293,7 +303,7 @@ ifdef INSTALL_PATH
 	install -m 744 kselftest/ktap_helpers.sh $(INSTALL_PATH)/kselftest/
 	install -m 744 kselftest/ksft.py $(INSTALL_PATH)/kselftest/
 	install -m 744 run_kselftest.sh $(INSTALL_PATH)/
-	rm -f $(TEST_LIST)
+	: > $(TEST_LIST)
 	@ret=1;	\
 	for TARGET in $(TARGETS) $(INSTALL_DEP_TARGETS); do \
 		BUILD_TARGET=$$BUILD/$$TARGET;	\
@@ -301,9 +311,11 @@ ifdef INSTALL_PATH
 				INSTALL_PATH=$(INSTALL_PATH)/$$TARGET \
 				SRC_PATH=$(shell readlink -e $$(pwd)) \
 				OBJ_PATH=$(INSTALL_PATH) \
-				O=$(abs_objtree)		\
-				$(if $(FORCE_TARGETS),|| exit);	\
-		[ $$? -eq 0 ] && ret=0;		\
+				O=$(abs_objtree);		\
+		status=$$?;				\
+		$(call ksft_record_build_status,install,$$TARGET); \
+		$(if $(FORCE_TARGETS),[ $$status -eq 0 ] || exit $$status;) \
+		[ $$status -eq 0 ] && ret=0;		\
 	done; exit $$ret;
 
 
@@ -317,6 +329,9 @@ ifdef INSTALL_PATH
 		printf "Emit Tests for $$TARGET\n"; \
 		$(MAKE) -s --no-print-directory OUTPUT=$$BUILD_TARGET COLLECTION=$$TARGET \
 			-C $$TARGET emit_tests >> $(TEST_LIST); \
+		status=$$?; \
+		$(call ksft_record_build_status,install,$$TARGET); \
+		(exit $$status); \
 	done;
 	@VERSION=$$(git describe HEAD 2>/dev/null); \
 	if [ -n "$$VERSION" ]; then \
diff --git a/tools/testing/selftests/build_report.mk b/tools/testing/selftests/build_report.mk
new file mode 100644
index 0000000000000..047c239925e16
--- /dev/null
+++ b/tools/testing/selftests/build_report.mk
@@ -0,0 +1,26 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Optional per-suite build report, see "Recording suite build results" in
+# Documentation/dev-tools/kselftest.rst. Callers set KSFT_BUILD_REPORT to an
+# absolute filename and use ksft_record_build_status from a shell loop that
+# has stored the exit status of the recorded step in $status.
+
+ifneq (x$(KSFT_BUILD_REPORT)x,xx)
+ifeq ($(filter x/%,$(firstword x$(KSFT_BUILD_REPORT))),)
+$(error KSFT_BUILD_REPORT must be an absolute path: '$(KSFT_BUILD_REPORT)')
+endif
+endif
+export KSFT_BUILD_REPORT
+
+ksft_build_report_dry_run := $(KSFT_BUILD_REPORT_DRY_RUN) \
+	$(foreach f,n t q,$(findstring $(f),$(firstword -$(MAKEFLAGS))))
+
+ifneq ($(strip $(ksft_build_report_dry_run)),)
+ksft_record_build_status = :
+else
+define ksft_record_build_status
+if [ -n "$$KSFT_BUILD_REPORT" ]; then \
+	printf '%s\t%s\t%d\n' '$(1)' "$(2)" "$$status" >> "$$KSFT_BUILD_REPORT" || exit 1; \
+fi
+endef
+endif
-- 
2.53.0

