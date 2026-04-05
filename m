Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8642E1AB6F1
	for <linux-kselftest@vger.kernel.org>; Sun,  5 Apr 2026 16:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775406628; cv=none; b=Sn0AGxz2ADssd0rNI4SXnZTn6HG1hOxPNk79z73dQb+AJ9LQL1niybEIaaokxu7KB2kGlZeYe+8nKyn4CQim/E/4MotwZygeBZXrzIwFYCUknsB42ZG4OuwM+EABBM5vdB12pRIKZQMjWDePyR0xeC0uQ38aQmMRZljNhGFnfyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775406628; c=relaxed/simple;
	bh=c789ayyGQ4yRcOqcywA2wzIlZo22FYkyLwOqdDT06pQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bB78n0aHZ6H3Qp1mKX2lN/fWKFy3pfMJNQTMyYd6AzcKM9sfdnN6sMNNvzPfvrc0Ie/TRV47aHx0Ih2klv4YgXwupvTozRVGPA4nfQNRcMMMsMSEk6X/032/ZWcN/MN2MbIg1+B6UhV5Eu+vOypFfh/vvNjAzURo5TRiebvKzSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dzDC4aie; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="dzDC4aie"
Message-ID: <b7af6516-1593-4e2b-9149-fc839e2b88bd@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775406624;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LjUD/kLWetoMxCJ3PxzmkFjU0TTr1mOWnhqJ2E1tbHo=;
	b=dzDC4aieMPnCPXwj7TE0O257iG4gwpW1KkFDZSb87AyYWIQFJUNBBSvlCdKGM9ThMJk4Iy
	7CEHbAOQbccjlFxMy1NmWRmj77N1XEtD0WcflqatHKS//m+Zd58m8m2B56dyKEiM3nJ2ml
	XKFcOceEg/l8Hw3+jRJDeZy+2BZcJM4=
Date: Sun, 5 Apr 2026 09:30:17 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 2/6] selftests/liveupdate: add helper functions for
 memfd tests
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>,
 Mike Rapoport <rppt@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Usama Arif
 <usama.arif@linux.dev>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org
References: <20260404102452.4091740-1-pratyush@kernel.org>
 <20260404102452.4091740-3-pratyush@kernel.org>
 <c783bc1b-3327-422f-9191-11550513b13c@linux.dev>
 <2vxzecktc13r.fsf@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Zhu Yanjun <yanjun.zhu@linux.dev>
In-Reply-To: <2vxzecktc13r.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 2026/4/5 0:34, Pratyush Yadav 写道:
> On Sat, Apr 04 2026, Zhu Yanjun wrote:
>
>> 在 2026/4/4 3:24, Pratyush Yadav 写道:
>>> From: "Pratyush Yadav (Google)" <pratyush@kernel.org>
>>> Add some helper functions that will be used by memfd tests. This moves
>>> some of the complexity out of the test itself, which results in better
>>> test readability and less code duplication.
>>> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>>> Signed-off-by: Pratyush Yadav <ptyadav@amazon.de>
>>> Signed-off-by: Pratyush Yadav (Google) <pratyush@kernel.org>
>>> ---
>>>    .../selftests/liveupdate/luo_test_utils.c     | 191 +++++++++++++++++-
>>>    .../selftests/liveupdate/luo_test_utils.h     |  10 +
>>>    2 files changed, 200 insertions(+), 1 deletion(-)
>>> diff --git a/tools/testing/selftests/liveupdate/luo_test_utils.c
>>> b/tools/testing/selftests/liveupdate/luo_test_utils.c
>>> index 3c8721c505df..ceb918ef9813 100644
>>> --- a/tools/testing/selftests/liveupdate/luo_test_utils.c
>>> +++ b/tools/testing/selftests/liveupdate/luo_test_utils.c
>>> @@ -1,8 +1,12 @@
>>>    // SPDX-License-Identifier: GPL-2.0-only
>>>      /*
>>> - * Copyright (c) 2025, Google LLC.
>>> + * Copyright (c) 2025-2026, Google LLC.
>>>     * Pasha Tatashin <pasha.tatashin@soleen.com>
>>> + * Pratyush Yadav (Google) <pratyush@kernel.org>
>>> + *
>>> + * Copyright (C) 2025 Amazon.com Inc. or its affiliates.
>>> + * Pratyush Yadav <ptyadav@amazon.de>
>>>     */
>>>      #define _GNU_SOURCE
>>> @@ -20,9 +24,194 @@
>>>    #include <sys/stat.h>
>>>    #include <errno.h>
>>>    #include <stdarg.h>
>>> +#include <sys/vfs.h>
>>> +#include <linux/magic.h>
>>>      #include "luo_test_utils.h"
>>>    +int cwd_is_tmpfs(void)
>>> +{
>>> +	struct statfs buf;
>>> +
>>> +	if (statfs(".", &buf) < 0)
>>> +		return -errno;
>>> +
>>> +	return buf.f_type == TMPFS_MAGIC;
>>> +}
>>> +
>>> +/* Read exactly specified size from fd. Any less results in error. */
>>> +int read_size(int fd, char *buffer, size_t size)
>>> +{
>>> +	size_t remain = size;
>>> +	ssize_t bytes_read;
>>> +
>>> +	while (remain) {
>> while (remain > 0) ?
> I don't think it is needed. bytes_read will always be smaller than or
> equal to remain, so remain will never go below 0 anyway. And while
> (remain) is nicer to read.

If a wrong number is transferred, this makes remain less than 0. Then 
this loop will run again and again.

This while (remain > 0) will avoid this kind of scenario.

ZhuYanjun

>
>>> +		bytes_read = read(fd, buffer, remain);
>>> +		if (bytes_read == 0)
>>> +			return -ENODATA;
>>> +		if (bytes_read < 0) {
>>> +			if (errno == EINTR)
>>> +				continue;
>>> +			else
>>> +				return -errno;
>>> +		}
>>> +
>>> +		remain -= bytes_read;
>>> +		buffer += bytes_read;
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
> [...]
>
-- 
Best Regards,
Yanjun.Zhu

