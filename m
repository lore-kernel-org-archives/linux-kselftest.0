Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793090371;
	b=2RF2L/skWqpP84RojdjiNAIcP73xnJIToxK0mzl/KjpbRruxaEQFz94wm8NNjiMpIECm
	 Vp0H6CjwlwS3P436uGcPPC2xWO8dE3qafAskODvxloIWmkqVQtRtsVgW/1juMYhd1w44d
	 Sgpf0fHzA5drX6rzvUAfwv/blhpolivUUW1CIJMGEhBnHtc6EwAc/sjAoGPAiIva1xw2C
	 1nr7jcfgEVRSrwOchlsIwVUZ+TK3q0AB4mb3/EzX1jJoHgOTanDJEsA2fW4SpMcDkU9aH
	 b+M3wWqiW8cnc/QPOrzycjECtxg2A60lZUTc4/iKzwlqXrbvSURaVaqkWkc/0q1zjfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793090371;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1z6u6B82Pr3/hzW5YMWmMP5A7ww17vCOqXR2hKgLl9c=;
	b=1+ge3GvUglORlaHCED7ubPvs+mEuwhRJFKxT4pBN/H4izXEyleyOsLhiak4EgBjKRQLa
	 KSfyL/WaB98w/vaNOY/iOwe0JOj9hNt1aszTQB5s6GkHfAtqLFYov4WDGa357rimUHjfN
	 cWBWFRy4zjWzlXmf7TJDiVarrS1Wsm5kGO3OajjLW0/UaJ9uadnOABMl+wXvSZYl72oSi
	 0uEGXj2kidkgNLaKnTIgNDSB+TI7R1ScT8zKHU3nczRqo41353m5wkD7u2sSIeo5NaN0e
	 LKLoibTxKZHnV2Iba40uHlvk/VAAmP1j3Aaw7qSLSVtzM9Mc1T4N0K6v/T0sR5GR2cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oSdjbadH;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7761B606A31D
	for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 08:39:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7761B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oSdjbadH
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cd5d2dafeccso1402663a12.2
        for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 01:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793090371; x=1793695171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1z6u6B82Pr3/hzW5YMWmMP5A7ww17vCOqXR2hKgLl9c=;
        b=oSdjbadHGHjMx6m92nhrDQflhJGALNSv+UxevBBC5BaLg3+8GAsVik0aVme73SHE8e
         d7VUZ+GR2k3kyC9HFXLEIqrpRpT8zg/RxMPQv0r/jJTaYUrlE3uXhnmCnj+AQsDG451/
         EUquDDFPcdq6qZqoFf7XAZiE2S1fSQq94sAWA+YjIvjlvG4R8rUP1gl4GewWR+eTcg+L
         OtGcAodpql3gqVlUKiIZUEAUKBz0CjDDK3yDoW+LGSVmMlx/VNmlBpfb7w4bKu8+IiPC
         4WtlJxWpc2ZZ4v3TedSwMmtl0HIw83vBuq5/8Ns7+meabVHRc2PLmvpZ2V8O2tPhkRPW
         1fng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793090371; x=1793695171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1z6u6B82Pr3/hzW5YMWmMP5A7ww17vCOqXR2hKgLl9c=;
        b=xH86bZQIg/TAq7pWuWKxY5hlv7JoKGmwDCGH+7K0E7ESH7dFpreP8zCw6olZjJqncS
         kWbSyOEZ2GfPL7qu3AaNbkFyuMtCkucq62OaGHNlarPVjGT64+CnNQqckXrGjQ30mjev
         X5NEPgvs/TFv+xJnGte9ijpM/Sy8PNv9/JQJuY0i1wIEjhJL1NH6bpLKVL9Gvt+FX4md
         fUYUyMweyzquWncYlGyezGRwihhMTRnelmLwfVd+5pNKSGDdkFLAtXthFgkbcutyD09/
         EFVzrgvDnWyAnU+gFzCnmkljZfmSnAD6mw/rRbe9tJ6IElPVL+TNxGZuc30YVreG7GqH
         6a9w==
