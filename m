Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7794D3D3D03
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Apr 2026 14:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775660111; cv=none; b=rQvD0GQaKe/bKOKHg0QJipWT+Idkn9Q/U5PDJ34Em3+91ZJqgO/rCI+Ri/znxc33Sfx+8/mDz7h747VLNU7Ops6VfuqKAMDCAMrjBv9hSfvc/3dncyAaivu3+D/pnpY94YjJ5xrZY++Ka8g8hsd7Hq79BYK7j74O11mNngPVVIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775660111; c=relaxed/simple;
	bh=QLu/1dlSGUEA+04A2M/3X4XfnrGk+BU4pH2CvoOsF1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V8ZRCX0lpUYw6vCuGV1AtQtSY+/gdl3UcAsnd5hZ0HtOSWsmQ3/D/u1BDNWzcSOAVesbJWQvIBYd/zzgsrqI+NVkbejulSsbczk7AJtr271QeEpP0+ZQg2dqu6XpOnbZP3I4VZ9w17X269kAu0BQ2qBCLCCQS+5T9fHEYO4lTzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JM2kvNIa; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JM2kvNIa"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43d23305225so4863175f8f.2
        for <linux-kselftest@vger.kernel.org>; Wed, 08 Apr 2026 07:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775660108; x=1776264908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3wgIIDUfJ0o70u9l3Zid2L+X0IsBnuKW+IYefvDTKd0=;
        b=JM2kvNIa6n9NkFdGu06ZDq9/yIgPw+dgf0PmbuzNCebkuU5nmwtARZvpKYkPJc1VuO
         DTm3B+DG4joNwOzeuHNHHFUpNis9Nu7OHzCN+q7+I0/lCUHcENwwam/y9/RcRBGdXAdF
         LCB1JLk1tuOEtNUYo0MDOD9qzg4qBi86p5Hr3VHTu8dLlIZzwdKJZ5iDnK6UR8E23ROg
         Vaa5xoiPeFzgYDmWF9TlTvMBvfydoR7uBiulVj/KeDQshSwZxCzqyDFfkh/D49zXayBJ
         WP0VEGaNr1/Qf8bJ8+m77P7hdsTbOts216pa5EoYf8ex+GJehLcdOaBTmKLiiDqs03Zc
         yufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775660108; x=1776264908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3wgIIDUfJ0o70u9l3Zid2L+X0IsBnuKW+IYefvDTKd0=;
        b=rLVyWt46fBKhI8a/XkyGlJ6mPOf4VAJLlzsI++YloO43lcdOFbIPdmnL4BmZDSnI5j
         63JXjR/yatLcb6u9FO/QIlALK5MNWmUmj7dxTUpuC8tbnOqgNETAgc8HhhJXPKxPFIZi
         tkSvvsXX0yCMLPFpm+V8lPe1PUKrOcvVGjNCteDhNHyI8b9xjok6NgZjJEQVzDZ+obNP
         YFT3/A2HZmFe+J6Tk9lfBL4TnGrtEga+E+LfeuWo0jqJ928m4VX/uMPGT2qDstI0r2/1
         iNoDypEHOPu7J8I5Afa1PN+hWbHvUmzqEGqtDvGRzH/7prqeCEaCWnBXkgGGIPnChU47
         x6EA==
X-Forwarded-Encrypted: i=1; AJvYcCUjsReLdfowy4ytkJUnnB4d8l+TE/alE+q9LkTHRCIr47Wbh+3uqfJrdIa9T0kcvic955vCYdkmPuXvqzmqCb0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTc2YWPIeLOkRNYVp+jWwfqj1L9t6SvSB3EB4twVpd5TY/Fs9U
	RoSO9i/jqqN6ydcHlC6AFoBFeMbJ02p4+K5poFqsm2HNSpweLRBngCT2
X-Gm-Gg: AeBDieuPUWdBR8iftQCz2wv1U1L8+pOPVivRjEwPXguYVQcGQsac48/O/hhPNVDCtHy
	NEIAtSQMlKTzAFgA4ENg56XSy7B9CLBgwTB6PGdThYpQjMCxc3/dj1hC9qZc3w923pUjYTN1e7K
	pmBBbAn56SK//zkBAuk2395gHKdF6R7+wUCBmedsCzgUrW530o4rQsu9OVrwg6m6djX7YEeJtcH
	/WSvCc/n8rgxf53F8BYGao7rXwvgyc85Kg/f4Zz6Js9gu4uPNHXRm4XExSsj8pss6vt3CtPWLNY
	2sywAEZhaKVtvqB4waT4c984oGNcoajEE26Vi9oOPoxvPMhqBalLP9505JLwSri2VssOsYLqYWD
	YkCUp46dA6wg4jFU1DxVPJVJaCWfoucy84QXwqpgB6ZxCAWCA/OiCZnXKSoBEUITLBu/++bmsUA
	Sxo7Z8u5l4QsDzwgzS0rRlQ4Xh
