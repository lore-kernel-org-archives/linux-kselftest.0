Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E94842087C;
	Tue,  7 Jul 2026 23:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783467109; cv=none; b=CLC+X2KZeErr1o7FNU0a75eQhjZxVmEjalzRJd6FLVwsARLpPYsm7sd4snf3W+1MbT7shPBpqiXIzja5CLr+qhY/SF6jbouOckNo5vY2pYhDUakd2ZD01InmLnnAGlp4kEXJFovSXa8VzBDm9kvTTMMJZUb3SlceV8YTXr382vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783467109; c=relaxed/simple;
	bh=1o9GasjyRG7VkwsP2i9tjfr6NHhBE2xcqSB732UHFu0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=unu/NCjP0PEeoclwP8DL+jDhQQah0Ui0GcgYb3ceWpxMahTlwAZhwR+mQ2/0f+I/BQ4s8q8WG3TTnVqfA8fUFijk6GCVRmO3sDjCylBysMu4JRTTHK3u6uJ8YCIx9Tnpo/891Idd5ICaRlmGnzQ7sP5tbh0YYeW5kBM1jIQArCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XL08PlqP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XL08PlqP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69EC61F000E9;
	Tue,  7 Jul 2026 23:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783467108;
	bh=dkTHGFBJaM/pBTpgRVxWI+W9Dt9g2gJVwODYrceqbmU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=XL08PlqPsErNP7eaBtBzkDZPcg4RtirpgjPyQ392NkdWbT4E/K60tsAmRUiXc5YgV
	 zXfDmab8IM9jjIDl0WV8HA7bvshNN8xLDyV0t/hKMdY3ltX1OJ18sQECakZfcBQy4x
	 oJpjyRHRCcLkV9kaVvwqwzjL1oHVt+WtUh+ykjh0ZC4lgimcwzAQ/UDDQifiQIX5oX
	 JJVAocnGYfdjiFirMvh8A0gtUmfz3sraoQ5uQDuwO4deELyF+xx9XvKuBEXyEUbWWu
	 EpoGB4VJbDbEDEXAMnTocku71Zf/lCATDO8Vb7nGuYIJQ8ev8Or9Coe4XBm9sMZ6vt
	 zKlo99lmwmPeg==
From: Thomas Gleixner <tglx@kernel.org>
To: Mark Brown <broonie@kernel.org>, Yuwen Chen <ywen.chen@foxmail.com>
Cc: akpm@linux-foundation.org, andrealmeid@igalia.com,
 bigeasy@linutronix.de, colin.i.king@gmail.com, dave@stgolabs.net,
 dvhart@infradead.org, edliaw@google.com, justinstitt@google.com,
 kernel-team@android.com, licayy@foxmail.com, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, luto@mit.edu, mingo@redhat.com,
 morbo@google.com, nathan@kernel.org, ndesaulniers@google.com,
 peterz@infradead.org, shuah@kernel.org, usama.anjum@collabora.com,
 wakel@google.com, mark.rutland@arm.com
Subject: Re: [PATCH v8 2/2] selftests/futex: fix the failed futex_requeue
 test issue
In-Reply-To: <a8886f13-e6e4-4561-a2b1-db2bd3f77a6a@sirena.org.uk>
References: <tencent_A68F2BD3395C9EFE1759975A511BB7D9F806@qq.com>
 <tencent_76B9DE9C9FE5C57F6D74B5149970DF8CCF0A@qq.com>
 <a8886f13-e6e4-4561-a2b1-db2bd3f77a6a@sirena.org.uk>
Date: Wed, 08 Jul 2026 01:31:45 +0200
Message-ID: <87cxwys7fi.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Jul 07 2026 at 23:28, Mark Brown wrote:
> On Mon, May 18, 2026 at 10:16:54AM +0800, Yuwen Chen wrote:
>
> I'm seeing failures on arm64 (running a system with 4xA53) in -next in
> this test which bisect to this commit, the commit seems obviously
> plausible but I didn't actually investigate:
>
> # TAP version 13
>  1..2
>  # Starting 2 tests from 1 test cases.
>  #  RUN           global.requeue_single ...
>  # futex_requeue.c:28:requeue_single:Expected res (-1) == 0 (0)
>  # futex_requeue.c:29:requeue_single:waiter failed errno 110: Connection timed out
>  # futex_requeue.c:49:requeue_single:Expected futex_wait_for_thread(&waiter, _metadata) (110) == 0 (0)
>  # futex_requeue.c:50:requeue_single:Wait for thread failed

Do you have /proc/ disabled by chance or is it not accessible for the
test case?

> Full log should be at:
>
>    https://lava.sirena.org.uk/scheduler/job/2954705#L13289
>
> but I'm having a terrible time with AI scrapers right now so perhaps not
> usefully.

Seems to correlate with the test case failure: Connection timed out :)
