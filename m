Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75D59443
	for <linux-kselftest@vger.kernel.org>; Sat, 28 Mar 2026 00:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774658460; cv=none; b=KlWEmvsx4DF+xnDMssSnNmTOU20Wyf/IA4KS/ay1+cg600p5l4hWWV9V/mNVoa3mU+N/7p1wzhaJJASnUJYalsIe85j7kZ74wJc3yfz3cqD9WNONMN6utzcFPY0BTv19wiKEv7n9N3kp5T6H5k6zaqcMiwpdIGJYlhLApUhG4oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774658460; c=relaxed/simple;
	bh=kkMbLQiF1yiu/4D1F7gdIJP7OU7OUWLGjeRdK2oxbv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t2f/XWsSiegUh4c2nHIqScSZXMU3vmk9+E8k4YeL5jIZ7np3Bn8jRKtwhqnEGNlQ3zIkXMv9VtGZp8Iev0buMMoluBcNe1vdn8V992W+G+qXxM/pWf3jStNhRklsA2meRn30Z/799vHw6aKke/bWymtiPkOtiTcaoCHJ+mgAk9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Mudcc9W6; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Mudcc9W6"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2b243198058so12855ad.1
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 17:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774658458; x=1775263258; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nStNyZTKOlE87jhF0HQxL1hyyc8Mzt87SSZU0LYZvHU=;
        b=Mudcc9W6ig0osqUmr9sB6PHER6SstR4CpEvrfwmPE+YKuPaqrG47VvZMRRzjmjFJo6
         OjBh0pza1AdQkf+w8PbAd8fNACt31lsYIHSrOAnwDnBcdYryrWZ9r+LIkKXhycv8c3dP
         nBGWncGC+Gj/fw6EgVyDRQfUTclAfK1xn5Lh5xyuY86bynaDW3Mt6Nv3zsnVdRcndwQt
         Ya/WIF6Mb91bp0qDXq7jn2hdd7DDpn89KEyRIiO7dc322yXgIwcd7QpUclinSxCogTyy
         1jE7MnQhFkVzt2Ki/qle+2gfw8E2j1lNTkGz1VNuURDyt/Lsn38cbATsmlZS52nOj/jg
         BfaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774658458; x=1775263258;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nStNyZTKOlE87jhF0HQxL1hyyc8Mzt87SSZU0LYZvHU=;
        b=EUnpRcD4f7qTKcdrtM1+4yRUpyL2a9MBUwy6T2g1uZHZbgt/0AT4XkvNkSuGI4xpM/
         PFIvOUK1j7F24yxTr9ddq93VscPRyIj3x1JrJZZL1g8Ts4ly4xyoRJcWJiokYbEGzlfs
         M7cckSzkD3BBagytT5pKbwaWuGO4rixjCg8lr75KK+PS3ts6wL/KGUnEKxOuYrko0tQu
         I9s8L2uiNq5vy1qDRR7XmStv089Z26lQmVNUQPQIvpGwnuKfJ/7+R1hgQYDaci17F8ZE
         l+bVz12PYQoh8M8+IM6KYw3FrMW3n6VqAORbuW9pJ36vHjeArQYndOo6z3ANEZ42dhrm
         S/yw==
X-Forwarded-Encrypted: i=1; AJvYcCXcdT4D3SE16xRGQGX8SvTfF00R3j55i/ki4mZ9NnSbSWY8HfwXWcguWajBE5eWH5t1xA9GM4HzW44zd6ttxfM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxnHjEsN8GhUK03HNbZNVFdHz18U50A+GIiDzmiZmIqoFkCUAm
	EGoUXtXqFGsJg4z7T1fo/8izM8Ff7dLH3KBIrpz4uHRyGhuOVWabL/vsebKWAt1iDg==
X-Gm-Gg: ATEYQzzZJuiSFo+6raTOc8o9VbnkeDL/sb1u60KATU3w2067PxcXH89bT9mFRJMNFdh
	sdIUIsI0Nwm774SYDaFxEFKFy+uSquXHS0+vKA1pdRhh0YYti3nI/F1DiWwN9cssLHqMCzuyIo6
	VtOIJsJ2nnEktHcwAGUUMaB7h6ulLog+6NFhjc0WTakSqP+AHlKgqWIu0c/YvIvUoWVveVYZnbV
	i9Rzew/TivGKURQQUhPEhWMKdShkf5UadKLgohBsuHmNRbwY/widMhiPC+1Z+H5JXu9jwNt7/yW
	Rr+ZRGOv8UdoULJ+skQma0CG0SQtIbATVtJ4+dxNb3mGrS+s8Qh4qzyrsAuEuEBIvFd+PBk2/Qp
	bFULTMp5ILcehTtvnwzBHb5I9Q5/PVejmXtEzTPRl1bnOKL1JFksIM2fzMDPqvfmffaSGAoyb8C
	Jj1CrMDF6eof+jDQNysLQThpFwno/izvznPOABBhUApGVSQpMXdPDQ51WTYkQ=
