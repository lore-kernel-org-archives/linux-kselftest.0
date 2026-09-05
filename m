Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B981A358D00;
	Sat,  5 Sep 2026 02:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788577101; cv=none; b=sD2OBkd4jkTkFkYT+Yi0S3WYrkfLIGFxhdqcJbkyspUcttu7wMrZA2wejzN7ZoCRu0Fy1Pvxu83oUjzJYOncPxMUfsK/fFZkIB3bEPMghr6b569eD/oK6dpGxk2IRIK4dZSjEUAF0wIE6b7SuFlwv5kusGceHYSXW5H+pO9nvrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788577101; c=relaxed/simple;
	bh=c/ZRYHFwwl7P9ymT0f1zQ+VSU7PAgEnEte10astEePE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=arIgCmkjKVawRx8PvgfqbMklvVjosHHt3o8+IT2UUGikWtnS0n7U/Tr5Y0lpg42qBaKWQODT5ZNwa76P1oMq5bJzCTkogPEhWjya0MtTV3QHb61PNopiqlh30BFeiKGZvU/ta8fgTj2DcfnnpbKAIH3kKEX77iDRMP81yaYZGRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=r0GTWO4b; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="r0GTWO4b"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=JRuv1iNzwrkzYPanlW1KF3I/WUjJp6LiVqQvqYh8crA=; b=r0GTWO4bt/7blNhWIfG/B131zR
	t4Ws19Qith2ad1L5E/CM5hcTqV1nEVVTkwiculx9GeyTS5AU1K9viG5x1Dj8w3eu2T41D9iLJ/EaX
	CNmWWdiSZeMF8FS3Qn5kVteDPUnq+eKdUbWTOddhSkzLZa3Kxr61WNUk0PdPAlwtc/PZ+TDNGH158
	MQwzNhSUxWBLkDCvF+e198+rvgv9AoenzsDiijXe/S9anz2mzng5HB/zcGu3F7D0ZPvRT+Yno14TI
	HG175qtSkTS/Mgrh3LO43dU4ULWIdyvVTcsEcwxAZMAAMBy4nU2Etcj/g6ylhGjXidB9as2lNAkM4
	trQAN9Zw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2gbe-00000003cUV-1RtA;
	Sat, 05 Sep 2026 02:58:14 +0000
Message-ID: <0bff3cf5-0d85-4ebb-9fdb-7fb5d12faf49@infradead.org>
Date: Fri, 4 Sep 2026 19:58:13 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: KUnit: Fix cross-compiler prefix examples
To: Karl Mehltretter <kmehltretter@gmail.com>,
 Brendan Higgins <brendan.higgins@linux.dev>
Cc: David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Tim Bird <tim.bird@sony.com>, Harinder Singh <sharinder@google.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>,
 Daniel Latypov <dlatypov@google.com>, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260905025126.83693-1-kmehltretter@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260905025126.83693-1-kmehltretter@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/4/26 7:51 PM, Karl Mehltretter wrote:
> The GNU target-tuple prefixes shown in the CROSS_COMPILE examples are
> missing their trailing dash.
> 
> Fixes: 46201d47d6c4 ("Documentation: kunit: Reorganize documentation related to running tests")
> Fixes: 957063874c76 ("Documentation: kunit: Add CLI args for kunit_tool")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  Documentation/dev-tools/kunit/run_wrapper.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/dev-tools/kunit/run_wrapper.rst b/Documentation/dev-tools/kunit/run_wrapper.rst
> index cecc110a3399f..9221acddf3fa8 100644
> --- a/Documentation/dev-tools/kunit/run_wrapper.rst
> +++ b/Documentation/dev-tools/kunit/run_wrapper.rst
> @@ -189,10 +189,10 @@ via UML. To run tests on qemu, by default it requires two flags:
>    Kbuild. As a reminder, this will be the prefix for the toolchain
>    binaries such as GCC. For example:
>  
> -  - ``sparc64-linux-gnu`` if we have the sparc toolchain installed on
> +  - ``sparc64-linux-gnu-`` if we have the sparc toolchain installed on
>      our system.
>  
> -  - ``$HOME/toolchains/microblaze/gcc-9.2.0-nolibc/microblaze-linux/bin/microblaze-linux``
> +  - ``$HOME/toolchains/microblaze/gcc-9.2.0-nolibc/microblaze-linux/bin/microblaze-linux-``
>      if we have downloaded the microblaze toolchain from the 0-day
>      website to a directory in our home directory called toolchains.
>  
> @@ -293,7 +293,7 @@ command line arguments:
>    - ``sparc64-linux-gnu-`` if we have the sparc toolchain installed on
>      our system.
>  
> -  - ``$HOME/toolchains/microblaze/gcc-9.2.0-nolibc/microblaze-linux/bin/microblaze-linux``
> +  - ``$HOME/toolchains/microblaze/gcc-9.2.0-nolibc/microblaze-linux/bin/microblaze-linux-``
>      if we have downloaded the microblaze toolchain from the 0-day
>      website to a specified path in our home directory called toolchains.
>  

-- 
~Randy
