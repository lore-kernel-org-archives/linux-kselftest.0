Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795113576;
	b=nplE+sdyONEfave9i8pTWO9y4I71dnv0ogBX3wl86yOelEZ7YPfYR3j92UeJ743CHQ+/
	 JzyJrWjh1zj2397vMqTrkZzLfWRHFq+iNUHyxX1b/ejtIVLXnmn2ZMclcnCLylSBt0ayt
	 inddARVnwrnzymahHc3ACeZEjKxXZdpfbgVf+9Xcv63UY3uaXUluinDiGyKXEd40tQOIR
	 f5xbAQAxJzh4cLZy3qE0SSXiq9NFHDZCvnY5qLtb89yXsvO0YPVq4fDafH7tJsSBpxcbi
	 RWh6Ds4XBZwFe/OzD/aBklGSlCizoPux8ZKUHyBqSalFDdz3qVBxS13sQNNBDSrVrFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795113576;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pHJGy27mkOAavYT2vi2hpZfRzq++7pcZXDnBhnXmGvc=;
	b=g7rJH+lsQsQJ/DYxbmNiRUyCB8hl+xSvY1ZCLjAbMVh2+/30GwnzTesWysupIQPenup2
	 STmq+McK4wdIA8hR+bgVuk3Scx+lZs8r1vIeE3idrPT4wc+jfXX/H6C8s9RiRKDpuNU4O
	 H7mlsgT60GhyZgjoE/9meu1xy2VNbK+7ouwXNAiuWMBi+/4RZDfL7V/mLwqoqvBm6SPbB
	 w0Ufwf8r7bRBHIZJugldVVNaORWA2BJ1eaf9gQXrk7N+wlCm4qSYPrPVWJs7uz2gX3d0d
	 n94aSj7NVEGY1PWz1CkNmtRZtrYX6rVfXzl3xoeFemHHW6Jamze6qYCUoUijKgwRjGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U+sz7xFb;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F9C606A320
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 18:39:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3F9C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U+sz7xFb
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cd69954c755so48512a12.3
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Nov 2026 10:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113575; x=1795718375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pHJGy27mkOAavYT2vi2hpZfRzq++7pcZXDnBhnXmGvc=;
        b=U+sz7xFbp0I/9UCiMP1pxoyrnB6wALrYqvmqu1pM8N19KrnCFIu8SS3l0j4MIE1gT/
         iYv4sT1rCFhI6WVSI13DRkOv1oVCjWlOj22UmmqMmqGbiFCyhNdp7piwXdyTVFPvr9XI
         DKYpn/JiIOmBUfvbZweANB+xst84KWDp6c7liz5BJWBbkJTLk7axrHgLYq8AUEN+5+P9
         kgsLno92kjGcHNd3jSe0Bf/cNuhYzcKdJIGTQV3lrTeZimrVfetmvilRv/Tsq8emdfZN
         kWEUT561oDhV5P++0bQGMZrzJlqfxsLVe8U6tGG7dxp+y2OiQdOkkY7bp/owGqG8+eFo
         Cdhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113575; x=1795718375;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pHJGy27mkOAavYT2vi2hpZfRzq++7pcZXDnBhnXmGvc=;
        b=eOr+KF2Up0mqF8EP2xAjEUFDvHR/X9Of1+u0hoszxTlleTMZRZoOhVlHw+whll8ivj
         yZKsL6pKRqV3iXTfpMChJO7kIy99MmbePxhx+gAMgAyjOid+mXaoGnq+HejKYoHjcPyi
         rjSsgCuWHP4jnxpyy7Gl68VTelpRacQpzZm5AH6oF+QU/B6aEd1g5KHKZGA5/I0k/wue
         H5Jg928twOgBCmm/0ibuHqVIPUQ8cjVA0GZb15HZ1p5ENa1BbNqdI5w0gjRYyz/Q1jLw
         Vi9+4ArUriKPkGjY56S6K30sX39WUrJZtRvGJ7VOCgVePxET/zuiOD5jANahqa4xMM2K
         zvRQ==
