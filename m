Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D11B341660
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Jul 2026 16:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785256647; cv=pass; b=Fkvm4MhS9aqsYrZjZcYLBnJyMZxXM2MnpoOH2HIvqR/L90WkiBuM5MQn8IK01Ct9jIYmi3wmLGIZ88nAu5waWZ9/hWnIc+OLo0KCFNaBpXHbbSNumpyJV01hCG0pwJGTL5qrzqwdhbeuYxpSqMTRU/gJa7zkD6VkSy98KgcQ+d4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785256647; c=relaxed/simple;
	bh=e60hLNUfOHBXIsyuGgm6D2Ff7yg2lTBDzp9uEofiwDA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L2DbyjxSlSCFEcQxmpZfjDfpy6VXdHQzh6DCune/IC6kjO8YpW2WFh3LJftcHIDE8pC5Z8qzFwoHLGgiJoFaDBA3bBdoDB6uDxeCFrl/glB+k6jhFGs5eMiW7fTcjRhz6/UG15sk1fuTBGNoS990+anjztJNyw7l5zQAjtpj8qc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openresty.com; spf=pass smtp.mailfrom=openresty.com; dkim=pass (2048-bit key) header.d=openresty.com header.i=@openresty.com header.b=FloyMM8Z; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openresty.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openresty.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openresty.com header.i=@openresty.com header.b="FloyMM8Z"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cacf197759so1087355ad.2
        for <linux-kselftest@vger.kernel.org>; Tue, 28 Jul 2026 09:37:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785256645; cv=none;
        d=google.com; s=arc-20260327;
        b=IzleaowjZAKpW8Tta8VfUI/IVORUZbFMCiPuoRzDzWPnM8xvOybbkRbx9mziw+n1LY
         IYYnojNbpB7npA8SdxcO8xMJvtQ7BzL/UIqx6fSmBW8zZF8CEZIvG1HX0869HQHBarwt
         B95fU1vHBCgh7zA2qC/x8qt6S552URzv0de8aCR53JSSIS41q89lFYGxSbhU0QTBiY14
         sn0WnQEaUpVrG9HRo7gqLl0i+95NZaVxELyKG0dloc8Z3VAKHZlyfPMQnNFqiALGt0ED
         gmohaEJABPLdPNbYN01EJBJTbjbjOI/wk/eytTZ8qL2fWhyjJBvMeJCYFMyTJcrCvRb0
         kKFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e60hLNUfOHBXIsyuGgm6D2Ff7yg2lTBDzp9uEofiwDA=;
        fh=BzHkvv2uylSNFYIlumILBXKR0yuRHPpiN1NM4SnAtp0=;
        b=XX77YHRgckQYaDYrC5UvR98qoAt5aQHn3ktnvdVGnUIw1pNbOLmZO2NXy3fUoiDIXT
         Zz19nuffpfdsAb+4CwlgV6cyrJZHbE4Itm0nMBDJN4xQt4fChvX8B0v7IpjL28e40yay
         LcBwuovaPaASEfZ4A7EFbyHqv5VpJA9zWyJUhxxy1L2zalzTcu/198Ie9QJUCT3C2Lu5
         DQP4aw/kSowdBUOK6LJHfIXyc7oCBxo1lpwacTfn3qGoN5cvrnIeJKC5DvDLyd2A3suy
         emWEHVasXB1CPxrv/lQF1RIMVKJXQRJqy1mm6eYge9VERdh5BRbWyVqw9hMuW0+2ged5
         +qkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openresty.com; s=google; t=1785256645; x=1785861445; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e60hLNUfOHBXIsyuGgm6D2Ff7yg2lTBDzp9uEofiwDA=;
        b=FloyMM8Z4FFDOGFMsOyISmJNHRojF9vytBEglj0eL7bu+BuUz7zS1tLmsZO39IzC1Q
         XWrEABLqFyhleOQs2vxMUwHJVItGEmFP0T+yBYO4UKcZo/Hu+aMM4nlcpcnQtHNKpflJ
         ZZdyh2qQYaCY/jUEmvyYTK1Ese+6UDV9ZaqVz3k51XDpOdGoa245zjrkoFAIRQD2PQMV
         Qwtd9wj0ThjkHWC3VZ1CoVfymZvL/Knp/Zd1vKBqFSSplaxxOUENR2MxADnz0S0GpDKi
         I1tkNq6ffXwr+03BSTJ7W/pR+0Q/xWjdL7IcwkcQ90OQCp5atB87fe8fePgzTlpIfNXo
         nmvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785256645; x=1785861445;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e60hLNUfOHBXIsyuGgm6D2Ff7yg2lTBDzp9uEofiwDA=;
        b=kwhJE6nknMOt905MhnKvpQD0k+hzWuIZcEgF7MaerT05rB/amk/8hUGwryPN2AvNAm
         MGhEgZ2m+yeQ48OPWv/Edhuk0FIacv+If40dMjFFhEgedbOAo0HZ/ZeEEOs5g+kNkY2/
         bHLvgIycL3fw8AC8Hs+f+efdG2LTmUROFVxwKTN9MmKwMn1jH/D1DFMqYddza/kXRWSo
         NJ4Y/ycyt49+dX7HJKovnLDsFocbg/GYldDIpGYEvHwEK7ecqFKIGTHeSogDs8tkhThG
         j7UJafvVwmn6Cu6WQ1xoytFukg3urtPZZSQUHac0NOONFT2MQhM3LTMW57LbgZfxhq+3
         +z2w==
