Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792594516;
	b=Rj7TPp8wS7xCo/wBvWd9B4s8kcOGmFmMekHzU+TWahrZH0rX41nOSaT0H24Y0eq9QvG+
	 Y8WfJU5DtB4R68fcqFFUhGRN52p6tC6IP13Gv1KDEF2ZzXFtPx3YMEjxaSqBI0uV5CUmo
	 wyYaIZIYDABQsTaroYrXPOXrZBMT8w5vd1A1TxB1CiTl2UP8xm50pnUBTnnkh0S+JZM3n
	 ynZmvXO3UmCnb9qQBBSgxlSVjS8aS2p97fMDsUTrpDScfg3kD7b5MULkF4tgtHULfmCK1
	 T3f9rM47hGhzOf93jnoyK9pK9JrR+t6Nie9wPDoQy0/nv1UGlU47AsafTJN9cSzfuqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792594516;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=DTnZOneL4PMu8XoXZjbkX+6/k13bvPAdWUl/Ap54aVI=;
	b=KTP5MVwCul6KVGmy+fkbiBP34wxgJDpl+d7eMQSIGyXwJpm8D5pw6CkBAO6ZyHqDBnSv
	 ZVBnwuBH7CzoCxYBhSuxQQBYhVDTpaDE8FSdYxXOFXffLPMgO1/rdMbJ7D3uHnDxp+pF0
	 8ctG8rgEWRS+gV0uvKm23UEOvaXIcvN3XkHZ1D4CQTy8lUga+d9j1UHghlEWVuw0F/gcO
	 7qdqZlob6QIAKYWijyXWWDy91Exng7JB9mHaTt9DaOoaN9nnRBxF6bwg00hQUlkjphPMx
	 ct2WdFWx7/7a//2xd7MgkDz24frsctdbpU4RiO8zfQj4hH2PktxE35i95qbejBhYXNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=M8+POkKx;
	arc=none smtp.remote-ip=74.125.229.139
