Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA4833F8A3;
	Thu,  4 Jun 2026 12:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780577989; cv=none; b=VHaqS3aBMCKXNQQMc+P4MlaEeLGiSxoYfGySvuc/5I72OllsANNIDlM5INLuXATdAXi6QGNGz5sJYMw3wL0j0pDQp/wg7IVj0kJ4MXhJfo88zr28gHG7cDuj1kTk0iPAL5vuFki97nqlFr/cacdl48Jf66nPFqiRro71O8lZDOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780577989; c=relaxed/simple;
	bh=cdG9DKfiE9TSscxA54BmqzLb+7QHcmi8WUqp8p4DBuw=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=pAr91m+1f8fpLB/JVBneaDl1pE8x8Wrejo5h15G2eofLzi//hv3qb7uMPTDy0TQ0UMm/NKWg3KfJGp8YciqBKUDMhPg/s576fZKl81+z0mGqtyI+ujbPaKJjS9OTNOnovkftBLnxHBTUW2onNh8g3g8dBm/TejsT55//xueTAeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n9WYg3ti; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n9WYg3ti"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 105D51F00893;
	Thu,  4 Jun 2026 12:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780577987;
	bh=vAkbvi1aE+QuBjLTRFf9k039ZmQ4xmk/MiltR3U18QQ=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=n9WYg3ti2USEyvDmhdD8MJKM6GOI1SjZ+1dpo1Z+JuyBOyKrTwIWuElHBh5bhwPd7
	 6lqoZh0U5ojY/idqOffI/bT+pTa1VQgUzyP/FUgwKqdZy57DGZ7er9XRLSk1WLUtst
	 wcYOSyFvrQwQZLLWVk4cWIMd1muMKvsuqWJVY1RDnFMh+GqKjp15cYdC+Kx2Wegu51
	 V5EeuCp8iigg6dT7v06oOPI5hh/JbogFmfVHzT3Hs/+XZxqAOIJNBD15X5wsMZUkbx
	 3+LjykpYLqCCyuZH4SJ9jzEhM51VsZLOslEXL9Yz0S5W5HjmKNNV3nCb2WORqROSWr
	 Ig3M3ip9bUBzA==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 1/2] mm/process_vm_access: pidfd and nowait support
 for process_vm_readv/writev
From: Christian Brauner <brauner@kernel.org>
To: Alban Crequy <alban.crequy@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, 
 Christian Brauner <brauner@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R . Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 Alban Crequy <albancrequy@microsoft.com>, Peter Xu <peterx@redhat.com>, 
 Willy Tarreau <w@1wt.eu>, linux-kselftest@vger.kernel.org, shuah@kernel.org, 
 Usama Arif <usama.arif@linux.dev>, 
 David Laight <david.laight.linux@gmail.com>
In-Reply-To: <20260603082707.3831525-1-alban.crequy@gmail.com>
References: <20260602100917.3641359-1-alban.crequy@gmail.com>
 <20260602100917.3641359-2-alban.crequy@gmail.com>
 <20260603082707.3831525-1-alban.crequy@gmail.com>
Date: Thu, 04 Jun 2026 14:59:41 +0200
Message-Id: <20260604-pudding-postieren-situation-f52745691fdb@brauner>
X-Mailer: b4 0.16-dev-f5839
X-Developer-Signature: v=1; a=openpgp-sha256; l=3173; i=brauner@kernel.org;
 h=from:subject:message-id; bh=cdG9DKfiE9TSscxA54BmqzLb+7QHcmi8WUqp8p4DBuw=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWQplu1P9087ESYhcOLby0pPm+77Z5x/5bwRuD119zGzh
 WZBX3fu6yhlYRDjYpAVU2RxaDcJl1vOU7HZKFMDZg4rE8gQBi5OAZjIQQZGhotXfj6RrOz9evip
 wwTvOfsuF7j5rglxPLcnv/WNrrLO5C+MDJvmPdu1Zv6UE5Nmbbz+7aX9rzW+yYpSpeKRX5X/rT4
 0r4cLAA==
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

On 2026-06-03 10:27 +0200, Alban Crequy wrote:
> Sashiko raised a question about pidfd_get_task() and PIDFD_THREAD [1],
> so I ran some tests to understand the behavior.
> [1] https://sashiko.dev/#/patchset/20260602100917.3641359-1-alban.crequy@gmail.com
> 
> pidfd_get_task() always resolves pidfds using PIDTYPE_TGID (kernel/pid.c
> line 640), regardless of whether the pidfd was created with PIDFD_THREAD.
> This means:
> 
>  - A PIDFD_THREAD pidfd for a non-leader thread fails with ESRCH.
>  - A regular pidfd for a process whose leader has exited (pthread_exit
>    in main, secondary thread still alive) also fails with ESRCH.
> 
> This is not specific to my patch: process_madvise() uses pidfd_get_task()
> in the same way and has the same behavior. I wrote a test program
> confirming this:
> 
>   https://github.com/alban/tests/tree/alban_pvm_flags/pvm_flags/pidfd_thread_test
> 
> Results summary:
> 
>   All threads alive:
>     pidfd_open(pid, 0)              + process_vm_readv: OK
>     pidfd_open(tid, PIDFD_THREAD)   + process_vm_readv: OK (leader tid)
>     pidfd_open(tid, PIDFD_THREAD)   + process_vm_readv: ESRCH (non-leader)
> 
>   Leader thread exited (secondary still alive):
>     pidfd_open(pid, 0)              + process_vm_readv: ESRCH
>     pidfd_open(pid, PIDFD_THREAD)   + process_vm_readv: ESRCH
>     pidfd_open(tid, PIDFD_THREAD)   + process_vm_readv: ESRCH (non-leader)
>     process_vm_readv(tid, flags=0)                    : OK (plain TID path)
> 
>   process_madvise() behaves identically in all cases above.
> 
> For the non-leader thread case when all threads are alive, this is fine in
> practice: all threads share the same mm_struct, so profilers just use a regular
> pidfd for the thread-group leader.

This was an intentional limitation back then because pidfds only came in
thread-group flavor. I only added subthread pidfds much later.
pidfd_get_task() should drop the flags argument btw. I think that's
unused.

> However, the exited-leader case is a real limitation for profilers.
> OpenTelemetry eBPF Profiler wants to profile a process where the main thread
> has exited but secondary threads are still running [2].
> [2] https://github.com/open-telemetry/opentelemetry-ebpf-profiler/pull/376

If the thread-group leader exists before all of it's subthreads exit
then this is a broken program - even if it is a legal state. The
thread-group leader cannot be reaped while there are live subthreads and
it also means that any subthread exec "resurrects" the thread-group
leader struct pid. So that's going to make for fun profiling...

> Using plain TIDs (flags=0) would work, but it means users cannot use
> PROCESS_VM_PIDFD in this scenario.
> 
> What do you think this patch should do? I see two options:
>  - Address this limitation in a separate future patch that fixes
>    pidfd_get_task() to use PIDTYPE_PID when PIDFD_THREAD is detected in
>    f_flags, benefiting all callers (process_vm_readv, process_madvise,
>    and any future users).

As long as all users of the interface are fine with operating on
subthreads this should be perfectly fine.

