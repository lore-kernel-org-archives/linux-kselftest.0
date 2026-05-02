Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B0629DB86;
	Sat,  2 May 2026 02:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777690620; cv=none; b=d2+spNCoTiqm0TKz/fpnNhzF9Q36dRSUhKZWgPuzlzMBFKfC3G6m0NtJY3QLM5e8pjkevk5ChQNc8jq8tMFmLw/lfK7YjfY8LDxQ/bYReWSeDIpvz+luBODZ4frOHR8Ik0ojrnKVAjnDyD1hflzFnSVgwZ6Bc1xNxLg/zXK4JoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777690620; c=relaxed/simple;
	bh=6MVjPCNpgQqVU9SXicKa3l3PnR35h9jy7An9u7iWfZc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LrxkfwwWTnmBtOgmqHYwiDjqvtYehc7C2A5WoPEhWTnPqQdgt9tuOFAMr2zK3oRb+76t3xCCi5DD4qht51UK64h6w5I22rG44R4Ervfm6cZJ2ejk1Gd9lWjjCCrj6TafXPRhcnBLs+8cjRqSMDG5qH/CcDbfpdzJ/yEgRKms/pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=Pk3Ody+O; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=GpCV5M8K; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="Pk3Ody+O";
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="GpCV5M8K"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1777690617;
	bh=6MVjPCNpgQqVU9SXicKa3l3PnR35h9jy7An9u7iWfZc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Pk3Ody+OxuIizQ5+4H6BoeB7UUCyoULAslHzCUi+UBmfAa8BFa9Pqt+XmXJvcVq8b
	 XTqs+nUbnQNKvHp7etFowG3JafSJV0LqG6FxRU7VcNOOmwxv6eg6lQwMn36TiU27dY
	 coM0GhCxyaY3Ow8Uxml1A910GU/ip0iqr9Ob4LYeBbw6gErH4z9enLvjdiVliwiXdS
	 jrdQ0O/8ACXdesAG1Tyj3rsAPZCO5N7BQAHkFDjQLkPV17MNBWiPBhJ3aBeDN7GpJ1
	 5v6jsA//9l7rMs33yAVdsKLJqtQbniA8vFDRmGqnqGZR2HHW9SZb94H8lv36RMvN29
	 cuJHO5JFUj0yZJIGhbG4gDE684hOMt/8F35MujYXSeYs4aAfT1hMXX9PzFKO7ADGP2
	 qmJ2opeWoKTkAz/ZaC140Wl+Nuf6AqfAQA2/HdSoGj4vka14Qg5g94KI2VYTyHGvyL
	 Boh37yj+jBeDiJ9iBD2cPn/7/qWcwFAkKbqju5/uzEYG/tLFOnQvKV4Ey12KoQDbj0
	 weWi2/HNaWgbcZmPPi9zFqWymYxx70yFjyWyaliIm4+0UqOSeFxPxafU8atWOpu5OC
	 1ll6xZVEqowV5FCXwCpgQq1GOWJYuMg0Sw9b/IffZmaE2y8VTU+1c3F6SRpsnIX5wU
	 wDzPcxABQLV1N5wgNKPhMtH0=
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 7ADB41E86C8; Sat,  2 May 2026 10:56:57 +0800 (AWST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1777690571;
	bh=6MVjPCNpgQqVU9SXicKa3l3PnR35h9jy7An9u7iWfZc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GpCV5M8KytOSRYZEcsfpG1el6yvUhHegPvKUlO7CJ3xHuUKXp8YfCqMXvim979lSc
	 3c7L0VVhPGgw6Cu0+SSXWtOxXmcDSQXBXxeH3ONN21fZHRZx5IXtgEBzzVJB5fNcdq
	 jugkCDcjNmJkYN9vZ9cgbKYKygLOLhtFNoHYFYjPRDoYGjJealhGhbYAeU3dbR0DBq
	 bz7f1+k1YMW8HlNM43XCqHceEkXhrJ7ubCFv13MU91LplybtnlSfo2y8vR/J4yK5yi
	 qBscx8XHMkj8utNbWvOt4x8MqddZ8c5uXQYpHT+16tZrEtYTobuyR1CvWIiUABsskY
	 pOG73lrQ42VzKkc6TMcjNpY6h6ZvYjS5U1xTFT8TUr+oXht8Gb6CCh9mVCcu/APFPm
	 7ixxSaBh5vJGLoxRTrybBwcaTcVeNg72z/fu7cVG/0GiTA+0GDTPyrg1mtKJqadvla
	 2ZSs1ePqPWoYBcWjQLoq/smBRkni7ZmLcHgOi4GsUSd5hueKFcTQz9uCtFlcGcaAp7
	 xhiPKDXJWwBDiHmxtOeZJRVpOnL+95Og8qUZ61I9tnec5XWVyz3DtEtOzzK+CVMaqe
	 VlxlMj79vIs+MGV0Q6HCGdjHCWvVVuCsw/fQzKqGI1IDF7tWbqvjob5hi+i5xpUQh4
	 95m5OHJOrN22QwZ/9dYIVeyM=
Received: from [IPV6:2001:8003:8810:ea00:ed87:ca88:5326:e11d] (unknown [IPv6:2001:8003:8810:ea00:ed87:ca88:5326:e11d])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id D6B501E86C0;
	Sat,  2 May 2026 10:56:11 +0800 (AWST)
Message-ID: <131e1ff1-4d29-4e45-8f85-33e2a8983b2b@davidgow.net>
Date: Sat, 2 May 2026 10:56:09 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kunit: Fix spelling mistakes in comments and messages
To: Jinseok Kim <always.starving0@gmail.com>, brendan.higgins@linux.dev
Cc: raemoar63@gmail.com, skhan@linuxfoundation.org, me@brighamcampbell.com,
 jkoolstra@xs4all.nl, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev
References: <20260501162739.3861-1-always.starving0@gmail.com>
Content-Language: fr
From: David Gow <david@davidgow.net>
In-Reply-To: <20260501162739.3861-1-always.starving0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 02/05/2026 à 12:27 AM, Jinseok Kim a écrit :
> Fix two spelling mistakes in kunit tooling:
>    Bascially -> Basically
>    higer     -> higher
> 
> Signed-off-by: Jinseok Kim <always.starving0@gmail.com>
> ---

Thanks!

Reviewed-by: David Gow <david@davidgow.net>

Cheers,
-- David

>   tools/testing/kunit/kunit_kernel.py | 2 +-
>   tools/testing/kunit/kunit_parser.py | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/kunit/kunit_kernel.py b/tools/testing/kunit/kunit_kernel.py
> index 2869fcb19..58557c47d 100644
> --- a/tools/testing/kunit/kunit_kernel.py
> +++ b/tools/testing/kunit/kunit_kernel.py
> @@ -218,7 +218,7 @@ def _get_qemu_ops(config_path: str,
>   	# exists (I learned this through experimentation and could not find it
>   	# anywhere in the Python documentation).
>   	#
> -	# Bascially, we completely ignore the actual file location of the config
> +	# Basically, we completely ignore the actual file location of the config
>   	# we are loading and just tell Python that the module lives in the
>   	# QEMU_CONFIGS_DIR for import purposes regardless of where it actually
>   	# exists as a file.
> diff --git a/tools/testing/kunit/kunit_parser.py b/tools/testing/kunit/kunit_parser.py
> index 1c61a0ed7..0e1d2f498 100644
> --- a/tools/testing/kunit/kunit_parser.py
> +++ b/tools/testing/kunit/kunit_parser.py
> @@ -268,7 +268,7 @@ def check_version(version_num: int, accepted_versions: List[int],
>   	if version_num < min(accepted_versions):
>   		test.add_error(printer, f'{version_type} version lower than expected!')
>   	elif version_num > max(accepted_versions):
> -		test.add_error(printer, f'{version_type} version higer than expected!')
> +		test.add_error(printer, f'{version_type} version higher than expected!')
> 
>   def parse_ktap_header(lines: LineStream, test: Test, printer: Printer) -> bool:
>   	"""
> --
> 2.43.0

