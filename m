Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DCC24A076
	for <linux-kselftest@vger.kernel.org>; Mon, 27 Jul 2026 04:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785127052; cv=none; b=m3DO4od7e0fijuZRkohhbFOmGzfF8nJUjwDpPl+v2+F5TKNkb3allFZvLyespJbU9rSePtU2pXx6BKyBdzAoT7/hx5e/EATHFFfpKhw/E1GFpVPIj3M197SVS1p/qHXtThcqCUUNEljXMqmT8mE5kuopCYszqr3C9ZCvwWcONn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785127052; c=relaxed/simple;
	bh=0ZczEzbNgwJtAgdsZnZI+NSmWooov4lGamBOGBDh1xY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wc0ExDJ676ywZpgXIK1pulLKSzKORx1bpsL4kfZH3W9MS3PyoFelVcSBDcnuk9fmN7Knva8M0h1prPeoh62j+FP8JLO+8+SebP6hEzkup/CDvRAQTar+cfwqWu1KWQhkZeLjSujj3QzpVqjVxm8GlOR0W16cxe6ZLYyqjA59AMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fCxv9Jlt; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fCxv9Jlt"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3811f512167so2082404a91.3
        for <linux-kselftest@vger.kernel.org>; Sun, 26 Jul 2026 21:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785127050; x=1785731850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y94L/TDRnaooi7e4Q9kVoWGG1TPVjdvJLR2iOWGfF8A=;
        b=fCxv9JltZEdXsKDZl0+jIlCIXvHCVsEg+iBMFKa6OfgX3LrEwZEMUqoXkSyK1BIFEG
         pQ5kG3eFo+kXGrm+hP4xZFz8+5t0MP5fJ4CQJCUFlKOyJeOs18xhDy/guCNxDNNnlcdc
         x8rwRQX2FMYe1RkLtH5NqrlmUFLP7K3Lp44OZhnYJ/R+uxBygUEZ6sdYtXc+vN+EDnpL
         qK2xujUZGir7k+uD+aV2dtVHr9gKRR3+gd+vTudS4ieM5yeooDpejoqRDQkDubWM02aU
         Eg07fmgI43MiDywmQfdMui7O0aYs54b9IfEBDMoS5jZUFH5IbNx3EsEqR6bLB4PM0o1r
         noUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785127050; x=1785731850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y94L/TDRnaooi7e4Q9kVoWGG1TPVjdvJLR2iOWGfF8A=;
        b=IcU+bEJi2USftB+OgElRUqKbY+vHl2eTji3RflACw4Ullx5tH3S0MG5HeaW/7LM7KE
         nxrJ+jDplM32rzJeiDNa5npiel2BHwzQZ+wfnXaNLCmbRb41TWXj3ZGcHbH9Gt6wTOtO
         rd5XKI3FosxavT/GB+O0zrMRc74x1uBpw3P7YOK2N129JBpjJvMImzlz6w5xuE834TYL
         xBlMBsq4xk0swwvOrwAljfg0sjfrqexRb53QBAuwSPbypKoK7YfG3U7axlDND0+rQKLB
         es7ky2ec3vKJXALryqvkrC/5lt2bRoioU3wOgNakEZH5phtMHYrcQJJq3fkNl/+PVVIM
         ai0g==
X-Gm-Message-State: AOJu0YyLgpfRnSEoZD+SHGOcnrWhSD3M0N8di1UHxVuxE6gGPiD0s2g6
	kF8STfdiBlwYf5ClSJcxPoj2T52VZ2ela/GiWVQqBq9aIQYMCIL1pH7eAZS7bA==
X-Gm-Gg: AR+sD12supoGZVZ02hTpjm6P3OmcOa6WpZI6DRUP5zGQeCCQt2iuJCdQ2Cat+Ia8ne2
	wulSL7i3zGZ/P4ISV+zWnEjqTy+nZjgbEi+Ghk5aEtzNhKTHxewnn2nC81/7uFU0FFRffDQ+SLA
	SM/xwSCZU03Yt/usjcSENggUTtcr83KaZklLRMs8MFnKyHjy0n+RpjexB0jdqVXaXgKpG5q+pqp
	1gRcm8vp4ssUB29jE71e3xWZNUMM5EiEQ4pMpWIA0cNOmJsuuY5zy5PFRZNhuZSbVxM39etzq5B
	9PC5/FRU2K41RFvG+VMow2Xkb/0JrN/r4v3MIrnuo8NAllKcWHW2WP2RvfY0U5e5rMHAmdWVP0v
	ZgCn6t2z9CPQSOKKc5IG39sYvC94H2MI8VPsu4LINgNgTCYM3lQ8FR/mn4+JD41fAnRThPLG2nR
	MlyTB31dDdzU95wQ==
