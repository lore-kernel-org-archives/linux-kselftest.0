Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D04C43DEA5
	for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 19:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792093666; cv=none; b=GUBRxMb4iPkxotyjicqprNrqJxQQRG/2vFiDYWc8xuJuhmfN/P/UtVIROmG0VWmxU7B8MwpwuZSM5W96lp+j8OHjQ00+GPJIGvQEofGl0tjEW8ZjUNJg8M9wAltfnLTlaUJc4uQX9tpHkeRfnkBZ2Xv8zf/nbWKIJzrxgGnJEJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792093666; c=relaxed/simple;
	bh=Lvu8bhCvl4Gx6QrlBiKWXsLgcVGs4226pEjWm6a8HHQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I3rOllT3Da12qs6xPHDhgliYBoxLce4IL1At3mVckTnbLxRn7IVp3XSUJwFF3ibin4dLZxh5A5W3opH10AT9LYfawf7i0P3fE60HVfCG7vGXVSTj8uBN5dBNL2ojHfFMQHlfqISVBXTXhvVTDUsAM7I1/f14issMD9If01yTTLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XyNNeGor; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XyNNeGor"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-825572e6701so1328742a34.2
        for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 12:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1792093663; x=1792698463; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YLyXpqOX1Wq1Gtt7ggrKXwSvKZc+5L4zCwwVoXGTvF0=;
        b=XyNNeGorFjM9Q41WaNkCf0rWHRsAGsFzOT6/Nuc0b1BACAt8GDi4T8EkQAjaao+Vt1
         BbqRbGH62my38643lBz7aGIjZj50drVFyiqzqPcrCF9bGRTdB6Uy/EieRWAZ/li/BJ5x
         lM0E/Q0i3ncSSB//1PU1xoHloUIvdkmsFobtM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792093663; x=1792698463;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YLyXpqOX1Wq1Gtt7ggrKXwSvKZc+5L4zCwwVoXGTvF0=;
        b=NNeV8MYuqmkFwHFiThrDMa5/u1bqfFkR4wkEMPvlQyf/XIJ4OCCXpQ+jU9MaARIOo2
         9rGveBVIyj9QaqSe7B+klCeyyC9yTwRq1ks7gOPqC7bGCmY+MR7oYH700Tp0+oeAnIFI
         UjddG6dcGilGDrS2FwNBdoA1yTssHEAXVYNP/h6nEUfIuqh4t6a5zeQq7LQq5v7a5hOE
         pQ9yBKqX37yMcvEi4Zx0Us3Na4Vjq/CCIxNs0rfyweIMnDlNdfic+kJD3ykv0aMYNvGz
         P7IUxjkY4sPj83zdmUQpp7YcH8p66B/RJvjpc+joe+0Tiqx2SPZA0YjsuikFMFJgWULe
         1/zQ==
X-Forwarded-Encrypted: i=1; AKwUvBxLktriDr/4FHri/EKC5AVqRJCwWO2KkHeU8Dc9ZWkmb5OLa5qpp5SkZ1E4aIUeaBqFOBmGEitH9n9yaIZfn8I=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBYPHtiratrcGrkjV3BpAwaRiX9/cyX8tJDixktkmz/d78mc9+
	bGIJOhfQQoiS7yecK9s8VVLh9N6rH2GMaB3/I8lYF3Qp6HQcxMvP7u0nzfZ4H9tfy2Q=
X-Gm-Gg: AYBFou21d5xgvIGNB+bCDlGHjwEg17HFoiKdMCWSH2pNpw1lTt3CB0mBpGrehuq049i
	7g8kBV7SPEtsKh+Mv9GcGa4vA25h+fMxl7agqrW0zSG4M9rBNL14TFGgkEObM1sDhMl+noSbKoU
	tOtmchT2GmsHtHcvcY/cYJwPMRsTVfhYVBbpHOhlGZlGZGdJpqE839dRwjYKXIuDuGy2BAqJqMM
	OGV5+KuxG8qkbgvRrEaB8dReZAqO36LeXI0ZGAxImqhF4gzv3lVIX06rKN0GItydaFktqrY4aCX
	ZZ0CsDPOzulSmx3wYSRK+2xPiGi2p3O894OKeUft3lJlIw0EtHLXQAyMsJmcdN+Wc+cXMxy8qtk
	42ASvx3CzA2MRRrOfU2pfr8RPaBFlB072Cz6HSEG9gVeexuoZ9uISorLuVzxTLGstgperqEtHJI
	vgA7isKtZaXybhqast5QXNu7/9URKDCcNcPy5hR/OtbBVEzjmtq46/XbwTIf3wW2ySlEd7nvFm6
	M2xh0s=
