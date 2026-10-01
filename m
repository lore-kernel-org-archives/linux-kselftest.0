Received: from mail-oi2-f42.google.com (mail-oi2-f42.google.com [74.125.231.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA32A2580F2
	for <linux-kselftest@vger.kernel.org>; Thu,  1 Oct 2026 12:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790857332; cv=none; b=Al3AyNBkre3eRPvtSCK/GU8fhz4JF637l9bZak6yUWxy050uOI+sl6aiu2AS7vctv0Xsb7zsitbm2foOepjSiFsawnrDLQ79K/tpPhjBHxBqBN3jqWPG42cN7sGE6wnQaxNkhoMvm2byNnQCoQFsKNmv++giY4QIFOnLt8sINWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790857332; c=relaxed/simple;
	bh=49gUjB07jzcUs0SASiEA4LUZgFq8s0w8m6vCZ7qJ7mU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=V4jU1gVPI+wbrjwQGidIcoP+1B4BKZ4MleKmJAzbkzUmNh2nUM57HbgahMG/ygAdGiT0CcaOhCf6WqYTrClXVsV2HBK6TDUMEtFkm7oYsmaoa7x/XbemDH9uCsWUojNrd0w+lUVQWJyWw5HZR7IRBTSlO0CHoBHJTZDkRI6NcaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b=NWG5jr1M; arc=none smtp.client-ip=74.125.231.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marliere.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marliere.net header.i=@marliere.net header.b="NWG5jr1M"
Received: by mail-oi2-f42.google.com with SMTP id 5614622812f47-4e7d0e42662so2330145b6e.3
        for <linux-kselftest@vger.kernel.org>; Thu, 01 Oct 2026 05:22:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790857329; x=1791462129;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RjJ/LbHMd8F4VdMBdkD4rQjeyoWt22OtGMQeeYBWqfM=;
        b=ri3nfRxPegZ8iCIVgu3rtpu96gmvcphI9GnfaP5RKUqt0ogc/ZmcC3a/kUIgi3tCuJ
         Y0ZS+NX7UuRmMXVl/f6rEHr6xJgX0uxCfCMiEOAn3upAEG/uNc7jp2057Q4dBqOJ6IcB
         slm67ujJAx1yc7s2lUFQlMZmDy+gR8ShhLzuJC3c/YjBI0dw34RFtv8B23jI4/GRGvto
         8cixDbVO8Svtn/YOjHyBr/2DvXsOTW5HhuhMWKtieS5/L9C/WefoXww2HfNR3x9tHeUw
         SkQ67CT1ZGkh7dL68PADb4B9LIUPMom1ZKRWk7GVM+5sPd7k5+qV0pqFhO9K/Q8tcE4c
         3LIg==
X-Gm-Message-State: AFuF++k6/2x/2beG3t8iu1SRT/C6rJr7jtkplN+mMNUOMnMvSxQHiN6e
	gpRRP51PtKkxxmCzDg0hpQNUuwaJ5Wuph61Sq+IGbDiyxW1Fx6SOVM0m
X-Gm-Gg: AYBFou3AeqP5v7pjYrHZv9kknpXxuOALGGRF5K3f1qGYEaKfu4KEvDs05mxG1zRG5BJ
	1EFPlI2W8i3bwBT3AsIloEq8RXPgedoONXBPG5uPO/lOGcSDf+j4dE26R4mpGNYf1ZCnubIfw0g
	Yn4zBhYuqDKGjJh6WHCGtZhnYuGCl/SjemdQVSUAAmC0au/KsNoNBGagaPSMWXvyaRn/e1f+nUO
	1XBShaw/0KVdwDF42imePNWqUsfLHVuG8qk0YYj8CEZpe0R0aoNMeCsAZZK8OaO+718CIXwqHJA
	izxY8RW22WpCrFXrKXypE/ItKFbo5T9GNg29HA3SPyynnHBSMfwKUWE7bh/wT9mpcoe7PM7MKgj
	cqX4JS5QD/fXE1cIEAW11KtsKYnmR3CdhTVkxaGADI6m6As3r9nf0GY7ij2oHGS/qzdT/qWwpJA
	XSeHPnrItTSgxJkLTmiLTSC6hKXnJHCMv1kcS/Mh8WRRvN1/6zWH6I7yTVewmwDrL8qX6Ej8Byd
	05yyJRlENz2srXSO6C2sDfkKJ2B1HS20wvU3658oXe4h77D41d5mDT9AdM3p1DsqUx6+sEe5Asr
X-Received: by 2002:a05:6808:1486:b0:4d6:90d4:6bd with SMTP id 5614622812f47-4f1b753acb8mr5361336b6e.47.1790857328582;
        Thu, 01 Oct 2026 05:22:08 -0700 (PDT)
Received: from mail.marliere.net (137.65.66.34.bc.googleusercontent.com. [34.66.65.137])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4f34c19be5dsm2106158b6e.12.2026.10.01.05.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 05:22:07 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8DC4C605D5;
	Thu,  1 Oct 2026 12:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=dkim; t=1790857324;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=RjJ/LbHMd8F4VdMBdkD4rQjeyoWt22OtGMQeeYBWqfM=;
	b=NWG5jr1M8VoTDXQfRX4h/8ZvK6JPHbWZg8nATim3RMLmy/V5++5uskudHF4zx7xmU08XRv
	3xItjT+aen0ccV4y7jKSL6O+haB/4Ipa+rQE8hQeh3g0xKBLx0/Bm2yML3kkU85OV2RnuB
	i/9ivSVHSqVgf5DlbpGaSbtFMklPCx2WU5WnpMpvIhXGOgjwYPTb6I1bGzshj/e2ZCGstt
	4Fh8cO0uNXyNSqi3QqfmYbl2uHv+hNqT7dGz7wYRZmNOYzUXcCY9SsvVarOr+vk64nZF+z
	sFgqRsCfSFcVqvk0bml9bhymYRUp7RR9zvAx1AU9CG8A/iQ5kcPugUz/jujs2g==
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re_=28SUSE=29?= <ricardo@marliere.net>
Date: Thu, 01 Oct 2026 09:21:56 -0300
Subject: [PATCH] selftests/namespaces: Wait for thread exit via pidfd in
 active-ref tests
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261001-selftests-namespaces-nsid_race-v1-1-25f542cf0b9c@marliere.net>
X-B4-Tracking: v=1; b=H4sIAGNQvmoC/yWNUQrCMBBEr1L222BaNIJXESmbZNuu2LTsRhFK7
 26if/OG4c0GSsKkcG02EHqz8pIKtIcGwoRpJMOxMHS2c621rVF6Dpk0q0k4k64YqETl2EuJJrp
 zxHA5WXIeimQVGvjzO7jd/6wv/6CQq7UuPCoZL5jCVKtFeOR0nFEzCez7F03UcV+iAAAA
X-Change-ID: 20261001-selftests-namespaces-nsid_race-d65dac740e6b
To: Shuah Khan <shuah@kernel.org>, Christian Brauner <brauner@kernel.org>, 
 Jeff Layton <jlayton@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re_=28SUSE=29?= <ricardo@marliere.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1790857320; l=3680;
 i=ricardo@marliere.net; h=from:subject:message-id;
 bh=49gUjB07jzcUs0SASiEA4LUZgFq8s0w8m6vCZ7qJ7mU=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QLe6gRHfdouBKWEJELYo/+6ih5pQmeJSJgXvjGtvj1MZ1BwxvwwDayDUXAljONZ9QOwTqjedMTr
 OqLriiIVD/wE=
X-Developer-Key: i=ricardo@marliere.net; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g
X-Last-TLS-Session-Version: TLSv1.3

pthread_join() returns once exit_mm() wakes the CLEARTID futex, but the
exiting thread drops its namespace reference later, in
exit_nsproxy_namespaces(). The joining thread can therefore still see the
namespace as active, making the final open_by_handle_at() check in
thread_ns_inactive_after_exit and thread_ns_fd_keeps_active fail
intermittently.

Have the thread open a PIDFD_THREAD pidfd on itself and poll it before
pthread_join(). A pidfd becomes readable from exit_notify(), which runs
after exit_nsproxy_namespaces().

Fixes: 29f083c49982 ("selftests/namespace: first threaded active reference count test")
Fixes: ee861032381b ("selftests/namespace: second threaded active reference count test")
Assisted-by: LLM
Signed-off-by: Ricardo B. Marlière (SUSE) <ricardo@marliere.net>
---
 .../selftests/namespaces/ns_active_ref_test.c      | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/tools/testing/selftests/namespaces/ns_active_ref_test.c b/tools/testing/selftests/namespaces/ns_active_ref_test.c
index 093268f0efaa..ab5ffe4de521 100644
--- a/tools/testing/selftests/namespaces/ns_active_ref_test.c
+++ b/tools/testing/selftests/namespaces/ns_active_ref_test.c
@@ -8,6 +8,7 @@
 #include <stdlib.h>
 #include <string.h>
 #include <linux/nsfs.h>
+#include <poll.h>
 #include <sys/mount.h>
 #include <sys/socket.h>
 #include <sys/stat.h>
@@ -20,6 +21,10 @@
 #include "../filesystems/utils.h"
 #include "wrappers.h"
 
+#ifndef PIDFD_THREAD
+#define PIDFD_THREAD O_EXCL
+#endif
+
 #ifndef FD_NSFS_ROOT
 #define FD_NSFS_ROOT -10003 /* Root of the nsfs filesystem */
 #endif
@@ -2120,6 +2125,7 @@ TEST(ns_mixed_types_same_owner)
 /* Thread test helpers and structures */
 struct thread_ns_info {
 	__u64 ns_id;
+	int pidfd;
 	int pipefd;
 	int syncfd_read;
 	int syncfd_write;
@@ -2152,6 +2158,13 @@ static void *thread_create_namespace(void *arg)
 		return NULL;
 	}
 
+	/* Open a pidfd so the main thread can later poll it to detect actual thread exit. */
+	info->pidfd = syscall(__NR_pidfd_open, gettid(), PIDFD_THREAD);
+	if (info->pidfd < 0) {
+		info->exit_code = 6;
+		return NULL;
+	}
+
 	/* Send namespace ID to main thread */
 	if (write(info->pipefd, &info->ns_id, sizeof(info->ns_id)) != sizeof(info->ns_id)) {
 		info->exit_code = 4;
@@ -2169,6 +2182,20 @@ static void *thread_create_namespace(void *arg)
 	return NULL;
 }
 
+/*
+ * pthread_join() returns once exit_mm() wakes the CLEARTID futex, before
+ * exit_nsproxy_namespaces() drops the namespace reference. A pidfd becomes
+ * readable only from exit_notify(), after that point.
+ */
+static int wait_thread_exited(int pidfd)
+{
+	struct pollfd pfd = { .fd = pidfd, .events = POLLIN };
+	int ret = poll(&pfd, 1, -1);
+
+	close(pidfd);
+	return ret;
+}
+
 /*
  * Test that namespace becomes inactive after thread exits.
  * This verifies active reference counting works with threads, not just processes.
@@ -2234,6 +2261,7 @@ TEST(thread_ns_inactive_after_exit)
 	close(syncpipe[1]);
 
 	/* Wait for thread to exit */
+	ASSERT_EQ(wait_thread_exited(info.pidfd), 1);
 	ASSERT_EQ(pthread_join(thread, NULL), 0);
 	close(pipefd[0]);
 	close(pipefd[1]);
@@ -2317,6 +2345,7 @@ TEST(thread_ns_fd_keeps_active)
 	close(syncpipe[1]);
 
 	/* Wait for thread to exit */
+	ASSERT_EQ(wait_thread_exited(info.pidfd), 1);
 	pthread_join(thread, NULL);
 	close(pipefd[0]);
 	close(pipefd[1]);

---
base-commit: 551c722f40809618230001baccf219193e22fc5a
change-id: 20261001-selftests-namespaces-nsid_race-d65dac740e6b

Best regards,
--  
Ricardo B. Marlière (SUSE) <ricardo@marliere.net>

