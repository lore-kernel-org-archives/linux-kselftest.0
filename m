Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78ABB319860
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 03:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777345671; cv=none; b=m/LMA5I0Y4x7xRen9Q+UDLmlcu+/xQ5rKheui3fjrMXsvHq4Xzbzst0gI0pHMi6GG7rmyXU43CKwRqPEKDgPbbQgs9KCECWlek5Ccw8kv30ps3xm9LPy05TucBpNOJLgKXjaQ2X2WegYxjCF1ivQ8y25Mpfd/5okhCwsw1fExRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777345671; c=relaxed/simple;
	bh=vPZOHLpnw6qvWRFBeNQr/H7ZPyW+vnDdupyXWqnFWZc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g4GCzpNRyRQYeIAqsS57JvfQ8PLTWdceb9VWJueXHh3H+vYu4puXV7Q4T8EiJUxLsTehHwTFgF8Uy9+jXE/8Esgvmt45CZ9qqb+QQt0xV2ISbGcEsT2sDZlcb00YpflS3M74upms97SUP0T7gPzW2Bfdiej0qBB2mwIxdNCZf8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=C/5E07o5; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="C/5E07o5"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777345668;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2vXopIJ6bPk662tpRo3Ap6e3dMCysOxObD7QwuYgogQ=;
	b=C/5E07o5KiPNvUDDPwfcoQfRHgs0MPRxYOsiz1uT98cUtj9eTQ+M0ttLj5Kxz2Dgtk4gwp
	RRX23JimIv/ai2vaf6MzFF3Ay9b+EfH+GUA/vJT9zukxqblzZr0ooQUNluCSyBPA41EZmj
	Kxm64LA+1MLQkxlloBVSIsdmz+xsQYA=
From: Lance Yang <lance.yang@linux.dev>
To: leitao@debian.org,
	david@kernel.org
Cc: linmiaohe@huawei.com,
	nao.horiguchi@gmail.com,
	akpm@linux-foundation.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	ljs@kernel.org,
	Liam.Howlett@oracle.com,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kernel-team@meta.com,
	Lance Yang <lance.yang@linux.dev>
Subject: Re: [PATCH v5 2/4] mm/memory-failure: add panic option for unrecoverable pages
Date: Tue, 28 Apr 2026 11:07:21 +0800
Message-Id: <20260428030721.51274-1-lance.yang@linux.dev>
In-Reply-To: <9d365395-051a-436b-9017-352ebc889770@kernel.org>
References: <9d365395-051a-436b-9017-352ebc889770@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On Mon, Apr 27, 2026 at 05:49:28PM +0200, David Hildenbrand (Arm) wrote:
>> +	switch (type) {
>> +	case MF_MSG_KERNEL:
>> +	case MF_MSG_UNKNOWN:
>> +		return true;
>> +	case MF_MSG_KERNEL_HIGH_ORDER:
>> +		/*
>> +		 * Rule out a concurrent buddy allocation: give the
>> +		 * allocator a moment to finish prep_new_page() and
>> +		 * re-check. A genuine high-order kernel tail page stays
>> +		 * unowned; an in-flight allocation will have bumped the
>> +		 * refcount, attached a mapping, or placed the page on
>> +		 * an LRU by now.
>> +		 */
>> +		p = pfn_to_online_page(pfn);
>> +		if (!p)
>> +			return true;
>> +		/*
>> +		 * Yield so a concurrent allocator on another CPU can
>> +		 * finish prep_new_page() and have its writes become
>> +		 * visible before we resample the page state.
>> +		 */
>> +		cpu_relax();
>> +		return page_count(p) == 0 &&
>> +		       !PageLRU(p) &&
>> +		       !page_mapped(p) &&
>> +		       !page_folio(p)->mapping &&
>> +		       !is_free_buddy_page(p);
>
>I don't get what you are doing here. The right way to check for a tail page is
>not by checking the refcount.
>
>Further, you are not holding a folio reference? If so, calling
>page_mapped/folio_mapped is shaky. On concurrent folio split you can trigger a
>VM_WARN_ON_FOLIO().
>
>
>Maybe folio_snapshot() is what you are looking for, if you are in fact not
>holding a reference?

Right! Maybe we should not try to make this decision in
panic_on_unrecoverable_mf().

By the time we get here, we only know the final MF_MSG_* type. The
real reason why get_hwpoison_page() failed is already lost.

Wonder if it would be better to split that earlier, around
__get_unpoison_page()/get_any_page(). That code still knows why
grabbing the page failed, either an unsupported kernel page or
just a temporary race we cannot really trust :)

Then the later panic logic can be simple: panic for the stable
unsupported kernel page case, and not for the temporary race case.

That would also avoid trying to guess MF_MSG_KERNEL_HIGH_ORDER here:)

Cheers,
Lance
