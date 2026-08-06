Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D4F2E6CC0;
	Thu,  6 Aug 2026 01:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785979206; cv=none; b=Mgj5BpiYqRg3f59CUKGnOnFzVVcpaJLmS1+7aGNLdvXjk3dBYBYUorD0VmJxR0uGsQ6dCuRXGpuVU9kP1TE/B+pfmCbv2DOuBVf5EtlKIqXEjd3rfnov96UrQvXvOoPugqABJfIELW2b01q2w6XC6wA873S9TUpG1IXd6fTR3Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785979206; c=relaxed/simple;
	bh=soqiB0QHcL4iHEW+gCT54MJCb+hDP9dlSmk8zsfpAu0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s+hyRlBE8kObvC55QlgNmjR9dAA4LPJurRD2qp2VFU2U5pyTedPLqf5dkdZx3w3/Ut9uBvAqnGt9VpvaOnmrEbMY3DnZD5zRkHnAnSJBwWL52v2k9w5lQiMd0Luv1PyiXEsEavgivtq/wZrZAsx3ZOFltwPb7ZPia5j6IzrPDCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=EFycoMjV; arc=none smtp.client-ip=115.124.30.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="EFycoMjV"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1785979200; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=A/+nTc6O0WG0Y1/xvBADeCeFrKXhbylrN/hsqGlgwtA=;
	b=EFycoMjVPEzLImI9+y5IhieR6xTHIQEPk5oWvtiP27inBBbRK9lF/w827/q8QaShUxG65SwMGa0eJKFRDWKkaqLyb8ERAETBsAKv4kz8YHpbFZ8DGn+KG0+6WZWK6BSHCp0t9KAEuoek01UVz2YgcTrXClH8m3aQB7QgEPGi+Vo=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=15;SR=0;TI=SMTPD_---0X8SKf9F_1785979198;
Received: from 30.74.144.136(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X8SKf9F_1785979198 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 06 Aug 2026 09:19:59 +0800
Message-ID: <63d185fc-9bd0-4142-b6ef-c8f8cc401e06@linux.alibaba.com>
Date: Thu, 6 Aug 2026 09:19:58 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] add anon mTHP collapse test cases
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 ziy@nvidia.com, liam@infradead.org, nico.pache@linux.dev, dev.jain@arm.com,
 ryan.roberts@arm.com, baohua@kernel.org, lance.yang@linux.dev,
 usama.arif@linux.dev, linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1785564857.git.baolin.wang@linux.alibaba.com>
 <anNTCO-mMa_y0AvA@thinkstation>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <anNTCO-mMa_y0AvA@thinkstation>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/5/26 11:14 PM, Kiryl Shutsemau wrote:
> On Sat, Aug 01, 2026 at 02:26:34PM +0800, Baolin Wang wrote:
>> This patchset is split from the previous shmem mTHP collapse patchset[1],
>> which only adds anon mTHP collapse selftests. All khugepaged test cases
>> can pass.
> 
> The patchset looks good to me:
> 
> Acked-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

Thanks Kiryl.

