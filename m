Received: from out30-111.freemail.mail.aliyun.com (out30-111.freemail.mail.aliyun.com [115.124.30.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDF14A32;
	Thu, 20 Aug 2026 03:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787197641; cv=none; b=m5vcck7+fQj8il2oCFQkUXnu5I1IxgkIqJyZB0w9VlS4gjqp5OK83mJ2Z9FdojH2FVTJ0zZhYFiCXgtvRqcs9+j4riCPrDK6iIAXi+Htho3o3RQ1slaRD2CGqbvuuHPj/2fvUbjWi1YBh6R013l5qr7xaq1+1RT8ML9DoOhxoDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787197641; c=relaxed/simple;
	bh=ak29XqEPumPmnZIsWkH5gs3FZoGglGtpR98b8ROA4Gc=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=KjsyZCQAviculaEazIv/kmFtIWUlPx4J5b2UO/BK5gbG2D6aWfYs0Xq3wZDOEvc6sYdf0/sLD7pBs8fpX1ix/EfBDlQs7HHjB27ooEqPSosGjY3ype+9eMndu27FtVB5kC7nSZIEAJjs8ITqFQ9X8wH9Qp6hNrmV/JeAHJJmKxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=mPYs5PT1; arc=none smtp.client-ip=115.124.30.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="mPYs5PT1"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1787197635; h=Message-ID:Date:MIME-Version:To:Subject:From:Content-Type;
	bh=ak29XqEPumPmnZIsWkH5gs3FZoGglGtpR98b8ROA4Gc=;
	b=mPYs5PT1l0zeHzsIvcwo0U6ABQKR/F2PcOSv0Cb9HTFNEQ0otUIZ1qFBiM08jEOTDn+zLQIkFXHxQBO9zaZHmUpfvrEbXL1ItUR/W/xz5TF1hbrTSRnj7yKXr2gK9pOmV/P1WftP9azTrbXwidZnyzlawHTzngE7bqQafWw64UU=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R731e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=xueshuai@linux.alibaba.com;NM=1;PH=DS;RN=31;SR=0;TI=SMTPD_---0X9IIIZZ_1787197632;
Received: from 30.246.161.92(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0X9IIIZZ_1787197632 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 20 Aug 2026 11:47:13 +0800
Message-ID: <0d2fc2ab-333e-42a1-88a1-6bb85538cbb0@linux.alibaba.com>
Date: Thu, 20 Aug 2026 11:47:11 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: kyle.meyer@hpe.com
Cc: Liam.Howlett@oracle.com, akpm@linux-foundation.org, bp@alien8.de,
 corbet@lwn.net, david@redhat.com, hannes@cmpxchg.org, jack@suse.cz,
 jane.chu@oracle.com, jiaqiyan@google.com, joel.granados@kernel.org,
 laoar.shao@gmail.com, linmiaohe@huawei.com, linux-acpi@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
 lorenzo.stoakes@oracle.com, mclapinski@google.com, mhocko@suse.com,
 nao.horiguchi@gmail.com, osalvador@suse.de, rafael.j.wysocki@intel.com,
 rppt@kernel.org, russ.anderson@hpe.com, shawn.fan@intel.com,
 shuah@kernel.org, surenb@google.com, tony.luck@intel.com, vbabka@suse.cz
References: <aMiu_Uku6Y5ZbuhM@hpe.com>
Subject: Re: [PATCH v2] mm/memory-failure: Support disabling soft offline for
 HugeTLB pages
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <aMiu_Uku6Y5ZbuhM@hpe.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Kyle,

Following up on this thread. The v2 patch once landed in akpm's mm
tree (9ae6eefa4b6b "mm/memory-failure: support disabling soft
offline for HugeTLB pages"), but that commit is now not reachable
from any branch, and mainline as of v7.3-rc1 still only has the 0/1
switch in /proc/sys/vm/enable_soft_offline.

The underlying issue discussed here is still unresolved for us:
firmware reporting per-rank corrected error thresholds via GHES
triggers soft offline of huge pages, which neither addresses the
failing rank nor is acceptable for workloads that rely on stable
hugetlb physical layouts.

Do you still plan to send a v3, e.g. with the disable-bitmask
layout Anshuman suggested upthread?

Thanks.
Shuai
