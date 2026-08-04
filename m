Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C79840B114
	for <linux-kselftest@vger.kernel.org>; Tue,  4 Aug 2026 02:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785812390; cv=none; b=kgCzKwa2Ot0NLNZIeVJubhwiSlKbNa70ucKHWHpEFuS+3zIY6Xg5wQRTtXiknqK7t5UQjJFsXIM1Mt+19czB7RHxsPwFMWybmLudLTliDg9xkxpIvt5sJEDVipF4sfwwYu1m5dkJGMeRq593/hbwhjwZ1+nIky6s5NoCcuM1dvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785812390; c=relaxed/simple;
	bh=FpK+PjjhCN3h8Em234HUUSWkZ7XkOYTLlXHlmQ8TqeQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QFE1bWphzilD2ycNh+KdXvMlJ77SrYG6FQfm+01LDohzUqS4PDaV0U0HFxOxn5gm/+Pd24ffiCJSW77wgVMGg13UCQCiBt7lpBkmFmMrK0B7Ks3OFgeRoayuwROgrngu5C3PreJtTxmuCXQAY2JBbTm98F4ZSZJR0vCpJcBRaFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AdmgjJA6; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AdmgjJA6"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38e88b60121so3107009a91.3
        for <linux-kselftest@vger.kernel.org>; Mon, 03 Aug 2026 19:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785812388; x=1786417188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wQo8OcjOTMXh9X3kaJrhqxoi/2bzY3rrnHALBkkL6gk=;
        b=AdmgjJA6SChaUVOrLRrWjVjcF7nBFg5P7vhAiaVZf3/Z9KEOoXhzYNWn/qGvcWdIO9
         6DflZYywJbrRPLe/gLc/3W1eFEzSh7SOhxBnQMBxLLGN/9OJEMzL47hxmTsOWCIocKvw
         YlkNXexHELXKZf0J9QxnsQEHhR3X0Jry2RR0Y29d0wQ6HKNscXaqQIm1PCc79EVJ1iz6
         7EHZhl1kykClWrUgYMZi/qd2nPUzn83e+zi8N4EHmQPohhAvMMNOTtjgKAv12Cb2fFZi
         ie+0IGvOki2raPhlqy8E+u97P+sLcEa5lj8tIUr12+8Gb+z4azJP9d4qxiSiMuEM7vaG
         P0JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785812388; x=1786417188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wQo8OcjOTMXh9X3kaJrhqxoi/2bzY3rrnHALBkkL6gk=;
        b=cUbfheADP/hYLvIETkHgN4hXWCpQf2welqp96CKNT4ZvpUo6OfyeSXmHwkZ8EZWsw3
         bw4y+kz7lItlSucoUiE+Zhy4akTM22vLNSLQ89ZdYPvUfE0SqfrYoPz67VdOT057gRMq
         lsCl6MBhynSE2Xw/bRHaV+Kew8P31dSvMDhGmZEEjAjWyDVtqDyztmDEzXnBvLGPBRNd
         q+Jdl9xA8SchhLRsvS2nh4O2JzFqbLH1o9uGUlcK/StIwaeeblBJRI/J86gXBksKlCpg
         yEmtQ9nLF9BY+jI259poOJG4BVxg9+f34ECfXhApzMYu0i7OtOgZQNZarxtCcOVg3O/J
         WD6w==
X-Forwarded-Encrypted: i=1; AHgh+RpMIMVHBFHSj7/wzVJww/R43qkk/mj1jnvUo0892EBO7hzUd6yBB5dBpJdDfUpWrzsI95x7eN/Hufp2ntAUWTc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXQAUrkiF0CFwxeZO6oEJVtfKdg1jpoRkPL9YxbPoLuOkWIT14
	RAADGtK5jO2BCoFaKNkZgiEEBDrKJHQbX8E3qi36CHOuueCkaZVpviYZ
