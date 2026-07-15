Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18362288B8
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Jul 2026 03:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784084539; cv=none; b=d6Xr1ULH3TGkuRIO87v0JBm6R2XhTpUm9+uOOLpbMWTjsLshYe8Nw1t70PgckLm/nMTYTy2fzbUFjNPU5GGbe5jA8ySqz7Et0JAopLoKSYjAu9A1nu5lkpOtY2KEn1S/5jFd8nhAQQSp1sOvOYR9j8Sz/xkpCrrCSW1HpA7A1LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784084539; c=relaxed/simple;
	bh=Pyp2DnCViCnJgUi88+R0XBfifCiYiXiV56seNpVS6sg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HkEAZH43l23272B/mbo3ybjq43OuDO9ltEcEfMZqlAGtcjIWuusLTyGVho28RNKMLsyZR51IfvzevbuskjIG041TOcvd27tVCigZJRieW/9S3BWd8qTE6ZBsKZcq7eMylh7YKRcyN23qSdPi3DTbIwTED3Jizf4xCmBgXxxL2/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=CgJACLJ9; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="CgJACLJ9"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c15b33f7b23so716404666b.3
        for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 20:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784084536; x=1784689336; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hOjABmuvBW+jCcuokYEE7Gv19LjuO15ZtZi5onZDlks=;
        b=CgJACLJ98v8bx0a5WjsLkmXa0c45JEdSrekLF6tl5Fk22ghzpLJUvgFKQNzQTq8Ifl
         /ETsYk5Eo6xIB43MhUwOTHfm6l/60rKnMk3z77HYo3eisYf7NRzZMM+qx11ZKE/B/IiZ
         vklNHjKz3M8XNO8/Ulp4B/L3Ont5OEf+hb9qmZq7FfrXmYIOgTLvsYr1mcGB8om87koA
         eNoJog5ZJsjRDPz3ZRg0hRIWoIoPBCEPrG28tjn73CcgQw9BSKK4PCVnl0TowIaMCQJl
         cKRfYR0ykvJXtO91SW3ILye1CqC2a48Lpg1PjvVqZVEEk6hLo2Llro4s7MO2IjdwzHBW
         PEJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784084536; x=1784689336;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hOjABmuvBW+jCcuokYEE7Gv19LjuO15ZtZi5onZDlks=;
        b=FxrMcZmwMTUDmEEf5af/FRkg5RsPKbHCfRRqJmZW0uzQ5XDmgrUSBiuNdbbYf8YpQ4
         s7CMceVT0nDPJAe/U/SZPtvW1hVdUPxJxrGbH7nw8uL3LgYW7rlBZDH36IT6QLFNc8EM
         2rxr1NZXUaXoOKrPwDj+2j3yEH4Zvh7u3djmDjx7QxuHoj8m1BkDLrQBNMZHJ3dGEPZ9
         kf8nT50ME/HZFFJMc3aKC6dePqmFKSPO5himPjNmkFmdk99Kw2wdCJaZTCn6mzouoVF3
         Pod0HQrSl2u23RGn4N6AvJBI+It3GUrHLaf99jy+89OA7QAxgs09NgHcqpYtiA1YtSpC
         bZdg==
X-Forwarded-Encrypted: i=1; AHgh+RqSR8+HuZcpvXYmC+5iFMudvKIDCqBrCoyIlxOGZi3V6D2uK4QPbng/nNjNSodEMOYF6dq1NRKrpCVJinQ0PTo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBwZ+5dBUi/yT3EHuTN3nmTubUHbLvW1YQtpwqcDBl/CUpwxLA
	e7MDJYnyt3PV4zukHW0sKiHNUIWdrzKSkfsCeRnpxxraXJWISY1D76+DdoIWX8zBoWY=
