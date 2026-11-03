Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793738050;
	b=caiwDtIpYg6r78RTynrPuX6wIDpICpYIgwNw7PxV75L+RXA5vd9CAHg3OoU+9a+v8zAp
	 wuNZLN6VJ1WMmYluFSO2+60jiI+N9qi2yM3tz9T0bDAdSztnRVpvNGwEQKqHzvww7kNsj
	 IRbwimBhk6sZ+SqYdcqXHlq7c/87mvHzKQ8F4kcD9UwmdrVvNQdk2Wh8tgaYHkceshLlK
	 FFccAZjIhzenSIAeCu7fNbnAcSEn53O9Sk2NlhONHDGOWEFpEwJVzpYIUKVxwZJ8fEj1T
	 OZXDsIaJBSa2ef2IZdzh99y5ljK4t82sMfJYKLMp6RFZKQuo0WPGgCM8iONThqx0s+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793738050;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=dNjq2OxDVtbu8F9xl0nqlhF7Q6giPt5SRyE2tzpRWmQ=;
	b=kdWZ83Wd3bKIyOwL/SC8MOpvvYeuCt3r3caS979FylEZSWAX0YqJKb46jDR1DkyrWMu2
	 nkAgeKbDogRrUpqtYYi1eldzGFU0b/rQ3scKY0YZjGVpH8xEZ8fSAlZuQZHgpaCZ91Ptv
	 bLqKXSpJe22DrjE5gsVjiLKWn+y9LqdJqXf3zUDjkuBAixaqOT9nkQICj0WXjtk1R1J2o
	 VmoFajXPFN7xNBqLjCPJ+ewQ1psUfTY8XDJ+PHKzV6T6jHUWXm8T8J5UAVbvxLuaPrXwv
	 kuSqP6lP2ExuVReT+G3Y1ht/+XsMKgibYdrj3RKQQ+SlDk56+DpI3RI3Nqv5F4NzqVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UWXAKpab;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264E3606A329
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 20:34:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 264E3606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UWXAKpab
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so32077135e9.1
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 12:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793738047; x=1794342847; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dNjq2OxDVtbu8F9xl0nqlhF7Q6giPt5SRyE2tzpRWmQ=;
        b=UWXAKpabW7n4FQOPPPF0svuPcfJ1+lbF/6LldmOQX8FUE3AwCxbl4EQ2MD/7z3T0LG
         kyfXvLfhChBscW4Kg0gq9jXN/BcVcD8RGQ9RNsnZTAVvEns0JPRgzD96cPSBT4mAV60x
         xTYsry0bqdfVVSL4DK5PhIvfcIyJKAQaIkX2zLbgzZ3/vrpFH2Y9hsEaECR0cxCqLmc2
         04XY/1XM97cVRyPPxGlvWFbEcRNi0DEAH5uie568rx5C16IQwYXiPaVQT/AmYXg/oE8C
         6QrhtCYf6CqL6zTK3B7msS7WRpUMJeOoqmI/GbQ3XtqZkQbRQ+NUZI7Jn6FYAkOtzO1X
         TnhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793738047; x=1794342847;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dNjq2OxDVtbu8F9xl0nqlhF7Q6giPt5SRyE2tzpRWmQ=;
        b=bk+5bAJb6qMDsyoQw1qaPT9Xvt4QUkyuhPaFvDHCJoWJjRNOBuWv5nth8bCtRTqXXL
         XSg1dVF9MiO1xVUlPxs6v8O6EFiX47CHnJY5JTYqqCDQSheEs77dkZsR57lzFhj9AFIT
         kwQ6MOzYqh2+e3YT8sp90fW6ZfL0e4FtF/TsevVRHUB/pzFn17kBH/eyBBQJO1Cs9Zs/
         +oooIBhIg8bzidlO+uCubnjABeKkz3NNdja4Sa/a7u0rpiWVi3SIK8EhhcJvpKHTpq77
         s60iePftWMXlwPu+OLUZELdHOJG5g0gN1Jy00iQOguU1DRm5BO5WbWaIWWU1css6ID5V
         YuQg==
X-Forwarded-Encrypted: i=1; AKwUvBy1JopT2ND6gkNwMoLobYCXtxGwUcUaiIZhMgTA/BszxdpoRHASpssRY+vFsTnV3f8BO2WUodhV8JNnWim4X80=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dGSwE4P405O8xE+JRTv5YJocxI91O4Sjcocl0TC5k5peKIIKN
	FPyBga4Onej1zNU0lHq0HLHotRO3Mv3hdB0MztKJq9j6O+lpDzxJ3qVI
