Received: from canpmsgout10.his.huawei.com (canpmsgout10.his.huawei.com [113.46.200.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF00220F38;
	Wed, 21 Jan 2026 02:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768961115; cv=none; b=oIe2iTLqiIMvZaSvcc1wWC4+Ss8aNsUifYJz2qBrJrsNixvXnn5P1VEWcnh8kZyFotvfa/MD9gypflEcHDKBxRPCtyt4ly0XKotZb2W7VMQgLZ6CphQDowxxZNsjntPWX+15kGqtwGvrk6Il/B/RozVgq7Pi7OX1FSYA7KsWVa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768961115; c=relaxed/simple;
	bh=LbDs/PvwIV7kizIUVmLc28iCUT4wVhw+eK8eezptJxc=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=oPHOPj9pozTzb2WJy3Pv01P6slDjg991eqwuyODjFkGF+c8XNEXGDMQN3lCLSeCNUExtWH8FPg2pY/vHIwp4e2rEUVdtt5nUaxySjqgp/4k1cx4E9SXTtnFVYN0KBD6CcFsUfKv3fnkjQR9y1S6Z8BnaG4yv3vJMmBvvr5XXdP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=3DkuNGwH; arc=none smtp.client-ip=113.46.200.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="3DkuNGwH"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=0nhG0efajjDPdtA2NXbIKVI241CAeCQcgsQn0YOqAAw=;
	b=3DkuNGwHlMIR1X2OF/EXuyAarXsYXLrWYAQZJHgAAVjS08xCNOVfRcsrpTcbiwbD/FkXyGDRX
	5tiliLOEZUrVnQKut1J86wAoS7lSDW17B/Dq++rowX5vTYT44xCWKdP8ATNgKprme7ujlU54EWf
	9kf7NoPP8im6nqXQn08Yk34=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4dwnVz457wz1K96q;
	Wed, 21 Jan 2026 10:01:47 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 2405F40566;
	Wed, 21 Jan 2026 10:05:09 +0800 (CST)
Received: from kwepemq500010.china.huawei.com (7.202.194.235) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 21 Jan 2026 10:05:08 +0800
Received: from [10.173.125.37] (10.173.125.37) by
 kwepemq500010.china.huawei.com (7.202.194.235) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 21 Jan 2026 10:05:07 +0800
Subject: Re: [PATCH v2 1/3] selftests/mm: add memory failure anonymous page
 test
To: Mark Brown <broonie@kernel.org>
CC: <akpm@linux-foundation.org>, <shuah@kernel.org>, <david@kernel.org>,
	<lorenzo.stoakes@oracle.com>, <Liam.Howlett@oracle.com>, <vbabka@suse.cz>,
	<rppt@kernel.org>, <surenb@google.com>, <mhocko@suse.com>,
	<nao.horiguchi@gmail.com>, <linux-mm@kvack.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
References: <20260120123239.909882-1-linmiaohe@huawei.com>
 <20260120123239.909882-2-linmiaohe@huawei.com>
 <737310eb-05e5-4234-af67-9118b3f395ab@sirena.org.uk>
From: Miaohe Lin <linmiaohe@huawei.com>
Message-ID: <f1cb6029-9140-3784-5b44-ff58b4edde2c@huawei.com>
Date: Wed, 21 Jan 2026 10:05:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <737310eb-05e5-4234-af67-9118b3f395ab@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemq500010.china.huawei.com (7.202.194.235)

On 2026/1/21 1:46, Mark Brown wrote:
> On Tue, Jan 20, 2026 at 08:32:37PM +0800, Miaohe Lin wrote:
> 
>> +# Try to load hwpoison_inject if not present.
>> +HWPOISON_DIR=/sys/kernel/debug/hwpoison/
>> +if [ ! -d "$HWPOISON_DIR" ]; then
>> +	if ! modprobe -q -R hwpoison_inject; then
>> +		echo "Module hwpoison_inject not found, skipping..."
>> +	else
>> +		modprobe hwpoison_inject > /dev/null 2>&1
>> +		LOADED_MOD=1
>> +	fi
>> +fi
> 
> You should also add HWPOISION_INJECT and likely also MEMORY_FAILURE
> (which it depends on) to the config fragment in
> 
>    tools/testing/selftests/mm/config

Currently if HWPOISION_INJECT or MEMORY_FAILURE isn't enabled, the test
will be skipped.

> 
> so people and tools know the config options are needed to get all the
> tests running.

Sounds reasonable. Will add it in next version.

Thanks.
.