X-Received: by 2002:a17:902:ea02:b0:2a9:5ef5:399b with SMTP id d9443c01a7336-2b242d1addbmr913375ad.19.1774658457398;
        Fri, 27 Mar 2026 17:40:57 -0700 (PDT)
Received: from google.com (249.53.168.34.bc.googleusercontent.com. [34.168.53.249])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427c4cafsm5106475ad.81.2026.03.27.17.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 17:40:56 -0700 (PDT)
Date: Sat, 28 Mar 2026 00:40:52 +0000
From: Lisa Wang <wyihan@google.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Miaohe Lin <linmiaohe@huawei.com>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
	Hugh Dickins <hughd@google.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org, rientjes@google.com,
	seanjc@google.com, ackerleytng@google.com, vannapurve@google.com,
	michael.roth@amd.com, jiaqiyan@google.com, tabba@google.com,
	dave.hansen@linux.intel.com
Subject: Re: [PATCH RFC v2 5/7] mm: selftests: Add shmem memory failure test
Message-ID: <accjlG9lUyDQO_mz@google.com>
References: <20260319-memory-failure-mf-delayed-fix-rfc-v2-v2-0-92c596402a7a@google.com>
 <20260319-memory-failure-mf-delayed-fix-rfc-v2-v2-5-92c596402a7a@google.com>
 <78a855da-8fc2-4e85-90a0-6bf9af030c02@linux.alibaba.com>
 <acHeLL0l948jRchK@google.com>
 <52c26e05-5bbc-4f63-84bf-c4879a6de7d1@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52c26e05-5bbc-4f63-84bf-c4879a6de7d1@linux.alibaba.com>

On Tue, Mar 24, 2026 at 08:36:36PM +0800, Baolin Wang wrote:
> 
> 
> On 3/24/26 8:43 AM, Lisa Wang wrote:
> > On Sat, Mar 21, 2026 at 02:30:04PM +0800, Baolin Wang wrote:
> > > 
> > > 
> > > On 3/20/26 7:30 AM, Lisa Wang wrote:
> > > > Add a shmem memory failure selftest to test the shmem memory failure is
> > > > correct after modifying shmem return value.
> > > > 
> > > > Test that
> > > > + madvise() call returns 0 at the first time
> > > > + trigger a SIGBUS when the poisoned shmem page is fault-in again.
> > > > 
> > > > Signed-off-by: Lisa Wang <wyihan@google.com>
> > > > ---
> > > 
> > > Why not move the shmem memory failure test into memory-failure.c?
> > 
> > Do you mean let memory-failure.c kernel code check by itself?
> > The reason I write the selftest instead of combining in memory-failure.c
> > is because
> > + do not need extra checking code in kernel code
> > + make it easier to trace the entire execution flow, starting from the
> >    madvise() down through shmem_error_remove_folio() and into the
> >    truncate_error_folio() logic.
> > 
> > Pleas let me know if I've missed something. Thanks!
> 
> That's not quite what I meant. I mean, since there is already a
> memory-failure.c in mm selftests (see [1]), I think we should move the shmem
> memory failure test cases into that file.

Got it. Thank you for pointing out.
Is anyone currently working on the shmem memory failure test? If not, I
will merge it into my next version.

I have a question regarding the current implementation:
```
ret = sigsetjmp(signal_jmp_buf, 1);
if (!self->triggered) {
	self->triggered = true;
	ASSERT_EQ(variant->inject(self, addr), 0);
	FORCE_READ(*addr);
}
```
Here is difficult to distinguish whether the SIGBUS is triggered by the
injection or the read operation. I am considering splitting these into
two separate SIGBUS jump blocks. Is it reasonable for me to split them?


> [1] https://lore.kernel.org/all/20260206031639.2707102-1-linmiaohe@huawei.com/T/#m18e62ccb3e87316ec37dcde9389c1ba1c56d0951
