Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9F63515C9
	for <linux-kselftest@vger.kernel.org>; Tue, 25 Aug 2026 16:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787675207; cv=none; b=HAD4j7J37kuYySTz+s2kmdf077QadT/29LVH41JpA7iU01R7av+6MjaSOubv22ZbS0NJ0/TTQZ5FvFePFzGWBXnVKCuWFOm5arOd1NTksrwoWNQ8MJ5xfhz8wLoSao+o6HBZpYNt9VYNatcs90/jPWp57zOHgB5catBtSYZl2NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787675207; c=relaxed/simple;
	bh=fg9K1ZPJMtQO9eSSEqdgakx5ncAJu4D9kJT0Hx6NHkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ap7YWTDzfCyjJoVt8vHzOLJR8cx12P9DOtsjk1agMBAESvZX9rmlWmQlRZhmnb3lgJVkkVT4iU2HRtYIamb49Er/J5S6F3Acz8tskJjLvwFm8oevFYralcDwSX8kunMaE2+H9N5CqtoweM7lXRjQG1UOmJTb/cptNGHPPeAEDbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=MLv17mEL; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="MLv17mEL"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c160420289bso720462466b.0
        for <linux-kselftest@vger.kernel.org>; Tue, 25 Aug 2026 09:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787675204; x=1788280004; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k0fZPjbR+xEB7NjgLf/DwoW1nbxA9k8PLKOgb8wsBaA=;
        b=MLv17mEL8rRll1BGD1TXxHOza41xU8OgfAz2a7rW+B6z14GaKUzMQZADTvr38wORuS
         SuusYMUpKmQ9lKhgy8SBXbLH9VOsuHScKzsNeB5jwyLZ6b+7otR0aeNldaiOeYlG6mYx
         dbMQHR9Rzt2aE+oua3k0+aC7PonOZm1GzMZel5jyYUfunFCNNAZQL90Q4zC0Jp2b0sny
         EqpLnYk/AGDB3qoYOzV2o/4MqB6lNkAHOqhrmKVTE5xjX3ijK7KxmX5n/4VI7xTyADfM
         HoJnaS9Qz36oJqzDADvNBYitH2OOO4ArXnki6w0yOr3TDGV3PAV4isTNCgPBBOBIkqrT
         SxtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787675204; x=1788280004;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k0fZPjbR+xEB7NjgLf/DwoW1nbxA9k8PLKOgb8wsBaA=;
        b=p14+lkSeIvXFJJwEGZi/faH2SONkNa6/kB+zdukyCnAF9hamCrkWoDymz5/7ZAW6IJ
         vHZfelIIKATiUgrEwfTbt1BsIikxkF2b3OAmD8dC2zyRUBdSqD+Rz1BOfE+nJWmwDwjX
         vahT5LCAgfc0h4PY89ZrIJTEypWLBYeuL5KdNtycjJFXd1smJG1R4f1FFpckewDNtwXu
         g4cMBfdt4ylfXoZXOh95wZPECvBvy9hqdFtRf6p+cEoN9CtTuWG2xhSSuz3VNuY4PhbE
         aw+vULhRbIjqscx0b9Ma0mtqwKQnvbuQG0gjIp/fXTPZu3a+yViGQbkFbZvXa1Fsc8Hu
         bB5A==
X-Forwarded-Encrypted: i=1; AHgh+Ro4vOL6KYchXy2/gmsP/Wwv6qsIF4GRz0V3EPexmt542uby6ep4G8A2Gnpxyz4wsdEX97570Q4Vk62A+8QvIiQ=@vger.kernel.org
X-Gm-Message-State: AFuF++li1sLhAB+XFY95cNLG+3hnFbWYGQAJJl8QtvmyBt6fDFjThUmc
	ndgagInLqTrOZs7Nsp7H5sA3Gq4aIAcEbAlMjCAn5rU95P/pDD9h//8/l/YtPDT/NNg=
