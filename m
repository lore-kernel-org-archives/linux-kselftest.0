Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E7C344D9D
	for <linux-kselftest@vger.kernel.org>; Mon, 27 Apr 2026 15:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777305493; cv=none; b=Xl1P43Z1w1JiqbOCA9lzD2KZExprQScXYl9OKNW5CawaJ7IuMV05tFuN7vT7KrpwV0VLquHvsbmnqp4r+8iJ1ivPwuiu9jlI7OZbslDb8FXqO3hbWCx1oQVl+rji+fncpIHYWaCD681RL/Vrp6a2qt2/dpXFpPUjYTjhCEfPgrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777305493; c=relaxed/simple;
	bh=WNcCv2dYJaAVCb27nOY+hxf7Ohx8wEqh/8daXbYI+Tc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gd8UGmYZk6LZ937wmQM3mv/XLvIHDZH1ywnaYrF1TA+3FC6NsdIotkGSEs6a4fza9Gcn2oMLIRPrO1bfv0I7AoPE0CGqmOlRu7xG0QrGq8nKoLIP2mju0P9zdovKNTglCx/OQhL5xwTspxWSZfD2zbpgkIUAsMTw1vNBqHPHN0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xLewC43e; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xLewC43e"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777305480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tDtbus8CxHrwyQM3OMQxzeKwt9hPmc6cbwSAuU/oDr8=;
	b=xLewC43eXTp7cTNuezMPBEADJ3J7iL+BrYFniYehOCZGgKBxD6ZhQZp07xLW6DCG+UmilV
	IOkePLTdKPAeFsDUqJWTK6ciN34NHPccn51FnevfhPh34nyCSvwRY+ENY2bUVVvl6mVJTS
	i788J1u1a8TuefrI+2Erz7vnZpZ6rU0=
From: Lance Yang <lance.yang@linux.dev>
To: leitao@debian.org
Cc: linmiaohe@huawei.com,
	nao.horiguchi@gmail.com,
	akpm@linux-foundation.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	david@kernel.org,
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
Subject: Re: [PATCH v5 1/4] mm/memory-failure: report MF_MSG_KERNEL for reserved pages
Date: Mon, 27 Apr 2026 23:57:39 +0800
Message-Id: <20260427155739.1643-1-lance.yang@linux.dev>
In-Reply-To: <20260427123330.92847-1-lance.yang@linux.dev>
References: <20260427123330.92847-1-lance.yang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On Mon, Apr 27, 2026 at 08:33:30PM +0800, Lance Yang wrote:
>
>On Fri, Apr 24, 2026 at 05:23:59AM -0700, Breno Leitao wrote:
>>When get_hwpoison_page() returns a negative value, distinguish
>>reserved pages from other failure cases by reporting MF_MSG_KERNEL
>>instead of MF_MSG_GET_HWPOISON. Reserved pages belong to the kernel
>>and should be classified accordingly for proper handling.
>>
>>Acked-by: Miaohe Lin <linmiaohe@huawei.com>
>>Signed-off-by: Breno Leitao <leitao@debian.org>
>>---
>> mm/memory-failure.c | 11 ++++++++++-
>> 1 file changed, 10 insertions(+), 1 deletion(-)
>>
>>diff --git a/mm/memory-failure.c b/mm/memory-failure.c
>>index ee42d43613097..7b67e43dafbd1 100644
>>--- a/mm/memory-failure.c
>>+++ b/mm/memory-failure.c
>>@@ -2432,7 +2432,16 @@ int memory_failure(unsigned long pfn, int flags)
>> 		}
>> 		goto unlock_mutex;
>> 	} else if (res < 0) {
>>-		res = action_result(pfn, MF_MSG_GET_HWPOISON, MF_IGNORED);
>>+		/*
>>+		 * PageReserved is stable here: reserved pages have
>>+		 * PG_reserved set at boot or by drivers and are never
>>+		 * freed through the page allocator.
>>+		 */
>
>Not necessarily. PG_reserved is not a permanent lifetime property for
>every page that has carried it.
>
>page-flags.h says early reserved pages may later have PG_reserved
>cleared and then be given to the page allocator :)
>
>At least some drivers also clear PG_reserved when releasing pages they
>marked reserved.
>
>Would it be clearer to say that pages with PG_reserved set are not
>currently managed by the page allocator, rather than saying reserved
>pages are never freed through the page allocator?
>
>Otherwise, LGTM.

Ouch, I missed one more thing ...

Sashiko pointed out that[1]

> +		if (PageReserved(p))

"Can this introduce a use-after-free risk on the struct page?"

get_any_page() may put the page before returning -EIO. After that ref is
dropped, PageReserved(p) is not safe, IIUC :(

Maybe just cache it before the call?

is_reserved = PageReserved(p);
res = get_hwpoison_page(p, flags);

[1] https://sashiko.dev/#/patchset/20260424-ecc_panic-v5-0-a35f4b50425c@debian.org
