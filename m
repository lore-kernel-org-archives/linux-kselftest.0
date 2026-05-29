Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170C635F603
	for <linux-kselftest@vger.kernel.org>; Fri, 29 May 2026 01:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780019441; cv=none; b=CNDkHjG30fD5aK1WdzMlBUArTaq9T/gX1OYqFaWddbNGJ806YYIzAG7H9NUY8kMBijQYyABkzlh0i4JHEuaTX7PsR08pVu7MD/qEwtp2sb9aPdUdPsCBQJ3uI0NLqhyvWdGeUEAWy3UilVIcg78o1ZeXBqr9JuzjiL3br2D0mEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780019441; c=relaxed/simple;
	bh=z6ul2iSYHx7bNBVwVdRjS2Ct2gkqgUejWkhv0z58E/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jXKp8HmiRhQ7ShtKEp6cnEAdOdmK346iUfDGu9gHQJardaY8zHjbzR9ATI6lBMgW5JPYDiINdBQQG2ifnkljJadmWoYRz3WK4SDDrXvmmii1gFClkvBqRoejUbZzg7ciLj30E1d4nzveARKVhlkx6gKf6RtoEhWdAlccY+IRNYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mAiaczmF; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mAiaczmF"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2bf22c18ad3so705ad.0
        for <linux-kselftest@vger.kernel.org>; Thu, 28 May 2026 18:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780019439; x=1780624239; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m9cgyM3T45VB0R0AJ+i6AIRCS6VXeh3YG0DOWXJUVS8=;
        b=mAiaczmFFWDvG/be4/GwphXCeFAzXnVaRCKm4CPH+DAjDl5A5Gv9DPojIiwenrTNcj
         CN+ROD3M4GBahcMldxGfbi5WHdAa3jerFlDb7ix4sl7jItdqjDYMw0rYdFjfGfiZt1GS
         nehUfbJ9z2ciZKH+EVNS5DC5VId/klnk32sHhYb0fjuwQpXziLzVIVlwpC6DJ5awWpFt
         l5SP1hRsQeZTpglIAyzAbWznz909N1ufowx23to2MvZRAQMUEAPC7NFGHCpLwnRaWzvU
         QGxyGNASadbl6lKmNUpplOyncgWY8RaAL5Lb5jqMTbByfsql/NTSmJivuMgERAqoKvlt
         B8zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780019439; x=1780624239;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m9cgyM3T45VB0R0AJ+i6AIRCS6VXeh3YG0DOWXJUVS8=;
        b=fsp0yplvQJPKtBxO6+UXmoqX4SN25eGpL2QucCMHw14shFtvX9HhpxW8Xaz+V4h+Rm
         Kn5e86oKl/ytrl2JpvvwfUbpCQF9YveKcJSAFJo7abfL1X1B3f40U2DXTWOhFET/IDT/
         biAAYM+MbT/QKU+SehnHh0ub4exli1w3dPKV4GIMXJFECGMGtg1IyVDtzrwaiFxdx6ce
         4J2TJsAdzIjm0QVkt492psj3xJjYUqfpSpouzHW1Wtb5a+o6fLB2zSxYMdvtDziwL1eb
         jmKLEAxflYeortyUZ2CfKntPY8Dywd3v2gWSw/sTeNMoyp06dgx7+gteo1AZXa6VBNie
         FH1g==
X-Forwarded-Encrypted: i=1; AFNElJ9UlWMcc43+Y/C0gboIqVjH+pIBlscUSHN0cjLyFim5h8C64EhapeS/e74Vjosf96kHvREvRcMgbwQrCbcFj5E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwivpDh7E/xGLysQqiDoQasOlmH8fthSujG1R+zotMGwJkLpxFS
	dagI/dOgIBTmEXzwuWC2AUfcQYEAAWw18KawUg5I42zvn4VWOWTL8PDyU/tMqpj6nw==
