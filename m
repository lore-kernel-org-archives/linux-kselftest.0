Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8523D891E
	for <linux-kselftest@vger.kernel.org>; Wed,  3 Jun 2026 15:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780501579; cv=none; b=rtT0BY40w1alk/XvExX+qgGRPj+umTxHHk6+dx94COZrbVa7ktVcVXLXyAFhjn1o7gUvrQ1YHpjHx/J+ee+UrL36+dJCyOHzHbj2GsnjCHU68sEwB55cXTQp2BJHyySVf1aoDb6TZnO//Z8yL/yEJLdgEo/498H+D5JEBVYyLm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780501579; c=relaxed/simple;
	bh=GqAk9WL9MH7rJUNKZjopN3vwXWkbaerKBCceA/gzAA0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nQbpnWn7f27N48TC4//YcKAZrGS6qPQfMAsTuQrorw7j2VsEU/9Gou1myjMGTGpcwwmGO4WO5muLqRCLSDLGzsyY4bnlplXTCUB8mWHyfEDACOyt9gYJrZqasrB+a30a39n5d7Q8P6GWbIteeuxhaFyhIHVyc7LDliZcfC52kJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=ipnRHvDc; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="ipnRHvDc"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-9159951f05aso25674485a.0
        for <linux-kselftest@vger.kernel.org>; Wed, 03 Jun 2026 08:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780501574; x=1781106374; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SdAegEf5u3em8MUzB4xyEunyt/xoJrJRQD9FIOINoRs=;
        b=ipnRHvDcRgc22J6ABdtyIpEkQlNGqm9/4TwfS19Tig2X1hzA5RDKFqB8ojq/RrUGI1
         ya5fd+ovnwg2/D6Rvrt75qygXjVeJ/VKahKFYIDp93/F7Ypc0aLICRZipqsvzc3YlCQK
         UWrVeWU5TI/XQhAlsOMAbo+aZOkmWl3DBZVJNZDcLdbhm3xvmQG5cAVhkA/qZ4AnyNeP
         NETyoeclkxqufO+6FEFgD0iOk9Bbjl/Q0QK6SMvIPgSuqQlyo0tgEC/Q2PKoIDYCHotQ
         whasTzteNt1mj4xR6qjWuuW/tfr0GC1t7hpTEScidQS5a3xzhJdcNqWulq9lEvTxM8iR
         nL9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780501574; x=1781106374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SdAegEf5u3em8MUzB4xyEunyt/xoJrJRQD9FIOINoRs=;
        b=rwmGVgtp+wZMS1CFF8D4VLXdQwee5CvVACsH8TCxNw3YoZuxXaljDAKdO7JUZHzbVH
         th9OZR7JOdLxvs2ogbmgeLqbqt7COuIk+P4+nbMkEKotlVClk47N4S5uTKGn1xjZX7pz
         h4eX2oRy3Cyqqot/1eHeUSUS1o/dNfqhl5iVE9eVuI877+x5lOguIVbZfHomlAM+sHmi
         I9taRpMucHeK6mCeajQ3UobZ4ZckD+jhah+cMQ+M7tR6z8yNiY/5MkHNjFPAAmwLUUG/
         Jspfx7ZrVp7qjI3d1UpVQP2WlSrfAsuCj9s+jtGdvjeIkdBTH8tAmJ/pArCgmBR9mES7
         oUZw==
X-Gm-Message-State: AOJu0YyvRlRkevItdTcqiWNdbuN7YrN8UOJ7/zjp4mZaTOOs/B9okIcy
	G9qweg4Z1tdnIBrFDDK7reoZK/XfD0u07NDPlaHtfMZgo9YEiJZkp78iLYo5Hh0kooClV8EoFGf
	n7kKu