X-Forwarded-Encrypted: i=1; AKwUvBw2bUvyBYh7orVvzMZnBONW0ayh4CtNgdr6iFYfFmMS+RnssFzamtf0sC7qjwAyf8SFOzKgoGgTeZ4V5a3UdXU=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5C2pIxFVm2lVhvnYiXZvjkT2ECnmGm2Htumg5RKZhXUsJMHlW
	kta+05qTiQw740wWoO5CzHmDmQhuH4f8FTu8T9TmeGoD+uyFSo7GpAae
X-Gm-Gg: AYBFou18IEEnOtnvTVcfSUFXzZbDRNlICSrU6NrTl+5ENGJt+D9s/EuwjOMtyz6fQwo
	gqOLKClaYxlDEdrvjtwa6OSBjuPuQsoPcLaFG56tONqQmXGKWJy1cGgvUbLx9B65DktrOjj6tVJ
	vh68rQDJsl4KrYsNQayVjOV48P7SFcY6KxgnsK++ShsPs9uY17qYccm2JsKtog5+HciS4bRtXQf
	tkcLEC5tRO67gNkQIeFsW7Hzr7EeqiR0u6Dyk5EeRQk983hL8X6wej1Re4Gx5q/XQ/9sHyL8fsl
	yStzGaonSG4pKOWjBgSdafcOz3x1W1ICD/+wkPIS3sPT4/OtSuweGGgKSthTwTiaA+ehX7vzMtg
	GPEmWN/P0h8i5r22HVEJAao+7KO/XqmxZoVSV5HK5ylO/HjB3KN93im4CJUnCUoZuMoQWHwIjc3
	ep65z8rJTW+n1/88h96DLlyAiV7KZ/vAZZ2kICv1kGX2cJuOdBK9fkaArfUbOBLgGsjy9m0IHFs
	qMq5bNyBCAk0+/BrO/AZ3yJPWHSy/v3QLiN34x1JjiVAK6FpzIBMMAMDGsmgfTSTNR6RpiZ
X-Received: by 2002:a17:90a:e18c:b0:3ad:3e8:12 with SMTP id 98e67ed59e1d1-3adeb126491mr6478782a91.48.1793090370681;
        Tue, 27 Oct 2026 01:39:30 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae4041fafcsm3618951a91.0.2026.10.27.01.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:39:30 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: akpm@linux-foundation.org
Cc: hannes@cmpxchg.org,
	mhocko@kernel.org,
	roman.gushchin@linux.dev,
	shakeel.butt@linux.dev,
	muchun.song@linux.dev,
	penguin-kernel@I-love.SAKURA.ne.jp,
	tj@kernel.org,
	mkoutny@suse.com,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: [PATCH] selftests: cgroup: test memcg OOM on a process whose leader has exited
Date: Tue, 27 Oct 2026 16:39:23 +0800
Message-ID: <20261027083923.2412015-1-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026120248.2188024-1-zhanxusheng1024@gmail.com>
References: <20261026120248.2188024-1-zhanxusheng1024@gmail.com>
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

From: Zhan Xusheng <zhanxusheng@xiaomi.com>

Moving a process whose thread group leader has exited leaves the leader
behind, so its live threads sit in the destination memcg with nothing
listed in cgroup.procs.  Check that an OOM there still kills the process.

Without "mm: memcontrol: don't miss processes whose leader has exited in
OOM scans" no task is selected and the test fails after five seconds.

Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
 .../selftests/cgroup/test_memcontrol.c        | 123 ++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/tools/testing/selftests/cgroup/test_memcontrol.c b/tools/testing/selftests/cgroup/test_memcontrol.c
index bb673012dcf0..bddbe923fa42 100644
--- a/tools/testing/selftests/cgroup/test_memcontrol.c
+++ b/tools/testing/selftests/cgroup/test_memcontrol.c
@@ -4,6 +4,8 @@
 #include <linux/limits.h>
 #include <linux/oom.h>
 #include <fcntl.h>
+#include <sched.h>
+#include <signal.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
@@ -18,6 +20,7 @@
 #include <netdb.h>
 #include <errno.h>
 #include <sys/mman.h>
+#include <sys/syscall.h>
 #include <sys/sysinfo.h>
 
 #include "kselftest.h"
@@ -1417,6 +1420,125 @@ static bool memcg_sockets_disabled(void)
  * The TCP client interleaves reads from the socket with check whether
  * memory.current and memory.stat.sock are similar.
  */
