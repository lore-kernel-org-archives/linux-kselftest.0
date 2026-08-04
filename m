Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF204854F2
	for <linux-kselftest@vger.kernel.org>; Tue,  4 Aug 2026 20:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785875966; cv=none; b=CTYK1iiEURIP2mI4K7urOHsZBY+DoCIqDPymzrVvdbdg48XiGYTn6IAwk+S3j+6YohnSnrB0C+PK9V0JXVukshDHScGLUP6LCEWXVs5EOppHhOGABYBhBAXs3D6ehPPZRPjRFIqH5VpAZhZXsGg7I3A+rQbYpDgZYWW7XgEg1ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785875966; c=relaxed/simple;
	bh=Ty+yfFa9oPIZ93SGKh37UjrQYSRa+14JIKOcEtac2x4=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=OLsTgwaG9VX84Uis+RgLB6wFdr372iIL1pzhagc3VPgsw1nSouxNgESJsm49p7gDo1szI5TD+S1xuZRwnyD0IYWBCLMcegdnnfqbJAbLSbxauY+/psaHMAwCOyivCbK+6g79pz69HsEJmz4yv3xJk7BajX5vks2FkUY9PaXHUAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=PLXXap5m; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="PLXXap5m"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785875963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zl3F0byEfCXmpsT1iK6pCikvkisM6Tdd2cy9rwtmU4A=;
	b=PLXXap5mJ1LFNToXKpJsMN9j5+GgAbveiW0Z9jXk3tqj6eCtJkgy59l5yHABxDG3yoTQYu
	SyyfqdozSOzQTMGx294dJyJaBY1sMi2XOwOXiTa6AfQAs5W4oZG5A9R1gXlduTMiE39W09
	ucQIqk3VRYjQu7/i0U/RBMB0XwxNJhQ=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 3/4] selftests: mm: implement the mTHP-sized
 hugepage check helpers
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Nico Pache (Red Hat)" <nico.pache@linux.dev>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
 ziy@nvidia.com, liam@infradead.org, nico.pache@linux.dev, dev.jain@arm.com, 
 ryan.roberts@arm.com, baohua@kernel.org, lance.yang@linux.dev, 
 usama.arif@linux.dev, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <eb75f6d510fb48f14e25fde85e5a5e2b67cef394.1785564857.git.baolin.wang@linux.alibaba.com>
References: <cover.1785564857.git.baolin.wang@linux.alibaba.com>
 <eb75f6d510fb48f14e25fde85e5a5e2b67cef394.1785564857.git.baolin.wang@linux.alibaba.com>
Date: Tue, 04 Aug 2026 14:38:43 -0600
Message-Id: <178587592371.79283.12308029831149013352.b4-review@b4>
X-Migadu-Flow: FLOW_OUT

> Implement mTHP-sized hugepage checking helpers using gather_folio_orders().
> Also rename the existing PMD-sized huge page check function to
> __check_pmd_huge() for clarity.
> 
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>

LGTM!

Reviewed-by: Nico Pache (Red Hat) <nico.pache@linux.dev>

-- 
Nico Pache (Red Hat) <nico.pache@linux.dev>
