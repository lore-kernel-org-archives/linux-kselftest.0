Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F1133F5BF
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 02:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773368749; cv=none; b=H2aLwgK+zgz0OUchVLaXBFnGbO31YouD9VnWdavv0UYy06wWwPwP7wXcDDGwfHdcj9xzwfxlDPc1oeA0KRq5BSS42jYn9IcwA2SwppjMW4CgX9n/0BJTfFmSW2ipzpHUPSOxF1jl9WfsFNRjNI/3oSMyQWhwNxPulBHK55XpCTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773368749; c=relaxed/simple;
	bh=V7vSb5Hd47otWBkWSf0Cj1mcNaBtiX17tHHWgX16pfA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZwjB/yXIX5797Y0OaEU9qsKRpcCoJmXpMHRZa7HnvvD6Glj4V/i8KbPR6vPLCroTrA+oR+iP+NQ/qWzTpj7sxvDrUYWtPbvjkudRndgG6CQkToaAKVGk6B28xeQ+aTewm7a1dyyRsJmguxMMUbYqyKVUpe68kZsGvt8uonqqL6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a8MxC49E; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a8MxC49E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773368746;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tWwNJT14PCK1Z6vJwC1eY4CLOkFnzy21NPPOxNIkUno=;
	b=a8MxC49EHFz5jntN1T0l/AYQ+zPcjjOSQqavfmdlKeOHIGizmycTfAK0ZU1N/bHs929HgF
	VjpYRrPNyoWpWs1weLlpj5SN01ksdOUIzxuFbfFGDMxdxWw04zbM21NRYsSEfAfnCWOZQl
	2hGDJySeV2JOaHdsvHrO/3l0uQt/Y94=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-360-lg-MkysrPSK6HjkozIXAtQ-1; Thu,
 12 Mar 2026 22:25:42 -0400
X-MC-Unique: lg-MkysrPSK6HjkozIXAtQ-1
X-Mimecast-MFC-AGG-ID: lg-MkysrPSK6HjkozIXAtQ_1773368740
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B7D6118005B2;
	Fri, 13 Mar 2026 02:25:39 +0000 (UTC)
Received: from gmail.com (unknown [10.72.112.171])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9BAB9180035F;
	Fri, 13 Mar 2026 02:25:27 +0000 (UTC)
Date: Fri, 13 Mar 2026 10:25:21 +0800
From: Chunyu Hu <chuhu@redhat.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: akpm@linux-foundation.org, shuah@kernel.org, linux-mm@kvack.org,
	ljs@kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org,
	surenb@google.com, mhocko@suse.com, ziy@nvidia.com,
	baolin.wang@linux.alibaba.com, npache@redhat.com,
	ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
	lance.yang@linux.dev, Li Wang <liwang@redhat.com>
Subject: Re: [RESEND PATCH 3/4] selftests/mm: split_huge_page_test: skip the
 test when thp is not available
Message-ID: <abN1kdjgA-B73Sz-@gmail.com>
References: <20260312114027.634559-1-chuhu@redhat.com>
 <20260312114027.634559-4-chuhu@redhat.com>
 <cb35f32d-ee65-4865-8664-1c9d7547bd5a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cb35f32d-ee65-4865-8664-1c9d7547bd5a@kernel.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On Thu, Mar 12, 2026 at 08:44:46PM +0100, David Hildenbrand (Arm) wrote:
> 
> >  
> > +	if (!thp_is_enabled()) {
> > +		ksft_exit_skip("Transparent Hugepages not available\n");
> > +	}
> > +
> 
> No need for the {}

Oops, my bad. I overlooked it when checking patch. Will fix in v2.

> 
> -- 
> Cheers,
> 
> David
> 