Received: from mail-dl2-f11.google.com (mail-dl2-f11.google.com [74.125.229.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4359F606A338
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 14:55:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4359F606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=M8+POkKx
Received: by mail-dl2-f11.google.com with SMTP id a92af1059eb24-149f2b3f25dso126312c88.1
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 07:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792594515; x=1793199315; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DTnZOneL4PMu8XoXZjbkX+6/k13bvPAdWUl/Ap54aVI=;
        b=M8+POkKxPXsKEjqsml/3a+mXvMk+h/ukjuakWI8fUHVQbYHJwyf0YOC3xc2r7uBiqC
         qXPZYumpPiCBLVeQyOk3ZynkPWDe3I1g/zKZHPkHjCzCfXo+HJvj55hFG/+T9D/O76DQ
         CaHKVfBWwjLu70HyK8rBOl+gQH6O7KlHuiPEnLYG51ioFigVdgeJZekzO2skZYAcxycQ
         Ol+T+CYjoPP4C8g2TiUKx8uE2rzIwiWgq6MdXDTdlME5A6vCbMG7Dg1IzbEbiBlLv10E
         4SHEuzh9hdkp9r5pSiwrA6f8XNPQlFhK2QhwToXzzjeC94fbwJi4Cild7Fi4+SPOrSG2
         AtCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792594515; x=1793199315;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DTnZOneL4PMu8XoXZjbkX+6/k13bvPAdWUl/Ap54aVI=;
        b=vYk3qTlSxyKxcKss5EIfCpohafi36Jwnz/ymGe6ToGCswLogBSw0OqqWIMywzSPjTR
         v9Zep12JtPrISYjuPUPcl4WRbC/u+58FXyC5hjdzcoK3TVv5GW14atvcRgGjoxQJ/qUE
         fx1SGgufH1RNVGeKjjanE/sW3Z5oRPqOeaWcpQp7UZQJ8s43xTRHNsAL7zJoEKxg78dr
         CRg9MZtqjZ2nZsZyMmMBYRilbVkSk/Y3GWLD4uJMK0n79OvtANaf+M1Elfs/Uaj/F69w
         DEgoXeKx9d9N0vTVLuPf2vQAtPjV9/++k8sZBI2LemP23AUk6z5VwoQZQE8dJ3vamACC
         NhGQ==
X-Forwarded-Encrypted: i=1; AKwUvBz77owBCHRhA62vE6MqcYXSMHh8A47d25/9MGQx2ZYRGdxXCY4ifx5PjICpBp8kxZ0Yn76MJTqM5aFa8BAGmH4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJIo6EycIbpqDnq9g5gmjoK5vHlIbJSXia2hFkjsDXaXTvMEeBR
	H4OGwJ1BP8odjENj2R2lOVJmXq6Xmt8TkK+v/dyd70BW+tPkX1JLMeef
X-Gm-Gg: AYBFou3kY2LueoSgjwc2s4A0OeduRXNRyAh6kufVuTYtzHjPvqbqpgTGiv/fYpZ6e3P
	hhAhr80n0V5+HjtpWkWyGsG+1T6ifem0aX4Ikf2G6puvvyxGoyR/UtSCVc2KCAduTEH7n4pZB9W
	bt+Pu6KXQm10vbI3qUh/ewUAOdiu7JqPm5wvXeBEFo58IWwzxKFIg6mNw34hMzszfJ9+slIKsph
	ijP5Ly8ahFiI5oUEWyELm1Gyi7m9jJmSBxJ2zIaJBX1PmlMOzjXeJ/CxpW+nT8AguozMdlZBy9c
	WAiGUrSXRK8TIYf/RXZbe5w7QMfnQw41U3VF2ShLPKN3G3+AuPI/uuN5a70ZhEzq/oiP0TcQjge
	p5liIgNdj3076vs1/W07YN+8wnAM4R4l5cGl3eKK5FWBNVwSPL/ymdauj7CHJDe/Z1CRUB9PjWG
	MGLnfNAKlwxQQiN6D5bRz8s/qnjPqhsNtcubHs687RT+TNMhWDfEoVscTa6lKrautoJ/Xq0+ofc
	PZMr271bockPXmbHrDW4RBJOAfYvo3crp6P/fx3zXd/vP2q3A==
X-Received: by 2002:a05:7022:4589:b0:143:2719:566e with SMTP id a92af1059eb24-190a728a556mr3628729c88.42.1792594514995;
        Wed, 21 Oct 2026 07:55:14 -0700 (PDT)
Received: from localhost ([2a03:2880:9ff:42::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903b3d0530sm7236819c88.11.2026.10.21.07.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:55:14 -0700 (PDT)
Date: Wed, 21 Oct 2026 07:55:00 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>, 
	davem@davemloft.net, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Shuah Khan <skhan@linuxfoundation.org>, 
	Bobby Eshleman <bobbyeshleman@meta.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Breno Leitao <leitao@debian.org>, thomas.petazzoni@bootlin.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net] selftests: drv-net: devmem: Skip when hugetlbfs
 isn't supported
Message-ID: <atjSKD3o3_dQm7tc@devvm16445.scu0.facebook.com>
References: <20261021090852.996899-1-maxime.chevallier@bootlin.com>
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
In-Reply-To: <20261021090852.996899-1-maxime.chevallier@bootlin.com>

On 10/21, Maxime Chevallier wrote:
> The devmem selftest requires accessing /proc/sys/vm/nr_hugepages,
> which is only available when hugetlbfs is supported. This isn't the
> case on all CPU architectures, for example it isn't supported on ARM
> 32-bits on cores that don't support LPAE.
> 
> On these devices, the devmem kselftest doesn't skip gracefully, it hits
> an exception while trying to open the nr_hugepages file :
> 
>   # Exception|     _reserve_hugepages()
>   # Exception|     ~~~~~~~~~~~~~~~~~~^^
>   # Exception|   File "/usr/lib/kselftests/drivers/net/hw/devmem_lib.py", line 36, in _reserve_hugepages
>   # Exception|     with open(NR_HUGEPAGES_FILE, 'r+', encoding='utf-8') as f:
>   # Exception|          ~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   # Exception| FileNotFoundError: [Errno 2] No such file or directory: '/proc/sys/vm/nr_hugepages'
> 
> Let's check if the file exists before trying to open it, and return
> immediately if we can't.
> 
> The _reserve_hugepages() runs as part of the "require_devmem()", that
> skips if devmem itself isn't supported. Before the blamed commit, this
> check was done prior to accessing nr_hugepages, so the problem wasn't
> showing.
> 
> This has been found by trying to run the selftest on stmmac, on an
> Altera CycloneV SoC (Cortex A9, doesn't support hugepages).
> 
> Fixes: 8ac4255c1e0c ("selftests/net: devmem.py: add check_rx_large_niov")
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
