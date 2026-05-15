Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232413B19DE
	for <linux-kselftest@vger.kernel.org>; Fri, 15 May 2026 14:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778855666; cv=none; b=HKsdm34KovMfRK1GHr1n7pMVcPvc3+8bWMDuCWl3HtwWT0cE9i2w0hI1yDIEUaQhnLOdG0dgqa9oyc+ktAn9pTQLBiF8pu56h/XIMHSQgJUd3BhZVZUrh9Qv32eci65NneKI6vOIsEuQZLYLVpu8xTq0i+YSmlv+dGhF0HLpC+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778855666; c=relaxed/simple;
	bh=syeQxVqhJ2GiwSNpK1FsPoGsHZsqQSWtndX+4kz5JdI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OXv7ZT9B4i+CYhM6TTyhcB86OiUUjuoZZ+C1Nmj0/i2Xz5BViG/tBQrkeAwU9HqBueSn4mqPElDzc/FFrgC5a2uNIRzppg7qDIbQoYN1z8OVhYyL92vDSWyqf3tbvhAuxmTKT4pLOHEq/GxbYZAne70g7F4KJ0EP2GDRwqJLyGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XZUWCuGz; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XZUWCuGz"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43d73422431so6780869f8f.2
        for <linux-kselftest@vger.kernel.org>; Fri, 15 May 2026 07:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778855662; x=1779460462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3aKqdeW9L9Zwr/B5n6kGucr9IN/pQ5rUwIlXKTZlA0g=;
        b=XZUWCuGz5wzfDZCUOip62u3Q1wSrC7FrXqmNFnefyI0aZUDCtk1cALQu3hTuvZz6VW
         KuJRxptyUoexrpm4idT1U49Th5okZkr0ZqdIwiHHMxVxcFHFx+Qir1znJ4anq/J8OEsh
         CDjul7wzG+1cYRclFOH+PyrtQ+bnmbAl65VlS0ZemuSQPFK9oBjd3x0OFloSwtH+BAC5
         cVp31inLM8JjP8pCE9JhOGY2W36iq9K3w4PZn1IspGCKEtlhw4KN1JsYLQ4jsV/nBDo9
         6XEpH5T1pifCWMbeb706RFxItv/LkjmRaoa3MD3PkgGezY7r13SfReWn4iacoxwWdm5H
         KqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778855662; x=1779460462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3aKqdeW9L9Zwr/B5n6kGucr9IN/pQ5rUwIlXKTZlA0g=;
        b=D+2Pw/Vigv1i98SldsQHYM+BnNeN8Hgw7s29XEbRjuWt8hxW2/z8jBWCc1LrOLbfoS
         onuPHcliyktFXL+wKj8HaQEIpc2kvFN8Ngj2uGlyYcb8Tnr4Y2JhHPVHzzmH10HP+vps
         mz4J/NgKzPrz0AgSvCdMNqwcrGC6AiqGdWGYIizhxSe/739OzDlb3qnmfnLggMWwBwNN
         H08x0lqXEy+3y+Kf25E1ez3IBIR1JueNgxPmLcG/g0R5WC1xcBOmcYxtZ8ajVXof7SAu
         Qx3zjPkdP7uh7gmcbtEgxy3ynnnYrdZz/BhYKCxnz9IyA84d2RQdCl7wkhIahrRKa8Kq
         JL2A==
X-Forwarded-Encrypted: i=1; AFNElJ/c4anQjRu6i6XSuwGegR4oE3Pbb8S/dAwax6Eqjm4BtddC5glCbYpXAe/k4vo8l0gLeC0AhWBSlz6SvAePjOk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh1L6L6hJjRx8dRjyT4yje0Tnvwdp2IiJUryT/y7Bl6zDCcbe5
	4WhupKw7Cy731UxO2m12qsS++/bkr3PgNDtn0rH8lEw1HUj6I/d6UrMe
