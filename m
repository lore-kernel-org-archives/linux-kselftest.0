Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792697962;
	b=QIYCbtB/rSsb7sckku4T3c2NmFlcd2H0GHiCvkpo/Zy84f8ruqnk1dtFAQyvKj40r3Ch
	 EkmIHwda9wJPlrBZSdYaqemcUa3tysgZlWgY2CCWRCMDyD7oLCBURbd2vyhPuedrfGTcx
	 RrNzC+xU2qZYBGLua4ez2PenDWm7zK8eVMv8pKbWWZ59MPpaRVskpjpJjMQcfUHRv5FVA
	 sJFxhFMlBckVTEiWQ5MbTh1a3Q5xwFmNSrDJvsYWnbcgGhcFiDj4LNlXMMdb9mg1wRmVn
	 3GfKyvZaPv4+8MV84NTpvz+pWQPTYLqmkWhmDhhH4Afhu6xT0tJrBjICPoXHKkDfTBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792697962;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=CXFOQ58yRb7ArLvRTOCPZICunogkgYzN7mdYgP5TB4k=;
	b=5IQQjPcvp7tq1Gu7dEsrk4c5VPfsY0c874m2tUmNyT1TdtCbPPgvmb6Q4HB+H70noR0j
	 KoEysdtmlKcMKrC2pgvBCpRrVEm25eClSx/qzK9PNM8oof/wOwwiGXKBGSzWIQCOh9wwd
	 c9kOlSLi2O+A0FVpTI5LOtB3R51tZVYIZE6sOOZlJDQ9Bcjr/dXDPjGHouynt0gunXSRJ
	 0N3oeOD2J/7pwGbf0uNYbkFP7KWARZzFUDIGiNUNlpq7LTupUL3Uaz2XYGbnUvdVZFHdb
	 9utoUZ+9VR64Cg9xWrSMpyYICFm1ZwFwKin7T9jl22l8aR1l+TdEtJ4xFptCNRMcLvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GI6wq92a;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176C8606A31E
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 19:39:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 176C8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GI6wq92a
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1ec92f655so1124985e9.0
        for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 12:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792697960; x=1793302760; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CXFOQ58yRb7ArLvRTOCPZICunogkgYzN7mdYgP5TB4k=;
        b=GI6wq92amG3nXNJXsW0bjacM5JKVAtiI+15FQxc2gYUuHQaZoVQXWcmIeHMtniURgc
         BWFJLZ0UhbDA8ScFjafYyvw6eQ/FrxXuLcfbrcZN9O+pczbA6iP5FlGylaiD/OnrSmPt
         rBPznyHGS7EWacu+54N5982SnUgeW9KwCAkW1BxJ8KkqJmyTikQx0VpItb+6KYw+dFG+
         P7uX6jcpYfdLqmNC/rKD42LaTtyh7ItkDB9U3gNiVAtuReY5gJxz96/Nl5fThSbgROZG
         13jJZfqJeTcen7XZX2fnE9IRfWJMCN6AWv/reSUKzZKsK4XylhuQLfU1Y0wc/d0VBUrf
         cfxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792697960; x=1793302760;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CXFOQ58yRb7ArLvRTOCPZICunogkgYzN7mdYgP5TB4k=;
        b=K3LCC7DGqAXmSuDOH+W34szNDz7JOSaFBKGcO3F+i8ufgrHHLOBr/wfGtJekM59mpF
         aDKpgYo0P7K423mcbVBSokbexIfrXiaMkDXQjtNhNGCdRJCUtJsRhgr5lR4jDbIEiYoh
         CjRoPvVdRGGbBlrCd/cH2yiQspCPj1Jq7F4cbQWjn6AA4HAuLU4arVhgG3v0rQWoCCel
         FwmXaLmFa9Wbq1Qa9dKknL+aSBUcvV8exupoMfehKjk/DwmdtrDk09+nQqpotELpzXq2
         6qsE8zt75v25MHz9K4bB15uVv+zJdbLiAYVBaQuEIXVLGJ1B46ENf9cP0ttOXIAyMQbO
         xEAw==
X-Forwarded-Encrypted: i=1; AKwUvBwCLBru57gd/PS2b4DJhdgGl2fASdgqn2nFwIiLYKNHvI6Uwq0/HNiI1xpXaUR4n9ctJzT6CG1876Wt0XfbEyY=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+87BPg1kCMLnbbPcpTRcNOtbwXKaC0NwmELB9Xp2A7gVX3DRS
	qmoi7OKbXyb2jYDFaKqDUtPkBlLS1vaC0b/V6CM2jNc4VlB5IUBZbipjBHNnbw==
X-Gm-Gg: AYBFou2F5w4C/GxbQ15UuQ9Raxey60pnAEFoJHzuRNgUZIFmqIOPkN43WRYFwL9DQRZ
	D7/jPes0pDUNXrLgSw99Y+ENE7JY4Uv0NZGxKp6uatEEcX1HgG/Y0OkQGa0eQYHWLjJKZsag7h6
	wlZZRPonU1+ruCwg7rPC4JGF3TQFwaAVUWJxu6Nsz72inUupmvc1AixzZkdk6WEfPNJ7JYSIHso
	K5mRrJD4sWPfw0Wec0jTI99ei6Gb5yBSDrjYDvLs+qcP/Eziek0Pp61I/PZX4BXnusfN+g9arEA
	nlCkETO9hiREK4jT3y8G4GwttcyqOUmAEikp0YD3S4LcXpRGDzvh+hBFeBVsbZCl/Jpgp1Q+VoP
	KxYZPv1fD94awWUjR+q3BkNtvA1KDmXekUQz8LM18SdMjd+70mbnF2/f+aK5Nd0oOzyEIbcjNIc
	bXDMW9Ay5AeAC+dz/eNZ/UtCdvysc8nsjCnYfdP+IoCbdOSO6pB7jdSCLHIzN/TabHM/4fU7dVv
	XAnnB9JHZSAmHt0mK8jtzoe7UrRem87BoBO3BtJhLU=
