Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD431353A74
	for <linux-kselftest@vger.kernel.org>; Sat, 26 Sep 2026 05:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790401332; cv=none; b=KSe8drLVv5xB810RgX7/ZASeziHBK4KhcvbIT39rvMzmteR8N7ItvveZ+1jWJpf4ldCx5+8jKzEkPqWnjlD8M4t31gK//XzoIbtWvbjtl5EdsBqMvbTJbfDyhhCL0offCXuDtuE9iza+Qn6nd1OyYkePcPFuZm4VX92gS442Oc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790401332; c=relaxed/simple;
	bh=ihSErNzL28dopbbYtQk6sfe08O6dP4QtdIBtZVb4Srg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X/egzkj6cMoKqc6jsAPV+hGpmooti3pMsk3axh8QldIPVHFqryDVyzZ84vkfChNrshx8m+YxJZaVF+jab8VzJg94xH+v+nVf3qpy9YoS26Pht8gkoXpNR/e9JG3HUgyelzmaZLeMAUe9oD40e5+my3CXJi6NzSWLV2hNKUHWf3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p1tx3DnV; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p1tx3DnV"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887840c529so530303f8f.1
        for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 22:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790401329; x=1791006129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=poMR+QoD4H3NHZQTFS1CZaPTIlu9qbIcYvmcDeHr1ig=;
        b=p1tx3DnVVwWjOFwADRo6uLbq1ztMJJ4/vjhUmWOw5FWhkmnAnw8pKPuIaTROtM/6Fe
         2z+LnIvYoACIncm62wZ4rqxahJ4YHayGVfRgcdfD8pbY//jl4G2NoRtDR3dtmv16OBBc
         wqtr8F8w60WpxiIztu3q4nYUyWW47BOGTx8g0FVeZz6qQ4VHJKNktPaa6GBLaQ7cSuqX
         k9XRG5wwzugG67nBG7QnLCvEM8UmY7HrsuhuTr/HvhtRnoUcZ99qpEwca6J+L2DuKEdV
         LngO1WtQwZD1sqN/mECpXJXw8GL1q8Mj5waqBzuGturUJtxF0lgOXWZKK/BC+uTWEdjX
         ESKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790401329; x=1791006129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=poMR+QoD4H3NHZQTFS1CZaPTIlu9qbIcYvmcDeHr1ig=;
        b=mhtex7rS9MW8w/N+UtlP03RDgKDPpuLW9OO60xYUJwvQgH2OVVkbChANhECizPiIZM
         g1o0TyY8POx+conSszUX4tgT2HDnvDCK/gB+YdmXvk6tZwR8o6A2xE5L5OlHfwLAGrRy
         c6nn5cuu3dKs8EKyHIRp4BeapyuSIlGN4hzJPpIcSgXOOFG9TY1uFgz+yIVXjXW01wdN
         JsNVBQTa1rGDhqdylMK/fmukbmXQsAnZs1ZOjYTrCjLT2dNm8ImhnHAt3xD08uOvEwyk
         zgWvN1z0lzrFr+RJexienPWgWgVTNiwwgoaFhmgN8Dfp3zjj8Qn5hhPJepBh+UkOknML
         BLIQ==
X-Forwarded-Encrypted: i=1; AKwUvBx4oZw8vyX/+ybLyweHUK/cMpuRNb2Vy4ZNPPPO3OQiKY/+Cw+wWBsHAO5Eeqa9IhskwKRdS4vZ09/L8yeIj/Y=@vger.kernel.org
X-Gm-Message-State: AFuF++n/t0N8VuATOCdV27qgXyIHX8CHS1x9xzujKomZyNMCp2G0f+zl
	OsxcTVGozqhVXPfpV/L9gkCXqhso50W+35mX7frYNMkw36LoQjy+40dt
X-Gm-Gg: AYBFou2/AOvJELx+cvlG59wU6iwTjODE5kwy6fzwIctfAltOgkx0ju67sVPT1gOYfcj
	xQueMh9jIxOt3fyIAsIXU0ht/8bF98ulr3k8AQX5PjH1wi8hmWzNulXX80DoTBFitEqQM6feMAe
	z1LMljMpMmSt2Zx1vMVleA716iu4AvGbEJ57XLCqx8SEHCEAAWZ24QFd8XicD8N936CovJXrcOl
	1U+QoIdlSImrP1DP9L3fwCfn6Qe76aBbj0uCWTwtF3Pt0bUUMhBoa4vBv8TiJ3TTPc0aQBLaAMP
	jY9MeRBaWnCZ+5O5K7yCw1OWbJSlbeUX8y8ODuq5RCTucFSFzvf/6x3bMVzpxPkMC7CaDe4kpVC
	XZKK+JSLazguuguzPE/KqY6hM4a3eYtDTxIrhg9wOjXdFggfDiV8mBabHFZoLBlObcUjcIfsEe0
	4JHBz/zG6T8CYVca4mFyhqo0IFblvEZ7pBxGKipBD23QFPZ6wE2ao7/uiH4sWmtRbpE5JEU8Y2b
	sb+3dOseH3W57lBaN0b98X3RzqOXs3Y8gkX4dnklL0T