X-Gm-Gg: Acq92OG1l7G71aiONYBEmnmoVCfunXsgEhkCUVQ3YVu9vsoCjRsXOzBvtrRevHRIz2t
	D2KMqYKEByKJWxkzGfV7uek3dwWew5bzm93hh4fgHpaG70if//CFBmUL9qnfosvYFyNPGKcCOQD
	w9CV8mX8WfbRRilpg8wf2asC3WlwNq2f+L8vDaAtLvzZFGTKU56rkIHYFxsFxNBv+eLEa0ipVoY
	Y/q9/doS37flmdyEeehi9RgD15nq7xFQjC1ViFEBffD+A/tupX3SsnpOW79M60vDU+ygAIHFqH8
	6T2casEQvEqwPNKVPP8fDLDfKRzb8oigMXoyKP6vCklQGZxH0L0ucvzlK7SNMbi+G5lzdYTPkZf
	AV/fHUbOZ6fpuy98DG/hbBZvRjHk1xOgPWFtUWJ/4pRrv9R0tkY9uQPfb8SW6lgqZQNqWDPrJDq
	ZNSt0gmeav4Cw0/Ob4CG8gAt38
X-Received: by 2002:a5d:5d01:0:b0:452:a293:4d91 with SMTP id ffacd0b85a97d-45e5c34b279mr6291492f8f.0.1778855662325;
        Fri, 15 May 2026 07:34:22 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8308:b093:bb00::bc35])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e767d16sm15773464f8f.6.2026.05.15.07.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 07:34:21 -0700 (PDT)
Sender: Alban Crequy <muadda@gmail.com>
From: Alban Crequy <alban.crequy@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Christian Brauner <brauner@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
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
	shuah@kernel.org,
	Usama Arif <usama.arif@linux.dev>,
	David Laight <david.laight.linux@gmail.com>
Subject: [PATCH v4 1/2] mm/process_vm_access: pidfd and nowait support for process_vm_readv/writev
Date: Fri, 15 May 2026 16:33:34 +0200
Message-ID: <20260515143335.739511-2-alban.crequy@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20260515143335.739511-1-alban.crequy@gmail.com>
References: <20260515143335.739511-1-alban.crequy@gmail.com>
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
not block on IO if the memory access causes a page fault. When a page
is not resident and would require IO to fault in, the syscall returns
a short read (the number of bytes successfully read before the fault)
or -1 with errno set to EFAULT if no bytes were read.

Additionally, this patch adds the flag PROCESS_VM_PIDFD to refer to the
remote process via PID file descriptor instead of PID. Such a file
descriptor can be obtained with pidfd_open(2). This is useful to avoid
the pid number being reused. It is unlikely to happen for debuggers
because they can monitor the target process termination in other ways
(ptrace), but can be helpful in some profiling scenarios. When using
PROCESS_VM_PIDFD, the first argument is a pidfd instead of a pid. If
the pidfd is invalid, the syscall returns -1 with errno set to EBADF.

If a given flag is unsupported, the syscall returns the error EINVAL
without checking the buffers. This gives a way to userspace to detect
whether the current kernel supports a specific flag:

  process_vm_readv(pid, NULL, 1, NULL, 1, PROCESS_VM_PIDFD)
  -> EINVAL if the kernel does not support the flag PROCESS_VM_PIDFD
     (before this patch)
  -> EFAULT if the kernel supports the flag (after this patch)

Suggested man page update for process_vm_readv(2):

  The flags argument is the bitwise OR of zero or more of these flags:

  PROCESS_VM_PIDFD (since Linux 7.x)
      The pid argument is a PID file descriptor (see pidfd_open(2))
      instead of a PID number. When using this flag, the existing
      ESRCH error applies if the process referred to by the pidfd
      has exited.

  PROCESS_VM_NOWAIT (since Linux 7.x)
      Do not block on IO. If a page in the remote address space is not
      resident and would require disk IO to fault in, the system call
      returns a short read or fails with EFAULT if no bytes were read.

  Additional error:

  EBADF  pid is not a valid file descriptor (PROCESS_VM_PIDFD only).

Signed-off-by: Alban Crequy <albancrequy@microsoft.com>
---
v4:
- Rename process_vm.h to process_vm_access.h (David Hildenbrand)
- Fix MAINTAINERS alphabetical sort order (David Hildenbrand)
- Document NOWAIT return value and PIDFD EBADF error (David Hildenbrand)
- Add suggested man page update text
  (David Hildenbrand, Christian Brauner, Mike Rapoport)
- Keep (1UL << N) in UAPI header (David Hildenbrand)

v3:
- Fix ERR_PTR handling for pidfd_get_task(): use IS_ERR()/PTR_ERR()
  for the pidfd path, matching process_madvise() (Usama Arif, Sashiko)

