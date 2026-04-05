Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F26A1A267;
	Sun,  5 Apr 2026 07:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775374444; cv=none; b=C3an2SxgBlSZgck3Y/wviotDg6CBpk8m2LpVpW/ByGtpZdHU83DgyapbcWHEMbql5w7mPvUzXlvseU4Ph4tbkxVGDZpEhRpqRMPSKn8ZgvCdR6V8dEPwv2b+EsfjyY1SIqZ0MObWLKJOfJGMsV1MrVpWkWcONoufPdO83nZGb+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775374444; c=relaxed/simple;
	bh=Nfu4Tu+OUsT33sDUmIovSpX5KSqFMsSDTkbmrb8J+pg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NkTL05Btlez+F7+LQ2bA9k7kaHuXpstli098ULOXpnbiPRqa0UIvJworYIBdWhRAPHbevc+0OT8iS38HY/w0Rx+98VhSKaDkIEjCNqNAT5Wpo2Oe20qvxYlTF7J8DJDdYzFxNqv7klryfP2/4Wq5XbN66gaSwQ2qkq7Tb5/O5JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CYGBvzgC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CYGBvzgC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8E61C116C6;
	Sun,  5 Apr 2026 07:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775374443;
	bh=Nfu4Tu+OUsT33sDUmIovSpX5KSqFMsSDTkbmrb8J+pg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=CYGBvzgCralwJZXcb0Y2UZClDnlHuroFvQBjHLNkJVVS4+pnQhVEG3V2staNu5jrd
	 IkSKhRt2bkZr1QbF0CxiNYkZCxNPn1F5nOv9euSu8Xa6OKn0LDTqz2zk0xrTB9Uk3A
	 RuPCMW4ps6khOcWMXhEWISemaOHClc8Gk3onWUelkzzt2GggfHsK5JdBF2Spj+wX7l
	 RfCeJ3cVhoQt+G8lagbhV/qnb0nDvti3Z3+8amQxWikfEEq9zlr+uCfLdSDNfEtAgQ
	 z+LHlM9iZRxwW0X18KeNCPduyfa9lS2ZkbfonX5I40ePeYjjuDewHgU8DAXyRV734y
	 JzxZjk2EMqdjA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Zhu Yanjun <yanjun.zhu@linux.dev>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Pasha Tatashin
 <pasha.tatashin@soleen.com>,  Mike Rapoport <rppt@kernel.org>,  Shuah Khan
 <shuah@kernel.org>,  Andrew Morton <akpm@linux-foundation.org>,  Usama
 Arif <usama.arif@linux.dev>,  linux-kernel@vger.kernel.org,
  linux-kselftest@vger.kernel.org,  linux-mm@kvack.org
Subject: Re: [PATCH v3 2/6] selftests/liveupdate: add helper functions for
 memfd tests
In-Reply-To: <c783bc1b-3327-422f-9191-11550513b13c@linux.dev> (Zhu Yanjun's
	message of "Sat, 4 Apr 2026 10:53:47 -0700")
References: <20260404102452.4091740-1-pratyush@kernel.org>
	<20260404102452.4091740-3-pratyush@kernel.org>
	<c783bc1b-3327-422f-9191-11550513b13c@linux.dev>
Date: Sun, 05 Apr 2026 07:34:00 +0000
Message-ID: <2vxzecktc13r.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 04 2026, Zhu Yanjun wrote:

> =E5=9C=A8 2026/4/4 3:24, Pratyush Yadav =E5=86=99=E9=81=93:
>> From: "Pratyush Yadav (Google)" <pratyush@kernel.org>
>> Add some helper functions that will be used by memfd tests. This moves
>> some of the complexity out of the test itself, which results in better
>> test readability and less code duplication.
>> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>> Signed-off-by: Pratyush Yadav <ptyadav@amazon.de>
>> Signed-off-by: Pratyush Yadav (Google) <pratyush@kernel.org>
>> ---
>>   .../selftests/liveupdate/luo_test_utils.c     | 191 +++++++++++++++++-
>>   .../selftests/liveupdate/luo_test_utils.h     |  10 +
>>   2 files changed, 200 insertions(+), 1 deletion(-)
>> diff --git a/tools/testing/selftests/liveupdate/luo_test_utils.c
>> b/tools/testing/selftests/liveupdate/luo_test_utils.c
>> index 3c8721c505df..ceb918ef9813 100644
>> --- a/tools/testing/selftests/liveupdate/luo_test_utils.c
>> +++ b/tools/testing/selftests/liveupdate/luo_test_utils.c
>> @@ -1,8 +1,12 @@
>>   // SPDX-License-Identifier: GPL-2.0-only
>>     /*
>> - * Copyright (c) 2025, Google LLC.
>> + * Copyright (c) 2025-2026, Google LLC.
>>    * Pasha Tatashin <pasha.tatashin@soleen.com>
>> + * Pratyush Yadav (Google) <pratyush@kernel.org>
>> + *
>> + * Copyright (C) 2025 Amazon.com Inc. or its affiliates.
>> + * Pratyush Yadav <ptyadav@amazon.de>
>>    */
>>     #define _GNU_SOURCE
>> @@ -20,9 +24,194 @@
>>   #include <sys/stat.h>
>>   #include <errno.h>
>>   #include <stdarg.h>
>> +#include <sys/vfs.h>
>> +#include <linux/magic.h>
>>     #include "luo_test_utils.h"
>>   +int cwd_is_tmpfs(void)
>> +{
>> +	struct statfs buf;
>> +
>> +	if (statfs(".", &buf) < 0)
>> +		return -errno;
>> +
>> +	return buf.f_type =3D=3D TMPFS_MAGIC;
>> +}
>> +
>> +/* Read exactly specified size from fd. Any less results in error. */
>> +int read_size(int fd, char *buffer, size_t size)
>> +{
>> +	size_t remain =3D size;
>> +	ssize_t bytes_read;
>> +
>> +	while (remain) {
>
> while (remain > 0) ?

I don't think it is needed. bytes_read will always be smaller than or
equal to remain, so remain will never go below 0 anyway. And while
(remain) is nicer to read.

>
>> +		bytes_read =3D read(fd, buffer, remain);
>> +		if (bytes_read =3D=3D 0)
>> +			return -ENODATA;
>> +		if (bytes_read < 0) {
>> +			if (errno =3D=3D EINTR)
>> +				continue;
>> +			else
>> +				return -errno;
>> +		}
>> +
>> +		remain -=3D bytes_read;
>> +		buffer +=3D bytes_read;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
[...]

--=20
Regards,
Pratyush Yadav
