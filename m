Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5C4DF76;
	Thu, 16 Jul 2026 11:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784200849; cv=none; b=N9nGxquIhKQfHQmAiWaxXWAn1Qb0tn4lxj/1KPLK2Z1OdDJD8ra1ZdItV5Mz9UmGgjPCXtEtIpyK04pUE8VkwOhPr2+p0351uAXlReSRpxOR0aK+THHrS9Jz2yWAByDc1vsoaaeNZI5+6+BCA4zygOLjTpTja/RYKdBO5DoXpGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784200849; c=relaxed/simple;
	bh=QK7N3/wsTvX1kN/spYWC/FGRFpFg0+xkagkwjKwI3yo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aM+/1IoMEA6Y2909aD2eGNTqwn3IMnJo9OATtcQjyjNcoX1hQfZEzP5cmUeC29avMw+ttIYCCWy3lE/QXKhzxJO0U0Cz+vBCpBmZdjv35zbNgaVn5TtLiA/Np7rz3olAEaScXJR946/6wNcBnvcSkFm57/65VHIP9OylPGGSltI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ULJ8jTJL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ULJ8jTJL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E22731F00A3A;
	Thu, 16 Jul 2026 11:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784200848;
	bh=iohMITS/mr9qDiRkI+rGRUr759u+rXGlGlDEwpj+fhU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ULJ8jTJL674cLd5oJIqYzCX17btEY5HF91TfblR8ew2LU3w2GS1H8qpYVf+Ss+vYa
	 A4kPjTsJPQcIq0ZhsQvwyxrUv1aoJE2X/5vZv4WNyPyDYs7quFjED/Aaw8NFKpB2TT
	 7MWIIwG0eLp2UyYHic9Ix8F3s2XnZlUGX1584c/xpCOlkdUEeooD4LRHnoOQU6DLxR
	 9pp7/6d6UvA8aaNkL8MqGEA9g+Tncqanp9i97hDdqwCABUrTWW/23hhjFLIW5uUbxT
	 lAFu++ONA29JTBj6BAUInoCpeJa5B+uqqSiGLXUbRmmvbU62WXI6+bIAyzWPP59ka8
	 J/5pwZXkY5Ofg==
Message-ID: <0c278b69-3ecd-4ec3-b418-dea84e043732@kernel.org>
Date: Thu, 16 Jul 2026 13:20:45 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/mm: khugepaged: skip swap tests when swap is
 unavailable
To: Dev Jain <dev.jain@arm.com>, Jaeyeon Lee <jaeyeon.lee.dev@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260715133418.170386-1-jaeyeon.lee.dev@gmail.com>
 <4b6904b5-81f9-4e27-8ac5-5bd7e7174c5d@kernel.org>
 <6c474ce7-8f1d-4e85-8587-8a60983cec03@arm.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <6c474ce7-8f1d-4e85-8587-8a60983cec03@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/15/26 16:47, Dev Jain wrote:
> 
> 
> On 15/07/26 7:39 pm, David Hildenbrand (Arm) wrote:
>> On 7/15/26 15:34, Jaeyeon Lee wrote:
>>> The collapse_swapin_single_pte and collapse_max_ptes_swap tests use
>>> MADV_PAGEOUT to swap out pages before verifying khugepaged collapse
>>> behavior. On systems without swap configured, MADV_PAGEOUT succeeds
>>> but the pages are not actually swapped out, so check_swap() returns
>>> false and the tests report a failure.
>>>
>>> These tests cannot run meaningfully without swap, so a missing swap
>>> area is an environment limitation rather than a test failure. Detect
>>> the absence of swap via /proc/swaps and skip the affected tests
>>> instead of failing them.
>>>
>>> Signed-off-by: Jaeyeon Lee <jaeyeon.lee.dev@gmail.com>
>>> ---
>>>  tools/testing/selftests/mm/khugepaged.c | 25 +++++++++++++++++++++++++
>>>  1 file changed, 25 insertions(+)
>>>
>>> diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
>>> index 10e8dedcb087..f9b4ebe733ce 100644
>>> --- a/tools/testing/selftests/mm/khugepaged.c
>>> +++ b/tools/testing/selftests/mm/khugepaged.c
>>> @@ -100,6 +100,22 @@ static void skip(const char *msg)
>>>  	exit_status = KSFT_SKIP;
>>>  }
>>>  
>>> +static bool swap_available(void)
>>> +{
>>> +	char buf[256];
>>> +	bool ret;
>>> +	FILE *fp = fopen("/proc/swaps", "r");
>>> +
>>> +	if (!fp)
>>> +		return false;
>>> +
>>> +	fgets(buf, sizeof(buf), fp);
>>> +	ret = !!fgets(buf, sizeof(buf), fp);
>>> +
>>> +	fclose(fp);
>>> +	return ret;
>>> +}
>>> +
>>
>> That doesn't mean that swapout will succeed.
>>
>> Take a look at cow.c where we use pagemap_is_swapped() after MADV_PAGEOUT.
> 
> That suffers from the reverse problem - in case of a real swap bug, cow.c
> will skip the test and anyone running the test won't bother.

Yes, because there could be other reasons why MADV_PAGEOUT would not be
successful (speculative page references, out of swap space).

> 
> I think this patch idea is reasonable, we need a way to say "swap definitely
> won't succeed because there is no swap device, so skip" vs "swap failed,
> need to dig in!" .

I would not pack a "let's test if swapping in the system even works" into a
khugeapged test.

I think we can reasonably assume here "swap subsystem is not completely broken".

And if we want to check for that, have a separate test that stresses swapping,
if available.

-- 
Cheers,

David
