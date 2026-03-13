Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64E21A5B9E
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 00:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773361589; cv=none; b=Otm3v9xp9oJA7CSgs1C5ftli7u95Bg/e2UghhOe4/zDJyYofUKUm00SowXeo0iI/yAggNSrJBDllQL9p25M6hGthqG/xk9mlGfXAjN6d5ZiAkJb9wESAWOin/PW5O42rj3uMyabGL8YRvY3itUB5WT+Qm1LhDP3Rb37YnhD+RMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773361589; c=relaxed/simple;
	bh=ZPy8ZzMN8npJ4fuX3Wa/GJ7H2ZWdN2LM7NfIB5u+Ue4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vyo8wTCwgrCBVaIsgPg/tcly11ec9dtBu1aVPGa3hX30cmbl0a2nrXq1cwMwjSYimCi+efIUbhFhWKOO6Wx+j6D32TVbqyRNYs+7EYDNk3vyRmC4hngi1ZkIXZqKUao+Q1APnWlbnLf8DSfKYGkYg9K+X/nlrOVyQIWRn/5K+Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EC6CT44F; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EC6CT44F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773361587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nE/5qQ6YtvkKGa4AVChhKiXkIX3R8WJepoP9vC2ImQA=;
	b=EC6CT44Fn/Q9h712RBdylvt9f21ALmMiXOM860gsu2wHxhsIX/t8o2GAFEScgOkaWQsFPV
	8G/aCYIHVUbWI9aHWclUPL/++l28R5MmR9HE5SEGKPbHdW6b6Wf72jeSLcxyUCVYZampbO
	sBtU09ISEFy9siNyu7aRAyJEuxKjYNo=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-543-gzx9QGhPMpeQBlVAMoUedQ-1; Thu,
 12 Mar 2026 20:26:22 -0400
X-MC-Unique: gzx9QGhPMpeQBlVAMoUedQ-1
X-Mimecast-MFC-AGG-ID: gzx9QGhPMpeQBlVAMoUedQ_1773361579
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 367B81953991;
	Fri, 13 Mar 2026 00:26:19 +0000 (UTC)
Received: from gmail.com (unknown [10.72.112.110])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EE07219540C5;
	Fri, 13 Mar 2026 00:26:07 +0000 (UTC)
Date: Fri, 13 Mar 2026 08:26:02 +0800
From: Chunyu Hu <chuhu@redhat.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: akpm@linux-foundation.org, david@kernel.org, shuah@kernel.org,
	linux-mm@kvack.org, ljs@kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, surenb@google.com,
	mhocko@suse.com, ziy@nvidia.com, baolin.wang@linux.alibaba.com,
	npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
	baohua@kernel.org, lance.yang@linux.dev
Subject: Re: [PATCH 0/4] selftests/mm: skip several tests when thp is not
 available
Message-ID: <abNZmiL2C7KMQM1t@gmail.com>
References: <20260312114027.634559-1-chuhu@redhat.com>
 <abLHz2qjdeNqdFaZ@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abLHz2qjdeNqdFaZ@kernel.org>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On Thu, Mar 12, 2026 at 04:03:59PM +0200, Mike Rapoport wrote:
> On Thu, Mar 12, 2026 at 07:40:23PM +0800, Chunyu Hu wrote:
> > There are several tests requires transprarent hugepages, when run on thp
> > disabled kernel such as realtime kernel, there will be false positve.
> 
> I presume that when THP tests run on kernels with THP disabled they fail
> and it would be a false negative rather than false positive.


This is an interesting point. I'm not naitive speaker. I just learned
from AI. It really matters what we define as 'postive'. I presume 'postive'
is we run selftest and got a failure report, that's postive, not thinking
as it's thp disabled kernel and a 'pass' is postive.

I'll add statement about 'postive' in v2 like "a test failure is
defiend as postive"

> 
> > Mark those tests as skip when thp is not available.
> > 
> > Chunye Hu (4):
> >   selftests/mm/guard-regions: skip collapse test when thp not enabled
> >   selftests/mm: soft-dirty: skip two tests when thp not available
> >   selftests/mm: split_huge_page_test: skip the test when thp not
> >     available
> >   selftests/mm: transhuge_stress: skip the test when thp not available
> > 
> >  tools/testing/selftests/mm/guard-regions.c        | 4 ++++
> >  tools/testing/selftests/mm/soft-dirty.c           | 4 +++-
> >  tools/testing/selftests/mm/split_huge_page_test.c | 9 +++++++--
> >  tools/testing/selftests/mm/transhuge-stress.c     | 4 ++++
> >  4 files changed, 18 insertions(+), 3 deletions(-)
> > 
> > 
> > base-commit: 80234b5ab240f52fa45d201e899e207b9265ef91
> > -- 
> > 2.53.0
> > 
> 
> -- 
> Sincerely yours,
> Mike.
> 