X-Received: by 2002:a05:6000:40cc:b0:43c:ef4f:79cd with SMTP id ffacd0b85a97d-43d292e70e0mr31995209f8f.48.1775660107660;
        Wed, 08 Apr 2026 07:55:07 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8308:b093:bb00::3006])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f5294sm55762103f8f.35.2026.04.08.07.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 07:55:07 -0700 (PDT)
Sender: Alban Crequy <muadda@gmail.com>
From: Alban Crequy <alban.crequy@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Christian Brauner <brauner@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alban Crequy <alban.crequy@gmail.com>,
	Alban Crequy <albancrequy@microsoft.com>,
	Peter Xu <peterx@redhat.com>,
	Willy Tarreau <w@1wt.eu>,
	linux-kselftest@vger.kernel.org,
	shuah@kernel.org
Subject: [PATCH v2 1/2] mm/process_vm_access: pidfd and nowait support for process_vm_readv/writev
Date: Wed,  8 Apr 2026 16:54:35 +0200
Message-ID: <20260408145436.843538-2-alban.crequy@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20260408145436.843538-1-alban.crequy@gmail.com>
References: <20260408145436.843538-1-alban.crequy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alban Crequy <albancrequy@microsoft.com>

There are two categories of users for process_vm_readv:

1. Debuggers like GDB or strace.

   When a debugger attempts to read the target memory and triggers a
   page fault, the page fault needs to be resolved so that the debugger
   can accurately interpret the memory. A debugger is typically attached
   to a single process.

2. Profilers like OpenTelemetry eBPF Profiler.

   The profiler uses a perf event to get stack traces from all
   processes at 20Hz (20 stack traces to resolve per second). For
   interpreted languages (Ruby, Python, etc.), the profiler uses
   process_vm_readv to get the correct symbols. In this case,
   performance is the most important. It is fine if some stack traces
   cannot be resolved as long as it is not statistically significant.

The current behaviour of process_vm_readv is to resolve page faults in
the target VM. This is as desired for debuggers, but unwelcome for
profilers because the page fault resolution could take a lot of time
depending on the backing filesystem. Additionally, since profilers
monitor all processes, we don't want a slow page fault resolution for
one target process slowing down the monitoring for all other target
processes.

This patch adds the flag PROCESS_VM_NOWAIT, so the caller can choose to
not block on IO if the memory access causes a page fault.

Additionally, this patch adds the flag PROCESS_VM_PIDFD to refer to the
remote process via PID file descriptor instead of PID. Such a file
descriptor can be obtained with pidfd_open(2). This is useful to avoid
the pid number being reused. It is unlikely to happen for debuggers
because they can monitor the target process termination in other ways
(ptrace), but can be helpful in some profiling scenarios.

If a given flag is unsupported, the syscall returns the error EINVAL
without checking the buffers. This gives a way to userspace to detect
whether the current kernel supports a specific flag:

  process_vm_readv(pid, NULL, 1, NULL, 1, PROCESS_VM_PIDFD)
  -> EINVAL if the kernel does not support the flag PROCESS_VM_PIDFD
     (before this patch)
  -> EFAULT if the kernel supports the flag (after this patch)

Signed-off-by: Alban Crequy <albancrequy@microsoft.com>
---
v2:
- Expand commit message with use-case motivation (David Hildenbrand)
- Use unsigned long consistently for pvm_flags parameter (David Hildenbrand)
- Add PROCESS_VM_SUPPORTED_FLAGS kernel-internal define (David Hildenbrand)
- Keep (1UL << N) in UAPI header: BIT() is defined in vdso/bits.h
  which is not exported to userspace, so UAPI headers using BIT() would
  break when included from userspace programs (David Hildenbrand)

 MAINTAINERS                     |  1 +
 include/uapi/linux/process_vm.h |  9 +++++++++
 mm/process_vm_access.c          | 24 ++++++++++++++++++------
 3 files changed, 28 insertions(+), 6 deletions(-)
 create mode 100644 include/uapi/linux/process_vm.h

diff --git a/MAINTAINERS b/MAINTAINERS
index c3fe46d7c4bc..f7168c5d7acc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16678,6 +16678,7 @@ F:	include/linux/pgtable.h
 F:	include/linux/ptdump.h
 F:	include/linux/vmpressure.h
 F:	include/linux/vmstat.h
+F:	include/uapi/linux/process_vm.h
 F:	kernel/fork.c
 F:	mm/Kconfig
 F:	mm/debug.c
