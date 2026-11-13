Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794592947;
	b=LDLEjRhiDPMy6Ok0RCZunXJ6DXNj2SNVVxOyfC1e4xU1lS8C2G8A1ACjJYIFH8jLn3Rr
	 R8Diu+tVnj8WrgBhzaqSXANqIUIkMvCYWjDcbj17Tf5wCZNBZOvALKzIs9s2p46n1hu/D
	 YSoxG0Ovu3INwQXXavqFXePFtSthB26H4UrsMCF4tPCbXLF1/ZAt2Zh7vks5wCznZ9mIk
	 xNy1qMMtk1VNVo/i3iS/9kqjb4KXsthc8Upp1Mn3ghQ59G87h8wVSqVAi2auyZQboKoad
	 JgaTW3BxJzlqgxHuhgJ1qg+vN2kCLPQveJHVtC7s9Y8UPfZsfGp7TlyAkpj2qG9V7Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794592947;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wLpQg5QcAg89Cohrx6Yev6AjF1ehi1341b5g301iJZ8=;
	b=P+7yUkwU44NubAms+R6nNykcNpR4EAQ1VrK9y250Bek64jPIIKaTRhjCqHTbnKlj4QpS
	 0fzLc6YrbBfaR3UH76Tvnrr/w9iRWM5c6GEKejG7dsKt5F+vov16c547OvpqUegx4nC2U
	 5CdHp2FVz1EbYL8B67VvqmzBTnkQ/nbGo6EK5bxbToFzpdj87zQN4xiMe9B0KjGFuxXnY
	 Py4w2e1Zw60xX2SyuAqCUweTrCYFNoRkdDrrloaZ16Fg52PGDgKJFAZlQjXPngOBIbdCu
	 ekQ1GZ4KmujJkUKnn04HRwrDW4HErvBhyxvyo8gWuA0KNOUBeie3UU2xfPFoBm9le0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XGeQHk8Z;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457B8606B471
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 18:02:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 457B8606B471
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XGeQHk8Z
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36a315ed211so1200756eec.0
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 10:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794592945; x=1795197745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wLpQg5QcAg89Cohrx6Yev6AjF1ehi1341b5g301iJZ8=;
        b=XGeQHk8ZO1dp9XZamtxcj2r2j6j4skWEmXGyEXYr7dFlvJL27ZBmdlz+SyuNiXAgOR
         xbIByzYO6KX4Ix85QHA+VnOZ7ZNIS1dhSLTbTOLRiVhr/shYi35xXVExkPy6CafjrWqC
         LDo3azPLy8TyMTWYi23rBhcHcTHJVEHoMMIuCBtuAyQ3TMc8V0Biy3MSsFvdLvpZ0VaK
         OgFhg0GhA7RaQPUClsAgz8QbgKp17GLTXGZnZR9798o/5yPaBcxD4TijVEzFTYtlBqbq
         B+vJvlCv0+gMz0wgrmjPgXpJ/tEtOQKOSJTgJJl90FnvHv3pjUGh3xL4i08ELLz4G54c
         gkAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794592945; x=1795197745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wLpQg5QcAg89Cohrx6Yev6AjF1ehi1341b5g301iJZ8=;
        b=mOcFIPmACIysukfaXSyIpLOvdtYT8z2WkGTt2cbE17/DbRrwLpcjqGMTw+lFGGufhQ
         Dpoj9yewkIW7femi7WPwVMBhmywNaws1walhFE8jit1t+5idgCtw06x1HCV9cnLRbhrf
         qaqRizz8bukecg18AFxYe9qK2xn/pEoWrbZbrEJ8FuJFVHLusJDbnk6jYhxC+Uh3mQhv
         KvfTk9sQekQM/y+MxacszDjkOjyogxp41+Diy+kfRFqN9lff6JgdlBJXi85tiyHWwpPd
         JHC2AOA9ho4hgwUtu2+sNf0TfYA2/bs6sWhriXKrH2gwlIBYiOWIFu4pXm4NKiMWQsTr
         QXeg==
X-Forwarded-Encrypted: i=1; AL+hErEyIXzV02zqHaMH/dLNNhyxz7lOC7+W2GFAV/jTd01r7nHqrsyvz0N3jj6C+uUtUYlByl9bCuOHxqCwmjP+uug=@vger.kernel.org
X-Gm-Message-State: APuU4Z+uh3g+89jRxe5BOixyId481CZUwbNJyBEj2u+8DSnX5Kdmle/t
	nviJhiDRZZyVNQIyOtdAXSFKnvnKBryJIbUy1Mom+eSvHegsyLkcjyuK
