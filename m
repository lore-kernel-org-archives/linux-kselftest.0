Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379933A9015;
	Tue,  7 Apr 2026 10:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775557862; cv=none; b=AeKdyoisBQJD6UGz5AY+KiPcdCW8I0Xryfo5SXuyUT3o2fmnXg+7MDwDoW7dc62BavIbjdK5M3/sHjhk5saCz/1RK2Y9QEyOqBHm7pbgfL9r5z2Sqse3UrMK4VLjbLWVJoc/TJan8f2V5fgRQuusomtAY+PTbv1kL7bn5eJLd1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775557862; c=relaxed/simple;
	bh=xnPiwWIJZOBJKDM3E43NKbF2H1Ltqj2Y7PvIumMZROg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gmBfqN5BTAwW7SeDDFj4d3nzpcl7V4340Acu/48WAPvu9av9kTrOuubf052a+s8657veHAcNFjlhcgW4nBgIjmel+Fkom9DunfWlLcNyRtPqbXPQL6upTgzJAK7x9v4hT2/zk+GE/2F3TBeluofbs6E6IZtjdJZ5ZnyoYT0DzrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sECHkvtH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sECHkvtH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D07A9C116C6;
	Tue,  7 Apr 2026 10:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775557861;
	bh=xnPiwWIJZOBJKDM3E43NKbF2H1Ltqj2Y7PvIumMZROg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=sECHkvtHNV1vu3xYEHaXdXfX1O8I+pbJISMQZvpGMKxILLhPO1wACoSBugIEdIFRG
	 HlHTPHfqhlHH+4i4LcFrSWcrb5nabh/qpDLYyhovcHWb2OFhKxNvMY9XfgfC8+1SBB
	 WGS00aiYdPz9XGsGM0dSnNhD8Ht5DKxqBXA3QuDYijFv2vvO8bfpD3rrpycCOU0PTF
	 cxiWxmkn5YtLkVnBv1eAb+N7ZJlNS/u+20fPiVzFrOmgMSIoINw4VPGHAkeCoFNxsz
	 kpwjRARM1QCToL32gs8kkGcDovkjxSVNJBb19/79jVvbUsI9yJCUQf8Kh2q1eoJgIW
	 otkqdv3sQnQyA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Zhu Yanjun <yanjun.zhu@linux.dev>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Pasha Tatashin
 <pasha.tatashin@soleen.com>,  Mike Rapoport <rppt@kernel.org>,  Shuah Khan
 <shuah@kernel.org>,  Andrew Morton <akpm@linux-foundation.org>,  Usama
 Arif <usama.arif@linux.dev>,  linux-kernel@vger.kernel.org,
  linux-kselftest@vger.kernel.org,  linux-mm@kvack.org
Subject: Re: [PATCH v3 2/6] selftests/liveupdate: add helper functions for
 memfd tests
In-Reply-To: <b7af6516-1593-4e2b-9149-fc839e2b88bd@linux.dev> (Zhu Yanjun's
	message of "Sun, 5 Apr 2026 09:30:17 -0700")
References: <20260404102452.4091740-1-pratyush@kernel.org>
	<20260404102452.4091740-3-pratyush@kernel.org>
	<c783bc1b-3327-422f-9191-11550513b13c@linux.dev>
	<2vxzecktc13r.fsf@kernel.org>
	<b7af6516-1593-4e2b-9149-fc839e2b88bd@linux.dev>
Date: Tue, 07 Apr 2026 10:30:58 +0000
Message-ID: <2vxz5x63awpp.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 05 2026, Zhu Yanjun wrote:

