Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A082C3914F8;
	Wed, 29 Apr 2026 06:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777444875; cv=none; b=RMKT72v7Rtjhu3T2AnGn3rCU1zXmWLuY6T94CsabIOVoLZqj2NBTc4MIDvgrft8pvQBr8atWP3ygn2tJzS0hZFEHJrtAQxh0qn6rGE9BuAbaskc7Lr121C6v4wWdDugc1h+dQf+iMHislVaBn+auyUQTKmyM/VJY8i40H19fuGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777444875; c=relaxed/simple;
	bh=34iTrriJGBhonEZFig54qz1hPF/cmuRTcYTDzGLT6rE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OfWcDf4T0boZGg9nwdeb+aqclGdRFOr5QbKSrPrbFWsGc4hQXVK1Sz+ZoEqQ/jU2D8E+nyP+KZt+p89cJNGu9BHhWhAOJAt4M2LFHAuXN66gBGSgVIZrrJMeT04+NfiuUcd3M4YrE+7hkP7MGez+cNptTxIJbRi84ckY2MsiSAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V6AiIgML; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V6AiIgML"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15C53C2BCF5;
	Wed, 29 Apr 2026 06:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777444875;
	bh=34iTrriJGBhonEZFig54qz1hPF/cmuRTcYTDzGLT6rE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V6AiIgML2tBs8CEIEhaPjcO0tgaxckdky59xlsizuUf7ODpdAN/WYZsrCzIszL6OO
	 +MXzIqPdTNlG5zNN1R4ucSaVrE6C7u+kt4KzOlD5/NAkHD8uvP9qhPVzTcYI/YybzZ
	 RDywbYIrDObILYz85YV9e2s7a7UvmV6KZBxXWF1RfK2M7hC9WrDWYpAfU4Oedj0kH7
	 Q6kmsrK6+lDqXY1xzsGB90FOtDSDU9HUNYZ12oYDr1gLbhre8iDZUCjXAeoAMBZ3fK
	 Ud7c3yLUiz7a/DTv57IG27MvhXsbet3tcALpuzTxlPkXOkZlTcB2iGoo+A/ck42nw+
	 Ah2I7c35jnTWQ==
Date: Wed, 29 Apr 2026 08:41:05 +0200
From: Christian Brauner <brauner@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Alban Crequy <alban.crequy@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Alban Crequy <albancrequy@microsoft.com>, Peter Xu <peterx@redhat.com>, Willy Tarreau <w@1wt.eu>, 
	linux-kselftest@vger.kernel.org, shuah@kernel.org, Usama Arif <usama.arif@linux.dev>, 
	David Laight <david.laight.linux@gmail.com>
Subject: Re: [PATCH v3 1/2] mm/process_vm_access: pidfd and nowait support
 for process_vm_readv/writev
Message-ID: <20260429-gesessen-eschenholz-4b7f54a5a8f5@brauner>
References: <20260428122826.339550-1-alban.crequy@gmail.com>
 <20260428122826.339550-2-alban.crequy@gmail.com>
 <8b29da5b-e260-4b77-a640-8abb447291d1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8b29da5b-e260-4b77-a640-8abb447291d1@kernel.org>

