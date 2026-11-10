Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794277261;
	b=v43lmxM4vNyvRnyPnUzD1Cccu2HYALTsynaZsN4/cEkYW16oDkWYBCLUXkdZTMFoc20c
	 lKutoIrwDbeD7UH5fuc9TXNT04yBTyVm/lM333DxaLcT1NPTjVHsBp8IIrd1WWXrajE1u
	 L8KifU9dqmDxHm9DrfjULcw+wubI1J6n34K8qCiRJeXpaUfuVYgzDBEJXD1rLW2jed/Cl
	 yIwPLbSRI63fo6OsHjuJhmsTP5+vlkXkIXR1hnYno2l/tsT7dwG5A0qiZs+9AhdPOCe/M
	 2c8YCKk72XOsAJXaOD+UpM3l3YK9UMojwXrj9PUGNcNLyQH+L9C2nrb9u6U8Fe58+5w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794277261;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=i2TUUoLgA3e8WVIbMjVbQ79gxzJuaS9VusLU6Lxc8WM=;
	b=0KBAYFtVnvJddUlBhg4zAgbkCBtzzGgDewe6OBzq4DqeGeodyG9eHb23QnzG+r4ZpZd5
	 8Kc+LJqVsJ/5cMZUJ4eFFwOqHWcAFD9EQRClpKGugdkAPc0z+rss0Z56XYExoQA+Yv+3b
	 PULixjPVYcY5zS7XPifd35RPsF23HShwd/gyk/tOHpnaji2/veClH6QDtLQpLvvXdN7FV
	 JrQxHK1iZpL/28Aj6wD+BT1/BTFvWJ/jlAWFFdoZnsK6etHKYzL3lhuc2dKbJJKE0H9FT
	 RDUS2yrPFW3zsRyb5jPUzOgqk3QDpK+ItUdk49Q9KGwt+0ilNDU3/SqUSwpeQP3ubdw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=efz3coOY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49367606A325
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 02:21:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49367606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=efz3coOY
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b58cb69927so2488431a12.0
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Nov 2026 18:21:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794277260; cv=none;
        d=google.com; s=arc-20260327;
        b=nWLRqlikypEx6QwQZFDIGOn+79xpPd959FxZb9Bo7XY902bdjvL3tj1vd0orZO2/Aw
         uIdvggeUz7UcUC8mtiwGudbQWfiXDoG+jntNwzNldegB5XeqRsIeFPJFW2G6zdEMMiOp
         Y0mYY7OfRzBmgp4JUcqu2T15c0jMXc+Dn+7EWj3dKX13EtfdBZZCMhXLn3HHXmpLg07I
         kDLvgwR9kyY3xzAyZ2Oa6MiL/V1ZFuob9Lm8WTWmP0yR7YkupKLTc89hfcd+KK1UMZEf
         XCZwb0ewszd3dley/MzgBxeKboROgUfWpGob7OcP0b1BqFSSYrSqdOWSmYNCfzrmbWoh
         F37w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=i2TUUoLgA3e8WVIbMjVbQ79gxzJuaS9VusLU6Lxc8WM=;
        fh=z+mlmdOuCyO9oCZja4fAYUEBcsPQH55QZQh4z5Mk9tE=;
        b=DJugop4MIicM2b38ML/lBEgj3cVVosDiKRV6MirvOdUju0OuepUUwgS1YUEjhDnTl1
         Bfp+FQQOESKuuwtd0w0rU3n/9YWyjVBatZwp29B9dYfVy+/MRj0xNeWcG1K9zqWnGcTy
         x5B5NGB+SY/0dR5i6Ie7jWNN/4ocSLqKN4ripFPWDc/2kwW4pZlkE5oR4lWMt1866/t2
         C5iuag9sooP7ZszavsgrjiqDG1vtUJe3XaRiqDXSnv9V09HlU4Gjb8zKQVQ93PQnN69P
         zlgYAqPcohvRoojXUrhyZJDj2Rbd/simydSYsCnMDmO7MFG6njl8eS+cY7zZYDzn9ZDK
         0qXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794277260; x=1794882060; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i2TUUoLgA3e8WVIbMjVbQ79gxzJuaS9VusLU6Lxc8WM=;
        b=efz3coOYSr2KjjBCeYtKdmztxPfUZXzmrZuhKN8iiDgBLAigWmRiYCMi8U0QbFK1G0
         cgzKVwIYUXlzJNoBP9wkRFTO/NMb5iqX8ff0GwpBcU9XLNZHjPPqPJ9UtZAzS7VRSNU1
         n5ltnJfdV+WaC+/GQjIHySvCuQ28At27/U10uV6UMYYNX6IaLFonSsffccyXk2BH4HXy
         vfcyxnTGPNSOB6v0f9db9LOG2hWN5Z8JWccLFuV4wctFy6yMgxwXjeuqczcPsJw3Ir5B
         Z1rb50JDKHOoz9Knj2obWH3I7N4IiObhZqVCf658cSxTZUX6KIZi1a74c0FLbTO/Rpqc
         ak5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794277260; x=1794882060;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=i2TUUoLgA3e8WVIbMjVbQ79gxzJuaS9VusLU6Lxc8WM=;
        b=XVyR7ujMK3cs1xuZn+KXBmOGAApJC1aURjM3NwNDDRVpYKnJVW6PYPz20H5Ex9NNJI
         yHl8NiJKeLav5BpR/jytdt7QjejPka85eZWEhdw6HVOd/DRY1pdnkQ91sBUj5Abkrq5+
         Q2L/bg+sm5PTpMMtkLthRkoz1QZXt0YGupBZjSRXgByy9/KpEiWDhudajLUWzdYx2TT7
         XNmkcDziSNKp6mRpDIM3yfdRRfnE7hDji+24blFmHRsV/uet6mzt8JQOYmuHxMdCbaOb
         OFNwuFFF9YK47eCtoqLNRz/LIHw6YYWHI+Ek8JQSomHy1nYtuaq0Kns3YSgNVU7VGIth
         SqpA==
