Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849E3415F0B
	for <linux-kselftest@vger.kernel.org>; Thu, 13 Aug 2026 06:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786602856; cv=none; b=tNy2+A7vn21KjGJvUU5j2AlEp6cM/sQ5WatXTpk0mh9CcWZAxD6S8ZfQtGiDcren0DdyfMwBadS+ZcOSTQWDqPqBorZAyl4EcrymqCikQvY4rnWg8rPSErCpTvEmZ1XbiLLdV3brS2lhZIRXbi4+klwRr0yEIkxB1GOZFRDDeYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786602856; c=relaxed/simple;
	bh=7rcLMD0keIGH8AyfP3hrT4YlSQpK9imUFB1Sz1AxRUw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=epaYRcpROE/1Vk9BMqm1oILaJjE2TYrMfpHFr+mlpXBLwSKQuzhYd/hrpKvMydV9qkyw8SkmvA7CAU0Y3qza4cs67OjtfDEelig5SVBiYLIBZUR4GtVNahLowBZbDkhPI40RR0XXVRUwcBOuFpjlrw1gGZ1ekCNpTMIvogYdOXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fQySS1Ie; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fQySS1Ie"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-848643382fcso1766739b3a.1
        for <linux-kselftest@vger.kernel.org>; Wed, 12 Aug 2026 23:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786602854; x=1787207654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=70ar5JlTr4siaYWARGHSNLurtbvgFrnTr20To12QjOE=;
        b=fQySS1IeljJ3IFOqvDqB3S2mKXkYwUtZTCRLQ6uUq6FPAgjUVYPkydOXDYAMphgW8h
         /bC+m7XstHAg9DrXuIRvRqeWDUd6jUFp9cfJVNS0Y9sdVn8++tocPcqoC8slpbSmT2Oj
         kidhm9sgXBlUvq/2v5E1XbZ5O4y+mUHNgmu/asOn8T0klgdnEk/b7b8fXoIMjDusYBJZ
         M7tK7eVTbVatP75mdDVPFISSPJtBaFp65fyIqhaNUNiEYT0JOaXRkbOHq5nW5UyAMKyW
         Og6PeSv9aH2aOskPfew6pbOtzW2b2YDdiUl0F73oWyy+LiLEv2yVVrRFUbgP6KbnteeV
         D/jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786602854; x=1787207654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=70ar5JlTr4siaYWARGHSNLurtbvgFrnTr20To12QjOE=;
        b=tBzf1GLERIBx8KBQAuvFmFQ3Xbm/O8hjEMpe7GtP4dz4EVLY1JHWuv22aIcoUxoEd6
         EnCIQ463qe9aO+zM23/E3R0h7JXYdkqsp2FXry2E7oZHsSJd6pevUt566LBIN47kgxq4
         SBFq+Rjw3vvKC/JjV1e1uI7JPhDXFoFBiHJLcnIH9wtTx3LG7Twf2+RkSQ3Uh49xACPi
         JImBc6ZHUTAGU9EIw6QnVlgAeoIZV002TACBfJmjjJE484M32VC873aHnyaG71eo2HI7
         e1LVGQS/Yi8JRj1UXL747O7I/vIkSJetn77ykblXhDkYDbxQ3fFpIDtvlr+9iFBkxyEi
         YYBw==
X-Forwarded-Encrypted: i=1; AHgh+RpPLXN2dUMudfTefPIICHoLtVOedxrZ4uWIietkbH/6qxT3miFuC5kP/2FbdA6H5YsCkF0fTJsaJbtx0Ravn4w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSM2tWnl7tJY9yUIfePxM0FZ0wE1RHMKFUgCU7YhpsxP+owtfb
	MWyrixlA1hOYknzRCKpcIjtxfOqH8g6w5y9+F1cF3RDSXs0XReMoUadu
