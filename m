Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43D5347BA7
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Mar 2026 06:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773730314; cv=none; b=PbDU8mjIy0bM5eOzB5EDJ8CXYsy7PNdhGHXH/qT2WH/bmF4EeGSJbk2PsE/CvTb3GI7qm0yaFdO1BpDJmlY8xO+dN40DxA+Dp/mXtygbXr2u/rYm/VPYNBIJeN6VtOKsv+BGsxFNmCJ/rAlWaWM+AZId3QEmnZ3Ky6X58qS3eFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773730314; c=relaxed/simple;
	bh=8WxwfbcArJuAOXJ/xdNZ6mYzOX2my8N3e4Yv3NASY9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KeaE/46af0noKZ94ilZdB6l9D3bWdDjvCmBjXFAndxMW6GtevUie9uJeMtHyXnhtLpAvy1sfEmtyRH72RsIGf2r6jjdvZI+CI8Yz6IV10dkTa8v0eHVhxR3WvD6mhTB5gUXwyD4RTCsZm7OfZo+dqVjNkPlQd44m/k7Q7EVhTn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z64OCw/i; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z64OCw/i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773730311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TL/fWTjraSCjuZfGO3tSrGYlWQVfbLF6OpcjEIyvfWw=;
	b=Z64OCw/izRGuy6iMGmbpm3+nlfv0UXs7rgpzQvJXfJ42hByTKw1ybMPMZZUnzNQOe6q4KD
	uBGEH+xTrlUqmaeR0QW7kL1+80/lOw2fHbaBOLIyo1JLUGbtGipux+ScNZhCczsMCaPGW5
	02CVCVdVvDR6hQOIyIsa4A8kppc4uBo=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-680-ZAKWPj5aPtqNY99GEXHHvA-1; Tue,
 17 Mar 2026 02:51:47 -0400
X-MC-Unique: ZAKWPj5aPtqNY99GEXHHvA-1
X-Mimecast-MFC-AGG-ID: ZAKWPj5aPtqNY99GEXHHvA_1773730304
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 84CF01956062;
	Tue, 17 Mar 2026 06:51:43 +0000 (UTC)
Received: from gmail.com (unknown [10.72.112.28])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 79B383000223;
	Tue, 17 Mar 2026 06:51:33 +0000 (UTC)
Date: Tue, 17 Mar 2026 14:51:28 +0800
From: Chunyu Hu <chuhu@redhat.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: akpm@linux-foundation.org, david@kernel.org, shuah@kernel.org,
	linux-mm@kvack.org, ljs@kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, surenb@google.com,
	mhocko@suse.com, ziy@nvidia.com, baolin.wang@linux.alibaba.com,
	npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
	baohua@kernel.org, lance.yang@linux.dev,
	Li Wang <liwang@redhat.com>
Subject: Re: [PATCH v2 1/5] selftests/mm/guard-regions: skip collapse test
 when thp not enabled
Message-ID: <abj58FQF31aaIMM-@gmail.com>
References: <20260316044335.1390608-1-chuhu@redhat.com>
 <20260316044335.1390608-2-chuhu@redhat.com>
 <abegwBHT_2nlmWKM@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abegwBHT_2nlmWKM@kernel.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On Mon, Mar 16, 2026 at 08:18:40AM +0200, Mike Rapoport wrote:
> On Mon, Mar 16, 2026 at 12:43:31PM +0800, Chunyu Hu wrote:
> > When thp is not available, just skip the collape tests to avoid the false
> > positive.
> 
> ... to avoid the false negative

Oops, I missed this one. Will update.

> 
> > Without the change, run with a thp disabled kernel:
> >   ./run_vmtests.sh -t madv_guard
> >   <snip/>
> >   # #  RUN           guard_regions.file.multi_vma ...
> >   # #            OK  guard_regions.file.multi_vma
> >   # ok 89 guard_regions.file.multi_vma
> >   # #  RUN           guard_regions.file.basic ...
> >   # #            OK  guard_regions.file.basic
> >   # ok 90 guard_regions.file.basic
> 
> It would be useful to include output of two failing THP tests rather
> then just the output of the last two test.

Will update in next version. 

> You can also add '-n' option to run_vmtest.sh to reduce amount of leading
> #, but for that I don't feel strongly.

Good to know. Thanks.

> 
> With that updated
> 
> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> 
> -- 
> Sincerely yours,
> Mike.
> 