v2:
- Expand commit message with use-case motivation (David Hildenbrand)
- Use unsigned long consistently for pvm_flags parameter (David Hildenbrand)
- Add PROCESS_VM_SUPPORTED_FLAGS kernel-internal define (David Hildenbrand)
- Keep (1UL << N) in UAPI header: BIT() is defined in vdso/bits.h
  which is not exported to userspace, so UAPI headers using BIT() would
  break when included from userspace programs (David Hildenbrand)

 MAINTAINERS                            |  1 +
 include/uapi/linux/process_vm_access.h |  9 +++++++
 mm/process_vm_access.c                 | 34 +++++++++++++++++++-------
 3 files changed, 35 insertions(+), 9 deletions(-)
 create mode 100644 include/uapi/linux/process_vm_access.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 7492fefa447c..e64252164191 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16788,6 +16788,7 @@ F:	include/linux/pgtable.h
 F:	include/linux/ptdump.h
 F:	include/linux/vmpressure.h
 F:	include/linux/vmstat.h
+F:	include/uapi/linux/process_vm_access.h
 F:	fs/proc/meminfo.c
 F:	kernel/fork.c
 F:	mm/Kconfig
diff --git a/include/uapi/linux/process_vm_access.h b/include/uapi/linux/process_vm_access.h
new file mode 100644
index 000000000000..2196c9c46351
--- /dev/null
+++ b/include/uapi/linux/process_vm_access.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+#ifndef _UAPI_LINUX_PROCESS_VM_ACCESS_H
+#define _UAPI_LINUX_PROCESS_VM_ACCESS_H
+
+/* Flags for process_vm_readv/process_vm_writev */
+#define PROCESS_VM_PIDFD        (1UL << 0)
+#define PROCESS_VM_NOWAIT       (1UL << 1)
+
+#endif /* _UAPI_LINUX_PROCESS_VM_ACCESS_H */
diff --git a/mm/process_vm_access.c b/mm/process_vm_access.c
index 656d3e88755b..31004dd3c9e3 100644
--- a/mm/process_vm_access.c
+++ b/mm/process_vm_access.c
@@ -14,6 +14,9 @@
 #include <linux/ptrace.h>
 #include <linux/slab.h>
 #include <linux/syscalls.h>
+#include <linux/process_vm_access.h>
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
@@ -194,10 +202,18 @@ static ssize_t process_vm_rw_core(pid_t pid, struct iov_iter *iter,
 	}
 
 	/* Get process information */
-	task = find_get_task_by_vpid(pid);
-	if (!task) {
-		rc = -ESRCH;
-		goto free_proc_pages;
+	if (flags & PROCESS_VM_PIDFD) {
+		task = pidfd_get_task(pid, &f_flags);
+		if (IS_ERR(task)) {
+			rc = PTR_ERR(task);
+			goto free_proc_pages;
+		}
+	} else {
+		task = find_get_task_by_vpid(pid);
+		if (!task) {
+			rc = -ESRCH;
+			goto free_proc_pages;
+		}
 	}
 
 	mm = mm_access(task, PTRACE_MODE_ATTACH_REALCREDS);
@@ -215,7 +231,7 @@ static ssize_t process_vm_rw_core(pid_t pid, struct iov_iter *iter,
 	for (i = 0; i < riovcnt && iov_iter_count(iter) && !rc; i++)
 		rc = process_vm_rw_single_vec(
 			(unsigned long)rvec[i].iov_base, rvec[i].iov_len,
-			iter, process_pages, mm, task, vm_write);
+			iter, process_pages, mm, task, vm_write, flags);
 
 	/* copied = space before - space after */
 	total_len -= iov_iter_count(iter);
@@ -244,7 +260,7 @@ static ssize_t process_vm_rw_core(pid_t pid, struct iov_iter *iter,
  * @liovcnt: size of lvec array
  * @rvec: iovec array specifying where to copy to/from in the other process
  * @riovcnt: size of rvec array
- * @flags: currently unused
+ * @flags: process_vm_readv/writev flags
  * @vm_write: 0 if reading from other process, 1 if writing to other process
  *
  * Returns the number of bytes read/written or error code. May
@@ -266,7 +282,7 @@ static ssize_t process_vm_rw(pid_t pid,
 	ssize_t rc;
 	int dir = vm_write ? ITER_SOURCE : ITER_DEST;
 
-	if (flags != 0)
+	if (flags & ~PROCESS_VM_SUPPORTED_FLAGS)
 		return -EINVAL;
 
 	/* Check iovecs */
-- 
2.45.0

