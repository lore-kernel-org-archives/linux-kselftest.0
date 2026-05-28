Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A57634F49F
	for <linux-kselftest@vger.kernel.org>; Thu, 28 May 2026 19:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779998046; cv=none; b=Y45sksqBvSlWkfcoyTLULB7W0zV+Emy7GbqZFx4XAURwJXp29boCxV3kIirrPCGBYaOrR608pWioAjXHypT/JpT3vnxD2xYR7Mwnr36tBb7u41Za1m3QyRPSycupeUGJqgwO40VarLebvnlPTuzqrhi8lr1URVptC0PmKzqCMvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779998046; c=relaxed/simple;
	bh=tkYwiPexmCFy1xVdThNBUraltDvdQA2A6n5FvjBLCio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gwE+CMaiSJFtnnUZJRG7aLt22aKXNT9VDqyXRNposo2bQsxD28SBwmM4gOS2BeEJRHEOhwqpqCRRiXMR74VXtDnQABXd7n1jKhGJM2aNBURG9mfzVGC8cLbXfSAdy/1EP6o12qsXjwTrVspUIhQMnGCB9+UbsaS3HS97Gwb5Uuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sq+0j8Cf; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sq+0j8Cf"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-36b95eb4bb4so451886a91.3
        for <linux-kselftest@vger.kernel.org>; Thu, 28 May 2026 12:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779998043; x=1780602843; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r+YVYuHV31+YDueuv90j7QJ3IHdmFzFimV+6UaJiJI8=;
        b=sq+0j8CfzfjHjxIfOSwDU3al73qMU7o1+qxw/1FQS3xMc8N0OwMPqpxORX7GoNimYE
         gRgDmchpo9hlGQwK+f3yWXJl5ePj/L3MZqw3RgE2tAxZ/kEcm8KDw+xbjICnuS9/zHJR
         KytU9c66hEpxUtClUCKlrQ2xLrOzb0LH+7E1Tn3D/0jDo68uY6V13Id7hh8oByLVzudq
         lW24f8tBKJQpKQPZKngrIkfubxFctaUnNAUkZlSRjRkU8OTunCBMPIoAA1958le0Iv5M
         J81FZit9vJ+4LrCKNKH3kdwUzQueD3/gZkLulu5xF3mB2AlyBKaJOuB++WRpq3hGCaWC
         UeLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779998043; x=1780602843;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r+YVYuHV31+YDueuv90j7QJ3IHdmFzFimV+6UaJiJI8=;
        b=S5JLqPJox5/d57ebDVvOs+/sQTv223tV/XiYBxAR9lhJ5oTVQQEJWRT3NAtSbHa37P
         KKXHpTqSHs8oIJx3DDVX9JJn5/MVHx1+RKrbDjAhWXok90WBZ5eN8UabEWVTGD4V5/zt
         vlEmalyszxgl7f1n+EzDQgDKnqJMSawrOLXc4QhN2ZK4Y134k9FS8SFY4ge6hJ9o5gTa
         EM5Svn2KSZ2ybOjDC/7DXTMxM8S39CFt5+jWlysp7fe3r07Nojv3Pa8A38QydjQRWrzR
         ZNtiR6WLIVmeMD6Oza2KVA0pGmeYCpaHxZ7NUx/nKwINgNeSda0njYgUxMISuKVGiErb
         F+7g==
X-Forwarded-Encrypted: i=1; AFNElJ+dETX5bhQGI6zN08BGRia4j9021hqOOPdtzp6/1xmiHYoDGd6eAIeenqP6xAgyzGuwZkO7iyFZ2RTAcBR/3fE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGxPOSI0dFd6l6M5QJUVx0d4PCviWs3ne2ATco8/Ror64veEwq
	0AZOgTLyr8j2rdVgWlaksfOGNPr1nBtvuOuYjHJ8YVeIYVwY0bjHGHQf
