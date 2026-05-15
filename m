Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F003B19D4
	for <linux-kselftest@vger.kernel.org>; Fri, 15 May 2026 14:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778855128; cv=pass; b=Psmq/QxUIbcdOKQXiXhQ7nNCDvvwPZXTkiqTW3yfuaee3udU4zbivwlXIKh0R98vVWoLwG1ufKJs2lE2aibNZaHmokAVPUFUtOidFuWyj360YNvBXsTgH3UeWRunsSA/XzoIgzZrcw7FHQfhDWnr7QiqQjMXt8L4/5Gn8Rw4Bh8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778855128; c=relaxed/simple;
	bh=TA5ESWaxk/ziiyS01LtpqfhWIycxEsFgwAIPwQRU0UY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mjx1PpP/tKIbO7fhidS6Ybjfg5970lXP8pWFJaX6xbQ1jHizGPqJLjo6YGiJARXbOJ/3bEB1Qssyqmf/hAPrcpF0q8ONSMlYp+eAD2uOIHqFWP9uu6psjY7nLTa8anvsnIXkF37Kt2FRg4ypctedcr4CDB6GjHZpTf43NRUKaXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K0PW0xV1; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=nKx8dUcy; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K0PW0xV1";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="nKx8dUcy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778855126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x7Embi/4WSTFlWQtHoiZCAOUQi9JugMiQF8nvMXYC0Y=;
	b=K0PW0xV1+81YwAXVqpf7OmSNpZfrEHsssxl+bFB+jeaBufZ4eoVkDxGQdgijdLs8f35dpH
	yysLGsrlz1Y8iz5HNTDt8B4/46zxJ99Fehj5iB5s0K845kO5nKjOZNCFBCKvLFxbu2YLR7
	CxRsgbIjWVDwK9xg6EBPOeFeF/7Iqkg=
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com
 [74.125.224.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-546-Fd3AKdACPde5tyVW3ECYVg-1; Fri, 15 May 2026 10:25:24 -0400
X-MC-Unique: Fd3AKdACPde5tyVW3ECYVg-1
X-Mimecast-MFC-AGG-ID: Fd3AKdACPde5tyVW3ECYVg_1778855124
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-65c37eafd67so19725966d50.2
        for <linux-kselftest@vger.kernel.org>; Fri, 15 May 2026 07:25:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778855123; cv=none;
        d=google.com; s=arc-20240605;
        b=DuBcmze0RKUO5owhWrXTMmEQ19Se8TvC9LRdI2/NfawHzxA2cLyvVOMDLnfwT7ArMl
         mV3vXBTaalcV4etfK7JFS+NZ45E0Kc7/zxKTRqVQfni70WvgTDJl/VcNh80T2r9OlEWQ
         R2S1NRGnL7x5JpJzxDn7zEWtGF+Cb9fT0gv9YOEq4NZOR7pzP3WuFxYoHWMg3o27qKD6
         Ulgscpyg//5d8LDuzG3lbXVPKR37rqiVI3v/WLxpSRe86GH7ay+VtWqjXoSKjQMq1fej
         5TFs6aYXSX8ZIsAJoHmmq6s9dJnHeDotEaKO8a2tyXdHYCv4kuvRwD420TNWVt1SDvSJ
         zAGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x7Embi/4WSTFlWQtHoiZCAOUQi9JugMiQF8nvMXYC0Y=;
        fh=HxzFniHwZxxI8orEwbxDRBl/jiOgH4nCJpr6XAqfM28=;
        b=J63krRNcOj8Ra5Adw5mJM4S9TTRqZCcCfmU+0GrpBfcFfKMI+3jZzDyVvALmPPc3Gp
         QUxvvrMeF1ir2CWF0PZFHod5+8QTrR2zVJUsMd0gT2f4j3whLRFt2JyiCWsnOprEzXU6
         YndcVDYmMhgo7EPwkdxmTcfgYmIAuJcl8/TppgmK5Rzk44+IpXKPUjl5PrJvEwja8apS
         FigF76ngDYv2vhbsKClVcLTniv1ZTaIjHC0cXUvVlkfF+W0u/ojkT0lH2DKHFr+V25Va
         f02DY7iTJYWTHh3ep0R3Ip3MG5HcYIsuoC+aFx2zC1gHYZnK7PCIuee0a5neKj0+4fOc
         CJWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778855123; x=1779459923; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x7Embi/4WSTFlWQtHoiZCAOUQi9JugMiQF8nvMXYC0Y=;
        b=nKx8dUcyXg+4YS36hcwSxeLGfIPD/5dCpmyHZa2dGmsMB9zadZOnCBAhOLHAXQSlTQ
         OaQlNu5gEtC3EArC58zvfHm5vaa+EAqtAHlUH5/Hnkg3uLO0/Ex6tfA8KLIl8cmQ0rsD
         kWua7yzAJGYzckURczOI8Rs6eeZA4JS9itjoPthEskFPYDVjWYROccv1Bl79zaqb7kjM
         fbnSLvne0k+7Q490TgVfKUFVUYwlBJeDTsmO0Ja5q0sFThA9Z/N1ksggSCoiiha5MZUk
         790BGcbo84k4HHcfMRnwBgLwse20b+hfkF9zUAq9lmMGGhfz5x2E5/r2zo1ftQTzoc8L
         B25A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778855123; x=1779459923;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x7Embi/4WSTFlWQtHoiZCAOUQi9JugMiQF8nvMXYC0Y=;
        b=dbW4Soz1frAd4THTc+ChRQy7+FAQkOpNthfpouVxkLS6mf1695KckXasmVerAjwx9s
         zPnjRLTytWtAmjFizi/Vco578FqW/bGDdpXCtudSgQuFntDfd8UVXza0PwG4N4CmyNqb
         4Y3K2oLiG+xrQDobddEeTZyiHgrO1bvOf7zfNifYe7+TUMWyGC7w5Bz4WR2QJwJ03RHu
         LAYDAqZmQmcgPLlUU09l5veTcfT1OquBEhraV30iqzfoiih9apkne7qtXmlkyURBouFt
         Ldp2ZarFEZwBml6jCHv/D7pWvxzAG93KmFbvsVDSY7L2utJAZT2Za7vowwmKF35pxa14
         z0zw==
X-Forwarded-Encrypted: i=1; AFNElJ+dol9LX3sPX0bdqZx/yV7kjJuI5RAERKyzagOxDjdTRmZE3u8FCXiwLsZRb0jMUREwI3spEBHShtNFTCMra8Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwB4lLGIBYelBbP5xPbGyL3tZPwI2p/LNIVDEDVr7PWPr8lZwk5
	dC+MA8R5YKZ3j8902rfzF0XPjnZ3yt9CoLS629AH951vF7/54gFZSYiu/WPybuXU4tQDv9VnknM
	X7KUYqtATwTJlWV1RecOriYri3MoAN1WmgOJtSuNFbNfrwuwjmc8FLvq+x9N1qzON8qaz977RBj
	d0em+DsHcaywvvXgD5I083fMN95WUO2nkz1FtV8z1JGzHZ
X-Gm-Gg: Acq92OFdJOFkFT8SBtOFX+ToZXZO2bC0/R0TixfZu9u6EXENZFXJ9xhZATUA6YeYSCq
	nnfmjnqJM0FccS9KCGGg7dECQsl004u44YV9ZRMR2+VBSre3N6y2CcT3qVLdjxdyL+H1raC5AgT
	MM/bnO4+Ul369QyanFgkEGX5pnCI1rnaegS7YND/8HxOU+wl6tE/UdvyEfVS8EvGGALPyWEb3D0
	MQUqw==
X-Received: by 2002:a05:690c:921a:b0:7b2:136d:240a with SMTP id 00721157ae682-7c95a56fc91mr34928097b3.9.1778855123632;
        Fri, 15 May 2026 07:25:23 -0700 (PDT)
X-Received: by 2002:a05:690c:921a:b0:7b2:136d:240a with SMTP id
 00721157ae682-7c95a56fc91mr34927427b3.9.1778855122973; Fri, 15 May 2026
 07:25:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515-kunit_add_support-v13-0-18ee42f96e7b@redhat.com> <7bcead90-7d96-4101-bd13-dde2c5ded1aa@roeck-us.net>
In-Reply-To: <7bcead90-7d96-4101-bd13-dde2c5ded1aa@roeck-us.net>
From: Albert Esteve <aesteve@redhat.com>
Date: Fri, 15 May 2026 16:25:11 +0200
X-Gm-Features: AVHnY4II_A6w9jZTl5s671EZUUpKeCpv5nVKmn-MiUqfHzgEw_QM_N-JJo0K588
Message-ID: <CADSE00JVgP50vud_3uvvjg6HDeEwc1TsK0E=gSKV07jKtT+vMQ@mail.gmail.com>
Subject: Re: [PATCH v13 0/4] kunit: Add support for suppressing warning backtraces
To: Guenter Roeck <linux@roeck-us.net>
Cc: Arnd Bergmann <arnd@arndb.de>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	dri-devel@lists.freedesktop.org, workflows@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, 
	peterz@infradead.org, Alessandro Carminati <acarmina@redhat.com>, Kees Cook <kees@kernel.org>, 
	Linux Kernel Functional Testing <lkft@linaro.org>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Dan Carpenter <error27@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 3:51=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> Hi Albert,
>
> On 5/15/26 05:29, Albert Esteve wrote:
> ...
>
> > Guenter Roeck (3):
> >        kunit: Add backtrace suppression self-tests
> >        drm: Suppress intentional warning backtraces in scaling unit tes=
ts
> >        kunit: Add documentation for warning backtrace suppression API
> >
>
>
> How much of that is from me at this point ? Wouldn't it make sense to dro=
p me
> as "author" of those patches ?

Hi Guenter,

I do not mind authorship either. Signed-off-by lines already attest to
everyone's contribution.

In principle I am done with Sashiko's reviews. I addressed all
comments in their respective patches. Some lead to the rabbit holes I
put myself into for previous versions.

I do not plan to send a new version unless a human review requires a change=
.

If that happens, I may update the authorship. Otherwise, I'd keep it
as is, since you said you do not mind :)

Thanks!

BR,
Albert.

>
> I would not mind. I had the idea, but others like you are doing the hard =
work
> of pushing it through.
>
> Thanks,
> Guenter
>

