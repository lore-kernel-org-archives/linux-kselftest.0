Received: from canpmsgout11.his.huawei.com (canpmsgout11.his.huawei.com [113.46.200.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3231E991B;
	Fri,  6 Feb 2026 02:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770345377; cv=none; b=frfM9bba/CWH6sTW3SITG+0yfFR2XFDF5C++2jm+IYd8x9YXd3G46yxozecVyVybADSiUjQ8GDamLGKtLhMqmTSyLJwyQHkk8nznM08jTRtolhuAL0OnQjF5Sd+iG+grWOLux+/LtF+3nXit+buol7W4GfPLN6a+jQuh+86RjOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770345377; c=relaxed/simple;
	bh=kMw3EEd28RthZmZA8Fo+EKBU3vahW78MzxUIWbmmL0g=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=otDJZ5QPEm7AZrMo6MSdTd1KVsZZ3mi94ceH8NIX6f60INQALDWGHdt0wauY4//TrEYiv2d7gaegR6GH2G76upxXEF7YZmFmEdoeI6jN3fMQElgMX9GpEKkO9gYbKI/biNKhMvgi9AkmvJtizTWxAJyqT678k0jGygipaHjmuPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=s4aantJR; arc=none smtp.client-ip=113.46.200.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="s4aantJR"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ezukT8gf6vSf0QeciExJA8vVhdyq2uEBdV2mhNDadD4=;
	b=s4aantJRfPssrCTa1yKJyIcOivrhh0gnt+2+HS1+182XHUQoAjcmUsCCwlGCcCW5dna5kD/Tj
	2OdvS7KYVXF41Xxj1VvwJZwa4d2K18QfufeULKIkramvSMwkaTpVYwTto6aT8OKViDrr4q3IBEi
	fiiwQAorO5zkQeydhJ3YdZw=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4f6dPv742bzKm4s;
	Fri,  6 Feb 2026 10:31:31 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id BB32A40562;
	Fri,  6 Feb 2026 10:36:07 +0800 (CST)
Received: from kwepemq500010.china.huawei.com (7.202.194.235) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 6 Feb 2026 10:36:07 +0800
Received: from [10.173.125.37] (10.173.125.37) by
 kwepemq500010.china.huawei.com (7.202.194.235) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 6 Feb 2026 10:36:06 +0800
Subject: Re: [PATCH v3 1/3] selftests/mm: add memory failure anonymous page
 test
To: Mark Brown <broonie@kernel.org>
CC: <akpm@linux-foundation.org>, <shuah@kernel.org>, <david@kernel.org>,
	<lorenzo.stoakes@oracle.com>, <Liam.Howlett@oracle.com>, <vbabka@suse.cz>,
	<rppt@kernel.org>, <surenb@google.com>, <mhocko@suse.com>,
	<nao.horiguchi@gmail.com>, <linux-mm@kvack.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
References: <20260204073331.899406-1-linmiaohe@huawei.com>
 <20260204073331.899406-2-linmiaohe@huawei.com>
 <2028f5e1-e032-4909-8240-15fe0b3c82a5@sirena.org.uk>
 <0a84104a-32e3-8518-ebc0-703814e233d4@huawei.com>
 <73756615-b779-44b1-8ff5-b4b2d5e3c7cf@sirena.org.uk>
From: Miaohe Lin <linmiaohe@huawei.com>
Message-ID: <92c543fd-4316-d5dd-451a-a2c668fc98aa@huawei.com>
Date: Fri, 6 Feb 2026 10:36:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <73756615-b779-44b1-8ff5-b4b2d5e3c7cf@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemq500010.china.huawei.com (7.202.194.235)

On 2026/2/5 19:28, Mark Brown wrote:
> On Thu, Feb 05, 2026 at 02:58:50PM +0800, Miaohe Lin wrote:
>> On 2026/2/4 19:26, Mark Brown wrote:
> 
>>> In -next I added a hack with wrapper scripts per category to improve the
>>> integration of the mm selftests with the kselftest framework, could you
>>> please wire things up into that, see:
> 
>> Sorry, I missed that. Do you mean adding something like below to run memory-failure test separately?
> 
> Yes, pretty much - I'd keep the list of TEST_PROGS sorted but otherwise
> that's it.

Sounds good to me. Will do.

Thanks.
.

