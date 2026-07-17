Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228363C3BEF
	for <linux-kselftest@vger.kernel.org>; Fri, 17 Jul 2026 10:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784285695; cv=none; b=HuvzHMUM+3wHZ4wU3sm5uP4JH7efKSB2bkcgCEDKyj5c7ZAn1f/DOgw21ifqQBWrWDb6TJAYNpCAPRXaAatQMXuOfIjg+NUc8NcBeq+A4BLU9sqHxZyTIfJ+GG9ygfJBsrJhufy1Hg9Cqdf5drkFsBrvvFfHtuq4K/gnswxdFIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784285695; c=relaxed/simple;
	bh=eP+z1ixtoCe+0oRVg4H6s0Je1AGY0Qr5A37IexhHK7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o8zIyH6i6t0KUwyR2NtCI5+JCW8osQvcx0tWSMYJTew41m8sS1gRVVa6DSWFjOkcY4CdLA6xvsID2Tfx5hPiKOVpg0dyyIKAkqt5Y0M6iCZtH1JEKYpw7/QXS+KEZkip2iIptR9v943mZ5BtmIL2+SadkAwxPpHo/awZPXubO/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=SL1aWbTi; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="SL1aWbTi"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784285688;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/jspK+i7PV2OkCpw/VGmALnVNM18ZrBEmMfRXtms9YQ=;
	b=SL1aWbTivZlCzU/c1+GieaDPFVr9kxy0z7pK8QNhUsfPkI+uWX9uk6qoh9DYvkMNu+CBTG
	zAJyNoM1FrKsNUSTHF4vfjTG3LXnk89u1vioIJP2rhOfaHstodh93BxlfqraK6yKGAf+Oy
	wfrEUeBIplCPpdZGSgHbwJP5Kp5hOoU=
From: Hongfu Li <hongfu.li@linux.dev>
To: david@kernel.org
Cc: akpm@linux-foundation.org,
	hongfu.li@linux.dev,
	liam@infradead.org,
	lihongfu@kylinos.cn,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	mhocko@suse.com,
	rppt@kernel.org,
	shuah@kernel.org,
	surenb@google.com,
	vbabka@kernel.org
Subject: Re: [PATCH] selftests/mm: Fix BUG_ON checking wrong variable in mremap_dontunmap
Date: Fri, 17 Jul 2026 18:54:24 +0800
Message-ID: <20260717105424.96127-1-hongfu.li@linux.dev>
In-Reply-To: <6aa00b1b-7acd-4080-b202-0bc87f1454d2@kernel.org>
References: <6aa00b1b-7acd-4080-b202-0bc87f1454d2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

> > From: Hongfu Li <lihongfu@kylinos.cn>
> > 
> > In mremap_dontunmap_partial_mapping_overwrite(), mremap() stores its
> > returned remapped address into remapped_mapping, while the BUG_ON
> > incorrectly checks dest_mapping instead.
> > 
> > If mremap() fails, dest_mapping still holds a valid pointer obtained from
> > the prior mmap() call, making this BUG_ON never trigger at all. Correct
> > the check to validate the actual mremap() return value stored in
> > remapped_mapping.
> > 
> > Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
> > ---
> >  tools/testing/selftests/mm/mremap_dontunmap.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/tools/testing/selftests/mm/mremap_dontunmap.c b/tools/testing/selftests/mm/mremap_dontunmap.c
> > index a4f75d836733..96ba537facf7 100644
> > --- a/tools/testing/selftests/mm/mremap_dontunmap.c
> > +++ b/tools/testing/selftests/mm/mremap_dontunmap.c
> > @@ -313,7 +313,7 @@ static void mremap_dontunmap_partial_mapping_overwrite(void)
> >  	    mremap(source_mapping, 5 * page_size,
> >  		   5 * page_size,
> >  		   MREMAP_DONTUNMAP | MREMAP_MAYMOVE | MREMAP_FIXED, dest_mapping);
> > -	BUG_ON(dest_mapping == MAP_FAILED, "mremap");
> > +	BUG_ON(remapped_mapping == MAP_FAILED, "mremap");
> >  	BUG_ON(dest_mapping != remapped_mapping, "expected to remap to dest_mapping");
> 
> Given that we know from a previous
> 
> 	BUG_ON(dest_mapping == MAP_FAILED, "mmap");
> 
> We can just drop this line completely and rely on the
> 
> 	BUG_ON(dest_mapping != remapped_mapping, "expected to remap to dest_mapping");

The subsequent BUG_ON comparison will implicitly catch the MAP_FAILED
condition, so this check is redundant.

This line will be dropped in the next revision. Thanks a lot for your
review.

Best regards,
Hongfu
