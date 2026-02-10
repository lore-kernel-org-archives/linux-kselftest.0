Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015DB309F1D
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Feb 2026 18:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770747331; cv=none; b=lCuZmKLacDVkoklul2zFx0a0b1FcfPRKJCyOrXry1nbbN52swOTwB/4nFeUUZ1KYkytsj47bj8smXtkChnAe9ppvxjy5BdYeg8knSJFDyfCDTs0U3o3XO+CC1FJqqEpLli7AYendfjtOBRtIfJPBDuS9jVsKDikEizzMlEc2QHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770747331; c=relaxed/simple;
	bh=KjrRTfYfg1h+OAqEk/PCKo0cFoOaXI3SIh01p7aZ+cg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oYvqK9/iwTA/24L7056PE0u9NF9rGo04CTiF8jd5KTZFRWznKx26Rxi3TejVlM7l2OUaFSaoC04yz4XBEXgMYzqNVRHyAyvjxB3FCuGXM/o+sv+eSWhscC0Y93RcBDxUO9pZOIcP2t8a6x8OCHW7WYY+XaV6HMj5cLyFcqr4gZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <51f77faa-5d8b-4e8b-8cfd-04ae06726864@linux.dev>
Date: Tue, 10 Feb 2026 10:15:07 -0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] selftests/liveupdate: Cleanup kernel optio
 CONFIG_LIVEUPDATE_TEST
To: Pratyush Yadav <pratyush@kernel.org>
Cc: pasha.tatashin@soleen.com, rppt@kernel.org, shuah@kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20260130042840.1469-1-yanjun.zhu@linux.dev>
 <9da09064-5005-4b30-8f9b-9ac9b9858d46@linux.dev>
 <2vxz4inou3da.fsf@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Yanjun.Zhu" <yanjun.zhu@linux.dev>
In-Reply-To: <2vxz4inou3da.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On 2/10/26 5:36 AM, Pratyush Yadav wrote:
> On Thu, Jan 29 2026, Zhu Yanjun wrote:
>
>> 在 2026/1/29 20:28, Zhu Yanjun 写道:
>>> The kernel option CONFIG_LIVEUPDATE_TEST does not exist currently.
>>> Remove it.
>> In kernel 6.19-rc7, this kernel option still exists in the file
>>
>> tools/testing/selftests/liveupdate/config. Thus I send out this commit to remove
>> it.
> Yes, but the patch to add the config is in mm-nonmm-unstable. I am not
> sure if this worth the churn of removing this and re-adding it when that
> patch lands later. Do you see a real problem with this?
Thanks for the feedback.

I understand that the patch adding this functionality is currently in 
mm-nonmm-unstable. My concern was primarily adhering to the 
documentation, which suggests keeping the kernel configs pruned of 
unused options to avoid confusion for those running selftests.

However, I see your point regarding the churn. If you prefer, we can 
wait until the mm-nonmm-unstable branch is merged into the mainline. 
Once that happens, if this option remains truly redundant or if the 
implementation changes, I can resubmit the cleanup then.

Does that sound like a reasonable compromise to you?

Best regards,

Yanjun.Zhu

>
> [...]
>