X-Received: by 2002:a05:6830:43a1:b0:7f6:96ad:36a8 with SMTP id 46e09a7af769-83094798f74mr18262866a34.8.1792093662804;
        Thu, 15 Oct 2026 12:47:42 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-842a7003d35sm36481a34.26.2026.10.15.12.47.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 12:47:42 -0700 (PDT)
Message-ID: <2fcf2983-0972-427b-ad05-b403e325ce40@linuxfoundation.org>
Date: Thu, 15 Oct 2026 13:47:37 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/2] Start removing X86_X32_ABI
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>, "Maciej W. Rozycki"
 <macro@orcam.me.uk>, Bill Wendling <morbo@google.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Jonathan Corbet <corbet@lwn.net>, Justin Stitt <justinstitt@google.com>,
 Nathan Chancellor <nathan@kernel.org>, Neal Gompa <neal@gompa.dev>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Sam James <sam@gentoo.org>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?=
 <linux@weissschuh.net>, Tomas Glozar <tglozar@kernel.org>,
 Willy Tarreau <w@1wt.eu>, x86@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261015-x32_removal-v5-0-2bfef9151fad@linutronix.de>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261015-x32_removal-v5-0-2bfef9151fad@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/15/26 12:47, Sebastian Andrzej Siewior wrote:
> Patch #2 prepares the removal of the X32 ABI and has the broader
> reasoning. Patch #1 removes x32 from the selftests because it does not
> have a depends on and assumes x32 to be always available on x64 and so
> it breaks.
> 
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
> v4…v5: https://patch.msgid.link/20261008-x32_removal-v4-0-d389a193c506@breakpoint.cc
>    - reword commit message for #2 as requested by hpa to state that this
>      is the last warning.
> 
> v3…v4: https://patch.msgid.link/20260813-x32_removal-v3-0-e8f96cd15478@linutronix.de
>    - Depend on BROKEN instead of removing it.
> 
> v2…v3: https://patch.msgid.link/20260707212252.bYk3-AlU@linutronix.de
>    - added a nolibc-selftests patch to not break it in their setup since
>      it does not depend on the symbol.
> 
> v1…v2: https://lore.kernel.org/r/20260523093734.A3AR7reJ@linutronix.de
>    - reworded commit message
> 
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>
> Cc: Bill Wendling <morbo@google.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Cc: Jonathan Corbet <corbet@lwn.net>,
> Cc: Justin Stitt <justinstitt@google.com>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Neal Gompa <neal@gompa.dev>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Cc: Sam James <sam@gentoo.org>
> Cc: Shuah Khan <shuah@kernel.org>
> Cc: Thomas Gleixner <tglx@kernel.org>
> Cc: Thomas Weißschuh <linux@weissschuh.net>
> Cc: Tomas Glozar <tglozar@kernel.org>
> Cc: Willy Tarreau <w@1wt.eu>
> Cc: x86@kernel.org
> To: linux-kernel@vger.kernel.org
> To: linux-kselftest@vger.kernel.org
> 
> ---
> Sebastian Andrzej Siewior (1):
>        x86: Start removing X86_X32_ABI
> 
> Thomas Weißschuh (1):
>        selftests/nolibc: remove the x32 testcase
> 
>   arch/x86/Kconfig                               | 2 +-
>   tools/testing/selftests/nolibc/Makefile.nolibc | 6 ------
>   tools/testing/selftests/nolibc/run-tests.sh    | 7 +------
>   3 files changed, 2 insertions(+), 13 deletions(-)
> ---

For selftests:

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

Do you plan to cleanup x32 checks from selftests/x86 Makefiles?

thanks,
-- Shuah


