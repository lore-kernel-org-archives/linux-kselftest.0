Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1E9830F932;
	Mon, 17 Aug 2026 11:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786967690; cv=none; b=BqlqIpWrbH3OFDyMm3ncZ/ES6O2snntumcjzeJugdN4Pur1DQ4HRv8RlgMMsRST+WLxbHvmd5hSofG4aTPvt/gfu5YG/F1wyeesNsidke4FTz3+ISVGULm8C7yPusx0hLys0BPP6EwfNasWg/e0xSg4EvLT8osdWUjLDjQnn1LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786967690; c=relaxed/simple;
	bh=661eddBtEHg+73xuJUgBQumGRYXf11IA7RbS7mODuQ8=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=H9IDk+GBYa0zEVSr1wuFWX2I74I5jFwPzf/0tkADPhLLRyGuFpUhTxa04LWsFCdbCCNIP7mOroG6XPgY7l6VWkjkaTod5ypxekDp4/whPCcvEtB2PiMJch4UHBrbzAlvWuO3Q0MAzHQKdCg2rwq9ElQmKAOKZ/FMbZ6F0x9UlBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=V4ZYkkyQ; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="V4ZYkkyQ"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CFDD61688;
	Mon, 17 Aug 2026 04:54:43 -0700 (PDT)
Received: from [10.2.198.93] (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B80F83F85F;
	Mon, 17 Aug 2026 04:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786967687; bh=661eddBtEHg+73xuJUgBQumGRYXf11IA7RbS7mODuQ8=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=V4ZYkkyQMswep8Nd0trfC74IkYcP6lCBZDcqGYVwopQ8+KrhE/WSHg6SAbUSVYprJ
	 eJSQDahVKNeMWQuRBSwlEoE7+OwPiB4dx/U/R4Cu/s1NfhYENOT6qXZP5/42wRC/sV
	 hjpmzCOU0F+aMhoCTC4vWqkurmsWSqU6dxWj5Fo8=
Message-ID: <461b03f4-4bce-463b-abe6-ea3e56f8aa22@arm.com>
Date: Mon, 17 Aug 2026 12:54:44 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: usama.anjum@arm.com, akpm@linux-foundation.org, david@kernel.org,
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, shuah@kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Hongfu Li <lihongfu@kylinos.cn>
Subject: Re: [PATCH] selftests/mm: Drop redundant open() in mprotect_tests()
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Hongfu Li <hongfu.li@linux.dev>
References: <20260817080616.52946-1-hongfu.li@linux.dev>
 <aoLvynyoJ9RKRIMk@lucifer>
From: Usama Anjum <usama.anjum@arm.com>
Content-Language: en-US
In-Reply-To: <aoLvynyoJ9RKRIMk@lucifer>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/08/2026 12:29 pm, Lorenzo Stoakes (ARM) wrote:
> +cc Muhammad
> 
> On Mon, Aug 17, 2026 at 04:06:16PM +0800, Hongfu Li wrote:
>> From: Hongfu Li <lihongfu@kylinos.cn>
>>
>> Remove duplicate open() for local pagemap_fd in mprotect_tests() that
>> shadows the global pagemap_fd already opened in main(). The local fd
>> is never used in the function.
>>
>> Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
> 
> Hmm yeah it's not even closed either...
> 
> I'm assuming this was an error in the origianl tests, Muhammad - I'm
> guessing some artifact of a previous approach or similar?
Its definitively the dead code.

Reviewed-by: Muhammad Usama Anjum <usama.anjum@arm.com>

> 
> Anyway, LGTM, so:
> 
> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> 
>> ---
>>  tools/testing/selftests/mm/pagemap_ioctl.c | 6 ------
>>  1 file changed, 6 deletions(-)
>>
>> diff --git a/tools/testing/selftests/mm/pagemap_ioctl.c b/tools/testing/selftests/mm/pagemap_ioctl.c
>> index cfd1987339c1..eadc7159ca5b 100644
>> --- a/tools/testing/selftests/mm/pagemap_ioctl.c
>> +++ b/tools/testing/selftests/mm/pagemap_ioctl.c
>> @@ -1332,12 +1332,6 @@ int mprotect_tests(void)
>>  	int ret;
>>  	char *mem, *mem2;
>>  	struct page_region vec;
>> -	int pagemap_fd = open("/proc/self/pagemap", O_RDONLY);
>> -
>> -	if (pagemap_fd < 0) {
>> -		fprintf(stderr, "open() failed\n");
>> -		exit(1);
>> -	}
>>
>>  	/* 1. Map two pages */
>>  	mem = mmap(0, 2 * page_size, PROT_READ|PROT_WRITE, MAP_PRIVATE | MAP_ANON, -1, 0);
>> --
>> 2.54.0
>>
> 
> --
> Cheers, Lorenzo
> 

