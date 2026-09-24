Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CB541F7DE;
	Thu, 24 Sep 2026 19:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790278187; cv=none; b=i3uCyUrEU1il1p35pIFZPA+W6+5mXxI5q4Q8X7Uz4M/NNhOZW6RlPfzqce10ByfHHNCJWxBPkkdHdF/k0u6MGC5WYaOZrIEPEJjao0JZEyqeOBA82gs901c+b044vABWozT/2rI6Y1dLnh5yNCC36aKzH+B1he8K12Dz8HLIUIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790278187; c=relaxed/simple;
	bh=M1lsxIL/2IL4doIfEi3/p2wMJzNcTgPBz5Sr+95DIF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F/ytcJCjW62o99EdPPwfHXyfMCCcreyMbrdCuB3QRmdIdKUg3knOYJ/80T9Qifk7Y54laIWDkSnc/F/V+tkNzH47g/wPjkLk8RisTLINAKzlIL4ngrGcMz/ycbESrubIfiA6zN4sTCWp4kblzJS0yCNi/O9UV28sy2bvBeIS0m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=bAfciQh8; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="bAfciQh8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1790278175;
	bh=M1lsxIL/2IL4doIfEi3/p2wMJzNcTgPBz5Sr+95DIF8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bAfciQh8ufJtT6JcK2olGLbxOSxQgAZaSBTnrRQ/sIUWvWxnU1pewo8VfGW4jSfSM
	 +J2Jc/DN6EGjy9iOIMTTd6D/WhWtvcTcTMPaj5lwQ3gicrHRUrWFJcR4TvFW2S+hM/
	 JPLvWX+5HMYch7DuDOuk8av8Cic1i2gzc80MV4F0=
Date: Thu, 24 Sep 2026 21:29:35 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Danish Khateeb <danishkhateeb03@gmail.com>
Cc: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] tools/nolibc: fix verrx() and errx()
Message-ID: <4215a112-138b-4fc9-b958-a0ac112cee83@t-8ch.de>
References: <20260924120958.23698-1-danishkhateeb03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924120958.23698-1-danishkhateeb03@gmail.com>

On 2026-09-24 07:09:56-0500, Danish Khateeb wrote:
> verrx() passes its va_list to the variadic warnx() instead of vwarnx(),
> so errx() and verrx() print their messages with the wrong arguments,
> and can crash when the format has a "%s".
> 
> Patch 1 fixes it. Patch 2 adds a nolibc-test case for errx(), which
> would have caught it.
> 
> The series is independent of the readdir_r()/FD_* series [1] and merges
> cleanly with it.
> 
> Tested on top of nolibc/for-next 61fb00d6efee, on x86_64 and i386, and
> on arm, arm64 and sparc64 under qemu-user:
> 
> - nolibc-test, all tests: no failures with the series. The only
>   difference from before is the new errx test, which passes. It also
>   passes against glibc (make libc-test).
> 
> - Without patch 1, the errx test fails on all five. On x86_64 the child
>   is killed by SIGSEGV.
> 
> [1] https://lore.kernel.org/all/20260924015222.31693-1-danishkhateeb03@gmail.com/
> 
> Danish Khateeb (2):
>   tools/nolibc: fix verrx() and errx() message formatting
>   selftests/nolibc: add a test for errx()

Thanks!

I picked up the bugfix. The selftests looks like a lot of additional
code for the value it provides, so I didn't apply it.

>  tools/include/nolibc/err.h                   |  2 +-
>  tools/testing/selftests/nolibc/nolibc-test.c | 47 ++++++++++++++++++++
>  2 files changed, 48 insertions(+), 1 deletion(-)
> 
> 
> base-commit: 61fb00d6efeeeb9fd65c81db3bd8b2ac140f573c
> -- 
> 2.55.0
> 
