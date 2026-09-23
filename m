Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FAE5304DF;
	Wed, 23 Sep 2026 14:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790172093; cv=none; b=JcU5jAlWRH9+zBAM/yxaqsZvIngS2tumpJ9Rr8R9tPPZJLfZ+6OkZnuJdix5BNL6DXN1jw2Cy3c6x+iE4WM7QnwOKuXeiwE5DEzBk5OrHFMB+PeL/5P2uuf9G1s7TEc8Xf9riUWVCiTUsq00WxDx2tRghr4KmHeVi2XAno/ucfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790172093; c=relaxed/simple;
	bh=uyfYt5iXk6DfLBMCfVu0aK1O4kBgsZ2FRdLslFLg73I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b6ITE49BPZ5Xnfye0IVOR2Dfg+2acoVhiErghOIsPljjxT2sDwVa3LGYxnBBe9KNNLzya2JBbeA2UHGe4kxFqshVyyBfyV1YNhxqdSkCF28geRCER/NfUypMpxcriNiaJz1+btDlU631U6EhC4o4Rsm1XUVFlyb9dIvJ5kdx3mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hHlZr6Uu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hHlZr6Uu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F9841F000FF;
	Wed, 23 Sep 2026 14:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790172092;
	bh=PC3Za8iCgsJ8W6QmugoGUlZXLsysH1qJQuMBo3/+gew=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=hHlZr6UuVw7UelysAGbw5mSYPwWTMdGw37gZc3d2NyH+4d9MxpidkuqVlSaUoqO+U
	 JYoInOedh76KNB7+IC+SqJJDcHfLIU9bjLiQpBOOrTHI5W6BzVKCPPp3XFfRy/nq8l
	 1royZje/hxJC7hRPD94k3qbotq8whotW6PjfNj4UDwNIanavDnkzBaSz8JjfP3kUbY
	 ZIvq61RvSRKfDbBgqXtk/xs/Nzr4xdqutTOna1byzk56OIuLokhgP4HoldZDX+8IF6
	 MxJmQSe8F/tTVkB/bKqxebaObXz+dgQggNd83Yr7LYJvIpVRTFmjxCJ18ONpeiu7kH
	 8vyyJOF6yXr5g==
Message-ID: <a4dcb274-3ea6-4f5c-be57-65b089967ae9@kernel.org>
Date: Wed, 23 Sep 2026 16:01:24 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] selftests/mm: init page sizes early in
 pagemap_ioctl test
To: Zenghui Yu <zenghui.yu@linux.dev>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, akpm@linux-foundation.org, ljs@kernel.org,
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, shuah@kernel.org, gourry@gourry.net
References: <20260908134117.84405-1-zenghui.yu@linux.dev>
 <20260908134405.84448-1-zenghui.yu@linux.dev>
 <b1f2a146-1a61-42bd-98c5-fc4380b6ae49@kernel.org>
 <fa0bdb5c-3903-44bf-8d14-91d77e32b201@linux.dev>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <fa0bdb5c-3903-44bf-8d14-91d77e32b201@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/18/26 08:59, Zenghui Yu wrote:
> Hi David,
> 
> On 9/16/26 11:30 PM, David Hildenbrand (Arm) wrote:
>> On 9/8/26 15:44, Zenghui Yu wrote:
>>> From: "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>
>>>
>>> Initialize page_size and hpage_size before calling init_uffd(),
>>> hugetlb_setup_default(), etc.  That won't fix anything, but it is safer and
>>> saner to get these globals set up before doing other things.
>>>
>>> While at it, drop the page_size parameter of transact_test(), which is
>>> actually unnecessary.
>>>
>>> Suggested-by: Andrew Morton <akpm@linux-foundation.org>
>>> Signed-off-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>
>>> ---
>>>  tools/testing/selftests/mm/pagemap_ioctl.c | 10 +++++-----
>>>  1 file changed, 5 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/tools/testing/selftests/mm/pagemap_ioctl.c b/tools/testing/selftests/mm/pagemap_ioctl.c
>>> index 1a87b7483316..d9a4fb782ecf 100644
>>> --- a/tools/testing/selftests/mm/pagemap_ioctl.c
>>> +++ b/tools/testing/selftests/mm/pagemap_ioctl.c
>>> @@ -1489,7 +1489,7 @@ static void *thread_proc(void *mem)
>>>  	return NULL;
>>>  }
>>>  
>>> -static void transact_test(int page_size)
>>> +static void transact_test(void)
>>>  {
>>>  	unsigned int i, count, extra_pages;
>>>  	unsigned int c;
>>> @@ -1653,6 +1653,9 @@ int main(int __attribute__((unused)) argc, char *argv[])
>>>  
>>>  	ksft_print_header();
>>>  
>>> +	page_size = getpagesize();
>>> +	hpage_size = read_pmd_pagesize();
>>> +
>>>  	if (init_uffd())
>>>  		ksft_exit_skip("Failed to initialize userfaultfd\n");
>>>  
>>> @@ -1661,9 +1664,6 @@ int main(int __attribute__((unused)) argc, char *argv[])
>>>  
>>>  	ksft_set_plan(119);
>>>  
>>> -	page_size = getpagesize();
>>> -	hpage_size = read_pmd_pagesize();
>>> -
>> We have some other code rework that part, so I expect some conflicts for whoever
>> goes in first.
>>
>> Why not
>>
>> initialize them right when defining the variables, marking them const?
> 
> I'm afraid I don't quite understand your suggestion.  page_size and
> hpage_size are static global variables which cannot be initialized at their
> definition.  What am I missing?

I was assuming they are variables in the function, please ignore :)

-- 
Cheers,

David
