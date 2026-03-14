Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB6A22FF22
	for <linux-kselftest@vger.kernel.org>; Sat, 14 Mar 2026 00:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773447749; cv=none; b=M5C0FP3MtD+onL0BEAIRqPZdrGn3a5jgoZsQ9OEeaux63Y6AoodKMu6FUAucj1ACyYA7FgdxOre6ANb+dwsA7llvPo4Do5k9U0DP+BAxL1FLNIjICiyKvn3KgsGNrJVXsBi5YMHp9i+qqbwOTLXG0Hz7jGOT7FqQQNuGq5KQIvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773447749; c=relaxed/simple;
	bh=Z+LzcNhl6MKQpU9c+iBU7nRfJWsdmTdBfEQ4n8scIkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ss91EpeiMTDoHwcfW/IRjuJoFeGZzgnwuOlMsttIAzaariPWJABvSmbfqpWcrebc//9CFLxn4iUeOwvcmEf1rhLvxE205B/v6A/4dKdaeuG4IiPrfCUI5eESKqS40akmte0b3mwulU8jA7xlmYKQP9Tn7LH7d8eeX6HnVUtiNAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GJZQvcu3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GJZQvcu3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773447746;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uT2tigehu5ZKWMcc7PVmJLvJTOYRhmuCPZcyVnDXUW0=;
	b=GJZQvcu3CeAxId9zBvLUE8f+94CNcXxMhKLwSTpjmLRalrRjGt+n4h5rSIZrs/O6kFbsBf
	f2G05DpUk1Xq6au8fSOLzn3OTJV8gfYeZ2THzxnqiTQq7wViWMbmogR+MY7YS2OhqTsEsv
	C+vQFEAfbJYlAfu8820zDY/TcmLr0FY=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-463-5ieO_G_cPgSDUQ_rrj16QQ-1; Fri,
 13 Mar 2026 20:22:25 -0400
X-MC-Unique: 5ieO_G_cPgSDUQ_rrj16QQ-1
X-Mimecast-MFC-AGG-ID: 5ieO_G_cPgSDUQ_rrj16QQ_1773447742
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5E8CD195399E;
	Sat, 14 Mar 2026 00:22:21 +0000 (UTC)
Received: from gmail.com (unknown [10.72.112.67])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5CC01180058B;
	Sat, 14 Mar 2026 00:22:10 +0000 (UTC)
Date: Sat, 14 Mar 2026 08:22:05 +0800
From: Chunyu Hu <chuhu@redhat.com>
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>, akpm@linux-foundation.org,
	david@kernel.org, shuah@kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
	surenb@google.com, mhocko@suse.com, ziy@nvidia.com,
	baolin.wang@linux.alibaba.com, npache@redhat.com,
	ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
	lance.yang@linux.dev
Subject: Re: [PATCH 0/4] selftests/mm: skip several tests when thp is not
 available
Message-ID: <abSqLYQ_1I590KLB@gmail.com>
References: <20260312114027.634559-1-chuhu@redhat.com>
 <abLHz2qjdeNqdFaZ@kernel.org>
 <abNZmiL2C7KMQM1t@gmail.com>
 <abQq-Mt0p3vz5rQm@kernel.org>
 <68b17560-3033-472c-9638-a2e2058529f8@lucifer.local>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68b17560-3033-472c-9638-a2e2058529f8@lucifer.local>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On Fri, Mar 13, 2026 at 03:40:14PM +0000, Lorenzo Stoakes (Oracle) wrote:
> On Fri, Mar 13, 2026 at 05:19:20PM +0200, Mike Rapoport wrote:
> > On Fri, Mar 13, 2026 at 08:26:02AM +0800, Chunyu Hu wrote:
> > > On Thu, Mar 12, 2026 at 04:03:59PM +0200, Mike Rapoport wrote:
> > > > On Thu, Mar 12, 2026 at 07:40:23PM +0800, Chunyu Hu wrote:
> > > > > There are several tests requires transprarent hugepages, when run on thp
> > > > > disabled kernel such as realtime kernel, there will be false positve.
> > > >
> > > > I presume that when THP tests run on kernels with THP disabled they fail
> > > > and it would be a false negative rather than false positive.
> > >
> > > This is an interesting point. I'm not naitive speaker. I just learned
> > > from AI. It really matters what we define as 'postive'. I presume 'postive'
> > > is we run selftest and got a failure report, that's postive, not thinking
> > > as it's thp disabled kernel and a 'pass' is postive.
> >
> > I think that a passing test is "positive" and a failing test is "negative".
> > So a test that fails because of misconfiguration is a false negative to me.
> 
> (Ostensibly native speaker here :P)
> 
> Yes.
> 
> False positive = the test passed when it should have failed.
> False negative = The test failed when it should have passed.

Ok. Thank you for clarify. I'll use 'false netative' instead .

> 
> Cheers, Lorenzo
> 