> =E5=9C=A8 2026/4/5 0:34, Pratyush Yadav =E5=86=99=E9=81=93:
>> On Sat, Apr 04 2026, Zhu Yanjun wrote:
>>
>>> =E5=9C=A8 2026/4/4 3:24, Pratyush Yadav =E5=86=99=E9=81=93:
>>>> From: "Pratyush Yadav (Google)" <pratyush@kernel.org>
>>>> Add some helper functions that will be used by memfd tests. This moves
>>>> some of the complexity out of the test itself, which results in better
>>>> test readability and less code duplication.
>>>> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>>>> Signed-off-by: Pratyush Yadav <ptyadav@amazon.de>
>>>> Signed-off-by: Pratyush Yadav (Google) <pratyush@kernel.org>
>>>> ---
>>>>    .../selftests/liveupdate/luo_test_utils.c     | 191 +++++++++++++++=
++-
>>>>    .../selftests/liveupdate/luo_test_utils.h     |  10 +
>>>>    2 files changed, 200 insertions(+), 1 deletion(-)
>>>> diff --git a/tools/testing/selftests/liveupdate/luo_test_utils.c
>>>> b/tools/testing/selftests/liveupdate/luo_test_utils.c
>>>> index 3c8721c505df..ceb918ef9813 100644
>>>> --- a/tools/testing/selftests/liveupdate/luo_test_utils.c
>>>> +++ b/tools/testing/selftests/liveupdate/luo_test_utils.c
>>>> @@ -1,8 +1,12 @@
>>>>    // SPDX-License-Identifier: GPL-2.0-only
>>>>      /*
>>>> - * Copyright (c) 2025, Google LLC.
>>>> + * Copyright (c) 2025-2026, Google LLC.
>>>>     * Pasha Tatashin <pasha.tatashin@soleen.com>
>>>> + * Pratyush Yadav (Google) <pratyush@kernel.org>
>>>> + *
>>>> + * Copyright (C) 2025 Amazon.com Inc. or its affiliates.
>>>> + * Pratyush Yadav <ptyadav@amazon.de>
>>>>     */
>>>>      #define _GNU_SOURCE
>>>> @@ -20,9 +24,194 @@
>>>>    #include <sys/stat.h>
>>>>    #include <errno.h>
>>>>    #include <stdarg.h>
>>>> +#include <sys/vfs.h>
>>>> +#include <linux/magic.h>
>>>>      #include "luo_test_utils.h"
>>>>    +int cwd_is_tmpfs(void)
>>>> +{
>>>> +	struct statfs buf;
>>>> +
>>>> +	if (statfs(".", &buf) < 0)
>>>> +		return -errno;
>>>> +
>>>> +	return buf.f_type =3D=3D TMPFS_MAGIC;
>>>> +}
>>>> +
>>>> +/* Read exactly specified size from fd. Any less results in error. */
>>>> +int read_size(int fd, char *buffer, size_t size)
>>>> +{
>>>> +	size_t remain =3D size;
>>>> +	ssize_t bytes_read;
>>>> +
>>>> +	while (remain) {
>>> while (remain > 0) ?
>> I don't think it is needed. bytes_read will always be smaller than or
>> equal to remain, so remain will never go below 0 anyway. And while
>> (remain) is nicer to read.
>
> If a wrong number is transferred, this makes remain less than 0. Then thi=
s loop
> will run again and again.

That can only happen if read() returns more then the requested number of
bytes. That is, if bytes_read > remain. And read() will never do so
since that can be a buffer overflow and would break userspace left and
right.

So, I don't see how this is a problem.

>
> This while (remain > 0) will avoid this kind of scenario.
>
> ZhuYanjun
>
>>
>>>> +		bytes_read =3D read(fd, buffer, remain);
>>>> +		if (bytes_read =3D=3D 0)
>>>> +			return -ENODATA;
>>>> +		if (bytes_read < 0) {
>>>> +			if (errno =3D=3D EINTR)
>>>> +				continue;
>>>> +			else
>>>> +				return -errno;
>>>> +		}
>>>> +
>>>> +		remain -=3D bytes_read;
>>>> +		buffer +=3D bytes_read;
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>> [...]
>>

--=20
Regards,
Pratyush Yadav
