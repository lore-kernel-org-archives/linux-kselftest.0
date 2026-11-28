Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795848643;
	b=ZHOElebqsWauJX0c29lFkFfnji8ax8ID+Wf/cwBEH8SzjL2E7qIcdHzdcDJeUip0esAO
	 teFU0vlM05mjcUUce37uC6HJwzv6eQnUwX3TZgKdU2ASBSoqfI6h3vlrfpOWjKBCJsnYT
	 0ySUOF4C21eDdyOvRimZCb/5Q1ZFYQnZPPLaa11fg1UHljZ3ond/W+ZEn/+1Aj5Cdgize
	 5R7hSLvleJTIdjUSeWZhb3xhNRjWJnxg6x4iljDkwGoGZOC98N7zDwJPxOk/PbEwF72WX
	 Eg78sCsuN2VDZEpRR4WWOTkwhE5bL3+QO4RIZGTdFRuvm51HPypp72fp19lT+bPZNrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795848643;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=kOlVHY/wyAKwfQn6ewbvx7N2qcH8FDvBchLks/jIQ24=;
	b=JagsF6YywKrpyFJeBAv/Cd5LFuMq3n4E/N3mUHDMd2nv1tjtJHwffMJp9QYRdo8tmvaB
	 BxJJjx3X9J2tnJIhxrzakDSZ9VBjPfRMgE0etIJ1xMZ4wvdeKkOKKrXrT2IM78mmYXGSl
	 lIGUR78OQzYRem3RHiNVKIvO6r5ABTylPhGaWH7VXzyhWEmDz6LYUl04VcDA4RByhrXsJ
	 TgohTWzSdya3rdDNHcAWNYI2L1mHTivOyHooaz02hctLhJoIcgmZ9sBVsT3lI3rGrFxZR
	 a+A5cP2w04+Vag/2OrMNtKPU1dB4yl0qmeIBW+PdkR2YTqoZTRe0r9KiKYbs+3gYTaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=2OFUQRoK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010E8606A32F
	for <linux-kselftest@vger.kernel.org>; Sat, 28 Nov 2026 06:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=2OFUQRoK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15EBB1F000C1;
	Sat, 28 Nov 2026 06:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1795848642;
	bh=kOlVHY/wyAKwfQn6ewbvx7N2qcH8FDvBchLks/jIQ24=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=2OFUQRoKI6wxHO5tDUu5d6QoZnR9uVTzbm81K+82RSRNJnkiTI0ok8i7sh3WvPGsb
	 pNc/QOesP1xluqeoPN1BLIpfaYLOw4bJkAJeq1PpNia+j57AZ+iSK46F5BvZhpa2Z9
	 6fLxplM035rDtgQuscWsEplqf8kat7r42dm92X84=
Date: Fri, 27 Nov 2026 22:50:41 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Kurt Lin <lylin1023@gmail.com>
Cc: Miaohe Lin <linmiaohe@huawei.com>, Naoya Horiguchi
 <nao.horiguchi@gmail.com>, David Hildenbrand <david@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka
 <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko
 <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, Muhammad Usama Anjum <usama.anjum@arm.com>
Subject: Re: [PATCH] selftests/mm: skip hard dirty page-cache test on FUSE
Message-Id: <20261127225041.504dba5029c3519b9ca8b6f2@linux-foundation.org>
In-Reply-To: <20261123-memory-failure-fuse-skip-v1-1-19dcbda6e2e8@gmail.com>
References: <20261123-memory-failure-fuse-skip-v1-1-19dcbda6e2e8@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 23 Nov 2026 01:58:43 +0800 Kurt Lin <lylin1023@gmail.com> wrote:

> Like NFS, FUSE reports on close() the -EIO that MADV_HWPOISON records
> in the mapping of a dirty page-cache page, as fuse_flush() calls
> filemap_check_errors(). Run from a virtiofs directory, e.g. in a
> virtme-ng guest, the hard dirty_pagecache variant fails on its final
> close():
> 
>   memory-failure.c:389:dirty_pagecache:Expected close(fd) (-1) == 0 (0)
> 
> Skip it on FUSE, as commit e14e52a7ce02 ("selftests/mm: skip hard dirty
> page-cache test on NFS") does for NFS.
> 

That test is broken :(

> --- a/tools/testing/selftests/mm/memory-failure.c
> +++ b/tools/testing/selftests/mm/memory-failure.c
> @@ -355,11 +355,12 @@ TEST_F(memory_failure, dirty_pagecache)
>  	fs_type = get_fs_type(fd);
>  	/*
>  	 * MADV_HARD poisoning of dirty page-cache data records an expected
> -	 * -EIO in the file mapping. NFS reports this error on close(), so
> -	 * skip this variant.
> +	 * -EIO in the file mapping. NFS and FUSE report this error on
> +	 * close(), so skip this variant.
>  	 */
>  	if (!fs_type || fs_type == TMPFS_MAGIC ||
> -	    (fs_type == NFS_SUPER_MAGIC && variant->type == MADV_HARD)) {
> +	    ((fs_type == NFS_SUPER_MAGIC || fs_type == FUSE_SUPER_MAGIC) &&
> +	     variant->type == MADV_HARD)) {
>  		close(fd);
>  		SKIP(return, "unsupported filesystem :%x\n", fs_type);
>  	}

I invented that store-errors-in-the-mapping thing about a million years
ago.  It was never intended that close() report errors - that's silly
because the file might still have gigs of unwritten dirty pagecache.

If a filesystem is checking mapping->AS_foo at close() then that's
quite misguided - it presumably works for O_[D]SYNC-opened files which
were dirtied only by write(), but still no good if the pagecache was
dirtied via MAP_SHARED.

The way for userspace to check for errors is to run msync() if needed
then fsync() and check its return value and that's what we should
(self)test for.  And after fsync() has read and cleared the mapping's
AS_foo, a close() should return 0, so we can selftest for that also.

And boy you sent me down a Sunday (then Monday) rathole with this one.

I ended up with one nice clean patch for memory-failure.c which makes
it work for all well-behaved filesystems.  Then eight patches which
pile in hacks and workarounds for all the weird/broken fs behavior I
hit.  The end result is that this poor little selftest gets "pass" or
"skip" for all Linux flesystems.

I have fixes for a few filesystems here so if maintainers merge them we
can remove some of memory-failure's hacks and workarounds.

I'll hose all these patches out in a sec.  Probably it'll be best to
fold them all into a single patch.



There's some really bad behavior in there!  Responsible and careful
userspace which cares about its data should do:

	write(fd);
	err = fsync(fd);
	if (err)
		/* eeek, we lost data */

But in some cases, the kernel is lying to userspace.  If data was lost
due to dirty pagecache memory-failures or even to plain old device
-EIO, the kernel will report "all safely written back" when in fact
userspace just lost its data.  This is a fundamental data integrity
flaw.