X-Gm-Gg: AR+sD13mMTH97HfALc91K87IdLzKUI4Mn7p8YPIgJjMrwwl4xgjEF3pe8HvrZyNtSme
	pHGHWgcmLFVSloNdh5+rvu5g/yKfsn2/Et315xrWdkIYFXOIBFQ9i9jvIMpYHzbmG7bWmYoNjUB
	wiK20vrUysacCM3y0NBJ12Yo2BJtIvmE5lrTjMqbzVTLsZyu+NkhJ6xGHMR/LoaDpAtNx2Ogb+x
	ozWTJ9KG9V/XcNVqh7o616OWvrRXJrZLssxQ4Bz9ybf5cPzCQKRTJnskiq0utxQ6ZZG0t8OQBao
	uxSTC3r6ofib/tQbFjBI0Qmu6qpBQQCo1SEhuCwsCHoehe59aOpso7xYkDN4vLjPl+SO/+nCyQw
	CenQY3R2j6aSW3EKxPRiV774sEsJkP28X6NpOwIBLxzyBY4a7euwJPaVt8fo0QXWrVNRZTJjxX6
	z1EU06uGN3FUW3XJs9HChDcc7Swh7LmHv7h8zeGTvZ0OxpQmylGTQNmzH/2WUY6g57NQ==
X-Received: by 2002:a17:90b:54c3:b0:38e:659b:f366 with SMTP id 98e67ed59e1d1-38fbc0b4324mr10179461a91.0.1785812387519;
        Mon, 03 Aug 2026 19:59:47 -0700 (PDT)
Received: from fedora ([2804:1b3:a8c3:8ee5:1c39:64d9:e257:73dc])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab2530c0sm35974758c88.8.2026.08.03.19.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 19:59:47 -0700 (PDT)
From: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>
Subject: [PATCH net-next v2 4/4] selftests: net: adopt harness for flow label mgr
Date: Mon,  3 Aug 2026 23:59:10 -0300
Message-ID: <20260804025910.50145-5-marcelomspessoto@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260804025910.50145-1-marcelomspessoto@gmail.com>
References: <20260804025910.50145-1-marcelomspessoto@gmail.com>
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
was the removal of parse_opts. The supported opts were already unused:
the binary is listed in TEST_GEN_FILES, and is driven solely by
ipv6_flowlabel.sh via "./in_netns.sh ./ipv6_flowlabel_mgr",
which never passed -l or -v. Dropping the -l gate means the two checks
it previously guarded (each with a 13-second sleep, ~26 seconds total)
are now unconditionally enabled on every run instead of never running
at all. The TH_LOG and code comments cover the information obtainable
from (-v).

Signed-off-by: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>
---
 .../selftests/net/ipv6_flowlabel_mgr.c        | 521 ++++++++++--------
 1 file changed, 299 insertions(+), 222 deletions(-)

diff --git a/tools/testing/selftests/net/ipv6_flowlabel_mgr.c b/tools/testing/selftests/net/ipv6_flowlabel_mgr.c
index af87eec799c8..482921f7ee11 100644
--- a/tools/testing/selftests/net/ipv6_flowlabel_mgr.c
+++ b/tools/testing/selftests/net/ipv6_flowlabel_mgr.c
@@ -20,6 +20,7 @@
 #include <sys/types.h>
 #include <sys/wait.h>
 #include <unistd.h>
+#include "kselftest_harness.h"
 
 /* uapi/glibc weirdness may leave this undefined */
 #ifndef IPV6_FLOWLABEL_MGR
