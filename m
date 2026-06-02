Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379A637E304;
	Tue,  2 Jun 2026 12:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780402593; cv=none; b=LEQmmpHz0mq5DVWjYgkjd0x72AQZ4UJpPrDb1zXGW/trioMgQmX6Vr+Q1llSGx3UljRo1FGNDdtdtmHwn6mA8ywt3gCW2lIGhdv074VkjKFjXuKmwL4x2uy9KFTd4ZOfLP9yts+5EhFYZX4we5ojA6pO6byeqgdEI76H4mTBVwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780402593; c=relaxed/simple;
	bh=aLyb9akO/pNbuoxXpsHi0gKwgZPvoS9Y1nZ3/i7ObPc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RsU3wsYZnCtMg/VGPgpzTCdO5y0QTTSwG54/Oztq5P2tNVSbyK945t8xlvi4LWKuqTUbedw+IeditNCZFAhRCuLK15y8JjMfgZ+wV51xkDgCPycpbrJTvgmiHG2nZEOYN/3Dm/YKOjPv812YvIfRDo+C0v0ixcIRm6OfquQQsDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T6Q8OGLJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T6Q8OGLJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D3531F00893;
	Tue,  2 Jun 2026 12:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780402591;
	bh=nU3IjfXdIovExzPjno2c3jXqAj97rnGnfd44sZSmwoU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=T6Q8OGLJMsphvZpFzjxvAbcv42tNz0RFmBmsyukWQ1tMJ9bLk7eTfQcKNcoROU6c1
	 nBnqo9X+GvZXtmKutQSPel0oXgRyErxcWL7GKkMk3saatNFMsaHYyDx9gjh0Hbc9Wa
	 FuAuNeMF8UyU4KHGRvAzSxIL6qqi+xQR8I7zbgWu4DTzC6JQFRatt2bhYPUJBeDWW/
	 6S25EVnqtl2UuxLXyeJpJaucicQDX5ASvjmo+c9Qd1TbFghS2CBb3F4edD6Kpgtpi0
	 FQ5tt0j0C5QdzuQ/7Mr/XD1sRb969LFBSgIvkID46T7I3a5NJ0nvtt1Iz8zHumlHDX
	 YywiLmya3Kstw==
Message-ID: <26da0ab0-b495-43a2-bdbc-4e52599037a8@kernel.org>
Date: Tue, 2 Jun 2026 14:16:27 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] mm/process_vm_access: pidfd and nowait support for
 process_vm_readv/writev
To: Alban Crequy <alban.crequy@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian Brauner <brauner@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett"
 <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Alban Crequy <albancrequy@microsoft.com>,
 Peter Xu <peterx@redhat.com>, Willy Tarreau <w@1wt.eu>,
 linux-kselftest@vger.kernel.org, shuah@kernel.org,
 Usama Arif <usama.arif@linux.dev>,
 David Laight <david.laight.linux@gmail.com>
References: <20260602100917.3641359-1-alban.crequy@gmail.com>
 <20260602100917.3641359-2-alban.crequy@gmail.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260602100917.3641359-2-alban.crequy@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/2/26 12:09, Alban Crequy wrote:
> From: Alban Crequy <albancrequy@microsoft.com>
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
> not block on IO if the memory access causes a page fault. When a page
> is not resident and would require IO to fault in, the syscall returns
> a short read (the number of bytes successfully read before the fault)
> or -1 with errno set to EFAULT if no bytes were read.
> 
> Additionally, this patch adds the flag PROCESS_VM_PIDFD to refer to the
> remote process via PID file descriptor instead of PID. Such a file
> descriptor can be obtained with pidfd_open(2). This is useful to avoid
> the pid number being reused. It is unlikely to happen for debuggers
> because they can monitor the target process termination in other ways
> (ptrace), but can be helpful in some profiling scenarios. When using
> PROCESS_VM_PIDFD, the first argument is a pidfd instead of a pid. If
> the pidfd is invalid, the syscall returns -1 with errno set to EBADF.
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
> Suggested man page update for process_vm_readv(2):
> 
>   The flags argument is the bitwise OR of zero or more of these flags:
> 
>   PROCESS_VM_PIDFD (since Linux 7.x)
>       The pid argument is a PID file descriptor (see pidfd_open(2))
>       instead of a PID number. When using this flag, the existing
>       ESRCH error applies if the process referred to by the pidfd
>       has exited.
> 
>   PROCESS_VM_NOWAIT (since Linux 7.x)
>       Do not block on IO. If a page in the remote address space is not
>       resident and would require disk IO to fault in, the system call
>       returns a short read or fails with EFAULT if no bytes were read.
> 
>   Additional error:
> 
>   EBADF  pid is not a valid file descriptor (PROCESS_VM_PIDFD only).
> 
> Signed-off-by: Alban Crequy <albancrequy@microsoft.com>
> ---

Nothing jumped at me, thanks!

Acked-by: David Hildenbrand (Arm) <david@kernel.org>

-- 
Cheers,

David
