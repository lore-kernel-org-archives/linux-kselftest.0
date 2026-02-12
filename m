Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCB419EED3;
	Thu, 12 Feb 2026 01:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770859149; cv=none; b=sT49B1OTRvNYrA+7bAWncjTZkeX4mJYtuDdOCaLd5+MaVRvFWtoSzCKKUx/q4hiSEVo4kkeZA31sF2g1qgt0bTxoVh3T55r5eEw2OSUc6vxbDmOSlipzcBRQ0bKr7uONhxkGOLItDa1EQdTXcVyphGDeepu3AE6tyULgAhxtdHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770859149; c=relaxed/simple;
	bh=4wmZrmzDXCIAFkImkDmdI/Yy4jRNxiRx0B57D9Bk9lM=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=J9PuunfqOHXMzajswma06bTydWQ4mI2QhIwRv/Y5ZTStI3fCNtemzZiqt054KDCKR93lwJYmuBlYB9er8lQGfbPY10CyBq7PiUcZB9oy3BWyZqm2IiFh+342dXtDqNl3tGiwxO2t4U+gTYb6VN2uhvalMFPFGgefzMXm/lTEwMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=XXMDf+/y; arc=none smtp.client-ip=113.46.200.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="XXMDf+/y"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=IANkVLxJq7lH+TLeyGbC0FUJVX2z6v+14F3M3zDhSss=;
	b=XXMDf+/yMPSuUxdF6WJwU7Wu9QyXLhi+wBsA9F4alN6EFM2zLPcKbkNl6bFrvyEC7FJ+fcOtu
	z23HX7Q53vOEbCiKybQ9//31FDh2fTYeU5XqNTmjhYxCB71V2d0MjNqDUGue41Xq16ToNPoCQko
	Ns9J67q/6cj0c3YUufv8Wsk=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4fBHQ53bp7zcb0H;
	Thu, 12 Feb 2026 09:14:21 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 0534D4056B;
	Thu, 12 Feb 2026 09:18:58 +0800 (CST)
Received: from kwepemq500010.china.huawei.com (7.202.194.235) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 12 Feb 2026 09:18:57 +0800
Received: from [10.173.125.37] (10.173.125.37) by
 kwepemq500010.china.huawei.com (7.202.194.235) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 12 Feb 2026 09:18:56 +0800
Subject: Re: [PATCH] selftests/mm: Remove duplicate include of unistd.h
To: Chen Ni <nichen@iscas.ac.cn>
CC: <nao.horiguchi@gmail.com>, <david@kernel.org>,
	<lorenzo.stoakes@oracle.com>, <Liam.Howlett@oracle.com>, <vbabka@suse.cz>,
	<rppt@kernel.org>, <surenb@google.com>, <mhocko@suse.com>,
	<linux-mm@kvack.org>, <linux-kselftest@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <akpm@linux-foundation.org>,
	<shuah@kernel.org>
References: <20260211064311.2981726-1-nichen@iscas.ac.cn>
From: Miaohe Lin <linmiaohe@huawei.com>
Message-ID: <adba2471-81ff-6978-598a-a436c4af88da@huawei.com>
Date: Thu, 12 Feb 2026 09:18:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260211064311.2981726-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemq500010.china.huawei.com (7.202.194.235)

On 2026/2/11 14:43, Chen Ni wrote:
> Remove duplicate inclusion of unistd.h in memory-failure.c to clean up
> redundant code.
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Oh, I missed that. Thanks.

Acked-by: Miaohe Lin <linmiaohe@huawei.com>

Thanks.
.
