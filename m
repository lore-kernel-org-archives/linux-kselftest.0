Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793295700;
	b=2kGds3ZptersU4ME0HAaOdKiM2eulI2fMVqcpyfxD0JXRgLLDZpEg2F2bCAZKscu/lZr
	 1Yd7AZxRmAoOWOeHwBt4xfVtFZaLCHFEZPqMP1GC7GOGJfDFLTZoEJjk4O77uMjiHIy3I
	 0zrMKbY8No6TG7H7a+tXRKKSj0qZKk1kk1V8X9tTPHuD0hMndm/vw2szyLwroGzqm4+6r
	 pNNqHYeXnF4hhvXK5q1I0+QvCHet4pr3UxZ7v1ZQlOWI1UgmSI9Qc9USDgTOLsLobIJxB
	 w7p7Pv5eFXP0E1EVPOCy0p0xmqYQZbsGq+rqSfUYi0TbEL3rNrC6hybfnzFVykxjriQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793295700;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=mnTCAqI/3aFZ35T1Tr0Lg3jrkeUfUxCSyaiBlqfRMgE=;
	b=ivP0MkK+RWfTCQcwhSJyGH4p5jWjayK1yxuVawNsn+ylcGgobYHdsOTMTd1MKp7eDqeK
	 JZhXiDZRJaJHZ9u4+booKRdjGs+2YL/Qn4v9DvM7uFf1hbmJGUPADahbB1JiYmbgzKRoq
	 S+dVMakR7p2TKh3TAudtrMZdeapj6y9qujncypPgTy5wn+v9fhhwpyfXuby+ehLdYWSM6
	 +QUQBcP7o1Knbe9qb8OjuoixHyl5pfI0BM8tAyhSVgMqe/BLXsQAD3QU5/3nBXS0q0o8b
	 2rSkl8ty2C4mg8g5gTX3vJWcyCIZC7J6ONULsACPBsk6Eoy3WmocbBtStn9E7CDqvfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=weissschuh.net;
	spf=pass smtp.mailfrom=weissschuh.net;
	dkim=pass header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b="RPK8C4/V";
	arc=none smtp.remote-ip=159.69.126.157
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736CC606A31C;
	Thu, 29 Oct 2026 17:41:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 736CC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=RPK8C4/V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1793295697;
	bh=80fT6/wE+Ej3xA81CGEeC2ZGrijcZBNCmzw1HOsXJdU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RPK8C4/VupiLw+vDu+Vgbo7bmAVRW1XqEZj2qK39ZSdn3d4IhIKYjAp9Qp6SPoMf+
	 tVVJW5qRdD/T0576Yaaj48mXS4LVm4hGhnK2Wwsq/qAI4B1L32CEzUoghSgX1iF+Wm
	 IFZzA+HP8WF0WPSjMKsccwaPjPzTf3gLalh0Z5HE=
Date: Thu, 29 Oct 2026 18:41:36 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Danish Khateeb <danishkhateeb03@gmail.com>
Cc: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] tools/nolibc: fix fopen() with the "rb+", "wb+" and
 "ab+" modes
Message-ID: <3de13984-b78a-465c-8a48-4e916187b41e@t-8ch.de>
References: <20261028200743.154151-1-danishkhateeb03@gmail.com>
 <20261028200743.154151-3-danishkhateeb03@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028200743.154151-3-danishkhateeb03@gmail.com>

On 2026-10-28 15:07:42-0500, Danish Khateeb wrote:
> The C standard allows the '+' of an update mode to come before or after
> the 'b', so "rb+" means the same as "r+b". fopen() only looks for the
> '+' right after the first character, so it opens a file read-only in
> "rb+" mode, and write-only in "wb+" and "ab+" modes. Writing to such a
> stream, or reading from it, then fails with EBADF.
> 
> Look for the '+' anywhere in the mode string.
> 
> Fixes: a009a0c6faa9 ("tools/nolibc: add fopen()")

The original implementation explicitly does not support 'b'.
I guess we can add support for it, but then the Fixes is misplaced
and the message needs to be reworded.

> Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
> ---
>  tools/include/nolibc/stdio.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/include/nolibc/stdio.h b/tools/include/nolibc/stdio.h
> index 00a95a267d90..205b06f18b4b 100644
> --- a/tools/include/nolibc/stdio.h
> +++ b/tools/include/nolibc/stdio.h
> @@ -75,7 +75,7 @@ FILE *fopen(const char *pathname, const char *mode)
>  		SET_ERRNO(EINVAL); return NULL;
>  	}
>  
> -	if (mode[1] == '+')
> +	if (strchr(mode, '+'))
>  		flags = (flags & ~(O_RDONLY | O_WRONLY)) | O_RDWR;
>  
>  	fd = open(pathname, flags, 0666);
> -- 
> 2.56.0
> 
