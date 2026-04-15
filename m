Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE5E32FA1B
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Apr 2026 09:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776244588; cv=none; b=dtQl7bY3o9ru+OSOreTC8R/e9IVFst5pH2GUxOIZrVYW8ApeKsXFOyQlx72xuk6nbhq2cND2CrHdYjIvw8QPZz+z9TN/7bt2PeNnjWtGzbgswjqmsr5AbqRbkTNYJi3hxYwd2G6gtycCZJsvNka74LlFnuLGK17ZlB5dt8956Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776244588; c=relaxed/simple;
	bh=XBnApSAYYoDDR0tm9wOMJHked1d/jcZYw82RPUp632s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kboY5T6GJHs1yFrHX5IK6+89FrOXO78PCCAZkP41fQbB/lSRYDimhapoBmAqVMlokw3443z7vqQzI1oh2TI4ehM195rdzEVGc/8bzoK6VQLM8/cPa6NC7XpHRKWnb12mNPb7VQpksH4b87WAtTBgyq4B8otiMEozB190amD6LbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZAFdFv+k; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZAFdFv+k"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso64105275e9.1
        for <linux-kselftest@vger.kernel.org>; Wed, 15 Apr 2026 02:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776244585; x=1776849385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E5IZ+dOe/qCEN9b6XI8ElLsT16xrwMw5gmxZ3qINeFw=;
        b=ZAFdFv+kJ96gw3Oadl5kz0mPnUM5fs9Hj26gE5widB/qh9U02OIPNmGYXVQEGSS7ZM
         xC9fj37XEIgUOLQQ/eb80OHHccGhTH2gP5CYDn1GN8VcxLulXnqHQeixb1x97BAkHyfC
         SCqZO/wt0KHluDeJP5VsxlbMCZc9SWRRtI2XhhwTjMXw/lhn+TsTyVAMmEgiRvMZ2Dhp
         gGpKQbKtLvOODaiRgVzDBCwXlZbnxeUd03kleNzf+RkqjcOR1JkkJyi3lMz8u2cNwMwN
         vYrHKftCDLejjf2VsQZckg7/0jq4MzRBHhdjBiUAx3FhaSIarNQVEILtKKHMDIjKFS/T
         pdrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776244585; x=1776849385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E5IZ+dOe/qCEN9b6XI8ElLsT16xrwMw5gmxZ3qINeFw=;
        b=YoUY5fBG4QwJBxNWRLnlf3rzO6l/7VGwQpLEKAHS1K3s3tGYbO5YGplWet02pGgiKv
         UulutLWrXq5gAbNXqJbLYvh8FlR/2Rd8cVz+1luD1yALEWWDVC/w40JZl1w6F5fxXQfp
         uTpioNmNSbFm0WB75Kk/djmZiZuDfLPlGtQrL+9WIBKpOBoPMJBt4cfUtQQsyAxxiIdj
         rr+dKuaEt3OcE6Bz//b6CHIL2FYwbaF72guAs/AQ5YhA2UjaE4a2jvy/2HJZ2v3sZCdO
         feJWNc6wxfCVt1HZJAWFWyCvXqeCnlMhByV+QMX28sjAMJqgYi57Fb9pcTF7zJT9wgn1
         RZ9g==
X-Forwarded-Encrypted: i=1; AFNElJ/CkDPZ/kkbVydNknE0uMtAtfgkbVe2PeJ1Oax8QceSFxC7yLtt4vrrfhAWr2NdxlYx9arkr9xx21v5A5cv9Zc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj6q5m5imfYufK5+nzJ4b3lLvPoWMN3yY8eoNIaOC9+LdgRThY
	hsTCBNPw+ImRadH/fn5gvE+bEcrLXY/nLrunotxmZRNWdks3qI7m+2dq
X-Gm-Gg: AeBDievIJCltyV66rjmujGF+0c/coaRAOjU0tHhbJO0f7uhOiyMV3aBr8E6x+Im2Yxo
	2kCHEXrcmy3Iptnp64lWO6qTX2qdCAcNeZ3iVBw0T9+QyWaYZgAm68JWJzmC8EXIzTqlpKmHCLB
	cyGiBViUfJRm/BgM1dFwKAvFbb6MrQ7lCIRgAI3qxPYm41w56oRuz2wAKqbMXq3MtdnWOzkwplT
	FUHs4Cii03d24OIslnvsB3MURCTDJs/Xbdwceiw+LsGg2RhPsx3Ox5kYJdfwz/AKZvebVrQWz48
	lhRSyfQBhM1YngY3SAR4nQjahXg/aHqIveqrVQnNQhXCgJ96R22iyqd0TPRG+Kw+1R7O1O9ORvV
	MSy7vfpU8PfX9heiW5XTSAlGxB2zqEfXMsQLPPceC7kHP3KJbXFMCt4QsD/nlsPzedQ9z3Hy+W3
	BDCg3i3FeoMupdHosV5nUfDVcGPor3C+uLRO/G6hn3Xqn0C9dHzSYvznwuZJWyFmSX
X-Received: by 2002:a05:600c:a11c:b0:487:2671:fb8f with SMTP id 5b1f17b1804b1-488d67fa40fmr205276285e9.8.1776244585433;
        Wed, 15 Apr 2026 02:16:25 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488ee038752sm117771055e9.9.2026.04.15.02.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 02:16:25 -0700 (PDT)
Date: Wed, 15 Apr 2026 10:16:23 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Dev Jain <dev.jain@arm.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, akpm@linux-foundation.org,
 shuah@kernel.org, ljs@kernel.org, Liam.Howlett@oracle.com,
 vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, ryan.roberts@arm.com,
 anshuman.khandual@arm.com, Sarthak Sharma <sarthak.sharma@arm.com>
Subject: Re: [PATCH v2] selftests/mm: Simplify byte pattern checking in
 mremap_test
Message-ID: <20260415101623.33004858@pumpkin>
In-Reply-To: <57b5d0f9-3e56-4f96-9e3a-2f475a78a8eb@arm.com>
References: <20260415044509.579428-1-dev.jain@arm.com>
	<2e34b619-085f-4a9c-bb41-bc024fd40dd7@kernel.org>
	<57b5d0f9-3e56-4f96-9e3a-2f475a78a8eb@arm.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 15 Apr 2026 14:05:01 +0530
Dev Jain <dev.jain@arm.com> wrote:

...
> > 
> > c) Remove any randomization from the test. There is no need for random
> >    patterns, just fill pages with increasing numbers.  
> 
> Agreed.

I'd start from (say) 0x123456789abcdef0 rather than zero to avoid lots
of zero bytes.

> > d) Just always verify the whole regions. Without the rand() magic this
> >    will probably be just ... fairly fast?  
> 
> Yeah we are doing a simple memcmp() so it is fine.

You don't need a copy of the buffer, just compare against the pattern
that filled it.

	David

> 
> I'll implement these changes.
> 
> >   
> 
> 

