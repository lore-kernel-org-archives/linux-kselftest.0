Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80E1352C4F
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Feb 2026 19:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770838654; cv=none; b=OJpG/JHW309YgwEC+KynSUCbRBS5zNXhkacDmpYQVPn40hbWJD8UkKHg/AWmakMtQrIxX8aayGyJnVXMljG4U5jk3bmYVQtrJ2plSLx7Ht/q5aOVFRaROu9TbUppInxZbTfmaJ++zPogNzm411WQm0TtPatjOeNlChwtqMj/fw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770838654; c=relaxed/simple;
	bh=9E8xym4kPqUtQ4zv5yeII+4X0aDlSLDVsQXEk9VD660=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uVtN3FOwuFL8zwcWq7+9Mv2tXxCQjYW0ySLPsSbPVefgm7F/9GmYgzkG9oi+qRAzuDQRKMaLoe3CRU1TiICnss8RiVqR2jy50qUQvkerx6SGyBpWb+6/GZwlTYxxFgCXXZVk5o0jRF6h2WDXOWIaIo4smvlmtRgNs82AvWK0MOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ihwN/HIR; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=J+MuA8SH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ihwN/HIR";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="J+MuA8SH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770838650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3HnSln6BmAeJW+dBA3yyxX0sDcUZ80hLGHPfC7uKPVU=;
	b=ihwN/HIRHg+g6mpBpmGJ8eY6bzSpWKrv+syfIgYaD/dsg/zzxCkpNZwLaFRTszNuyXFCUF
	xz0CF3gR+EmOukogDW4fSjaO+sWWWEvg0LUdwfyKvwx/oIV6CnMO/q6pWBG3l9lIWVl8Qq
	Ed7b+o8Bm9G+HW3QhZSeSgLzjXIg8as=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-182-ERR2gxUJN3OPL0ek1uxfDg-1; Wed, 11 Feb 2026 14:37:29 -0500
X-MC-Unique: ERR2gxUJN3OPL0ek1uxfDg-1
X-Mimecast-MFC-AGG-ID: ERR2gxUJN3OPL0ek1uxfDg_1770838649
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6ad709d8fso306526785a.1
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Feb 2026 11:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1770838649; x=1771443449; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3HnSln6BmAeJW+dBA3yyxX0sDcUZ80hLGHPfC7uKPVU=;
        b=J+MuA8SHYGyELefHY2x7cOLzx67VNAKone7JYxXA7217PwFt94YzzuSs16VE6897Jn
         qpUAhSRKrS5xZRCdkp7VR/uOxMFW1zGoMz1lkyYkWJxz9Uod17sJD4di5Mnkipokpf1W
         8hKU4yxDQLF4SWACdXLnWFua5UoQkgrYn3PWpCGRes6AXA56PQhGLv3RwGgDax298ULt
         7Uo+yEllsuuBsD+nkoeEktYUIjaxeUOdo6VeTcZY5kQls3NbBisNf4190cX+B+/LDwbZ
         UP8oO6rJ/TCQyCw1DTtGW+2Pp4TUwDm9z2YnNaJzt1cXcChd9Y+uziYwN0SIYkaM1OMO
         hXTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770838649; x=1771443449;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3HnSln6BmAeJW+dBA3yyxX0sDcUZ80hLGHPfC7uKPVU=;
        b=C1JXjEjk2d9dvgjCjz7yaeQH7epRvfpQGeHkyit7wOytGYageXQnpTwXprGXvcMo4k
         /cZRfkFak1pju71K5HJjvqgF5IcuJF7HoM/euadvHVgbWoYagyNBr6ecsXNIIOJG7nS1
         bVvC1dU9f3YMtdP5xsinOEjegQ41Ipte8qLdQssJgducMOtO3WWp8LG9zuLQQGy7P3Fl
         pjawwmH8wyxnHiLm4mKk1fWGQSEOvgX4Xkr2E3Izbu97qqcZ7lduZSlhI+kLNfnYuiRd
         puF6DazJBLodwaEbaDqaTOKRw7sqTYPqM7kLDaFYVmAjfxnI3FN6JblPr2MP58CFEYJ9
         t0Bw==
X-Forwarded-Encrypted: i=1; AJvYcCXoXBuiQrwsOzNAcwSaxrJXILK0yE3vt1fIk9xKelZ+GxoF5AAQRsSUxo0lyMeYt57d2ESOYN8iox7j1LqWXV4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy54CZxdILeL5RnaQwuUaa/WRJujLpgvzIINMgvc/0RHYPN7aON
	rHsRkbppvrkFKjYKPPhIrg/9SYpGGDslzDww0M95gZfoD/y/B8dB3QvSUrbt8AYp2Arelv3Sd7R
	ftg5uGCkJdUpwMTMw4ZrYUfobltZ+HjhcPMFP9rnUxzXHvogcX5tLNPSmnOJPWqxKnvTe9Q==
