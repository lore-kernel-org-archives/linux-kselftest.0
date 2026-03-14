Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F1A27AC4C
	for <linux-kselftest@vger.kernel.org>; Sat, 14 Mar 2026 00:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773448069; cv=none; b=Yo+i5YEPa5YgD7/uWVvu7xz76GCqcrA7JRnVEzDXVWrSePtQFDVkrzYbLTS5GABonHhru+b4kMMOYm8S/IH/DnKsn3++McorrlNYyu76k2uLfvpQqJV2zBWBHAr6o070cHtmVYTmNEcRHKqrXtyfuxDGrukgvJMeze5WDvYRfIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773448069; c=relaxed/simple;
	bh=s/+dOAh5gd2ytB1PdWu1kgEkdaK7LD6QeJihj4bz068=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mScr1JvKp70RG7oYHtryGg+k2i5Qn+rkjGZ15+varNZ8IzsUoQfOLvnHoAY9wUTvtExAAVDE1RryqYWSupn+CnibM/g/r84IdOdiG7Kw8IYb+R7QgyZXBTGcdN6tptL7l5L14gTE1GEdy7JOeUD0OBAyj6Ivau1IczY69uPHUM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D7jE7sZq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D7jE7sZq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773448066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VpuHCYoGS7oGl56imcuDsGIrqLNIijvaRFDQVaHkhGQ=;
	b=D7jE7sZqryZAfpGHl4HEl+ZGniyXXlZsdpajJ7GKvTBsOD9Z0mS8l0ehfXQ55wLGCuCzX7
	fanr9QcvL9Pjo89rsj1ZUMDGfsGELXIlaUAGWwU2YTzhsCMt2wutcS1pN7Ztpq+7HJrk65
	hPkm7xi9qNh/LFY9mjQPNB3OPk9HoIs=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-561-adaovf72MkGaZh_9ITwtHA-1; Fri,
 13 Mar 2026 20:27:41 -0400
X-MC-Unique: adaovf72MkGaZh_9ITwtHA-1
X-Mimecast-MFC-AGG-ID: adaovf72MkGaZh_9ITwtHA_1773448058
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1C91E1956095;
	Sat, 14 Mar 2026 00:27:38 +0000 (UTC)
Received: from gmail.com (unknown [10.72.112.67])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 18EAB18002A6;
	Sat, 14 Mar 2026 00:27:26 +0000 (UTC)
Date: Sat, 14 Mar 2026 08:27:21 +0800
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
Message-ID: <abSraSfIAGRpy4BQ@gmail.com>
References: <20260312114027.634559-1-chuhu@redhat.com>
 <abLHz2qjdeNqdFaZ@kernel.org>
 <abNZmiL2C7KMQM1t@gmail.com>
 <abQq-Mt0p3vz5rQm@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abQq-Mt0p3vz5rQm@kernel.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On Fri, Mar 13, 2026 at 05:19:20PM +0200, Mike Rapoport wrote:
> On Fri, Mar 13, 2026 at 08:26:02AM +0800, Chunyu Hu wrote:
> > On Thu, Mar 12, 2026 at 04:03:59PM +0200, Mike Rapoport wrote:
> > > On Thu, Mar 12, 2026 at 07:40:23PM +0800, Chunyu Hu wrote:
> > > > There are several tests requires transprarent hugepages, when run on thp
> > > > disabled kernel such as realtime kernel, there will be false positve.
> > > 
> > > I presume that when THP tests run on kernels with THP disabled they fail
> > > and it would be a false negative rather than false positive.
> > 
> > This is an interesting point. I'm not naitive speaker. I just learned
> > from AI. It really matters what we define as 'postive'. I presume 'postive'
> > is we run selftest and got a failure report, that's postive, not thinking
> > as it's thp disabled kernel and a 'pass' is postive.
> 
> I think that a passing test is "positive" and a failing test is "negative".
> So a test that fails because of misconfiguration is a false negative to me.

Thank you for the explanation. I unserstand now. Let's use 'false
negative'.

>  
> > I'll add statement about 'postive' in v2 like "a test failure is
> > defiend as postive"
> > 
> > > 
> > > > Mark those tests as skip when thp is not available.
> > > > 
> > > > Chunye Hu (4):
> > > >   selftests/mm/guard-regions: skip collapse test when thp not enabled
> > > >   selftests/mm: soft-dirty: skip two tests when thp not available
> > > >   selftests/mm: split_huge_page_test: skip the test when thp not
> > > >     available
> > > >   selftests/mm: transhuge_stress: skip the test when thp not available
> > > > 
> > > >  tools/testing/selftests/mm/guard-regions.c        | 4 ++++
> > > >  tools/testing/selftests/mm/soft-dirty.c           | 4 +++-
> > > >  tools/testing/selftests/mm/split_huge_page_test.c | 9 +++++++--
> > > >  tools/testing/selftests/mm/transhuge-stress.c     | 4 ++++
> > > >  4 files changed, 18 insertions(+), 3 deletions(-)
> > > > 
> > > > 
> > > > base-commit: 80234b5ab240f52fa45d201e899e207b9265ef91
> > > > -- 
> > > > 2.53.0
> > > > 
> > > 
> > > -- 
> > > Sincerely yours,
> > > Mike.
> > > 
> > 
> 
> -- 
> Sincerely yours,
> Mike.
> 

