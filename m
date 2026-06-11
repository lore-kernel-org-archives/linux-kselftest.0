Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 408CC3E1209;
	Thu, 11 Jun 2026 11:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781177333; cv=none; b=Z6DoPwWp6AHuqNrPmlJYPdf3wBwzjmXAaAR2KFaD8QnPLmEd7CgZVt/gzB5IfLIPrXvW+rwvVmH+FhrZ/jpTIAnPK7Wr8xD0Wruuvt2S1A3ZS4FO1LoIPFYc6DdEZbQ6a1NZGgzyhDKglU/bnckEIwRjBwrjIqp1OU7XdibQJyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781177333; c=relaxed/simple;
	bh=fDfCQJhcd09WYJANwFXRSGh4CZ6yAMijmlQan7cE+uA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pDXwyfCXOVSQO+0skxwvbQHaG/GH9IftMc2TqckwyLLasSMzGiEDdvLxRhBRDMJU+YmTX8J46Ej0hWB8hSA2oKdkC5OpSZMQsX+o4nMwo7VTnaltIfh53PqiO8fPH4eDU40LPPs+EWe4dPDhQjrqZ62jryf71lF6IvOTc7J05Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=bHjGb2ot; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="bHjGb2ot"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 967E41E2F;
	Thu, 11 Jun 2026 04:28:43 -0700 (PDT)
Received: from [10.164.19.15] (unknown [10.164.19.15])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7C7B13F99C;
	Thu, 11 Jun 2026 04:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781177328; bh=fDfCQJhcd09WYJANwFXRSGh4CZ6yAMijmlQan7cE+uA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bHjGb2otGj8sHCXHA+REFVDEOzYnKhmAI5WIOTMF8IpIMBEg+oEHergt2V6NO2f45
	 d58PoItW0n3OB+mLvrQWvM7+7ob2xpfkyLXlPL3yO8bfEzjfBUrPQlFyjZuo6PJaCV
	 Ymyyg4JfhH+bvIM6ayEiyn0uR2gVd4bTJzy27ayQ=
Message-ID: <9f6ece0a-659d-4bbc-a61d-f70826026cf1@arm.com>
Date: Thu, 11 Jun 2026 16:58:40 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: mm: fix and speedup "droppable" test
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Anthony Yznaga <anthony.yznaga@oracle.com>, Mark Brown <broonie@kernel.org>,
 Sarthak Sharma <sarthak.sharma@arm.com>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, Aishwarya TCV <Aishwarya.TCV@arm.com>
References: <20260611-droppable_test-v1-1-b6a73d99f658@kernel.org>
 <bd9d1353-3053-4665-8f35-ae3f6e379237@arm.com>
 <bc29b740-8f1c-4e2b-9b01-c8c4a4183b3a@kernel.org>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <bc29b740-8f1c-4e2b-9b01-c8c4a4183b3a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/06/26 4:56 pm, David Hildenbrand (Arm) wrote:
>>> +		/*
>>> +		 * Speculative reference can temporarily prevent some
>>> +		 * pages from getting dropped. So sleep and retry.
>>> +		 *
>>> +		 * If a page is not droppable for 10s, something
>>> +		 * is seriously messed up and we want to fail.
>>> +		 */
>>> +		if (dropped)
>>> +			break;
>>> +		sleep(1);
>>>  	}
>>> -	kill(child, SIGTERM);
>>>  
>>> -	ksft_test_result_pass("MAP_DROPPABLE: PASS\n");
>>> -	exit(KSFT_PASS);
>>> +	ksft_test_result(dropped, "madvise(MADV_PAGEOUT) behavior\n");
>>
>> You meant "MAP_DROPPABLE" behaviour? Perhaps that can be folded in.
> 
> No, I did mean "madvise(MADV_PAGEOUT)" behaves as expected with droppable pages.
> 
> Reasoning being that we might want to add some other tests in the future that
> trigger reclaim differently.

Makes sense.


> 
> Thanks!
> 

