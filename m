Received: from out30-111.freemail.mail.aliyun.com (out30-111.freemail.mail.aliyun.com [115.124.30.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85833375C3;
	Wed,  5 Aug 2026 05:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785906511; cv=none; b=pwLr4w6n6Gw85OcGo9cHW/mxhK+Ci+6jOzzG/9a2RmX58M8W7YW5rvos33qaMR6urgKn3TZmtViNaWMMx2Cmn1rp5x5YrVbo4iEOmQje+rBBnZnk9WGWq8euCxtimhNilmm1uxCGZwoTreknIDeDmPsx/PUq5BI6Oy5UZC1wnhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785906511; c=relaxed/simple;
	bh=XcU9PIbdgzdRulDGuVYl2hjkRP5PIVeHN5ZqKs9ALhY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fp6zYNd6mlGjaHymO8KN4rgcqn2yGUT0muK2HH9qgx8Dg258BMpp6pSfeangob5hYi8wvDQc3er5WtQXJ70qCON++z5zNLEZWV/97DsbR2X2btGNt8Qlfz/VNKh72pwr1qOozckd1qaWTgpSQVdEr7nLXWPAIH2hdXDXCCz+geE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=U1HXHnDK; arc=none smtp.client-ip=115.124.30.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="U1HXHnDK"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1785906500; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=ZfmGVJYDjHG8Bx3n3lJMYrb3YO2SUPHgSw85tuZPRNY=;
	b=U1HXHnDKBHkbXpp76njzI3OtR7UTN8eKV6Lw/lZDrFTH9U1Uz3/mi6IB1k6ls7LX5T2tljX2n8XigWqoVoeHQZZzjmgArNHxuxxpK91vjH5TgyJYGVpUNiGVIjjSUv2WyLknASO1O2Eq2glZZQKKuC3uEmV95z64AV+dtzvfAVo=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---0X8Q7OyQ_1785906498;
Received: from 30.74.144.139(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X8Q7OyQ_1785906498 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 05 Aug 2026 13:08:19 +0800
Message-ID: <dea2b5f8-7dd5-4b16-80c7-eee646a1c16a@linux.alibaba.com>
Date: Wed, 5 Aug 2026 13:08:18 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] add anon mTHP collapse test cases
To: "Nico Pache (Red Hat)" <nico.pache@linux.dev>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 ziy@nvidia.com, liam@infradead.org, dev.jain@arm.com, ryan.roberts@arm.com,
 baohua@kernel.org, lance.yang@linux.dev, usama.arif@linux.dev,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1785564857.git.baolin.wang@linux.alibaba.com>
 <178587592371.79283.16750931617435580186.b4-review@b4>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <178587592371.79283.16750931617435580186.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/5/26 4:38 AM, Nico Pache (Red Hat) wrote:
>> This patchset is split from the previous shmem mTHP collapse patchset[1],
>> which only adds anon mTHP collapse selftests. All khugepaged test cases
>> can pass.
> 
> Thank you for sending this out :) I played around with it and it seems
> to be working. This lays good groundwork to expand khugepaged mTHP testing
> in the future too.
> 
> Tested-by: Nico Pache (Red Hat) <nico.pache@linux.dev>

Thanks Nico :)

