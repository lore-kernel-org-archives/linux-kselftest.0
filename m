Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B96B332EBD
	for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 11:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781177574; cv=none; b=TJZXv0fzhgXXjAnzf5qK7StOhiDLxCAn98VJd+rwt29qeXeTvrC8eiVzN41PZQBy2L2fOOGFBmBGEwKPap7sm8bBcNu/xaaX0jsn3VZfE2zt3F2wAXiG0MnN46s+xp6eY2qafI+h+14Lpd2TQ6k8XfuUXHIlxZNvfENdgjnYygU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781177574; c=relaxed/simple;
	bh=4u48VaRZD6z4yMnLO0HOIC5nQHjj0YseUQZIwrvqrDk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XjdD/NPuEOnkgKG3LYpGYbZwGQcZl6h0eqKee/KYz7Uh/fXrJj05jPCPtUWO7DWyqXlUruK+ZrewKgan/vFTZqXthSWMt1eq5hSTMFJqbnc4fg3ONrBeU+ubM3zuLmav5E0ZvvaQXIU2scDOeSXevtApG6KyGSBFYusi6ZLyh0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dYKASq8J; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="dYKASq8J"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781177570;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ugCqBgi0fBDRK6ivFN1godWvfJz2W8IYf84Kxeh0+zE=;
	b=dYKASq8JccqOc4OOo5oBF8n59LjVvj3IPVQq69yWCe5HhsnqzeUg29hv/PMuf2uac5X7Js
	7Q1Rf/Os9mLDKto0EEDHB4FNOFYMAR8ckq/O9AFshKdy0csWWQDzdK1ZUE5Qy9m4lec9GO
	jptWZJZSwgCFCesE8i+D0fwPOxQhqfg=
From: Lance Yang <lance.yang@linux.dev>
To: david@kernel.org
Cc: sarthak.sharma@arm.com,
	akpm@linux-foundation.org,
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
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aishwarya.TCV@arm.com,
	Lance Yang <lance.yang@linux.dev>
Subject: Re: [PATCH] selftests: mm: fix and speedup "droppable" test
Date: Thu, 11 Jun 2026 19:32:37 +0800
Message-Id: <20260611113237.26621-1-lance.yang@linux.dev>
In-Reply-To: <b2e63557-a0fa-409f-8a75-12d43257efb5@kernel.org>
References: <b2e63557-a0fa-409f-8a75-12d43257efb5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On Thu, Jun 11, 2026 at 01:26:57PM +0200, David Hildenbrand (Arm) wrote:
>On 6/11/26 13:07, Sarthak Sharma wrote:
>> 
>> 
>> On 6/11/26 3:31 PM, David Hildenbrand (Arm) wrote:
>>> The droppable test currently relies on creating memory pressure in a
>>> child process to trigger dropping the droppable pages.
>>>
>>> That not only takes a long time on some machines (allocating and filling
>>> all that memory), on large machines this will not work as we hardcode the
>>> area size to 134217728 bytes.
>>>
>>> ... further, we rely on timeouts to detect that memory was not dropped,
>>> which is really suboptimal.
>>>
>>> Instead, let's just use MADV_PAGEOUT on a 2 MiB region. MADV_PAGEOUT works
>>> with droppable memory even without swap.
>>>
>>> There is the low chance of MADV_PAGEOUT failing to drop a page because
>>> of speculative references. We'll wait 1s and retry 10 times to
>>> rule that unlikely case out as best as we can.
>>>
>>> On a machine without swap:
>>>
>>> 	$ ./droppable
>>> 	TAP version 13
>>> 	1..1
>>> 	ok 1 madvise(MADV_PAGEOUT) behavior
>>> 	# Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
>>>
>>> Reported-by: Aishwarya TCV <Aishwarya.TCV@arm.com>
>>> Fixes: 9651fcedf7b9 ("mm: add MAP_DROPPABLE for designating always lazily freeable mappings")
>>> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
>>> ---
>> 
>> I ran this test before and after applying the patch and recorded the
>> execution time over 5 runs on an Orion O6 board.
>> 
>
>Thanks!
>
>> Before the patch, average execution time = 3.87 s
>
>Out of interest, how much memory did your machine have?
>
>I ran into this myself on a 200gig machine, and there was essentially no
>progress ...

Same here ... With the old test, I waited a quite a while and didn't see
any progress ...  on a 512 GiB machine.
