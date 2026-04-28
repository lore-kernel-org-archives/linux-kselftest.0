Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2722C3261;
	Tue, 28 Apr 2026 20:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777406757; cv=none; b=L0QVIG4+nZ7F77lJrsEk6V304kSP8y2m+BFiATj6HGkcghB8Db3Gpt9tyRtbqEp94FMPZNgxMfJQM52vu92UnjLxNDAqFpTl+kE7RTcmYkzKgDeIU4V4baYzccow02NuaggQQoUTCNJJh9iTQ6q58wYx5FjCRek6yp0YepJIH+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777406757; c=relaxed/simple;
	bh=i6VL9rEPIzlOa7TBHegHrUm94Rx4pZDl6vJEPIECtVk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z4SeTPBxfIpwX+4hhNGK+w1JxJuGggfLZtet1y1br70KK6ElpAH8F9xbVFsjpuhyDDHkP8Wpus6EJqakUmr4+0Uie5cB7IEiOo4MAmqEG36xp0uWxDNhgb9VXKmFstkhHUr1Z5wD90AS9jRG8OHRo6gqIOJuFse5EphWalvqwTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZTIpM6yO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZTIpM6yO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D5FEC2BCB3;
	Tue, 28 Apr 2026 20:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777406757;
	bh=i6VL9rEPIzlOa7TBHegHrUm94Rx4pZDl6vJEPIECtVk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZTIpM6yOYwOhkfetphTYo6eCJ+EpjJaVIwaao3v6nme2uV+NzAwO7SMUJozXHNL3l
	 1Vmp2aOdajQFrM/XQXdT/h7R4nh3B9DTfnKrpRnAJ3fhTxkuEzP/SNTDhkwfbdObpW
	 KKxTRdFQpFSxYHOP7DlSddNjdK43eAoLoVjULXzvYzhSyLzARXH1zCLpTaWPwLU4BL
	 h6VesQ0phLHTeXd4cLvoNd4OFJiCCCSi4YUxFIaW9FEX+12MFD+DffbUmWm9HgWhIK
	 LbD00pGmgbj4TyOk5gHMq5MLwM9N6InVOKOgQaJyaMYm97FPvJmKv0bg/m3LQa3FJR
	 wJ+RC1HIT/RDQ==
Message-ID: <8b29da5b-e260-4b77-a640-8abb447291d1@kernel.org>
Date: Tue, 28 Apr 2026 22:05:49 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] mm/process_vm_access: pidfd and nowait support for
 process_vm_readv/writev
To: Alban Crequy <alban.crequy@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian Brauner <brauner@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Alban Crequy <albancrequy@microsoft.com>, Peter Xu <peterx@redhat.com>,
 Willy Tarreau <w@1wt.eu>, linux-kselftest@vger.kernel.org, shuah@kernel.org,
 Usama Arif <usama.arif@linux.dev>,
 David Laight <david.laight.linux@gmail.com>
References: <20260428122826.339550-1-alban.crequy@gmail.com>
 <20260428122826.339550-2-alban.crequy@gmail.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260428122826.339550-2-alban.crequy@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/28/26 14:28, Alban Crequy wrote:
> From: Alban Crequy <albancrequy@microsoft.com>

Hi,

some more smaller comments. Overall, LGTM.

> 
> There are two categories of users for process_vm_readv:
> 
> 1. Debuggers like GDB or strace.
> 
>    When a debugger attempts to read the target memory and triggers a
>    page fault, the page fault needs to be resolved so that the debugger
>    can accurately interpret the memory. A debugger is typically attached
>    to a single process.
> 
> 2. Profilers like OpenTelemetry eBPF Profiler.
> 
>    The profiler uses a perf event to get stack traces from all
>    processes at 20Hz (20 stack traces to resolve per second). For
>    interpreted languages (Ruby, Python, etc.), the profiler uses
>    process_vm_readv to get the correct symbols. In this case,
>    performance is the most important. It is fine if some stack traces
>    cannot be resolved as long as it is not statistically significant.
> 
> The current behaviour of process_vm_readv is to resolve page faults in
> the target VM. This is as desired for debuggers, but unwelcome for
> profilers because the page fault resolution could take a lot of time
> depending on the backing filesystem. Additionally, since profilers
> monitor all processes, we don't want a slow page fault resolution for
> one target process slowing down the monitoring for all other target
> processes.
> 
> This patch adds the flag PROCESS_VM_NOWAIT, so the caller can choose to
> not block on IO if the memory access causes a page fault.

What is the expected return value to user space if we run into this case?

And in the same context: Will you send a man page update? :)

> 
> Additionally, this patch adds the flag PROCESS_VM_PIDFD to refer to the
> remote process via PID file descriptor instead of PID. Such a file
> descriptor can be obtained with pidfd_open(2). This is useful to avoid
> the pid number being reused. It is unlikely to happen for debuggers
> because they can monitor the target process termination in other ways
> (ptrace), but can be helpful in some profiling scenarios.
> 
> If a given flag is unsupported, the syscall returns the error EINVAL
> without checking the buffers. This gives a way to userspace to detect
> whether the current kernel supports a specific flag:
> 
>   process_vm_readv(pid, NULL, 1, NULL, 1, PROCESS_VM_PIDFD)
>   -> EINVAL if the kernel does not support the flag PROCESS_VM_PIDFD
>      (before this patch)
>   -> EFAULT if the kernel supports the flag (after this patch)
> 
> Signed-off-by: Alban Crequy <albancrequy@microsoft.com>
> ---
> v3:
> - Fix ERR_PTR handling for pidfd_get_task(): use IS_ERR()/PTR_ERR()
>   for the pidfd path, matching process_madvise() (Usama Arif, Sashiko)
> 
> v2:
> - Expand commit message with use-case motivation (David Hildenbrand)
> - Use unsigned long consistently for pvm_flags parameter (David Hildenbrand)
> - Add PROCESS_VM_SUPPORTED_FLAGS kernel-internal define (David Hildenbrand)
> - Keep (1UL << N) in UAPI header: BIT() is defined in vdso/bits.h
>   which is not exported to userspace, so UAPI headers using BIT() would
>   break when included from userspace programs (David Hildenbrand)
> 
>  MAINTAINERS                     |  1 +
>  include/uapi/linux/process_vm.h |  9 +++++++++
>  mm/process_vm_access.c          | 34 ++++++++++++++++++++++++---------
>  3 files changed, 35 insertions(+), 9 deletions(-)
>  create mode 100644 include/uapi/linux/process_vm.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2fb1c75afd16..0f6ce21d6235 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16786,6 +16786,7 @@ F:	include/linux/ptdump.h
>  F:	include/linux/vmpressure.h
>  F:	include/linux/vmstat.h
>  F:	fs/proc/meminfo.c
> +F:	include/uapi/linux/process_vm.h