X-Received: by 2002:a17:90b:2ecd:b0:37f:9ce3:ca95 with SMTP id 98e67ed59e1d1-38f296563b8mr6287355a91.30.1785127050175;
        Sun, 26 Jul 2026 21:37:30 -0700 (PDT)
Received: from marceloPC ([2804:1b3:a8c2:99cf:6381:2414:ebe3:a179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc4164ddsm26249985eec.9.2026.07.26.21.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 21:37:29 -0700 (PDT)
From: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>
X-Google-Original-From: Marcelo Mendes Spessoto Junior <marcelospe@proton.me>
To: netdev@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org,
	Marcelo Mendes Spessoto Junior <marcelospe@proton.me>
Subject: [PATCH 4/4] selftests: net: adopt harness for flow label mgr
Date: Mon, 27 Jul 2026 01:25:10 -0300
Message-ID: <20260727043516.93101-5-marcelospe@proton.me>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260727043516.93101-1-marcelospe@proton.me>
References: <20260727043516.93101-1-marcelospe@proton.me>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kselftest_harness.h file contains modern helpers to build tests
for kselftest. Dropping current test helpers for ipv6_flowlabel_mgr
to use harness helps tests to be more legible and conform to the
structure of the latest tests. It also enforces TAP standard.

Another change made to the structure of ipv6_flowlabel_mgr test file
was the removal of parse_opts. The supported opts were already not
used on TEST_GEN_PROGS and are not impactful for development. Opt (-l)
skips long tests that are not time consuming at all, while the TH_LOG
and code comments can cover the information obtainable from (-v).

Signed-off-by: Marcelo Mendes Spessoto Junior <marcelospe@proton.me>
---
 .../selftests/net/ipv6_flowlabel_mgr.c        | 397 +++++++++++-------
 1 file changed, 234 insertions(+), 163 deletions(-)

diff --git a/tools/testing/selftests/net/ipv6_flowlabel_mgr.c b/tools/testing/selftests/net/ipv6_flowlabel_mgr.c
index da253dff2cfd..9aa5c8146f17 100644
--- a/tools/testing/selftests/net/ipv6_flowlabel_mgr.c
+++ b/tools/testing/selftests/net/ipv6_flowlabel_mgr.c
@@ -20,6 +20,7 @@
 #include <sys/types.h>
 #include <sys/wait.h>
 #include <unistd.h>
+#include "kselftest_harness.h"
 
 /* uapi/glibc weirdness may leave this undefined */
 #ifndef IPV6_FLOWLABEL_MGR
@@ -39,23 +40,6 @@
 		.sin6_port	= htons(8888),				\
 	}
 
-#define explain(x)							\
-	do { if (cfg_verbose) fprintf(stderr, "       " x "\n"); } while (0)
-
-#define __expect(x)							\
-	do {								\
-		if (!(x))						\
-			fprintf(stderr, "[OK]   " #x "\n");		\
-		else							\
-			error(1, 0, "[ERR]  " #x " (line %d)", __LINE__); \
-	} while (0)
-
-#define expect_pass(x)	__expect(x)
-#define expect_fail(x)	__expect(!(x))
-
-static bool cfg_long_running;
-static bool cfg_verbose;
-
 static int flowlabel_get(int fd, uint32_t label, uint8_t share, uint16_t flags)
 {
 	struct in6_flowlabel_req req = {
@@ -141,6 +125,10 @@ static void tcp_connect(int listener, uint32_t flowlabel, int *client, int *acce
 
 static void set_flowlabel_consistency(bool enable)
 {
+	/* flowlabel_consistency must be disable to use the IPV6_FL_F_REFLECT
+	 * flag. This helper function is required for setting up and tearing
+	 * down test cases for this flag.
+	 */
 	int fd;
 
 	fd = open("/proc/sys/net/ipv6/flowlabel_consistency", O_WRONLY);
@@ -152,187 +140,270 @@ static void set_flowlabel_consistency(bool enable)
 		error(1, errno, "close flowlabel_consistency");
 }
 
-static void run_tests(int fd)
+TEST(cannot_get_non_existent_label)
+{
+	int fd, err;
+
+	fd = socket(PF_INET6, SOCK_DGRAM, 0);
+	ASSERT_GE(fd, 0) TH_LOG("socket failed");
+
+	err = flowlabel_get(fd, 1, IPV6_FL_S_ANY, 0);
+	ASSERT_TRUE(err) TH_LOG("expected get of a non-existent label to fail");
+
+	ASSERT_EQ(0, close(fd));
+}
+
+TEST(cannot_put_non_existent_label)
 {
-	int wstatus;
+	int fd, err;
+
+	fd = socket(PF_INET6, SOCK_DGRAM, 0);
+	ASSERT_GE(fd, 0) TH_LOG("socket failed");
+
+	err = flowlabel_put(fd, 1);
+	ASSERT_TRUE(err) TH_LOG("expected put of a non-existent label to fail");
+
+	ASSERT_EQ(0, close(fd));
+}
+
+TEST(cannot_create_label_greater_than_20_bits)
+{
+	int fd, err;
+
+	fd = socket(PF_INET6, SOCK_DGRAM, 0);
+	ASSERT_GE(fd, 0) TH_LOG("socket failed");
+
+	err = flowlabel_get(fd, 0x1FFFFF, IPV6_FL_S_ANY, IPV6_FL_F_CREATE);
+	ASSERT_TRUE(err) TH_LOG("expected label > 20 bits to be rejected");
+
+	ASSERT_EQ(0, close(fd));
+}
+
+TEST(can_create_and_get_and_put_labels)
+{
+	int fd, err;
+
+	fd = socket(PF_INET6, SOCK_DGRAM, 0);
+	ASSERT_GE(fd, 0) TH_LOG("socket failed");
+
+	err = flowlabel_get(fd, 1, IPV6_FL_S_ANY, IPV6_FL_F_CREATE);
+	ASSERT_TRUE(!err) TH_LOG("failed to create label (FL_F_CREATE)");
+
+	err = flowlabel_get(fd, 1, IPV6_FL_S_ANY, 0);
+	ASSERT_TRUE(!err) TH_LOG("failed to get the label without FL_F_CREATE");
+
+	err = flowlabel_get(fd, 1, IPV6_FL_S_ANY, IPV6_FL_F_CREATE);
+	ASSERT_TRUE(!err) TH_LOG("failed to get it again with create flag set, too");
+
+	err = flowlabel_get(fd, 1, IPV6_FL_S_ANY, IPV6_FL_F_CREATE | IPV6_FL_F_EXCL);
+	ASSERT_TRUE(err) TH_LOG("expected FL_F_EXCL to reject an already-existing label");
+
+	err = flowlabel_put(fd, 1);
+	ASSERT_TRUE(!err) TH_LOG("failed to put first reference");
+	err = flowlabel_put(fd, 1);
+	ASSERT_TRUE(!err) TH_LOG("failed to put second reference");
+	err = flowlabel_put(fd, 1);
+	ASSERT_TRUE(!err) TH_LOG("failed to put third reference");
+	err = flowlabel_put(fd, 1);
+	ASSERT_TRUE(err) TH_LOG("expected fourth put to fail, no references left");
+
+	ASSERT_EQ(0, close(fd));
+}
+
+TEST(exclusive_label_share)
+{
+	int fd, err;
+
+	fd = socket(PF_INET6, SOCK_DGRAM, 0);
+	ASSERT_GE(fd, 0) TH_LOG("socket failed");
+
+	err = flowlabel_get(fd, 2, IPV6_FL_S_EXCL, IPV6_FL_F_CREATE);
+	ASSERT_TRUE(!err) TH_LOG("failed to create a new exclusive label (FL_S_EXCL)");
+
+	err = flowlabel_get(fd, 2, IPV6_FL_S_ANY, IPV6_FL_F_CREATE);
+	ASSERT_TRUE(err) TH_LOG("expected reuse in non-exclusive mode to fail");
+
+	err = flowlabel_get(fd, 2, IPV6_FL_S_EXCL, IPV6_FL_F_CREATE);
+	ASSERT_TRUE(err) TH_LOG("expected reuse in exclusive mode to fail too");
+
+	err = flowlabel_put(fd, 2);
+	ASSERT_TRUE(!err) TH_LOG("failed to put the exclusive label");
+
+	err = flowlabel_get(fd, 2, IPV6_FL_S_ANY, IPV6_FL_F_CREATE);
+	ASSERT_TRUE(err) TH_LOG("expected reuse to fail, due to linger");
+
+	sleep(FL_MIN_LINGER * 2 + 1);
+
+	err = flowlabel_get(fd, 2, IPV6_FL_S_ANY, IPV6_FL_F_CREATE);
+	ASSERT_TRUE(!err) TH_LOG("expected reuse to succeed after linger");
+
+	ASSERT_EQ(0, close(fd));
+}
+
+TEST(user_private_label_share)
+{
+	int fd, err, wstatus;
 	pid_t pid;
 
-	explain("cannot get non-existent label");
-	expect_fail(flowlabel_get(fd, 1, IPV6_FL_S_ANY, 0));
-
-	explain("cannot put non-existent label");
-	expect_fail(flowlabel_put(fd, 1));
-
-	explain("cannot create label greater than 20 bits");
-	expect_fail(flowlabel_get(fd, 0x1FFFFF, IPV6_FL_S_ANY,
-				  IPV6_FL_F_CREATE));
-
-	explain("create a new label (FL_F_CREATE)");
-	expect_pass(flowlabel_get(fd, 1, IPV6_FL_S_ANY, IPV6_FL_F_CREATE));
-	explain("can get the label (without FL_F_CREATE)");
-	expect_pass(flowlabel_get(fd, 1, IPV6_FL_S_ANY, 0));
-	explain("can get it again with create flag set, too");
-	expect_pass(flowlabel_get(fd, 1, IPV6_FL_S_ANY, IPV6_FL_F_CREATE));
-	explain("cannot get it again with the exclusive (FL_FL_EXCL) flag");
-	expect_fail(flowlabel_get(fd, 1, IPV6_FL_S_ANY,
-					 IPV6_FL_F_CREATE | IPV6_FL_F_EXCL));
-	explain("can now put exactly three references");
-	expect_pass(flowlabel_put(fd, 1));
-	expect_pass(flowlabel_put(fd, 1));
-	expect_pass(flowlabel_put(fd, 1));
-	expect_fail(flowlabel_put(fd, 1));
-
-	explain("create a new exclusive label (FL_S_EXCL)");
-	expect_pass(flowlabel_get(fd, 2, IPV6_FL_S_EXCL, IPV6_FL_F_CREATE));
-	explain("cannot get it again in non-exclusive mode");
-	expect_fail(flowlabel_get(fd, 2, IPV6_FL_S_ANY,  IPV6_FL_F_CREATE));
-	explain("cannot get it again in exclusive mode either");
-	expect_fail(flowlabel_get(fd, 2, IPV6_FL_S_EXCL, IPV6_FL_F_CREATE));
-	expect_pass(flowlabel_put(fd, 2));
-
-	if (cfg_long_running) {
-		explain("cannot reuse the label, due to linger");
-		expect_fail(flowlabel_get(fd, 2, IPV6_FL_S_ANY,
-					  IPV6_FL_F_CREATE));
-		explain("after sleep, can reuse");
-		sleep(FL_MIN_LINGER * 2 + 1);
-		expect_pass(flowlabel_get(fd, 2, IPV6_FL_S_ANY,
-					  IPV6_FL_F_CREATE));
-	}
+	fd = socket(PF_INET6, SOCK_DGRAM, 0);
+	ASSERT_GE(fd, 0) TH_LOG("socket failed");
+
+	err = flowlabel_get(fd, 3, IPV6_FL_S_USER, IPV6_FL_F_CREATE);
+	ASSERT_TRUE(!err) TH_LOG("failed to create a new user-private label (FL_S_USER)");
+
+	err = flowlabel_get(fd, 3, IPV6_FL_S_ANY, 0);
+	ASSERT_TRUE(err) TH_LOG("expected get in non-exclusive mode to fail");
+
+	err = flowlabel_get(fd, 3, IPV6_FL_S_EXCL, 0);
+	ASSERT_TRUE(err) TH_LOG("expected get in exclusive mode to fail");
+
+	err = flowlabel_get(fd, 3, IPV6_FL_S_USER, 0);
+	ASSERT_TRUE(!err) TH_LOG("failed to get it again in user mode");
 
-	explain("create a new user-private label (FL_S_USER)");
-	expect_pass(flowlabel_get(fd, 3, IPV6_FL_S_USER, IPV6_FL_F_CREATE));
-	explain("cannot get it again in non-exclusive mode");
-	expect_fail(flowlabel_get(fd, 3, IPV6_FL_S_ANY, 0));
-	explain("cannot get it again in exclusive mode");
-	expect_fail(flowlabel_get(fd, 3, IPV6_FL_S_EXCL, 0));
-	explain("can get it again in user mode");
-	expect_pass(flowlabel_get(fd, 3, IPV6_FL_S_USER, 0));
-	explain("child process can get it too, but not after setuid(nobody)");
 	pid = fork();
-	if (pid == -1)
-		error(1, errno, "fork");
+	ASSERT_NE(-1, pid) TH_LOG("fork failed");
 	if (!pid) {
-		expect_pass(flowlabel_get(fd, 3, IPV6_FL_S_USER, 0));
-		if (setuid(USHRT_MAX))
+		if (flowlabel_get(fd, 3, IPV6_FL_S_USER, 0))
+			exit(1);
+		if (setuid(USHRT_MAX)) {
 			fprintf(stderr, "[INFO] skip setuid child test\n");
-		else
-			expect_fail(flowlabel_get(fd, 3, IPV6_FL_S_USER, 0));
+			exit(0);
+		}
+		if (!flowlabel_get(fd, 3, IPV6_FL_S_USER, 0))
+			exit(1);
 		exit(0);
 	}
-	if (wait(&wstatus) == -1)
-		error(1, errno, "wait");
-	if (!WIFEXITED(wstatus) || WEXITSTATUS(wstatus) != 0)
-		error(1, errno, "wait: unexpected child result");
-
-	explain("create a new process-private label (FL_S_PROCESS)");
-	expect_pass(flowlabel_get(fd, 4, IPV6_FL_S_PROCESS, IPV6_FL_F_CREATE));
-	explain("can get it again");
-	expect_pass(flowlabel_get(fd, 4, IPV6_FL_S_PROCESS, 0));
-	explain("child process cannot can get it");
+	ASSERT_EQ(pid, wait(&wstatus)) TH_LOG("wait failed");
+	ASSERT_TRUE(WIFEXITED(wstatus)) TH_LOG("child did not exit normally");
+	ASSERT_EQ(0, WEXITSTATUS(wstatus)) TH_LOG("child reported unexpected result");
+
+	ASSERT_EQ(0, close(fd));
+}
+
+TEST(process_private_label_share)
+{
+	int fd, err, wstatus;
+	pid_t pid;
+
+	fd = socket(PF_INET6, SOCK_DGRAM, 0);
+	ASSERT_GE(fd, 0) TH_LOG("socket failed");
+
+	err = flowlabel_get(fd, 4, IPV6_FL_S_PROCESS, IPV6_FL_F_CREATE);
+	ASSERT_TRUE(!err) TH_LOG("failed to create a new process-private label (FL_S_PROCESS)");
+
+	err = flowlabel_get(fd, 4, IPV6_FL_S_PROCESS, 0);
+	ASSERT_TRUE(!err) TH_LOG("failed to get it again");
+
 	pid = fork();
-	if (pid == -1)
-		error(1, errno, "fork");
+	ASSERT_NE(-1, pid) TH_LOG("fork failed");
 	if (!pid) {
-		expect_fail(flowlabel_get(fd, 4, IPV6_FL_S_PROCESS, 0));
+		if (!flowlabel_get(fd, 4, IPV6_FL_S_PROCESS, 0))
+			exit(1);
 		exit(0);
 	}
-	if (wait(&wstatus) == -1)
-		error(1, errno, "wait");
-	if (!WIFEXITED(wstatus) || WEXITSTATUS(wstatus) != 0)
-		error(1, errno, "wait: unexpected child result");
-
-	if (cfg_long_running) {
-		explain("create a new label with FL_MIN_LINGER linger time");
-		expect_pass(flowlabel_get(fd, 5, IPV6_FL_S_EXCL, IPV6_FL_F_CREATE));
-		explain("renew the label to increase its linger time and put it");
-		expect_pass(flowlabel_renew(fd, 5, 2 * (FL_MIN_LINGER * 2 + 1)));
-		expect_pass(flowlabel_put(fd, 5));
-		sleep(FL_MIN_LINGER * 2 + 1);
-		explain("The label cannot be created because the new linger time is not over yet");
-		expect_fail(flowlabel_get(fd, 5, IPV6_FL_S_ANY, IPV6_FL_F_CREATE));
-	}
+	ASSERT_EQ(pid, wait(&wstatus)) TH_LOG("wait failed");
+	ASSERT_TRUE(WIFEXITED(wstatus)) TH_LOG("child did not exit normally");
+	ASSERT_EQ(0, WEXITSTATUS(wstatus)) TH_LOG("child reported unexpected result");
+
+	ASSERT_EQ(0, close(fd));
+}
+
+TEST(renew_label_linger)
+{
+	/* After a label with EXCL share is put and lingered, it must be
+	 * possible to create a new one. Check if RENEW action extends
+	 * the linger period of put label, blocking creation after previous
+	 * linger time.
+	 */
+	int fd, err;
+
+	fd = socket(PF_INET6, SOCK_DGRAM, 0);
+	ASSERT_GE(fd, 0) TH_LOG("socket failed");
+
+	err = flowlabel_get(fd, 5, IPV6_FL_S_EXCL, IPV6_FL_F_CREATE);
+	ASSERT_TRUE(!err) TH_LOG("failed to create a new label with FL_MIN_LINGER linger time");
+
+	err = flowlabel_renew(fd, 5, 2 * (FL_MIN_LINGER * 2 + 1));
+	ASSERT_TRUE(!err) TH_LOG("failed to renew the label to increase its linger time");
+
+	err = flowlabel_put(fd, 5);
+	ASSERT_TRUE(!err) TH_LOG("failed to put the label");
+
+	sleep(FL_MIN_LINGER * 2 + 1);
+
+	err = flowlabel_get(fd, 5, IPV6_FL_S_ANY, IPV6_FL_F_CREATE);
+	ASSERT_TRUE(err) TH_LOG("expected reuse to fail, new linger time not over yet");
+
+	ASSERT_EQ(0, close(fd));
+}
 
-	explain("Prepare TCP SYN for REMOTE flag validation");
-	int remote_listener = tcp_listen();
-	int remote_cfd, remote_afd;
-	tcp_connect(remote_listener, 6, &remote_cfd, &remote_afd);
+TEST(remote_flag)
+{
+	/* The REMOTE flag, used for getsockopt, is expected to retrieve the
+	 * label from the latest received header.
+	 */
 	struct in6_flowlabel_req freq = {
 		.flr_action = IPV6_FL_A_GET,
 		.flr_flags = IPV6_FL_F_REMOTE,
 	};
 	socklen_t freq_len = sizeof(freq);
-	explain("Query for label sent by client with IPV6_FL_F_REMOTE");
-	expect_pass(getsockopt(remote_afd, SOL_IPV6, IPV6_FLOWLABEL_MGR, &freq, &freq_len));
-	expect_pass(ntohl(freq.flr_label) != 6);
-	close(remote_afd);
-	close(remote_cfd);
-	close(remote_listener);
-
-	explain("Prepare TCP SYN for REFLECT flag validation");
-	set_flowlabel_consistency(false);
-	int reflect_listener = tcp_listen();
+	int listener, cfd, afd, err;
+
+	listener = tcp_listen();
+	tcp_connect(listener, 6, &cfd, &afd);
+
+	err = getsockopt(afd, SOL_IPV6, IPV6_FLOWLABEL_MGR, &freq, &freq_len);
+	ASSERT_TRUE(!err) TH_LOG("getsockopt with IPV6_FL_F_REMOTE failed");
+	ASSERT_EQ(6, ntohl(freq.flr_label)) TH_LOG("unexpected remote flow label");
+
+	ASSERT_EQ(0, close(afd));
+	ASSERT_EQ(0, close(cfd));
+	ASSERT_EQ(0, close(listener));
+}
+
+TEST(reflect_flag)
+{
+	/* The REFLECT flag acts as a trigger to the REPFLOW bit. When REPFLOW
+	 * is triggered for a socket, it adopts the label received from the
+	 * connected socket.
+	 */
 	struct in6_flowlabel_req reflect_on = {
 		.flr_action = IPV6_FL_A_GET,
 		.flr_flags = IPV6_FL_F_REFLECT,
 	};
-	explain("Enable REFLECT on the listener before the client connects");
-	expect_pass(setsockopt(reflect_listener, SOL_IPV6, IPV6_FLOWLABEL_MGR, &reflect_on, sizeof(reflect_on)));
-	int reflect_cfd, reflect_afd;
-	tcp_connect(reflect_listener, 7, &reflect_cfd, &reflect_afd);
 	struct in6_flowlabel_req reflect_query = {
 		.flr_action = IPV6_FL_A_GET,
 	};
-	socklen_t reflect_query_len = sizeof(reflect_query);
-	explain("Query the accepted socket's outgoing label, should be reflected");
-	expect_pass(getsockopt(reflect_afd, SOL_IPV6, IPV6_FLOWLABEL_MGR, &reflect_query, &reflect_query_len));
-	expect_pass(ntohl(reflect_query.flr_label) != 7);
 	struct in6_flowlabel_req reflect_off = {
 		.flr_action = IPV6_FL_A_PUT,
 		.flr_flags = IPV6_FL_F_REFLECT,
 	};
-	explain("PUT+REFLECT disables reflection on the accepted socket");
-	expect_pass(setsockopt(reflect_afd, SOL_IPV6, IPV6_FLOWLABEL_MGR, &reflect_off, sizeof(reflect_off)));
-	explain("cannot disable reflection twice");
-	expect_fail(setsockopt(reflect_afd, SOL_IPV6, IPV6_FLOWLABEL_MGR, &reflect_off, sizeof(reflect_off)));
-	set_flowlabel_consistency(true);
-	close(reflect_afd);
-	close(reflect_cfd);
-	close(reflect_listener);
-}
+	socklen_t reflect_query_len = sizeof(reflect_query);
+	int listener, cfd, afd, err;
 
-static void parse_opts(int argc, char **argv)
-{
-	int c;
-
-	while ((c = getopt(argc, argv, "lv")) != -1) {
-		switch (c) {
-		case 'l':
-			cfg_long_running = true;
-			break;
-		case 'v':
-			cfg_verbose = true;
-			break;
-		default:
-			error(1, 0, "%s: parse error", argv[0]);
-		}
-	}
-}
+	set_flowlabel_consistency(false);
 
-int main(int argc, char **argv)
-{
-	int fd;
+	listener = tcp_listen();
+	err = setsockopt(listener, SOL_IPV6, IPV6_FLOWLABEL_MGR, &reflect_on, sizeof(reflect_on));
+	ASSERT_TRUE(!err) TH_LOG("failed to enable REFLECT on the listener");
 
-	parse_opts(argc, argv);
+	tcp_connect(listener, 7, &cfd, &afd);
 
-	fd = socket(PF_INET6, SOCK_DGRAM, 0);
-	if (fd == -1)
-		error(1, errno, "socket");
+	err = getsockopt(afd, SOL_IPV6, IPV6_FLOWLABEL_MGR, &reflect_query, &reflect_query_len);
+	ASSERT_TRUE(!err) TH_LOG("failed to query the accepted socket's outgoing label");
+	ASSERT_EQ(7, ntohl(reflect_query.flr_label)) TH_LOG("accepted socket did not reflect client's label");
 
-	run_tests(fd);
+	err = setsockopt(afd, SOL_IPV6, IPV6_FLOWLABEL_MGR, &reflect_off, sizeof(reflect_off));
+	ASSERT_TRUE(!err) TH_LOG("failed to disable REFLECT on the accepted socket");
 
-	if (close(fd))
-		error(1, errno, "close");
+	err = setsockopt(afd, SOL_IPV6, IPV6_FLOWLABEL_MGR, &reflect_off, sizeof(reflect_off));
+	ASSERT_TRUE(err) TH_LOG("expected disabling REFLECT twice to fail");
 
-	return 0;
+	set_flowlabel_consistency(true);
+
+	ASSERT_EQ(0, close(afd));
+	ASSERT_EQ(0, close(cfd));
+	ASSERT_EQ(0, close(listener));
 }
+
+TEST_HARNESS_MAIN
-- 
2.55.0