X-Received: by 2002:a05:600c:1d1e:b0:4a0:34a:588c with SMTP id 5b1f17b1804b1-4a211c859dbmr1721105e9.14.1792697960247;
        Thu, 22 Oct 2026 12:39:20 -0700 (PDT)
Received: from krava ([176.74.159.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2101cedcesm20827015e9.0.2026.10.22.12.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 12:39:19 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Thu, 22 Oct 2026 21:39:18 +0200
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>, bpf@vger.kernel.org,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>
Subject: Re: [RFC bpf-next 3/9] mm: Expose locked mprotect operation
Message-ID: <atpmZt_Je09hdlja@krava>
References: <20261021195759.119421-1-jolsa@kernel.org>
 <20261021195759.119421-4-jolsa@kernel.org>
 <atnjEc2-6CuKjFzH@gremlin>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atnjEc2-6CuKjFzH@gremlin>

On Thu, Oct 22, 2026 at 11:25:31AM +0100, Lorenzo Stoakes (ARM) wrote:
> On Wed, Oct 21, 2026 at 09:57:52PM +0200, Jiri Olsa wrote:
> > The bpf_user_page_exec() in following patch needs to change page
> > protections while holding current->mm's mmap write lock.
> >
> > Exposing the do_mprotect_pkey_locked helper for that.
> 
> Err, we'll need some more justification than this for exposing internal mm
> logic to the rest of the kernel please.
> 
> Note that you're already allowing any caller to bypass
> CONFIG_ARCH_HAS_PKEYS here which is immediately a broken thing.
> 
> >
> > Assisted-by: Codex:GPT-6
> > Signed-off-by: Jiri Olsa <jolsa@kernel.org>
> 
> It's a no to this in its current form.

yes I suspected it'd be a problem, but as you mentioned
in the other reply, Alexei's proposal takes care of that

thanks,
jirka

> 
> > ---
> >  include/linux/mm.h |  3 +++
> >  mm/mprotect.c      | 20 +++++++++++++++-----
> >  2 files changed, 18 insertions(+), 5 deletions(-)
> >
> > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > index 63f40e615754..47e853093601 100644
> > --- a/include/linux/mm.h
> > +++ b/include/linux/mm.h
> > @@ -3435,6 +3435,9 @@ extern long change_protection(struct mmu_gather *tlb,
> >  extern int mprotect_fixup(struct vma_iterator *vmi, struct mmu_gather *tlb,
> >  	  struct vm_area_struct *vma, struct vm_area_struct **pprev,
> >  	  unsigned long start, unsigned long end, vm_flags_t newflags);
> > +/* Caller must hold current->mm's mmap write lock. */
> > +int do_mprotect_pkey_locked(unsigned long start, size_t len,
> > +			    unsigned long prot, int pkey);
> >
> >  /*
> >   * doesn't attempt to fault and will return short.
> > diff --git a/mm/mprotect.c b/mm/mprotect.c
> > index 2888ee638d87..8d800830d3e1 100644
> > --- a/mm/mprotect.c
> > +++ b/mm/mprotect.c
> > @@ -868,8 +868,8 @@ mprotect_fixup(struct vma_iterator *vmi, struct mmu_gather *tlb,
> >  /*
> >   * pkey==-1 when doing a legacy mprotect()
> >   */
> > -static int do_mprotect_pkey(unsigned long start, size_t len,
> > -		unsigned long prot, int pkey)
> > +int do_mprotect_pkey_locked(unsigned long start, size_t len,
> > +			    unsigned long prot, int pkey)
> >  {
> >  	unsigned long nstart, end, tmp, reqprot;
> >  	struct vm_area_struct *vma, *prev;
> > @@ -899,8 +899,7 @@ static int do_mprotect_pkey(unsigned long start, size_t len,
> >
> >  	reqprot = prot;
> >
> > -	if (mmap_write_lock_killable(current->mm))
> > -		return -EINTR;
> > +	mmap_assert_write_locked(current->mm);
> >
> >  	/*
> >  	 * If userspace did not allocate the pkey, do not let
> > @@ -1013,10 +1012,21 @@ static int do_mprotect_pkey(unsigned long start, size_t len,
> >  		error = -ENOMEM;
> >
> >  out:
> > -	mmap_write_unlock(current->mm);
> >  	return error;
> >  }
> >
> > +static int do_mprotect_pkey(unsigned long start, size_t len,
> > +			    unsigned long prot, int pkey)
> > +{
> > +	int ret;
> > +
> > +	if (mmap_write_lock_killable(current->mm))
> > +		return -EINTR;
> > +	ret = do_mprotect_pkey_locked(start, len, prot, pkey);
> > +	mmap_write_unlock(current->mm);
> > +	return ret;
> > +}
> > +
> >  SYSCALL_DEFINE3(mprotect, unsigned long, start, size_t, len,
> >  		unsigned long, prot)
> >  {
> > --
> > 2.54.0
> >
> 
> --
> Cheers, Lorenzo
