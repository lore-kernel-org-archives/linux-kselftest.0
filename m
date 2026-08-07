Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB84746F4BE
	for <linux-kselftest@vger.kernel.org>; Fri,  7 Aug 2026 22:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786140618; cv=none; b=Sy1AcueFrvZImZdH3CxMndriEWLeZAd2q+NvnKOuAuaSF0mnUbkUei2mrlOAPnWAEm9C92nKABlfXj3oEtmYRXhKJZHqapv62i3RwE5h+YYspFTVOW3Yvw/JTymasl6m6dp2yJVc0SBWLLivlu+dox17/xXQ8qXu7QG5kXVkyyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786140618; c=relaxed/simple;
	bh=UdTLA46TnlBC54VM7lt50wf4vX5dZatdViC5SajQf0E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OWhGZmRDEs4Zch8GKpiWiiZ3ggHMarwvP7/MdvzjLuti1ZcLTmYYfx/E1KaaMqzR7YX/rOCZs5fBC9e1cdcn06V7jcT0CVfgMOwcuv3DREOT02mwyCPp4vE77aB5bXWmpyUyrgxqmjDFBjJJU8eW7ZexG7zzYwpTMksX2Yt+kjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gDWOcqa5; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gDWOcqa5"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so36441a91.0
        for <linux-kselftest@vger.kernel.org>; Fri, 07 Aug 2026 15:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786140613; x=1786745413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cx5VGBsebkKX9AnlFkRAfLKtyddKfDmd3R9T8O1d6aU=;
        b=gDWOcqa5iSbre1dCR2kLCZEgtuHGD/U1rP1I1zqsaXjRr0JNGAMXHHvp3aAPqTcb/S
         7LafHtcQMyBnjERSSy6+GKbUPH/FDVmt4+CXeS/H+N5+0nVDQa/Bpoz5PL5F8MBHYGLH
         ezS6myHSa4hcysIHUbRLRuuHcSzc7os1y4oHVoEERZ/NCBvifufyVfXLPpjoagJ3fNf4
         XushGFM0kVhE9/dRrgMCgrc5+smkceTIMivGPJNHMAR78HNrqSIGx8AS1mfGOKyZrfsK
         tMWxjvZcN+XLnXSwxxFUYnH4k7Fe19JD33UR1qsHI4H/qGQ+cOK+Yw1IpkLdCjvzXfnt
         loBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786140613; x=1786745413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cx5VGBsebkKX9AnlFkRAfLKtyddKfDmd3R9T8O1d6aU=;
        b=EA0KwkGzLbmhWUPcxQuZAeRFpen/DxyLo/cZ5VSZQ7Kb/QLh8chuBK761aoiNYCzzS
         t9eV29mgiSn0IqFBMlFiMgmzQb+uzUr+WnDbEGCuVoXf1QaORRAyvkiCXiCmcsIm1gzR
         phPaECQTkRum7v/+HTzZu5olwa+iwxHbtr6JTfTPcz/cHwkpR8jQO9iT7N3l9Ii5nfCK
         68kC/N5wHdfyCRN2O/09+aL6T+KAto9xz+csaWgJXywtkiUe/qLPlb5qgdTG2Zx4+wbx
         FwyuzpBhPyS+vxFkuXjK54YZdAsanwFTrlMNftprz3FPb7lEMMfhJDaXciOsK5RJf6gT
         a2ng==
X-Forwarded-Encrypted: i=1; AHgh+RrzQ5OxMQrCNSqf78LrfZj1r63GXjcFobSzTBDQTUbwxweeCGH7aiggWzunigaHwaphOPe0YQP/mxlPz6A7GDQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/pJWGWb5zDS0jbbBREF+Ci/24mq3uzStLufjOiS40XCNnIABt
	zvS85/YG6Cmes6TCh+/W6JEbIbMsknNk2Ndew0juUf3TOIXX4FJCAolq
