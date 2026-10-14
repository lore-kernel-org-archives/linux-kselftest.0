Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FBD38F230;
	Wed, 14 Oct 2026 20:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792008090; cv=none; b=cW7giGMrR18J9Xhj97zPu4xpdl50i2NVWiM4wQEfgk0NgeuWE3oKJskML8YNa29hFdgeQ36PQLCRMEsdRWghuMBF2Rr/407ZsdX7sGGyo+sTW13EOFQr4ywXv0/I/H5TqZM8h3lUemxNfZqY8teydLjSnZpYVOiYEU32C4fx5HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792008090; c=relaxed/simple;
	bh=3qD11HPFDagKzU1nuRAB1h462Tj/nX0V511tu8vCtRE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mhqnV+B25yg4BMAd85piGc7ueWc27wOZXl0MHwMX78h9hzoNWCVcHc3dnm4zRgeE9p0GkyV/FFmGZi/0tPXVWfAUtVERu0xmFoWxUELsZomNhJ/4V2ET1vdf/Ce2YYYrb/KVZAF7iGk0nxNtBZYkPS0j4uCgkdFM8ZxUArk14wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QGJi8nD0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QGJi8nD0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C60C1F000C5;
	Wed, 14 Oct 2026 20:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792008082;
	bh=mRexem4KV6KHScvbzz77XFjOE74k7LslCRLFHgVfnyc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QGJi8nD0vPoSQK0Trc2JLAFR6KIfisA6bKNAFgQdjKbhPdng/sPYcn1mfNZn4Lx4Q
	 onBNeMJVT/Q00j278e+4Jkd5CJAzyUAKNelpUTS4XPylK8wsvCME3p9QHDSZg89n0T
	 sX0FXeDlfCwSkLMvi+U7MIeAwuHaFyFWTwJdcaG0ADZQBAx1iyqjxfpuehQUaN8vrC
	 0b+XjluOw0cU4/h4efjrmm1N7v8mAG9ZvgWAdY1/OK8HtaQaqkwymhkM/PV0wUYDh+
	 A0pj1lcjeZt7UPrfROdHFuY6S/qwj7G76wdxyjJKvN/1heJEJs8XVJ3Eqc7zRKaPt5
	 3qWidvsJMpFuA==
From: Sasha Levin <sashal@kernel.org>
To: Shuah Khan <shuah@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Mark Brown <broonie@kernel.org>,
	=?UTF-8?q?Ricardo=20B=2E=20Marli=C3=A8re?= <rbm@suse.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] selftests/futex: report failures of the functional subdirectory
Date: Wed, 14 Oct 2026 16:01:11 -0400
Message-ID: <20261014200115.1363363-4-sashal@kernel.org>
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

The futex suite builds its tests in the functional subdirectory and then
copies run.sh into the output directory. The copy is the last command of
the loop, so its status replaces that of the build, and "make all"
succeeds even when the functional tests fail to compile.

Fold the copy into the status of the subdirectory, count a failure to
create the output directory as well, and let the build and installation
loops return failure when no subdirectory succeeds, which matches how the
top-level selftests Makefile treats its targets, or as soon as one fails
when FORCE_TARGETS is set. When a build report is requested, record each
subdirectory as futex/<subdir> so that a failure is visible even when
make itself succeeds.

Fixes: 9c3340ea7f5d ("selftests: futex: copy sub-dir test scripts for make O=dir run")
Fixes: 9705315b7562 ("selftests/futex: Update Makefile to use lib.mk")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/testing/selftests/futex/Makefile | 32 +++++++++++++++++---------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/tools/testing/selftests/futex/Makefile b/tools/testing/selftests/futex/Makefile
index 78ab2cd111f60..d6923775b8d49 100644
--- a/tools/testing/selftests/futex/Makefile
+++ b/tools/testing/selftests/futex/Makefile
@@ -4,26 +4,36 @@ SUBDIRS := functional
 TEST_PROGS := run.sh
 
 include ../lib.mk
+include $(selfdir)/build_report.mk
 
 all:
-	@for DIR in $(SUBDIRS); do		\
-		BUILD_TARGET=$(OUTPUT)/$$DIR;	\
-		mkdir $$BUILD_TARGET  -p;	\
-		$(MAKE) OUTPUT=$$BUILD_TARGET -C $$DIR $@;\
-		if [ -e $$DIR/$(TEST_PROGS) ]; then \
-			rsync -a $$DIR/$(TEST_PROGS) $$BUILD_TARGET/; \
-		fi \
-	done
+	@ret=$(if $(SUBDIRS),1,0); for DIR in $(SUBDIRS); do	\
+		BUILD_TARGET=$(OUTPUT)/$$DIR;			\
+		mkdir -p $$BUILD_TARGET &&			\
+		$(MAKE) OUTPUT=$$BUILD_TARGET -C $$DIR $@;	\
+		status=$$?;					\
+		if [ -e $$DIR/$(TEST_PROGS) ]; then		\
+			rsync -a $$DIR/$(TEST_PROGS) $$BUILD_TARGET/ || \
+				[ $$status -ne 0 ] || status=1;	\
+		fi;						\
+		$(call ksft_record_build_status,all,futex/$$DIR); \
+		$(if $(FORCE_TARGETS),[ $$status -eq 0 ] || exit $$status;) \
+		[ $$status -eq 0 ] && ret=0;			\
+	done; exit $$ret
 
 override define INSTALL_RULE
 	mkdir -p $(INSTALL_PATH)
 	install -t $(INSTALL_PATH) $(TEST_PROGS) $(TEST_PROGS_EXTENDED) $(TEST_FILES)
 
-	@for SUBDIR in $(SUBDIRS); do \
+	@ret=$(if $(SUBDIRS),1,0); for SUBDIR in $(SUBDIRS); do \
 		BUILD_TARGET=$(OUTPUT)/$$SUBDIR;	\
-		mkdir $$BUILD_TARGET  -p;	\
+		mkdir -p $$BUILD_TARGET &&		\
 		$(MAKE) OUTPUT=$$BUILD_TARGET -C $$SUBDIR INSTALL_PATH=$(INSTALL_PATH)/$$SUBDIR install; \
-	done;
+		status=$$?;				\
+		$(call ksft_record_build_status,install,futex/$$SUBDIR); \
+		$(if $(FORCE_TARGETS),[ $$status -eq 0 ] || exit $$status;) \
+		[ $$status -eq 0 ] && ret=0;		\
+	done; exit $$ret
 endef
 
 override define CLEAN
-- 
2.53.0

