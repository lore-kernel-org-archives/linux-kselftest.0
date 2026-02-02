Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F1A332906
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Feb 2026 22:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770070408; cv=none; b=eMW5XddW5+OD56SqGMbRD4VOK2tkBGRKzMy9pycpVP8QIPC8mcSYlWVyPWxxSS8pP9NJH2O/ka/JL7pg+oPg4pnFkQ6ivQfxVfZzOAG4QiD4x2s6sImHZDllL3ZejlfPrVvSAHrhbrops5h8147l6be4TkKYDAqdP2nPJ66VSQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770070408; c=relaxed/simple;
	bh=N0sSOQ0f8rnPwD/KRhdnLNJC/bfbDb56Wa9rXTXP8zs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OJPmjAyqkUMSXAXC/Pwh1HxxEwjCp+u5o81EFXi2OiA9aqxFMaCRfsH6M3V6ebejGrAr2QHnSWqAdJ9V8XKAJohw02N8zWN7U4n6YTsg1m0VGVJUN82vkiO/sWHYNtbxQo+yAQ1YfMeXfYoehQGB45pM6p1MaIb92AIEXj4ZI58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ltf0x0Wy; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=SR6wQaiG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ltf0x0Wy";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="SR6wQaiG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770070406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NetS+z/lB9Vjk8awsEzStStR7YjfBL5uvT3v62JS7ho=;
	b=Ltf0x0Wy6kmHmj9tEr/RbFjqlhD1gTcAYB/I2Z+GFR4RahbluTBUL0et5uLkf/vIrkSwfh
	OAty3MRPDLL9JmdwicGbvQJBMjmGwT04xQLibrjXDhByihzL5PGyB8Sdte77VLy48m7qOj
	vkh2faPXgzcAmDgIBXPJ6IlpRr2P7bQ=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-VSqCN1cNPwmffZetUa04yA-1; Mon, 02 Feb 2026 17:13:24 -0500
X-MC-Unique: VSqCN1cNPwmffZetUa04yA-1
X-Mimecast-MFC-AGG-ID: VSqCN1cNPwmffZetUa04yA_1770070404
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-894766748f9so286082466d6.1
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Feb 2026 14:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1770070404; x=1770675204; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NetS+z/lB9Vjk8awsEzStStR7YjfBL5uvT3v62JS7ho=;
        b=SR6wQaiG3cJugALih14e1Q8AYRYx0rjUn4H5fzdlrg5DlYkrYS9QaTpH/uKHYp9ATm
         4iw7MXqNNsBxIMZaRx4YCuWkfZyjk1nD8UkvqOY/cthB5Kgop1ZzkDgSkZVOIkKO+7zr
         2csupAfzHy1Wf85n4zuSK8Ns6DtKCtDqlPLdTsDPuGrLHs1wbBSWULcXbjXnDS54cwwx
         s+Bzc90FFxjT/SWoDCx9Y6SgP3PHFZ1qsueUhYubfVMcPTG1toEutKu3g1Hn1BeoB4dJ
         S9Z5Iw4YNv9GxBmQPVYKAN/5F6rDzEduQLDm4PBkZJjFnJgyql+N3TCa5Yp9h34J1l3S
         SKqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770070404; x=1770675204;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NetS+z/lB9Vjk8awsEzStStR7YjfBL5uvT3v62JS7ho=;
        b=s4FUsMinM3GngErMM0FWSh3htAA+2WufI5rUN4hEe6qFJfzLItjGZxkYkId5rMEgrL
         YyOGW01SnEpPq15DFuok7WCGSSmbWGl8jg6lBrJtOW4qx+0qMb9DMXRIgy6Lr9x43PsH
         J0dujlOL2ep8XDNHcxrRjLC0et0cDl7UAOBJQnwuzZF0G38g8PqaVwAm1KbKOCjIx2f4
         zhx7PqF70vXMLqv+Zni8Ew7LQj1BqB9ZDKYcoGt/d8MvqZ+2bGStKdSd9Eg83V7pDCp5
         RmBcDCZ04SxKd6K3Hu1vtxUTjWiZWcvKj1uFzSC867sBUFfUztFd448Q0iVBbAJomrvH
         zIPw==
X-Forwarded-Encrypted: i=1; AJvYcCX56mq4uqphBfkoUuBlHKUpPr9iw5Kpy8eY+WuvC7oHkGsIr3O+WFoX9OAvZTKgispjSehFHK9GYBj4bZE8ai4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2d+wXwtEkeYFbT7NVmrtcdvo2Sp5XwH7o8EUvps/vV2cL6xBv
	sYfyivo91HgXgESBl1n9c1bPUI0ykqripXY4vp5j9iHiFqIrU26qpvAdkrtb1Zl6WQE+nZqfAsm
	eXVNNItAh+o5EdFuQSSCshTuMot3r29p8jQ9UBp8juYT0L6ul+xnUhQ8aQFx20MsO5qAgdQ==