We try to sort this alphabetically. Sometimes we failed. Likely this should just
go to one more line up.

>  F:	kernel/fork.c
>  F:	mm/Kconfig
>  F:	mm/debug.c
> diff --git a/include/uapi/linux/process_vm.h b/include/uapi/linux/process_vm.h
> new file mode 100644
> index 000000000000..4168e09f3f4e
> --- /dev/null
> +++ b/include/uapi/linux/process_vm.h

Thinking out loud: the c file is called "process_vm_access.c", should we name
the header like that as well?

> @@ -0,0 +1,9 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +#ifndef _UAPI_LINUX_PROCESS_VM_H
> +#define _UAPI_LINUX_PROCESS_VM_H
> +
> +/* Flags for process_vm_readv/process_vm_writev */
> +#define PROCESS_VM_PIDFD        (1UL << 0)
> +#define PROCESS_VM_NOWAIT       (1UL << 1)

Should we use BIT here? I see some usage in other uapi headers (e.g., tcp.h)

> +
> +#endif /* _UAPI_LINUX_PROCESS_VM_H */
> diff --git a/mm/process_vm_access.c b/mm/process_vm_access.c
> index 656d3e88755b..dacef50be0be 100644
> --- a/mm/process_vm_access.c
> +++ b/mm/process_vm_access.c
> @@ -14,6 +14,9 @@
>  #include <linux/ptrace.h>
>  #include <linux/slab.h>
>  #include <linux/syscalls.h>
> +#include <linux/process_vm.h>
> +
> +#define PROCESS_VM_SUPPORTED_FLAGS (PROCESS_VM_PIDFD | PROCESS_VM_NOWAIT)
>  
>  /**
>   * process_vm_rw_pages - read/write pages from task specified
> @@ -68,6 +71,7 @@ static int process_vm_rw_pages(struct page **pages,
>   * @mm: mm for task
>   * @task: task to read/write from
>   * @vm_write: 0 means copy from, 1 means copy to
> + * @pvm_flags: PROCESS_VM_* flags
>   * Returns 0 on success or on failure error code
>   */
>  static int process_vm_rw_single_vec(unsigned long addr,
> @@ -76,7 +80,8 @@ static int process_vm_rw_single_vec(unsigned long addr,
>  				    struct page **process_pages,
>  				    struct mm_struct *mm,
>  				    struct task_struct *task,
> -				    int vm_write)
> +				    int vm_write,
> +				    unsigned long pvm_flags)
>  {
>  	unsigned long pa = addr & PAGE_MASK;
>  	unsigned long start_offset = addr - pa;
> @@ -91,6 +96,8 @@ static int process_vm_rw_single_vec(unsigned long addr,
>  
>  	if (vm_write)
>  		flags |= FOLL_WRITE;
> +	if (pvm_flags & PROCESS_VM_NOWAIT)
> +		flags |= FOLL_NOWAIT;
>  
>  	while (!rc && nr_pages && iov_iter_count(iter)) {
>  		int pinned_pages = min_t(unsigned long, nr_pages, PVM_MAX_USER_PAGES);
> @@ -141,7 +148,7 @@ static int process_vm_rw_single_vec(unsigned long addr,
>   * @iter: where to copy to/from locally
>   * @rvec: iovec array specifying where to copy to/from in the other process
>   * @riovcnt: size of rvec array
> - * @flags: currently unused
> + * @flags: process_vm_readv/writev flags
>   * @vm_write: 0 if reading from other process, 1 if writing to other process
>   *
>   * Returns the number of bytes read/written or error code. May
> @@ -163,6 +170,7 @@ static ssize_t process_vm_rw_core(pid_t pid, struct iov_iter *iter,
>  	unsigned long nr_pages_iov;
>  	ssize_t iov_len;
>  	size_t total_len = iov_iter_count(iter);
> +	unsigned int f_flags;
>  
>  	/*
>  	 * Work out how many pages of struct pages we're going to need
> @@ -194,10 +202,18 @@ static ssize_t process_vm_rw_core(pid_t pid, struct iov_iter *iter,
>  	}
>  
>  	/* Get process information */
> -	task = find_get_task_by_vpid(pid);
> -	if (!task) {
> -		rc = -ESRCH;
> -		goto free_proc_pages;
> +	if (flags & PROCESS_VM_PIDFD) {
> +		task = pidfd_get_task(pid, &f_flags);
> +		if (IS_ERR(task)) {
> +			rc = PTR_ERR(task);

This could return -EBADF or -ESRCH. We should document both in the man page. (or
decide to always return -ESRCH, dunno)



-- 
Cheers,

David
