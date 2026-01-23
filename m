Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5EA124169D;
	Fri, 23 Jan 2026 08:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769156236; cv=none; b=WD4uT3Z6zkKS7yTQ4217wG0xmOEXjYBC/2RshdcbMueQExKr+azkEG4WdYrqtdEX3bWbNe303Or/7xUwo3FPFVuNq9kR1una4mQ7Md84zGQG8v/nv5jNV8ArlWLFf/h5I0dhjXbzmi9VoytHB/CUbGcLwJKaXR1homYDh4tIKSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769156236; c=relaxed/simple;
	bh=q76GxKf571aWV0I/Pa/JClhBRMLw2Sgfua5X1b+l1is=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l8H+kUNZm/ehevQNIrRXyS+jWJA1FHypVrZmr9wPA0sy/lUIxuu+axtM+8krSkK2BoG3UgGqbUJPaqU9EUGwjWRdkGMysiZ1KbUJ52EDqixZACPdLKTDYJj9lDOlGFDa/6+s4bdbyIMYMUEWRlEItH9x7CgKq5iXcZDUrJ5WsE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B6391476;
	Fri, 23 Jan 2026 00:17:07 -0800 (PST)
Received: from [10.57.50.81] (unknown [10.57.50.81])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E607A3F740;
	Fri, 23 Jan 2026 00:17:11 -0800 (PST)
Message-ID: <ed372449-de6d-4588-868c-1b87d5655632@arm.com>
Date: Fri, 23 Jan 2026 09:17:09 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/9] selftests/mm: check that FORCE_READ() succeeded
To: "David Hildenbrand (Red Hat)" <david@kernel.org>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Dev Jain <dev.jain@arm.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Mark Brown <broonie@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Shuah Khan <shuah@kernel.org>
References: <20260122170224.4056513-1-kevin.brodsky@arm.com>
 <20260122170224.4056513-6-kevin.brodsky@arm.com>
 <fe1ecb39-abbc-452c-b3a3-61d63ca32244@kernel.org>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <fe1ecb39-abbc-452c-b3a3-61d63ca32244@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/01/2026 23:18, David Hildenbrand (Red Hat) wrote:
> On 1/22/26 18:02, Kevin Brodsky wrote:
>> Many cow tests rely on FORCE_READ() to populate pages. Introduce a
>> helper to make sure that the pages are actually populated, and fail
>> otherwise.
>>
>> Suggested-by: David Hildenbrand (Red Hat) <david@kernel.org>
>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>> ---
>>   tools/testing/selftests/mm/cow.c | 43 ++++++++++++++++++++++++--------
>>   1 file changed, 33 insertions(+), 10 deletions(-)
>>
>> diff --git a/tools/testing/selftests/mm/cow.c
>> b/tools/testing/selftests/mm/cow.c
>> index 83b3563be26b..d9c69c04b67d 100644
>> --- a/tools/testing/selftests/mm/cow.c
>> +++ b/tools/testing/selftests/mm/cow.c
>> @@ -75,6 +75,18 @@ static bool range_is_swapped(void *addr, size_t size)
>>       return true;
>>   }
>>   +static bool populate_page_checked(char *addr)
>> +{
>> +    bool ret;
>> +
>> +    FORCE_READ(*addr);
>> +    ret = pagemap_is_populated(pagemap_fd, addr);
>> +    if (!ret)
>> +        ksft_print_msg("Failed to populate page\n");
>> +
>> +    return ret;
>> +}
>
> LGTM.
>
> On second thought, this primarily catches if someone breaks
> FORCE_READ() ... which hopefully doesn't happen that often? ;)
>
> Because if the read succeeded, surely there must be something in the
> page tables. 

Indeed, one would hope so! The check doesn't hurt either though
(especially since we already have the pagemap fd around).

- Kevin
