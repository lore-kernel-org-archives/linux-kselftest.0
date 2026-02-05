Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BCB35292B
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Feb 2026 06:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770272208; cv=pass; b=ebjc1bBY5bS1DQDkIjdpJS8YKosZBuWboC/D2xBXp0FvqIRXVTvD+2WYhpWHugFmhQgrMG9M/uD7bNEtoI4Rvji7xclrNirY2+CKK6CjAi95MTAPplRJO+vxy1tZvaJIsDDbGA7yvtbw9XqBOtQyk+wFxTpqaJDpIJ1FSpiM4aQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770272208; c=relaxed/simple;
	bh=Eih5sN2bTILR3ZvH/gAnFdsIvFT340ju2uCPCiieP5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ejPf1wkRqNr6JzUS1gTgaQH/Jl6Rq7cCCk8rRnkT/fzEPKGGjPh7gOgm7tigDbr4964HzS2Byf4e8Gh5/n4okxRZk+0mF4Aj5e/98RvJPEAnOq+XkLPSBx1X3LkJC5WPE/KNGyCwvE9Qaq+MmH5q49E+QVZkjtLiGXmVaa9MeEE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HWkrBlkl; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HWkrBlkl"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-658b511573cso1019144a12.0
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Feb 2026 22:16:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770272206; cv=none;
        d=google.com; s=arc-20240605;
        b=H70PnIl7ELV+bM9FdE25qpRPvVDiS9lmboWgxGfycSVQWOHoPO2J4z6cm3JdJxYdHL
         sDZ7TULvuQiT8yhxCYALsvV9SDJv2KXpqtODUi51NaHOviMyEjI0OODKFeFZViwLaJs0
         NtUHJh0iRRX49UOh5qMhGH/cBW9HZiNlaf2i4sPIZ0WgFPoYb/oKcg7jsO2MC6cXzHV6
         YnK+ARNkDiMdt3PxVTfXGp5FDG85NGk8KQzyMoqQYh0+5R05l2hU/nvAZv1+9jw9mzGP
         HRi3TnE8JGr3s+PAu5+T/bzfy6r49msxg/6fGI/O55XH7E/GfZNKt57t3XoM4DmVMLlo
         yW7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JA9OHnuh3M43fV/HxGh1s7Y94CvOcJ2R1oDY3FaAIEo=;
        fh=M5gObzHDs37N/DR7/yfFqW2pMClvcE9GkAvRrjUOOgY=;
        b=CFUfb9jDQZlGsKRx+nN11zJs3yfRxZXDlP7nt7kRtJgRGQoDLY47Nu67d9fc0Yzy/D
         sx5PT3Kiv2X3xz1CP5FJP5SjFAwqn1PlUi4/zb+lpPIh54R9fz4qgRY6Ec4xVCmP271r
         jXHYI7ZDJpxDv3P8LTtujcYW6Qi6OPQ4FOocWkZw2sLXQoioptXnhXYdAiEucjLH9myu
         OdD1/cViM6hRTNdqugaC6mFT8JwUxDenw7MVSCjywo1iJVmwTEXOCB4lO5nrQdsh/XLT
         lPtHWxJmqlL52bQVaoKz+vvHBUXk4KTleFNCV5YNHuIe8vkRg0LywL/5KfjJuZNeIJ32
         t7tg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770272206; x=1770877006; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JA9OHnuh3M43fV/HxGh1s7Y94CvOcJ2R1oDY3FaAIEo=;
        b=HWkrBlklV2gTKVYKRdSKs0W6LjKMLVqpk9lJB7Qv1uPgZoTnOxGV6bh1ZnshHTT7BS
         7ohae1kMaYACj1DuPQghnak7lXu9qrj82JTvzdEB7Tpf0xlYkZvGW32QiPIqsh//yk8i
         VPRKksvp00gDnP9MvUWeVPslOlgT0N+Vxl43gdeLkMwwviVvMJyJxXZYPQ4cRv8fsrHh
         Tr0IuGMnWgg1NiWB/DIhl3O/Ato/aGAUINSTIIGq8YBrozDwefcVfcYpG9cHTrteqggp
         OaoHNqXxdPnb9V1Ok1w3eZXG8nmnN005tU7WdwRTA0iGe4o9JxBqnQsHQhompnCtKz0h
         z+cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770272206; x=1770877006;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JA9OHnuh3M43fV/HxGh1s7Y94CvOcJ2R1oDY3FaAIEo=;
        b=nWWnC3cpcodyH+NbzkCkJeKlhNEQkNME+NxhAL8dkp8RXvehoOm6ppWS0AfvamqZmP
         lgKG8ASWMTQ0vju+QZYd5o2psMto1n15zgWnzBpJc2gaDi6cCW/Gj893qQo7ExsPSWQi
         BWd2FrSkcDUXRsvPtUInJ7BTdNi/j6sXj7FBeWGKwqwLy/5QJUhcZpG3tV48WDBo+ND7
         WC+jB4hWP0vWEbK6sRi61mMHDwENRRIjpoA6dzINxlVSsLy80hHmAIZv3F4QCwSCkK/w
         KywvYXVYv/kmfQU1dZ0pzBP2lvh6Oi1TJxEKoO9nA4iVBfbMTNW51UWCLUv8pjon/Sf8
         lBkw==
