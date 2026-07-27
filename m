Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C009B13635E
	for <linux-kselftest@vger.kernel.org>; Mon, 27 Jul 2026 01:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785115320; cv=pass; b=vBkRc60ZZndcweUpsvrqmVH2VvLKdwtHSS0/suaoI2yzqVnlJwPIZJTWjoNVIutVQgBCRVqqfIuJV4/DYQ0dVP9iMt76JttMJ5LeyAu7JaFuWyh54K45esjDqasQmFniOXIcNpmaurueA7Te6Pl+7IxznM5kRNL36+xOjFHoPIM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785115320; c=relaxed/simple;
	bh=+sxQLKuw0cjXxCS9yLiDpRnTJAOs9NwiU0H/rnryQlM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ozFjGFHNaIvlAzlBZkxVYX9vToNcY511ZF7O6Mkc1GJePcgzte07rtIc9xDV97Qi7KhLA2FSLpFDlISbKHakxJg+XxhSx6jZ9LHBfk2ehulJHxRNNVivKHPxb81Vzd3qlezXOCn1rFMAHW/KwES5qSqN7iZtm4J2fOMsQPSAuDA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openresty.com; spf=pass smtp.mailfrom=openresty.com; dkim=pass (2048-bit key) header.d=openresty.com header.i=@openresty.com header.b=L0RkRDul; arc=pass smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openresty.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openresty.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openresty.com header.i=@openresty.com header.b="L0RkRDul"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8423f236418so1449802b3a.1
        for <linux-kselftest@vger.kernel.org>; Sun, 26 Jul 2026 18:21:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785115318; cv=none;
        d=google.com; s=arc-20260327;
        b=hpWrh9r/H+ouTTje7x+JcB40vhIUVxmOcDoFpeEc3oQl6cxYwV+zrVfyna8KmQ8c/n
         PCVS8CW6EPFUTJ/bkMdcoE2dZQoVAAOf/pQjeiYKcYkRdBrwscQ4S6A8gi/GwgkyAa5C
         zg04u2C2hJnIOs1f80nl7/UKKgQzdPDd0jE1cOOJfiJgWf5nvtIyG3HNF3QL+krDKAZ7
         1NNHyY7pr2n3vlqqjCEYjBtHTGKy2xYQtz4zOmv6Ho5Celm1+RLQdQIuxI5FxrELMzr4
         wLyP5LQAIEXQsU7OQ6dh2kus387eCFJM6bIyfe89E2ymRRBktugkiDtQZ1QgHFgGgHuG
         YUug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+sxQLKuw0cjXxCS9yLiDpRnTJAOs9NwiU0H/rnryQlM=;
        fh=bSVnN6JE/nGlVdSdvkaaMPcQEqgDe9fe/vRHCUY/Bts=;
        b=S0OWgge6Y4AjaKP+xMO3ldOEzhw7iVS0pefjRVwVten7sgUeKZm8xa/5JYD/n0od1G
         zqOntMMhoxmzxb4/PQzyKPoaOUK5urFT2D1FdqU2FgSkRcrLJymKsFipVDrBqqzziOci
         P6O/PE1YWAJzrs1yD0Bg5rACWYaCE5Sfnt+Glu7F89f4sYAdYTr01uL6Bb0/nlklZQ8G
         wHrKlaT5dKyx8mSCyLl8bC/JJaTlUt1Ol1kLgWg8lLm5JaO7bMX+jegPe5bvFExHLpih
         gW6JfS/7LLtBwprOjGdZTKBGrOiHBVVBiFR4j0mu3d82Xg3s9caCKMUGdKbCoQr4mY+o
         vhVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openresty.com; s=google; t=1785115318; x=1785720118; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+sxQLKuw0cjXxCS9yLiDpRnTJAOs9NwiU0H/rnryQlM=;
        b=L0RkRDulFk2Ndxg1OrokxHCeqFXK3LVaoFsl+wSnUM6x8fDRkMn86iDNn/5Y+fEJHN
         DvUMY8duP9Kje74Uske4r6EqwXGIePNqx2FLjq2e8q61XWmK7SWYsXnYWvDXzvGiBYiu
         UIcoMURFFIZ8bCmasRR6f3Sfx92oOGUPe1BBp5opmddIBfXsQkgEfJNe53UP0wx6Psx1
         gR/8g6Ic+kupKp4CiHxY8xRHl2dLPGF1wxSIi/4+Vw0JLYipPHfiHEdBJ97BAX9RwFFf
         ozLXRi1Spn7aupH6/6V+HxbbhK37C1QM1Goc+q9Z2THrT5qBgYF0GJhttT33c5jjxeIX
         OaJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785115318; x=1785720118;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+sxQLKuw0cjXxCS9yLiDpRnTJAOs9NwiU0H/rnryQlM=;
        b=fwSsdE4d8m+mSVA8ZsM1E+20/y9dFexXng40kMK9YbSQK1DmAlmakagEjbs1VyPyhp
         1ACJv75XG6p6JPAHufCIeXklbmVMjp4uVRsGtpECQumgm6hL5QQF+w2xEknnYYxl4tbk
         OEqxzTlI40sS0lDdG5WBPUQzw5Pu71OWe8jHO2/XV0iLblJWgtRm6zy5MkpYKijpd0u8
         jeDyOcr8sGa7YdQpVFtsIBpTgaobnEXFN5G8f115iNzulvNzAPg8sozT8LXLt84ig5Su
         H6X2hMzPAAM4NmdoCdNz/3tCOpNt0DUbv9y/HwylgKV20W5yUbIw4Bm2Xc1e4jXKoTSL
         yDfQ==