X-Gm-Gg: AfdE7cn5xb4WzIGvgWuU/H8ejWdIkPcw08W9yyVb/Q7UP8PMxSnM3B4j8jmRuHyGBdf
	hxpiaMUq46aR0ITgS+ZHslMTpzCn/iRuJJAgfWrGCbW0YtypnIjRd5vtzmStW8NmB20puWxUIpa
	5jON2zOtnoBQYY61MH21LU8LbvoeZWvr8VZOaQCNMDx/rEkcxNwbr4C/xks0v2qd7rkbVy7rGk1
	n7zNABK6ZjSNL3Q5K3EFdIb8NRb3djRERc2OXKjNvOcCfZNn9BIHDs0/y6qXmlE45M6qnk6R9v5
	Dbr51ZixDUYKBBjUyjrY9i354tI9pAnRkHJwltvwrVTBdbQ8pMyf/22Ya5qTt19a+N3O4EwY5Mv
	Q4J7Wgz4pMKtik/EQf9gHXX5wUilhm9T+vSzxa/kvBtYIb1/wjUcBkArt9NciRHxcj8tIKzbWT3
	PYg8HbgravagNB4W7isOqc9n0ShfMjHkVL
X-Received: by 2002:a17:907:f815:b0:bb7:eb68:514e with SMTP id a640c23a62f3a-c167940e66bmr67514766b.36.1784084536316;
        Tue, 14 Jul 2026 20:02:16 -0700 (PDT)
Received: from u94a (27-51-89-168.adsl.fetnet.net. [27.51.89.168])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a39a4a7797sm7988739eaf.6.2026.07.14.20.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 20:02:14 -0700 (PDT)
Date: Wed, 15 Jul 2026 11:02:02 +0800
From: Shung-Hsi Yu <shung-hsi.yu@suse.com>
To: Sun Jian <sun.jian.kdev@gmail.com>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Eduard Zingerman <eddyz87@gmail.com>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Jiri Olsa <jolsa@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Shuah Khan <shuah@kernel.org>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Matt Mullins <mmullins@mmlx.us>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH bpf v5 2/2] selftests/bpf: Cover negative buffer pointer
 offsets
Message-ID: <alb1fmxTl6-c-HJs@u94a>
References: <20260714093846.18159-1-sun.jian.kdev@gmail.com>
 <20260714093846.18159-3-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714093846.18159-3-sun.jian.kdev@gmail.com>

On Tue, Jul 14, 2026 at 02:38:46AM -0700, Sun Jian wrote:
> Add verifier coverage for constant negative offsets on PTR_TO_TP_BUFFER
> and PTR_TO_BUF pointers. Both programs adjust the buffer pointer by -8
> and access it at offset zero, so the negative effective start must be
> rejected at load time.
> 
> Switch the raw tracepoint writable attach checks from nbd_send_request
> to bpf_testmod_test_writable_bare_tp, avoiding a dependency on the NBD
> tracepoint. Keep the existing past-end case and add a case with a
> negative var_off compensated by a positive instruction offset. The
> effective start remains non-negative, so the program loads, but its
> access end exceeds the writable context size and
> bpf_raw_tracepoint_open() must return -EINVAL.
> 
> Reported-by: Shung-Hsi Yu <shung-hsi.yu@suse.com>
> Link: https://lore.kernel.org/bpf/alRtilWhKw4zzMkI@u94a
> Cc: stable@vger.kernel.org # 5.2.0
...

IMO it is slightly better to split this into two. First part would be
[1] suggested by Eduard, and the second part would be the addition of
negative offset test.

That said, I checked that with v5.2 we do have PTR_TO_TP_BUFFER and
PTR_TO_BUF support already (latter as PTR_TO_RDONLY_BUF and
PTR_TO_RDWR_BUF), so there shouldn't be a problem having these tests
back in stable.

Acked-by: Shung-Hsi Yu <shung-hsi.yu@suse.com>

1: https://lore.kernel.org/bpf/3430dc0a2a141769a596ab21d7abdd86a0a804db.camel@gmail.com/2-tp-test.diff
