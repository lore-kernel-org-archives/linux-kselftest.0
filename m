Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56B82BE053;
	Thu,  5 Feb 2026 06:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770274736; cv=none; b=QtWiDgYIyFZZYOxo5/2AH2Vqm1+p0r7pcvA2386lC87pMRdzt4GPaRlCueVSI8GRzGawjyqdfJxPSa02YqR5HXmiKGWffDou881bEMV+7aypGwLyxvS7Nt4B5MNRt3iqZoph28SWbOOV6Lxycnt12LYwYm41RHn0019SLPghIOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770274736; c=relaxed/simple;
	bh=Q3eMzabblyac6Lc1mi7X/ueYLrHOXrQP7GVxji6b2io=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=Zkay99HtLxazVo1BVY84cpdB/6FSiFK96i3qWVv0e9s8V5dznYwhiZFbb0t0kAWc0xKg6uf1rLpuxPgs0ZKzcUcP9Q/ag8jAf5WIXjiYIwHQjsjGLAC6muLZPetHNn44+GTWDjbm1nsZvFAitbHevsHr5ty3SZF9f0lltIS13LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=NmjiaT9K; arc=none smtp.client-ip=113.46.200.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="NmjiaT9K"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=J6qFZpvt332CWfnqiedPQcDy2pMKUb2TChFJK4dmduI=;
	b=NmjiaT9KAgTcZnqLfzY2T+P0jf5y+K35HhScOksU/2hP8azoXPD5lTVTenvlTv2hjAIGL0yAU
	h4CRBB9XyMG0YGWG719WF28Pse1IzXBfdmzfTpU7Ao3i6ojqE0ATpxexkexdR7BXPeFl62lYMRL
	9YPplnAxmPfwy2LR8C26Yg0=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4f67Hm13f5z1T4fy;
	Thu,  5 Feb 2026 14:54:28 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id C983F40538;
	Thu,  5 Feb 2026 14:58:51 +0800 (CST)
Received: from kwepemq500010.china.huawei.com (7.202.194.235) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 5 Feb 2026 14:58:51 +0800
Received: from [10.173.125.37] (10.173.125.37) by
 kwepemq500010.china.huawei.com (7.202.194.235) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 5 Feb 2026 14:58:50 +0800
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
From: Miaohe Lin <linmiaohe@huawei.com>
Message-ID: <0a84104a-32e3-8518-ebc0-703814e233d4@huawei.com>
Date: Thu, 5 Feb 2026 14:58:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <2028f5e1-e032-4909-8240-15fe0b3c82a5@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemq500010.china.huawei.com (7.202.194.235)

On 2026/2/4 19:26, Mark Brown wrote:
> On Wed, Feb 04, 2026 at 03:33:29PM +0800, Miaohe Lin wrote:
> 
>> +TEST_HARNESS_MAIN
>> diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
>> index 29be9038bfb0..afdcfd0d7cef 100755
>> --- a/tools/testing/selftests/mm/run_vmtests.sh
>> +++ b/tools/testing/selftests/mm/run_vmtests.sh
>> @@ -91,6 +91,8 @@ separated by spaces:
>>  	test VMA merge cases behave as expected
>>  - rmap
>>  	test rmap behaves as expected
>> +- memory-failure
>> +	test memory-failure behaves as expected
> 
> In -next I added a hack with wrapper scripts per category to improve the
> integration of the mm selftests with the kselftest framework, could you
> please wire things up into that, see:
> 
>   6ce964c02f1c (selftests/mm: have the harness run each test category separately)

Sorry, I missed that. Do you mean adding something like below to run memory-failure test separately?

diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
index cd7ed1d6769f..b531fd2f4e4c 100644
--- a/tools/testing/selftests/mm/Makefile
+++ b/tools/testing/selftests/mm/Makefile
@@ -171,6 +171,7 @@ TEST_PROGS += ksft_thp.sh
 TEST_PROGS += ksft_userfaultfd.sh
 TEST_PROGS += ksft_vma_merge.sh
 TEST_PROGS += ksft_vmalloc.sh
+TEST_PROGS += ksft_memory_failure.sh

 TEST_FILES := test_vmalloc.sh
 TEST_FILES += test_hmm.sh
diff --git a/tools/testing/selftests/mm/ksft_memory_failure.sh b/tools/testing/selftests/mm/ksft_memory_failure.sh
new file mode 100644
index 000000000000..ae1614d4d49b
--- /dev/null
+++ b/tools/testing/selftests/mm/ksft_memory_failure.sh
@@ -0,0 +1,4 @@
+#!/bin/sh -e
+# SPDX-License-Identifier: GPL-2.0
+
+./run_vmtests.sh -t memory-failure

Thanks.
.