X-Gm-Gg: Acq92OG6RP/SCj3iOzfz4CGZL/7dc03RBklOQZ/HYU21aXnnxkBX08PIR64alGZgzvy
	osdh6lRUsPveTw5i3I5zS2VjcrM3sgYfsIHjXKXm7p6IhXu0hmuae1wIFAkKQdUetKleZ82eJoJ
	tv48W5fPhSXwRrbO64mboTOXe5JhtzcFOoeRJg1+JSbzFnG63yf1tWZN/2scCPBKNCFa1fVExAX
	yUoUFvPYAFfkjgxHrCvx+MvEommQocgTaIXC36XMZt/X6u1xnSPBsDL4fAIPg4SS9GLvJadLFwZ
	aTccSKuE/kn7jNe58wlTB0/I7STWS/7kegTO2t1Qz5ldVASdW9w/Hh2v77qZOyhXEXpMdAAHshK
	7ew17j42DJbGudBu2fTLX9aahdxUw0AI2Y9SoxnCvQ69K3pDYt21EMqIbnS49Puap9MWPWnikFR
	x2GJ75AMSJtxiQIStOCGKdWFl50fdi11xmN+wb9iFJxR4VWKl2CpQtTIcHbnB8d5Q1W+I=
X-Received: by 2002:a17:903:2f87:b0:2bd:7e8e:ad56 with SMTP id d9443c01a7336-2bf20bb1260mr880215ad.6.1780019438855;
        Thu, 28 May 2026 18:50:38 -0700 (PDT)
Received: from google.com (230.0.127.34.bc.googleusercontent.com. [34.127.0.230])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214b000ebsm103770b3a.11.2026.05.28.18.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 18:50:38 -0700 (PDT)
Date: Fri, 29 May 2026 01:50:34 +0000
From: Lisa Wang <wyihan@google.com>
To: Miaohe Lin <linmiaohe@huawei.com>
Cc: rientjes@google.com, seanjc@google.com, ackerleytng@google.com,
	vannapurve@google.com, michael.roth@amd.com, jiaqiyan@google.com,
	tabba@google.com, dave.hansen@linux.intel.com,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
	Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC v2 6/7] KVM: selftests: Add memory failure tests in
 guest_memfd_test
Message-ID: <ahjw6l7uznZ2bYfz@google.com>
References: <20260319-memory-failure-mf-delayed-fix-rfc-v2-v2-0-92c596402a7a@google.com>
 <20260319-memory-failure-mf-delayed-fix-rfc-v2-v2-6-92c596402a7a@google.com>
 <149c954e-dfe1-6bdd-295c-792642a9d915@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <149c954e-dfe1-6bdd-295c-792642a9d915@huawei.com>

On Mon, Mar 30, 2026 at 03:20:15PM +0800, Miaohe Lin wrote:
> On 2026/3/20 7:30, Lisa Wang wrote:
> > After modifying truncate_error_folio(), we expect memory_failure() will
> > return 0 instead of MF_FAILED. Also, we want to make sure memory_failure()
> > signaling function is same.
> > 
> > Test that memory_failure() returns 0 for guest_memfd, where
> > .error_remove_folio() is handled by not actually truncating, and returning
> > MF_DELAYED.
> > 
> > In addition, test that SIGBUS signaling behavior is not changed before
> > and after this modification.
> > 
> > There are two kinds of guest memory failure injections - madvise or
> > debugfs. When memory failure is injected using madvise, the
> > MF_ACTION_REQUIRED flag is set, and the page is mapped and dirty, the
> > process should get a SIGBUS. When memory is failure is injected using
> > debugfs, the KILL_EARLY machine check memory corruption kill policy is
> > set, and the page is mapped and dirty, the process should get a SIGBUS.
> > 
> > Co-developed-by: Ackerley Tng <ackerleytng@google.com>
> > Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> > Signed-off-by: Lisa Wang <wyihan@google.com>
> 
> Should we add a testcase for hugetlbfs? It seems hugetlbfs_error_remove_folio() behaves same as shmem.

I agree that it would be more consistent to modify
hugetlbfs_error_remove_folio() to return MF_DELAYED and update
me_huge_page() to align with me_pagecache_clean().

However, I prefer to let this patch series focus on the
me_pagecache_clean() path (affecting shmem, guest_memfd and generic
pagecache), because the hugepage memory failure test is not working now
(hugetlb-read-hwpoison.c). Commit 66802526298e changed madvise()
behavior to always force-deliver a SIGBUS to the calling process if it
has the poisoned dirty page mapped. Aligning HugeTLB would require us to
fix this part together.

To keep this series focused, I would like to handle the HugeTLB
alignment in the follow-up series. Would you be okay with this approach?

> Thanks.
> .
