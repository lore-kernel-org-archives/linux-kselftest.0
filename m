Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD6D03CFF49;
	Mon, 27 Apr 2026 13:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777298313; cv=none; b=LMxlsuXEyjXrnndjfcaB95NtaIc++UY8esoDDNZWklfgd6qwJo2TxlythWM+RvycT6/GK9lhJeGjF07/oZWjSwKY/xW1b2weG04BG+JB6VfBZnWjD6jgD4alwZljwqAxuqEIrb0YSY2DTiyxcmYBpEnzwZUELJYIeaWmNBJTw9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777298313; c=relaxed/simple;
	bh=orleSLSlf3l9j3pRziC3s+6HLkjk4eXeS1br3lRPT50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RKDScErBLnbIBDkSLwaiDuPWiGsilRgy0PM541wjcHf7gMcN5z1LXt7ejkVG3jh8yhTEy9KlZxc5h8crxCyYDR3iVBkSi2CZvjGkLsw9meRExY5Dl1aLTZMw0rhD5RaTxazGaQGI4d7tuvZr0AJoFC062qki4Wh4xvnFgMYcnJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=CtctlwmF; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="CtctlwmF"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B94611FC7;
	Mon, 27 Apr 2026 06:58:25 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2AF733FB90;
	Mon, 27 Apr 2026 06:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777298311; bh=orleSLSlf3l9j3pRziC3s+6HLkjk4eXeS1br3lRPT50=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CtctlwmFIBjxPKtPWl8Sl4V4HzD7XqPAdApbI9jcGLQ64wDTOoBdysqmJERU9+vr0
	 S7cRKsVgtvnrVDijn23uqGaOc7LvoSDQ91+41Pj5ioccOn8sNoWx6SvjN2dKRFFXai
	 ODjV4r0otH1XiS0v4EOuVeZErBlC6u5Nfqnahbt8=
Date: Mon, 27 Apr 2026 14:58:22 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Breno Leitao <leitao@debian.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v2 1/2] mm/kmemleak: dedupe verbose scan output by
 allocation backtrace
Message-ID: <ae9rfnaPp10bNfFr@arm.com>
References: <20260424-kmemleak_dedup-v2-0-8bea649b2a92@debian.org>
 <20260424-kmemleak_dedup-v2-1-8bea649b2a92@debian.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260424-kmemleak_dedup-v2-1-8bea649b2a92@debian.org>

On Fri, Apr 24, 2026 at 08:03:36AM -0700, Breno Leitao wrote:
> In kmemleak's verbose mode, every unreferenced object found during a
> scan is logged with its full header, hex dump and 16-frame backtrace.
> Workloads that leak many objects from a single allocation site flood
> dmesg with byte-for-byte identical backtraces, drowning out distinct
> leaks and other kernel messages.
> 
> Dedupe within each scan using stackdepot's trace_handle as the key: for
> every leaked object with a recorded stack trace, look up the
> representative kmemleak_object in a per-scan xarray keyed by
> trace_handle. The first sighting stores the object pointer (with a
> get_object() reference) and sets object->dup_count to 1; later
> sightings just bump dup_count on the representative. After the scan,
> walk the xarray once and emit each unique backtrace, followed by a
> single summary line when more than one object shares it.
> 
> Leaks whose trace_handle is 0 (early-boot allocations tracked before
> kmemleak_init() set up object_cache, or stack_depot_save() failures
> under memory pressure) cannot be deduped, so they are still printed
> inline via the same locked OBJECT_ALLOCATED-checked helper. The
> contents of /sys/kernel/debug/kmemleak are unchanged - only the
> verbose console output is collapsed.
> 
> Safety notes:
> 
>  - The xarray store happens outside object->lock: object->lock is a
>    raw spinlock, while xa_store() may grab xa_node slab locks at a
>    higher wait-context level which lockdep flags as invalid.
>    trace_handle is captured under object->lock (which serialises with
>    kmemleak_update_trace()'s writer), so it is safe to use after
>    dropping the lock.
> 
>  - get_object() pins the kmemleak_object metadata across
>    rcu_read_unlock(), but the underlying tracked allocation can still
>    be freed concurrently. The deferred print path therefore re-acquires
>    object->lock and re-checks OBJECT_ALLOCATED via print_leak_locked()
>    before touching object->pointer; __delete_object() clears that flag
>    under the same lock before the user memory goes away. The same
>    helper is used by the trace_handle == 0 and xa_store() failure
>    fallbacks, so every printer in the new path has identical safety
>    guarantees.
> 
>  - If get_object() fails after we set OBJECT_REPORTED, the object is
>    already being torn down (use_count hit zero); the leak count is
>    still accurate but the verbose line is dropped, which is correct
>    - the memory was freed concurrently and is no longer a leak.
> 
>  - If xa_store() fails to allocate an xa_node under memory pressure,
>    we fall back to printing inline via print_leak_locked() instead of
>    silently dropping the leak.
> 
>  - The hex dump is skipped for coalesced entries (dup_count > 1):
>    bytes would differ across objects sharing a backtrace anyway, and
>    skipping it removes the only remaining read of object->pointer's
>    contents in the deferred path. The representative's reported size
>    may also differ from the coalesced objects' sizes; the printed
>    trace_handle reflects the representative's current value rather
>    than the value used as the dedup key, which is normally - but not
>    strictly - identical.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