X-Forwarded-Encrypted: i=1; AHgh+RrLaoPQlVLEzCUGHAm+H1Ey9/4PsJGedfYgszsjtlckw28AZDH7x6m4pUiD47ilKoLIxX5Ca6n9/eUJxYmw4no=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFrmcwcCYYj09twQU74uxa88WesH1ASn9pMLVtBqtL3gFrXXWc
	XY6Qd/Rad1jkmjukGWDFBYvRcyP2Geq2HAfooH5np47hjBePMxm7LJezlpzOgruA/gvxGWNZiF6
	XYB18PZGKZy3XGeirtrNI5Iy9NqpCX0G/CcJGAsfvQg==
X-Gm-Gg: AR+sD116T3eelnKn8gtnu6Kpk+7hx42CIdBki7wRQuQvHwHBipEq2hXgk6ygChJPhop
	eGhreXtv/BXzSca20dbqmbjb/BP5IMF2O8knxl7xYj4A0Pehnd3344gMBHsjopJLNiuLl58sxgV
	QNebnuFjbOmcfHLwtVFeNgFC11ZrSbxLFfGcbsk/4cvoo3ZIYSD/ksIWKuD3jhIE90535HWsfpe
	7RNloymJ7adKQRJtBya6gAnsDG7WIvDPny+fG9xHKLCDTpXWjKKFGMwzIWuCR2nrpPjj46LHLk6
	7CcA7ty8fPTh9k5KWd4qVNIoxGP7SsE=
X-Received: by 2002:a05:6a00:1d95:b0:848:7f8a:8d0e with SMTP id
 d2e1a72fcca58-84e595a7496mr4718407b3a.55.1785115318121; Sun, 26 Jul 2026
 18:21:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260726101306.3772237-1-ammarfaizi2@openresty.com>
 <20260726101306.3772237-2-ammarfaizi2@openresty.com> <dca5a72c-3186-4f94-bd94-aab127dec64e@t-8ch.de>
In-Reply-To: <dca5a72c-3186-4f94-bd94-aab127dec64e@t-8ch.de>
From: Ammar Faizi <ammarfaizi2@openresty.com>
Date: Mon, 27 Jul 2026 08:21:45 +0700
X-Gm-Features: AUfX_myUzCZmK-8Zv44YuE1wIuIVGakPvkXtDYtj6PnztbYhLf6rbdX9Uwoz990
Message-ID: <CA+KFgX76tbg_LTh6-PO-zrmhWtrjP4y3u47s1wximVFUQKq=uA@mail.gmail.com>
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

On Mon, Jul 27, 2026 at 3:16=E2=80=AFAM Thomas Wei=C3=9Fschuh wrote:
> __auto_type is only supported from GCC 4.9. I think this is old enough,
> but it should be mentioned at least.
> We really should have a documented policy for that.

I suggest using the Linux kernel's minimal requirements. It's GCC 8.1
or Clang 17.0.1. Ref: https://docs.kernel.org/process/changes.html

What do you think?

Should this be documented in nolibc.h as a comment?

> I'd like to apply the same thing to the __nolibc_syscallN()
> usage within nolibc itself. While today we seem not to have any
> problematic cases, at least I was not aware of the issue and breakage
> might creep in accidentally. We can problably rename the
> architecture-specific macros to __nolibc_syscall_archN()
> and make __nolibc_syscall() the properly evaluating wrapper.

My current approach aims to make the changes less invasive (that is, I
don't touch arch-specific code for this one problem). But if the
introduction of __nolibc_syscall_archN() is preferred, let's go with
that.

For now, I will wait for more discussion on this before sending a
revised version.

--=20
Ammar Faizi
