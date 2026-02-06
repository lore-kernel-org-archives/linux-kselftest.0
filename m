Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E022C2374;
	Fri,  6 Feb 2026 22:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770415587; cv=none; b=fBcM3rtyAwkybrmfS6Z0kAPEUH7/dbazPP7uC3qIM5fgWMvd1RI+t0fErMztDIx3H2wbwH171rzoehb0r3mv0frfru3iqwM0WQ4xpsq9R25Hz1cp08mEJlGVREBlBYVk7c/vUvs98AraValSDAwBTBsLwsDwbalA2b77ghdsLb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770415587; c=relaxed/simple;
	bh=0ms3/Jxex9AmT1zDq8VfFE4zQD5zB3PK6GtE9pjSjFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d35we3o4NnQlXz26B4fCbdtuBjDGhHpxNDULhyaS0Louwf0zKFRhhleUCIcby1vaG1Ae0jQMmvvNy7+///iJtMuFf8qOWgMBQTOdYvQQlwIffdEoj1bpcrs5FoAtAaqA+f3LFQw2Hw3iQKFobB7StwGTYsfatLEMzu7hNZylWps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=f7JDhqA8; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="f7JDhqA8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1770415585;
	bh=0ms3/Jxex9AmT1zDq8VfFE4zQD5zB3PK6GtE9pjSjFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f7JDhqA8E/GKyiN5O6Nc5+kweuaZmOkfhRb3N1XBQhk44tf6sQ6ioWU//8NEHQxqD
	 kOsbUHZ6hf+lSzuW9Hk3OnfvzPWUc7g/hRYYjwGgsEAsl2ozyKaq7cmVClKRwx95Ui
	 ZPosWRbf8+ruPP2RQyqrOjQB0oZyiZlZVEnO9NFM=
Date: Fri, 6 Feb 2026 23:06:24 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Jordan Richards <jordanrichards@google.com>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Mike Rapoport <rppt@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Jason Miu <jasonmiu@google.com>, 
	David Matlack <dmatlack@google.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 2/2] selftests/liveupdate: add end to end test
 infrastructure and scripts
Message-ID: <98e953ed-616c-4684-a8e1-87195349ef4c@t-8ch.de>
References: <20260205222329.2419035-1-jordanrichards@google.com>
 <20260205222329.2419035-3-jordanrichards@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205222329.2419035-3-jordanrichards@google.com>

On 2026-02-05 22:23:29+0000, Jordan Richards wrote:
> From: Pasha Tatashin <pasha.tatashin@soleen.com>

(...)

> diff --git a/tools/testing/selftests/liveupdate/luo_test_utils.c b/tools/testing/selftests/liveupdate/luo_test_utils.c
> index 3c8721c505df..100dc0f69f37 100644
> --- a/tools/testing/selftests/liveupdate/luo_test_utils.c
> +++ b/tools/testing/selftests/liveupdate/luo_test_utils.c
> @@ -20,9 +20,14 @@
>  #include <sys/stat.h>
>  #include <errno.h>
>  #include <stdarg.h>
> +#include <linux/unistd.h>
>  
>  #include "luo_test_utils.h"
>  
> +#ifdef NOLIBC
> +#include <sys.h>
> +#endif

This should not be necessary.
I am actively trying to get rid of the checks for the NOLIBC macro.

> +
>  int luo_open_device(void)
>  {
>  	return open(LUO_DEVICE, O_RDWR);

(...)

> @@ -45,8 +50,8 @@ int luo_retrieve_session(int luo_fd, const char *name)
>  {
>  	struct liveupdate_ioctl_retrieve_session arg = { .size = sizeof(arg) };
>  
> -	snprintf((char *)arg.name, LIVEUPDATE_SESSION_NAME_LENGTH, "%.*s",
> -		 LIVEUPDATE_SESSION_NAME_LENGTH - 1, name);
> +	strncpy((char *)arg.name, name, LIVEUPDATE_SESSION_NAME_LENGTH);
> +	arg.name[LIVEUPDATE_SESSION_NAME_LENGTH - 1] = '\0';

FWIW we are currently working on "%.*s" support.

>  
>  	if (ioctl(luo_fd, LIVEUPDATE_IOCTL_RETRIEVE_SESSION, &arg) < 0)
>  		return -errno;

(...)