X-Forwarded-Encrypted: i=1; AJvYcCVSY4fIjevoNQsIiCJvl+EskkqBkT75XZF9jSbGbkbqCjktWGz+mbYe04KooUWGAOYNN19bWpRbmFwHt1atXqE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuSNgNYcE8eCo7mH50UIxbI2QGlEFkmdtC65rx9J4l+FumGK7J
	0gosSiAmRc/TXGY3COgn+g9ALVhAVXZrQ7asZD6ddD/5rTdliqDrM3N4b/2fZduntnCHMeEjuUv
	5bsYC+lw6jkAT4/r0npvcUUdvYDTdjXc=
X-Gm-Gg: AZuq6aLRgqe8KIlUN/mSsEGA8C/kNEPaOkSftVvXbaE0j9vwzJimuV3zi2ZGGdBnkjR
	kJCGOeMUsptj991uxCJ00QGtFLk1bE+S8P72yKCsBCa+MZCV3q/3YNJryW+DMA6fwHDTIlSenO8
	fQsEfNoQLXB4rrGQNG4V+AGW6q0PHuI7B9rTYr8B3wwUndwoX90JTi5ahz+LISM9dSjwtQvWVR+
	gmAi2jlmHrgqb8nCgr4w9Ia6ZbOcpSDYqrAWWhBqa10PkPGecoAV5iBDJGVYWVw8ClrXv1zp5VX
	8NinJCL62i1kBfNoa8CG3F1fXce+
X-Received: by 2002:a05:6402:3590:b0:659:428f:a6c0 with SMTP id
 4fb4d7f45d1cf-65949ecd97emr3649759a12.20.1770272205953; Wed, 04 Feb 2026
 22:16:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203063357.14320-1-linmag7@gmail.com> <202602041817.3967F048D@keescook>
In-Reply-To: <202602041817.3967F048D@keescook>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Thu, 5 Feb 2026 07:16:34 +0100
X-Gm-Features: AZwV_Qh9qSr97rdpX49QnAdOg99x6IlE9VbsQKJ6b3__Z5VT0o47-_EXswe7Phk
Message-ID: <CA+=Fv5S=XxDyNFdqhR3p_wEPwGEpjfE+Rqk1h1JJhactWFib_Q@mail.gmail.com>
Subject: Re: [PATCH] selftests/seccomp: add Alpha support to seccomp_bpf
To: Kees Cook <kees@kernel.org>
Cc: luto@amacapital.net, wad@chromium.org, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, glaubitz@physik.fu-berlin.de
Content-Type: text/plain; charset="UTF-8"

>
> Great! Thanks for doing this. How did you test it?
>

I have a kernel patch ready with SECCOMP support for Alpha,
I'm doing some clean-up work before posting it. I'll have it posted
soon.

# PASSED: 111 / 111 tests passed.
# 13 skipped test(s) detected. Consider enabling relevant config
# options to improve coverage.
# Totals: pass:98 fail:0 xfail:0 xpass:0 skip:13 error:0
ds10 ~ #
ds10 ~ # uname -a
Linux ds10 6.19.0-rc6-00087-g8f403dd8d03b-dirty #121 SMP
Wed Feb  4 23:20:21 CET 2026 alpha EV67 Tsunami GNU/Linux



Magnus
> --
> Kees Cook
