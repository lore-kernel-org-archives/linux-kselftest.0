Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CEB41D4FC
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Jul 2026 17:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783360558; cv=pass; b=K0bh7HGykYtn3RRxClepGJbqlQYJY466OR+yQ6y6ddgAGHAqoKJoSGIXP1lkjwOq+RrziwZMIzYG6XRflicwKT+7sGO7J5JY9WlPCKkAXU/6q/oe56yLXrGeUbVXM0fD1aUQUUW5WDVS+nyg+bAxXS807SsuxSZLwarAP1EJRTs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783360558; c=relaxed/simple;
	bh=s21emSiFBXRhIG4adzOt8PS21mYSI/BQjSGzMfPEb60=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QT6Oy1DEFh7/tWA3KM2jroY3cbezLEI0ZVYCglvb9TLtWueLBmvyIUYu96AlyrwCmJOLunQ29CTtRuTJCwAO4OzUChKddohV0IZPFjJAyrpNk26EZRwUrUfmA89rdvoVlWa3RMuMfLFaOUzLJniJYsr14zPHNfibmWjCHrCeBiI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O289yygc; arc=pass smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O289yygc"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84783bce476so2257337b3a.0
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Jul 2026 10:55:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783360556; cv=none;
        d=google.com; s=arc-20260327;
        b=j6gul07aFAFeQEsQrscjMMc/0rBEiQRIacI/G0TLOO2SX/dDFswkEzFNJuNSV+HhPf
         KgLvSEhnVlORHnKsbNcs6amCePriEjNKsYwLLJOo6xtjg8UJN5neVj6WI9yV6uXWkl5E
         EX3bzTohoOyJ8RP3kc4NVS9N5BvaT1cGYJPTPWwJHFeoOyzo3bg4Nn2pmIKVfpzxB7uR
         DJTXgS0go4nCLy+dB6yGy+9K61/3fU86YZbnnxs4Sftdug3PzTlEks8BP4p5EwrsSVe5
         KeV98f943Iaf7rjJ1Da1TsoDcaVTm31z2NVQkofQLH4+I/DC346Xfq8+fuc9u9MIgypA
         CSHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c9xYvgWpSIsvxmmbSKcwuxv2TlolNkK+hPjDZbbXCRg=;
        fh=VbB+ecOKELT+n5NW1EIuG4017qgSCO3Q/Cn8NaF6npE=;
        b=W4nM0sleSaBYWHUn+p3W2y3cxW3Vo4ZPhFLxo7SeZYDvJYX77r34rIysG44rQ/m64B
         MBBrHeSYCb79kHqzS+EwshmwubWmgf+GqPsp/SitmfzB4Yyo6DxCwvQiWg/8v6jKmoJo
         fNEiuFI0gO+8kI2ZwjE5iyHqpfeIltq6sA1v+M4UP0pBU4jkXvqiQDsHdLIwt8GIzToX
         ZwI5ao+glUI5mBv6wsSjIQ1o5NeaQcNWvnPe0byiyQfZ2+bmiqfxfRSnr0LITJuwrEoJ
         ZkaF8cNmw6gwr2oEtPFEsL4akIGz66sF/BYtY91mmtiPw+vtguZGerXEb5I1l0AEWCyY
         fjvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783360556; x=1783965356; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c9xYvgWpSIsvxmmbSKcwuxv2TlolNkK+hPjDZbbXCRg=;
        b=O289yygcJAxImWKeon0D1zv0Il1gQKmFwOUVcSmlx9Vl1GqYMckcAONyRM0/tJL9Xi
         nGevgfHy3JfQIgfp+A5cae1X0wBsU/2/TvdaeVHD9zcjTHnNsm0/LufLQfHoHWmdTabz
         M5T8I9QJZZzKopWFn1r2Nna/Els8YL3utKKiurzzi6ifYiDdjz2x7Z0GbsKzWETl4U+w
         B4onaHI7meUgiNW77P6Peis6gFfu+JuhRxiTcfZLV8KS25Kbsu/PGw93AdopFOaplvr3
         pNeyngxzIRoCJKtoZfxEoF4XO557EPo3Z5ZdM1m9WxkJKyhgBOZYjKA7lRz6IxM/k4xH
         gxJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783360556; x=1783965356;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c9xYvgWpSIsvxmmbSKcwuxv2TlolNkK+hPjDZbbXCRg=;
        b=ic5FX9DxPB4pDWVyjDU5exBYo6mHOwXUSt6WmSjFZNmnQzgVyXzKVKmtXj/Cwh14pw
         VwLTXOgDFrBCucbliQoGpnKQwr+kaLQ4Xgskb+a0Cb0VAQtLZlNCt/F8NnNxnO2ITC+j
         R/43XCw5CK/yIpaJrWLiAAxPsATgwxeGdguV0zVNq8Lz4ZwaisXqHbkX5JHPSjbo5Bjm
         7Zz0iH2og2D/liLDlU1tQmbuoEuPeIhZEkidKJSDn6CPb4l4q+Y6O27Vhqlwg2XxvtM3
         N9YR8arV3FBzuNXY3OG9KutRBF4h+97SRngrkf9H79SpDKz1zHxMRcBZwPkgaV0pDrps
         p7Vw==