On Tue, Apr 28, 2026 at 10:05:49PM +0200, David Hildenbrand (Arm) wrote:
> On 4/28/26 14:28, Alban Crequy wrote:
> > From: Alban Crequy <albancrequy@microsoft.com>
> 
> Hi,
> 
> some more smaller comments. Overall, LGTM.
> 
> > 
> > There are two categories of users for process_vm_readv:
> > 
> > 1. Debuggers like GDB or strace.
> > 
> >    When a debugger attempts to read the target memory and triggers a
> >    page fault, the page fault needs to be resolved so that the debugger
> >    can accurately interpret the memory. A debugger is typically attached
> >    to a single process.
> > 
> > 2. Profilers like OpenTelemetry eBPF Profiler.
> > 
> >    The profiler uses a perf event to get stack traces from all
> >    processes at 20Hz (20 stack traces to resolve per second). For
> >    interpreted languages (Ruby, Python, etc.), the profiler uses
> >    process_vm_readv to get the correct symbols. In this case,
> >    performance is the most important. It is fine if some stack traces
> >    cannot be resolved as long as it is not statistically significant.
> > 
> > The current behaviour of process_vm_readv is to resolve page faults in
> > the target VM. This is as desired for debuggers, but unwelcome for
> > profilers because the page fault resolution could take a lot of time
> > depending on the backing filesystem. Additionally, since profilers
> > monitor all processes, we don't want a slow page fault resolution for
> > one target process slowing down the monitoring for all other target
> > processes.
> > 
> > This patch adds the flag PROCESS_VM_NOWAIT, so the caller can choose to
> > not block on IO if the memory access causes a page fault.
> 
> What is the expected return value to user space if we run into this case?
> 
> And in the same context: Will you send a man page update? :)
> 
> > 
> > Additionally, this patch adds the flag PROCESS_VM_PIDFD to refer to the
> > remote process via PID file descriptor instead of PID. Such a file
> > descriptor can be obtained with pidfd_open(2). This is useful to avoid
> > the pid number being reused. It is unlikely to happen for debuggers
> > because they can monitor the target process termination in other ways
> > (ptrace), but can be helpful in some profiling scenarios.
> > 
> > If a given flag is unsupported, the syscall returns the error EINVAL
> > without checking the buffers. This gives a way to userspace to detect
> > whether the current kernel supports a specific flag:
> > 
> >   process_vm_readv(pid, NULL, 1, NULL, 1, PROCESS_VM_PIDFD)
> >   -> EINVAL if the kernel does not support the flag PROCESS_VM_PIDFD
> >      (before this patch)
> >   -> EFAULT if the kernel supports the flag (after this patch)
> > 
> > Signed-off-by: Alban Crequy <albancrequy@microsoft.com>
> > ---
> > v3:
> > - Fix ERR_PTR handling for pidfd_get_task(): use IS_ERR()/PTR_ERR()
> >   for the pidfd path, matching process_madvise() (Usama Arif, Sashiko)
> > 
> > v2:
> > - Expand commit message with use-case motivation (David Hildenbrand)
> > - Use unsigned long consistently for pvm_flags parameter (David Hildenbrand)
> > - Add PROCESS_VM_SUPPORTED_FLAGS kernel-internal define (David Hildenbrand)
> > - Keep (1UL << N) in UAPI header: BIT() is defined in vdso/bits.h
> >   which is not exported to userspace, so UAPI headers using BIT() would
> >   break when included from userspace programs (David Hildenbrand)
> > 
> >  MAINTAINERS                     |  1 +
> >  include/uapi/linux/process_vm.h |  9 +++++++++
> >  mm/process_vm_access.c          | 34 ++++++++++++++++++++++++---------
> >  3 files changed, 35 insertions(+), 9 deletions(-)
> >  create mode 100644 include/uapi/linux/process_vm.h
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 2fb1c75afd16..0f6ce21d6235 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -16786,6 +16786,7 @@ F:	include/linux/ptdump.h
> >  F:	include/linux/vmpressure.h
> >  F:	include/linux/vmstat.h
> >  F:	fs/proc/meminfo.c
> > +F:	include/uapi/linux/process_vm.h
> 
> We try to sort this alphabetically. Sometimes we failed. Likely this should just
> go to one more line up.
> 
> >  F:	kernel/fork.c
> >  F:	mm/Kconfig
> >  F:	mm/debug.c
> > diff --git a/include/uapi/linux/process_vm.h b/include/uapi/linux/process_vm.h
> > new file mode 100644
> > index 000000000000..4168e09f3f4e
> > --- /dev/null
> > +++ b/include/uapi/linux/process_vm.h
> 
> Thinking out loud: the c file is called "process_vm_access.c", should we name
> the header like that as well?
> 
> > @@ -0,0 +1,9 @@
> > +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> > +#ifndef _UAPI_LINUX_PROCESS_VM_H
> > +#define _UAPI_LINUX_PROCESS_VM_H
> > +
> > +/* Flags for process_vm_readv/process_vm_writev */
> > +#define PROCESS_VM_PIDFD        (1UL << 0)
> > +#define PROCESS_VM_NOWAIT       (1UL << 1)
> 
> Should we use BIT here? I see some usage in other uapi headers (e.g., tcp.h)
> 
> > +
> > +#endif /* _UAPI_LINUX_PROCESS_VM_H */
> > diff --git a/mm/process_vm_access.c b/mm/process_vm_access.c
> > index 656d3e88755b..dacef50be0be 100644
> > --- a/mm/process_vm_access.c
> > +++ b/mm/process_vm_access.c
> > @@ -14,6 +14,9 @@
> >  #include <linux/ptrace.h>
> >  #include <linux/slab.h>
> >  #include <linux/syscalls.h>
> > +#include <linux/process_vm.h>
> > +
> > +#define PROCESS_VM_SUPPORTED_FLAGS (PROCESS_VM_PIDFD | PROCESS_VM_NOWAIT)
> >  
> >  /**
> >   * process_vm_rw_pages - read/write pages from task specified
> > @@ -68,6 +71,7 @@ static int process_vm_rw_pages(struct page **pages,
> >   * @mm: mm for task
> >   * @task: task to read/write from
> >   * @vm_write: 0 means copy from, 1 means copy to
> > + * @pvm_flags: PROCESS_VM_* flags
> >   * Returns 0 on success or on failure error code
> >   */
> >  static int process_vm_rw_single_vec(unsigned long addr,
> > @@ -76,7 +80,8 @@ static int process_vm_rw_single_vec(unsigned long addr,
> >  				    struct page **process_pages,
> >  				    struct mm_struct *mm,
> >  				    struct task_struct *task,
> > -				    int vm_write)
> > +				    int vm_write,
> > +				    unsigned long pvm_flags)
> >  {
> >  	unsigned long pa = addr & PAGE_MASK;
> >  	unsigned long start_offset = addr - pa;
> > @@ -91,6 +96,8 @@ static int process_vm_rw_single_vec(unsigned long addr,
> >  
> >  	if (vm_write)
> >  		flags |= FOLL_WRITE;
> > +	if (pvm_flags & PROCESS_VM_NOWAIT)
> > +		flags |= FOLL_NOWAIT;
> >  
> >  	while (!rc && nr_pages && iov_iter_count(iter)) {
> >  		int pinned_pages = min_t(unsigned long, nr_pages, PVM_MAX_USER_PAGES);
> > @@ -141,7 +148,7 @@ static int process_vm_rw_single_vec(unsigned long addr,
> >   * @iter: where to copy to/from locally
> >   * @rvec: iovec array specifying where to copy to/from in the other process
> >   * @riovcnt: size of rvec array
> > - * @flags: currently unused
> > + * @flags: process_vm_readv/writev flags
> >   * @vm_write: 0 if reading from other process, 1 if writing to other process
> >   *
> >   * Returns the number of bytes read/written or error code. May
> > @@ -163,6 +170,7 @@ static ssize_t process_vm_rw_core(pid_t pid, struct iov_iter *iter,
> >  	unsigned long nr_pages_iov;
> >  	ssize_t iov_len;
> >  	size_t total_len = iov_iter_count(iter);
> > +	unsigned int f_flags;
> >  
> >  	/*
> >  	 * Work out how many pages of struct pages we're going to need
> > @@ -194,10 +202,18 @@ static ssize_t process_vm_rw_core(pid_t pid, struct iov_iter *iter,
> >  	}
> >  
> >  	/* Get process information */
> > -	task = find_get_task_by_vpid(pid);
> > -	if (!task) {
> > -		rc = -ESRCH;
> > -		goto free_proc_pages;
> > +	if (flags & PROCESS_VM_PIDFD) {
> > +		task = pidfd_get_task(pid, &f_flags);
> > +		if (IS_ERR(task)) {
> > +			rc = PTR_ERR(task);
> 
> This could return -EBADF or -ESRCH. We should document both in the man page. (or
> decide to always return -ESRCH, dunno)

No, please don't. Let's not start overwriting errnos that are actually
useful information for userspace.
