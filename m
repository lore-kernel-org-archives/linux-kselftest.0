Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E1D17A30A
	for <linux-kselftest@vger.kernel.org>; Sat,  7 Mar 2026 00:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772842339; cv=pass; b=W2N83OjIdwbhIuxfKVXkQQcRagh2y87p8PX7tPiYuuEJC0T6yeHJWX27H9QfLVrFifV6YfegpuKK7hPyCDoe3DHNOq3Hu2vYiyIHJtSdK0ug6NzLHeXHr9BkEZyOWJL9q69iM0ZCb8S7pwtIKiWan4tXbKNRfGOUI5z8CfOfBrg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772842339; c=relaxed/simple;
	bh=biHPkTU5i6uzovfZilTp6Jg8ImXxZbG2QoTFU8Of71I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OIOdDLETIqvBSw9Odk/RHFi5HsanjkB5+DTLd4PP/9hALAUvBE0aXEtC6GVH0hgJiLmTAwoH39hjs5tr9zcs+jzLh/FJCGLm0LBKN+jsKCWVJycLLjGOY31Q1z/HHmqnZcDgerqsTh9EMCdPHwtZj8uGEVqixnJbbVc1DpqgB6o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g7Fo7lsK; arc=pass smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g7Fo7lsK"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-48371bb515eso144787895e9.1
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Mar 2026 16:12:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772842336; cv=none;
        d=google.com; s=arc-20240605;
        b=aEx4sabq0F6Dj1cPPnWB+dndD4gGdNojq/hAaOIPmFUw1w8zqQIFk8NFfi2OTjf6dd
         EUq1r/7yJs/Z4u8Ye0XClDefd+vCR4JioxNAXxIFnqwgM6AQPX2PMLG54f5/noG+nnFW
         QhRW0ztYgNG/J3eBXVkwkS3qlZg2lwsqrZcnEVKnakJBKBofhwwdM20F9HmvkTrcB6zH
         WZHALRzypRgMhJRc6jjxj233AWySDqY0x+zW6P2DZRcI4NFm4ceH5c5n74ahNe6FuBLe
         ePln/CH8XPdkgbhAa9OPgOm83+Yah9n0QIoi+aMMiVHG3vDcKMl4hPfUkqQ5ApEuL5Fv
         eSDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YuW+ZEOlwWNjJXkfhiPp/nzopgzeOmjwPNaZQSo9JBY=;
        fh=KC3ZLIfw2Bz301DTCqW0H6ig3ZYnHJcFu5oUH/1d39I=;
        b=ejjE+MgeV620m2/HNvocjy3mXfEfLQOEtMj50guYhbg0+ACCrX/yZKq7ADj7jhPgPZ
         NQR0K6BL9xE4mY5RkYYbHR7KkesNm79+na1JPFnm+OYto07wkRpjulHZbYi+izh//oK2
         7Z/gmqZk3W/eV2D0+uVf+nUYllGXcLSnszo7k7CMKsBjC9ZmxhUAs8QGM9pAd3vYRfPM
         QckEVDcx6f8Y5SRMAesufc4FLlpKI11rHTVmrVt8Hi7abhKYe653DJSjoZtVgsR3CiRN
         UYu4eS26yNZFiEQGOezuqQPzf32SxcyEojbxTvYAw35JfGur9uwlhBt4BoERewEaSdrd
         gXQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772842336; x=1773447136; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YuW+ZEOlwWNjJXkfhiPp/nzopgzeOmjwPNaZQSo9JBY=;
        b=g7Fo7lsKJDZ8xF48d4hV+racf5b5MHUz6e6GjY0ZGuS+ubW4YfqeSsrxCBg7sJ1fsA
         HW9Db3McmIQr0urmvhQp67YEhwtLfsJKke42DLAYNNVH8VKlIZxH4pn7XZ3gdvR8WowM
         Jbe0MufS1Ngwj0me99x/czcSE7mYGkJtbmVENpPePRPJaeAQigdLiO15aJf6fk4EznA5
         ybqbhSTe5VFgUo623cF6U1bIBCJRuO5DYdYhe0xoKcnmycl8BdZL1vg6YP08AeMPs8gZ
         xqq57Deb8VjBkx9GZsbEy/B814YRUIR2yGZDoau+UYDwhJ1JAetrct1Sp4FwVhIYBWIq
         mPdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772842336; x=1773447136;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YuW+ZEOlwWNjJXkfhiPp/nzopgzeOmjwPNaZQSo9JBY=;
        b=iX05chgN4l/RXg8gmyOwfZyGKrZEaZ81h+STmYig5ZcqMTQvFbCq8xEhqIm0YgpwU7
         446PbWA/BVySZyiySL5klKTk3R3wND1xZeprKPsY+25/m8kfG6E0g1sH04qCgbcEmLEP
         DLvTLYRYEzHOE1Fly9u+Di6Tia5yk2w5t+8RsI3bBqzzWOCWNUbz7bZrqpeg+8WZNVg+
         +cMqJYC78EpaqlZ5bzPV0aYxL1DJb4m6/pD8txM62Hvubs4sc2A0gjsgCoMois4pr2mO
         GIxWuP3+mN42AKkXZkpnH1wh5mQdBWt1WJ/CNSkfCV0cFQ3Y9Dl964N4SRSjYTK7urLY
         rZJg==