X-Gm-Gg: AYBFou0fXK57tKA05fOXX//ZkMRzK80v4X9O3fw4o0AySucrRuDNLKpXE9MR9/klvqt
	ikxIs+E+HFGnP9OGiiyRJWXb2iHYotzEYpkjNaeSeaLnJO4r2y4mztyyg9tfYRjKgKGrEPHmCV+
	PFYig/V8lj6X4zNQazx2JKOPCgA/KNm0m+qAB8mlQKCEm/Bs5cEKBAFwuvldvr7tY26lrlc4TS1
	KphXbfTQsLbcQ/WJW+50oxGIUUajyQHav5AuQBVf+1PkN9oy0FeAFK/qbUWLbyLuWzSyCEJER8z
	jUvCLWbi7qp2TmpY8HNuqxzCO7rL9Rtpj2LOZv/2DsLyq/L+bQy/pGHX8dahwRC315QMPmg3n2z
	OwjvxSC7vBMvkj/IiezVDA/tXm/KBHdFoxSZYBv+dMo70/eEe+iW2zwnIO8PcNNnehRuy77/4Ix
	RlQjZqZA/0AoEbtyqo2Ui5hsvjos/80yBnGUKAwgLHy7vnvyZ6zHsLIhA9FVy6wxM2xtPQvEu1/
	8pODf13O+zQba+cr07c+wISITGhdBNEfQVnUDcLfd7zral6L7y/xDphuBOY2yq9RXb+/UpXZJBB
	2YpqQSaXgEvCjE2DQAfJrWVWRSB3v5VAsPLx4ebWvvA9COFPwF6P9Q==
X-Received: by 2002:a05:600c:6099:b0:4a1:992f:d0e7 with SMTP id 5b1f17b1804b1-4ac180f2ac5mr302267155e9.16.1793738047466;
        Tue, 03 Nov 2026 12:34:07 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fcd03d01dsm479666f8f.44.2026.11.03.12.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:34:07 -0800 (PST)
Date: Tue, 3 Nov 2026 21:34:05 +0100
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: Sasha Levin <sashal@kernel.org>
Cc: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	=?iso-8859-1?Q?G=FCnther?= Noack <gnoack@google.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-security-module@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/landlock: print st_ino as unsigned long long
Message-ID: <20261103.96f7e09c16ae@gnoack.org>
References: <20261103155512.535137-1-sashal@kernel.org>
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
In-Reply-To: <20261103155512.535137-1-sashal@kernel.org>

On Tue, Nov 03, 2026 at 10:55:12AM -0500, Sasha Levin wrote:
> On 32-bit architectures with a 64-bit ino_t, st_ino is an unsigned long
> long, and printing it with %lu warns:
> 
>   fs_test.c:10511:57: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type '__ino64_t' {aka 'long long unsigned int'} [-Wformat=]
> 
> Cast it to unsigned long long and print it with %llu.
> 
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
> Found with a 32-bit build of the selftests with a 64-bit time_t (gcc 16
> and clang 21 with -m32 -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64);
> KernelCI's 32-bit arm builds show the same warnings. The changed files
> build without format warnings there now, and the x86_64 builds don't
> change. The other selftests get the same kind of fix in separate
> patches.
> 
>  tools/testing/selftests/landlock/fs_test.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/landlock/fs_test.c b/tools/testing/selftests/landlock/fs_test.c
> index f725882fa4a78..a2dc9a7f0481a 100644
> --- a/tools/testing/selftests/landlock/fs_test.c
> +++ b/tools/testing/selftests/landlock/fs_test.c
> @@ -10508,7 +10508,8 @@ TEST_F(trace_layout1, check_rule_fs_fields)
>  	ASSERT_EQ(0, stat(dir_s1d1, &dir_stat));
>  	snprintf(expected_dev, sizeof(expected_dev), "%u:%u",
>  		 major(dir_stat.st_dev), minor(dir_stat.st_dev));
> -	snprintf(expected_ino, sizeof(expected_ino), "%lu", dir_stat.st_ino);
> +	snprintf(expected_ino, sizeof(expected_ino), "%llu",
> +		 (unsigned long long)dir_stat.st_ino);
>  
>  	set_cap(_metadata, CAP_DAC_OVERRIDE);
>  	ASSERT_EQ(0, tracefs_clear());
> -- 
> 2.53.0
> 

Reviewed-by: Günther Noack <gnoack3000@gmail.com>

Thank you!
–Günther