X-Gm-Gg: AR+sD13DcslrqKALn01vBDNiz94RNSdBXYp7587AMPE2OoYOXcW1WXGXbtJK0G2s51E
	G5KpGFFbCdCZUQiO7EPb/YDt9drx7zJ3fTts9Qwe0TCJD4M2flQrGOKK3VTt6cXVAnRobXGF27X
	ed9J48hdAPNCW8iBgVflUijRo30/QXaBqE+ypZCC3IW8+nCyybbisgIsujaTzISqSndhYnhdH8Y
	W/SdH9SMBlgXcjIoUknd92KHyRTGoGQvEaR+EYnr9xtj9GhathoJH1OnNV7cWb7ZAuhKvD4SqVM
	xg/RP0ayIYIXScvV5BAL6mFB8v4WoLniDb7DehteAoyvb5ZuaqJNRAbNmDTjn6EVhMVwPTLG0gM
	cT3y7oy+3yroFX35odotmEpuMlRmAU/fgRgplesBv+IKB1m5ytE/4BG4z/UgMsqGCQD7m2etrEN
	KyGBOUlYVkZcACd425kdutWAl+20EXeERAy4eqY91vCSs0XEWSyDreuEJearSRCv3eobgMysg=
X-Received: by 2002:a17:906:6a25:b0:c16:12ff:dc8d with SMTP id a640c23a62f3a-c246a69a22fmr4068886066b.14.1787675204061;
        Tue, 25 Aug 2026 09:26:44 -0700 (PDT)
Received: from localhost (109-81-80-32.rct.o2.cz. [109.81.80.32])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a9b2817sm30467766b.53.2026.08.25.09.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 09:26:43 -0700 (PDT)
Date: Tue, 25 Aug 2026 18:26:42 +0200
From: Michal Hocko <mhocko@suse.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Eric Chanudet <echanude@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>, Shuah Khan <shuah@kernel.org>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, Maxime Ripard <mripard@redhat.com>,
	Albert Esteve <aesteve@redhat.com>
Subject: Re: [PATCH 00/11] mm/cma: charge cma allocation to memcg using per
 area counters
Message-ID: <ao3CQicH0t-k95NA@tiehlicka>
References: <20260821-cma-memcg-regions-v1-0-d21b165b8440@redhat.com>
 <aowHqqaqK7TeexQH@tiehlicka>
 <ao2gA_m3BCBu2esy@echanude-thinkpadx1carbongen13.rmtusma.csb>
 <5970a8d4-fe7c-4dde-bdc8-1c66bfb57f12@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5970a8d4-fe7c-4dde-bdc8-1c66bfb57f12@kernel.org>

On Tue 25-08-26 17:45:56, David Hildenbrand wrote:
> On 8/25/26 16:47, Eric Chanudet wrote:
> > On Mon, Aug 24, 2026 at 10:58:18AM +0200, Michal Hocko wrote:
> >> On Fri 21-08-26 14:56:52, Eric Chanudet wrote:
> >>> CMA allocations are currently unaccounted for by cgroup memory
> >>> controllers. As system resources, they should fall under memcg, but CMA
> >>> areas partition the available space for different purposes and memcg
> >>> doesn't have a good representation for that.
> >>
> >> Which CMA usecases are covered by this work? It would be also great to
> >> spend more time describing usecases.
> > 
> > We would like to offer some usage guaranties to userspace processes
> > ending up doing allocations in CMA.
> 
> How does this e.g., relate to hugetlb allocating from CMA, to then charge to a
> hugetlb cgroup?
> 
> I always thought of CMA being a low-level allocation mechanism with various
> different use cases, and actually the higher-level users should decide how
> to/what to charge instead.

Exactly. There are many different users of CMA all with different
requirements. Then there is CMA reservations if an area is shared and
the overall memory consumption. That is why I am really not able to
wrap my head around this proposal.


-- 
Michal Hocko
SUSE Labs