+static int exited_leader_pipe[2];
+
+static int exited_leader_thread(void *arg)
+{
+	char c;
+
+	/* Wait until the process has been moved, then fill memory. */
+	if (read(exited_leader_pipe[0], &c, 1) == 1)
+		alloc_anon(NULL, (void *)MB(100));
+	for (;;)
+		pause();
+	return 0;
+}
+
+/* Start a thread and exit only the thread group leader. */
+static int exited_leader_fn(const char *cgroup, void *arg)
+{
+	const size_t stack_size = 64 * 1024;
+	char *stack = malloc(stack_size);
+
+	if (!stack)
+		return EXIT_FAILURE;
+
+	if (clone(exited_leader_thread, stack + stack_size,
+		  CLONE_VM | CLONE_FS | CLONE_FILES | CLONE_SIGHAND |
+		  CLONE_THREAD | CLONE_SYSVSEM, NULL) < 0)
+		return EXIT_FAILURE;
+
+	syscall(SYS_exit, 0);
+	return EXIT_FAILURE;
+}
+
+/*
+ * Moving a process whose leader has exited leaves the leader behind, so
+ * the destination's cgroup.procs is empty.  Check that the destination's
+ * OOM killer still finds the process using its memory.
+ */
+static int test_memcg_oom_exited_leader(const char *root)
+{
+	char *parent = NULL, *src = NULL, *dst = NULL;
+	int ret = KSFT_FAIL;
+	pid_t pid = -ESRCH;
+	int i;
+
+	if (pipe(exited_leader_pipe))
+		return KSFT_FAIL;
+
+	parent = cg_name(root, "memcg_test_exited_leader");
+	if (!parent)
+		goto cleanup;
+	src = cg_name(parent, "src");
+	if (!src)
+		goto cleanup;
+	dst = cg_name(parent, "dst");
+	if (!dst)
+		goto cleanup;
+
+	if (cg_create(parent))
+		goto cleanup;
+	if (cg_write(parent, "cgroup.subtree_control", "+memory"))
+		goto cleanup;
+	if (cg_create(src) || cg_create(dst))
+		goto cleanup;
+	if (cg_write(dst, "memory.max", "30M"))
+		goto cleanup;
+	if (cg_write(dst, "memory.swap.max", "0"))
+		goto cleanup;
+
+	pid = cg_run_nowait(src, exited_leader_fn, NULL);
+	if (pid < 0)
+		goto cleanup;
+
+	for (i = 0; i < 100; i++) {
+		if (!proc_read_strstr(pid, false, "stat", ") Z "))
+			break;
+		usleep(10000);
+	}
+	if (i == 100)
+		goto cleanup;
+
+	/* The exited leader stays in src, the live thread moves. */
+	if (cg_enter(dst, pid))
+		goto cleanup;
+	if (cg_read_strcmp(dst, "cgroup.procs", ""))
+		goto cleanup;
+
+	if (write(exited_leader_pipe[1], "x", 1) != 1)
+		goto cleanup;
+
+	if (cg_read_key_long_poll(dst, "memory.events", "oom_kill ", 1,
+				  50, 100000) != 1)
+		goto cleanup;
+
+	if (cg_read_strcmp_wait(dst, "cgroup.events", "populated 0\n"))
+		goto cleanup;
+
+	ret = KSFT_PASS;
+
+cleanup:
+	if (dst)
+		cg_write(dst, "cgroup.kill", "1");
+	if (pid > 0) {
+		kill(pid, SIGKILL);
+		waitpid(pid, NULL, 0);
+	}
+	close(exited_leader_pipe[0]);
+	close(exited_leader_pipe[1]);
+	if (dst)
+		cg_destroy(dst);
+	if (src)
+		cg_destroy(src);
+	if (parent)
+		cg_destroy(parent);
+	free(dst);
+	free(src);
+	free(parent);
+	return ret;
+}
+
 static int test_memcg_sock(const char *root)
 {
 	int bind_retries = 5, ret = KSFT_FAIL, pid, err;
@@ -1816,6 +1938,7 @@ struct memcg_test {
 	T(test_memcg_oom_group_leaf_events),
 	T(test_memcg_oom_group_parent_events),
 	T(test_memcg_oom_group_score_events),
+	T(test_memcg_oom_exited_leader),
 	T(test_memcg_inotify_delete_file),
 	T(test_memcg_inotify_delete_dir),
 };

base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
-- 
2.43.0

