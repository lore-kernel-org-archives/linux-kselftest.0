Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09B730EF9B
	for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 09:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782723719; cv=none; b=SGjbaLonvbb/aVKulGTVnQsrw95L2npekG0+550bk7/XADz0cuxwm+P3wLW3Yls/Xi2GeMyUMrOSKiw3xXEHHcMAQBz01y5rdynBy38wstoIdiqP0kbhKEUJ7uPAnS9pvH1IlFKPzOOhLHoKXZX2EF0EhUt01CEvpoiEGN89ivM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782723719; c=relaxed/simple;
	bh=3VKl3iFU5RbwK3KYk3lekBeyfpcYW9UDaDcy6rBp9dE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fUo9bCklPU/ZI/WKqZ6hBhSI2xTiIcmEWqYay+5mCR+3lGTRP10yqax5vCv0xoI8B2yjdsvhcfy5VFrTfdF/5g0OIuG1SZ1+g1CRlNr8tF0biDtgLtEr5VL6cWKYU+nHjPUBbdCoCqix33ri3MYbyqRPfkhfVO2K5p0g+mD8Wpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-59c627b53a0so1556848e0c.3
        for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 02:01:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782723717; x=1783328517;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LWCa9Iijq4T0FbxC+lA9KqSW7TbKNleAvoiJYHgYTME=;
        b=stWszFjBbxFM8e5oNL6rPsceoI4reUIvt3IecHTYuO0N9ilgxBGRnl+6g19pN9gNWS
         qSp0DrblMNuWxSoHJKW2vzAIov0jPf0AnJnxcWqETsGi/CE8H12qLEpu8EUoZ2nsqzgr
         OKhdElsVFqVZxV+e8lvzTHsnDKVTzkEWJu38BtPdwYZMcKLSM04eZgsALajx8J8kX0np
         vOU56KDTQPpdbDGVR+8jFNn3VyFcTfs1pqaMSowqfODx1wg64yVjsLXYgHGJCdd9XLr9
         IqHIZQWeEwJNdyv9YMwxTE1YcxINNNuWUBOa7pQyOGDH+iJIuGsQ7RQDyjA5jGD+GY3a
         Hn2g==
X-Forwarded-Encrypted: i=1; AHgh+RorFIIsid0bl4/8xLhtRD8RRMQuoKXm4qEAv2cq4a0IZiDw54U0wb0S0JWk7sPNLuLLAgBMhvUAW6N1N4tj7oI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwW2yQH+IJKg2ayWeuX8Xzs/+kRmPiEqAe9FdgZ+vWBjDdS4w+q
	PpOK9PZAjf72M/jVaZMsDzWbdJuPLWqUMiJ/PEaCViHAJmeelsemsJ89SteOUzFL
X-Gm-Gg: AfdE7cnkbs/q4h+fcy3lPtnsvvT0avGkzt3+mHbpupDkjb3AOOzNtAkI0ANqGGJYCEi
	AQ1ApT6epRvBRMOFc6cL/2njW2jtRKx4nhooG5PtaMUZzbq5OeWb7JEilW9LAz5v5EYhUUM5rhT
	lLfPN1Fu/oO178OXeAsTrMqi4l4GH79XeMyh2mS6R48ZbTWj2Q9X30o4eCaCTQrdfc4BX3an2bt
	ItZvgvmz5lKspNedlHhu20HrsUlmnTcpa1AXaHW0trT/zxOK0FDS8ntmkcC2B54j32nOePRP4Fs
	1tjedzmqPJaccxocTAAtdPH+ILJvjXrqM/g7bZIcD3Df9Xj66Pv+EXwFjtEP3+Gb3QAljnv8Z+o
	ZCEdNK8i03xf3C2r1YHMTImQ8IA57DOGyY5vhQ7Xi2u2iwbI/0t7LqaBtv1a15mF6XPF4xYnZE4
	kkx+l9uOtgLvEHQw+9gYI4/lamYZGihF+gyZ33RP1xj04DIWtkvg==
X-Received: by 2002:a05:6102:c10:b0:739:18ea:565f with SMTP id ada2fe7eead31-73918ea5a95mr500425137.21.1782723716910;
        Mon, 29 Jun 2026 02:01:56 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-735638689dcsm5514845137.0.2026.06.29.02.01.54
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 02:01:55 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-73703f19c06so363614137.1
        for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 02:01:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RraJCEzGL+V4jyGWotB7LvWVKA41Ets8Z8JTfYkENpurl2X8GfjSTrV4b0IT0yrNwQnaN7Ng0OEVe3KuSn9+rI=@vger.kernel.org
X-Received: by 2002:a05:6102:2b95:b0:632:29a5:2b28 with SMTP id
 ada2fe7eead31-73433b204abmr8037345137.6.1782723714413; Mon, 29 Jun 2026
 02:01:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629054143.7737-1-note351@hotmail.com>
In-Reply-To: <20260629054143.7737-1-note351@hotmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Jun 2026 11:01:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWMx1zAgnzkoYqDB8TOu7s93L4f1PoeXVpYm1n4=dESnA@mail.gmail.com>
X-Gm-Features: AVVi8Cfdpu83rU3NuQjfbLCIaCqIS0USSfuVxDZTaim0eb6Wn6uZrpMkmnArI4g
Message-ID: <CAMuHMdWMx1zAgnzkoYqDB8TOu7s93L4f1PoeXVpYm1n4=dESnA@mail.gmail.com>
Subject: Re: [PATCH v3] lib/random32: convert selftest to KUnit
To: Kir Chou <note351@hotmail.com>
Cc: akpm@linux-foundation.org, thomas.weissschuh@linutronix.de, 
	davidgow@google.com, visitorckw@gmail.com, brendan.higgins@linux.dev, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:NETWORKING [GENERAL]" <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Kir,

Thanks for the update!

On Mon, 29 Jun 2026 at 07:42, Kir Chou <note351@hotmail.com> wrote:
> This patch converts the existing prandom selftest (lib/random32.c) to use
> the KUnit framework (lib/tests/random32_kunit.c). Unlike typical KUnit
> tests, this file is directly #included into lib/random32.c.
>
> The new test:
> - Removes the legacy CONFIG_RANDOM32_SELFTEST from lib/random32.c.
> - Adds CONFIG_PRANDOM_KUNIT_TEST (defaulting to KUNIT_ALL_TESTS).
> - Moves the test logic to lib/tests/random32_kunit.c.
>
> v2:

The changelog belongs under the "---" under your SoB.

> - Removes the legacy CONFIG_RANDOM32_SELFTEST from lib/Kconfig.
> - Add const to arrays in lib/tests/random32_kunit.c.
>
> v3:
> - Changes from tristate to bool in lib/Kconfig.debug.

That's (IMHO very) unfortunate...

> --- a/lib/random32.c
> +++ b/lib/random32.c

> -core_initcall(prandom_state_selftest);
> +#ifdef CONFIG_PRANDOM_KUNIT_TEST
> +#include "tests/random32_kunit.c"
>  #endif

I guess that is the reason?

Any reason why the actual test code cannot be spun-off into a separate
module, so it can become modular?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
