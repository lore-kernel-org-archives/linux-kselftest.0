Received: from mail.ilvokhin.com (mail.ilvokhin.com [178.62.254.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F554485CDA;
	Tue,  4 Aug 2026 17:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.62.254.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785863298; cv=none; b=V3UlOxEoyPXwCrTvxWvhyiSEft2NbHRyIlrPsnmI+aRa5OFXbINXyb2DzGmNgg0dF5RPJyHBO4QgeHdR2pBsRT0hOmpRoyTIrtAUjTxdXSP0OmSnABdyPFEN3FdgP5UxLILG5HogOs12M/QbM+QIztINZf2bzmVyA28YLPlAi04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785863298; c=relaxed/simple;
	bh=saZEie8M/jAKr1Ieiu50bA5n8A0pI4Sf/+R8cwvtgZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qmKrpD2WsjZV+6SE9rN76bA90kPtsVbmr2yvaTU5lTfWwSsz5gjpyZ6mpmBCz6H4DM52RoGtUr4Mf6biOSgY0qU+zWjSapEQoVzckZlduPUxvgTAfLxEqGyIHY5fNv+ZtXqRIka5MLJSCrGicVGbLMj5n6ISlG7A/WdTpkY4Gfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ilvokhin.com; spf=pass smtp.mailfrom=ilvokhin.com; dkim=pass (1024-bit key) header.d=ilvokhin.com header.i=@ilvokhin.com header.b=2oX6Sv+q; arc=none smtp.client-ip=178.62.254.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ilvokhin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ilvokhin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ilvokhin.com header.i=@ilvokhin.com header.b="2oX6Sv+q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ilvokhin.com;
	s=mail; t=1785863283;
	bh=RpY9wQJqYnUV2RfOy7ty3xbkDT8GukZVLmuurWYwE3Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=2oX6Sv+qclh1ytGY8iO4oLPb+hrR+unhKQtjDN4xwykS+aY5bNMR2JMmX0n/O7IUL
	 vPO774x1cekh29Ev/7Cz6+4AujTklImjmSP/VWQGnaWXkP+jWQyxx5WYhf3NL7+ua3
	 tIbQLLKdNbWiPjtia64TFsqlzlZSXlNQurnComm8=
Received: from shell.ilvokhin.com (shell.ilvokhin.com [138.68.190.75])
	(Authenticated sender: d@ilvokhin.com)
	by mail.ilvokhin.com (Postfix) with ESMTPSA id 589B4E17D4;
	Tue, 04 Aug 2026 17:08:03 +0000 (UTC)
Date: Tue, 4 Aug 2026 17:07:59 +0000
From: Dmitry Ilvokhin <d@ilvokhin.com>
To: Usama Arif <usama.arif@linux.dev>
Cc: tglx@kernel.org, peterz@infradead.org, andrealmeid@igalia.com,
	dave@stgolabs.net, dvhart@infradead.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	mingo@redhat.com, shuah@kernel.org, shakeel.butt@linux.dev,
	hannes@cmpxchg.org, riel@surriel.com, kernel-team@meta.com
Subject: Re: [PATCH] futex: Avoid hash-bucket locking for mismatched waits
Message-ID: <anIcb6Y_WbS9Z9Z8@shell.ilvokhin.com>
References: <20260731192624.140399-1-usama.arif@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731192624.140399-1-usama.arif@linux.dev>

On Fri, Jul 31, 2026 at 12:26:24PM -0700, Usama Arif wrote:
> futex_wait_setup() increments the bucket waiter count in futex_q_lock() and
> takes hb->lock before checking whether the futex word matches the expected
> value. A mismatch then immediately undoes the waiter accounting and drops
> the lock again without queueing anything.
> 
> In a fleet-wide sampled profile at Meta, among samples whose leaf was
> native_queued_spin_lock_slowpath(), the top call paths were:
> 
>         shrink_inactive_list()   (lru_lock)   25.0%
>         futex_wait_setup()       (hb->lock)   21.6%
>         futex_wake()             (hb->lock)   19.5%
>         raw_spin_rq_lock()       (rq lock)     6.1%
>         __remove_mapping()                     3.3%
>         lock_list_lru_of_memcg()               3.1%
> 
> Together, the two futex paths represented 41.1% of sampled qspinlock
> slowpath events in this profile.

I couldn't work out from the changelog how much of that hb->lock
contention is actually the uval/val mismatch. A contended userspace
mutex would produce the same profile, and the two want different fixes,
so I had a look on a couple of Meta workloads.

-EWOULDBLOCK reaches futex_wait() only from futex_wait_setup()'s value
check, so the return value is the outcome:

    timeout 10s bpftrace -e 'fexit:futex_wait { @[retval] = count(); }'

On a workload available to me:

    @[-516]: 29
    @[-512]: 48
    @[-11]: 7039       1.9%  -EWOULDBLOCK
    @[-110]: 35296     9.5%  -ETIMEDOUT
    @[0]: 328583      88.6%  woken

So 1.9% of calls take the path this patch optimises. Another host
running a different application gives 6.2%, so it varies, but not by
anything like the margin perf bench futex hash suggests.

The other 98% might be worth a number too. We expect __futex_wait() to
end up waiting, and for that common case uaddr is now read twice: once
in the precheck and once under hb->lock. Probably fine, but do you have
a measurement for it?
 
> perf bench futex hash only ever mismatches, as its futex words are
> calloc()ed to zero while every operation waits for 1234. On a 16-vCPU,
> 8-GiB guest, median of five 'perf bench futex hash -r 5 $args' runs
> of the reported mean per-thread throughput, in operations per second:
> 
>         $args    benchmark                  parent      patched     change
>         -b 2     private, two buckets      303,410    4,392,639      14.5x
>         -b 0     private, global hash    2,776,498    4,397,887     +58.4%
>         -b 0 -S  shared                  1,990,412    2,727,487     +37.0%
> 
> This benchmark no longer measures futex hash bucket contention, because its
> words never match and every operation now returns before the bucket is
> located: neither futex_hash() nor hb->lock is reached, and the -b knob
> stops affecting the result (both patched rows are ~4.4M).
>

After this patch perf bench futex hash no longer really measures what it
was written for, since the bucket is never located. It is probably not
the best benchmark for this change either, as it only ever exercises the
path being skipped. Might be worth a look as part of the series?

None of this is an objection to the approach, just that we likely need
more data than a benchmark which is not exactly measuring what we care
about.
