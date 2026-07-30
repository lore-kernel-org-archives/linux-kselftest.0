Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B1536C5A1;
	Thu, 30 Jul 2026 02:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785379430; cv=none; b=P5Cq4U2ElnrnrcdnhPJMNOoNS38Bh2PvtHRWgLCm55HP02vZzID1m5Z4Cw816ls3wzKwLx07QtWjZPVV+rKLcTIlJUWLveCWkhIyfPtTExNM3Iq6x45jZa6liSP45H6z57rzqfPGUuqfBeHeP01kERXVc6b37gK0U2LB+3/aI4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785379430; c=relaxed/simple;
	bh=tvL1GGuiXyaGJu5Kv+BgrMIn24K2NDoiYXeSFkpQfiI=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=ZWX/psLLn7H4M7QXvgQFxKZx9wFFtNeJdSfxf6ZANfs/93QqpA8HthWq2OYybLeOiy2LDbK/WCCFN36OYYJjcwzUviMPnDQXZ0mdN47D8tyEZr5FGDSUVXDKJXXsf/BcJTTFHNrXqCxqristYlso0gM9PiakPWF4U3BEubvqgYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=VMZ46RqI; arc=none smtp.client-ip=113.46.200.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="VMZ46RqI"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=/mxo84jFtDmlVPzlZM55LKGbQvKfWkJO0S8IHkeqn7c=;
	b=VMZ46RqIq9OSd+MAcy0wUr504ndiZCamN9htiAl5ocn9npPx3vu+DhN/995QNmnJiZEqW4d+T
	uuI4RF/wqepMcoz+9rB+hpfl/O7c+UWyllcue4rXZnjpcOXEIzQzJvh7Wyti+lu3Y8nKHRuIGWE
	G40Gvhih4ds03O2iuvGo5qk=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4h9YDZ2ZCJz1prLg;
	Thu, 30 Jul 2026 10:34:06 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id D7D322025F;
	Thu, 30 Jul 2026 10:43:35 +0800 (CST)
Received: from kwepemq500010.china.huawei.com (7.202.194.235) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 30 Jul 2026 10:43:35 +0800
Received: from [10.173.124.160] (10.173.124.160) by
 kwepemq500010.china.huawei.com (7.202.194.235) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 30 Jul 2026 10:43:34 +0800
Subject: Re: [PATCH v2] selftests/mm: unpoison pages in memory-failure
 teardown
To: Muhammad Usama Anjum <usama.anjum@arm.com>
CC: <linux-mm@kvack.org>, <linux-kselftest@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Naoya Horiguchi <nao.horiguchi@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand
	<david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett"
	<liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport
	<rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko
	<mhocko@suse.com>, Shuah Khan <shuah@kernel.org>
References: <20260729091127.1001179-1-usama.anjum@arm.com>
From: Miaohe Lin <linmiaohe@huawei.com>
Message-ID: <43cca64a-60fb-ef51-2ec9-a73205168fab@huawei.com>
Date: Thu, 30 Jul 2026 10:43:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260729091127.1001179-1-usama.anjum@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemq500010.china.huawei.com (7.202.194.235)

On 2026/7/29 17:11, Muhammad Usama Anjum wrote:
> The memory-failure tests call cleanup() only after all result checks.
> A failed ASSERT_* invokes fixture teardown and aborts the test, so it
> skips cleanup() and leaves the injected page hardware-poisoned.
> 
> Invoke cleanup() from FIXTURE_TEARDOWN() instead. Guard it with
> self->injection_attempted so tests that exit before injection do not try
> to unpoison a page when no injection was attempted. Injection can poison
> a page before returning an error or delivering SIGBUS, so teardown must
> clean up after every injection attempt. This runs the existing HWPoison
> and HardwareCorrupted checks on both normal and assertion-failure paths.
> 
> Fixes: ff4ef2fbd101 ("selftests/mm: add memory failure anonymous page test")
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>

Acked-by: Miaohe Lin <linmiaohe@huawei.com>

Thanks.
.