X-Forwarded-Encrypted: i=1; AL+hErHAzsro2cL20I6rLhodGuVh1FdJnc0hLjXn0JoC0AFVzwGW1w43dgfMMFT1VRjI5gAhwBNwREk904wFS+r3VzM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8k8uz8fufY5ov1JKvOr+VueJ/fDsFHbBcgcyNCwKOLyieg8262
	VN3/WT3CvneclHF4cx8Lcl9LPzqKZ3K0dH/zXPnGRZo+Qzh0OxJzjFY3
X-Gm-Gg: AYBFou1mZBsnoDR2OG1+ApVey/VUy8O/zDvnzjtbjVt+14anNUGgjLrn/inWWBik07a
	zXPRfHdeTNjd9ozcKZ6gihzso0VkkQwoT9uc+ktduIE8Sm75ZySPX7p9NuWbOJiNKwQ87g63j+L
	vrzw7ijUrrteDOOigwGVqcdRWibcYh+BQgBkKgNznNjue+l9qxEA5wBJjz71wQvYFXB0jCQKzj7
	qC3lSIvuS/vB8jgg0AgxuaBZBfGQvq8kDqJ5kzxWQFvUr9BDhKrZfO9aFpcKTg8IBceTRdt4rka
	ODCC7YUEXZboAjf5T/W9sLVny/YIWmEZsRlJltBQSxanUvJYhBNdViEyXUFgT0LF+eOb1FKYxX0
	ECNf+s56Ak3Aqih5uTV687FSJIlkiYl0alLnuDPvA4Vy7Parn/iGK7vSjngO9eQH0wAf2cGHnmD
	0We5sObfIcMV2ILQnc0aUkeEXNCCX7qAJFsPSwEu9mjMpVemFRq5/sZgburlTAM655icCeDjvA3
	8xEg1b7Lkp+C1GhHm/dxbF7PN9K+pn/2NogmfOyzmfbHaPXSz+btuviROxt+obdw5Vq0ZqmUDnf
	6h94+an68XhJ2KiV59Z0bx//KrECY0bl9h5GDeR4U4c0cAxHCqYgsDnawTCopXxs4mNum+o=
X-Received: by 2002:a05:6a21:9086:b0:3e2:313d:2da8 with SMTP id adf61e73a8af0-4014c752257mr539233637.48.1795113575085;
        Thu, 19 Nov 2026 10:39:35 -0800 (PST)
Received: from localhost (218-35-178-218.cm.dynamic.apol.com.tw. [218.35.178.218])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87343fba6sm299185b3a.38.2026.11.19.10.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:39:34 -0800 (PST)
From: Kurt Lin <lylin1023@gmail.com>
To: Hui Zhu <zhuhui@kylinos.cn>,
	Hui Zhu <hui.zhu@linux.dev>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Barry Song <baohua@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kurt Lin <lylin1023@gmail.com>
Subject: [PATCH bpf-next v3] selftests/bpf: Keep memcg test page cache off overlayfs
Date: Fri, 20 Nov 2026 02:39:25 +0800
Message-ID: <20261119183925.1482217-1-lylin1023@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

memcg_proactive_reclaim and arena_memcg keep their page cache off tmpfs,
because shmem cannot be reclaimed without swap. But statfs() only sees
the top of a stacking filesystem: with /tmp on overlayfs over tmpfs, as
in virtme-ng guests, the check passes and the data is still charged as
shmem. memcg_proactive_reclaim then fails in a full test_progs run with:

  test_memcg_proactive_reclaim:FAIL:reclaimed unexpected reclaimed: actual 0 <= expected 0

and arena_memcg, run from such a directory, with:

  serial_test_arena_memcg:FAIL:child faulted the arena in unexpected child faulted the arena in: got FALSE

Reject overlayfs as well, so that memcg_proactive_reclaim moves on to
the next candidate directory and arena_memcg skips.

An AI coding assistant (Claude) was used to find and analyze the
failure and to draft this changelog.

Fixes: 0f9b1e9ef584 ("selftests/bpf: Add bpf_proactive_reclaim test")
Fixes: 1fe5a5cd01e4 ("selftests/bpf: Add a test for arena fault-in under memory.max")
Suggested-by: Alexei Starovoitov <ast@kernel.org>
Signed-off-by: Kurt Lin <lylin1023@gmail.com>
---