X-Forwarded-Encrypted: i=1; AJvYcCVOAH+FsmdYxgn0/RR0mrGhkMMSZJglKdgyIV5OYoBdJC5eGvgWDfYGR3cLQ2tZDu9mG4PuLBwI5/4i1TvcedU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSdCRIaMcmJWo+9fgY1zEoOVNMZ/NXV8HFBaAibWkmIWIXA/T/
	M2PxoDqH9A/dDnb4woxK4U7dngYmmrrpWqHosDMyxoBXg3a1cnsqWYngkuE/ikEnmW1xlZZEEsb
	mjeOP7geK10XHM+UwYgtjwoyQSGVrr7Q=
X-Gm-Gg: ATEYQzxiZ+kG5a5XASO7OrJF3TlJct6GEa+mZdwIDnk92Xfq0ls/AUXP++U2d+KVsjs
	TCqE7cD0p+dYaohre+81TzbHJLcU7tCrw8mzo5XoKOcghBHW8cAM2gHjUPEJtAYzc3JMldTN+9p
	Qke1nlUIvFDSAdV5SnWU3Mc6vPb8ckdC5aPolqFJNRuDP9TWNqOMD59/Fss0CFSaeDlVCOC8HxK
	p6Cg9diJhqLGL78JXHb68svnPdbpzuTeuv60SwL6ZZDk5uglYaCDCZM/u/xST4EelSsRMg+pGw3
	20g6+eGIP3PBGJ/6L0KdnuszZoFO51lMTqI47G6eu7muXqxg2W9QUlszOB059MXrxdw8Dg==
X-Received: by 2002:a05:600c:c4a3:b0:483:9139:4c1d with SMTP id
 5b1f17b1804b1-4852692c943mr69335975e9.14.1772842336318; Fri, 06 Mar 2026
 16:12:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306083330.518627-1-sun.jian.kdev@gmail.com> <20260306083330.518627-2-sun.jian.kdev@gmail.com>
In-Reply-To: <20260306083330.518627-2-sun.jian.kdev@gmail.com>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Sat, 7 Mar 2026 01:11:40 +0100
X-Gm-Features: AaiRm52kGwLc-IqCrj2d6kwEzwvV9YuXEYuT-7l1k2Hxe9AYBniYOwy9uAhAEZ4
Message-ID: <CAP01T75bQ-OAGontunAfAEP_zaJ+gLY-+=6U0ZHkJ4DasTEBdQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] selftests/bpf: drop serial restriction
To: Sun Jian <sun.jian.kdev@gmail.com>
Cc: Andrii Nakryiko <andrii@kernel.org>, Shuah Khan <shuah@kernel.org>, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Mar 2026 at 09:35, Sun Jian <sun.jian.kdev@gmail.com> wrote:
>
> Patch 1/2 added PID filtering to the probe_user BPF program to avoid
> cross-test interference from the global connect() hooks.
>
> With the interference removed, drop the serial_ prefix and remove the
> stale TODO comment so the test can run in parallel.
>
> Tested:
>   ./test_progs -t probe_user -v
>   ./test_progs -j$(nproc) -t probe_user
>
> Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
> ---
>

Acked-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>

>
> [...]
