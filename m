Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6960305673;
	Mon, 18 May 2026 17:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779126489; cv=none; b=dC+uKMGavy8ati/iHgfzcbLegkIfJ9fPfRuyLe3H3iDN15Mn/y9CXIzrOuFss1E61Lmtge8ZDZhAVhcGAUGgL6JG873leIiDFwyk7iTONPLHspjY5JT/jLm6VUmTzTNw1Tzkta7m69iZ7wU+KNK/GxN/xuGWa0L9U3/B0XrN+fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779126489; c=relaxed/simple;
	bh=gCCAueFaNZOdM1PmuyBoRCBVAPutw9UFxM8+SWjq5Q4=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=qtNp8xkNR+lsGNL/5xBnGIGXcJb7tWAFvZ8S5Wy9DxGEf707QT9mxjKL2CDnleIebXGsnEBNBJXf/1k4RuFxHIHX0O2eNIzCnKuamNJFJmyvWb0xdOSt0dY/b1uyQ8i56mutLRTFM0vA4qnNTX3D9h27D8yVUBFodKOTIzsqYkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ULMmgfck; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ULMmgfck"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 926A0C2BCB7;
	Mon, 18 May 2026 17:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1779126489;
	bh=gCCAueFaNZOdM1PmuyBoRCBVAPutw9UFxM8+SWjq5Q4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ULMmgfckAW3C7hJlysRzeFrwkVD7Hckxlw7PNCuMftj+sWvNcBy99XIxo37MUzL15
	 pkJD9CyS7KGxQXRQcj3E68KKNjeYNfgARBXnS6tkRBSLxu7tzGVf8pFFWR6v3fdVBB
	 K0xCkoDYQK61JiyeJG0uDvJcCJfHgb/XEq/2b1Uc=
Date: Mon, 18 May 2026 10:48:08 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
Cc: kys@microsoft.com, Liam.Howlett@oracle.com, david@kernel.org,
 jgg@ziepe.ca, corbet@lwn.net, leon@kernel.org, ljs@kernel.org,
 mhocko@suse.com, rppt@kernel.org, shuah@kernel.org,
 skhan@linuxfoundation.org, surenb@google.com, vbabka@kernel.org,
 skinsburskii@gmail.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mm@kvack.org
Subject: Re: [PATCH v2 0/3] mm/hmm: Add mmap lock-drop support for
 userfaultfd-backed mappings
Message-Id: <20260518104808.ba773348f8564303c4330a33@linux-foundation.org>
In-Reply-To: <177863991557.82528.15288076059759579141.stgit@skinsburskii-cloud-desktop.internal.cloudapp.net>
References: <177863991557.82528.15288076059759579141.stgit@skinsburskii-cloud-desktop.internal.cloudapp.net>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, 13 May 2026 02:40:11 +0000 Stanislav Kinsburskii <skinsburskii@linux.microsoft.com> wrote:

> This series extends the HMM framework to support userfaultfd-backed memory
> by allowing the mmap read lock to be dropped during hmm_range_fault().
> 
> Some page fault handlers — most notably userfaultfd — require the mmap lock
> to be released so that userspace can resolve the fault. The current HMM
> interface never sets FAULT_FLAG_ALLOW_RETRY, making it impossible to fault
> in pages from userfaultfd-registered regions.
> 
> This series follows the established int *locked pattern from
> get_user_pages_remote() in mm/gup.c. A new entry point,
> hmm_range_fault_unlockable(), accepts an int *locked parameter. When the
> mmap lock is dropped during fault resolution (VM_FAULT_RETRY or
> VM_FAULT_COMPLETED), the function returns 0 with *locked = 0, signalling
> the caller to restart its walk. The existing hmm_range_fault() is
> refactored into a thin wrapper that passes NULL, preserving current
> behavior for all existing callers.
> 
> Faulting hugetlb pages on the unlockable path is not supported because
> walk_hugetlb_range() unconditionally holds and releases
> hugetlb_vma_lock_read across the callback; if the mmap lock is dropped
> inside the callback, the VMA may be freed before the walk framework's
> unlock. Hugetlb pages already present in page tables are handled normally.
> Possible approaches to lift this limitation are documented in
> Documentation/mm/hmm.rst.

Thanks.  AI review asked some questions:
	https://sashiko.dev/#/patchset/177863991557.82528.15288076059759579141.stgit@skinsburskii-cloud-desktop.internal.cloudapp.net

I'd ignore the fist one: don't write buggy fault handlers!


