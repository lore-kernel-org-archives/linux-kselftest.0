Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793295544;
	b=isuPYOBCxPQXOPFpKrcE4EfN0Tw4F7MKSz6vtSOFC2ITD8p2TxiLUVFlwgQTg52McHgM
	 XEuQO+wySBj1VSGU49PMzwTX78zRCqJ2us9o+v0tG97wN6L+plehGwbCwK1CXsdaDvds6
	 MgvOBLN+Dgtr3+lzwJMRLRuv5G/UoV7gqikKdJu00NuJe87oNibVBKkws6eOSXVaOTd0w
	 UT3s1MZVIw9+pkPJJB/lefNDTsvQDlBDFdWVzyDOpRD9uKzBMfze+C/8l/AHjkH499Br6
	 O+AKRA4rrEaKzAJVG9EZwyAVU+gI7NBGCNpMUrLdfoSV1MqJ3KfvdN/8Sn1kY5i7wzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793295544;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=Jwr7+gsDEjWEWTazKCxtGdB5hpvNjduMsc+c5tQ8gvA=;
	b=bEwhOL3y+X9QSkYPwQ9YdOS0Y6MRdMrA6RGubDk2xYVP6aYy9zhcmosHe5fI7ZUHah+v
	 nuBXMdQSEoEzjhuRaYp8po85TOo1/JsCRsVDpzAiGtQMot/mlvUL5LXhfGnLLL3QUAlFr
	 t94/Y9GhcVb3OPVdLQN4u0SYv2zejNE8P9KEyfH0wdG4mNhShilNMUntJif484dhe6ot/
	 WBW8DD7JD7YFOzYfKOTL0lSqmqxc4POrPPqS/r742QRWCYYcVxIlNRb/O4cWnutCiWktM
	 Fw26eMzxtJwbRRB7JQZvIgooNFmTEzU/aqCVwIjpm6K1v3mtlrgGWY9fet5yfqOxFgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=weissschuh.net;
	spf=pass smtp.mailfrom=weissschuh.net;
	dkim=pass header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=lfMJ1l4T;
	arc=none smtp.remote-ip=159.69.126.157
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DC9606A31A;
	Thu, 29 Oct 2026 17:39:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1DC9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=lfMJ1l4T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1793295534;
	bh=/wNwz2uzvVb4Rpl7tQNzem1YDRRBhl2JjFlBYfMtqYE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lfMJ1l4TeItKvQIWdxU3VxFcJu9HkO05TOqU5ULH8WfsbiUY4XPEd0Ve7Qv/iPyGa
	 8AcxsySbLy1NrN927xHqimxEgU3dx/BnDKBBE1QLI97IjG3xHokW2e5I6Fw4OIJPLR
	 N/YEmPbv2UKbo0RLcMiO/DVp6VM8o55cDK5Hbpqo=
Date: Thu, 29 Oct 2026 18:38:53 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Danish Khateeb <danishkhateeb03@gmail.com>
Cc: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] tools/nolibc: fix fopen() errno when open() fails
Message-ID: <e7898648-5934-46ad-a4dd-94d2bfe258ae@t-8ch.de>
References: <20261028200743.154151-1-danishkhateeb03@gmail.com>
 <20261028200743.154151-2-danishkhateeb03@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261028200743.154151-2-danishkhateeb03@gmail.com>

On 2026-10-28 15:07:41-0500, Danish Khateeb wrote:
> When open() fails, fopen() passes its -1 on to fdopen(), which sets
> errno to EBADF and so overwrites the error from open(). A missing file
> is reported as EBADF instead of ENOENT, and a file without permission as
> EBADF instead of EACCES.
> 
> Return NULL as soon as open() fails, leaving its errno in place.
> 
> Fixes: a009a0c6faa9 ("tools/nolibc: add fopen()")
> Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>

Thanks!

Reviewed-by: Thomas Weißschuh <linux@weissschuh.net>

> ---
>  tools/include/nolibc/stdio.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/tools/include/nolibc/stdio.h b/tools/include/nolibc/stdio.h
> index ebdd413d13ec..00a95a267d90 100644
> --- a/tools/include/nolibc/stdio.h
> +++ b/tools/include/nolibc/stdio.h
> @@ -79,6 +79,9 @@ FILE *fopen(const char *pathname, const char *mode)
>  		flags = (flags & ~(O_RDONLY | O_WRONLY)) | O_RDWR;
>  
>  	fd = open(pathname, flags, 0666);
> +	if (fd < 0)
> +		return NULL;
> +
>  	return fdopen(fd, mode);
>  }