X-Forwarded-Encrypted: i=1; AHgh+Ro07Kg8O2ojFQ0dXIzUcHwRYDF0a4Y4wUYW2ZMZSFTbmNMUjZmaFxTVspsYyK5PvOf95T152+XQZ6IyYTQ/nSw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzasasSVjQ70cAfvxwAcp8RGDN8Lm4ZkaIlyMpA70jQyLy0DX90
	8JqxvmFnPX1nk72cUXOg/ktKZu0qeV7/derx0VaODd8p3DN5QppAxu8XzSoH+ubenGGENtTyDeC
	WM/cXS3pEak/uzab8mvaxL5+1dnYkd69yr6vWg04m
X-Gm-Gg: AfdE7cliRetpXKTaqyNQUq1ZziMtIhM19irhEzw2y2HG88Ab9tyqAyoIkHK9Xo/XjAf
	i6xQnaaAudiw60UZYRYqRisgHsyEE4mKhoGBQyVgOFNJVTjFwil+TS6TmRoGikhx//Ibp9A0ndM
	cB0Hf6l5jO4Gu4V/12QrLx3kdkSj8lWBEGNI1YR7MV/o5RmeDeGRpdV+VbWlzKf8xAYlDU7KG1W
	RjxfuDfUemYeBwKjQRtEXyzp1u6FIY5l3SpCEMKjRuG5GQAu4w4ESGpR1KverHqxi3uK25O
X-Received: by 2002:a05:6a21:3988:b0:3bf:6c08:fb8e with SMTP id
 adf61e73a8af0-3c08eecc5f1mr1926858637.48.1783360555946; Mon, 06 Jul 2026
 10:55:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706175228.2468730-1-dmatlack@google.com>
In-Reply-To: <20260706175228.2468730-1-dmatlack@google.com>
From: David Matlack <dmatlack@google.com>
Date: Mon, 6 Jul 2026 10:55:28 -0700
X-Gm-Features: AVVi8Ce5nbB5dQBx-YTPg7rJMXNHy2ZTmt6qPpfE6nxI2-mw0XhdUMdNTXLndXI
Message-ID: <CALzav=f4-mCCvu1fL4DUQ3saetcqCumvfEmQuDFmH5X2SHXqEA@mail.gmail.com>
Subject: Re: [PATCH v2] selftests: harness: Mark test fixture objects __maybe_unused
To: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	llvm@lists.linux.dev
Cc: Andy Lutomirski <luto@amacapital.net>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Shuah Khan <shuah@kernel.org>, Will Drewry <wad@chromium.org>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Aaron Lewis <aaronlewis@google.com>, 
	Alex Williamson <alex@shazbot.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 6, 2026 at 10:52=E2=80=AFAM David Matlack <dmatlack@google.com>=
 wrote:
>
> Mark global test fixture object pointers __maybe_unused since they may
> not ever be read (e.g. if fixture variants are used instead).
>
> clang made a change to -Wunused-but-set-variable (split out into its own
> subwarning, -Wunused-but-set-global) that causes this warning to be
> emitted for various selftests and can be upgraded to an error in
> selftest that set -Werror.
>
> VFIO selftests have been broken since commit ff556bd98348 ("vfio:
> selftests: Add -Wall and -Werror to the Makefile"), and the net
> selftests builds have been noisy due to -Wall.
>
> Fixes: 24cf65a62266 ("selftests/harness: Share _metadata between forked p=
rocesses")
> Reported-by: Kuniyuki Iwashima <kuniyu@google.com>
> Reported-by: Aaron Lewis <aaronlewis@google.com>
> Signed-off-by: David Matlack <dmatlack@google.com>

Sorry I forgot to apply Alex's Reviewed-by tag from v1:

   https://lore.kernel.org/linux-kselftest/20260630165244.0d013bbc@shazbot.=
org/
