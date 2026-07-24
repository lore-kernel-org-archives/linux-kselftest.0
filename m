Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5719446065
	for <linux-kselftest@vger.kernel.org>; Fri, 24 Jul 2026 19:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784922509; cv=none; b=RxpZ1eWhQRgpL6RY0n/Z7qn/+Kh94alXRY7IJrCRLkMbWR9vGf9DFUCG4iDLpOxLH15jjXM4VymJ98ZHXTuwW9EOV1bM9lhPB0xhsL5jYTIdqKzAolpBVtBlW0cydgkCSKn3XnPVnLH0Lo4B5xew67h23+ozWQ1z0DC4YsV7Ijw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784922509; c=relaxed/simple;
	bh=6JaW2CJ3ULCkwVOoX5NuGKKy3Kj9jbVqqCDn/8yObzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WfIfKsENlRnLD6fI6P4i/7kfJpUgVP6gtUVLs2dJDS8euyve+KLsekZuPgABN09Z/GH//X6u2QQ8Dob72YKG1vdRQDqShMSFW7Uzjoj6A42ntNlY/WjK9qL1fkgpOir3wdjt/aMofKnpIgizpZCUzLpbfr6LmuOBYfbYBafH4bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mGEawQtH; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mGEawQtH"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38759bcd877so614560a91.2
        for <linux-kselftest@vger.kernel.org>; Fri, 24 Jul 2026 12:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784922506; x=1785527306; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ioc+vYD1TGm3PkR61xqfpxrMbvRpPmr2378lUazgynQ=;
        b=mGEawQtHUY1XKF2L7zBeq39mprbtf6ZDP6rsAfDHPicfS8vcsi80LucEASSakqB+kb
         Snr+yzYDNO1d9eyVf9GRoG6tQM3JDHKko+KvpYtCJqmV86D9B8bKWzd4RDuWPCyaWdns
         YoGbsqOB30klAsGD9Fob39gynqZxlOutIHUSWMPfaeClWlzIB6vmEJdkc692ufPC1bvB
         TpJ3pFQf63C2tmfZQYvDT70S/jhVO53KjBh+S917zCHv1/8+FVgXT55KytmnVlTSxJLN
         FEWTpaHQHVM1jxPEEE2Iwh1Yhk66TyNl9y/BZ3XsgHPDaR5YROEsTBwQZonMzkp+LyGh
         R+BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784922506; x=1785527306;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ioc+vYD1TGm3PkR61xqfpxrMbvRpPmr2378lUazgynQ=;
        b=j4toDrxVX64hefZBf1vrjn66LgyUEl4OBVeB1uZH8FNFONDRpcr5pZQAdpdHVU/ToL
         ge7+Xg9AbB1/JGIYNy0qzr+ZnaOhezIlbje5jT644PBAEya4Z7aJqegZgFl1Q3sCd/CQ
         VumaW63UCd8Am8WMyRS9N3pH+nd3XCcaDAiMbXBm2W7zV3r3Y9cYaSl6HSSrjZReH0v7
         fZ/SAu51eXHfz0219cecdmT3J7F7KmPa4HHjENdEGI/RWt9BFqC7g9Vw0MluqYdQDiu/
         hYRyRRMBX7x56EO5oJ7qBNHdl5AH/sjttc9ueK0jobHZSUCqU7YBZYAKs/qRhcPWPBzX
         84bw==
X-Forwarded-Encrypted: i=1; AHgh+RqQW0j/7iiFMVvKasK1M58Ul9C1Zhn8HCSeDlgRNJ6WkamChJwZfpbuog+pNCxZtWQ1iIh7mPwK5clwvhCmojY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmVsjN/21YyxX0Bi3ZZo47WzeEe6vBmW/1lKueIPNJd0CPXntt
	V59/6bcU5Lxxx30APezC/t0w85Qa2b5QeLtfAsX5kZk5NosRt3/Uyt7V
