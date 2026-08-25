Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E3B307AC7
	for <linux-kselftest@vger.kernel.org>; Tue, 25 Aug 2026 01:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787623197; cv=none; b=mj0aRIV8CqNO2ziKyOzHdRp4yF/zA58bKzeru4qBaPm2Zcc2TOGLOU54miNCybt87arQu7BKIEHyd2k+8lqxYjGwLJP2HA1H1stKZfUgaPoGm/0efB1kE0RA/zIJXWZ/UvTt3SsJWvNVzvWGdQTgM1GzmgT4I5cLW4nxpYtel0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787623197; c=relaxed/simple;
	bh=4vlzH09iGIOfsleQo7FY4Tmg/lfAVoegVLohMXSdxkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cmrAuwSSH+KiAMz93zJ25+9H9H/btxYFT2zVxJOqbHh8SiQStmCSd6Wp//z9L4GqKtLQNGOU5JddlRxM8mF1UhYyYdyRplVaazengL3D7KN5spE9/7h2d+b/L2AxSgipFrqXzfQgCWPvDpAKjIq5m9ZuJ5kK7GiUquYmy5/1sw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jGQGU7sN; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jGQGU7sN"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c9eefcf9175so4274120a12.3
        for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 18:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787623195; x=1788227995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rXZ6arscy3bI1yYYXMDFd7SBEHMelfRFPGbyYXY2R+o=;
        b=jGQGU7sNGmsyw8sP74gJdllyJT0B1zUv8MmYhrwsZfHTLrqZlmk97WCG7h8gnO+3Ox
         Y0PGG55PPFKO9lwL6AWH85BRmKW1N6wo2//RaDuhghGxSIm0PHMHyZVHDKhHIGk3zF06
         sJHCsrZUblMx78lFVBN7vYPlbLubHCrRKbk90Qygp+d9i7Zifv3Lh0jFIA5OBCCXfwxK
         JeiEplmqjyKuBcqtQ4FkGXePjpsWl1m0f2mtnbNA1Y/U5YWYWCq9WqF42K8qjhuxHjHU
         4G5v/zTTl84aYmRNno2BI9JvZaJtlcD9S77+PQ2eGSfQCXtNHdgcb24MUhN3T2TDP91H
         H3Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787623195; x=1788227995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rXZ6arscy3bI1yYYXMDFd7SBEHMelfRFPGbyYXY2R+o=;
        b=dqCmRwWV4zLJUu2wmphXiM4u2xZZEY+wMqYB8R59mgNEtdH5QBQC4xazMjzjbjGOfP
         VFDFhlAIlzD1pa3ygBFFzi5zEHpixclxxfXF/WK/S0yKwsMlFs+38l3RheJxwkXPXh1a
         ss2tJchoCAPQHzEXYtyRp7XrwnL+fNaxggWEC5ZLOxTab/zy17tRjz8Y/loBau3jExeC
         Vpl+5BjlC4nn03SIBGoeSV8zfIS/6s3GOQnRP0mkuUrYonQB0Pn+yMeAAt/xBOzUupv+
         2dU79ZBEvx2PKg/YJyvktDa2/SOVZ9x3D32veRZdOozLQqxsnrZwduO44XAi8F24png9
         FeXg==
X-Forwarded-Encrypted: i=1; AHgh+Rqs/YcXzMrvNGlQnqCsFvlme05tWlawDudJTr56cay8YFI76TPbWv+Cdmv61ObpPN7HbV4Iud0MyCa9VO30wg8=@vger.kernel.org
X-Gm-Message-State: AFuF++kALNlxJ2gXl77MWdtZKG7rgpgtVtMSywfFQyoRoB4eCvYjMMBf
	rWBZZjcPCg+jc2C3OlgeTzRsLSd2F9X0noG+TzvrgvYoCgTuWKZgGb7w
X-Gm-Gg: AR+sD11phMW9qsaw96Cxm5yRXeVwWxubwCZZb66WzCQswoc9h6a83bZWQ4nqanHSCGj
	hHW1vAlc50C1dijRwgzOZuPKxWP2zUuVLKRlYVskmjiHEfOHAgsBAYIq/hFvSarSm0ZwzPCsbGQ
	i671uuJ61ZuMAI/pDPK2BL9vxZJK04/H6Cku963to/oWklCO3kYlOQHk82d7OVsDhIRzYebLJuC
	cNQ4dYyc4qBdSRoNzyzc4um7XjEdxwPp9oMA9Tyh9i2IGM+mmXyJPrPQodIUgoMjI0ZbIAbxwOW
	WQzGhGkRtgRTeNKqPaXPnvYYzj6bgCjfEKT0KOl+04wLhau27V4Cg8COH4xXEes2fcXjCQDZcMs
	S5eh3/BV/cY2wLin8hE4c/UoakRiN/xMVVdL+TkBgku+Q1XVInWBJkvalUOcIhRDxAmBFmsMHxF
	zIEJ2NuLzfA/HJ6Ylfu/MfgAYWPb/GJuhgY6P5Ob0UwPxB3gGup0kkBPuMcctUgqIWmkGPGHqrh
	Xbv1bjjYpMkmLNiOjuxlWX4tZ9anWcDOnU2e0ycpDUku9nwaydB/Hy/jqggRnYSJLknBMoIMyXk
X-Received: by 2002:a17:90b:56c8:b0:38a:c3f:3b87 with SMTP id 98e67ed59e1d1-3964652108bmr6382091a91.12.1787623195352;
        Mon, 24 Aug 2026 18:59:55 -0700 (PDT)