Notes:
    Changes in v3:
    - Drop the memory.stat check, the polling and the per-directory cgroups,
      and reject overlayfs in the statfs() checks instead (Alexei).
    - Apply the same fix to arena_memcg.
    
    Changes in v2:
    - Fall back to the next candidate directory instead of skipping.
    - Poll memory.stat until the write shows up.
    - Fail when memory.stat cannot be read.
    
    Tested in virtme-ng guests without swap (/tmp is overlayfs over tmpfs,
    the working directory is virtiofs):
    - memcg_proactive_reclaim passes from the default setup, from a tmpfs
      /tmp and from an ext4 working directory, and skips when the working
      directory is read-only or also overlayfs over tmpfs.
    - arena_memcg passes from an ext4 working directory and now skips from
      overlayfs over tmpfs, where it failed before.
    - A full test_progs run passes memcg_proactive_reclaim; the only
      failures are fs_kfuncs (no xattrs on the overlayfs /tmp) and
      xdp_synproxy (no iptables-legacy on the host), both unrelated.
    
    v2: https://lore.kernel.org/bpf/20261117170704.1146730-1-lylin1023@gmail.com/
    v1: https://lore.kernel.org/bpf/20261113180159.602033-1-lylin1023@gmail.com/

 tools/testing/selftests/bpf/prog_tests/arena_memcg.c      | 8 ++++++--
 .../selftests/bpf/prog_tests/memcg_proactive_reclaim.c    | 6 ++++--
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/arena_memcg.c b/tools/testing/selftests/bpf/prog_tests/arena_memcg.c
index c76a7eb2f01d..334bfa61be76 100644
--- a/tools/testing/selftests/bpf/prog_tests/arena_memcg.c
+++ b/tools/testing/selftests/bpf/prog_tests/arena_memcg.c
@@ -53,8 +53,12 @@ static int alloc_pagecache(size_t size)
 	fd = open(".", O_TMPFILE | O_RDWR | O_EXCL, 0600);
 	if (fd < 0)
 		return errno == EOPNOTSUPP ? -EOPNOTSUPP : -1;
-	/* tmpfs hands out shmem pages, which are not reclaimable without swap */
-	if (fstatfs(fd, &stfs) || stfs.f_type == TMPFS_MAGIC) {
+	/*
+	 * tmpfs hands out shmem pages, which are not reclaimable without swap.
+	 * overlayfs hides the type of its upper layer, which can be tmpfs.
+	 */
+	if (fstatfs(fd, &stfs) || stfs.f_type == TMPFS_MAGIC ||
+	    stfs.f_type == OVERLAYFS_SUPER_MAGIC) {
 		close(fd);
 		return -EOPNOTSUPP;
 	}
diff --git a/tools/testing/selftests/bpf/prog_tests/memcg_proactive_reclaim.c b/tools/testing/selftests/bpf/prog_tests/memcg_proactive_reclaim.c
index c22dcfabe856..2ba07916bdc9 100644
--- a/tools/testing/selftests/bpf/prog_tests/memcg_proactive_reclaim.c
+++ b/tools/testing/selftests/bpf/prog_tests/memcg_proactive_reclaim.c
@@ -30,7 +30,8 @@ struct reclaim_args {
  * being available, and a read-only mount cannot host the file at all (EROFS
  * applies to root too). /tmp is tmpfs on many systems, and test_progs is
  * routinely run from a tmpfs working directory, so both candidates need the
- * check.
+ * check. overlayfs hides the type of its upper layer, which is tmpfs for /tmp
+ * in virtme-ng guests.
  */
 static const char *workload_dir(void)
 {
@@ -40,7 +41,8 @@ static const char *workload_dir(void)
 
 	for (i = 0; i < ARRAY_SIZE(dirs); i++)
 		if (!statfs(dirs[i], &st) && st.f_type != TMPFS_MAGIC &&
-		    st.f_type != RAMFS_MAGIC && !access(dirs[i], W_OK))
+		    st.f_type != RAMFS_MAGIC &&
+		    st.f_type != OVERLAYFS_SUPER_MAGIC && !access(dirs[i], W_OK))
 			return dirs[i];
 
 	return NULL;

base-commit: 0021f17128de5dc0b19f1a523f448df2440d8088
-- 
2.56.1

