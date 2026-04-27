Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5DA3148AE
	for <linux-kselftest@vger.kernel.org>; Mon, 27 Apr 2026 12:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777293233; cv=none; b=lg1a+B7GgKOc6A44WlbEgISC05byTH8JA773oxDFKUH9sE/jP3RoEqG8Pq0tD5s5xfqyvuL6nFIu2D+9cayCuwdymISAKatY5AQrgrwzIX2OBQGo4U9cIonRAaR2nri4bxN5/IIswc1gnaRAf/C01LFxnWzhWnQW6XfeoeoRvyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777293233; c=relaxed/simple;
	bh=iE6r7hVylhito6gtb2Vir/8ve7gmL/U6+hUPxE9ZWd4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F0RFVH2P67J98o09vP6aiHiLmm5HdYByjNv+DYEhsWMAkzilLxFSZOjnSRHhXRz+GJJDA90PFzeaaKNRai8Fz7nmmQT+YxV7ruNGhSWeBIOlNx79amUkkwLQ+lsEYLXy0/Uy5KtHmzLCdcEfyAvnLN3vkkrcxrgb3xpqCSgZzEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=q1uWzxPq; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="q1uWzxPq"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777293225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=le6hydx/0AV9ez00tRp6YUb5tjV/ytJlHiXxDmzs5Fw=;
	b=q1uWzxPqZjeOSed5zBa2SVBta4POQ6DRm/xYANV+EBMy77g8C/H+CzzJafOcG8lynu166S
	nXOHZ+9j6PscxlvuS3RqwUkBiSg+g6O3acv5kW02iALlOujnhGt7QECEOGiXFVsD8NGbvb
	vlQyW3Mz0hVavf/L7W6oqgebqmdtJx8=
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
Date: Mon, 27 Apr 2026 20:33:30 +0800
Message-Id: <20260427123330.92847-1-lance.yang@linux.dev>
In-Reply-To: <20260424-ecc_panic-v5-1-a35f4b50425c@debian.org>
References: <20260424-ecc_panic-v5-1-a35f4b50425c@debian.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On Fri, Apr 24, 2026 at 05:23:59AM -0700, Breno Leitao wrote:
>When get_hwpoison_page() returns a negative value, distinguish
>reserved pages from other failure cases by reporting MF_MSG_KERNEL
>instead of MF_MSG_GET_HWPOISON. Reserved pages belong to the kernel
>and should be classified accordingly for proper handling.
>
>Acked-by: Miaohe Lin <linmiaohe@huawei.com>
>Signed-off-by: Breno Leitao <leitao@debian.org>
>---
> mm/memory-failure.c | 11 ++++++++++-
> 1 file changed, 10 insertions(+), 1 deletion(-)
>
>diff --git a/mm/memory-failure.c b/mm/memory-failure.c
>index ee42d43613097..7b67e43dafbd1 100644
>--- a/mm/memory-failure.c
>+++ b/mm/memory-failure.c
>@@ -2432,7 +2432,16 @@ int memory_failure(unsigned long pfn, int flags)
> 		}
> 		goto unlock_mutex;
> 	} else if (res < 0) {
>-		res = action_result(pfn, MF_MSG_GET_HWPOISON, MF_IGNORED);
>+		/*
>+		 * PageReserved is stable here: reserved pages have
>+		 * PG_reserved set at boot or by drivers and are never
>+		 * freed through the page allocator.
>+		 */

Not necessarily. PG_reserved is not a permanent lifetime property for
every page that has carried it.

page-flags.h says early reserved pages may later have PG_reserved
cleared and then be given to the page allocator :)

At least some drivers also clear PG_reserved when releasing pages they
marked reserved.

Would it be clearer to say that pages with PG_reserved set are not
currently managed by the page allocator, rather than saying reserved
pages are never freed through the page allocator?

Otherwise, LGTM.

Reviewed-by: Lance Yang <lance.yang@linux.dev>
