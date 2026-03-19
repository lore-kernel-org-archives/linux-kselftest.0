Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EF02DF126
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 15:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773932766; cv=none; b=ETlrB48igB/kZYosKiRZf9UBqQ+y88Uw3FYLMMvACEuyGMXvHvS4SpJa+9JNrvd9LR8ra2gME9yj88OeWDHT4rB0vV4hAy4dskqN8XlAXLAMU9saR3tXLErohUR9JZAKGIHm5r6B2B2kA8myfKfF7YtqKqeqR1z31YGTEYMEA70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773932766; c=relaxed/simple;
	bh=od1jXe2prjY6dwj+ruOQDFLeDR4XnBf0CGu0GCy43bA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QOVxThFmrV9mau1GCfsDRF30T3Dz5R7f/PNBctuwGiu8BBbpkfMqaIfNgPmCOcjm/Hf4dHiCOWKUqnKPo6SgK/S8z0rqtibJ3bFw6P1v0XhRmWcnj88cj6V7OFrJh63izcUb57yC1kUmDwy9mro4AxH7V0lwxq23G1Kp4LAT6V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EjH8VAh4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EjH8VAh4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773932764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xr1n4pq26+sDotqWU+jnz41PCkyUuxFyXvmfekYnl1I=;
	b=EjH8VAh4xfgLLj5zafHkQE06SWv04VAUmqlgOMH0uxaUqLC/dwfkKB3ESDASvFS5qWz5Gs
	yQowA+acmrkrRWeDGSNt3YfWLWSA9BQrrnvFqEeoC9aEcmQ45dguyEmQH4YDgL4juqAVM/
	ED/dubNNFjDNOVHaVKNly9E6UUexpeo=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-463-PS9mfuncPIO4UkoMK7UntA-1; Thu,
 19 Mar 2026 11:05:59 -0400
X-MC-Unique: PS9mfuncPIO4UkoMK7UntA-1
X-Mimecast-MFC-AGG-ID: PS9mfuncPIO4UkoMK7UntA_1773932756
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2D19D19560B5;
	Thu, 19 Mar 2026 15:05:56 +0000 (UTC)
Received: from gmail.com (unknown [10.72.112.5])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8A4BF1800576;
	Thu, 19 Mar 2026 15:05:47 +0000 (UTC)
Date: Thu, 19 Mar 2026 23:05:43 +0800
From: Chunyu Hu <chuhu@redhat.com>
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@kernel.org,
	shuah@kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, ziy@nvidia.com,
	baolin.wang@linux.alibaba.com, npache@redhat.com,
	ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
	lance.yang@linux.dev
Subject: Re: [PATCH v3 0/5] selftests/mm: skip several tests when thp is not
 available
Message-ID: <abwQx-P3pfyJ14ve@gmail.com>
References: <20260317094419.1429259-1-chuhu@redhat.com>
 <20260317113730.45d5cef4ba84be4df631677f@linux-foundation.org>
 <abpu4OMsy3Xl5QA0@gmail.com>
 <893e70b9-1ed2-419b-9079-5b397b2cec54@lucifer.local>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <893e70b9-1ed2-419b-9079-5b397b2cec54@lucifer.local>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On Wed, Mar 18, 2026 at 11:32:10AM +0000, Lorenzo Stoakes (Oracle) wrote:
> On Wed, Mar 18, 2026 at 05:22:40PM +0800, Chunyu Hu wrote:
> > For question one. In guard-region test, collapse tests are for checking
> > collapse is denied when operating on guard region, not for checking
> > madvise(MADV_COLLAPSE) will fail when thp is setup to 'never with sysfs,
> 
> No, if thp is set to never, madvise(MADV_COLLAPSE) still succeeds. This is a
> source of confusion for many :)

You are right. Thanks for correcting me.

> 
> > result is same, but it's a different test. Maybe we don't have strong
> > interest to test when thp is set to 'never' in this collapse test.
> > Do you perfer we let it run when thp is setup with 'never'?
> 
> Yes because it should still function then :)

Sure. Let me send a v4 to change to thp_available().

> 
> Cheers, Lorenzo
> 