X-Gm-Gg: AR+sD11RyKp8vbCGP004z3qKUTeDee8ldV30YFmx+DmU6NYJQhG2E9vUzMBqQucxtV9
	lQKYRhN+m4arsHw3KSz9hy5tQHlCsK0NEX1K9K0Pio/UYZUNBfg5WHxV5t5Zuc3pqJO/ReyJnq6
	MlZV0G4j18zT1bUsQlmGDApR86nc/TIyjFHsFR7tUwUpa5p4aXkCiwfIeheiILclKhd512OIe66
	Z2PXgx/c8TF1P6yk9XGmgGDR02ywM8SpunLgqDlD4+9zhPnBJHqExskD8vCbIrqE0DI/uO9QwPp
	9+ueVq7iTfLTpP+OnWB6Wg9FmDTZZgFAVLGdxLZ5+WOO36SbO/r1YpkIZgbusx2d8L/YhbGPUIR
	ezuB8hHq5+qZk4A4NM55qzdaNuRbbsSKQv0qqwKy/UFErvN5dLBkuGpzUwGEoxrxUglnItlNQ5V
	P64UD8Gxk5TJIOhw2pNgIzCociPZdmS4r94Dh/9bebgzvabYp0rCwaZm+r8nGla7KJEOHAuz/mq
	IAjKGq2p+Ldl5ECBmTsobkXRGZMtwRMjn+qcM1/ehl8vtokjHQMx1/v1tAjgibBMw==
X-Received: by 2002:a05:6a00:e10:b0:84e:1a9d:d879 with SMTP id d2e1a72fcca58-84fc760d2b4mr3746110b3a.28.1786602853695;
        Wed, 12 Aug 2026 23:34:13 -0700 (PDT)