X-Gm-Gg: AZuq6aK6ko3MWkPs8KsPefwT7+yl6qiJcRtt5UJhQW/QhyEYRkXJwDsbvavqUtTj0If
	xuGjFvE51k0fCC1VWJV0w+sqh+wPMfSRmBrib28fv+zjGtmlN3KsxzOkzjFwZEa/zuQMWletsrn
	Q2inTFGxRBQxeIZD1gOBriTUwDNfqhJg473wFV+3uskcH74AjfRn51kBdCdoOC6aeHwzB9cE45j
	uL+ON3Xdhri04o93QTR5V/nbMWl78KRhNft4Kc6st81utXMrqNEsZriKhtxV6mjfHjRQUvt9q38
	Ow2t2ek4gyq/xR3JK3scDqUf+nAzFsX84n8+ms9YiB60c9mgSnGAtm0Vj5/Wjo6iYBID1SEtlaP
	HB6Xic+F9K2Vb/cnIM6kCFS91Ey+SPhKt+8OBgYlAI3A9RrZwARywpf7DZVOS62S0N/E/FOUEb0
	Ga2za7QA==
X-Received: by 2002:a05:620a:bcd:b0:8c7:110e:9cd5 with SMTP id af79cd13be357-8cb33d8c6fdmr4445285a.45.1770838649071;
        Wed, 11 Feb 2026 11:37:29 -0800 (PST)
X-Received: by 2002:a05:620a:bcd:b0:8c7:110e:9cd5 with SMTP id af79cd13be357-8cb33d8c6fdmr4438985a.45.1770838648496;
        Wed, 11 Feb 2026 11:37:28 -0800 (PST)
Received: from x1.local (bras-vprn-aurron9134w-lp130-03-174-91-117-149.dsl.bell.ca. [174.91.117.149])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8971cd8aff6sm21074646d6.27.2026.02.11.11.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 11:37:28 -0800 (PST)
Date: Wed, 11 Feb 2026 14:37:26 -0500
From: Peter Xu <peterx@redhat.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-mm@kvack.org, Andrea Arcangeli <aarcange@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	David Hildenbrand <david@redhat.com>,
	Hugh Dickins <hughd@google.com>,
	James Houghton <jthoughton@google.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>,
	Nikita Kalyazin <kalyazin@amazon.com>,
	Oscar Salvador <osalvador@suse.de>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC 09/17] userfaultfd: introduce
 vm_uffd_ops->alloc_folio()
Message-ID: <aYzadvQRCw3iOVsc@x1.local>
References: <20260127192936.1250096-1-rppt@kernel.org>
 <20260127192936.1250096-10-rppt@kernel.org>
 <aYEhgA1dY0biVYb8@x1.local>
 <aYhj_H2X141wU3oF@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aYhj_H2X141wU3oF@kernel.org>

On Sun, Feb 08, 2026 at 12:22:52PM +0200, Mike Rapoport wrote:
> On Mon, Feb 02, 2026 at 05:13:20PM -0500, Peter Xu wrote:
> > On Tue, Jan 27, 2026 at 09:29:28PM +0200, Mike Rapoport wrote:
> > 
> > [...]
> > 
> > > -static int mfill_atomic_pte_zeroed_folio(pmd_t *dst_pmd,
> > > -					 struct vm_area_struct *dst_vma,
> > > -					 unsigned long dst_addr)
> > > +static int mfill_atomic_pte_copy(struct mfill_state *state)
> > >  {
> > > -	struct folio *folio;
> > > -	int ret = -ENOMEM;
> > > -
> > > -	folio = vma_alloc_zeroed_movable_folio(dst_vma, dst_addr);
> > > -	if (!folio)
> > > -		return ret;
> > > -
> > > -	if (mem_cgroup_charge(folio, dst_vma->vm_mm, GFP_KERNEL))
> > > -		goto out_put;
> > > +	const struct vm_uffd_ops *ops = vma_uffd_ops(state->vma);
> > >  
> > > -	/*
> > > -	 * The memory barrier inside __folio_mark_uptodate makes sure that
> > > -	 * zeroing out the folio become visible before mapping the page
> > > -	 * using set_pte_at(). See do_anonymous_page().
> > > -	 */
> > > -	__folio_mark_uptodate(folio);
> > > +	return __mfill_atomic_pte(state, ops);
> > > +}
> > >  
> > > -	ret = mfill_atomic_install_pte(dst_pmd, dst_vma, dst_addr,
> > > -				       &folio->page, true, 0);
> > > -	if (ret)
> > > -		goto out_put;
> > > +static int mfill_atomic_pte_zeroed_folio(struct mfill_state *state)
> > > +{
> > > +	const struct vm_uffd_ops *ops = vma_uffd_ops(state->vma);
> > >  
> > > -	return 0;
> > > -out_put:
> > > -	folio_put(folio);
> > > -	return ret;
> > > +	return __mfill_atomic_pte(state, ops);
> > >  }
> > >  
> > >  static int mfill_atomic_pte_zeropage(struct mfill_state *state)
> > > @@ -542,7 +546,7 @@ static int mfill_atomic_pte_zeropage(struct mfill_state *state)
> > >  	int ret;
> > >  
> > >  	if (mm_forbids_zeropage(dst_vma->vm_mm))
> > > -		return mfill_atomic_pte_zeroed_folio(dst_pmd, dst_vma, dst_addr);
> > > +		return mfill_atomic_pte_zeroed_folio(state);
> > 
> > After this patch, mfill_atomic_pte_zeroed_folio() should be 100% the same
> > impl with mfill_atomic_pte_copy(), so IIUC we can drop it.
> 
> It will be slightly different after the next patch to emphasize that
> copying into MAP_PRIVATE actually creates anonymous memory.

True.  It might be helpful to leave a line in the commit message so it's
intentional to temporarily have two functions do the same thing, but I'm OK
either way.

Thanks,

-- 
Peter Xu