X-Gm-Gg: Acq92OHp/OYPQcmWfCkso8RVwWfAJ6QnLNNpAoyKt4e8HTGkh/peXzH0hYd9ojXU8wh
	/gZFMsPKVGJJkKHQNXKeSdkE38UVqidLib9DinIKbLn07bTe48m682KiPUiYRHO1znGY98nywCC
	TOWvAXgQfolhn063xcpDJUW3dnCG1/pbi6kVBmMkNJ7sxm7Gc1uVQXoBKpEZ7nNgBzyDYM33RN1
	pREsXpEDeh8FFd4MO1zXCzzOmBmwwieoxqfiOF4gwWNAu7RNWYDogdACI8z5dzF0AgNXdr7rQvD
	95kpS40EYwd+wyk8jU5FVomXbvBWGn4FJm91xDF5htviLUepc8v+2T8RNFlodUnkW2ArRDChXqh
	Rah+S5CBYSpAJd+AoHlkJRWpmdkQxkVuhuPkwCIaKqS8q4Z2Ja+BttHjFCpYTwYKff++O/6vMCM
	izSSUoWFiIeHeuRSfnfFPyixORX0Fh2BTSXaRc9RkIucfDgsD1LDDpLOQYaAoy4g==
X-Received: by 2002:a05:620a:4708:b0:915:3be9:1160 with SMTP id af79cd13be357-9158a6bb43fmr659953785a.21.1780501574350;
        Wed, 03 Jun 2026 08:46:14 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a3bf5f9sm274596385a.35.2026.06.03.08.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 08:46:13 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	skhawaja@google.com,
	graf@amazon.com
Subject: [PATCH v7 11/13] selftests/liveupdate: Test session and file limit removal
Date: Wed,  3 Jun 2026 15:44:00 +0000
Message-ID: <20260603154402.468928-12-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260603154402.468928-1-pasha.tatashin@soleen.com>
References: <20260603154402.468928-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the removal of static limits on the number of sessions and files per
session, the orchestrator now uses dynamic allocation.

Add new test cases to verify that the system can handle a large number of
sessions and files. These tests ensure that the dynamic block allocation
and reuse logic for session metadata and outgoing files work correctly
beyond the previous static limits.

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed-by: Pratyush Yadav (Google) <pratyush@kernel.org>
Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 .../testing/selftests/liveupdate/liveupdate.c | 75 +++++++++++++++++++
 .../selftests/liveupdate/luo_test_utils.c     | 24 ++++++
 .../selftests/liveupdate/luo_test_utils.h     |  2 +
 3 files changed, 101 insertions(+)

diff --git a/tools/testing/selftests/liveupdate/liveupdate.c b/tools/testing/selftests/liveupdate/liveupdate.c
index c7d94b9181e1..502fb3567e38 100644
--- a/tools/testing/selftests/liveupdate/liveupdate.c
+++ b/tools/testing/selftests/liveupdate/liveupdate.c
@@ -26,6 +26,7 @@
 
 #include <linux/liveupdate.h>
 
+#include "luo_test_utils.h"
 #include "../kselftest.h"
 #include "../kselftest_harness.h"
 
@@ -499,4 +500,78 @@ TEST_F(liveupdate_device, get_session_name_max_length)
 	ASSERT_EQ(close(session_fd), 0);
 }
 
