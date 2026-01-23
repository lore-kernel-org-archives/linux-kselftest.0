Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8787A344D9D;
	Fri, 23 Jan 2026 08:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769156759; cv=none; b=ptoDJQJh99Jj30xsNU1ku3WpW6iboWddnDrev0PnwW4DM3Cgca/eI00q0d4KIVkFDh0kwE07MXIb3D3EcqzU9Kv8zFOlM+ouxUyCecxHXkOHRbFGPq+cFpJi1t5MfoDK/jxr4kchG2D14Ga8/XiEwIh6kowCw96MMEYSFG6cTSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769156759; c=relaxed/simple;
	bh=H+Ph4/HiAVNACiAQVzTRg9VZTx7FI1NIAhiZlTUmiMw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ctcWo2pxPLUo1/xyCsIVNyIN5v1C8v4J61AhkD/4SkUm1OnuwDGTp3kYSddSPgjaMfbDjpe5JYtNhokZOZLKwxOwiWFN4RL+F9wPthy1WiH2TqkjVk6q0E+8g0iIHBYz9g8zp1Gt+2+yuV0tBgFTQFH6XW46lBBAHOeKZLXp6xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4FC481476;
	Fri, 23 Jan 2026 00:25:50 -0800 (PST)
Received: from [10.57.50.81] (unknown [10.57.50.81])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EF7B63F740;
	Fri, 23 Jan 2026 00:25:54 -0800 (PST)
Message-ID: <cf0a3f62-5673-47b4-afa9-1f2daab5e0b5@arm.com>
Date: Fri, 23 Jan 2026 09:25:52 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/9] selftests/mm: introduce helper to read every page
To: "David Hildenbrand (Red Hat)" <david@kernel.org>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Dev Jain <dev.jain@arm.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Mark Brown <broonie@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Shuah Khan <shuah@kernel.org>
References: <20260122170224.4056513-1-kevin.brodsky@arm.com>
 <20260122170224.4056513-7-kevin.brodsky@arm.com>
 <a4c83b16-3307-497d-9690-0e31672f3202@kernel.org>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <a4c83b16-3307-497d-9690-0e31672f3202@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/01/2026 23:20, David Hildenbrand (Red Hat) wrote:
>> diff --git a/tools/testing/selftests/mm/hugetlb-madvise.c
>> b/tools/testing/selftests/mm/hugetlb-madvise.c
>> index 05d9d2805ae4..5b12041fa310 100644
>> --- a/tools/testing/selftests/mm/hugetlb-madvise.c
>> +++ b/tools/testing/selftests/mm/hugetlb-madvise.c
>> @@ -47,14 +47,7 @@ void write_fault_pages(void *addr, unsigned long
>> nr_pages)
>>     void read_fault_pages(void *addr, unsigned long nr_pages)
>>   {
>> -    unsigned long i;
>> -
>> -    for (i = 0; i < nr_pages; i++) {
>> -        unsigned long *addr2 =
>> -            ((unsigned long *)(addr + (i * huge_page_size)));
>> -        /* Prevent the compiler from optimizing out the entire loop: */
>> -        FORCE_READ(*addr2);
>> -    }
>> +    force_read_pages(addr, nr_pages, huge_page_size);
>>   }
>
> Likely we could get rid of read_fault_pages() completely and simply
> let the callers call force_read_pages() now?

I considered it but since the test also has write_fault_pages() with the
same arguments, I thought it was better to keep it for symmetry (neither
takes the page size since huge_page_size is a global).

- Kevin