X-Gm-Gg: AZuq6aImbVmDjVvaLIuB8L+W1+z5n7NRYsHRE6iQlb9uBoEDdvaFMVOqOndbqE98lch
	rqvUSCcQcknUA/OxBRUcBeMl/rBvo4L43EPEDfrBaInN9aA2bH2z0XH4wFKTEGrNWRnyn7OXpu3
	gXt4ghYvKE5gKYWcCSEW3LP2qCjLziVeo64fWPJs4ahoLiqQ7TIn+hcT9bAxHgd+Tg9sDwlzu8f
	VR4/vHRE0kJDDIPpxjAzHp+o1hV/JdpsguUemPbJBHjnlt6vcpHuI5naOVULvqLiFdoH4NA7Wv1
	pKx8fGg3LhXg1nIahsDYgf88p7WRXEgiWsHV3Zjg9eykYSRN29vK3ZbSsUda9Pnif65emmKBmyz
	u2ME=
X-Received: by 2002:a05:622a:28d:b0:4ed:af59:9df0 with SMTP id d75a77b69052e-505d228ac43mr152974621cf.40.1770070404190;
        Mon, 02 Feb 2026 14:13:24 -0800 (PST)
X-Received: by 2002:a05:622a:28d:b0:4ed:af59:9df0 with SMTP id d75a77b69052e-505d228ac43mr152974231cf.40.1770070403763;
        Mon, 02 Feb 2026 14:13:23 -0800 (PST)
Received: from x1.local ([142.188.210.156])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50489d1b52csm101407911cf.8.2026.02.02.14.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 14:13:23 -0800 (PST)
Date: Mon, 2 Feb 2026 17:13:20 -0500
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
Message-ID: <aYEhgA1dY0biVYb8@x1.local>
References: <20260127192936.1250096-1-rppt@kernel.org>
 <20260127192936.1250096-10-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260127192936.1250096-10-rppt@kernel.org>

On Tue, Jan 27, 2026 at 09:29:28PM +0200, Mike Rapoport wrote:

[...]

> -static int mfill_atomic_pte_zeroed_folio(pmd_t *dst_pmd,
> -					 struct vm_area_struct *dst_vma,
> -					 unsigned long dst_addr)
> +static int mfill_atomic_pte_copy(struct mfill_state *state)
>  {
> -	struct folio *folio;
> -	int ret = -ENOMEM;
> -
> -	folio = vma_alloc_zeroed_movable_folio(dst_vma, dst_addr);
> -	if (!folio)
> -		return ret;
> -
> -	if (mem_cgroup_charge(folio, dst_vma->vm_mm, GFP_KERNEL))
> -		goto out_put;
> +	const struct vm_uffd_ops *ops = vma_uffd_ops(state->vma);
>  
> -	/*
> -	 * The memory barrier inside __folio_mark_uptodate makes sure that
> -	 * zeroing out the folio become visible before mapping the page
> -	 * using set_pte_at(). See do_anonymous_page().
> -	 */
> -	__folio_mark_uptodate(folio);
> +	return __mfill_atomic_pte(state, ops);
> +}
>  
> -	ret = mfill_atomic_install_pte(dst_pmd, dst_vma, dst_addr,
> -				       &folio->page, true, 0);
> -	if (ret)
> -		goto out_put;
> +static int mfill_atomic_pte_zeroed_folio(struct mfill_state *state)
> +{
> +	const struct vm_uffd_ops *ops = vma_uffd_ops(state->vma);
>  
> -	return 0;
> -out_put:
> -	folio_put(folio);
> -	return ret;
> +	return __mfill_atomic_pte(state, ops);
>  }
>  
>  static int mfill_atomic_pte_zeropage(struct mfill_state *state)
> @@ -542,7 +546,7 @@ static int mfill_atomic_pte_zeropage(struct mfill_state *state)
>  	int ret;
>  
>  	if (mm_forbids_zeropage(dst_vma->vm_mm))
> -		return mfill_atomic_pte_zeroed_folio(dst_pmd, dst_vma, dst_addr);
> +		return mfill_atomic_pte_zeroed_folio(state);

After this patch, mfill_atomic_pte_zeroed_folio() should be 100% the same
impl with mfill_atomic_pte_copy(), so IIUC we can drop it.

>  
>  	_dst_pte = pte_mkspecial(pfn_pte(my_zero_pfn(dst_addr),
>  					 dst_vma->vm_page_prot));
> -- 
> 2.51.0
> 

-- 
Peter Xu

