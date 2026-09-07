Received: from flow-a7-smtp.messagingengine.com (flow-a7-smtp.messagingengine.com [103.168.172.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149584B1B3D;
	Mon,  7 Sep 2026 13:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788788457; cv=none; b=M0TG33tkvEUJmQNxBY8EYjQDkb+D1BC4+XeCe/NCgEeyhV6tpV+9VEiaSBGa6MGTRoisN8e4GorkKullSgCyZumwEbljlfd6g9Cb5mZg1DczX7oQwfbWSumuVyCesKAT/WFoG06V4TAw0d6E5s6Fhap169I9bRKLv1IMeud/hIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788788457; c=relaxed/simple;
	bh=PKGcY2xDf+vSAxnInIqi3PSYBAQkvlTz6HWyigoq9zA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NuLJwhUKX33DGSoi/N660qVQp09crKIbKu50J5jkLXQBHGhXnzZsMhYh3Hs7kx0FTcim+mTkj4K9Ix3mIgzSGfD+VWkEDTpIN24pHn3FXVjgnMxOSageaNWR0cTIFlXnuXRLYfHtsJJHYkl7LaWuVSce8BtWh/qFWa6r8DP5Bgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=i/+uUs5b; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=pIyY4zcH; arc=none smtp.client-ip=103.168.172.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="i/+uUs5b";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="pIyY4zcH"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailflow.phl.internal (Postfix) with ESMTP id 0CECC13800B9;
	Mon,  7 Sep 2026 09:40:55 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Mon, 07 Sep 2026 09:40:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1788788455; x=
	1788795655; bh=Wi5+8qW6puz2y83/n0553V6h0M1VwJvxtBCvRrBB+lA=; b=i
	/+uUs5bhTNX2UOHY3PkZNUkN7KJifziZIEyunIDLwpyiaMOoY54spf4T2HZqvxIY
	Tm6mR5FipSTlXcSt/5IY5NG8xV1BVD3TESXh47wMgAJegIoT3v9YoXtEYOt70pDB
	tpyCCLkBohsfXJHHD1UauQRXzWQXvqCYOSDrNDs/f3/ZMiDC6F/t1XLSw4O0khVH
	SnlxkLH2cVzPm12osR1NMv47AAFqOtMBNSjJBy4gUA8F3dpNhGbH0dbBXM66BeJm
	UO9pPzfXexGeKU8AiMxDkIo/Ilit4AlIJ4IKzISiOb0Zb42J8a4+pb89L50gKXn3
	FZ/Z8ku8KPwVtOfKZ1h/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1788788455; x=1788795655; bh=Wi5+8qW6puz2y83/n0553V6h0M1VwJvxtBC
	vRrBB+lA=; b=pIyY4zcHw/Oa5LRW2eablw/Y8cciX/NQdeBGfoh4UnqrBbokuSg
	Xo59WurYZmQuJbhndlHrNZnEWOkEGXmORwLKBYktbnZaChNCbp+LZBh9gZdAhiet
	edtQg234q82hrB7fbPh8GN1k6wBmbeeVRY7jT9I2AAj+j/zeiM5nyLhjkUgwrgh6
	vl3m/FxwsiNabFIqMwxPpuy/2XgL8TcPHfssbMXQ+iAsuQNARRn0WzTx3hdJLdsZ
	2Gbcy3PqA5J5Ip3fugcNgY+Nyl1TU/9swKdHduURf5+L0PUgJ11pVAEfSeUNvQfj
	nuUzOye28x25zBbpoXYejZ3jDHTa3nwBQrA==
X-ME-Sender: <xms:5r6eairHXcEPWqFqQ9aA7X25mTKkRb0Tpbippijc-XtZI9gEvdewVg>
    <xme:5r6eauQTS7k7TxSer6hWdU1OhWxMWVnZTGTZr_6onaeba6rbJbknBMAjv9w6tTZIg
    OqGHLcYmSJAvNaKYiZCAO5FdbusH0q8ZnTUCBgVeWmR3W8Bgi4puRix>
X-ME-Received: <xmr:5r6easwVfb55BaPQgDIWv-gKcmWRpxDOQvcXcLYT4HKC83wX-Psq7Ds7mHA>
X-ME-Proxy-Cause: dmFkZTERvVKHswdGsGm15ml65Apd+MP1QKrRKABRUnh+cCgabGwk1x9rxW07letJPaeHr3
    cFJXzrGLGRRI30Vt70l71GZpwYOmWaGD0DtIy/yoYt5+9f76K45Va/fNc6+HYFRYJ7eA86
    3PD9SgGEKKUGGWSmPdla5v0zegD0baNdRM2Q3eTy7eyFP9IG7TDVbREaRGuPEun6FnIpa3
    L1YNQh+HtIpUPWlYOm2YxJynknLrH57N6p1vIjyk43v43Zzm4zhYgYxHgQboItb8I/njYY
    CMlLQ39JSt48hfgD8rBnCX1RZqOa1WGC3i2lSDDjopPd0WtxYYeqmtWxiR+hTOLb9sV+T+
    ndlexVpY+QQS7gb7JeGSIOTBToC0ubwLLV3OVMPhDxJ3qiwLvbX7a/E1h1BB6hItpClMVH
    tSXy0fRMMa/dKVbacdGcepajZx5byJnMW4YNoqlRPy+76gtrGC7Bdcl/I6+xgUfgZDfVa4
    a4xKeoT38eOANbiiexcg2lrJR9bLU8nWur2FdFNpdjpOSH61bcI49du3rA4D9k05K5F3gm
    365JThRcGOEIF74YOdqtWjS5j65nNRE5UOMnBuSpjmZnksiNi6KI1H05rNlmZeRa/L4yrE
    IIr9SlFSunGygK64vwlMIMJyRzB1y/eBouJuuaT/LnjftyXoRAM2yCUW30Eg
X-ME-Proxy: <xmx:5r6ealijxDMZ8Gk8VnB8BAUn6qovSX2AtsKeG8pGn5xvmMziOCt4Zg>
    <xmx:5r6eag_s5r6gw6d9-Vd2yI5qmLDCpKJPiNJ7adn9ulEgFLtIOtuodw>
    <xmx:5r6eaqMYAyJ4Vuy3zFd0vTLolT82fFF8P3GgQGKQHxWJFXUH2slhUA>
    <xmx:5r6eaup90Ai5mtpyC5HSlw-IynqRbfoVE7lDFr_lhL72koTtjqnzhQ>
    <xmx:576eaifHfxa550yqtgvMGughymCUeF5Nz1suZTXoi2IzfET8dbni2ErX>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Sep 2026 09:40:53 -0400 (EDT)
Date: Mon, 7 Sep 2026 14:40:51 +0100
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Mike Rapoport <rppt@kernel.org>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	nico.pache@linux.dev, baolin.wang@linux.alibaba.com, baohua@kernel.org, 
	dev.jain@arm.com, hughd@google.com, lance.yang@linux.dev, liam@infradead.org, 
	mhocko@suse.com, ryan.roberts@arm.com, shuah@kernel.org, surenb@google.com, 
	usama.arif@linux.dev, vbabka@kernel.org, ziy@nvidia.com, usama.anjum@arm.com, 
	agordeev@linux.ibm.com, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 12/19] selftests/mm: parameterize the mixed-source
 collapse case by source order
Message-ID: <ap6-0z4pmy3p1gKs@thinkstation>
References: <20260815015901.1236937-1-kirill@shutemov.name>
 <20260815015901.1236937-13-kirill@shutemov.name>
 <178721523517.2799959.8628888160176030191.b4-review@b4>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178721523517.2799959.8628888160176030191.b4-review@b4>

On Thu, Aug 20, 2026 at 11:40:35AM +0300, Mike Rapoport wrote:
> > collapse_order_mixed_sources() faults its region as order-2 folios and
> > collapses them to the -c target.  Order 2 sits below the contpte threshold
> > on both arm64 page-size configurations, so nothing in this suite unfolds a
> > contpte source on purpose.
> > 
> > Let -s name the source order alongside -c.  The case then faults at that
> > order, keeping order 2 when -s is absent, and the source order has to be a
> > supported mTHP order below the target.  The other mTHP cases are
> > unaffected: mthp_push_target_order() enables only the target order.
> > 
> > "-s 5 -c 7" on arm64/64K then collapses contpte-mapped sources into a
> > larger mTHP.
> 
> I'd fold it into the previous patch.

I would rather not mix new test cases with changes to how the test is
driven.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
