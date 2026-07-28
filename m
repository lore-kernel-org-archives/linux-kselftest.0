Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B664E3B8958
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Jul 2026 06:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785221500; cv=pass; b=cnFlcTnA5WPBZzXjytmBseONSzULHDQ6L4TEGKeOyxetSvn7vjxc2UcQ/ZBJ3muZyaSXDj+LdAFzrMFASnbpt+D9pxXvtMC8Eawf9RMsUXXG/GclNoLyI9t1gzE7/f5iL12c6RfEGJeHVqTpPXRyFub73Um0CKQDOGQpGv5YeNU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785221500; c=relaxed/simple;
	bh=vFllPMWB+mv1Zu8+0oUcBSDE9JeZYdHZxMZ2PiPZMRs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hhFo0VKlUozLMDP7gZB5LQW8yFELgWwioOBhjmYx791MuTK9y2JQegJIxNUxSkKhjstEOquBnGejkf0GGB99WklXOJ2hLGMKoowyiLkb+8LrkgwYoGNMnCepDiItAz8gqgKd9Ph9aiEqy4CmRmPqsMH+Rr+kV2fhOmApyVtIlYw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openresty.com; spf=pass smtp.mailfrom=openresty.com; dkim=pass (2048-bit key) header.d=openresty.com header.i=@openresty.com header.b=HefDXMfr; arc=pass smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openresty.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openresty.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openresty.com header.i=@openresty.com header.b="HefDXMfr"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so3386491a91.0
        for <linux-kselftest@vger.kernel.org>; Mon, 27 Jul 2026 23:51:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785221498; cv=none;
        d=google.com; s=arc-20260327;
        b=sTeqoNCfaamf4xSDfenj1caiG5ZjbxkJZn+ldk/lCFkvUGHWdwTTU9XCsZ8oi6ND6b
         aV9vM78hykAm7Rj6eEZbo3685XONRALYdqvTDp5tya6On8LkJvye1GrMwogFQJUxIm0x
         +HSwWwGhAviAehEaW6f+J7MCQsrePcF3LKaOOohNDzwdz4rcVEiF1L/9jQ6jNXIHz9WK
         v7WEFGDdyiUJATeFBxQg75lG4QZuPeptNNUvfGASH4pEzelgmW0csm6VsMQcZ1TjVFeq
         at6Tx3lLUlravvQNfTimuWg1+ZIZ4C+yTbqj+UtJEdbBnT83l5OBHji9GwhhhpWxINgY
         wbng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vFllPMWB+mv1Zu8+0oUcBSDE9JeZYdHZxMZ2PiPZMRs=;
        fh=ZHl5aO+ijVjpSzLo13l0KMooiFzf3mDQ2gF96V4J0x0=;
        b=J6Gk43tyesbPL/vW4Nw7aI1x0U+L/u+NwObA8dvZWNzJMyNHKK93fYQEAyABnZZueO
         mIQkQFHfET+daT2iWLXhxdXr6agqsjriRu26wYbeB1FDGnQkKRU+MD/LGIv7gnqQcSrj
         eRPk40rEO7ZJMTvuxYNmjvPa9VRALbKyDRO/7mpQb4r0vvKQe1oVJYdb+bWMef/YqZAm
         NoFEaevrlqQcwxMei2gGCIXVJDDbqW5sgEL0loSXdMa7ieBZwG71X1Jh5Wm3wEztH+SX
         QvPEWE0ChsDAXt09B4yZKLtq/eQ6RUHGnTj0Zdlm3H+zjPaJpZB1RHYD4XGxHld/DJd9
         SQIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openresty.com; s=google; t=1785221498; x=1785826298; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vFllPMWB+mv1Zu8+0oUcBSDE9JeZYdHZxMZ2PiPZMRs=;
        b=HefDXMfrzC5ZE5Xx4NdEdxBMRsgA5zc4HvfzwGzgzdb+HWsYSCQwZRoukGzbN+Ygz/
         XaFtWh8bpWftqgAh/rowBiP9ooriycHdb4eP+Aw6rUp7u4qzDEXwzeL4gDIfOcCRMLKO
         Ru/LydACVGLOCzE3fMxgHx7++BL92JY1cJiathX9UzyMVedahC2s/HEshcDo0zz7kI6f
         km3sB1zT5JX9abmUVR16+Uq2CZRhXkkKimaD2NNEY4HhCKKXP1qxXV5FkaOFwz3AsuJd
         QTHjjl7P9mJ+iUczXFhRDzejCIV3/QqETC5YRnl+tlue3exsZA/zIfigZIEp2z8hS1yu
         va5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785221498; x=1785826298;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vFllPMWB+mv1Zu8+0oUcBSDE9JeZYdHZxMZ2PiPZMRs=;
        b=nOq+vWEqZFgvDXZBCiGr9oxj+tXlA1tE2Nc3WN43RrKNEdMogm7uZmVeEPHftWUZZ8
         ybZH2d9mL+zdQjzYwkTSljPK8gb1BuD5Vvgn/rU80XDEFKMKzuMskJGq1EXdFARZVWwE
         kSTT5jUo+86+gt4upKQse1OXQWcvOhkB23nJHkiTXwchlv07Y6HKlc1bLNEg6C/KsSpH
         pYZoGKZPDucMcqhnI7/Tvb+O+hyqNuApJRGCZ5vqfcx3o7MdbOK1cyptrzmd69rCTrtr
         XOWkvNKEdBrjkC7wZ1Aolt3kb2BwPnCaymB3oXLAP77VrwN8jQY+BhIR6PfQeyKKPcAU
         c/nw==
