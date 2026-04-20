Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330F1DDCD;
	Mon, 20 Apr 2026 07:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776670011; cv=none; b=Lra6yXMsYvb5/qhjsb0JzhkNiew7P4tRCr5fogUwut9wnvutE08N2qu7hOUtE4GTMQwmGiJgTn090rpXfXCyAoGHE0T7eYzCyWjt5S0InRpMQ8V3gq7vVoh7UwfW7TmfMY+ZjrkLU9UdoDEQvgsVbqLldHYsXbjM/40DdCg4IgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776670011; c=relaxed/simple;
	bh=htInwWmBS9Dv3ID0U9R8OjOebzN3vBru2Y30EyYYcbU=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=L0ek8jdi1sM+LZB8FSHVDtHiVbrodD4An91pLc5b+7kWMJrEyRT8QJgRB/+IjoZQg7s+w5nd9643RntqfkPJCgqDHSME3NIa4FkCDgqt/drT1vYP3YrqAEynbx4aZnp4ggtqrbtOfkYR8wLzNTVLRW6fBl/l6ditg3BGr/dukHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=FIuFuYZx; arc=none smtp.client-ip=113.46.200.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="FIuFuYZx"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=hkO6Nc68R7AMJu+lA9Su51P8nuTpDZ4kPudBZi+bg+8=;
	b=FIuFuYZx6PMxQ3fAVUZLYpHeiTSRPTIcJ20Ubhiz5fQF+InL/Iuja4kC8IcH3zRZ83hzoqqXY
	7j+swclZ2tWYU+DN9STn+/NZ1ogv85AdvFPfR14qbKswsVaeXuEnFwkeF5BL40b4q2Rw4U00Ui3
	zhpcdX1FjCecB0RuFlyEJDQ=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4fzcML0ljLz1prN0;
	Mon, 20 Apr 2026 15:20:14 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 3E84040569;
	Mon, 20 Apr 2026 15:26:38 +0800 (CST)
Received: from kwepemq500010.china.huawei.com (7.202.194.235) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 20 Apr 2026 15:26:38 +0800
Received: from [10.173.124.160] (10.173.124.160) by
 kwepemq500010.china.huawei.com (7.202.194.235) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 20 Apr 2026 15:26:36 +0800
Subject: Re: [PATCH v5 13/14] selftests/mm: move hwpoison setup into
 run_test() and silence modprobe output for memory-failure category
To: Sayali Patil <sayalip@linux.ibm.com>
CC: David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, "Michal
 Hocko" <mhocko@kernel.org>, Oscar Salvador <osalvador@suse.de>, "Lorenzo
 Stoakes" <lorenzo.stoakes@oracle.com>, Dev Jain <dev.jain@arm.com>,
	<Liam.Howlett@oracle.com>, <linuxppc-dev@lists.ozlabs.org>, "Venkat Rao
 Bagalkote" <venkat88@linux.ibm.com>, Andrew Morton
	<akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
	<linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, Ritesh Harjani <ritesh.list@gmail.com>
References: <cover.1776150071.git.sayalip@linux.ibm.com>
 <ec5a0e5e98c4fe55b8571c408ca891bd02208cc3.1776150071.git.sayalip@linux.ibm.com>
From: Miaohe Lin <linmiaohe@huawei.com>
Message-ID: <bdcb1965-d59d-4cf8-d79b-a7997012aac6@huawei.com>
Date: Mon, 20 Apr 2026 15:26:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <ec5a0e5e98c4fe55b8571c408ca891bd02208cc3.1776150071.git.sayalip@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemq500010.china.huawei.com (7.202.194.235)

On 2026/4/14 16:22, Sayali Patil wrote:
> run_vmtests.sh contains special handling to ensure the hwpoison_inject
> module is available for the memory-failure tests. This logic was
> implemented outside of run_test(), making the setup category-specific
> but managed globally.
> 
> Move the hwpoison_inject handling into run_test() and restrict it
> to the memory-failure category so that:
> 1. the module is checked and loaded only when memory-failure tests run,
> 2. the test is skipped if the module or the debugfs interface
> (/sys/kernel/debug/hwpoison/) is not available.
> 3. the module is unloaded after the test if it was loaded by the script.
> 
> This localizes category-specific setup and makes the test flow
> consistent with other per-category preparations.
> 
> While updating this logic, fix the module availability check.
> The script previously used:
> 
> 	modprobe -R hwpoison_inject
> 
> The -R option prints the resolved module name to stdout, causing every
> run to print:
> 
> 	hwpoison_inject
> 
> in the test output, even when no action is required, introducing
> unnecessary noise.
> 
> Replace this with:
> 
> 	modprobe -n hwpoison_inject
> 
> which verifies that the module is loadable without producing output,
> keeping the selftest logs clean and consistent.
> 
> Also, ensure that skipped tests do not override a previously recorded
> failure. A skipped test currently sets exitcode to ksft_skip even if a
> prior test has failed, which can mask failures in the final exit status.
> Update the logic to only set exitcode to ksft_skip when no failure has
> been recorded.
> 
> Fixes: ff4ef2fbd101 ("selftests/mm: add memory failure anonymous page test")
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> Signed-off-by: Sayali Patil <sayalip@linux.ibm.com>

Reviewed-by: Miaohe Lin <linmiaohe@huawei.com>

Thanks.
.
