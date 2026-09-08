Received: from mta1.migadu.com (out-73.mta1.migadu.com [95.215.58.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655FC352025
	for <linux-kselftest@vger.kernel.org>; Tue,  8 Sep 2026 11:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788866561; cv=none; b=kGDU1WLQQE19uzYWf6XGUKbKyB9BauN5PXS+6jBx3uYF+3fOGbDWiKONZipFmU5x4qCEO4DK0RvsAqV0/THlERCNp0c5l7wwHdVCzhaLOE1bn6pL4Vhzy9uU0XQFio6axPoYiCkRIMZU28IAEoA/hZwYBYqmYYjZFIfzNLZTGss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788866561; c=relaxed/simple;
	bh=ZZA+ZfYds4/VfNcL2acHrCCj6KTrChkpY0m87hvHxuE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RFHWTaDj44q3AbGpFSmGSOqgsEcbPJvT+OXumUwYLEQ/XjoV6cMEbuYyX3vUW7N41sIWZg+QYE4m26piFBpeuwRjLA1CsqyHpLHsMDwNvgPuID+ZaJxspTc8VYPJIw8Z9mM6vl2Wsw+iN+JROFbhIzfnHV//nBhY0Jd1XVCr43c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Ies7xEzQ; arc=none smtp.client-ip=95.215.58.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Ies7xEzQ"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ZZA+ZfYds4/VfNcL2acHrCCj6KTrChkpY0m87hvHxuE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788866550; v=1; x=1789471350;
 b=Ies7xEzQJf7JxDZI/4u0i0dCM/tumbE7X7UkIPTCa8Z5ARLiHjNVkfxiZ3PFHwp96chf3NQU
 dVIvz00L+tb2eBJs9D+tVhVjH08j1q+CO9C5+6xJMDiGR50gQGryYUZlA/6AjSIqP64De8daXGI
 nLGXEd1Hr+gXT+pXN1droyn8=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1cd0bb8d8965546c;
	Tue, 08 Sep 2026 11:22:30 +0000
X-Mizu-Trace-ID: 1cd0bb8d8965546c
X-Migadu-Flow: FLOW_OUT
Message-ID: <df053a08-6c9a-4e56-9ba5-bdfbf930331b@linux.dev>
Date: Tue, 8 Sep 2026 19:22:18 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/mm: fix size truncation in pagemap_ioctl test
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, akpm@linux-foundation.org, ljs@kernel.org,
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, shuah@kernel.org
References: <20260907135613.68692-1-zenghui.yu@linux.dev>
 <9a21fc3c-1ca9-42a3-a044-6421f20341f6@kernel.org>
Content-Language: en-US
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <9a21fc3c-1ca9-42a3-a044-6421f20341f6@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/7/26 11:22 PM, David Hildenbrand (Arm) wrote:
> On 9/7/26 15:56, Zenghui Yu wrote:
> > From: "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>
> >
> > On arm64 with 64K base pages, the huge page size is 512 MiB, and
> > hpage_unit_tests() builds a 5 GiB range (10 * 512 MiB) for its tests.  This
> > exceeds the range of the int size parameters of gethugepage(),
> > wp_addr_range() and pagemap_ioctl().  The implicit truncation to 1 GiB
> > makes gethugepage() allocate a too small buffer, while the callers keep
> > operating on the original 5 GiB range, resulting in spurious failures or
> > SIGSEGV.
> >
> > Change those size parameters to size_t.
> >
> > Fixes: 46fd75d4a3c9 ("selftests: mm: add pagemap ioctl tests")
> > Assisted-by: GLM-5.3 OpenCode
> > Signed-off-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>
> > ---
> 
> Looking at pagemap_ioctl.c ... I think most functions should actually be "static".

Yup.

> Using size_t is ok. But then we should also change "unsigned long long mem_size"
> to size_t, no?
> 
> Also, in wp_free() we are suddenly using "long size". In pagemap_ioc() we're
> also still using "int len".
> 
> Can we consistently use one type please?

Yes we can.  This patch adopts a minimal fix for this specific issue.  I'll
unify all size-related parameters and variables to size_t in v2.

Thanks,
Zenghui
