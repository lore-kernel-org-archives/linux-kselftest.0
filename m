Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299D23E8C5B
	for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 14:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779286331; cv=none; b=BcbS5oO4JQ+JFdXBD3TqPOoWlMSUzrYc49NYYAmzM6n9yFjXwCwqcnj2Ah87q7o6beY3V/AX6LKRrCwKOsGLtZ+11gcevQmJ0ZtoH28dZ/hcl2IvPVBaTMnp9ufQugD5nK2HQgiUzdOgF/Ioxi5IY7rPe6938OPJHY/dAXpzAzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779286331; c=relaxed/simple;
	bh=2N1sMKTzNJnEbxKXP67LDZnmahmTf3OBuRzLjC/o+Z4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EAKYCCTE2aqGtM4QYkjBrXFc1VeBlM4yogrIQADsiNYNDiVfpLIx4uWJIkrcB5x0bLfnkqPnJm8IQ4zMVkHdvTzxQ1MytTFFeTvQwT5wYaDZiERedPxhmqzm0VxUNZH+X6D/AsMJ7MzYQDhlpQY+n55OUxRVuWtbhhH65tyelGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DaqOJAE1; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DaqOJAE1"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ba0714574fso26702365ad.2
        for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 07:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779286329; x=1779891129; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zGS4g7trviZuWuV8kj9ji3KsBnr4BymorUPX2qH0oeg=;
        b=DaqOJAE167OL0IAiIBHFqqHTEbsb/qSLd3RCutK56IIKSnd05WXKORoFNLt8qJWquY
         ad9z+eUuBn4NUw3OCQU+x0drVRaXywhBMD+1XE8JRCSqgtLJw06fRZ9Ma8VUYlOc1dkA
         a65Po2Jzqs3M77W+ZqBkPNzFrQeF6v1bwB9CQUiFkbHX10riOyotWgz0uxtJWtsKbvQS
         RBFVAeSabl/QK+rBfCvkfHHeXPtTST30niyTtd4h2gh/xQ+uubU1/7X7Fs7aaiPEomKO
         bRHoo79tu+fev0SdMm453y9d0JyBzIQD5mbBV010qZ3/H1mxsfDT4K59b0J/DqRk8GAX
         h/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779286329; x=1779891129;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zGS4g7trviZuWuV8kj9ji3KsBnr4BymorUPX2qH0oeg=;
        b=SS6Y9czkKDcRD9h4C930yeH040Cyc/HKS7XhxWAWXYFSKyFO5vS9XY415HpEvsYqaJ
         bCH5hZoDEB1zfFLtUPlXxm4bo01QMCQ1Y8wFMOAN8j71RZH/HvNAjhfvOG2TMSONKA3V
         fqck6EE8PJRs+WhsseWz14c8YiSGExUWfZhpli+aV4glVJucAlDItnBzJDbE8bNlUa84
         oW6V1KXCLzjwY+Be+rjBzMEz0XjPYe8Uyu1U+PZZf5D+ZdRpqEK/xBZ80Wdrk58lZKMM
         6eboVkPdYW8U/N5cV595UBhC9mtYYnmKSM/dsh753za7zVCqveWx7wSkFLRpU+tSnMbj
         FT7A==
X-Forwarded-Encrypted: i=1; AFNElJ9nuThKWr8Eux7TmZUmpGyzfWztndGRk18GYOzosIPNhX6pRCod8wKxp5oqX8CywQdP/Rye/F9MqZm/laJWeFw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLZM+h6ORQDTqtZ0o5/wdivQEWR9crWzm18THGchqTrzdOxmRK
	p3otJIbL4L/1uygheqbvxhimbyI/JRwa6J4UpDmTdzUbuEBP1w/pLMZ3qOERFw==
X-Gm-Gg: Acq92OHC41s+GJ4D12o0sj5ZLaYqjFiNNoXnpWfKqcizxidTG6vwsZ/HyNwWcY4h/vI
	N/QR3ruL4HtuNrML9g1UM97ToUXyYIRC1p7ZZ4iBEgv4n+D5+NhipA9ZQCDV+tKJctDNY1f9ehb
	k/Q9iUx6FXdI7+qUvLjjuqjoGgr0hhiZLwZTYf8wi76Qx/yWRiiTJCB93n+jrIh9OgJVYXPg0kk
	gD53vP1ekQBIp6iK+mCNTeF9U/97R1l+zaL4X1T7sVWACsXaqAYmpPk/UWX3kKMa7JmJFW+wHpg
	oSZgBKUiOR7hZtQrW0eX53Dx1DJBfXLyE5lutHmAF8ioyX/cZGOayUVv35ddsvHEn34PlUbj4GZ
	DLJeXMXxgkolaChh4xCJlsb9AdJI5PjcUTzDogDF+fmQpMsbAnZBCjG5ySFKa4PqP2mv3qYHh+G
	t51TULvkv70B3enjIhw+AdEpPEMZVDnusaD1JQIRBGn4kEET6uuFPg5oe37WJf+cMqKQ==
X-Received: by 2002:a17:903:2907:b0:2b7:a350:463f with SMTP id d9443c01a7336-2bd7e8883d8mr164318035ad.10.1779286329405;
        Wed, 20 May 2026 07:12:09 -0700 (PDT)
Received: from skinsburskii (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d11ce67sm227565595ad.74.2026.05.20.07.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:12:08 -0700 (PDT)
Date: Wed, 20 May 2026 07:12:06 -0700
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>,
	kys@microsoft.com, Liam.Howlett@oracle.com, david@kernel.org,
	jgg@ziepe.ca, corbet@lwn.net, leon@kernel.org, ljs@kernel.org,
	mhocko@suse.com, rppt@kernel.org, shuah@kernel.org,
	skhan@linuxfoundation.org, surenb@google.com, vbabka@kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 0/3] mm/hmm: Add mmap lock-drop support for
 userfaultfd-backed mappings
Message-ID: <ag3BNjx2zJz31NTr@skinsburskii>
References: <177863991557.82528.15288076059759579141.stgit@skinsburskii-cloud-desktop.internal.cloudapp.net>
 <20260518104808.ba773348f8564303c4330a33@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260518104808.ba773348f8564303c4330a33@linux-foundation.org>

On Mon, May 18, 2026 at 10:48:08AM -0700, Andrew Morton wrote:
> On Wed, 13 May 2026 02:40:11 +0000 Stanislav Kinsburskii <skinsburskii@linux.microsoft.com> wrote:
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
> Thanks.  AI review asked some questions:
> 	https://sashiko.dev/#/patchset/177863991557.82528.15288076059759579141.stgit@skinsburskii-cloud-desktop.internal.cloudapp.net
> 
> I'd ignore the fist one: don't write buggy fault handlers!
> 
> 

Thank you for the review.
I addressed the issues found in the new self test in v3 of this series.
Please, take a look.

Thanks,
Stanislav

