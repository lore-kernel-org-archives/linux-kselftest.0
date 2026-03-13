Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC82534107D
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 02:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773368525; cv=none; b=O9V7sF7FRpGcCWgX7dbtZt+vYpxpB4eEZ5YbnZG6PKpsQvZ2lqeiAXRLNNTfUYPu643MDEhU8MF2G8qHhqPaJAfFyhP8QhBiQr4OY1ClWR1EOyvfUJLMjaLnYPT4IQ4kPAv5kntvzHBO9CwYoLYu1b55pau8vGY3U2kzmQzbxoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773368525; c=relaxed/simple;
	bh=qDvS+aA/etqK+hl05gnOStxBFtAGJwhV2yzE0zpJgBw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sZw2vtU3byG9VEq9zteZJs9EpsO14xDEyh6ZFBpt2A5ooBmqClDWBKBCOWglsH+fRlb23fAuyPa8h/Twge4EAdVdpdpvjMWM5M/SyejtCawwUr6jN515CVab1ssgSsFYoqARU16prQ3+LWcK4dcglmmW23NfIdqBLFDNB9RM+3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aUygV0xg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aUygV0xg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773368518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Yoj2TNP7JEQqQk/ei2IsLY3yTJ1xZV3q2Z8oxdSgkbQ=;
	b=aUygV0xgokXsEAw8K688mOzh+6ZCCvA/aX2CiX1eVKL4vTInRMq2tsb6o0k4lX3pVVhN9b
	NlPF0irQshaREli21VjnS7fn5q/DIR9OjqJv9Me5d+tede6OSEJpI+bGtap67UhVGlAPfs
	f9LQ73CLgSMLJ2Ec9nLX0LmvPb2b99w=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-467-Akn9SZghOTCS8SStdyP28A-1; Thu,
 12 Mar 2026 22:21:53 -0400
X-MC-Unique: Akn9SZghOTCS8SStdyP28A-1
X-Mimecast-MFC-AGG-ID: Akn9SZghOTCS8SStdyP28A_1773368511
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 739A2197750B;
	Fri, 13 Mar 2026 02:21:50 +0000 (UTC)
Received: from gmail.com (unknown [10.72.112.171])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B0133180075B;
	Fri, 13 Mar 2026 02:21:38 +0000 (UTC)
Date: Fri, 13 Mar 2026 10:21:32 +0800
From: Chunyu Hu <chuhu@redhat.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: akpm@linux-foundation.org, shuah@kernel.org, linux-mm@kvack.org,
	ljs@kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org,
	surenb@google.com, mhocko@suse.com, ziy@nvidia.com,
	baolin.wang@linux.alibaba.com, npache@redhat.com,
	ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
	lance.yang@linux.dev
Subject: Re: [PATCH 0/4] selftests/mm: skip several tests when thp is not
 available
Message-ID: <abN0rOql8VXOCb_Y@gmail.com>
References: <20260312114027.634559-1-chuhu@redhat.com>
 <dca1580e-96fc-4ca7-bd21-abeddb3c8c44@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dca1580e-96fc-4ca7-bd21-abeddb3c8c44@kernel.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On Thu, Mar 12, 2026 at 08:39:31PM +0100, David Hildenbrand (Arm) wrote:
> On 3/12/26 12:40, Chunyu Hu wrote:
> > There are several tests requires transprarent hugepages, when run on thp
> > disabled kernel such as realtime kernel, there will be false positve.
> > Mark those tests as skip when thp is not available.
> 
> We expend that people that run the tests have the configs as contained in
> 
> 	tools/testing/selftests/mm/config

I didn't notice we have such as file. It's a good template for people to
refer to. We can see in the test log when some tests are skipped:

  'skipped test(s) detected. Consider enabling relevant config options to
   improve coverage.'
 
Then this template is helpful for user to 'enable relevant config' when
they building kernle themself. But some users just run the default product
kernel which is a pre-compiled kernel with product config.

> 
> enabled.
> 
> I'm fine with teaching the tests that that is no longer required.
> 
> Should we then remove
> 
> 	CONFIG_TRANSPARENT_HUGEPAGE=y
> 
> from the file, or leave it in there for people building their configs to
> know what to enable for best test coverage? (I doubt people do use it
> for that purpose)

The config template is good for people to getting better coverage. Maybe we
leave it there, and point people to this config template in the log when some
tests are skipped due to kernel config. And yes, user may not do this
and they want to detect issue in there product config.

  'skipped test(s) detected. Consider enabling relevant config options to
   improve coverage. See selftests/mm/config.'

I find the commit that introduced this config template. And there's a guide
in the commit message that about how to merge the config.

  '8c749ce93ee6 selftests: create test-specific kconfig fragments'

> 
> -- 
> Cheers,
> 
> David
> 