X-Gm-Gg: AR+sD11JtRQqGMglg2Cb/4gVCVL9ZPb7VgbxF7dA4ycLbTpE7ro9RFfNTvwowJiDCm5
	s37e/4kRtUplXRJYK1EADHMGRSwddrqBk+Wqin9yezhaho+mop0dvLebI/aRsITDfVGUTcB+4cx
	LLXjCh+8VoX/0mKtjZrME/aS0leRwF4XvRix2k/f0iMwg1TO0gKc7s5hCtshARXsFSUXd2dI0c/
	CGEmqFbGYbBa8Xawi+59j4+DlpO3LvFtML9WnW27l/O4gFNkqnawc6k0gJx3VFSIcknW1vjeXeI
	YPPiTuFepnV4/Mz/LjZWrMhPfvyRiyJxy9QBd8CS3Z+Da99gPs/Mww9JDFX0OL9feHfUq5hw+tl
	+xK36wt+djKo8+RLJX2N6UIXbIPiXPJ4McQpSU2T/G6YE+RxcxQjhyzGsFyFHYaDOYmjZso0kmO
	QvlemVYEk0Mu9Om4VV7gbOIRvPQ8/dBb+NGzilpm7HCTxIBoCqWxNrC0HstYceuit3+A==
X-Received: by 2002:a17:90b:5244:b0:38e:9eb2:9d43 with SMTP id 98e67ed59e1d1-3903c5b685bmr25189638a91.16.1786140613400;
        Fri, 07 Aug 2026 15:10:13 -0700 (PDT)
Received: from fedora ([2804:1b3:a8c3:8ee5:1c39:64d9:e257:73dc])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be568bd3sm11182762eec.0.2026.08.07.15.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 15:10:12 -0700 (PDT)
From: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>
Subject: [PATCH net-next v3 5/5] selftests: net: adopt harness for flow label mgr
Date: Fri,  7 Aug 2026 19:09:42 -0300
Message-ID: <20260807220942.421382-6-marcelomspessoto@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260807220942.421382-1-marcelomspessoto@gmail.com>
References: <20260807220942.421382-1-marcelomspessoto@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kselftest_harness.h file contains modern helpers to build tests
for kselftest. Dropping the custom test helpers in ipv6_flowlabel_mgr
in favor of the harness makes tests more legible and conforms to the
structure of the latest selftests. It also enforces the TAP standard.

Another change made to the structure of the ipv6_flowlabel_mgr test
file was the removal of parse_opts. The supported opts were already
unused: the binary is listed in TEST_GEN_FILES, and is driven solely
by ipv6_flowlabel.sh via "./ipv6_flowlabel_mgr", which never passed -l
or -v. Dropping the -l gate means the two checks it previously guarded
(each with a 13-second sleep, ~26 seconds total) are now
unconditionally enabled on every run instead of never running at all.
The TH_LOG calls and code comments now cover the information that the
removed, custom -v flag used to print.

Finally, FIXTURE_SETUP(flowlabel) ensures each test gets its own
isolated network namespace. The previously added setup() helper was
dropped to conform to the netns setup pattern used in icmp_rfc4884.c.
disable_flowlabel_consistency() was moved next to reflect_flag, the
only test that calls it, and now uses SKIP() instead of an ad hoc
[INFO] message when the sysctl cannot be disabled.

Signed-off-by: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>
---
 .../selftests/net/ipv6_flowlabel_mgr.c        | 622 ++++++++++--------
 1 file changed, 365 insertions(+), 257 deletions(-)

diff --git a/tools/testing/selftests/net/ipv6_flowlabel_mgr.c b/tools/testing/selftests/net/ipv6_flowlabel_mgr.c
index d32150abd8ff..072fb3a9b121 100644
--- a/tools/testing/selftests/net/ipv6_flowlabel_mgr.c
+++ b/tools/testing/selftests/net/ipv6_flowlabel_mgr.c
@@ -23,6 +23,7 @@
 #include <sys/types.h>
 #include <sys/wait.h>
 #include <unistd.h>
+#include "kselftest_harness.h"
 
 /* uapi/glibc weirdness may leave this undefined */
 #ifndef IPV6_FLOWLABEL_MGR
