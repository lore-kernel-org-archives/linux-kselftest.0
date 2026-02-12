Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0B217BA2;
	Thu, 12 Feb 2026 13:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770901272; cv=none; b=RlMqFhsPNSeoRXKaz/+3bmQCdZtGwTPeLiQhhsdgTC+L1yZ22JpokNNthI7YQWrUYVfjQ5/L5p5Yp7GEFA+NGvXUmqLuF4MsTUAQVbQKuZTtaIRPacRkS5pgfWGsHGiLkvIjUd7ge3SHBFimwdfXAxlQ0BL9sEypRicLKLuxc48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770901272; c=relaxed/simple;
	bh=h29qkZux5VDZmmV0TnPk9IwFnJ36e7JPthHSSBVBuNc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JNr2WsKHj5wnCiWu3mGNXV4SGV6wmMQ5ONVWe+xAtPm3QqGPk0LcHwxRH/Qn5dJe8IlD+2ejnXtqYghfCXEB21LxDJHC7zjbtEHKf5TK5bYh00KslKbNv+bLpId3OY0B/hOgKsSAWouBHmjaOmKBsqESCMpkL5RNZObbC5FvDw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i2iMkQ7/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i2iMkQ7/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18282C4CEF7;
	Thu, 12 Feb 2026 13:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770901272;
	bh=h29qkZux5VDZmmV0TnPk9IwFnJ36e7JPthHSSBVBuNc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=i2iMkQ7/O1huaDQRmZ+TA1a/sb/MmMHMqfn8C+jpcO5APaONtO1OEJcXDfGbZGYhB
	 q9rgQGDaPPM4Z+WirZPUPQyGhU0OkwCTlgcpjS3c9bmt3q9uQ3BXJQqQyCRASUbH81
	 BNCT0yMB4Prlyyhp+fRwBpghOsO0WW0Y6VIcFGaAkN78ZgIDhacT32+i5hnuD95+Pm
	 Kgf8dLbowfcMZ50ml5NArhq1kWF9UovW7wOas8bjVrahg81UIOB983RXC79X5fZ0I3
	 8EYFHyHjS2W8nQiI8TzzEv526r1ECM6RouSO720er8I2VmVS9O0rYQ8DHz77bhJCj9
	 +YL78azsNGgRQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: "Yanjun.Zhu" <yanjun.zhu@linux.dev>
Cc: Pratyush Yadav <pratyush@kernel.org>,  pasha.tatashin@soleen.com,
  rppt@kernel.org,  shuah@kernel.org,  linux-kernel@vger.kernel.org,
  linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 1/1] selftests/liveupdate: Cleanup kernel optio
 CONFIG_LIVEUPDATE_TEST
In-Reply-To: <51f77faa-5d8b-4e8b-8cfd-04ae06726864@linux.dev> (Yanjun Zhu's
	message of "Tue, 10 Feb 2026 10:15:07 -0800")
References: <20260130042840.1469-1-yanjun.zhu@linux.dev>
	<9da09064-5005-4b30-8f9b-9ac9b9858d46@linux.dev>
	<2vxz4inou3da.fsf@kernel.org>
	<51f77faa-5d8b-4e8b-8cfd-04ae06726864@linux.dev>
Date: Thu, 12 Feb 2026 14:01:09 +0100
Message-ID: <2vxzpl6aqfoq.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 10 2026, Yanjun.Zhu wrote:

> On 2/10/26 5:36 AM, Pratyush Yadav wrote:
>> On Thu, Jan 29 2026, Zhu Yanjun wrote:
>>
>>> =E5=9C=A8 2026/1/29 20:28, Zhu Yanjun =E5=86=99=E9=81=93:
>>>> The kernel option CONFIG_LIVEUPDATE_TEST does not exist currently.
>>>> Remove it.
>>> In kernel 6.19-rc7, this kernel option still exists in the file
>>>
>>> tools/testing/selftests/liveupdate/config. Thus I send out this commit =
to remove
>>> it.
>> Yes, but the patch to add the config is in mm-nonmm-unstable. I am not
>> sure if this worth the churn of removing this and re-adding it when that
>> patch lands later. Do you see a real problem with this?
> Thanks for the feedback.
>
> I understand that the patch adding this functionality is currently in
> mm-nonmm-unstable. My concern was primarily adhering to the documentation=
, which
> suggests keeping the kernel configs pruned of unused options to avoid con=
fusion
> for those running selftests.
>
> However, I see your point regarding the churn. If you prefer, we can wait=
 until
> the mm-nonmm-unstable branch is merged into the mainline. Once that happe=
ns, if
> this option remains truly redundant or if the implementation changes, I c=
an
> resubmit the cleanup then.
>
> Does that sound like a reasonable compromise to you?

Yes, sounds good. And even though I don't recommend taking this patch
right now, the effort to keep things clean is much appreciated!

--=20
Regards,
Pratyush Yadav
