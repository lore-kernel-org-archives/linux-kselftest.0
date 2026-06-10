Received: from out30-111.freemail.mail.aliyun.com (out30-111.freemail.mail.aliyun.com [115.124.30.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48A6213E89
	for <linux-kselftest@vger.kernel.org>; Wed, 10 Jun 2026 03:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781061338; cv=none; b=BoXqgRAylAEqOi9DSWAWusItmwItZwSCbWiqZSUhGnElBMWA0I/Emt3Cyszy9BHk5qnLMvoIKRvKpVesJSkUybs7ZbMNt+bEk6slxxYKFwvkQ/6KSf9UEKdcW3c1cA8jknvQSV9WFe0t7HcZ8R8YyL4ySzn+Uc7itnnyk0jTarc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781061338; c=relaxed/simple;
	bh=jUBmC5gvw+RCqWsXBhY8pIww68FtDNu2Ek4bRm9cCr8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DRfEJqFmSgdAWDeLK8BczEdy7nAhFCbStza6jX+5dFrCxSCezO22D1AIfBzIzfAfy6eg0opcajMyzeMi/+4/yc20fIXyue+yR+0daWro9v0d36hT7AenjKflDCIHD90FC5u7C8fZUziTkUfxL926s+LiTaH5vb7w0ZzJuKyM6Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=ftYHOrql; arc=none smtp.client-ip=115.124.30.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="ftYHOrql"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1781061332; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=cNmOhfMNQ5fdxIZhkZYWk18D6krzi1ZCktahJwXG/tE=;
	b=ftYHOrql0QUuLMcHYbvfjnlNnhy9lmuZBV7PvkbEQx/iPuKLqc5UJwTQI6B09geEjlLQ8oxCln3S8nx0wZrMh1Xz90jsOR5Wb+liQCt+e7eKAH1VuRmG67ZBBNUyrx1ym5/Nmjra7b+06jg1xtdr9FATeCysqTMfOp3Y/6iKx5c=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=kanie@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0X4Ycxd._1781061330;
Received: from 30.178.82.120(mailfrom:kanie@linux.alibaba.com fp:SMTPD_---0X4Ycxd._1781061330 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 10 Jun 2026 11:15:31 +0800
Message-ID: <778aeb80-ee8d-44a5-a103-7e0559be0302@linux.alibaba.com>
Date: Wed, 10 Jun 2026 11:15:30 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/uevent: increase __UEVENT_BUFFER_SIZE to avoid
 ENOBUFS on busy systems
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Shuah Khan <shuah@kernel.org>,
 Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>,
 Wei Yang <richard.weiyang@gmail.com>, linux-kselftest@vger.kernel.org,
 xlpang@linux.alibaba.com, oliver.yang@linux.alibaba.com,
 Christian Brauner <brauner@kernel.org>
References: <20260608053934.4059533-1-kanie@linux.alibaba.com>
 <20260609183410.8d6ade7384e6a39c076f9834@linux-foundation.org>
From: Guixin Liu <kanie@linux.alibaba.com>
In-Reply-To: <20260609183410.8d6ade7384e6a39c076f9834@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/6/10 09:34, Andrew Morton 写道:
> On Mon,  8 Jun 2026 13:39:34 +0800 Guixin Liu <kanie@linux.alibaba.com> wrote:
>
>> The kselftests case uevent.uevent_filtering fails reproducibly on busy
>> systems (e.g. Intel EMR / AMD servers) with:
>>
>>    No buffer space available - Failed to receive uevent
>>
>> The listener binds the NETLINK_KOBJECT_UEVENT socket to all 32 multicast
>> groups (nl_groups = -1) but only sets SO_RCVBUF to 4 KiB
>> (__UEVENT_BUFFER_SIZE = 2048 * 2). On hosts with many devices, the
>> kernel and userspace daemons (udev/systemd) constantly emit uevents on
>> multiple groups, plus the test itself triggers 10 add events in a row.
>> The 4 KiB receive buffer overflows before the listener can drain it,
>> recvmsg() returns -ENOBUFS, and the test bails out as failure.
>>
>> Increase __UEVENT_BUFFER_SIZE to 1 MiB so the receive buffer is large
>> enough to absorb the burst of uevents on busy systems. After this
>> change the test passes consistently across dozens of runs on Intel EMR
>> and AMD platforms.
>>
> Fair enough.
>
>> --- a/tools/testing/selftests/uevent/uevent_filtering.c
>> +++ b/tools/testing/selftests/uevent/uevent_filtering.c
>> @@ -22,7 +22,7 @@
>>   #include "kselftest_harness.h"
>>   
>>   #define __DEV_FULL "/sys/devices/virtual/mem/full/uevent"
>> -#define __UEVENT_BUFFER_SIZE (2048 * 2)
>> +#define __UEVENT_BUFFER_SIZE (1024 * 1024)
>>   #define __UEVENT_HEADER "add@/devices/virtual/mem/full"
>>   #define __UEVENT_HEADER_LEN sizeof("add@/devices/virtual/mem/full")
>>   #define __UEVENT_LISTEN_ALL -1
> scripts/get_maintainer.sh isn't very useful with selftests code.  But
> git-blame can be used to find out who to Cc (hi, Christian!).
Got it, thanks.

In addtion, It's nice to get a rb tag.

Best Regards,
Guixin Liu

