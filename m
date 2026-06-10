Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A474287247
	for <linux-kselftest@vger.kernel.org>; Wed, 10 Jun 2026 11:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781091245; cv=none; b=ZH12TfvRbUOgKE+5ISnvIV//akdbCsT5rIpVf7wW2jJhG9NnQTUdMHKdHCV/6uI3FUoST22qTRT6K/H4cpIE7wjaqxAvGeZgtjKX81TbGbeDDpv+Y26tiSeMhKaaFoPLyxPZGdsYiN2FXA/pdL8G/ioMMIuC3XSyJg0HjWaQUaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781091245; c=relaxed/simple;
	bh=Q1lB1yIPnHpdXh4d+KiI+259dRqDSyD3N8GF7VwoK1o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=puvYCIjmJBDfKN12Bh2ciGFjl2UY/qnxwum2yWBj4Ty+OMAwKa21GeBAf6aOLOZ5BoUhQrCX+iczLJWjKphKpisIvOqfjuUQijGXvnI6pHyFjV3nvvzB8YDLolY5egfR7cjE1mjuGGW4sY2v8U6+gO3fBFqM9CvgZbSChNQDc30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=nMgRuPUs; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="nMgRuPUs"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781091241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XkPIYc6BxTC1Yyureze7Jc2IGyRH65P2wbDPNEliW2Q=;
	b=nMgRuPUsEF8gQiESTcWPWxWWBTGfXbuGadgVqAI4pbIRJufF1wFEEr2lZqs/7Nyb2C0vL+
	A9avhuVNiCQ1fylOgqDEFHvbXwWvJoZD5BykXWoB21ypEEzJ1tcQT7AW/yw6ZfIZ4mC2fW
	/hr0stp5on41u8nUGq09svg8KurEuaE=
From: Lance Yang <lance.yang@linux.dev>
To: baolin.wang@linux.alibaba.com
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	hughd@google.com,
	willy@infradead.org,
	ziy@nvidia.com,
	liam@infradead.org,
	npache@redhat.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 06/11] mm: khugepaged: allow khugepaged to check all shmem mTHP-sized orders
Date: Wed, 10 Jun 2026 19:33:52 +0800
Message-Id: <20260610113352.25352-1-lance.yang@linux.dev>
In-Reply-To: <b4d0c1a5a49284b1f0afb0810e056f6d88b17d30.1781083630.git.baolin.wang@linux.alibaba.com>
References: <b4d0c1a5a49284b1f0afb0810e056f6d88b17d30.1781083630.git.baolin.wang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On Wed, Jun 10, 2026 at 06:29:14PM +0800, Baolin Wang wrote:
>We are now ready to enable shmem mTHP collapse, allowing
>thp_vma_allowable_orders() to check all permissible shmem large orders.
>
>Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>---
> mm/khugepaged.c | 7 ++++++-
> 1 file changed, 6 insertions(+), 1 deletion(-)
>
>diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>index 75b18ec4a6c3..a87918b7e18c 100644
>--- a/mm/khugepaged.c
>+++ b/mm/khugepaged.c
>@@ -578,9 +578,14 @@ static unsigned long collapse_possible_orders(struct vm_area_struct *vma,
> {
> 	unsigned long orders;
> 
>-	/* If khugepaged is scanning an anonymous vma, allow mTHP collapse */
>+	/*
>+	 * If khugepaged is scanning an anonymous or shmem vma,
>+	 * allow mTHP collapse.
>+	 */
> 	if ((tva_flags == TVA_KHUGEPAGED) && vma_is_anonymous(vma))
> 		orders = THP_ORDERS_ALL_ANON;
>+	else if ((tva_flags == TVA_KHUGEPAGED) && vma_is_shmem(vma))
>+		orders = THP_ORDERS_ALL_FILE_DEFAULT;

Hmm... for shmem, is the lower bound in mthp_collapse() expected?

#define KHUGEPAGED_MIN_MTHP_ORDER	2

#define THP_ORDERS_ALL_FILE_DEFAULT	\
	((BIT(MAX_PAGECACHE_ORDER + 1) - 1) & ~BIT(0))

KHUGEPAGED_MIN_MTHP_ORDER is 2, which was introduced for anon collapse.
For shmem, though, we're feeding mthp_collapse() orders from
THP_ORDERS_ALL_FILE_DEFAULT, and that only filter out order-0 ...

		if (order > KHUGEPAGED_MIN_MTHP_ORDER &&
			(enabled_orders & GENMASK(order - 1, 0))) {
			order--;
			continue;
		}

So order-1 never gets a chance. The walker stops at order-2 and never
tries it, right?

> 	else
> 		orders = BIT(HPAGE_PMD_ORDER);
> 
>-- 
>2.47.3
>
>
