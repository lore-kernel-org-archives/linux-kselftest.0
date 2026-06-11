Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDDA3DCDA7
	for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 11:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781176573; cv=none; b=hOS1Zeu+0z8cyAImSG8/bsyoZtclmeDFigXZb7haSdNCR2S1Px8LqDRU1ZY4wunFhaekF0EDpfRozN0DQp0q7IPn0I83ArarvlwcXp8oluEYfbA+YHLupAV8zzyv/Yv+SQXVBU1GjX5BrKyPmjWjoahLDpQmbPI9Xghyof8ftaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781176573; c=relaxed/simple;
	bh=e2LCHxsQ2iKQGKTtBi3+1fhZhq2EwIFZwRpMSpsFvU4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GI/XKhlQDbi+0bs1Zw4JLVmgin7frNM2pfO5/to3GC54BZMuK3cxWTAapxAvb5IZEsyRCO1VEmgzi1hoxYZjbrOVqw1DBGm9CJHhrFYqcLIhYYOGLX8u5ta2VIrVuDudAUBf0fXcP4EJL5D+wOvoEhOBZ+Ex0xNNrgNN/L8tq9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xYXa4vxz; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xYXa4vxz"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781176569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YSIrasaGW1+vT6euBKp5FQeyC5hX4yIQf5dAsfWbK80=;
	b=xYXa4vxzQ3jzcKzp/ooX2aiaMgQNEJsFu27QWjCBmAiytg7ZBu+X5zb+55GxGTehUVF7kc
	1EvEw4yZ0V7lkzAbeFcc5gpe6MZ0L9dPjMmWwwPMyZXJ62VljCZf+UWnNyOtU2vSl5bOvV
	ekuOGVb+q+mdKgWUFsyY/I+0Pex/9/Q=
From: Lance Yang <lance.yang@linux.dev>
To: david@kernel.org
Cc: akpm@linux-foundation.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	Jason@zx2c4.com,
	anthony.yznaga@oracle.com,
	broonie@kernel.org,
	sarthak.sharma@arm.com,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aishwarya.TCV@arm.com,
	Lance Yang <lance.yang@linux.dev>
Subject: Re: [PATCH] selftests: mm: fix and speedup "droppable" test
Date: Thu, 11 Jun 2026 19:15:38 +0800
Message-Id: <20260611111538.9883-1-lance.yang@linux.dev>
In-Reply-To: <20260611-droppable_test-v1-1-b6a73d99f658@kernel.org>
References: <20260611-droppable_test-v1-1-b6a73d99f658@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On Thu, Jun 11, 2026 at 12:01:55PM +0200, David Hildenbrand (Arm) wrote:
>The droppable test currently relies on creating memory pressure in a
>child process to trigger dropping the droppable pages.
>
>That not only takes a long time on some machines (allocating and filling
>all that memory), on large machines this will not work as we hardcode the
>area size to 134217728 bytes.
>
>... further, we rely on timeouts to detect that memory was not dropped,
>which is really suboptimal.
>
>Instead, let's just use MADV_PAGEOUT on a 2 MiB region. MADV_PAGEOUT works
>with droppable memory even without swap.
>
>There is the low chance of MADV_PAGEOUT failing to drop a page because
>of speculative references. We'll wait 1s and retry 10 times to
>rule that unlikely case out as best as we can.
>
>On a machine without swap:
>
>	$ ./droppable
>	TAP version 13
>	1..1
>	ok 1 madvise(MADV_PAGEOUT) behavior
>	# Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
>
>Reported-by: Aishwarya TCV <Aishwarya.TCV@arm.com>
>Fixes: 9651fcedf7b9 ("mm: add MAP_DROPPABLE for designating always lazily freeable mappings")
>Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
>---

Cool! Tested with swap both off and on, and it passed either way :D

That's what I'd expect, VM_DROPPABLE folios stay anon + non-swapbacked,
so reclaim can discard them instead of swapping them out :)

Tested-by: Lance Yang <lance.yang@linux.dev>