X-Forwarded-Encrypted: i=1; AHgh+RpoNXynSXZag02wTbUHhvJ6On9DPEAqPj8A7MRpzLC/xmJO902hiTRTcHCWoy3FLHboQ7xPD/CMvy12jo6W3DA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzsy+yKqHfmjqn1RtvKsU3DS2uX2XGzm/wUo4q34b84jTNPGWdj
	e/5976mVKv9dhHES0GXyVRZYWWv2J1kcnYSCH1oSt6GSS8lKEmiboYfl6+38vA4PMjPc8zfVrkk
	lQbw+h+K9LR49vYqCPoVRk3aOb8GTRq7v1NOXlTXGew==
X-Gm-Gg: AR+sD12Hf07wiSgluLJ8H12U47E3GcbW3dDNvdXNEGr39kmbV4bhxtQZoRNj+VpJW+j
	Xy8WwPkYHSlvZxCPAk2A7MepbQQaghJh6JNOOI3Mgsi+jLG5UqPQXcRPdzS33Qj1mOVfm0o3j/m
	ITw9RTmleHaoe9iaLr/wXblUJ1LSGjFalJL9cRIshPmnHa3BVamh2+UOOSvQq2on/it4fIbKR8n
	g3l/OKW8UW5I83pU2i18Ro1x9DnexYrW5oCGrXARQJkfp6+qdSx2HFvE4Ukc7oSBt7YeYMXMkGo
	x0w6u2LJ5RJ6c0iNtw1K
X-Received: by 2002:a17:902:f710:b0:2ca:a03a:29b2 with SMTP id
 d9443c01a7336-2d015c9c0c4mr43627675ad.8.1785256645434; Tue, 28 Jul 2026
 09:37:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260726101306.3772237-1-ammarfaizi2@openresty.com>
 <20260726101306.3772237-3-ammarfaizi2@openresty.com> <20260728094626.0fb1a467@pumpkin>
 <700de276-8949-4587-a853-935dc7c6433f@t-8ch.de>
In-Reply-To: <700de276-8949-4587-a853-935dc7c6433f@t-8ch.de>
From: Ammar Faizi <ammarfaizi2@openresty.com>
Date: Tue, 28 Jul 2026 23:37:14 +0700
X-Gm-Features: AUfX_mwWfHzpzL7Vmi1IA8MN2qfSLLCaLQx7BQcvXqsKNTbMGCEFSoHGZxrEbDU
Message-ID: <CA+KFgX6899SdedfWrYD0aC0wfogjQ=-5C0D8mbGjxAeS8gOYyA@mail.gmail.com>
Subject: Re: [PATCH 2/4] tools/nolibc: stdlib: avoid signed overflow in abs()
 and friends
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: David Laight <david.laight.linux@gmail.com>, Willy Tarreau <w@1wt.eu>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Kselftest Mailing List <linux-kselftest@vger.kernel.org>, LLVM Mailing List <llvm@lists.linux.dev>, 
	Yichun Zhang <yichun@openresty.com>, 
	Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, gwml@gnuweeb.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2026 at 11:31=E2=80=AFPM Thomas Wei=C3=9Fschuh wrote:
> So I think we should keep the functions as they are.

Okay, I'll drop the abs() related patches in the next version.

--=20
Ammar Faizi
