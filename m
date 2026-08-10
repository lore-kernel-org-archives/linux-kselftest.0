Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1DC3E451A;
	Mon, 10 Aug 2026 14:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786372383; cv=none; b=buwhOiw5dU+s/jF8GhDNmsDtQ6xlcwn4tm5kNUxfIqud3eVKxEQwzd6fa4UmXHvcybxGZI9OFRumrdPxjY+R+U6TpjKlij1JsYvtCtSE4r34Xf1kt/gkCaDtZQkidDpfJ96fOoR0mQZbEURoggloqUNs4RYu8GYKNec5sD6+OsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786372383; c=relaxed/simple;
	bh=R/d2lcpvpJSkQHfmzKR6lW2B4LEU2QSOc9rmCLiMuPE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HIkeN33xd/3EHM4/4iEXW9nwDadIJC0iBMTG2Akpjb/+sCsng62NVK0HSvsn41SxspyoA0YMiqmfbE7GLf8H+UKwdLnE94ZZpErhrHgL7NLMgPKQrQW4iaa1G2bFnGRJ06r1gNIakM9Joh7ymf4+JNJ/Ox3NQgwPJXyG064omog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=geERthAA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="geERthAA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74FB21F000E9;
	Mon, 10 Aug 2026 14:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786372382;
	bh=7uIVb3pBwCtLVsU0jr1gQAHf4RTBRqmBVYlXYU/8v7k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=geERthAA+PpTFmyNfDaQdeEKzSuoDuJTVwT7H6zF5V6HlFC2/dBQ9P3C8k6cW6JGa
	 jW6hc7tycs7LlhhU/AVkDBW5wSGXisuUIujZDdvgu37kX6mfmJKaHUu3oiipryTdp1
	 c1eSJS5Jlr+NAsLHPLcECkc8XMIVRxrp1g+XVeuH+RgIbEthmVbFkJDvDj4jlT91O8
	 iYT+GZRTHRrDkpiAmKcIpIojcwFHFiz6xE2IAsq+nsLZ/a4TLmdOwVjR1IEDeiRfST
	 n7e4KwGCgV9JasdMICKx9HlsQuddRi8si1XVLcqYLeOl72HlNLUQbi7vcwKYywritQ
	 QH06O/xCgxe9g==
From: Thomas Gleixner <tglx@kernel.org>
To: Lei Zhu <zhulei_szu@163.com>, mingo@redhat.com, peterz@infradead.org,
 dvhart@infradead.org, dave@stgolabs.net, andrealmeid@igalia.com,
 shuah@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 zhulei_szu@163.com
Subject: Re: [PATCH] selftests/futex: Correct pthread_create return value check
In-Reply-To: <20260727030832.118316-1-zhulei_szu@163.com>
References: <20260727030832.118316-1-zhulei_szu@163.com>
Date: Mon, 10 Aug 2026 16:32:58 +0200
Message-ID: <87mruum4f9.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Jul 27 2026 at 11:08, Lei Zhu wrote:
> From: Lei Zhu <zhulei@kylinos.cn>
>
> The pthread_create() functions returns 0 on success and a positive value on
> failure. Modify the return value check to correctly detect failure cases.
>
> Fixes: 14d016bd7282 ("selftests/futex: Refactor futex_wait_private_mapped_file with kselftest_harness.h")
> Signed-off-by: Lei Zhu <zhulei@kylinos.cn>
> ---
>  .../selftests/futex/functional/futex_wait_private_mapped_file.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/futex/functional/futex_wait_private_mapped_file.c b/tools/testing/selftests/futex/functional/futex_wait_private_mapped_file.c
> index 2a749f9b14eb..e6266c8a357e 100644
> --- a/tools/testing/selftests/futex/functional/futex_wait_private_mapped_file.c
> +++ b/tools/testing/selftests/futex/functional/futex_wait_private_mapped_file.c
> @@ -62,7 +62,7 @@ TEST(wait_private_mapped_file)
>  	int res;
>  
>  	res = pthread_create(&thr, NULL, thr_futex_wait, NULL);
> -	if (res < 0)
> +	if (res)
>  		ksft_exit_fail_msg("pthread_create error\n");

That does not apply on the locking/futex branch of the tip tree. It's
fixed already.

Thanks,

        tglx


