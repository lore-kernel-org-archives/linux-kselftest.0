Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99FC3769ED
	for <linux-kselftest@vger.kernel.org>; Mon,  5 Oct 2026 07:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791184002; cv=none; b=tjIw/gO258KAyds3VsFCzUHzv58T+bqTdxChYixvWYT1FI6IQ/DEy9VfbVGCDosWWbka+qU8dwzOBtCvLeua/CusecGqoTWIo6WvbAfGECKNve9Y5u49A6oucOvdbjnbO5pcoz5Y6ftnXUGVlMqLmRUqGe/30t+XVLgCbbNiOyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791184002; c=relaxed/simple;
	bh=G4IEzobgfsKNObG/Hy6E+npwMk0v9FtMQFSITgNTZ6o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AeuEapVNL0YBmI093tCO8ATjqCetDh+O+xuFWxLGkBFMuIK9fMJPZOYI0G4hVrH29G/qlspbyxYdsi/t1+36R0LjmDh8gHEqq3mDv/JTq7tW6SOpuhJYmuIpFNp24/WlXFKyM48CGlqNnT91BHbWV471nL90fnbylvsGPAS6FvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VwzWLpiO; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VwzWLpiO"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so8521805e9.1
        for <linux-kselftest@vger.kernel.org>; Mon, 05 Oct 2026 00:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791183998; x=1791788798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xfZ3u+8kppu334roBh57uG8qfuX2GjTQB+h2l+yzJBo=;
        b=VwzWLpiOfztIUc1wRTElHPs1dVYNdJsHKJ0SapWDzpi400QVhdHFVOAef7WnUg9OHo
         5XXmmGLIRYjHoLcohVJfkTjGAVCjyXYJQYz3bP5/n/6hSpISDNySm1XM8dbIa+RlOF56
         qMkZbaTFR4JkzosFUm6d7RegIdB/oDLIcro23jzinxLVRqwN8AUYmXL7A0P0Q4GN1kgi
         vcatDzoisvl4fViwpYPG9XpNyLS99hH78RWLf1Zk/pE8moFMJVP1vamkSHn3P1Lf7qdy
         FdNy89BbcTyad7klBCZ717/kRfb81eIWL26zJJedQVmkPrNIvDON3OsoPPxl9m8243LW
         Y/7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791183998; x=1791788798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xfZ3u+8kppu334roBh57uG8qfuX2GjTQB+h2l+yzJBo=;
        b=tbcE9/q7U8JCvaUTahjWF5v4uRbW5W48pvZvkICKxvSJjSKYg9RKQybXwjhMxzC9oy
         07PlFwjhtsmt5dt29Pn54YGE0H19nVDxX4Rv3DNYaKLDmwkNqoUZTNLvdiR8ZgTZhrAg
         xHmY6YOF0isL3dppAmiOxjdhbwJIwmB192ouEo0DDBEUIlaRFMbYINbXA/J0sSi9q1lz
         52SbjHOittnzDlb0bMGK7LeARlfaAi9gGOUgRn+C8zPcFEkwjNJJRTbNyNBDmfnTVq8K
         UIY3X2Bfu+y5kVmHnJvzYdt9otLVUSDg+EoPK9+mlK1fYsQejeajhfalT15zCQxxdwZH
         4dTQ==
X-Forwarded-Encrypted: i=1; AKwUvBzBX7xzH6AaScS4uxlaPhbwdrXhRx3GaeExrS9QpCsvOnkWxOi1robtfzvn9iuejcb79Jj3GyZGRDCMvZpe13c=@vger.kernel.org
X-Gm-Message-State: AFuF++kMb5zT8OeSseGoKr4ZxHwHMcrlB3UcROBBrNaxEd5Fd6ZDByPY
	uUtI/xZcCVkCF6yOnogsNFQwJSfXiph4P7pZ3Mzzo2Lib/z95xt62LRq
