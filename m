Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4903B83E8;
	Sat,  1 Aug 2026 19:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785612043; cv=none; b=KDhto2a4g1EcDDgwXsQwmSDJptYplcaYp5JXh4VkiYwKWCZgHUPbwwskyaJ2NNdNGxKdS0QLmh4rwqA49P6xF+OJgKrrt3nzenZ3h0X8eYeIDzVua5ClScaFR50G5huKpMAeOkR9cuXQ7ae6cNWoavTPrMKT3D0JCMveiyVqM/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785612043; c=relaxed/simple;
	bh=PkXqvCPOIHzPAEexnUBpY9r9FPCm6YqVxG0ma2E3da8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y0mPasrkZMYzpmaolsjhfhDjcj2eUI1SXCgGMJdzycaEKK2I1VyIa1BEDzZ9RtZY0Mc7KYO6gKhz8cgQV/kEwoSxbY5qRNuFFG5MsdzT2eOKYfX1qm4ozvt1Ybv+bOWj1YIsid60fjw0dC+FNlEVkE600J2ZkD8VKlbMrNMD4qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=Sqspk5Gf; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="Sqspk5Gf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1785612035; bh=K9tlO0ZkBk2yvfe+BKMQ1qTTt6YehKBDmAjmhVL+sfc=;
	h=From:Message-ID:From;
	b=Sqspk5GfCqLTUpttW9lpJZ4nW4MpdbgObpGYeqGfR9LjmM5DTr/u9ojNPH7MfPKZJ
	 w9uqX5XB9onEiNLzpAIapci1ODd8gkSnFwpmL6xcQ+sPvvjwH50zQs0mvu9uBbkM7Z
	 /WnYJfBcHe6Pc5GOiwdMrxwgtv5LRpto/eXtFarI=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 8FFEDC0ADB;
	Sat, 01 Aug 2026 21:20:35 +0200 (CEST)
Date: Sat, 1 Aug 2026 21:20:35 +0200
From: Willy Tarreau <w@1wt.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Shuah Khan <shuah@kernel.org>,
        Richard Henderson <richard.henderson@linaro.org>,
        Matt Turner <mattst88@gmail.com>, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-alpha@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: [PATCH v2] tools/nolibc: add support for Alpha
Message-ID: <am5HA7UbmUEEChZc@1wt.eu>
References: <20260722-nolibc-alpha-v2-1-4970e48eb7bf@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260722-nolibc-alpha-v2-1-4970e48eb7bf@weissschuh.net>

Hi Thomas,

On Wed, Jul 22, 2026 at 12:07:05AM +0200, Thomas Weiﬂschuh wrote:
> A straightforward new architecture.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> ---
> Only tested on QEMU so far.
> Testing on real hardware would be very welcome.

I'd love to, but last year I could fix my serial port (replaced the chip
on the motherboard) and the new one died a few minutes later :-(  I'm
starting to seriously suspect a flaky PSU that doesn't regulate its 12V
output well and that is progressively killing the mobo.

(...)
> diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
> index 996e8d13508e..66accf99f560 100644
> --- a/tools/testing/selftests/nolibc/nolibc-test.c
> +++ b/tools/testing/selftests/nolibc/nolibc-test.c
> @@ -756,6 +756,10 @@ int run_startup(int min, int max)
>  	/* checking NULL for argv/argv0, environ and _auxv is not enough, let's compare with sbrk(0) or &end */
>  	extern char end;
>  	char *brk = sbrk(0) != (void *)-1 ? sbrk(0) : &end;
> +#if defined(__alpha__)
> +	/* the ordering above does not work on an alpha kernel due to STACK_TOP != TASK_SIZEi */
                                                                                   ^^^^^^^^^^
I suspect this trailing "i" is a leftover from an attempt to switch vi to
insertion mode :-)

Otherwise, while I'm not competent on the alpha side, it looks clean from
the nolibc perspective, thank you!

Acked-by: Willy Tarreau <w@1wt.eu>

Willy