Received: from ikb-h07-29-noble.in.iijlab.net ([202.214.97.5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbef710cc24sm493765a12.20.2026.08.12.23.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 23:34:13 -0700 (PDT)
Received: by ikb-h07-29-noble.in.iijlab.net (Postfix, from userid 1010)
	id 24DD715B0433; Thu, 13 Aug 2026 15:34:11 +0900 (JST)
From: Hajime Tazaki <thehajime@gmail.com>
To: linux-mm@kvack.org
Cc: geert@linux-m68k.org,
	daniel@thingy.jp,
	Hajime Tazaki <thehajime@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>,
	Mark Brown <broonie@kernel.org>,
	Brendan Jackman <jackmanb@google.com>,
	Hangbin Liu <liuhangbin@gmail.com>,
	"Ricardo B. Marliere" <rbm@suse.com>,
	linux-kselftest@vger.kernel.org,
	linux-um@lists.infradead.org
Subject: [RFC PATCH 5/6] selftests: run tests on nommu architecture
Date: Thu, 13 Aug 2026 15:34:00 +0900
Message-ID: <20260813063401.1786548-6-thehajime@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260813063401.1786548-1-thehajime@gmail.com>
References: <20260813063401.1786548-1-thehajime@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Architectures lacks MMU doesn't support fork(2) syscall and only
vfork(2) is available with limitations.  Thus, we cannot run kselftest
on nommu architecture as is.

This commit addresses this issue with the following changes:

- on build stage, add -DCONFIG_NOMMU to CFLAGS when NOMMU=1 variable
  added to the build/make argument.
- on test run stage, avoid calling timeout command when NOMMU=1 variable
  added to environmental variable, since timeout command uses fork
  syscall which nommu platform doesn't support.
- kselftest_harness.h warns if the file is include when building for
  NOMMU platform, as there is no fork(2) syscall.
- replace "cd -" use as it is not available a shell supported on nommu
  (e.g., busybox hush), use cd "$OLDDIR" instead.
- describe the difference of nommu tests in the document.

So command line to build/execute tests for nommu should be like below:

 $ make ARCH=um NOMMU=1 O=build kselftest
 $ make ARCH=um NOMMU=1 -C tools/testing/selftests/mm run_tests
 $ NOMMU=1 /tmp/kselftest_install/run_kselftest.sh -s -c mm

Cc: Shuah Khan <shuah@kernel.org>
Cc: Kees Cook <kees@kernel.org>
Cc: Andy Lutomirski <luto@amacapital.net>
Cc: Will Drewry <wad@chromium.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Brendan Jackman <jackmanb@google.com>
Cc: Hangbin Liu <liuhangbin@gmail.com>
Cc: "Ricardo B. Marliere" <rbm@suse.com>
Cc: linux-kselftest@vger.kernel.org
Cc: linux-um@lists.infradead.org
Signed-off-by: Hajime Tazaki <thehajime@gmail.com>
---
 Documentation/dev-tools/kselftest.rst       | 12 ++++++++++++
 tools/testing/selftests/kselftest/runner.sh |  9 +++++++--
 tools/testing/selftests/kselftest_harness.h |  4 ++++
 tools/testing/selftests/lib.mk              |  8 ++++++++
 4 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/Documentation/dev-tools/kselftest.rst b/Documentation/dev-tools/kselftest.rst
index 64c0ec7428a2..800b2b688aff 100644
--- a/Documentation/dev-tools/kselftest.rst
+++ b/Documentation/dev-tools/kselftest.rst
@@ -230,6 +230,18 @@ section::
 
 .. _tar's auto-compress: https://www.gnu.org/software/tar/manual/html_node/gzip.html#auto_002dcompress
 
+Build and test on nommu target
+==============================
+
+If you (cross-)build kselftests for nommu targets, or run tests on nommu targets, use
+``NOMMU=1`` as a make variable/environment setting to tell build system to do the additional
+checks.  These nommu targets may differ in several ways, such as not supporting fork(2) or
+using musl or another libc.  Set this variable to apply the necessary build and test adjustments.
+
+  $ make ARCH=um NOMMU=1 O=build kselftest
+  $ make ARCH=um NOMMU=1 -C tools/testing/selftests/mm run_tests
+  $ NOMMU=1 /tmp/kselftest_install/run_kselftest.sh -s -c mm
+
 Contributing new tests
 ======================
 
diff --git a/tools/testing/selftests/kselftest/runner.sh b/tools/testing/selftests/kselftest/runner.sh
index 311811dc55a0..7287d8290b6c 100644
--- a/tools/testing/selftests/kselftest/runner.sh
+++ b/tools/testing/selftests/kselftest/runner.sh
@@ -38,8 +38,12 @@ tap_prefix()
 
 tap_timeout()
 {
+	# nommu doesn't support timeout command (missing fork(2))
+	if [ "$NOMMU" = "1" ] ; then
+		echo "timeout isn't supported for nommu"
+		$1
 	# Make sure tests will time out if utility is available.
-	if [ -x /usr/bin/timeout ] ; then
+	elif [ -x /usr/bin/timeout ] ; then
 		/usr/bin/timeout --foreground "$kselftest_timeout" \
 			/usr/bin/timeout "$kselftest_timeout" $1
 	else
@@ -130,6 +134,7 @@ run_one()
 				return $KSFT_FAIL
 			fi
 		fi
+		OLDDIR=$(pwd)
 		cd `dirname $TEST` > /dev/null
 		(((( tap_timeout "$cmd" 2>&1; echo $? >&3) |
 			tap_prefix >&4) 3>&1) |
@@ -147,7 +152,7 @@ run_one()
 		*)
 			ktap_test_fail "$TEST_HDR_MSG # exit=$rc";;
 		esac
-		cd - >/dev/null
+		cd "$OLDDIR" >/dev/null
 	fi
 
 	return $rc
diff --git a/tools/testing/selftests/kselftest_harness.h b/tools/testing/selftests/kselftest_harness.h
index 261e4df94d9d..8eee7b14f824 100644
--- a/tools/testing/selftests/kselftest_harness.h
+++ b/tools/testing/selftests/kselftest_harness.h
@@ -1274,6 +1274,10 @@ static int test_harness_run(int argc, char **argv)
 	unsigned int count = 0;
 	unsigned int pass_count = 0;
 
+#ifdef CONFIG_NOMMU
+	ksft_print_msg("harness test doesn't support on NOMMU architecture (no fork(2)).\n");
+	return KSFT_SKIP;
+#endif /* CONFIG_NOMMU */
 	ret = test_harness_argv_check(argc, argv);
 	if (ret != KSFT_PASS)
 		return ret;
diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
index 2cc819006424..4734b5ce613f 100644
--- a/tools/testing/selftests/lib.mk
+++ b/tools/testing/selftests/lib.mk
@@ -97,6 +97,14 @@ TEST_GEN_PROGS := $(patsubst %,$(OUTPUT)/%,$(TEST_GEN_PROGS))
 TEST_GEN_PROGS_EXTENDED := $(patsubst %,$(OUTPUT)/%,$(TEST_GEN_PROGS_EXTENDED))
 TEST_GEN_FILES := $(patsubst %,$(OUTPUT)/%,$(TEST_GEN_FILES))
 
+# detect if users request NOMMU build or not
+# User can set NOMMU to 1 to build/test for NOMMU platforms
+NOMMU ?= 0
+ifeq ($(NOMMU),1)
+CFLAGS += -DCONFIG_NOMMU
+export NOMMU
+endif
+
 all: $(TEST_GEN_PROGS) $(TEST_GEN_PROGS_EXTENDED) $(TEST_GEN_FILES) \
 	$(if $(TEST_GEN_MODS_DIR),gen_mods_dir)
 
-- 
2.43.0