X-Gm-Gg: AYBFou2lr5QZBFf3PaE0cCB9rILi/pL4FY8eiRbuNkf1/zdivOplbt2Gjyo41WI5xWP
	8+EtXBWkh6AsHFjY6rhElDL77hi38FzkzD/9cweBYB0pKTuNOkz94Ar2umTy96mdNSe/+c2BnIY
	Lpp3WDvhmhmKiN9CEf21e4g+KSo0CCYb+OGK0/9NsMIBQ2zVpVlCwUT9PQ35hlSlK6CNaZyV3Z6
	j1rqNdoGlASz10gnaK703ELYLifIgICLTc1oCmTJB7nC8iWYw5nYuoWB0117YQq/zZvCgXxgsp7
	mo0OTuHX+EUG3HAZ/Tus8BKx9OBLWl4kutulgCaTr8/IbN1q2qnnfwhhwlfg9xLyX4boONbpu3K
	iA5FHF81e241wKMH2r4Fa3Bt2DZYCwciqlR1iAKq1mJKof1EC5BU90G3ZTcNP5No0LXau/9lzBV
	ugNYD1TGoiOJYKUKf1RKDTnaRhoHQy8H6GPcG2/5+l/4t5mBOVDSJbuma+Dg46FgeKcPLP1w28n
	I5PfEwBYqfCWtDgiKdv/NcwPbPtsY2d5eexAwFFhm3OmkabEsojql3ItxilzfdF5hnaMPcvGnQw
	Fn84FbvQH8J572N6EL5Mc2SCGZg3Z0z41UVpTWj9emxbRDVO6tJo4Q4YTjqguRvb8xrnQzmNuGU
	1Ag==
