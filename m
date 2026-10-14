Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B39E3D1713;
	Wed, 14 Oct 2026 20:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792008086; cv=none; b=HF9X9j9noeURXWuzLhlGcUqNRjQvUnI1k50FMmSVd2JW6efVYE2pZqBgEpOgL88VFI3VoLHpmtBOLDbhZT33zO1SfNiQSpMXbkq+cdrL+YhKe+D1fzYPScgt85/502ZCCvhFdtB1ZMhGxWoXv6nXg9Vi9ClCSQTgcrAwkfqqz5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792008086; c=relaxed/simple;
	bh=BS6H1M3oTphls87vDbJhnd9QtrKEVx3/XuigcvFPVpw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fhs0/zggTglM1ANjzpWRLUwghS3WKrIKdF1JC/AUz4+PhwRLSmrwLY+LcC0QM79wQ/O8Yg0TE4uCMH9i/RrA7FzH0YpJmmJfisgE3H7ZSxtJEm7sipHdNtvLA8l8x9U9nSAhq6w7Uj4MKKWD4WJo6LTFuVjZagD3Naim9XYOtgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PVjx+ehW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PVjx+ehW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBACC1F000C4;
	Wed, 14 Oct 2026 20:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792008085;
	bh=cQ1kewUL52K9zpMDeh2ONUK6G+L48N3I/Lb6qZvfwLg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PVjx+ehWybamuJ4XnmVcra5Skw2WuFdP/it84zbL6FfZpOhMnPQtkGf41lQsU5Atq
	 sdt20SlueVSNrpwjYIj+EYJ6/H44cdw97bb2Y5Hai9xyUlKdI9RePkFMB9nc0MLN8A
	 oTgij/H838Zs9uB6Ged8wcj2Tv8NuHZUptrkI/jskH/IoF8YXPB2uFgGJMcZGN11tM
	 pHqosn7dzbz9eG1eRDX/LaFha6VKG0wCNh1R/JH+boAKEfcGTQFcAVksppOy06l1Jq
	 NhZ9WCvG2qY9TzJVBL8sE/3/7PMBFtVEi85kJMrX1+6TCNFMotiZIjygonDs2wzQy2
	 JzbwRjhsDgs9w==
From: Sasha Levin <sashal@kernel.org>
To: Shuah Khan <shuah@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	Mark Brown <broonie@kernel.org>,
	=?UTF-8?q?Ricardo=20B=2E=20Marli=C3=A8re?= <rbm@suse.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] selftests/riscv: keep building and installing after a subdirectory fails
Date: Wed, 14 Oct 2026 16:01:13 -0400
Message-ID: <20261014200115.1363363-6-sashal@kernel.org>
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

The RISC-V suite builds and installs its subdirectories in shell loops
whose status is that of the last subdirectory. A failure in any other
subdirectory is lost, while a failure in the last one fails "make all"
and, through "install: all", drops the installation of every other
RISC-V test as well. FORCE_TARGETS has no effect on the loops either.

Make each loop fail only when no subdirectory succeeds, which matches
how the top-level selftests Makefile treats its targets, and stop at the
first failure when FORCE_TARGETS is set. When a build report is
requested, record each subdirectory as riscv/<subdir> so that a
partially built suite is visible even though make succeeds. Default
OUTPUT to the current directory, as the arm64 suite does, so that the
loops also work when the suite is built directly.

Fixes: 287dcc2b0c83 ("selftests: Test the new RISC-V hwprobe interface")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/testing/selftests/riscv/Makefile | 39 +++++++++++++++++++-------
 1 file changed, 29 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/riscv/Makefile b/tools/testing/selftests/riscv/Makefile
index 5671b4405a129..52d1228be8d03 100644
--- a/tools/testing/selftests/riscv/Makefile
+++ b/tools/testing/selftests/riscv/Makefile
@@ -20,21 +20,35 @@ CFLAGS += -I$(top_srcdir)/tools/testing/selftests/
 
 CFLAGS += $(KHDR_INCLUDES)
 
+OUTPUT ?= $(CURDIR)
+
 export CFLAGS
 export top_srcdir
 
+include $(top_srcdir)/tools/testing/selftests/build_report.mk
+
 all:
-	@for DIR in $(RISCV_SUBTARGETS); do				\
+	@ret=$(if $(RISCV_SUBTARGETS),1,0);				\
+	for DIR in $(RISCV_SUBTARGETS); do				\
 		BUILD_TARGET=$(OUTPUT)/$$DIR;			\
-		mkdir -p $$BUILD_TARGET;			\
-		$(MAKE) OUTPUT=$$BUILD_TARGET -C $$DIR $@;		\
-	done
+		mkdir -p $$BUILD_TARGET &&			\
+		$(MAKE) OUTPUT=$$BUILD_TARGET -C $$DIR $@;	\
+		status=$$?;					\
+		$(call ksft_record_build_status,all,riscv/$$DIR); \
+		$(if $(FORCE_TARGETS),[ $$status -eq 0 ] || exit $$status;) \
+		[ $$status -eq 0 ] && ret=0;			\
+	done; exit $$ret
 
 install: all
-	@for DIR in $(RISCV_SUBTARGETS); do				\
+	@ret=$(if $(RISCV_SUBTARGETS),1,0);				\
+	for DIR in $(RISCV_SUBTARGETS); do				\
 		BUILD_TARGET=$(OUTPUT)/$$DIR;			\
-		$(MAKE) OUTPUT=$$BUILD_TARGET -C $$DIR $@;		\
-	done
+		$(MAKE) OUTPUT=$$BUILD_TARGET -C $$DIR $@;	\
+		status=$$?;					\
+		$(call ksft_record_build_status,install,riscv/$$DIR); \
+		$(if $(FORCE_TARGETS),[ $$status -eq 0 ] || exit $$status;) \
+		[ $$status -eq 0 ] && ret=0;			\
+	done; exit $$ret
 
 run_tests: all
 	@for DIR in $(RISCV_SUBTARGETS); do				\
@@ -44,10 +58,15 @@ run_tests: all
 
 # Avoid any output on non riscv on emit_tests
 emit_tests:
-	@for DIR in $(RISCV_SUBTARGETS); do				\
+	@ret=$(if $(RISCV_SUBTARGETS),1,0);				\
+	for DIR in $(RISCV_SUBTARGETS); do				\
 		BUILD_TARGET=$(OUTPUT)/$$DIR;			\
-		$(MAKE) OUTPUT=$$BUILD_TARGET -C $$DIR $@;		\
-	done
+		$(MAKE) OUTPUT=$$BUILD_TARGET -C $$DIR $@;	\
+		status=$$?;					\
+		$(call ksft_record_build_status,install,riscv/$$DIR); \
+		$(if $(FORCE_TARGETS),[ $$status -eq 0 ] || exit $$status;) \
+		[ $$status -eq 0 ] && ret=0;			\
+	done; exit $$ret
 
 clean:
 	@for DIR in $(RISCV_SUBTARGETS); do				\
-- 
2.53.0