@@ -35,40 +36,6 @@
 /* from net/ipv6/ip6_flowlabel.c */
 #define FL_MIN_LINGER		6
 
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
-		else if (!__ret)					\
-			error(1, 0, "[ERR]  " #x			\
-			      " (line %d): unexpectedly succeeded",	\
-			      __LINE__);				\
-		else							\
-			error(1, 0, "[ERR]  " #x			\
-			      " (line %d): expected errno %d, got %d",	\
-			      __LINE__, __exp, __err);			\
-	} while (0)
-
-static bool cfg_long_running;
-static bool cfg_verbose;
-
 static int flowlabel_get(int fd, uint32_t label, uint8_t share, uint16_t flags)
 {
 	struct in6_flowlabel_req req = {
@@ -169,269 +136,410 @@ static void tcp_connect(int listener, uint32_t flowlabel,
 	*accepted = afd;
 }
 
-static bool disable_flowlabel_consistency(void)
+static int bringup_loopback(void)
 {
+	struct ifreq ifr = {
+		.ifr_name = "lo"
+	};
 	int fd;
 
-	fd = open("/proc/sys/net/ipv6/flowlabel_consistency", O_WRONLY);
-	if (fd == -1)
-		return false;
+	fd = socket(AF_LOCAL, SOCK_STREAM, 0);
+	if (fd < 0)
+		return -1;
+
+	if (ioctl(fd, SIOCGIFFLAGS, &ifr) < 0)
+		goto err;
+
+	ifr.ifr_flags = ifr.ifr_flags | IFF_UP;
+
+	if (ioctl(fd, SIOCSIFFLAGS, &ifr) < 0)
+		goto err;
 
-	if (write(fd, "0", 1) != 1) {
-		close(fd);
-		return false;
-	}
 	close(fd);
+	return 0;
 
-	return true;
+err:
+	close(fd);
+	return -1;
 }
 
-static void run_tests(int fd)
+FIXTURE(flowlabel) {};
+
+FIXTURE_SETUP(flowlabel)
 {
-	int wstatus;
-	pid_t pid;
+	int ret;
 
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
-				  IPV6_FL_F_CREATE | IPV6_FL_F_EXCL));
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
+	ret = unshare(CLONE_NEWNET);
+	ASSERT_EQ(ret, 0) {
+		TH_LOG("unshare(CLONE_NEWNET) failed: %s", strerror(errno));
 	}
 
-	explain("create a new user-private label (FL_S_USER)");
-	expect_pass(flowlabel_get(fd, 3, IPV6_FL_S_USER, IPV6_FL_F_CREATE));
-	explain("cannot get it again in non-exclusive mode");
-	expect_fail(flowlabel_get(fd, 3, IPV6_FL_S_ANY, 0));
-	explain("cannot get it again in exclusive mode");
-	expect_fail(flowlabel_get(fd, 3, IPV6_FL_S_EXCL, 0));
-	explain("can get it again in user mode");
-	expect_pass(flowlabel_get(fd, 3, IPV6_FL_S_USER, 0));
-	explain("child process can get it too, but not after setuid(nobody)");
+	ret = bringup_loopback();
+	ASSERT_EQ(ret, 0) TH_LOG("Failed to bring up loopback interface");
+}
+
+FIXTURE_TEARDOWN(flowlabel)
+{
+}
+
+TEST_F(flowlabel, cannot_get_non_existent_label)
+{
+	int fd, err;
+
+	fd = socket(PF_INET6, SOCK_DGRAM, 0);
+	ASSERT_GE(fd, 0) TH_LOG("socket failed");
+
+	err = flowlabel_get(fd, 9, IPV6_FL_S_ANY, 0);
+	EXPECT_TRUE(err) TH_LOG("expected get of a non-existent label to fail");
+	EXPECT_EQ(ENOENT, errno) TH_LOG("expected ENOENT, got %d", errno);
+
+	EXPECT_EQ(0, close(fd));
+}
+
+TEST_F(flowlabel, cannot_put_non_existent_label)
+{
+	int fd, err;
+
+	fd = socket(PF_INET6, SOCK_DGRAM, 0);
+	ASSERT_GE(fd, 0) TH_LOG("socket failed");
+
+	err = flowlabel_put(fd, 10);
+	EXPECT_TRUE(err) TH_LOG("expected put of a non-existent label to fail");
+	EXPECT_EQ(ESRCH, errno) TH_LOG("expected ESRCH, got %d", errno);
+
+	EXPECT_EQ(0, close(fd));
+}
+
+TEST_F(flowlabel, cannot_create_label_greater_than_20_bits)
+{
+	int fd, err;
+
+	fd = socket(PF_INET6, SOCK_DGRAM, 0);
+	ASSERT_GE(fd, 0) TH_LOG("socket failed");
+
+	err = flowlabel_get(fd, 0x1FFFFF, IPV6_FL_S_ANY, IPV6_FL_F_CREATE);
+	EXPECT_TRUE(err) TH_LOG("expected label > 20 bits to be rejected");
+	EXPECT_EQ(EINVAL, errno) TH_LOG("expected EINVAL, got %d", errno);
+
+	EXPECT_EQ(0, close(fd));
+}
+
+TEST_F(flowlabel, can_create_and_get_and_put_labels)
+{
+	int fd, err;
+
+	fd = socket(PF_INET6, SOCK_DGRAM, 0);
+	ASSERT_GE(fd, 0) TH_LOG("socket failed");
+
+	err = flowlabel_get(fd, 1, IPV6_FL_S_ANY, IPV6_FL_F_CREATE);
+	EXPECT_TRUE(!err) TH_LOG("failed to create label (FL_F_CREATE)");
+
+	err = flowlabel_get(fd, 1, IPV6_FL_S_ANY, 0);
+	EXPECT_TRUE(!err) TH_LOG("failed to get the label without FL_F_CREATE");
+
+	err = flowlabel_get(fd, 1, IPV6_FL_S_ANY, IPV6_FL_F_CREATE);
+	EXPECT_TRUE(!err)
+		TH_LOG("failed to get it again with create flag set, too");
+
+	err = flowlabel_get(fd, 1, IPV6_FL_S_ANY,
+			    IPV6_FL_F_CREATE | IPV6_FL_F_EXCL);
+	EXPECT_TRUE(err)
+		TH_LOG("expected FL_F_EXCL to reject existing label");
+	EXPECT_EQ(EEXIST, errno) TH_LOG("expected EEXIST, got %d", errno);
+
+	err = flowlabel_put(fd, 1);
+	EXPECT_TRUE(!err) TH_LOG("failed to put first reference");
+	err = flowlabel_put(fd, 1);
+	EXPECT_TRUE(!err) TH_LOG("failed to put second reference");
+	err = flowlabel_put(fd, 1);
+	EXPECT_TRUE(!err) TH_LOG("failed to put third reference");
+	err = flowlabel_put(fd, 1);
+	EXPECT_TRUE(err)
+		TH_LOG("expected fourth put to fail, no references left");
+	EXPECT_EQ(ESRCH, errno) TH_LOG("expected ESRCH, got %d", errno);
+
+	EXPECT_EQ(0, close(fd));
+}
+
+TEST_F(flowlabel, exclusive_label_share)
+{
+	int fd, err;
+
+	fd = socket(PF_INET6, SOCK_DGRAM, 0);
+	ASSERT_GE(fd, 0) TH_LOG("socket failed");
+
+	err = flowlabel_get(fd, 2, IPV6_FL_S_EXCL, IPV6_FL_F_CREATE);
+	EXPECT_TRUE(!err)
+		TH_LOG("failed to create a new exclusive label (FL_S_EXCL)");
+
+	err = flowlabel_get(fd, 2, IPV6_FL_S_ANY, IPV6_FL_F_CREATE);
+	EXPECT_TRUE(err) TH_LOG("expected reuse in non-exclusive mode to fail");
+	EXPECT_EQ(EPERM, errno) TH_LOG("expected EPERM, got %d", errno);
+
+	err = flowlabel_get(fd, 2, IPV6_FL_S_EXCL, IPV6_FL_F_CREATE);
+	EXPECT_TRUE(err) TH_LOG("expected reuse in exclusive mode to fail too");
+	EXPECT_EQ(EPERM, errno) TH_LOG("expected EPERM, got %d", errno);
+
+	err = flowlabel_put(fd, 2);
+	EXPECT_TRUE(!err) TH_LOG("failed to put the exclusive label");
+
+	err = flowlabel_get(fd, 2, IPV6_FL_S_ANY, IPV6_FL_F_CREATE);
+	EXPECT_TRUE(err) TH_LOG("expected reuse to fail, due to linger");
+	EXPECT_EQ(EPERM, errno) TH_LOG("expected EPERM, got %d", errno);
+
+	sleep(FL_MIN_LINGER * 2 + 1);
+
+	err = flowlabel_get(fd, 2, IPV6_FL_S_ANY, IPV6_FL_F_CREATE);
+	EXPECT_TRUE(!err) TH_LOG("expected reuse to succeed after linger");
+
+	EXPECT_EQ(0, close(fd));
+}
+
+TEST_F(flowlabel, user_private_label_share)
+{
+	int fd, err, wstatus;
+	pid_t pid;
+
+	fd = socket(PF_INET6, SOCK_DGRAM, 0);
+	ASSERT_GE(fd, 0) TH_LOG("socket failed");
+
+	err = flowlabel_get(fd, 3, IPV6_FL_S_USER, IPV6_FL_F_CREATE);
+	EXPECT_TRUE(!err)
+		TH_LOG("failed to create a new user-private label (FL_S_USER)");
+
+	err = flowlabel_get(fd, 3, IPV6_FL_S_ANY, 0);
+	EXPECT_TRUE(err) TH_LOG("expected get in non-exclusive mode to fail");
+	EXPECT_EQ(EPERM, errno) TH_LOG("expected EPERM, got %d", errno);
+
+	err = flowlabel_get(fd, 3, IPV6_FL_S_EXCL, 0);
+	EXPECT_TRUE(err) TH_LOG("expected get in exclusive mode to fail");
+	EXPECT_EQ(EPERM, errno) TH_LOG("expected EPERM, got %d", errno);
+
+	err = flowlabel_get(fd, 3, IPV6_FL_S_USER, 0);
+	EXPECT_TRUE(!err) TH_LOG("failed to get it again in user mode");
+
 	pid = fork();
-	if (pid == -1)
-		error(1, errno, "fork");
+	ASSERT_NE(-1, pid) TH_LOG("fork failed");
 	if (!pid) {
-		expect_pass(flowlabel_get(fd, 3, IPV6_FL_S_USER, 0));
+		err = flowlabel_get(fd, 3, IPV6_FL_S_USER, 0);
+		EXPECT_TRUE(!err)
+			TH_LOG("child failed to get the user-private label");
+
 		if (setuid(USHRT_MAX))
-			fprintf(stderr, "[INFO] skip setuid child test\n");
-		else
-			expect_fail(flowlabel_get(fd, 3, IPV6_FL_S_USER, 0));
+			exit(KSFT_SKIP);
+
+		err = flowlabel_get(fd, 3, IPV6_FL_S_USER, 0);
+		EXPECT_TRUE(err)
+			TH_LOG("child unexpectedly got label after setuid");
+		EXPECT_EQ(EPERM, errno) TH_LOG("expected EPERM, got %d", errno);
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
+	if (WEXITSTATUS(wstatus) == KSFT_SKIP)
+		SKIP(return,
+		     "setuid(USHRT_MAX) unavailable (no CAP_SETUID or uid unmapped)");
+	EXPECT_EQ(0, WEXITSTATUS(wstatus))
+		TH_LOG("child reported unexpected result");
+
+	EXPECT_EQ(0, close(fd));
+}
+
+TEST_F(flowlabel, process_private_label_share)
+{
+	int fd, err, wstatus;
+	pid_t pid;
+
+	fd = socket(PF_INET6, SOCK_DGRAM, 0);
+	ASSERT_GE(fd, 0) TH_LOG("socket failed");
+
+	err = flowlabel_get(fd, 4, IPV6_FL_S_PROCESS, IPV6_FL_F_CREATE);
+	EXPECT_TRUE(!err)
+		TH_LOG("failed to create a new process-private label");
+
+	err = flowlabel_get(fd, 4, IPV6_FL_S_PROCESS, 0);
+	EXPECT_TRUE(!err) TH_LOG("failed to get it again");
+
 	pid = fork();
-	if (pid == -1)
-		error(1, errno, "fork");
+	ASSERT_NE(-1, pid) TH_LOG("fork failed");
 	if (!pid) {
-		expect_fail(flowlabel_get(fd, 4, IPV6_FL_S_PROCESS, 0));
+		err = flowlabel_get(fd, 4, IPV6_FL_S_PROCESS, 0);
+		EXPECT_TRUE(err)
+			TH_LOG("child unexpectedly got process-private label");
+		EXPECT_EQ(EPERM, errno) TH_LOG("expected EPERM, got %d", errno);
 		exit(0);
 	}
-	if (wait(&wstatus) == -1)
-		error(1, errno, "wait");
-	if (!WIFEXITED(wstatus) || WEXITSTATUS(wstatus) != 0)
-		error(1, errno, "wait: unexpected child result");
-
-	explain("It is not possible to renew a label that does not exist");
-	expect_fail_errno(flowlabel_renew(fd, 5, IPV6_FL_S_EXCL,
-					  2 * (FL_MIN_LINGER * 2 + 1)),
-			  ESRCH);
-
-	explain("Create a label for basic renew validation");
-	expect_pass(flowlabel_get(fd, 5, IPV6_FL_S_EXCL, IPV6_FL_F_CREATE));
-	explain("renew does not error for an existing, valid label");
-	expect_pass(flowlabel_renew(fd, 5, IPV6_FL_S_EXCL,
-				    2 * (FL_MIN_LINGER * 2 + 1)));
-
-	if (cfg_long_running) {
-		explain("create a new label with FL_MIN_LINGER linger time");
-		expect_pass(flowlabel_get(fd, 6, IPV6_FL_S_EXCL,
-					  IPV6_FL_F_CREATE));
-		explain("renew the label to extend linger, then put it");
-		expect_pass(flowlabel_renew(fd, 6, IPV6_FL_S_EXCL,
-					    2 * (FL_MIN_LINGER * 2 + 1)));
-		expect_pass(flowlabel_put(fd, 6));
-		sleep(FL_MIN_LINGER * 2 + 1);
-		explain("cannot create: new linger time not over yet");
-		expect_fail_errno(flowlabel_get(fd, 6, IPV6_FL_S_ANY,
-						IPV6_FL_F_CREATE),
-				  EPERM);
-	}
+	ASSERT_EQ(pid, wait(&wstatus)) TH_LOG("wait failed");
+	ASSERT_TRUE(WIFEXITED(wstatus)) TH_LOG("child did not exit normally");
+	EXPECT_EQ(0, WEXITSTATUS(wstatus))
+		TH_LOG("child reported unexpected result");
 
-	{
-		struct in6_flowlabel_req freq = {
-			.flr_action = IPV6_FL_A_GET,
-			.flr_flags = IPV6_FL_F_REMOTE,
-		};
-		int remote_listener = tcp_listen();
-		socklen_t freq_len = sizeof(freq);
-		int remote_cfd, remote_afd;
-
-		explain("Prepare TCP SYN for REMOTE flag validation");
-		tcp_connect(remote_listener, 7, &remote_cfd, &remote_afd);
-
-		explain("Query for label sent by client with IPV6_FL_F_REMOTE");
-		expect_pass(getsockopt(remote_afd, SOL_IPV6, IPV6_FLOWLABEL_MGR,
-				       &freq, &freq_len));
-		if (ntohl(freq.flr_label) != 7)
-			error(1, 0, "unexpected remote flowlabel %u",
-			      ntohl(freq.flr_label));
-
-		close(remote_afd);
-		close(remote_cfd);
-		close(remote_listener);
-	}
+	EXPECT_EQ(0, close(fd));
+}
 
-	if (!disable_flowlabel_consistency()) {
-		fprintf(stderr,
-			"[INFO] skip REFLECT: cannot disable net.ipv6.flowlabel_consistency\n");
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
-		explain("Enable REFLECT on listener before client connects");
-		expect_pass(setsockopt(reflect_listener, SOL_IPV6,
-				       IPV6_FLOWLABEL_MGR, &reflect_on,
-				       sizeof(reflect_on)));
-
-		tcp_connect(reflect_listener, 8, &reflect_cfd, &reflect_afd);
-
-		explain("accepted socket's label should be reflected");
-		expect_pass(getsockopt(reflect_afd, SOL_IPV6,
-				       IPV6_FLOWLABEL_MGR, &reflect_query,
-				       &reflect_query_len));
-		if (ntohl(reflect_query.flr_label) != 8)
-			error(1, 0, "unexpected reflected flowlabel %u",
-			      ntohl(reflect_query.flr_label));
-
-		explain("PUT+REFLECT disables reflection on accepted socket");
-		expect_pass(setsockopt(reflect_afd, SOL_IPV6,
-				       IPV6_FLOWLABEL_MGR, &reflect_off,
-				       sizeof(reflect_off)));
-		explain("cannot disable reflection twice");
-		expect_fail(setsockopt(reflect_afd, SOL_IPV6,
-				       IPV6_FLOWLABEL_MGR, &reflect_off,
-				       sizeof(reflect_off)));
-
-		close(reflect_afd);
-		close(reflect_cfd);
-		close(reflect_listener);
-	}
+TEST_F(flowlabel, cannot_renew_non_existent_label)
+{
+	int fd, err;
+
+	fd = socket(PF_INET6, SOCK_DGRAM, 0);
+	ASSERT_GE(fd, 0) TH_LOG("socket failed");
+
+	err = flowlabel_renew(fd, 5, IPV6_FL_S_EXCL,
+			      2 * (FL_MIN_LINGER * 2 + 1));
+	EXPECT_TRUE(err)
+		TH_LOG("expected renew of a non-existent label to fail");
+	EXPECT_EQ(ESRCH, errno) TH_LOG("expected ESRCH, got %d", errno);
+
+	EXPECT_EQ(0, close(fd));
 }
 
-static void setup(void)
+TEST_F(flowlabel, can_renew_existing_label)
 {
-	struct ifreq ifr = {
-		.ifr_name = "lo"
-	};
-	int ctl;
+	int fd, err;
+
+	fd = socket(PF_INET6, SOCK_DGRAM, 0);
+	ASSERT_GE(fd, 0) TH_LOG("socket failed");
 
-	if (unshare(CLONE_NEWNET))
-		error(1, errno, "unshare");
+	err = flowlabel_get(fd, 5, IPV6_FL_S_EXCL, IPV6_FL_F_CREATE);
+	EXPECT_TRUE(!err)
+		TH_LOG("failed to create a new label for renew validation");
 
-	ctl = socket(AF_LOCAL, SOCK_STREAM, 0);
-	if (ctl == -1)
-		error(1, errno, "socket");
+	err = flowlabel_renew(fd, 5, IPV6_FL_S_EXCL,
+			      2 * (FL_MIN_LINGER * 2 + 1));
+	EXPECT_TRUE(!err) TH_LOG("failed to renew an existing valid label");
 
-	if (ioctl(ctl, SIOCGIFFLAGS, &ifr))
-		error(1, errno, "ioctl SIOCGIFFLAGS");
-	ifr.ifr_flags |= IFF_UP;
-	if (ioctl(ctl, SIOCSIFFLAGS, &ifr))
-		error(1, errno, "ioctl: bring lo up");
+	err = flowlabel_put(fd, 5);
+	EXPECT_TRUE(!err) TH_LOG("failed to put the label");
 
-	if (close(ctl))
-		error(1, errno, "close");
+	EXPECT_EQ(0, close(fd));
 }
 
-static void parse_opts(int argc, char **argv)
+TEST_F(flowlabel, renew_label_linger)
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
+	/* RENEW must extend a label's linger period: putting a renewed
+	 * label and waiting out its original linger time must not be
+	 * enough to allow the label to be recreated.
+	 */
+	int fd, err;
+
+	fd = socket(PF_INET6, SOCK_DGRAM, 0);
+	ASSERT_GE(fd, 0) TH_LOG("socket failed");
+
+	err = flowlabel_get(fd, 6, IPV6_FL_S_EXCL, IPV6_FL_F_CREATE);
+	EXPECT_TRUE(!err)
+		TH_LOG("failed to create label with FL_MIN_LINGER linger time");
+
+	err = flowlabel_renew(fd, 6, IPV6_FL_S_EXCL,
+			      2 * (FL_MIN_LINGER * 2 + 1));
+	EXPECT_TRUE(!err)
+		TH_LOG("failed to renew the label to increase its linger time");
+
+	err = flowlabel_put(fd, 6);
+	EXPECT_TRUE(!err) TH_LOG("failed to put the label");
+
+	sleep(FL_MIN_LINGER * 2 + 1);
+
+	err = flowlabel_get(fd, 6, IPV6_FL_S_ANY, IPV6_FL_F_CREATE);
+	EXPECT_TRUE(err)
+		TH_LOG("expected reuse to fail, new linger time not over yet");
+	EXPECT_EQ(EPERM, errno) TH_LOG("expected EPERM, got %d", errno);
+
+	EXPECT_EQ(0, close(fd));
 }
 
