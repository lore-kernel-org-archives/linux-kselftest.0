Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895C642B74B
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 12:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777379365; cv=none; b=LreMWwAJG+o21WRpH3QRq+5L/QCv9Us0pJaix5U9ojgSN1WkcafabhbEjuq9Tx11yk2DCdjByScfF5mEkaYB1ldA2+ODKfoJawvfkDRa/Hzp615oMScf5QJjqZaPHs0/2/c5h+uM+8GGkmI299d7JKCP3ayiWg6kQF40EVV9AVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777379365; c=relaxed/simple;
	bh=48hLkLcuqglnw2BgHRdVCcu2MVzzLFSBoZev3z+q95c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IqNvtF41R+GXXsSotjLASa4iGgBauC+L95pENNNfVg/8BQRhx8rO30+l2+rQRqlEfWoeU96DoyewHJGdY4RUA4N8e6L2BOKnYwaD1dxpoqe4koeGztawmkJrgPeMwcwW3LbNe5a+jvC+9tYEueoqwXIHpZJCYyPcYkZlPoenEYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QYQOpq5u; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QYQOpq5u"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48374014a77so146798065e9.3
        for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 05:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777379356; x=1777984156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pxy6ZGKNTBMlQ919OQUf8LPjYtJBrijDPBcvlSgOSGs=;
        b=QYQOpq5u8mbDeIidc69BEDGbE2PrXb9o2oHGjkOadDtnSvP/Bdy2uUPRSLFriLagPf
         ubXyrFfq+YlIPvKKFoCDzPqz54Vt6k0+9bA/T87O+QaFPdHhY7SA/xrWiukRH8pSAvvM
         nEarAFLyptzByVkTxVSeae9Q28XVxnQ2NRSVuQc94RuGdxU+1pHfllaVQ3F0ijvoY0Vz
         Rlb5Fy2b/H9R7iopb5nE65mDHDQKnZVIoFJX5MV1OcEPuYmk6Y36jlyvKrx4pLByKX1f
         dE7FDbroGWK9VAwjXn7e+hOmdorrVGpt3xWnJS0oTF+TdQuIvJvfwQzVbvPWnam3Wolf
         VoPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777379356; x=1777984156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pxy6ZGKNTBMlQ919OQUf8LPjYtJBrijDPBcvlSgOSGs=;
        b=OfPAVy2MgV5qjAxUQuZCMejMGbhP0xHrlqBVhTTJiG7LftNpBm7V+evhL9ILHHcWKB
         rKLd4IMOdI918gYuxPtxDbKGyKcPP2l4s4f58GtxhNvjp/zvKoLUXPRITRZkq3wMMV3I
         7ONjC9v7XbwGaIzzQOpUcywseFl+hxlZlBsEl5QJU67iRixYGsvPxqsLRr83bi4u6UDE
         DN4/8oGvFzD8iRk7JmtFvSEfo7IfYFolNrNrYCx3Cmr02vSTLVP/1BtWqGJ0BtHUcjv2
         ISsxIZaeMz8oI6BvaklbumJC0UusYMt5UeQ7VRt5G2f0/iQYFu3nzi/yfGRbhilaPb2D
         bhfg==
X-Forwarded-Encrypted: i=1; AFNElJ97n1giN5SEJC6f2UhGc6VpHJhlGsNyqT3U7SCV3jrHt8njRouB89ux+LtgWZAaTYFx+EoWbUTRLeb7kLu5ub8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeuDFy3/0grBds3LpLs8jwNnqgiPQTaWfFmg/4JqB/lGoKj0Ky
	wwS9aqjkf95nmzbn2bv1RCVN9cu2OFqdJjli/189/AMfDH3EWvFd5kun
X-Gm-Gg: AeBDiesX5VrVh6rtw+cv4k67ZVUJHc/VxTtzdhNRg5utipr+H+8/TlcsZsm1csxrIAu
	pAtTOE5qrzvJ4na5PpSVt1ddoUYPBy0VZzecgIsSWhno0GyAOl3+yog6u5bllzFUA+tbCUTzJb3
	rqh21DPHzonpHaXK+ee9ANwwQDU/p6lDHTrrvh8JB734dNgqRKO4dYII2Yw5GGYw7UjJShbpyVc
	WbnD1pT5q++g9Dtmk4M1vfEMFVJwOSgP2D+eFvT4DMokW2HTgRWP/02VcHlZQ5RrNiOw0ef/6GQ
	fiwZEZVy5ib8KExeVulT8mm7WhGv0KbTTwnR9PkPmduu+AFLSAQj2O6aNDCpliUZGjq7TiT+cW5
	DRikzAFYIoXoDP0fCZtN5xqhNEGny6zhBBu+87jJUb5FjIE35zMIAJfMq0x11CUQLw3eGZQlu+d
	Bam81wVO0AD+ez6xkU9CARt08dNw0qiWhupvnOLA8vFYw2SJGPSZHkDjx5vtQBqV0nzGTS2ydW0
	Q==
X-Received: by 2002:a05:600c:1e8b:b0:489:1ff1:74d3 with SMTP id 5b1f17b1804b1-48a77b146e0mr45595125e9.20.1777379355653;
        Tue, 28 Apr 2026 05:29:15 -0700 (PDT)
Received: from localhost.localdomain (90-181-198-146.rco.o2.cz. [90.181.198.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a77af1b86sm47479045e9.5.2026.04.28.05.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 05:29:15 -0700 (PDT)
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
	shuah@kernel.org,
	Usama Arif <usama.arif@linux.dev>,
	David Laight <david.laight.linux@gmail.com>
Subject: [PATCH v3 1/2] mm/process_vm_access: pidfd and nowait support for process_vm_readv/writev
Date: Tue, 28 Apr 2026 14:28:25 +0200
Message-ID: <20260428122826.339550-2-alban.crequy@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20260428122826.339550-1-alban.crequy@gmail.com>
References: <20260428122826.339550-1-alban.crequy@gmail.com>
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

 MAINTAINERS                     |  1 +
 include/uapi/linux/process_vm.h |  9 +++++++++
 mm/process_vm_access.c          | 34 ++++++++++++++++++++++++---------
 3 files changed, 35 insertions(+), 9 deletions(-)
 create mode 100644 include/uapi/linux/process_vm.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 2fb1c75afd16..0f6ce21d6235 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16786,6 +16786,7 @@ F:	include/linux/ptdump.h
 F:	include/linux/vmpressure.h
 F:	include/linux/vmstat.h
 F:	fs/proc/meminfo.c
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
index 656d3e88755b..dacef50be0be 100644
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

