Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793586571;
	b=GTWaJbMIOZIcK8JheQwoFm0HFsgk+LOjOEjJ/Yp06RswiDAGtsYegNl7Kx+jqHsmPlxo
	 YLb35uxJc/aAGu0YpJnjfAy5fOKgGSIBR5CmgKA20GBel65XpQddk3NpclDnNdnDJt2Sf
	 oWfjwGiKeI7ouRe1SzLh3TeSCeH68h3KVXaqDFJN3uakCdk5hnqNLB9rpPQJ9KJ+AAdth
	 mGQNI/7wUi3SQeMq0D9/eebvtNE0ezN0IICe9ZiMHspoFRPO4UCUkjxLq+8FYAklv05Rt
	 d8QFSvtEsN99vreha8afr/bmrSUIKhE49+0w+rsk0XjV54yXCu1eQUsbuKN3cguPHLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793586571;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=kso31XZigTt7QqahyAFgG02jpOLCF5OLAroZ6bfw3ks=;
	b=AsFaBEGUwi7m4GOs3zyzaV/+vZZUnccu/qtp347TkCuoFjurckXT5qpPwRSdK+ZIGDuN
	 KXLsNXgiNY4YqHQu2hPDzB4KcLeevynrDJs4yNB8ziw5UNW+Sm4dKjSP3gGbZ8LN3SIXe
	 ckgqg92Pbf7FP2tcOCvWXnHeMNRZFy7GDMwpjcxPoo5M9xHUg8+d7yuz6SmVAdK+Cwoep
	 uEjq0f8CtoEHs8BmoI6TAp7okZHxkgoWuTAGQXDRJWzjnDPGA1MpdHtiA6l1OFP5VQkK3
	 O0/NkaVlR+nuMCTSr/kMhvCeYMGOFzHUwyVJKqiuqbQ76G4KtCHMg/5JTSslaGaDI0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=weissschuh.net;
	spf=pass smtp.mailfrom=weissschuh.net;
	dkim=pass header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=H+j6KVTI;
	arc=none smtp.remote-ip=159.69.126.157
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3841F606A330;
	Mon,  2 Nov 2026 02:29:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3841F606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=H+j6KVTI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1793586567;
	bh=DY03OZ+abHZ+01IxMlgIKBJQkUPEBZryRu9oAZtWZ/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H+j6KVTI9KaDeyKx/t2/CrVSgoVXEoqoQYwgWTFrn0jQZ3ArDmGwFjbmoClrkqyPg
	 PU8BCdYy42/1QdLHmp+np7Mr6A9mAJyhHGdI40vb88KiZ1OYtp+rVRdE01XP+k9HPO
	 sYKMN80qRPAVJi8hdIqREQygmwirYcyxBHaqEy0c=
Date: Mon, 2 Nov 2026 02:29:23 +0000
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Danish Khateeb <danishkhateeb03@gmail.com>
Cc: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] tools/nolibc: fix fopen() errno when open() fails
Message-ID: <87844555-1275-4846-8270-54a3ea0e89c4@t-8ch.de>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

And applied.

For the other patches I'll ping you when my fcntl() stuff is in.

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
>  
> -- 
> 2.56.0
> 