X-Received: by 2002:a05:600c:6986:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-49fe66d05d7mr126116765e9.8.1790401328777;
        Fri, 25 Sep 2026 22:42:08 -0700 (PDT)
Received: from localhost.suse.org ([37.109.167.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff065873csm104782365e9.2.2026.09.25.22.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 22:42:08 -0700 (PDT)
From: Sebastian Chlad <sebastianchlad@gmail.com>
X-Google-Original-From: Sebastian Chlad <sebastian.chlad@suse.com>
To: Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Sebastian Chlad <sebastian.chlad@suse.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests: memcg: Don't hang in the inotify tests without IN_DELETE_SELF
Date: Sat, 26 Sep 2026 07:42:03 +0200
Message-ID: <20260926054205.28933-1-sebastian.chlad@suse.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

test_memcg_inotify_delete_file() and test_memcg_inotify_delete_dir()
wait for IN_DELETE_SELF with a blocking read() on the inotify fd. On a
kernel that does not send IN_DELETE_SELF for kernfs files and
directories, the read() never returns and test_memcontrol hangs until
it is killed by the kselftest timeout. The remaining tests do not run
and no result is reported for the inotify tests.

Wait for the first event with poll() and a timeout. If IN_DELETE_SELF
does not arrive in time, report it and fail the test instead of
blocking, so that test_memcontrol completes and the remaining results
are reported.

Assisted-by: claude-opus-5-5
Signed-off-by: Sebastian Chlad <sebastian.chlad@suse.com>
---
 .../selftests/cgroup/test_memcontrol.c        | 27 ++++++++++++++++---
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/cgroup/test_memcontrol.c b/tools/testing/selftests/cgroup/test_memcontrol.c
index 0ed82347044e..c00420acc9a1 100644
--- a/tools/testing/selftests/cgroup/test_memcontrol.c
+++ b/tools/testing/selftests/cgroup/test_memcontrol.c
@@ -11,6 +11,7 @@
 #include <sys/types.h>
 #include <unistd.h>
 #include <sys/inotify.h>
+#include <poll.h>
 #include <sys/socket.h>
 #include <sys/wait.h>
 #include <arpa/inet.h>
@@ -1655,10 +1656,20 @@ static int test_memcg_oom_group_score_events(const char *root)
 	return ret;
 }
 
+#define INOTIFY_TIMEOUT_MS 5000
+
 static int read_event(int inotify_fd, int expected_event, int expected_wd)
 {
+	struct pollfd pfd = { .fd = inotify_fd, .events = POLLIN };
 	struct inotify_event event;
 	ssize_t len = 0;
+	int ret;
+
+	ret = poll(&pfd, 1, INOTIFY_TIMEOUT_MS);
+	if (ret == 0)
+		return -ETIMEDOUT;
+	if (ret < 0)
+		return -1;
 
 	len = read(inotify_fd, &event, sizeof(event));
 	if (len < (ssize_t)sizeof(event))
@@ -1678,7 +1689,7 @@ static int test_memcg_inotify_delete_file(const char *root)
 {
 	int ret = KSFT_FAIL;
 	char *memcg = NULL;
-	int fd, wd;
+	int fd, wd, err;
 
 	memcg = cg_name(root, "memcg_test_0");
 
@@ -1701,7 +1712,11 @@ static int test_memcg_inotify_delete_file(const char *root)
 	free(memcg);
 	memcg = NULL;
 
-	if (read_event(fd, IN_DELETE_SELF, wd))
+	err = read_event(fd, IN_DELETE_SELF, wd);
+	if (err == -ETIMEDOUT)
+		fprintf(stderr, "no IN_DELETE_SELF event within %d ms\n",
+			INOTIFY_TIMEOUT_MS);
+	if (err)
 		goto cleanup;
 
 	if (read_event(fd, IN_IGNORED, wd))
@@ -1723,7 +1738,7 @@ static int test_memcg_inotify_delete_dir(const char *root)
 {
 	int ret = KSFT_FAIL;
 	char *memcg = NULL;
-	int fd, wd;
+	int fd, wd, err;
 
 	memcg = cg_name(root, "memcg_test_0");
 
@@ -1746,7 +1761,11 @@ static int test_memcg_inotify_delete_dir(const char *root)
 	free(memcg);
 	memcg = NULL;
 
-	if (read_event(fd, IN_DELETE_SELF, wd))
+	err = read_event(fd, IN_DELETE_SELF, wd);
+	if (err == -ETIMEDOUT)
+		fprintf(stderr, "no IN_DELETE_SELF event within %d ms\n",
+			INOTIFY_TIMEOUT_MS);
+	if (err)
 		goto cleanup;
 
 	if (read_event(fd, IN_IGNORED, wd))
-- 
2.51.0

