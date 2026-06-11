Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6943342538;
	Thu, 11 Jun 2026 11:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781178424; cv=none; b=upP/0UmsTWl8yafVyZqeCyKN0smM0JjOCfpMfrZJdg92Z02rHwjxQfL3Fl9X54twzWyQb1DyEZ1SHEO8zzQsm687lZZlx9YPd8+lrJBK8wVVVTsFnwB1yZaJ5oM1TzWf1yLVeWJrkc9jtR5hQrx/1fuKwGYOsuZGMkJNYI0FTuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781178424; c=relaxed/simple;
	bh=PHS9TFW+d52ZVhX5Cw2PY2DHNfri0ShsfOBNEuCxOf0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ia/pPg3vl3WNR/hoo6y4hjnJ9cxdUo79ziymryR28IvgIj0ecq+8dXm0QToDnWDNghSCbvkCYlOzwWpPv4rho4IEnU5OQz3q3W7OCFrB0lpWfyoYqbO/FMeFdF2C8ne2T9ufJ/9bNyv7EwNb1cwin7j6xkIiYE0LdcUGJ1ROPLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=gjDHZN3A; arc=none smtp.client-ip=115.124.30.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="gjDHZN3A"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1781178419; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=SkCGrWKzCfTn3xVMps93ytdggiT1d+I4EJDhk4sAvA4=;
	b=gjDHZN3AIEZw1wX8W/Si38LLwRytj84y9kN7wKQBDa1mLDOP4FVzZnuMMIRCz5TADXXsgTmu2lwg9ryH9jyxlrDvCNBvIFcsvyii2JJp7XHK6ZZePHFHOoOixyyP9+c3d01TbsocI0CKStmbLt//zTtM1eOmlTXFoTT2wvzjelo=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R411e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=15;SR=0;TI=SMTPD_---0X4dY2QC_1781178416;
Received: from 30.120.38.205(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X4dY2QC_1781178416 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 11 Jun 2026 19:46:57 +0800
Message-ID: <47f472ac-0b07-4ffa-a3d4-04fba621252f@linux.alibaba.com>
Date: Thu, 11 Jun 2026 19:46:55 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 00/11] add shmem mTHP collapse support
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: akpm@linux-foundation.org, david@kernel.org, hughd@google.com,
 willy@infradead.org, ziy@nvidia.com, liam@infradead.org, npache@redhat.com,
 ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
 lance.yang@linux.dev, linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1781083630.git.baolin.wang@linux.alibaba.com>
 <aipSe9Snx5x0esQx@lucifer>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <aipSe9Snx5x0esQx@lucifer>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Lorenzo,

On 6/11/26 2:18 PM, Lorenzo Stoakes wrote:
> On Wed, Jun 10, 2026 at 06:29:08PM +0800, Baolin Wang wrote:
>> (Note: this patchset is not targeting v7.2, but posted for early feedback.)
> 
> Hi Baolin,
> 
> Speaking broadly, and to repeat what I said to Nico - I'd like to
> re-emphasise my _strong_ desire for us to pay down technical debt in THP
> code before adding any further major features.
> 
> Really I'd have liked to see us do this _before_ khugepaged mTHP, but I
> didn't want to put Nico through more than he already endured with that
> series :)
> 
> So I'd really like to see some action on that before we embark on any
> further significant changes.
> 
> This is no comment on your changes, just something that we really need to
> address in THP generally.
> 
> Will try to give some detailed commentary on the actual changes when I have
> time also :)

I fully understand the current state of THP maintenance, which is why 
this is an RFC. I’m not expecting it to be merged into mainline quickly 
(but thanks to Lance for the comments).

Also, as Nico noted, it might be worth reviewing the mTHP collapse 
selftests in this series firstly? as they can help validate the 
anonymous mTHP collapse path for future changes.
