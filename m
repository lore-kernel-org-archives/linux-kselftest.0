Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302E3481A9C
	for <linux-kselftest@vger.kernel.org>; Fri, 15 May 2026 13:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778853081; cv=none; b=DqPdA+HhpWlBSC3wjyx+jm2D3dOE+O9AsJeG2A9ldzE6dx8HiPYlzhbEOp05kNj6AFHafoHSeWBCIpHHRjw7of499OF+TLtXWozSDxHYEUpkHo/uxRBrg/+3Wp3uejoGBRvIEUA5rMgm9gmGN1OIpJsFoEXynrtUvnKs4J5BFtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778853081; c=relaxed/simple;
	bh=wgSQwV7y2dO+kRyJMQFpWLD3nIA4u4gcVsn2IUwSLFI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pOsDqDaXfebBP6d/IIQAXEZ++x1EnHeDjDkFNy0cIsoR6JYlhQkcs4XJne378lfF8tlEBP+k4rQAYRJML17OklCxnc229PcxFu1pmNxqPs6BgRXw7FKLDcOTn1Cqr/bOlF+MAbs3tmnYLmZrZDL6AXlfmo/UWHTbJ+cyTWbShBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QVYUWK7S; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QVYUWK7S"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2bcf48850c4so36969235ad.1
        for <linux-kselftest@vger.kernel.org>; Fri, 15 May 2026 06:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778853074; x=1779457874; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=O2F8t6ntdYK/5aPvjkHgghGF13JKRdZuJCFrw2MfPU0=;
        b=QVYUWK7SMMlkVxmwQPeOVpqhZ8lgPBHC5ZPb94MEaSxyCOtesLmACUxkXqLOdjOEPP
         GG8IrpTfgGNKeNzC+KiVoxbPeY2ca0qfjDw2q6n+gGsCVKIwenlOTvxss7rAh47Aeudc
         HN7jIVFJKmxDareC3d/4lz9Ox5H25A0y0glbYZjvTVSkonue5AhLa23uq10XSdQU0i/o
         w3t7s5FMJ+8YuAXO+Y74d4cQJJjkbm06UsP1zyQic77oB5k4dP9VN1H/2b64jwykwRAq
         c4YzpoiQd87BX+QuzkJjREKbgKqbcHqOZ6JrjvowMMVNJvmadPHwt0BQaabQFfOev8Qc
         RTEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778853074; x=1779457874;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O2F8t6ntdYK/5aPvjkHgghGF13JKRdZuJCFrw2MfPU0=;
        b=BDOytn8Fir/169U92CbErHi89zMyX8LlYpZQ7pneYa4UptAm3M9rAixA2aP1kkrWOe
         FiTelsWzdIRrAvr889mq84xyibIxfDQ2BMtg4qMt/PaHbOM92VhQIyQRXcTN5GrvHH8f
         oylHqFKaeTeuu06MupcFJKrZ2NUtgjuE3Az3oOnVaCaTszWZ/Fp6AgL0xzeb/fQgU014
         bSKGtDOpUJoKsWLfj/fn3vi5J6yaWXg9EFYaDri92TrXeHqjKaJTjrHXIbHCJ1cB7zPC
         paIvV70rxNPyPODycGuo+WNPQOHlynSRH/UulJTJl+ZRAR2I1hM1nQlHhQtYSoboIhLr
         kRPQ==
X-Forwarded-Encrypted: i=1; AFNElJ+5LNPJ+3Qz+/r9viJnmVSzxUVGr3192smKn8gsrsKpncLxrwcHmQvIA7ChijfN1RJEljDW8NuXMZ073RYekoI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQRweifRbDvpVBQjXSOhjcrIA+77S/g61+gBu2EZfzFxmebF+f
	kDSKmdUONvSwm3n94/l8nnzuQTx0hQgEO2P+uY6f5SnvuMVRKtQbElF4
X-Gm-Gg: Acq92OEsa3tHfNlE6D6JtLYRB6QMZnSzHE+rwOpMjgdr+zSDzNcRjwNrNkrJWtDJ6+l
	OR99ql6q8NwiSplALEGrmAxhynFYDiaeNokYVh+DaEiDveRbzq5wmvoMDEkm0N0JLuOi2zoccG2
	6iXYYo5LTHGTENyrizIi3WINb/a+cg4ga6Xriui7hRYwpEcVo0ZOwQ8NY54ICkQYDI5S9GUWihk
	pqFNx9zRbIOYPJlsUUCVqzHY5qkJqO3b24w7m39jKJKcfbGGZs9y+1c7YTz00CFMAuKBsxuS6tY
	ARbcojcUaAgM9kD8QVN6ws0nSBAlEKxmTI3j9kpVdDHlYEZvl1hFZNPhJggAnmO+3yCTFvcrooX
	9yvrbWi3ULPX/bhBgJKaKqaOS6pBoS8Kjq+8E3bnKvZ3Y9rOo3l3UNDiieL/JrpL5wdDyT/2y6x
	KZkOK5JMY0+U7/V/MJvUOuxsLBAKdonJE4XBKB2L12pejDvEep8zAMyasFlKunKvPbLPQLvurK
X-Received: by 2002:a17:903:44cd:b0:2bd:6732:6817 with SMTP id d9443c01a7336-2bd7e8d3578mr31205215ad.23.1778853074142;
        Fri, 15 May 2026 06:51:14 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0f94c6sm62848175ad.56.2026.05.15.06.51.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 06:51:13 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <7bcead90-7d96-4101-bd13-dde2c5ded1aa@roeck-us.net>
Date: Fri, 15 May 2026 06:51:11 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 0/4] kunit: Add support for suppressing warning
 backtraces
To: Albert Esteve <aesteve@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>,
 Rae Moar <raemoar63@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 dri-devel@lists.freedesktop.org, workflows@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
 peterz@infradead.org, Alessandro Carminati <acarmina@redhat.com>,
 Kees Cook <kees@kernel.org>,
 Linux Kernel Functional Testing <lkft@linaro.org>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Dan Carpenter <error27@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
References: <20260515-kunit_add_support-v13-0-18ee42f96e7b@redhat.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260515-kunit_add_support-v13-0-18ee42f96e7b@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Albert,

On 5/15/26 05:29, Albert Esteve wrote:
...

> Guenter Roeck (3):
>        kunit: Add backtrace suppression self-tests
>        drm: Suppress intentional warning backtraces in scaling unit tests
>        kunit: Add documentation for warning backtrace suppression API
> 


How much of that is from me at this point ? Wouldn't it make sense to drop me
as "author" of those patches ?

I would not mind. I had the idea, but others like you are doing the hard work
of pushing it through.

Thanks,
Guenter