X-Gm-Gg: AYBFou3pnLHu2jIy8QfF9haD3h/C4Cf7MdZeaKiB/8ViVyKiGlDdb9N9C6ILdS+7CWx
	s6yXgb9YPbBwoTcM1i6PR7uXzfVketSMupWGj12s68c20kyZGIGs33PawwvrrvAv+IX6/WfcnLw
	G4R0t5HtYVc68h9jBcfSIDakSIAaIcQwQLXBqhCcH4sYolQXgM+yfXllyoGpPFIKc4QERqXbaaS
	3xVCETb5fTA7No/SsCJUyIfqA0dCXBM+ShTfFkYhkl40EPcQ90Pt/4l1dfzl8bUuek+YzjFDXyI
	44tVckb0vQUP35qovRY7wEK+CFTrQvokw3hIj4WsMgm6HxbQAx6I6Mr/0R/r7RzNWRheE5lfG6i
	HcJqc5VY8Mk23tUynLTnssT2KITTj9xJZSaAR6eiaFIXBG0IPeIEM4v7C74+3ZxE0HAos2MgoIA
	JU6tTkt/TMUnB0tS4q5rsilPJL/rTPzW3vfAudlCoyGZ/mnw4KW1pLWLfzaPy8hPKZ5oLxX/xhQ
	baQ8vYW6+yqYPmT9jjXBtkk3S1p3h5kDPNoGA8JrHCyCdZwuT8NKWmBIH7d/JnayYoYSLzCqSe4
	p7wDTP7QEUd/0l+BHnuEZfMu3YpV4LCjg1mrTqCso+0Y1hnpB0SzpyItvDKFz0IOmvU68HA=
X-Received: by 2002:a05:693c:60c1:b0:36a:2473:9b2f with SMTP id 5a478bee46e88-377e1af6414mr5950264eec.23.1794592945251;
        Fri, 13 Nov 2026 10:02:25 -0800 (PST)
Received: from localhost (218-35-178-218.cm.dynamic.apol.com.tw. [218.35.178.218])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f02ff0sm8621741eec.16.2026.11.13.10.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:02:24 -0800 (PST)
From: Kurt Lin <lylin1023@gmail.com>
To: Hui Zhu <zhuhui@kylinos.cn>,
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
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kurt Lin <lylin1023@gmail.com>
Subject: [PATCH bpf-next] selftests/bpf: Skip memcg_proactive_reclaim when data lands in shmem
Date: Sat, 14 Nov 2026 02:01:59 +0800
Message-ID: <20261113180159.602033-1-lylin1023@gmail.com>
X-Mailer: git-send-email 2.56.0
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

workload_dir() keeps the data file off tmpfs because shmem cannot be
reclaimed without swap. But statfs() only sees the top of a stacking
filesystem: with /tmp on overlayfs over tmpfs, as in virtme-ng guests,
the check passes and all 32 MiB are still charged as shmem. Whether the
test then passes depends on unrelated page cache in the cgroup; in a
full test_progs run it fails with:

  test_memcg_proactive_reclaim:FAIL:reclaimed unexpected reclaimed: actual 0 <= expected 0

Check memory.stat after writing the file and skip when most of the
data was charged as shmem.

An AI coding assistant (Claude) was used to find and analyze the
failure and to draft the fix and this changelog.

Fixes: 0f9b1e9ef584 ("selftests/bpf: Add bpf_proactive_reclaim test")
Signed-off-by: Kurt Lin <lylin1023@gmail.com>
---

Notes:
    Tested in a virtme-ng guest without swap: with /tmp on overlayfs over
    tmpfs the test now skips; on a disk-backed directory it passes.
    
    After writing 32 MiB, memory.stat shows shmem 32.0 MiB on overlayfs
    /tmp and on tmpfs, and 0.0 MiB on a disk-backed filesystem.

 .../bpf/prog_tests/memcg_proactive_reclaim.c  | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/tools/testing/selftests/bpf/prog_tests/memcg_proactive_reclaim.c b/tools/testing/selftests/bpf/prog_tests/memcg_proactive_reclaim.c
index c22dcfabe856..c03550676041 100644
--- a/tools/testing/selftests/bpf/prog_tests/memcg_proactive_reclaim.c
+++ b/tools/testing/selftests/bpf/prog_tests/memcg_proactive_reclaim.c
@@ -46,6 +46,28 @@ static const char *workload_dir(void)
 	return NULL;
 }
 
+/*
+ * statfs() only sees the top of a stacking filesystem. When /tmp is an
+ * overlayfs whose upper layer lives on tmpfs, as in virtme-ng guests, the
+ * check above passes but the written data still ends up as shmem. Ask the
+ * cgroup how the pages were actually charged.
+ */
+static bool charged_as_shmem(void)
+{
+	static char buf[8192];
+	unsigned long long shmem;
+	char *p;
+
+	if (read_cgroup_file(CG_PATH, "memory.stat", buf, sizeof(buf)))
+		return false;
+
+	p = strstr(buf, "\nshmem ");
+	if (!p || sscanf(p, "\nshmem %llu", &shmem) != 1)
+		return false;
+
+	return shmem >= FILE_SIZE / 2;
+}
+
 void test_memcg_proactive_reclaim(void)
 {
 	struct memcg_proactive_reclaim *skel = NULL;
@@ -99,6 +121,12 @@ void test_memcg_proactive_reclaim(void)
 	if (!ASSERT_OK(fsync(data_fd), "fsync"))
 		goto out;
 
+	if (charged_as_shmem()) {
+		printf("%s:SKIP: %s is backed by shmem\n", __func__, dir);
+		test__skip();
+		goto out;
+	}
+
 	args.cgroup_id = cgroup_id;
 	args.size = FILE_SIZE;
 	skel->bss->reclaimed = 0;

base-commit: 0021f17128de5dc0b19f1a523f448df2440d8088
-- 
2.56.0