X-Forwarded-Encrypted: i=1; AHgh+RqQNrr3VJw+tMe/zMzi2YqKiWtFLtG/De9Z/Zg5VjzBg+o0J4zTWor2bknYN5gTY7LzzxKuXSAeWiGEhFbluvI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsFKhVJdLm9wQSJEAiXoSG7E8GK/o4ocVAfpNm5RH6/dGBb6xg
	gyv61uIN5I0aa2Yg87uFyfUe5/yQhl8PyF6zJA3+HFawFAhiJwLQqzJz+tB+SDNyFKwGoFWJwGS
	FVX+pxDRbIsGnj3Zt00CTQT3xq/++KNROk+4x8Sd0mg==
X-Gm-Gg: AR+sD124hy66+pNb9Tp4c00e8dqgTXSqMuS06fjJlqC6tJQiK4oHukYhafNSun/SexQ
	EQHLP2EgJhrOngp9I7wCiCJa7Xx14YfGXYv3s56ATf/5LjyPRIpUo5RCBlyETRecs9/o9IT8wM5
	9OkU81fffpS9zP3KBAnYnr5SJlQBU8XmC7LVvhnGmZIe06IwscMzfyaFAvgajfuhM29koxBbPUA
	juodcOljdSiHnrbWYJZD/2GMHalSeiE4WC/XQtd9a3c1LC9yx2EM69gdsbd0h0LOGjyW9L6dmSc
	TflBH5RTDYE5R/PyjLm9
X-Received: by 2002:a17:90b:51c5:b0:380:71eb:4014 with SMTP id
 98e67ed59e1d1-38f6a37e87fmr1398283a91.15.1785221498096; Mon, 27 Jul 2026
 23:51:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260726101306.3772237-1-ammarfaizi2@openresty.com>
 <20260726101306.3772237-2-ammarfaizi2@openresty.com> <dca5a72c-3186-4f94-bd94-aab127dec64e@t-8ch.de>
 <ambQ4715PGeb6uFq@1wt.eu> <6a6c1738-bdbf-4beb-9abc-e9c38434b8ac@t-8ch.de>
In-Reply-To: <6a6c1738-bdbf-4beb-9abc-e9c38434b8ac@t-8ch.de>
From: Ammar Faizi <ammarfaizi2@openresty.com>
Date: Tue, 28 Jul 2026 13:51:25 +0700
X-Gm-Features: AUfX_mwNMBgSu4dTxFsUacHTqp-RjCOEkBg0s1vRYDZbBtotdldmDUVB9cpOwoI
Message-ID: <CA+KFgX51SLUKcpLhaLT0sT-b1k0k==am6ooaGj3VaFMkLMmWxg@mail.gmail.com>
Subject: Re: [PATCH 1/4] tools/nolibc: evaluate syscall() arguments before the
 arch macros
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Willy Tarreau <w@1wt.eu>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Kselftest Mailing List <linux-kselftest@vger.kernel.org>, LLVM Mailing List <llvm@lists.linux.dev>, 
	Yichun Zhang <yichun@openresty.com>, 
	Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, gwml@gnuweeb.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2026 at 11:19=E2=80=AFPM Thomas Wei=C3=9Fschuh wrote:
> On 2026-07-27 05:30:43+0200, Willy Tarreau wrote:
> > Well, at other places we already have typeof(arg) which is exactly the
> > same, more explicit, and doesn't come with such restrictions, so I'd
> > rather suggest we use it instead.
>
> Agreed.

Noted, I'll use __typeof__() in the next version.

--=20
Ammar Faizi