X-Gm-Gg: AR+sD12Gy7C2hnuiFeg3kR2hYq22QUxV5F+P8mtw5y0oIm91Zr/ZprkJoKRej5FeQck
	cK3P2Epefu7R7Q5Ov81+dJ4/yX2lwkBDIFoUioZqMnmwu8KyCqzIKloiTpIWZ62q2AVs5NaKyXf
	Afp8LFueNMd5XIsDJDDTjkLWuQnyntthFE7lZt67DapgntDluHAQ+kFgPY5k4YsC/8u36heZqTa
	ed0g/0upoDOFxYCQdnorUVqjaJ1+zpf0nJ9KD+yLLFAvMKwf3LUNG41jsySnZvZ7Z1d8KzqEhaI
	RGEYSzxQkWAscgWZr6y1dZnziz09uZW03OsLFq8sRle84RDdhm/E+JTmstXr5nLwXQlFQ6ZTjD1
	fCSpKPWai2DFalK6xge/HDMM/QoKzTOyoU5SAgiJDj94j4Xf5cNDj08ComjpbvgdvxyGsA9CCxf
	N3/LD8Txq/03ZcTHMWd3ccFkWSJbEcJcDxNlyyDkIxrVtk
X-Received: by 2002:a17:90b:3904:b0:38e:584f:2515 with SMTP id 98e67ed59e1d1-38ec6aae88emr8486005a91.37.1784922506003;
        Fri, 24 Jul 2026 12:48:26 -0700 (PDT)
Received: from skinsburskii (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f0417599csm2037544a91.9.2026.07.24.12.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 12:48:25 -0700 (PDT)
Date: Fri, 24 Jul 2026 12:48:22 -0700
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>, Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Min Ma <mamin506@gmail.com>, Lizhi Hou <lizhi.hou@amd.com>,
	Oded Gabbay <ogabbay@kernel.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-hyperv@vger.kernel.org,
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	linux-rdma@vger.kernel.org
Subject: Re: [PATCH v11 1/8] mm/hmm: move page fault handling out of walk
 callbacks
Message-ID: <amPBhhqIbdUQdlPf@skinsburskii>
References: <20260723-hmm-v10-v11-0-c55b003a4b61@gmail.com>
 <20260723-hmm-v10-v11-1-c55b003a4b61@gmail.com>
 <7655eaad-dcbf-4275-93f6-1f92ffedfa76@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7655eaad-dcbf-4275-93f6-1f92ffedfa76@kernel.org>

On Fri, Jul 24, 2026 at 09:00:24PM +0200, David Hildenbrand (Arm) wrote:
> On 7/23/26 19:36, Stanislav Kinsburskii wrote:
> > hmm_range_fault() currently triggers page faults from inside the page-table
> > walk callbacks: hmm_vma_walk_pmd(), hmm_vma_walk_pud(),
> > hmm_vma_walk_hugetlb_entry() and the pte-level helper all call
> > hmm_vma_fault(), which in turn calls handle_mm_fault() while the walker
> > still holds nested locks.  The pte spinlock is dropped explicitly by each
> > caller, and the hugetlb path manually drops and retakes
> > hugetlb_vma_lock_read around the fault to dodge a deadlock against the walk
> > framework's unconditional unlock.
> > 
> > This layering does not extend cleanly to fault handlers that may release
> > mmap_lock (VM_FAULT_RETRY, VM_FAULT_COMPLETED). If the lock is dropped
> > while walk_page_range() is mid-traversal, the VMA can be freed before the
> > walk framework's matching hugetlb_vma_unlock_read(), turning that unlock
> > into a use-after-free.
> > 
> > Split the responsibilities the way get_user_pages() does. Walk callbacks
> > become inspect-only: when they detect a range that needs to be faulted in,
> > they record it in struct hmm_vma_walk and return a private sentinel
> > (HMM_FAULT_PENDING). The outer loop in hmm_range_fault() then drops out of
> > walk_page_range(), invokes a new helper hmm_do_fault() that calls
> > handle_mm_fault() with only mmap_lock held, and restarts the walk so the
> > now-present entries are collected into hmm_pfns.
> > 
> > No functional change for existing callers. As a side effect the hugetlb
> > callback no longer needs the hugetlb_vma_{un}lock_read dance, and every
> > fault-path exit from the callbacks now releases the pte spinlock on a
> > single, common path. This refactor is also a precursor for adding an
> > unlockable variant of hmm_range_fault() in a follow-up patch.
> > 
> > Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> > Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
> > ---
> 
> Any reason my RB got dropped?
> 
> https://lore.kernel.org/all/0b9be5b3-93aa-407f-b83d-409bec4b55e1@kernel.org/
> 

No reason, just an omission on my side.

Andrew, could you add David's RB to this patch, please?

Thanks,
Stanislav

> -- 
> Cheers,
> 
> David