-int main(int argc, char **argv)
+TEST_F(flowlabel, remote_flag)
 {
-	int fd;
+	/* The REMOTE flag, used for getsockopt, is expected to retrieve the
+	 * label from the latest received header.
+	 */
+	struct in6_flowlabel_req freq = {
+		.flr_action = IPV6_FL_A_GET,
+		.flr_flags = IPV6_FL_F_REMOTE,
+	};
+	socklen_t freq_len = sizeof(freq);
+	int listener, cfd, afd, err;
 
-	parse_opts(argc, argv);
-	setup();
+	listener = tcp_listen();
+	tcp_connect(listener, 7, &cfd, &afd);
 
-	fd = socket(PF_INET6, SOCK_DGRAM, 0);
+	err = getsockopt(afd, SOL_IPV6, IPV6_FLOWLABEL_MGR, &freq, &freq_len);
+	EXPECT_TRUE(!err) TH_LOG("getsockopt with IPV6_FL_F_REMOTE failed");
+	EXPECT_EQ(7, ntohl(freq.flr_label))
+		TH_LOG("unexpected remote flow label");
+
+	EXPECT_EQ(0, close(afd));
+	EXPECT_EQ(0, close(cfd));
+	EXPECT_EQ(0, close(listener));
+}
+
+static bool disable_flowlabel_consistency(void)
+{
+	int fd;
+
+	fd = open("/proc/sys/net/ipv6/flowlabel_consistency", O_WRONLY);
 	if (fd == -1)
-		error(1, errno, "socket");
+		return false;
 
-	run_tests(fd);
+	if (write(fd, "0", 1) != 1) {
+		close(fd);
+		return false;
+	}
+	close(fd);
 
-	if (close(fd))
-		error(1, errno, "close");
+	return true;
+}
 