X-Gm-Gg: Acq92OFH5Zl+Gscu5Jnr8/BrTJjdLWAH0mXBTzv7hFDT/Wg8ZyKniYRQ2Ph10lNqKsq
	mYt7qKsXwpPfF4PjYa+JHdDVYiZF8DZ/IR+AoSfgqhpAJAuzj+oO8TBeuFYSgrXhi3TODVocHln
	25VoDf42oC+xgUSVXCOrEaq2FULL89wSv+XE08baN4WBg2kcYFae9bCxmVnSplS7YO7T/iBHJKz
	DAcQRp7T6E59/pgaR8GZZAriweN4+zSSu3+O79j5OyCzzK6TJzI0UP+87f8BXdxYGG2aC1QDSPd
	KvGWpCrN0BjRx/J709aYDB8H4vy4uX7CZExQb7Vd+UowbF49mQpTWjxidXdthNFHBJUnVR89AAB
	GBMjrxil6MBIAbisgWtXQfOa3igR+2UqsLmcBhI8BbQoPlQukMbmGzXbQ+d6GIVowwzOczo3e54
	LliBxzsSJT2nQcjcRiyNSPeS3Upu4dIYos2Zx/+HF8RjPadAkU53lPdESxAlzsbCweLlmH9FLZa
	yBE
X-Received: by 2002:a17:90b:2682:b0:36b:ba9b:7efb with SMTP id 98e67ed59e1d1-36bbcc14892mr34605a91.5.1779998042998;
        Thu, 28 May 2026 12:54:02 -0700 (PDT)
Received: from skinsburskii (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bb616d646sm398548a91.11.2026.05.28.12.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 12:54:02 -0700 (PDT)
Date: Thu, 28 May 2026 12:53:59 -0700
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Liam.Howlett@oracle.com, david@kernel.org, jgg@ziepe.ca, corbet@lwn.net,
	leon@kernel.org, ljs@kernel.org, mhocko@suse.com, rppt@kernel.org,
	shuah@kernel.org, skhan@linuxfoundation.org, surenb@google.com,
	vbabka@kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v3 0/3] mm/hmm: Add mmap lock-drop support for
 userfaultfd-backed mappings
Message-ID: <ahidV_iSq3E-FtMI@skinsburskii>
References: <177928604779.589431.14703161356676674288.stgit@skinsburskii>
 <20260521163309.c5cc5d3f6cf16bac212cf90b@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260521163309.c5cc5d3f6cf16bac212cf90b@linux-foundation.org>

On Thu, May 21, 2026 at 04:33:09PM -0700, Andrew Morton wrote:
> On Wed, 20 May 2026 07:09:19 -0700 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:
> 
> > This series extends the HMM framework to support userfaultfd-backed memory
> > by allowing the mmap read lock to be dropped during hmm_range_fault().
> > 
> > Some page fault handlers — most notably userfaultfd — require the mmap lock
> > to be released so that userspace can resolve the fault. The current HMM
> > interface never sets FAULT_FLAG_ALLOW_RETRY, making it impossible to fault
> > in pages from userfaultfd-registered regions.
> > 
> > This series follows the established int *locked pattern from
> > get_user_pages_remote() in mm/gup.c. A new entry point,
> > hmm_range_fault_unlockable(), accepts an int *locked parameter. When the
> > mmap lock is dropped during fault resolution (VM_FAULT_RETRY or
> > VM_FAULT_COMPLETED), the function returns 0 with *locked = 0, signalling
> > the caller to restart its walk. The existing hmm_range_fault() is
> > refactored into a thin wrapper that passes NULL, preserving current
> > behavior for all existing callers.
> > 
> > Faulting hugetlb pages on the unlockable path is not supported because
> > walk_hugetlb_range() unconditionally holds and releases
> > hugetlb_vma_lock_read across the callback; if the mmap lock is dropped
> > inside the callback, the VMA may be freed before the walk framework's
> > unlock. Hugetlb pages already present in page tables are handled normally.
> > Possible approaches to lift this limitation are documented in
> > Documentation/mm/hmm.rst.
> 
> Thanks.  AI review identified one possible issue, possibly a duplicate
> from the v2 series?
> 
> 	https://sashiko.dev/#/patchset/177928604779.589431.14703161356676674288.stgit@skinsburskii
> 
> I'll take no action at this stage, shall await reviewer input.  Please
> poke me in a week or so if nothing has happened.
> 

Hi Andrew,

A gentle reminder as requested: do you think this change could be taken into
the mm tree?
It's beneficial not only for the MSHV driver, but can be used for
post-copy live migration of GPU states in future.

Thanks,
Stanislav

> Which is quite possible - things seem rather hectic at this time and
> we're almost at -rc5!