@@ -33,35 +34,6 @@
 #define FL_MIN_LINGER		6
 #define FL_MAX_LINGER	150
 
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
-#define expect_fail_errno(x, e)						\
-	do {								\
-		int __exp = (e);					\
-		int __ret = (x);					\
-		int __err = errno;					\
-		if (__ret && __err == __exp)				\
-			fprintf(stderr, "[OK]   " #x "\n");		\
-		else							\
-			error(1, 0, "[ERR]  " #x " (line %d): expected errno %d, got %d", \
-			      __LINE__, __exp, __err);			\
-	} while (0)
-
-static bool cfg_long_running;
-static bool cfg_verbose;
-
 static int flowlabel_get(int fd, uint32_t label, uint8_t share, uint16_t flags)
 {
 	struct in6_flowlabel_req req = {
@@ -159,230 +131,335 @@ static void tcp_connect(int listener, uint32_t flowlabel, int *client, int *acce
 	*accepted = afd;
 }
 
-static bool flowlabel_consistency_enabled(void)
+TEST(cannot_get_non_existent_label)
 {
-	char buf[2] = {};
-	int fd;
+	int fd, err;
 
-	fd = open("/proc/sys/net/ipv6/flowlabel_consistency", O_RDONLY);
-	if (fd == -1)
-		return true;
+	fd = socket(PF_INET6, SOCK_DGRAM, 0);
+	ASSERT_GE(fd, 0) TH_LOG("socket failed");
 
-	if (read(fd, buf, sizeof(buf) - 1) < 0)
-		buf[0] = '1';
-	close(fd);
+	err = flowlabel_get(fd, 9, IPV6_FL_S_ANY, 0);
+	ASSERT_TRUE(err) TH_LOG("expected get of a non-existent label to fail");
+	ASSERT_EQ(ENOENT, errno) TH_LOG("expected ENOENT, got %d", errno);
 
-	return buf[0] != '0';
+	ASSERT_EQ(0, close(fd));
+}
+
+TEST(cannot_put_non_existent_label)
+{
+	int fd, err;
+
+	fd = socket(PF_INET6, SOCK_DGRAM, 0);
+	ASSERT_GE(fd, 0) TH_LOG("socket failed");
+
+	err = flowlabel_put(fd, 10);
+	ASSERT_TRUE(err) TH_LOG("expected put of a non-existent label to fail");
+	ASSERT_EQ(ESRCH, errno) TH_LOG("expected ESRCH, got %d", errno);
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
+	ASSERT_EQ(EINVAL, errno) TH_LOG("expected EINVAL, got %d", errno);
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
+	ASSERT_EQ(EEXIST, errno) TH_LOG("expected EEXIST, got %d", errno);
+
+	err = flowlabel_put(fd, 1);
+	ASSERT_TRUE(!err) TH_LOG("failed to put first reference");
+	err = flowlabel_put(fd, 1);
+	ASSERT_TRUE(!err) TH_LOG("failed to put second reference");
+	err = flowlabel_put(fd, 1);
+	ASSERT_TRUE(!err) TH_LOG("failed to put third reference");
+	err = flowlabel_put(fd, 1);
+	ASSERT_TRUE(err) TH_LOG("expected fourth put to fail, no references left");
+	ASSERT_EQ(ESRCH, errno) TH_LOG("expected ESRCH, got %d", errno);
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
+	ASSERT_EQ(EPERM, errno) TH_LOG("expected EPERM, got %d", errno);
+
+	err = flowlabel_get(fd, 2, IPV6_FL_S_EXCL, IPV6_FL_F_CREATE);
+	ASSERT_TRUE(err) TH_LOG("expected reuse in exclusive mode to fail too");
+	ASSERT_EQ(EPERM, errno) TH_LOG("expected EPERM, got %d", errno);
+
+	err = flowlabel_put(fd, 2);
+	ASSERT_TRUE(!err) TH_LOG("failed to put the exclusive label");
+
+	err = flowlabel_get(fd, 2, IPV6_FL_S_ANY, IPV6_FL_F_CREATE);
+	ASSERT_TRUE(err) TH_LOG("expected reuse to fail, due to linger");
+	ASSERT_EQ(EPERM, errno) TH_LOG("expected EPERM, got %d", errno);
+
+	sleep(FL_MIN_LINGER * 2 + 1);
+
+	err = flowlabel_get(fd, 2, IPV6_FL_S_ANY, IPV6_FL_F_CREATE);
+	ASSERT_TRUE(!err) TH_LOG("expected reuse to succeed after linger");
+
+	ASSERT_EQ(0, close(fd));
 }
 
-static void run_tests(int fd)
+TEST(user_private_label_share)
 {
-	int wstatus;
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
+	ASSERT_EQ(EPERM, errno) TH_LOG("expected EPERM, got %d", errno);
+
+	err = flowlabel_get(fd, 3, IPV6_FL_S_EXCL, 0);
+	ASSERT_TRUE(err) TH_LOG("expected get in exclusive mode to fail");
+	ASSERT_EQ(EPERM, errno) TH_LOG("expected EPERM, got %d", errno);
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
+		err = flowlabel_get(fd, 3, IPV6_FL_S_USER, 0);
+		ASSERT_TRUE(!err) TH_LOG("child failed to get the user-private label");
+
+		if (setuid(USHRT_MAX)) {
 			fprintf(stderr, "[INFO] skip setuid child test\n");
-		else
-			expect_fail(flowlabel_get(fd, 3, IPV6_FL_S_USER, 0));
+			exit(0);
+		}
+
+		err = flowlabel_get(fd, 3, IPV6_FL_S_USER, 0);
+		ASSERT_TRUE(err) TH_LOG("child unexpectedly got the label after setuid(nobody)");
+		ASSERT_EQ(EPERM, errno) TH_LOG("expected EPERM, got %d", errno);
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
+		err = flowlabel_get(fd, 4, IPV6_FL_S_PROCESS, 0);
+		ASSERT_TRUE(err) TH_LOG("child unexpectedly got the process-private label");
+		ASSERT_EQ(EPERM, errno) TH_LOG("expected EPERM, got %d", errno);
 		exit(0);
 	}
-	if (wait(&wstatus) == -1)
-		error(1, errno, "wait");
-	if (!WIFEXITED(wstatus) || WEXITSTATUS(wstatus) != 0)
-		error(1, errno, "wait: unexpected child result");
-
-	explain("It is not possible to renew a label that does not exist");
-	expect_fail_errno(flowlabel_renew(fd, 5, 2 * (FL_MIN_LINGER * 2 + 1)), ESRCH);
-
-	explain("Create a label for basic renew validation");
-	expect_pass(flowlabel_get(fd, 5, IPV6_FL_S_EXCL, IPV6_FL_F_CREATE));
-	explain("Check if renew does not return errors for existing and valid label");
-	expect_pass(flowlabel_renew(fd, 5, 2 * (FL_MIN_LINGER * 2 + 1)));
-
-	if (cfg_long_running) {
-		explain("create a new label with FL_MIN_LINGER linger time");
-		expect_pass(flowlabel_get(fd, 6, IPV6_FL_S_EXCL, IPV6_FL_F_CREATE));
-		explain("renew the label to increase its linger time and put it");
-		expect_pass(flowlabel_renew(fd, 6, 2 * (FL_MIN_LINGER * 2 + 1)));
-		expect_pass(flowlabel_put(fd, 6));
-		sleep(FL_MIN_LINGER * 2 + 1);
-		explain("The label cannot be created because the new linger time is not over yet");
-		expect_fail_errno(flowlabel_get(fd, 6, IPV6_FL_S_ANY, IPV6_FL_F_CREATE), EPERM);
-	}
+	ASSERT_EQ(pid, wait(&wstatus)) TH_LOG("wait failed");
+	ASSERT_TRUE(WIFEXITED(wstatus)) TH_LOG("child did not exit normally");
+	ASSERT_EQ(0, WEXITSTATUS(wstatus)) TH_LOG("child reported unexpected result");
 
-	{
-		struct in6_flowlabel_req freq = {
-			.flr_action = IPV6_FL_A_GET,
-			.flr_flags = IPV6_FL_F_REMOTE,
-		};
-		socklen_t freq_len = sizeof(freq);
-		int remote_listener = tcp_listen();
-		int remote_cfd, remote_afd;
-
-		explain("Prepare TCP SYN for REMOTE flag validation");
-		tcp_connect(remote_listener, 7, &remote_cfd, &remote_afd);
-
-		explain("Query for label sent by client with IPV6_FL_F_REMOTE");
-		expect_pass(getsockopt(remote_afd, SOL_IPV6, IPV6_FLOWLABEL_MGR, &freq, &freq_len));
-		if (ntohl(freq.flr_label) != 7)
-			error(1, 0, "unexpected remote flowlabel %u", ntohl(freq.flr_label));
-
-		close(remote_afd);
-		close(remote_cfd);
-		close(remote_listener);
-	}
-
-	if (flowlabel_consistency_enabled()) {
-		fprintf(stderr,
-			"[INFO] skip REFLECT flag validation (net.ipv6.flowlabel_consistency must be 0)\n");
-	} else {
-		struct in6_flowlabel_req reflect_query = {
-			.flr_action = IPV6_FL_A_GET,
-		};
-		struct in6_flowlabel_req reflect_off = {
-			.flr_action = IPV6_FL_A_PUT,
-			.flr_flags = IPV6_FL_F_REFLECT,
-		};
-		struct in6_flowlabel_req reflect_on = {
-			.flr_action = IPV6_FL_A_GET,
-			.flr_flags = IPV6_FL_F_REFLECT,
-		};
-		socklen_t reflect_query_len = sizeof(reflect_query);
-		int reflect_listener = tcp_listen();
-		int reflect_cfd, reflect_afd;
-
-		explain("Enable REFLECT on the listener before the client connects");
-		expect_pass(setsockopt(reflect_listener, SOL_IPV6, IPV6_FLOWLABEL_MGR,
-				       &reflect_on, sizeof(reflect_on)));
-
-		tcp_connect(reflect_listener, 8, &reflect_cfd, &reflect_afd);
-
-		explain("Query the accepted socket's outgoing label, should be reflected");
-		expect_pass(getsockopt(reflect_afd, SOL_IPV6, IPV6_FLOWLABEL_MGR,
-				       &reflect_query, &reflect_query_len));
-		if (ntohl(reflect_query.flr_label) != 8)
-			error(1, 0, "unexpected reflected flowlabel %u",
-			      ntohl(reflect_query.flr_label));
-
-		explain("PUT+REFLECT disables reflection on the accepted socket");
-		expect_pass(setsockopt(reflect_afd, SOL_IPV6, IPV6_FLOWLABEL_MGR,
-				       &reflect_off, sizeof(reflect_off)));
-		explain("cannot disable reflection twice");
-		expect_fail(setsockopt(reflect_afd, SOL_IPV6, IPV6_FLOWLABEL_MGR,
-				       &reflect_off, sizeof(reflect_off)));
-
-		close(reflect_afd);
-		close(reflect_cfd);
-		close(reflect_listener);
-	}
+	ASSERT_EQ(0, close(fd));
 }
 
-static void parse_opts(int argc, char **argv)
+TEST(cannot_renew_non_existent_label)
 {
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
+	int fd, err;
+
+	fd = socket(PF_INET6, SOCK_DGRAM, 0);
+	ASSERT_GE(fd, 0) TH_LOG("socket failed");
+
+	err = flowlabel_renew(fd, 5, 2 * (FL_MIN_LINGER * 2 + 1));
+	ASSERT_TRUE(err) TH_LOG("expected renew of a non-existent label to fail");
+	ASSERT_EQ(ESRCH, errno) TH_LOG("expected ESRCH, got %d", errno);
+
+	ASSERT_EQ(0, close(fd));
 }
 
-int main(int argc, char **argv)
+TEST(can_renew_existing_label)
 {
-	int fd;
+	int fd, err;
+
+	fd = socket(PF_INET6, SOCK_DGRAM, 0);
+	ASSERT_GE(fd, 0) TH_LOG("socket failed");
+
+	err = flowlabel_get(fd, 5, IPV6_FL_S_EXCL, IPV6_FL_F_CREATE);
+	ASSERT_TRUE(!err) TH_LOG("failed to create a new label for renew validation");
 
-	parse_opts(argc, argv);
+	err = flowlabel_renew(fd, 5, 2 * (FL_MIN_LINGER * 2 + 1));
+	ASSERT_TRUE(!err) TH_LOG("failed to renew an existing valid label");
+
+	err = flowlabel_put(fd, 5);
+	ASSERT_TRUE(!err) TH_LOG("failed to put the label");
+
+	ASSERT_EQ(0, close(fd));
+}
+
+TEST(renew_label_linger)
+{
+	/* RENEW must extend a label's linger period: putting a renewed
+	 * label and waiting out its original linger time must not be
+	 * enough to allow the label to be recreated.
+	 */
+	int fd, err;
 
 	fd = socket(PF_INET6, SOCK_DGRAM, 0);
+	ASSERT_GE(fd, 0) TH_LOG("socket failed");
+
+	err = flowlabel_get(fd, 6, IPV6_FL_S_EXCL, IPV6_FL_F_CREATE);
+	ASSERT_TRUE(!err) TH_LOG("failed to create a new label with FL_MIN_LINGER linger time");
+
+	err = flowlabel_renew(fd, 6, 2 * (FL_MIN_LINGER * 2 + 1));
+	ASSERT_TRUE(!err) TH_LOG("failed to renew the label to increase its linger time");
+
+	err = flowlabel_put(fd, 6);
+	ASSERT_TRUE(!err) TH_LOG("failed to put the label");
+
+	sleep(FL_MIN_LINGER * 2 + 1);
+
+	err = flowlabel_get(fd, 6, IPV6_FL_S_ANY, IPV6_FL_F_CREATE);
+	ASSERT_TRUE(err) TH_LOG("expected reuse to fail, new linger time not over yet");
+	ASSERT_EQ(EPERM, errno) TH_LOG("expected EPERM, got %d", errno);
+
+	ASSERT_EQ(0, close(fd));
+}
+
+TEST(remote_flag)
+{
+	/* The REMOTE flag, used for getsockopt, is expected to retrieve the
+	 * label from the latest received header.
+	 */
+	struct in6_flowlabel_req freq = {
+		.flr_action = IPV6_FL_A_GET,
+		.flr_flags = IPV6_FL_F_REMOTE,
+	};
+	socklen_t freq_len = sizeof(freq);
+	int listener, cfd, afd, err;
+
+	listener = tcp_listen();
+	tcp_connect(listener, 7, &cfd, &afd);
+
+	err = getsockopt(afd, SOL_IPV6, IPV6_FLOWLABEL_MGR, &freq, &freq_len);
+	ASSERT_TRUE(!err) TH_LOG("getsockopt with IPV6_FL_F_REMOTE failed");
+	ASSERT_EQ(7, ntohl(freq.flr_label)) TH_LOG("unexpected remote flow label");
+
+	ASSERT_EQ(0, close(afd));
+	ASSERT_EQ(0, close(cfd));
+	ASSERT_EQ(0, close(listener));
+}
+
+static bool flowlabel_consistency_enabled(void)
+{
+	char buf[2] = {};
+	int fd;
+
+	fd = open("/proc/sys/net/ipv6/flowlabel_consistency", O_RDONLY);
 	if (fd == -1)
-		error(1, errno, "socket");
+		return true;
+
+	if (read(fd, buf, sizeof(buf) - 1) < 0)
+		buf[0] = '1';
+	close(fd);
 
-	run_tests(fd);
+	return buf[0] != '0';
+}
+
+TEST(reflect_flag)
+{
+	/* The REFLECT flag acts as a trigger to the REPFLOW bit. When REPFLOW
+	 * is triggered for a socket, it adopts the label received from the
+	 * connected socket.
+	 */
+	struct in6_flowlabel_req reflect_on = {
+		.flr_action = IPV6_FL_A_GET,
+		.flr_flags = IPV6_FL_F_REFLECT,
+	};
+	struct in6_flowlabel_req reflect_query = {
+		.flr_action = IPV6_FL_A_GET,
+	};
+	struct in6_flowlabel_req reflect_off = {
+		.flr_action = IPV6_FL_A_PUT,
+		.flr_flags = IPV6_FL_F_REFLECT,
+	};
+	socklen_t reflect_query_len = sizeof(reflect_query);
+	int listener, cfd, afd, err;
+
+	if (flowlabel_consistency_enabled())
+		SKIP(return,
+		     "net.ipv6.flowlabel_consistency must be 0 (run via ipv6_flowlabel.sh)");
+
+	listener = tcp_listen();
+	err = setsockopt(listener, SOL_IPV6, IPV6_FLOWLABEL_MGR, &reflect_on, sizeof(reflect_on));
+	ASSERT_TRUE(!err) TH_LOG("failed to enable REFLECT on the listener");
 
-	if (close(fd))
-		error(1, errno, "close");
+	tcp_connect(listener, 8, &cfd, &afd);
 
-	return 0;
+	err = getsockopt(afd, SOL_IPV6, IPV6_FLOWLABEL_MGR, &reflect_query, &reflect_query_len);
+	ASSERT_TRUE(!err) TH_LOG("failed to query the accepted socket's outgoing label");
+	ASSERT_EQ(8, ntohl(reflect_query.flr_label))
+		TH_LOG("accepted socket did not reflect client's label");
+
+	err = setsockopt(afd, SOL_IPV6, IPV6_FLOWLABEL_MGR, &reflect_off, sizeof(reflect_off));
+	ASSERT_TRUE(!err) TH_LOG("failed to disable REFLECT on the accepted socket");
+
+	err = setsockopt(afd, SOL_IPV6, IPV6_FLOWLABEL_MGR, &reflect_off, sizeof(reflect_off));
+	ASSERT_TRUE(err) TH_LOG("expected disabling REFLECT twice to fail");
+	ASSERT_EQ(ESRCH, errno) TH_LOG("expected ESRCH, got %d", errno);
+
+	ASSERT_EQ(0, close(afd));
+	ASSERT_EQ(0, close(cfd));
+	ASSERT_EQ(0, close(listener));
 }
+
+TEST_HARNESS_MAIN
-- 
2.55.0