X-Received: by 2002:a05:600c:46cc:b0:4a0:258a:8de4 with SMTP id 5b1f17b1804b1-4a0274e9c3dmr145299735e9.4.1791183998159;
        Mon, 05 Oct 2026 00:06:38 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b305-2001-39fa-3d24-821a-4eae.310.pool.telefonica.de. [2a02:3100:b305:2001:39fa:3d24:821a:4eae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a16bcb9a21sm283461465e9.10.2026.10.05.00.06.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 05 Oct 2026 00:06:37 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Harry Yoo <harry@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	David Hildenbrand <david@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	David Stevens <stevensd@google.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Shuah Khan <shuah@kernel.org>,
	Amery Hung <ameryhung@gmail.com>,
	Swaraj Gaikwad <swarajgaikwad1925@gmail.com>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	linux-rt-devel@lists.linux.dev,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	cgroups@vger.kernel.org
Subject: [RFC PATCH v2 3/3] selftests/bpf: exercise task storage from hrtimer_start
Date: Mon,  5 Oct 2026 09:06:25 +0200
Message-Id: <20261005070625.8871-4-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261005070625.8871-1-kmehltretter@gmail.com>
References: <20261005070625.8871-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No BPF selftest creates task-local storage from a tracepoint which runs
while an hrtimer base raw lock is held.  On PREEMPT_RT, this can exercise
allocator rtmutexes inside a raw-lock section.

Attach a program to tp_btf/hrtimer_start for the test process.  Create and
delete task storage on every event and trigger 1,000 events with
timerfd_settime().  Detach the program before reading its counters, then
require at least one successful allocation and balanced attempt and
outcome counters.  Allocation failure remains valid for the best-effort
no-lock API.

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 .../bpf/prog_tests/task_storage_hrtimer.c     | 50 +++++++++++++++++++
 .../bpf/progs/task_storage_hrtimer.c          | 48 ++++++++++++++++++
 2 files changed, 98 insertions(+)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/task_storage_hrtimer.c
 create mode 100644 tools/testing/selftests/bpf/progs/task_storage_hrtimer.c

diff --git a/tools/testing/selftests/bpf/prog_tests/task_storage_hrtimer.c b/tools/testing/selftests/bpf/prog_tests/task_storage_hrtimer.c
new file mode 100644
index 000000000000..216e66263bf6
--- /dev/null
+++ b/tools/testing/selftests/bpf/prog_tests/task_storage_hrtimer.c
@@ -0,0 +1,50 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <sys/timerfd.h>
+#include <unistd.h>
+
+#include <test_progs.h>
+#include "task_storage_hrtimer.skel.h"
+
+#define TRIGGER_COUNT 1000
+
+void test_task_storage_hrtimer(void)
+{
+	struct itimerspec timer = {
+		.it_value.tv_nsec = 1000000,
+	};
+	struct task_storage_hrtimer *skel;
+	int err, fd = -1, i;
+
+	skel = task_storage_hrtimer__open_and_load();
+	if (!ASSERT_OK_PTR(skel, "skel_open_and_load"))
+		return;
+
+	skel->bss->target_tgid = getpid();
+	err = task_storage_hrtimer__attach(skel);
+	if (!ASSERT_OK(err, "skel_attach"))
+		goto cleanup;
+
+	fd = timerfd_create(CLOCK_MONOTONIC, TFD_CLOEXEC);
+	if (!ASSERT_GE(fd, 0, "timerfd_create"))
+		goto cleanup;
+
+	for (i = 0; i < TRIGGER_COUNT; i++) {
+		err = timerfd_settime(fd, 0, &timer, NULL);
+		if (!ASSERT_OK(err, "timerfd_settime"))
+			goto cleanup;
+	}
+
+	task_storage_hrtimer__detach(skel);
+
+	ASSERT_GE(skel->bss->seen, TRIGGER_COUNT, "seen");
+	ASSERT_EQ(skel->bss->attempted, skel->bss->seen, "attempted");
+	ASSERT_GT(skel->bss->succeeded, 0, "succeeded");
+	ASSERT_EQ(skel->bss->delete_errors, 0, "delete_errors");
+	ASSERT_EQ(skel->bss->attempted,
+		  skel->bss->succeeded + skel->bss->failed, "attempts");
+
+cleanup:
+	if (fd >= 0)
+		close(fd);
+	task_storage_hrtimer__destroy(skel);
+}
diff --git a/tools/testing/selftests/bpf/progs/task_storage_hrtimer.c b/tools/testing/selftests/bpf/progs/task_storage_hrtimer.c
new file mode 100644
index 000000000000..a53c966f15b5
--- /dev/null
+++ b/tools/testing/selftests/bpf/progs/task_storage_hrtimer.c
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "vmlinux.h"
+#include <bpf/bpf_helpers.h>
+#include <bpf/bpf_tracing.h>
+
+char _license[] SEC("license") = "GPL";
+
+struct {
+	__uint(type, BPF_MAP_TYPE_TASK_STORAGE);
+	__uint(map_flags, BPF_F_NO_PREALLOC);
+	__type(key, int);
+	__type(value, long);
+} task_storage SEC(".maps");
+
+u32 target_tgid;
+u64 seen;
+u64 attempted;
+u64 succeeded;
+u64 failed;
+u64 delete_errors;
+
+SEC("tp_btf/hrtimer_start")
+int BPF_PROG(on_hrtimer_start, struct hrtimer *timer,
+	     enum hrtimer_mode mode, bool was_armed)
+{
+	struct task_struct *task;
+	long *storage;
+
+	if (bpf_get_current_pid_tgid() >> 32 != target_tgid)
+		return 0;
+
+	seen++;
+	attempted++;
+	task = bpf_get_current_task_btf();
+	storage = bpf_task_storage_get(&task_storage, task, NULL,
+				       BPF_LOCAL_STORAGE_GET_F_CREATE);
+	if (!storage) {
+		failed++;
+		return 0;
+	}
+
+	if (bpf_task_storage_delete(&task_storage, task))
+		delete_errors++;
+	else
+		succeeded++;
+
+	return 0;
+}
-- 
2.53.0

