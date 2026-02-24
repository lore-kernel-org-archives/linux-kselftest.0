Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC18634321C
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 23:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771974514; cv=pass; b=fMWUshpMPU5jqQ4hdzyEUqCh6E1dbK9X5bdHHRJpFYPQMfu8uF9Jkp/9uwlmxbZY0Ptprm9hbE6A/4TK4LqEe+mwmOnVXPIDdt5nhytgaZosu8nSwQ9rWYCx8ivLH/j3nBmVt/qxawdGA0z1u5re/vXl4BFENoNFPfFmceucZOE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771974514; c=relaxed/simple;
	bh=28oWEEZoiQk0c8pFXW4FAksDMsn5TOYNsg+K52E7d0I=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hNzRUhYeEF4/vhRmIcB7iWTguRwWDudiEj9240Cnjo27yKCnO2xbc1GrPZjWOrHluwbysM9d3nkGXxeYjW0eExu/rm5NhBPnHEWKAuOxOvc7vD3UD9GdrbOozz7wJCgIQxXYzUNBEps8aoqPqkd6duxc1lLtpeC6KOB/QXG5LoU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qjaI4wnc; arc=pass smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qjaI4wnc"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-948029fb1f2so1683731241.0
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 15:08:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771974512; cv=none;
        d=google.com; s=arc-20240605;
        b=B0OqBOvGLQjc1jUGWAxEABCeBW01+qz+xb080l0HtZTtcMUZ4R0d75yzaRXCnXaF+v
         5tJCJ8vqq1k+O/RkrLTIOgenot2GkCejbkDCT0orYjIqAaY55ybRCHVqcLPSuEZOjy8p
         UxRYHst0fpnzGrIR+dUmHcv+kxULBi2JPCbdzvQ9hvZO2pFzO3UNNe5Psi57h8PSvnms
         eJ5vOS9fgDgTVreSZBPYlsUgH5zTs2HxJupzKzAkIVJkIrNK8rU+IrjzaGMtLOeezGRQ
         rULAq7h9N0bYvXyyvCQ9v/M39qdgx+AbXZ8xs3QWiH1fLg2DcqCnblf+wx4AR5nOtkXl
         bcdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=Xux2sJMsRceAq4Wg5BBVEZwRPNSVyPqjLyJ8Turb9tM=;
        fh=Bg29ftJ8MqGGiIbpkBTuvxgW/6TkVSCegVFykDq6ZT8=;
        b=Qpp5w81C6bvXwPxPkEkTWBq2azYSrK6YDNxQ1bgcbfqUjTzG76zRxWZPw2D2yRxSQ0
         Ky/Y6rFBhlShlFTycgk0gzL19ht70wk8hy9c/icUbKJaNleO8jh2+su6VEuSSui6RXW5
         YVW0OINMiSBZ29zNKztXY0Hmn7c+3p4Mwf8xhUukC5m/anrqMUGPxRySMwaU5UTThWsd
         u9xJrYB9ScQmU/5IhinxMySxHqwMD4gceU9umvgUVNgg4pX0yyFhn5Ia444Pf0SHz78T
         kOVANmMjFm+iydT3Dw8rH1z4wxwRksgbZgwYxLC8fB6jbJUEv9Ll3eh8mpMMo2JdfyhN
         AI8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771974512; x=1772579312; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xux2sJMsRceAq4Wg5BBVEZwRPNSVyPqjLyJ8Turb9tM=;
        b=qjaI4wncSBISX6RMiyYjW6b7vhKOb7K3rRqhHpgcw3cBMa34/9D2b2LhVwiUzcW1NM
         LM+e+JbVTdBdYV7oed9NR0e/npN6N4IN20/kvexzf1JHzwICpOSVhckPKqMtuf8nRj/i
         umt4eOPj1p+CJFBwhmI2biJxADyS2yKAfVaMY5Ckdvqv4iJlcnSFDr/k7BkuWU7XvKnD
         6xjMcoGQj9BlCV/x0mN7J7wtQmwhDvaesWdeyhqEl2FlQVUrn2KCKkbNeZCq6Lf311Kc
         GsyMNFVKNifRzFGjtjZernenD9waEcL8F8qVWnsijoga03aHMcDjwbFWIHzgURP4uHv0
         DsZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771974512; x=1772579312;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xux2sJMsRceAq4Wg5BBVEZwRPNSVyPqjLyJ8Turb9tM=;
        b=fS12YoPcoks1x6aUG5BNt/yE2B87FUXmwd3KS0U7DZkQ2PJI6zbuLo7XiCC8oWCWvE
         V058HXRWd6PU3kXpNaUyhgJfOxcfLN6UwSGDVcnl0kwIVVpL5WSGpaFfvuJSCaFln1fB
         /IkJvU0UtE1pOtrATztu626nkeV1JWA/9YAUyhc/pCNYm2N0DKy0/Ew5axkK2RVMLBQg
         nAgyLjMCUzbncf+99e/Bp+5zsWy///jo0H8MuLPszt80xBd2LuVTA9S3OSLITaDwfJ+4
         Qzu0sYTdUEyYLhc5ILpPIf5YUJN4sdolxNVeqjzz8E7JbFaD7S/KrGE5o2Umwqr34RAx
         Oqnw==