diff --git a/include/uapi/linux/process_vm.h b/include/uapi/linux/process_vm.h
new file mode 100644
index 000000000000..4168e09f3f4e
--- /dev/null
+++ b/include/uapi/linux/process_vm.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+#ifndef _UAPI_LINUX_PROCESS_VM_H
+#define _UAPI_LINUX_PROCESS_VM_H
+
+/* Flags for process_vm_readv/process_vm_writev */
+#define PROCESS_VM_PIDFD        (1UL << 0)
+#define PROCESS_VM_NOWAIT       (1UL << 1)
+
+#endif /* _UAPI_LINUX_PROCESS_VM_H */
diff --git a/mm/process_vm_access.c b/mm/process_vm_access.c
index 656d3e88755b..c6a25e9993e1 100644
--- a/mm/process_vm_access.c
+++ b/mm/process_vm_access.c
@@ -14,6 +14,9 @@
 #include <linux/ptrace.h>
 #include <linux/slab.h>
 #include <linux/syscalls.h>
+#include <linux/process_vm.h>
+
+#define PROCESS_VM_SUPPORTED_FLAGS (PROCESS_VM_PIDFD | PROCESS_VM_NOWAIT)
 
 /**
  * process_vm_rw_pages - read/write pages from task specified
@@ -68,6 +71,7 @@ static int process_vm_rw_pages(struct page **pages,
  * @mm: mm for task
  * @task: task to read/write from
  * @vm_write: 0 means copy from, 1 means copy to
+ * @pvm_flags: PROCESS_VM_* flags
  * Returns 0 on success or on failure error code
  */
 static int process_vm_rw_single_vec(unsigned long addr,
@@ -76,7 +80,8 @@ static int process_vm_rw_single_vec(unsigned long addr,
 				    struct page **process_pages,
 				    struct mm_struct *mm,
 				    struct task_struct *task,
-				    int vm_write)
+				    int vm_write,
+				    unsigned long pvm_flags)
 {
 	unsigned long pa = addr & PAGE_MASK;
 	unsigned long start_offset = addr - pa;
@@ -91,6 +96,8 @@ static int process_vm_rw_single_vec(unsigned long addr,
 
 	if (vm_write)
 		flags |= FOLL_WRITE;
+	if (pvm_flags & PROCESS_VM_NOWAIT)
+		flags |= FOLL_NOWAIT;
 
 	while (!rc && nr_pages && iov_iter_count(iter)) {
 		int pinned_pages = min_t(unsigned long, nr_pages, PVM_MAX_USER_PAGES);
@@ -141,7 +148,7 @@ static int process_vm_rw_single_vec(unsigned long addr,
  * @iter: where to copy to/from locally
  * @rvec: iovec array specifying where to copy to/from in the other process
  * @riovcnt: size of rvec array
- * @flags: currently unused
+ * @flags: process_vm_readv/writev flags
  * @vm_write: 0 if reading from other process, 1 if writing to other process
  *
  * Returns the number of bytes read/written or error code. May
@@ -163,6 +170,7 @@ static ssize_t process_vm_rw_core(pid_t pid, struct iov_iter *iter,
 	unsigned long nr_pages_iov;
 	ssize_t iov_len;
 	size_t total_len = iov_iter_count(iter);
+	unsigned int f_flags;
 
 	/*
 	 * Work out how many pages of struct pages we're going to need
@@ -194,7 +202,11 @@ static ssize_t process_vm_rw_core(pid_t pid, struct iov_iter *iter,
 	}
 
 	/* Get process information */
-	task = find_get_task_by_vpid(pid);
+	if (flags & PROCESS_VM_PIDFD)
+		task = pidfd_get_task(pid, &f_flags);
+	else
+		task = find_get_task_by_vpid(pid);
+
 	if (!task) {
 		rc = -ESRCH;
 		goto free_proc_pages;
@@ -215,7 +227,7 @@ static ssize_t process_vm_rw_core(pid_t pid, struct iov_iter *iter,
 	for (i = 0; i < riovcnt && iov_iter_count(iter) && !rc; i++)
 		rc = process_vm_rw_single_vec(
 			(unsigned long)rvec[i].iov_base, rvec[i].iov_len,
-			iter, process_pages, mm, task, vm_write);
+			iter, process_pages, mm, task, vm_write, flags);
 
 	/* copied = space before - space after */
 	total_len -= iov_iter_count(iter);
@@ -244,7 +256,7 @@ static ssize_t process_vm_rw_core(pid_t pid, struct iov_iter *iter,
  * @liovcnt: size of lvec array
  * @rvec: iovec array specifying where to copy to/from in the other process
  * @riovcnt: size of rvec array
- * @flags: currently unused
+ * @flags: process_vm_readv/writev flags
  * @vm_write: 0 if reading from other process, 1 if writing to other process
  *
  * Returns the number of bytes read/written or error code. May
@@ -266,7 +278,7 @@ static ssize_t process_vm_rw(pid_t pid,
 	ssize_t rc;
 	int dir = vm_write ? ITER_SOURCE : ITER_DEST;
 
-	if (flags != 0)
+	if (flags & ~PROCESS_VM_SUPPORTED_FLAGS)
 		return -EINVAL;
 
 	/* Check iovecs */
-- 
2.45.0

