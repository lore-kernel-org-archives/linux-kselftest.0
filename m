Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.243
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795374921;
	b=VdTeC5E3V0FOBpjdjM3sZOkHcZSaviGXtknLkgK1T94cQAvz7XIKzCdEiC+/UpPRlx9M
	 yhNDf1ZAiSYK9Oz4ocbPvKhFMrT7qy3QW5PIBbhOaiFa4seufCD3TbPDvLW+mxuK8h4I3
	 /X4qXREbviMu6ckRxNxl67KtR01fAu/HSVoputAvyS7vPL+YMdvqQiuDZoQPfhBJlbS0/
	 DypccbNVMwGd58+Z1f5dBN77EoIPnNAPLaoj4xJptIVEETXO/1B5xdzCBip0TiICM0tA6
	 v/jGtS+Qmiipm3HmKxPDgRkwxoIrbYqW6zC7outSPXu/hicPuxNlRwptSr5XydY22Cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795374921;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=aqurIDgbeEe2K43Zq1XV0Q8E+eXK8AG7Zt+b/v9C/ZU=;
	b=O3n1/hyFy765x5KAIIC70bfHBbLlWUlOHZYNQjCKTwNAs2MSqWb43kflmJIkyswMTKRF
	 h3qp7MHbVolaRsizCCdKdpJBcClhK+2Yysz02E+F9hw1La6mJbpyY2Dp9qdMqwmEFW3zI
	 X7otKd1S7eS106HUe0HsCIrJfhxheJZtd/8ij2iPeXas3B53UCUQO3wR5mGwUPyGVF9h4
	 2ZJZXVr/iiLDsZuZ7Eq66DrfWkTU+JDPI5WjM0xdnDUz2jO7+kFvnMblzdROu5VbDZCHS
	 pBKYcpykG5yTdtPw1zn+dwQEQlyP7/RvXJaGYrJsNQa34fCfYrawIXCTsl7HSpAJxXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=I+ke6zdQ;
	arc=none smtp.remote-ip=91.218.175.243
Received: from mta0.migadu.com (out-243.mta0.migadu.com [91.218.175.243])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A1A606A31D
	for <linux-kselftest@vger.kernel.org>; Sun, 22 Nov 2026 19:15:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2A1A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=I+ke6zdQ
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=LcJnLrBE/05Yu8bxeXg4dmOsRNfKSgLvD3cHJQIgLZs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795374917; v=1; x=1795979717;
 b=I+ke6zdQ1G0LKD8eSdZHs5yHzPM93jDOv3pAD34cThH1oBb1m+n4nANQEmI5524awhYTHQUD
 FvZbbtywt9eLRvVXQQCcgVoVNymseKj7KXXqLcIuziUBtQtz/QjeAgpDr8QUUz4G5pes3Gc2Vum
 ar5N21e7SrRJ8dfxaZKuKQ98=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 576918abaff7db61;
	Sun, 22 Nov 2026 19:15:17 +0000
X-Mizu-Trace-ID: 576918abaff7db61
X-Migadu-Flow: FLOW_OUT
Message-ID: <8e2b160d-0a80-4dc6-8a28-3c7a19f1676f@linux.dev>
Date: Sun, 22 Nov 2026 12:15:11 -0700
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/mm: honor VM_SELFTEST_ITEMS from the
 environment
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
 Tianyi Chen <hi@tychen.cc>, stable@vger.kernel.org
References: <20261122-vm_selftests_items_fix-v1-1-9edef5e7975d@linux.dev>
 <20261122110211.81cf2fbbfc9048264aba50c5@linux-foundation.org>
Content-Language: en-US
From: Nico Pache <nico.pache@linux.dev>
In-Reply-To: <20261122110211.81cf2fbbfc9048264aba50c5@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/22/26 12:02 PM, Andrew Morton wrote:
> On Sun, 22 Nov 2026 11:50:36 -0700 "Nico Pache (Red Hat)" <nico.pache@linux.dev> wrote:
> 
>> The unconditional default assignment overwrites VM_SELFTEST_ITEMS from
>> the environment. This regresses environments that use the variable to
>> select test groups: without -t, all default test categories run instead
>> of the requested groups. The -t option continues to override it.
> 
> Oh.  Is "setenv VM_SELFTEST_ITEMS" really a thing?

Thats how we've been utilizing it since we added this. It was the 
easiest solution for our testing infrastructure.
> 
> afaict the official way of doing this is to use -t.  Continuing to
> support "setenv VM_SELFTEST_ITEMS" is perpetuating bad behavior.  How
> about teaching "environments" to use the official selection method?

Ok, fair enough. I will look into switching over.

Thanks,
-- Nico

