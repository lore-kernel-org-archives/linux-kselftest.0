Received: from canpmsgout10.his.huawei.com (canpmsgout10.his.huawei.com [113.46.200.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC74E155326;
	Mon,  9 Mar 2026 03:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773025763; cv=none; b=OCU5E/mKc29/u2Jlxw1jgMa4y8T3YDoCiGgAJG89FensU7jAy0Sg4D/4YbpZJfGM/svcofbpLo2ZohUOZj9dXVIE587DqHYPkLpGhzd0TKBih1YCVSTW3iOQ5fJr21A7icx98fOUbAMBO0Y5RcNQIRk4JXswY4efwvPXOAm94uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773025763; c=relaxed/simple;
	bh=Q2Nz1BcH9RRBF4iLhizJsfmvc3qmnQkniODIUYFP/lw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Nt6/IiSzs9nNVtYYWrhtHMlHkwFSuk8xmTOkzlgGRIb+od3/CxNc1ecOB18qP0ZHe1ZjI5+R2eYYy4Xlg7MU5539tBI/A4oVTgi7tN64Amlg1y7T6l/oHlYHEEz1ioXSCvQ0ZjmYZph8yunCtYk+uYX/EG3oRwUe4cZ2E8oJIwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=FpqhkGeb; arc=none smtp.client-ip=113.46.200.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="FpqhkGeb"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=hYBQRZKTwAHpVXpWwCMVZ60fQaeOHonHGB4Ho9yspok=;
	b=FpqhkGebl6Ta9ZzWHJ1Ut0a29QzU7GMLIqi7Aev4zKx+kn6q2fuTcJCnmj+t5GAeO+DwcY9sX
	Ye7uTe8vtbhv1FjZQWSFCNK0PzXtcwSvVapJmWHchWG7awX/1TWzUkK5vks534l6Inv4iSeu8zm
	eYtjdEMDNZ8p5Ikd3eR/9A8=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4fThgS4c1Sz1K984;
	Mon,  9 Mar 2026 11:04:20 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 3C81140363;
	Mon,  9 Mar 2026 11:09:12 +0800 (CST)
Received: from [10.67.120.222] (10.67.120.222) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 9 Mar 2026 11:09:11 +0800
Message-ID: <c52f984c-9df8-4eb7-967c-33a605740e84@huawei.com>
Date: Mon, 9 Mar 2026 11:09:10 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC patch 0/9] Add support for HiSilicon platforms and refactor
To: Jonathan Cameron <jonathan.cameron@huawei.com>
CC: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <shuah@kernel.org>,
	<tan.shaopeng@fujitsu.com>, <fenghuay@nvidia.com>, <ben.horgan@arm.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kselftest@vger.kernel.org>, <linuxarm@huawei.com>,
	<xiaqinxin@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <xuwei5@huawei.com>, <fanghao11@huawei.com>,
	<wangzhou1@hisilicon.com>
References: <20260304040334.765860-1-wuyifan50@huawei.com>
 <20260306104510.0000437b@huawei.com>
From: wuyifan <wuyifan50@huawei.com>
In-Reply-To: <20260306104510.0000437b@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk500005.china.huawei.com (7.202.194.90)

Hi Jonathan,

On 3/6/2026 6:45 PM, Jonathan Cameron wrote:
> On Wed, 4 Mar 2026 12:03:25 +0800
> Yifan Wu<wuyifan50@huawei.com> wrote:
>
> For v2 onwards Make sure the cover letter title includes
> selftests/resctl as with the patches.
> People use that title to decide if they want to open the thread
> so it may be all they ever see.
Thanks for the suggestion. I will fix and resend it. Looking forward to 
your review and comments.

Regards,
Yifan Wu