+/*
+ * Test Case: Manage Many Sessions
+ *
+ * Verifies that a large number of sessions can be created and then
+ * destroyed during normal system operation. This specifically tests the
+ * dynamic block allocation and reuse logic for session metadata management
+ * without preserving any files.
+ */
+TEST_F(liveupdate_device, preserve_many_sessions)
+{
+#define MANY_SESSIONS 2000
+	int session_fds[MANY_SESSIONS];
+	int ret, i;
+
+	self->fd1 = open(LIVEUPDATE_DEV, O_RDWR);
+	if (self->fd1 < 0 && errno == ENOENT)
+		SKIP(return, "%s does not exist", LIVEUPDATE_DEV);
+	ASSERT_GE(self->fd1, 0);
+
+	ret = luo_ensure_nofile_limit(MANY_SESSIONS);
+	if (ret == -EPERM)
+		SKIP(return, "Insufficient privileges to set RLIMIT_NOFILE");
+	ASSERT_EQ(ret, 0);
+
+	for (i = 0; i < MANY_SESSIONS; i++) {
+		char name[64];
+
+		snprintf(name, sizeof(name), "many-session-%d", i);
+		session_fds[i] = create_session(self->fd1, name);
+		ASSERT_GE(session_fds[i], 0);
+	}
+
+	for (i = 0; i < MANY_SESSIONS; i++)
+		ASSERT_EQ(close(session_fds[i]), 0);
+}
+
+/*
+ * Test Case: Preserve Many Files
+ *
+ * Verifies that a large number of files can be preserved in a single session
+ * and then destroyed during normal system operation. This tests the dynamic
+ * block allocation and management for outgoing files.
+ */
+TEST_F(liveupdate_device, preserve_many_files)
+{
+#define MANY_FILES 500
+	int mem_fds[MANY_FILES];
+	int session_fd, ret, i;
+
+	self->fd1 = open(LIVEUPDATE_DEV, O_RDWR);
+	if (self->fd1 < 0 && errno == ENOENT)
+		SKIP(return, "%s does not exist", LIVEUPDATE_DEV);
+	ASSERT_GE(self->fd1, 0);
+
+	session_fd = create_session(self->fd1, "many-files-test");
+	ASSERT_GE(session_fd, 0);
+
+	ret = luo_ensure_nofile_limit(MANY_FILES + 10);
+	if (ret == -EPERM)
+		SKIP(return, "Insufficient privileges to set RLIMIT_NOFILE");
+	ASSERT_EQ(ret, 0);
+
+	for (i = 0; i < MANY_FILES; i++) {
+		mem_fds[i] = memfd_create("test-memfd", 0);
+		ASSERT_GE(mem_fds[i], 0);
+		ASSERT_EQ(preserve_fd(session_fd, mem_fds[i], i), 0);
+	}
+
+	for (i = 0; i < MANY_FILES; i++)
+		ASSERT_EQ(close(mem_fds[i]), 0);
+
+	ASSERT_EQ(close(session_fd), 0);
+}
+
 TEST_HARNESS_MAIN
diff --git a/tools/testing/selftests/liveupdate/luo_test_utils.c b/tools/testing/selftests/liveupdate/luo_test_utils.c
index 3c8721c505df..333a3530051b 100644
--- a/tools/testing/selftests/liveupdate/luo_test_utils.c
+++ b/tools/testing/selftests/liveupdate/luo_test_utils.c
@@ -17,6 +17,7 @@
 #include <sys/syscall.h>
 #include <sys/mman.h>
 #include <sys/types.h>
+#include <sys/resource.h>
 #include <sys/stat.h>
 #include <errno.h>
 #include <stdarg.h>
@@ -28,6 +29,29 @@ int luo_open_device(void)
 	return open(LUO_DEVICE, O_RDWR);
 }
 
+int luo_ensure_nofile_limit(long min_limit)
+{
+	struct rlimit hl;
+
+	/* Allow to extra files to be used by test itself */
+	min_limit += 32;
+
+	if (getrlimit(RLIMIT_NOFILE, &hl) < 0)
+		return -errno;
+
+	if (hl.rlim_cur >= min_limit)
+		return 0;
+
+	hl.rlim_cur = min_limit;
+	if (hl.rlim_cur > hl.rlim_max)
+		hl.rlim_max = hl.rlim_cur;
+
+	if (setrlimit(RLIMIT_NOFILE, &hl) < 0)
+		return -errno;
+
+	return 0;
+}
+
 int luo_create_session(int luo_fd, const char *name)
 {
 	struct liveupdate_ioctl_create_session arg = { .size = sizeof(arg) };
diff --git a/tools/testing/selftests/liveupdate/luo_test_utils.h b/tools/testing/selftests/liveupdate/luo_test_utils.h
index 90099bf49577..6a0d85386613 100644
--- a/tools/testing/selftests/liveupdate/luo_test_utils.h
+++ b/tools/testing/selftests/liveupdate/luo_test_utils.h
@@ -26,6 +26,8 @@ int luo_create_session(int luo_fd, const char *name);
 int luo_retrieve_session(int luo_fd, const char *name);
 int luo_session_finish(int session_fd);
 
+int luo_ensure_nofile_limit(long min_limit);
+
 int create_and_preserve_memfd(int session_fd, int token, const char *data);
 int restore_and_verify_memfd(int session_fd, int token, const char *expected_data);
 
-- 
2.53.0

