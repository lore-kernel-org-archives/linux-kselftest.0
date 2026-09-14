Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8CD456DF6
	for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 13:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789391115; cv=none; b=RK6Sons5AAigDrjLzoP1ChzUgsPpc3e+bGdVmURoIeTYb3+RYlfcSnnUopgGtkbKsyM/ta8KRiCCm4eBmUbIBrSD7xqvy9Ra6MPmYp44LNZ8cCuq2Hmnxrc6VL2BA2ENBG5PgquDO58YcLrDbDnvYG5n804VKLrnmSD3e/uIXL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789391115; c=relaxed/simple;
	bh=upXhQjpBQFpFfGgf+4DrDtiEUX5Qlzxu54HWm/7D860=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ZJFyY2goM7RWCAZ+Z4phoqH8pb6Undz1rPpYq0n/tNYGhGlBCDIOi+oPgXowQdiC0U7MZe6NCVu3KaMi5nJJdGoeTz93+Svh64DLYbHjO+vfOeUWDoomsEPiJxnHDPZ8fe751ps+KMwRjQbxzelbt9nZfOYKHz6VKqQ1h5NFMto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aD5Sn678; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aD5Sn678"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d46e4cdcdso15545787b3.2
        for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 06:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789391113; x=1789995913; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=upXhQjpBQFpFfGgf+4DrDtiEUX5Qlzxu54HWm/7D860=;
        b=aD5Sn678RcQbNqY7E51gkkqxRLbfAIO7E3OTzLIwM/yMOTn1iRz2NG8KPfIWBMGMn5
         KgeYVNE1liDCWvPbUWYILWhdF/RfLoZJde873gU6xd28Zqetrp4MhjdFrj2UtOZHFcKT
         Sh7yh6sHeJgZEWvm2t0LNRxhHxKCfmzmdUdaFHvl+3Kortr6gVCIAB1qUy5k/vzrj1B9
         BZtEs0elY/VTn/6Ietca6f+GHhJSdzCimYKRS60youz6UXVHXR/9SaVU3fBa5AJHuqnz
         36rZTT/bNfeejkfqjRgPjYb8fEP34enIoewGQzpCpiWUZRhIt/IcOSTtwa2Vzkuds1Sh
         idCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789391113; x=1789995913;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=upXhQjpBQFpFfGgf+4DrDtiEUX5Qlzxu54HWm/7D860=;
        b=CMOxCiDc+lKxsypG0UhaB74N+uzu2ACdQ0U+6sY5yIbeS5b9JIndKt7Q4o9ahntibX
         vbb9krX7iE2MJfEmGffp3rWzjZuxga4whRkiZoMZqoco6HbN/NmUOg1ph3js+6svWkc6
         TvU144r/+zL5Q92dZekMl6RLM7IxRsqD5LCFnnzhmTvvHnur9SHRCi49PNwAJ5sfcgLY
         kF1EljzjA4of7R3nhr5i/FXi0U0x4FjeeLHNEG5XncHhhHEKOlG4LPDC0RFHMmykNEb8
         ELreAE3ERzNgbKDuwA3ByC/4u0qAiRwYzrw8QkNFxgOfQx1a+F+DVDnkv7rUAOrq9uiQ
         I5wQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZkxffjlNiz892TkSixGFbkXtFC77VYoQo5kRjfLdKw0qhH+pjzNQC+QcoZ/x0ot92JqBgb6KifoTvwHSW000=@vger.kernel.org
X-Gm-Message-State: AFuF++mXA0+LRygOP5cQkyBqCPeSdeyvFrC1DNvYDt2gFv6Dk9+KlnCr
	SNgWidepYOGno4UCIWYbweRGM1YwE8XEGL4gTvFRRChnDxxtFkKOCdf3
X-Gm-Gg: AYBFou1gc4wxSiwh+TI46Mfdf+WVSICui6OYCa63E/VWQKqqyZ8nEDR8/6Q6OygmhpI
	D2WFb2qz2IRHgiOS37cCutOhPk08k+3uGT/AMTvjhK40f7D+aTqxmw5xWEjOGHe7u42lga+kLaS
	kmZuS8cLEp4YUpaZvOaSZWBZZyyuRzEUC4Vrs7foXcOwn0O62YaaqJnPkCTSwNbcXArLb7wqMLc
	X66nNUPSSsruV9uk8lipZcVi/ERSNCTRigvQwk2XtSchY0dyYReZq65Q/e/Rk/r+soufTJVosC0
	1Lij6ZZuDl0ng6Sliz4PqjC/sqwO6z6UUvlWV3uStp3X6f2tNZN8mHj173yxKtTumbDQwlH1+2l
	YKUegaHOoEwHRZgaHn922WWy6fRa4aQis5QZCMtbduU1msilGdYhIBqp53BLiT/XvRZW3eGMR5E
	WjbI9lcdKsbJLpvh2UT3ES+ZqFm5JAcLlyEFXGi6BXyObatpTLdVmW3Oi7zmmkEwnFYW56ZFiA3
	6CH
X-Received: by 2002:a05:690c:388:b0:858:ad19:324d with SMTP id 00721157ae682-88d1f213acbmr10131997b3.3.1789391112643;
        Mon, 14 Sep 2026 06:05:12 -0700 (PDT)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8848711b85esm35905357b3.24.2026.09.14.06.05.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 06:05:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 14 Sep 2026 09:05:11 -0400
Message-Id: <DLF27K78JBX3.1R3FD4BNRUFIJ@gmail.com>
Cc: <netdev@vger.kernel.org>, <edumazet@google.com>, <pabeni@redhat.com>,
 <andrew+netdev@lunn.ch>, <horms@kernel.org>, <daniel.zahka@gmail.com>,
 <willemdebruijn.kernel@gmail.com>, <donald.hunter@gmail.com>,
 <shuah@kernel.org>, <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH net-next 6/6] selftests: drv-net: psp: check the PSP
 disassociation notifications
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: "Jakub Kicinski" <kuba@kernel.org>, <davem@davemloft.net>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20260912200426.121025-1-kuba@kernel.org>
 <20260912200426.121025-7-kuba@kernel.org>
In-Reply-To: <20260912200426.121025-7-kuba@kernel.org>

On Sat Sep 12, 2026 at 4:04 PM EDT, Jakub Kicinski wrote:
> The main namespace must see a change which no longer lists the device,
> and the namespace which lost its last association must see the device
> go away. Check that on both paths which generate the notifications,
> dev-disassoc and netdevice removal, and check that a namespace which
> still has another association is only told about the change.
>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---

Reviewed-by: Daniel Zahka <daniel.zahka@gmail.com>
