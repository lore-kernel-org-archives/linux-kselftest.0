Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A09E2153D8;
	Fri, 24 Apr 2026 14:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777041380; cv=none; b=r+WajcaXNwCMdzpV9hpmJhNlrSxAgVXNN1Ujg4hglqdqdrFnpH7459F74pdX0tmdh1IvLWqf8Q63Z0s5Uu4KYcCKurfM20drKR0eST4Mh/P21cyVaZzCxgzxALqmDKcjZrtASgAHJR8DPlyopYkkdyysh4W7Sgt7/eO8zYxcavs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777041380; c=relaxed/simple;
	bh=k25j1doFu+bHGGUIqiaYlsAE0ovPTySjmIWz28MIflQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ON+RZBZXpK1aAzOhiqrU/Cr57j9ysIr7ND26q9UWU6+EMNRzwyeUr4/cqdqxR7gA6B38aXxNuvAaYgXIayUOFm8W+TkwAVoZeXRjjlT1ROXaQRSoBcaU+gKWsYG8KsWnsOmkII+SuK2i+iTJFhlaXSD1kmsDaiEB72/9kQc7yXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=uS7k5z64; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="uS7k5z64"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description;
	bh=rGmnz578Am/EljZenrf+7J6ZrtzAwbZgPZsP3LVCvBI=; b=uS7k5z64BLNXXKkJZk1AJgoa+N
	XlWAYm9riEmlvDyWMw+NkRQy4utmzYV2Zk17yRxY023jQugDaQqwlq7bSXa0UUzqsIxM1O7P4xaZ5
	6BCfsug5iQJW/l6e0Z/iD0OEykAtnsfAoWXCdyel2wqVB1EiDk18gFd/NGw/6CWXD6LMbRHjVI8il
	aRo69/FLW1MKYPXaSPthOajqeUXpP+hRc2D2u6Gq/f7e1e61vekr9nhhJDo5m7qjHaVhYVRChbh2+
	qJpQeLU/+d+HGs7u48rK2qGValkQj6NfHErJS07qQIVIJCuCaI1Hx5ixFFEzsmK5r5LEhQ9VRjq8Y
	yQGnPNhg==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wGHdY-003Eu9-0f;
	Fri, 24 Apr 2026 14:36:08 +0000
Date: Fri, 24 Apr 2026 07:36:02 -0700
From: Breno Leitao <leitao@debian.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 0/2] mm/kmemleak: dedupe verbose scan output
Message-ID: <aet-vYNQr_5tF_hy@gmail.com>
References: <20260421-kmemleak_dedup-v1-0-65e31c6cdf0c@debian.org>
 <20260424065325.d9643671feedb0f27297cc94@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260424065325.d9643671feedb0f27297cc94@linux-foundation.org>
X-Debian-User: leitao

Hello Andrew,

On Fri, Apr 24, 2026 at 06:53:25AM -0700, Andrew Morton wrote:
> On Tue, 21 Apr 2026 06:45:03 -0700 Breno Leitao <leitao@debian.org> wrote:
> 
> > I am starting to run with kmemleak in verbose enabled in some "probe
> > points" across the my employers fleet so that suspected leaks land in
> > dmesg without needing a separate read of /sys/kernel/debug/kmemleak.
> > 
> > The downside is that workloads which leak many objects from a single
> > allocation site flood the console with byte-for-byte identical
> > backtraces. Hundreds of duplicates per scan are common, drowning out
> > distinct leaks and unrelated kernel messages, while adding no signal
> > beyond the first occurrence.
> > 
> > This series collapses those duplicates inside kmemleak itself. Each
> > unique stackdepot trace_handle prints once per scan, followed by a
> > short summary line when more than one object shares it:
> 
> AI review:
> 	https://sashiko.dev/#/patchset/20260421-kmemleak_dedup-v1-0-65e31c6cdf0c@debian.org

V2 will have them addressed. Here are some of the answers for the question
raised by Sashiko.

> Can print_unreferenced() access freed memory here and in the fallback
> path above? Since the lock is dropped and reacquired, do we need to
> re-check object->flags & OBJECT_ALLOCATED before printing?

v2 introduces print_leak_locked(), which re-acquires object->lock and gates the
hex dump on OBJECT_ALLOCATED:

	static void print_leak_locked(struct kmemleak_object *object, bool hex_dump)
	{
		raw_spin_lock_irq(&object->lock);
		__print_unreferenced(NULL, object,
					hex_dump && (object->flags & OBJECT_ALLOCATED));
		raw_spin_unlock_irq(&object->lock);
	}

hex_dump_object() is the only path that reads object->pointer's user memory;
the rest of the report (backtrace, comm/pid/jiffies, checksum) lives in the
kmemleak_object metadata, which get_object() keeps alive. __delete_object()
clears OBJECT_ALLOCATED under object->lock before the user memory goes away, so
the recheck is sufficient.

> If get_object(object) failed, it means the object's reference count is
> already 0 and it is actively being deleted. Unconditionally locking and
> dumping it there seems like it will read freed memory.

Fixed in v2 by reordering: get_object() is now attempted before xa_store(), and
on failure we simply skip the object — the leak count was already incremented,
and the memory has been freed concurrently so it's no longer a leak. 

> What happens to valid memory leaks that failed to record a stack trace (e.g.
> due to memory pressure or context limits)? Will these leaks also be
> permanently ignored in all future scans?

Also fixed in v2. dedup_record() now starts with:

	if (!trace_handle) {
		print_leak_locked(object, true);
		return;
	}

so leaks with trace_handle == NULL (early-boot allocations tracked before
kmemleak_init() set up object_cache, or stack_depot_save() failures under
memory pressure) are printed inline through the same locked.
