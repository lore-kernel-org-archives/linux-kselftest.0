Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D1E1A681A
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 00:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774313012; cv=none; b=im7w2pWXddMiCtMjyaVqFs43gKGZDqdFY9iH1tmSdgPQpJzmAT0DbIDtdE+A4Y90Ro7GSsjiSo23KkeRldcnKz1qbgL+qqWvsCzJbL0db7oYq762EiXcgTPosLVsSJ+mZy4S9zIqtNuGZGWyHfXxsB+OaybrKe2ff/82WqxKEN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774313012; c=relaxed/simple;
	bh=Ste15H68ky2srs+pxlgivQ7lOAwgK8ZcuTuVNMeNonM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BZOgQP2BIdclKWD7SOP8hMTFrKw/twst+TKhMSgn9FpsbWerxxyxkpCQngsEpvidjUsFGL4TYXoK4Ge7IyD52H3XSA+WrywwbiDodT5Aqzvk11ZOyIpGsE9RumLu3f8UCNMNRdsVLd4C37/XOySdqkeiMt45SH3kHHPJ429PPH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OX6spqsc; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OX6spqsc"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2b052ec7176so23785ad.1
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 17:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774313009; x=1774917809; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tP4PkIA/dAss1SYdem97AuKhuaCH6Uwc8eZQpSWtLFc=;
        b=OX6spqsc8zEzdZTScN6XzmhqW18eIY4YaB5188BdmSFmnztPwCfDm2cQg6O4FIvb6i
         CRcsijlJdCNK8dHL1uZJOzViHUyJHUFuXe9DgQFtQCAGYZhzVYYfHzCTtMki18vCjgta
         vgF6kpLClXsrguNCn4OmqCqWg/z4m5zee8GuoXV0CRUtA+Og/pidUJV+Ydf4jBUS+YjJ
         kmR6hpQidpb2gzOs8NkyJsZUPXTCsGTDdRIG42JkAO3zERdde9riyqaYop5m4goo0rSH
         qe4+vrAvV4p3IU6x2kriLDeVJxrtHg0BzamVwBVCdiB+J0qFCeQTylIcTymQCLRi/cLa
         opYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774313009; x=1774917809;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tP4PkIA/dAss1SYdem97AuKhuaCH6Uwc8eZQpSWtLFc=;
        b=G6MPlyUueHoc/2LdZop9fYV7pwPp0sFACREhesCLc+ZQFwuyaa7lZR3Sb22EVlF0Ra
         OKiuQiyDex5y8Q8bzA4P7uqW8neWFtXexEPPqfjRWoQEOJyRsVARONg8Rj+qYSk//CuV
         NIl/JXxsmV8Nyd2MbBQBCPBoQLsucI3Od68yPX0nyazkTjU/Mgk8WZfTDvoKEZhJiJps
         CBy53kNDU7R9QdJzqli7h9Ol1vQrZ1mN9xqTApp5HLIA/sh+mSq/yidTd+VgZrH5TL39
         5sp2UA9tuPIXGxZN/cwJHwqMomGvOWRVO5HcqeJELh/3XXtOzqWIRbYCpR31Ak6EOJQf
         d5TA==
X-Forwarded-Encrypted: i=1; AJvYcCWAXYuxUViwsS0jdVmmhg2oxsD9FccHBAzYNkGhkCMneTbmNGCHaUjzYELV7Jc9qZ7jmkiqpSm3hmoahM0GHnc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1T8axs65Kp3sjwt9g2bjj+n7l4Ee0lNDXGAtVJ+OJkLS4IUWY
	JVvntjQuq2lxMKO+iZAr5HCt9wj7e7pFMGEplMU0B7vbz6fHgMMpLpy3OdLsAdnZCw==
X-Gm-Gg: ATEYQzw19p8R5Ekaoi8yA++xwKIJh12LxmoSfc05j2l5z8jBqcJlKTwGuZi1Q9lW7ZE
	YXWVRqANu2/qHJ4/xgg2io6bxm7Enl6DI3/ZfCR547FNLA1dgP7/TQgNivkikg3ldLNXSIHkvbP
	Dm3XPv5j1rTDM8VbJXS0i0462aw9fWtHKGdDRlQmSSZB47Kku8mUoWV70Sp64gKinnol/hlKbMP
	3R1/q1pxFBonqtM11hEuZDbh3wwzZdFfHjhDGsuwMU2/PkNHS/cD7i70v+ATG6+vkIW3tsPuWya
	VhtY082zGonXrUHmkGieXM6C+613fx1mxfW4PL7LF7aOrwm7cX+XUVnkrrml2GinaiBnZe1CvEi
	+tbpnZsfzhCDV1cUUya4O8+uhy5v7uX9naw45oF9L3FrNWV82asiFrpCpTM/Mf+vZ0HxXFTBuBG
	4++EQPq/RrBbtW50zJULokqZaRbx4bcKEL55KsWxlxx1v4bcjOZswOJT2qrxA=
X-Received: by 2002:a17:902:f54b:b0:2b0:5b4c:a439 with SMTP id d9443c01a7336-2b0a5405594mr1757525ad.2.1774313008753;
        Mon, 23 Mar 2026 17:43:28 -0700 (PDT)
Received: from google.com (249.53.168.34.bc.googleusercontent.com. [34.168.53.249])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0409c6besm12352073b3a.32.2026.03.23.17.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 17:43:28 -0700 (PDT)
Date: Tue, 24 Mar 2026 00:43:24 +0000
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
Message-ID: <acHeLL0l948jRchK@google.com>
References: <20260319-memory-failure-mf-delayed-fix-rfc-v2-v2-0-92c596402a7a@google.com>
 <20260319-memory-failure-mf-delayed-fix-rfc-v2-v2-5-92c596402a7a@google.com>
 <78a855da-8fc2-4e85-90a0-6bf9af030c02@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78a855da-8fc2-4e85-90a0-6bf9af030c02@linux.alibaba.com>

On Sat, Mar 21, 2026 at 02:30:04PM +0800, Baolin Wang wrote:
> 
> 
> On 3/20/26 7:30 AM, Lisa Wang wrote:
> > Add a shmem memory failure selftest to test the shmem memory failure is
> > correct after modifying shmem return value.
> > 
> > Test that
> > + madvise() call returns 0 at the first time
> > + trigger a SIGBUS when the poisoned shmem page is fault-in again.
> > 
> > Signed-off-by: Lisa Wang <wyihan@google.com>
> > ---
> 
> Why not move the shmem memory failure test into memory-failure.c?

Do you mean let memory-failure.c kernel code check by itself?
The reason I write the selftest instead of combining in memory-failure.c
is because
+ do not need extra checking code in kernel code
+ make it easier to trace the entire execution flow, starting from the
  madvise() down through shmem_error_remove_folio() and into the
  truncate_error_folio() logic.

Pleas let me know if I've missed something. Thanks!