X-Forwarded-Encrypted: i=1; AJvYcCVitGRQmYaFQ6VqDzKJxIcs1SKzqNTPZgkjbuWAJJo+3jItehIf990YO7a8F4eojXgK+pN25Xa42hVhEdNaSdw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVTGl0Fgr0YgOCXT0P4haa50AWCaJHxbC8j4IAAdUlqaYcAccH
	E5hwAZiiSkAUSYPeSfJtlkGjfYbPAhI9bIw/BEvb+RqJK8fw0hWR/BaJAScLsY8SJYV3mbLbe69
	XhzCWQ1wUNjMLXG+IV+fqkV9tZ6ZUMLhmSqJoB8MG
X-Gm-Gg: ATEYQzxZewchCR7Thvt9G0D1AL+JDQe9A+ldHfW1kIavS80/nEqpBoiO7gWK2J4KfZ1
	t930q3JunKm2YQphVLwpoDGu6fPXOea0i4VkSDJXi5IxT/3RK9SQ/uhPd8WGi41Q0RAU9pEpyj5
	HT1E9vr3sUdO410Dz0PrDYJYdna4fsFSsXtm1h2/NPgtygJue5ULX7S1cq9d+zl9MFXs1r4zKhS
	JiPDhjIxlra+glzOeJ76brVJcHliq+FjjrZThH4qbjSVY5yBoTI64K1R4PsiyzWavXmOgy0YHsG
	G2uUwFFcb51ILiLWxODp9LcDC4QVtrMtW6TV8YltoA==
X-Received: by 2002:a05:6102:3591:b0:5f1:c4d3:5b37 with SMTP id
 ada2fe7eead31-5feb2f08b48mr5246678137.16.1771974511231; Tue, 24 Feb 2026
 15:08:31 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 24 Feb 2026 15:08:30 -0800
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 24 Feb 2026 15:08:30 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <9ef9a0bd-4cff-4518-b7fb-e65c9b761a5a@kernel.org>
References: <cover.1771826352.git.ackerleytng@google.com> <a97045a9-8866-40fe-aa15-d319cafa6f2c@kernel.org>
 <CAEvNRgFF0+g9pmp1yitX48ebK=fDpYKSOQDmRfOjzSHxM5UpeQ@mail.gmail.com> <9ef9a0bd-4cff-4518-b7fb-e65c9b761a5a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 24 Feb 2026 15:08:30 -0800
X-Gm-Features: AaiRm50613GkBCc5TY4oG7cVnbM-cLi0tM-0c-2O0j598MHU_6zRLimq98-hNZ8
Message-ID: <CAEvNRgESctVm9CcEyK36hY8Ta=DEDOS1oW5w0qRDoNfdd=470g@mail.gmail.com>
Subject: Re: [RFC PATCH v1 00/10] guest_memfd: Track amount of memory
 allocated on inode
