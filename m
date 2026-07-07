Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783403FA5F1
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Jul 2026 12:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783426503; cv=none; b=Dbx6JxMg/wnobDv4bmcBFWAIuch79kTTDqRQ1UtyJphwMlCCB47qH09uu4UL0lGLpCSx28KT1pSDv8e1/e6e1D0LbxQXJWEiWI6EyfPXbom2guDekt+i3w2ACIGL4W6FS9MF7ymulHleBavv1P2chA8BsaieS0QKwAFIBt0C8JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783426503; c=relaxed/simple;
	bh=3cjWbNIgBqzzm+7BOCwVMDV607Ssj02e8SUOegbBowI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RDDP8hgozbxsaD3imF4B5mDYXIFpgs886FKb36Npf3RfZt6cmIySWlXhXL773eh5xZ5eZnaOynYz/ZJ2JLwRG69/vNr+1/ctqsi1ySGiAuiSzJaMEXRzIla0o07q6vH9IbYdhrNTzphkm/rHBEmPPc5Cny4Sb+lXpscw9er2JXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dnZX8NVS; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="dnZX8NVS"
Message-ID: <7d955bb1-9abd-4ba7-b1a6-a19f999cfa27@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783426489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YAAXy536t9SekqRYGrtDkUhq1/DKNIxZvKhhwo2mLyw=;
	b=dnZX8NVSJ1gWNjwt2iG1RLuceDp2+oztQwYUY4lB/jOrhLw3Yjhyh2vVwsGgLT3sFTLOhY
	z1RAbF46D9HGS9l4eayKo4Gzp9PWmOkCYppkyvGH3Wbbp2oJ0LpI4m90A1osALOFeDV2w+
	SPZJl0PCl0Udo5g3ebVcfieXSV560vM=
Date: Tue, 7 Jul 2026 20:14:30 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: cgroup/test_zswap failed with "zswpout does not increase after
 test program"
To: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>
Cc: linux-mm@kvack.org, cgroups@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 hannes@cmpxchg.org, yosry@kernel.org, nphamcs@gmail.com,
 chengming.zhou@linux.dev, tj@kernel.org, Shuah Khan <shuah@kernel.org>,
 mhocko@kernel.org, Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>, Li Wang <li.wang@linux.dev>
References: <c0970cee-42c2-4844-b88e-229853f08e90@linux.dev>
 <akzpi93tZry0cCCe@localhost.localdomain>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <akzpi93tZry0cCCe@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi Michal,

On 7/7/26 8:01 PM, Michal Koutný wrote:
> Hello Zenghui.
> 
> On Tue, Jul 07, 2026 at 05:38:13PM +0800, Zenghui Yu <zenghui.yu@linux.dev> wrote:
> > Hi,
> >
> > Running cgroup/test_zswap on my arm64 box failed immediately with:
> >
> >   [root@localhost cgroup]# ./test_zswap 
> >   TAP version 13
> >   1..8
> >   # zswpout does not increase after test program
> >   not ok 1 test_zswap_usage
> >   [...]
> 
> What version of the tests do you run?
> Namely, does it have the recent patches from Li [1]?

I use today's mm-new [*]

> 
> [1] 83476cc97bc63 ("Merge tag 'cgroup-for-7.2' of git://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup") v7.2-rc1~136

... so it should already be included.

[*] https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/log/?h=mm-new

Thanks,
Zenghui