Received: from ikb-h07-29-noble.in.iijlab.net ([202.214.97.5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645b08ca0sm1725042a91.2.2026.08.24.18.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 18:59:54 -0700 (PDT)
Received: by ikb-h07-29-noble.in.iijlab.net (Postfix, from userid 1010)
	id A42B915C677C; Tue, 25 Aug 2026 10:59:53 +0900 (JST)
From: Hajime Tazaki <thehajime@gmail.com>
To: linux-mm@kvack.org,
	liam@infradead.org,
	rbm@suse.com,
	akpm@linux-foundation.org,
	luto@amacapital.net,
	brendan.jackman@linux.dev,
	david@kernel.org,
	liuhangbin@gmail.com,
	corbet@lwn.net,
	kees@kernel.org,
	ljs@kernel.org,
	broonie@kernel.org,
	mhocko@suse.com,
	rppt@kernel.org,
	shuah@kernel.org,
	surenb@google.com,
	vbabka@kernel.org,
	wad@chromium.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-um@lists.infradead.org
Cc: geert@linux-m68k.org,
	daniel@thingy.jp,
	Hajime Tazaki <thehajime@gmail.com>
Subject: [PATCH v2 1/2] selftests: run tests on nommu architecture
Date: Tue, 25 Aug 2026 10:59:44 +0900
Message-ID: <20260825015945.141739-2-thehajime@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825015945.141739-1-thehajime@gmail.com>
References: <20260825015945.141739-1-thehajime@gmail.com>
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
- kselftest_harness.h: skip the tests if the file is include when
  executing on NOMMU platform, as there is no fork(2) syscall.
- replace "cd -" use as it is not available a shell supported on nommu
  (e.g., busybox hush), use cd "$OLDDIR" instead.
- describe the difference of nommu tests in the document.

So command line to build/execute tests for nommu should be like below:

 $ make ARCH=um NOMMU=1 O=build kselftest-all TARGETS=mm/nommu
 $ make ARCH=um NOMMU=1 O=build kselftest-install TARGETS=mm/nommu
 $ NOMMU=1 ./build/kselftest/kselftest_install/run_kselftest.sh -p \
   -c mm/nommu

Cc: Shuah Khan <shuah@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Kees Cook <kees@kernel.org>
Cc: Andy Lutomirski <luto@amacapital.net>
Cc: Will Drewry <wad@chromium.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Brendan Jackman <brendan.jackman@linux.dev>
Cc: Hangbin Liu <liuhangbin@gmail.com>
Cc: "Ricardo B. Marliere" <rbm@suse.com>
Cc: linux-kselftest@vger.kernel.org
Cc: linux-um@lists.infradead.org
Cc: linux-mm@kvack.org
Cc: linux-doc@vger.kernel.org
Closes: https://sashiko.dev/#/patchset/20260813063401.1786548-1-thehajime%40gmail.com
Signed-off-by: Hajime Tazaki <thehajime@gmail.com>

--

rfc => v2
- reformat ktap header, reported by Sashiko review

rfc: https://lore.kernel.org/linux-mm/20260813063401.1786548-1-thehajime@gmail.com/
---
 Documentation/dev-tools/kselftest.rst       | 14 ++++++++++++++
 tools/testing/selftests/kselftest/runner.sh |  9 +++++++--
 tools/testing/selftests/kselftest_harness.h |  4 ++++
 tools/testing/selftests/lib.mk              |  8 ++++++++
 4 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/Documentation/dev-tools/kselftest.rst b/Documentation/dev-tools/kselftest.rst
index 64c0ec7428a2..a65f3ebc5906 100644
--- a/Documentation/dev-tools/kselftest.rst
+++ b/Documentation/dev-tools/kselftest.rst
@@ -230,6 +230,20 @@ section::
 
 .. _tar's auto-compress: https://www.gnu.org/software/tar/manual/html_node/gzip.html#auto_002dcompress
 
+Build and test on nommu target
+==============================
+
+If you (cross-)build kselftests for nommu targets, or run tests on nommu targets, use
+``NOMMU=1`` as a make variable/environment setting to tell build system to do the additional
+checks.  These nommu targets may differ in several ways, such as not supporting fork(2) or
+using musl or another libc.  Set this variable to apply the necessary build and test adjustments.
+
+::
+
+  $ make ARCH=um NOMMU=1 O=build kselftest-all TARGETS=mm/nommu  # <= build-only
+  $ make ARCH=um NOMMU=1 O=build kselftest-install TARGETS=mm/nommu
+  $ NOMMU=1 ./build/kselftest/kselftest_install/run_kselftest.sh -p -c mm/nommu
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
index 261e4df94d9d..0d05946a5e7a 100644
--- a/tools/testing/selftests/kselftest_harness.h
+++ b/tools/testing/selftests/kselftest_harness.h
@@ -1274,6 +1274,10 @@ static int test_harness_run(int argc, char **argv)
 	unsigned int count = 0;
 	unsigned int pass_count = 0;
 
+#ifdef CONFIG_NOMMU
+	ksft_print_header();
+	ksft_exit_skip("kselftest harness requires fork(2), unavailable on NOMMU\n");
+#endif /* CONFIG_NOMMU */
 	ret = test_harness_argv_check(argc, argv);
 	if (ret != KSFT_PASS)
 		return ret;
diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
index f02cc8a2e4ae..fdb895967768 100644
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

