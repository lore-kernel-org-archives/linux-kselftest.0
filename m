Received: from flow-a4-smtp.messagingengine.com (flow-a4-smtp.messagingengine.com [103.168.172.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BD244A3FD;
	Thu, 10 Sep 2026 10:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789037932; cv=none; b=cobxqCXzjt6IXOndFaQDUpeJ++7ei0qR71lEJ8+85Oqxl9QjhbiUdRKLUZAVFBklHgV4y09zg2E04MyK91zzyVA0n6RSbYut2i9tWb6Sw5TOTInxdWAaYfrmKPSSvZ177cSRwPBrqTVVo+6kKBCgF7VMp4+FDja1xWePvCfyF7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789037932; c=relaxed/simple;
	bh=+k2qBau0oWlN64N8YFbOHW500qTc6a3eTjd7FAaSMTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H7otUP9IVXJS/J25OeS2NqZifsT6Q4KaYl5K2doourSrIa9TSC65ElZC99chHKM9q7S3yT1TdvDQfZ0aAhE78f7S1xeN4JciwLd3GBfDCw1/BiMq6UUDKtZg3BREdClHJiimjlLz2qJvUa+Mdmn4bO3HdpjRwMBvuuj73mToSbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=MUOd0JGz; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=xsdlfMfD; arc=none smtp.client-ip=103.168.172.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="MUOd0JGz";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="xsdlfMfD"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailflow.phl.internal (Postfix) with ESMTP id C98E91380361;
	Thu, 10 Sep 2026 06:58:49 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Thu, 10 Sep 2026 06:58:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1789037929; x=
	1789045129; bh=8rq8+VZe9m3+SZ5mDhMiptVPE8GsBUkNqnozCNT2sD4=; b=M
	UOd0JGzsof6Tw/f3fKG+9RvFHBo+3ZltjPzRALwV7VMqGVk3VEi67+RwTsR1eSuL
	pR4ZkGCyPKi/fFrm+188fbknixnrQCMn7UFr/zf9ck3WAbibLb57gI0ToSyadSrG
	+ND+0v5dZvg6xG+8Ih6qlgbKlpZwnpw5lAh4hrWgTY+xnbUEDcvQf6BvayKxsyNx
	03ke9OQkhSihmesz8g3W+xhry5ggnBOyHeoUjta9Y6VvW2lyE5qz/yRJaayBwQ8P
	UmnqAe8WVHcg/kj5G/5609iq/mXgUDkt3HFV/xgAL9xf508wnXl+RrowI55kthVx
	WjO7DfPj6Zj8MalZ+kYew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1789037929; x=1789045129; bh=8rq8+VZe9m3+SZ5mDhMiptVPE8GsBUkNqno
	zCNT2sD4=; b=xsdlfMfD0LeTIuhdM9cMVGT6gzkW/kR6lP78adODWBI1/nxW1pl
	E6bRGv4i1R5lUHw204tlLh1Q0iPLitDaiYqNdAFcIwPfvAX82GVbwG23nE+EuM/l
	I3w+HzWwq6d7650tbGAh16tOx0BpDETwrbyuf/teCS/J3hEuMC7HngtLAVAFp+gb
	QCyGVKk9iYBDJ2VnwF8l1aPE5r8sHOQQzDP9NBbwez5bsJ5Czshz3ZKlUUfR6Z0+
	md7M+3W6nQScB9U1nHcP1fYwMPZkH+HvjcC3Wv42WF+jxYhU4b0y97hbBnPdM7P+
	owOBSlMaTo7OIaCHr4Qix/6IL5Gr74Yl+ww==
X-ME-Sender: <xms:aY2ialLvl_WCc7qdPqTqmj5eBTFxLCmXxSoABmL8Aoaz-0TBF99LWw>
    <xme:aY2iah2elLMUfJxA5VCBgApIWBWErk4KmLrga9H3OgS0nNPSpelQzh3_6wNwLWVEX
    XhU_LARc8u2d_iXAvy43hObRo_HuLeERpNBqKusEaPRlbtyn71cvbA2>
X-ME-Received: <xmr:aY2iaozHCBSpgemmONXPJlY9FJ4wb3IRR1xdPkqDA-OTePbYja-XRIi2nuU>
X-ME-Proxy-Cause: dmFkZTExGDeRAc2ZQvQEVOZg05RC7pzdHKVkkxCU4OVzC6eJ1yiq+dkvuNpph491rCSg99
    ItVtML130B8ODTdy76InRXCLDNaNNaTXWNKl71VlGzapLT/PKpaq/yp6tPxANkNdjNuqob
    hUhC5q+z3VJokLVhtdnNzOHq8HB3Gu5Ki3O9wHHpqx6QnVCJ6Mwr6zY1sfs6ioIkhduQB2
    cjK46H5gyRhde+ukXeSmJg7XmiDbNE8++i8Ylsv0wnJwn5W1L9sKPmXxdBB0BYsnvUNs5B
    4qHkIOL9/2e667KRTruDA/HZANASE9ZIxHm48xWT6Jg9ai0h943Ghn3IVLvfn13XDvCjWC
    0hRqvm9u9adAy2D+4EpHVZM6yuOMWdhRnjzsZB5kJ0ADlfX1onAmme1T8y2P+48HIFQchS
    qEjN4eKKs1AF9A4mhjZaVwcsTcCBKxlFqQAbHzVDbf8DzIoi+Jtk/TxXjO/+flg86voCiX
    dhNKLOMU9XjrndOsqW7MLO4WJzp3yIWBo+yobvdolW0KAaHb5GIbWwJb26nfk816/+Y0ei
    YILLwinyWechbH064xPUfH9j0eIvLki5zXBc7OicF8o1iEyzSjhXmeI06hKwf9XUhhNHoR
    yrw/i5fQ96gbg1R3fsb/+xsQTKZDCuda0G9Whk5F232tiBT0k01IIP3DDOaw
X-ME-Proxy: <xmx:aY2iamaQ5SqHK0oPst2FfYuUfBxWK7qgt3xX8kecxTwzAyPmv5NSZg>
    <xmx:aY2iavWo1CeHlbBOgBInrtMf8TRHcyZuwHyDue4Wl5HWyca1GH937A>
    <xmx:aY2iaqoZeUR2u2AenOo45yZHgdJREwfk2QxxYul2TFigf3LwPECzng>
    <xmx:aY2iapfNcvy3O7uYvLQGZG4cubkpnBqK3r9VnKQXzTNF79KocFpHjw>
    <xmx:aY2iarJo2Z9jMZyZWMLKPrpfakzi7KOERrmJpOzS78IY3DY6u0dZhjCN>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Sep 2026 06:58:48 -0400 (EDT)
Date: Thu, 10 Sep 2026 11:58:47 +0100
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	rppt@kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, usama.anjum@arm.com, usama.arif@linux.dev, nico.pache@linux.dev, 
	ziy@nvidia.com, baohua@kernel.org, dev.jain@arm.com, hughd@google.com, 
	lance.yang@linux.dev, liam@infradead.org, mhocko@suse.com, ryan.roberts@arm.com, 
	shuah@kernel.org, surenb@google.com, vbabka@kernel.org, agordeev@linux.ibm.com, 
	jgg@ziepe.ca, leon@kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v5 12/19] selftests/mm: parameterize the mixed-source
 collapse case by source order
Message-ID: <aqKNHUI9tuv34Cqy@thinkstation>
References: <20260908125105.1510704-1-kirill@shutemov.name>
 <20260908125105.1510704-13-kirill@shutemov.name>
 <4aeaa283-a417-45a9-9298-8123192dc707@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4aeaa283-a417-45a9-9298-8123192dc707@linux.alibaba.com>

On Thu, Sep 10, 2026 at 01:09:00PM +0800, Baolin Wang wrote:
> 
> 
> On 9/8/26 8:50 PM, Kiryl Shutsemau wrote:
> > From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> > 
> > collapse_order_mixed_sources() faults its region as order-2 folios and
> > collapses them to the -c target.  Order 2 is below the contpte size on
> > every arm64 page size, so nothing in this suite collapses a contpte-mapped
> > source on purpose.
> > 
> > Let -s name the source order alongside -c.  The case then faults at that
> > order, keeping order 2 when -s is absent, and the source order has to be a
> > supported mTHP order below the target.  The other mTHP cases are
> > unaffected: mthp_push_target_order() enables only the target order.
> > 
> > "-s 5 -c 7" on arm64/64K then collapses contpte-mapped sources into a
> > larger mTHP.
> 
> Make sense. But we should validate invalid parameter combinations for '-s'
> and '-c'. For example, when I set the following unreasonable parameters,
> some test cases fail, so such invalid configurations should be rejected.

Patch 14 adds that check; with the whole series applied,
"-s 7 -c 6 mthp_khugepaged:anon" stops before running anything:

  1..0 # SKIP -c 6 needs a source order below it, -s says 7

So this is a minor bisectability issue: the check should have come with
this patch rather than two later.  I will move it here if the series gets
respun.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