-	return 0;
+TEST_F(flowlabel, reflect_flag)
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
+	if (!disable_flowlabel_consistency())
+		SKIP(return,
+		     "cannot disable net.ipv6.flowlabel_consistency");
+
+	listener = tcp_listen();
+	err = setsockopt(listener, SOL_IPV6, IPV6_FLOWLABEL_MGR,
+			 &reflect_on, sizeof(reflect_on));
+	EXPECT_TRUE(!err) TH_LOG("failed to enable REFLECT on the listener");
+
+	tcp_connect(listener, 8, &cfd, &afd);
+
+	err = getsockopt(afd, SOL_IPV6, IPV6_FLOWLABEL_MGR,
+			 &reflect_query, &reflect_query_len);
+	EXPECT_TRUE(!err)
+		TH_LOG("failed to query the accepted socket's outgoing label");
+	EXPECT_EQ(8, ntohl(reflect_query.flr_label))
+		TH_LOG("accepted socket did not reflect client's label");
+
+	err = setsockopt(afd, SOL_IPV6, IPV6_FLOWLABEL_MGR,
+			 &reflect_off, sizeof(reflect_off));
+	EXPECT_TRUE(!err)
+		TH_LOG("failed to disable REFLECT on the accepted socket");
+
+	err = setsockopt(afd, SOL_IPV6, IPV6_FLOWLABEL_MGR,
+			 &reflect_off, sizeof(reflect_off));
+	EXPECT_TRUE(err) TH_LOG("expected disabling REFLECT twice to fail");
+	EXPECT_EQ(ESRCH, errno) TH_LOG("expected ESRCH, got %d", errno);
+
+	EXPECT_EQ(0, close(afd));
+	EXPECT_EQ(0, close(cfd));
+	EXPECT_EQ(0, close(listener));
 }
+
+TEST_HARNESS_MAIN
-- 
2.55.0

