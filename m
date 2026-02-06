Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C125226D4CD;
	Fri,  6 Feb 2026 21:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770414937; cv=none; b=oiaQWHIlaMTCnnRopfNW9uH8iOHHoKMcZpJdtRVidcFO5aXwjqhjb9DIBUhC3/zyB9N+0iShQikGzV2Rk8hi8tz2KZCoGpVZGwzeJpoB8RU3fgcGHhKQQUaEV5VmmfaCZmLL1Xj8gBNXd3LNBG4+ucHOlYvrX+X3yymQtHCoolQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770414937; c=relaxed/simple;
	bh=rMFN0NlTz0fAsXU+PIK/v/nmJI2k2Us3Bgd4+RQXh3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yqb8MZASdm2lXb5jT+gtS69oJBuxX+/Z/mLpYuQb5ZYMQbGiic2j6BXP1XPBVHuVf7kxyDjQm159BZZp9EN4aHYHxDAtSAcfe2kTEtxHZegXztXUgUuHnjwHohEhlnQ1ov+PAdZV4mdbgV/XuI/YW+kz+/pant2i0d8zgpUO8UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=fdNIJB7F; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="fdNIJB7F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1770414934;
	bh=rMFN0NlTz0fAsXU+PIK/v/nmJI2k2Us3Bgd4+RQXh3I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fdNIJB7FIvtFm3J6JQ0v2iYLkGIjAdVY/1wUa/FYxdQLo9VgllRDtY+NP0E4zOnJ6
	 jV+0SafEsgAPXPE0rNeY2lhdFw9uWYKFCaA/Kmkf0qtI34Uyjg56cY1TRjZJjS9auu
	 NxDQ8jNHZaalhZScvsgEWjBAKa2F4xiEr9wwE0G4=
Date: Fri, 6 Feb 2026 22:55:34 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Jordan Richards <jordanrichards@google.com>
Cc: Willy Tarreau <w@1wt.eu>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Mike Rapoport <rppt@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Jason Miu <jasonmiu@google.com>, 
	David Matlack <dmatlack@google.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 1/2] tools/nolibc: add ftruncate()
Message-ID: <ebf0c9fd-9c45-4aa2-8cd7-fe8d5956ce52@t-8ch.de>
References: <20260205222329.2419035-1-jordanrichards@google.com>
 <20260205222329.2419035-2-jordanrichards@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205222329.2419035-2-jordanrichards@google.com>

Hi Jordan,

(please Cc nolibc maintainers on nolibc changes, I only saw this by
chance)

On 2026-02-05 22:23:28+0000, Jordan Richards wrote:
> ---
>  tools/include/nolibc/unistd.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/tools/include/nolibc/unistd.h b/tools/include/nolibc/unistd.h
> index bb5e80f3f05d..845d10f48fd0 100644
> --- a/tools/include/nolibc/unistd.h
> +++ b/tools/include/nolibc/unistd.h
> @@ -48,6 +48,17 @@ int access(const char *path, int amode)
>  	return faccessat(AT_FDCWD, path, amode, 0);
>  }
>  
> +static __attribute__((unused))
> +int sys_ftruncate(int fd, off_t length)
> +{
> +	return my_syscall2(__NR_ftruncate, fd, length);
> +}

off_t is now always 64bit on nolibc. On 32-bit architectures however
__NR_ftruncate only takes a 32bit value, leading to the wrong kind of
truncation. Use __NR_ftruncate64 instead where available.

Please also add a simple test to
tools/testing/selftests/nolibc/nolibc-test.c

> +
> +static __attribute__((unused))
> +int ftruncate(int fd, off_t length)
> +{
> +	return __sysret(sys_ftruncate(fd, length));
> +}
>  
>  static __attribute__((unused))
>  int msleep(unsigned int msecs)
> -- 
> 2.53.0.rc2.204.g2597b5adb4-goog
> 
