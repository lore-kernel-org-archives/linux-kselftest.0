Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9D03E3C41
	for <linux-kselftest@vger.kernel.org>; Wed, 10 Jun 2026 12:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781093628; cv=none; b=D65yP7pwrZG4tAzVB5r3T9Fk8cBpNQkuFA/SMCa4wVkLcJDaxdWPXhtIipByNiOaanhnwFk4V0nE1b1e552ysDTL2YkeZCCoHttuLacvwFaFU08K60httlLyFBtBQVVsb+uwEVVy/BYeTS1oFCIr2AQNjlTz0OpB4e8F6LYIotQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781093628; c=relaxed/simple;
	bh=3tOm4nsDKVLlgjuHeDHdJzT1QrjLiA2mSDCmk2v/7rk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FbCouOyhZvXDKj7OGXj/LZN6/lUOveCi3x7Cn0eAJ3KDsitupVwbKmJcGp1174GWOkDr8+dIkTIJvagnf9g2eaz7X9d2+/gh3YV4OABrpmBaM9jovgriKA2GSBQYK6S4XhPT6eSoWBwRMzPyw+NcaNcL1KOEZxZw3wqNXzURdPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=kHZon/L9; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="kHZon/L9"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781093622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pwj8jdIsbpLPyXeeuKlvHP7KUJNAfbD2TmuqoyWPWCs=;
	b=kHZon/L9Rk/OuUATUmtFgYllI2r2VhkBLqmv89mnUttaPtOwahpgGto4qvMwY+P5M8q+Sc
	bOh4wFR3Pb39+NVgs12G8vkD7YnjH6QtsLeH+v8duM5y05J2iPXUhWJ0ARLdQeKQl4GwXZ
	LyF/A2b9YFG/Dl/fKi3rESfZcTfxukc=
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
Subject: Re: [RFC PATCH v2 04/11] mm: khugepaged: add shmem mTHP collapse support
Date: Wed, 10 Jun 2026 20:13:31 +0800
Message-Id: <20260610121331.83926-1-lance.yang@linux.dev>
In-Reply-To: <3895c09794739bbfae99d9e021ffacf8a51fb8e2.1781083630.git.baolin.wang@linux.alibaba.com>
References: <3895c09794739bbfae99d9e021ffacf8a51fb8e2.1781083630.git.baolin.wang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On Wed, Jun 10, 2026 at 06:29:12PM +0800, Baolin Wang wrote:
[...]
>@@ -2808,7 +2875,7 @@ static enum scan_result collapse_single_pmd(unsigned long addr,
> 	mmap_read_unlock(mm);
> 	*lock_dropped = true;
> retry:
>-	result = collapse_scan_file(mm, addr, file, pgoff, cc);
>+	result = collapse_scan_file(mm, vma, addr, file, pgoff, cc);

Looks unsafe to pass "vma" down here, since we have already dropped
mmap_read_unlock(mm) ...

A racing munmap() could leave it stale before collapse_scan_file() use
it, no?

Cheers, Lance