To: "David Hildenbrand (Arm)" <david@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Cc: akpm@linux-foundation.org, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, willy@infradead.org, pbonzini@redhat.com, shuah@kernel.org, 
	seanjc@google.com, shivankg@amd.com, rick.p.edgecombe@intel.com, 
	yan.y.zhao@intel.com, rientjes@google.com, fvdl@google.com, 
	jthoughton@google.com, vannapurve@google.com, pratyush@kernel.org, 
	pasha.tatashin@soleen.com, kalyazin@amazon.com, tabba@google.com, 
	michael.roth@amd.com
Content-Type: text/plain; charset="UTF-8"

"David Hildenbrand (Arm)" <david@kernel.org> writes:

>
> [...snip...]
>
>>> Could we maybe have a
>>> different callback (when the mapping is still guaranteed to be around)
>>> from where we could update i_blocks on the freeing path?
>>
>> Do you mean that we should add a new callback to struct
>> address_space_operations?
>
> If that avoids having to implement truncation completely ourselves, that might be one
> option we could discuss, yes.
>
> Something like:
>
> diff --git a/Documentation/filesystems/vfs.rst b/Documentation/filesystems/vfs.rst
> index 7c753148af88..94f8bb81f017 100644
> --- a/Documentation/filesystems/vfs.rst
> +++ b/Documentation/filesystems/vfs.rst
> @@ -764,6 +764,7 @@ cache in your filesystem.  The following members are defined:
>                 sector_t (*bmap)(struct address_space *, sector_t);
>                 void (*invalidate_folio) (struct folio *, size_t start, size_t len);
>                 bool (*release_folio)(struct folio *, gfp_t);
> +               void (*remove_folio)(struct folio *folio);
>                 void (*free_folio)(struct folio *);
>                 ssize_t (*direct_IO)(struct kiocb *, struct iov_iter *iter);
>                 int (*migrate_folio)(struct mapping *, struct folio *dst,
> @@ -922,6 +923,11 @@ cache in your filesystem.  The following members are defined:
>         its release_folio will need to ensure this.  Possibly it can
>         clear the uptodate flag if it cannot free private data yet.
>
> +``remove_folio``
> +       remove_folio is called just before the folio is removed from the
> +       page cache in order to allow the cleanup of properties (e.g.,
> +       accounting) that needs the address_space mapping.
> +
>  ``free_folio``
>         free_folio is called once the folio is no longer visible in the
>         page cache in order to allow the cleanup of any private data.
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 8b3dd145b25e..f7f6930977a1 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -422,6 +422,7 @@ struct address_space_operations {
>         sector_t (*bmap)(struct address_space *, sector_t);
>         void (*invalidate_folio) (struct folio *, size_t offset, size_t len);
>         bool (*release_folio)(struct folio *, gfp_t);
> +       void (*remove_folio)(struct folio *folio);
>         void (*free_folio)(struct folio *folio);
>         ssize_t (*direct_IO)(struct kiocb *, struct iov_iter *iter);
>         /*
> diff --git a/mm/filemap.c b/mm/filemap.c
> index 6cd7974d4ada..5a810eaacab2 100644
> --- a/mm/filemap.c
> +++ b/mm/filemap.c
> @@ -250,8 +250,14 @@ void filemap_free_folio(struct address_space *mapping, struct folio *folio)
>  void filemap_remove_folio(struct folio *folio)
>  {
>         struct address_space *mapping = folio->mapping;
> +       void (*remove_folio)(struct folio *);
>
>         BUG_ON(!folio_test_locked(folio));
> +
> +       remove_folio = mapping->a_ops->remove_folio;
> +       if (unlikely(remove_folio))
> +               remove_folio(folio);
> +
>         spin_lock(&mapping->host->i_lock);
>         xa_lock_irq(&mapping->i_pages);
>         __filemap_remove_folio(folio, NULL);
>

Thanks for this suggestion, I'll try this out and send another revision.

>
> Ideally we'd perform it under the lock just after clearing folio->mapping, but I guess that
> might be more controversial.
>
> For accounting you need the above might be good enough, but I am not sure for how many
> other use cases there might be.
>
> --
> Cheers,
>
> David