X-Gm-Message-State: APuU4Z8t1YB0uTo5FaWj6Nqh4CLwHfzApCQtj7spcyfGgQPu6AFPW4Aj
	e1UvjhzmkbXtSaCRN+FtHx7PW/WdZ4BdaSLLMpECHECCbf8M6B1xWBt+GtWOTpNe+8t8knb+KKy
	WHyxikUcu+sG2qPspz2qmQOgLHR3lLpQ=
X-Gm-Gg: AYBFou2QjWyKcDVSQz5nRLI/2y2EQO1JT3u3msOdO6GWh/wVwrl7w3C5pKbd78NwN7+
	HJj4/8vK3XVD0nZTUgWwjFT2qYThmBo0ro57SOWqxDBwW778JOM3ItoAs1kivid8T7Q9myGEaDn
	RIt7EP8cOKgpfTh032M5zJUm4aaKfDXw8Vj0Wkwtnz33wwsWF4hADs5RSnoORX2T7/GyQRe/ttb
	pPQUxpo06W7LrY5l10ooe+0spxgNdpmHEe2l9rVlnMOjg7urScAJZ2UK1c8SFSqIWnb1eHsIzv+
	nkipNhtqDRZgffRmCwuvNLuxO1R5HUFaMnm+KpS6JoNAQ4Ud+EP04ZAvNfNBDJGibRFupQ60xoP
	D0KZfuh3tfOecHuzf+DmyRqhPzjpVkaLDibQxCaw=
X-Received: by 2002:aa7:d492:0:b0:6b4:8d5c:f8b with SMTP id
 4fb4d7f45d1cf-6b75721866amr598705a12.15.1794277259463; Mon, 09 Nov 2026
 18:20:59 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110021622.122490-1-technoboy85@gmail.com>
In-Reply-To: <20261110021622.122490-1-technoboy85@gmail.com>
From: Matteo Croce <technoboy85@gmail.com>
Date: Tue, 10 Nov 2026 03:20:23 +0100
X-Gm-Features: AclHuK8bXRdvgJU8KghZLOhvBMXkdeeRv7iNqoGqP4IMZRNV45bXoFiMpjug-xE
Message-ID: <CAFnufp3CwHWxMj8pPPsgEMtCtjUxbwn1VbFd2OijqB8+NA0Ccw@mail.gmail.com>
Subject: Re: [PATCH v7] kunit: memcpy: Add benchmark
To: Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Laight <david.laight.linux@gmail.com>, 
	Kees Cook <kees@kernel.org>, linux-hardening@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

+Cc Kees and linux-hardening, as per get_maintainer.pl
