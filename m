Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6EEB364E80
	for <linux-kselftest@vger.kernel.org>; Sat, 10 Oct 2026 01:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791595716; cv=pass; b=K/sw+nEyqffRer0WNay2UpreWfTaZwlnAdVvKFcei4CWJXZogjykZPo1glo+B0x/9F7Gx1wuR1/QfmZdW1FJRO7YewuIz12t06y0LGm8eeLZ2mLU1McH8Rvp6PQj/dnuHFBbSzj941dWmA/BXIzB03FaLzLTV900u+kKqocllt8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791595716; c=relaxed/simple;
	bh=PQqVEjZzdFp6GX6b1o8Wd/bxI6ijPC2wBjMspU1yLMQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U5tHTaR4ufRXwKJfQ4vJPCqBZxZtbYdoJFq/vmp+JLUBya9+HyV3uF/FpXAflk1GrMfG3q3ApWF+nbFwKPMEUZhkTskcNp0SOQwCJveXqkzUeCUWDfDhiVLMbXiCQjLIELmu1hSpH+Cas52+WseJF/47ysu+CNMS0VALVcMqCRU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OzT60l2j; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OzT60l2j"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5bccc73eea4so4158829e87.1
        for <linux-kselftest@vger.kernel.org>; Fri, 09 Oct 2026 18:28:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791595713; cv=none;
        d=google.com; s=arc-20260327;
        b=ggEE4xLdj16EDkNIDTwy6Pcnn8Fm1L/1N9M7XLJRFJ++xN3oqtdtoDo48fmFcLoKqY
         KVd9vLglzvSrucK4ZgxtSZzQZKqngr/iiZ4waRulKq3LjR1tDjvtfsi2VmFyo708KNCB
         t8LojvjrqUqMcKib1pKUXw46qmOtlKMsCY3zJjpxXHWa22ydz4mN6Pmz76o7PT1/rJxC
         MHVUK6+phOPRf57jSr8mslEksOSfwl38Uija/PD1ohyXn+HwU12ycMFAYowpUK98jheT
         Vg2smDNHb+TsUhQf1UM/jYnDA1YrsXJNOuvtHSMWbdSFLyXZD0aUu2q+47BJQ6TliII0
         3+vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=T/OzwRCxr09DXaCzTWYlnEF4rrRvRgzzD/Ns0ejgdsg=;
        fh=bbIWl1f0LR+bhu5ADBQI8f0VSOiUZRbA+CcaonSZ3s4=;
        b=lpdav3BoO+SqNuyYVH/3TUcgzgS3IOpxQiLWXUXM6skv9J22FSqq0zgDixlb9NvoaR
         OQH+Ipilq/SS0TMEybScLjklMendpHNQdWP2IIbyjdfplGbgnW1aRGU7BZCRpzXnFhCF
         iu/ry0FJMldgPenl9zQDh2vokLDIXPdOxxAxWxc2x5cHGAiNT999fvag7vPzy08x8ksK
         BiWTzckbtc15m14vBumH8W4Pb9j50KW1TvPAL50UExylSwKE5XuZTCID2mY0au3uXbS3
         nvN6C1CZWnSPLGRaoTYjkP6XJMxZSnUrnzrPllnVLBpqkyOzQqmtdU1xGNR94i+PovBQ
         YcEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791595713; x=1792200513; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T/OzwRCxr09DXaCzTWYlnEF4rrRvRgzzD/Ns0ejgdsg=;
        b=OzT60l2jIGPMMgXLWRAOXHu3a/uKiubgWpCPialmeFR7MzXzPlteL6nzmBxaiZLsjR
         RT5lQ/TdjJMYVsmgYor+zZ/viJPrbQDoGg9kpjT9pwlUqQ09Zf5y4epvxYJOidElaOhx
         Kj/Sy+FJRQ53U6AXZ6bccMg/6BiVZ/Q1hByBLy8sEJ+x1+foc5+jC3UF3x3hAcj41QT8
         rBRLyBeSGjVK5Oep/YS03/R76wuwnMU7H0POqX4pBp9OBkM0c/t5Yl94/EVUXH9S7Kfl
         qxWMs9CQwZ55IrWX8AtUIcvR4OlUAm5wYbfa1JBSiUtcPeKDPFdfKYcZPn0CtgIHtVSX
         xYYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791595713; x=1792200513;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=T/OzwRCxr09DXaCzTWYlnEF4rrRvRgzzD/Ns0ejgdsg=;
        b=ysnkly6s71+S+wbPnHNN1vBstpqC2jAlz23eGnwJ5Tad3NRM8k48WHnkX7qiYl4xg/
         bIrrNxQUY1kPRkZEvROtOOl0tH7hZ4jSplGXbcSByXYtTgipgz7LGlzEQZKy2RClTqWo
         qJ9VOfEPqPTWBksSlo4QTTPkWg6JrQGXFGHN10POvbygQA45tnuoS+NPF3cYw2TZZlTe
         br7eE24IAcGvVg+bA6J5/c5PRyiGEhT+lU8pR6z6ZludrXmoNRx95Kk5AztpkVpyePnQ
         J8ZQxlKhnAYCgs1jNr2uveOCydZDgMx8Mfs5PMEZWX4l9fv0yhUDOd8K/Ypoac+G0PfL
         BkMQ==
X-Forwarded-Encrypted: i=1; AKwUvBybWCScMtLK7GQ5C9JmO0SGQWFwKqwGEloMXTX0kGsZNO++OmAqAfJ3MwLahl+R+Dux/hDQgBo8f1niRi2Smrs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWDzxMpFo6g6ZG2saP6dKzijvKu+N+zp8VHXv2KwY2ZV4Ds3Q9
	I1j2IY0HpRHQSm9ocqeF8o/ZdWPjQBhYz9WjYBq2frJ6dqQGpmksz9Tx/FPOwkOIbE85qBKPb6Z
	qefFAP1HG3lvSrO5s3Umy5FbQHbxi47U=
X-Gm-Gg: AYBFou2en7FISWtSYoODs9TKueG/ZTy07V495sOb9+qQ7/sGaIerPdTFT5GY7UQWknY
	uLAjaW/YruGqH99tO1XY4MAgAK3sPoXri/nZ6US+pIb0rrfxocbfBkX1zQcWatKQ60XbLTsmdlV
	v+19ZCP8+ijmf8vmZ0UdZGF7dYgqRAHr4+VrNjrgqScAm40jlfMUOIbjxjWZClrW5RzZoxc48xS
	eh33Ji+/OlQrV6A2LsPkQQbY9j+ni9U2zMnjuPsJhDh59Ies0a17Prt30lZaQAQv2LledcqzWiz
	c7lFCWoFkky2jtD7WDxZY6Ly/Qy6/gYeZ3JIdXk8lhzMzOucr/sxJl1kDZqJiWYSV0jBrCIs9tn
	G8oXv2Svl8A4SNw==
X-Received: by 2002:a05:6512:3b8a:b0:5ba:3534:fb7d with SMTP id
 2adb3069b0e04-5bcdd1c306fmr1257293e87.2.1791595712594; Fri, 09 Oct 2026
 18:28:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009092759.968521-1-linmag7@gmail.com>
In-Reply-To: <20261009092759.968521-1-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 9 Oct 2026 21:28:20 -0400
X-Gm-Features: AclHuK8uJFVvPcUKKOimU7sHm2iZxU66fHvjABbh1-Xp-I4g_eUpWRz-8ZK04_o
Message-ID: <CAEdQ38FEDRnc6DR0mTtiAfct2WwvSVjrFWtTzQrN-DtECaS-MQ@mail.gmail.com>
Subject: Re: [PATCH v2] selftests/seccomp: add Alpha support to seccomp_bpf
To: Magnus Lindholm <linmag7@gmail.com>
Cc: kees@kernel.org, shuah@kernel.org, wad@chromium.org, 
	richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 9, 2026 at 11:27 AM Magnus Lindholm <linmag7@gmail.com> wrote:
> Skip the pre-notification signal test when /proc/self/syscall is absent,
> rather than unconditionally skipping it on Alpha.

Nothing in the tree skips it on Alpha; that was only in v1.

> +/* Alpha returns positive errno in r0 with the r19/a3 error flag set. */
> +# define SYSCALL_RET_SET(_regs, _val)                                \

r19 is still the fourth syscall argument at an entry stop, so this
relies on the callers also setting the syscall number to -1. Worth
saying so in the comment.

> +     if (access("/proc/self/syscall", R_OK) != 0 && errno == ENOENT)
> +             SKIP(return, "/proc/<pid>/syscall not available on this kernel");

Alpha selects HAVE_ARCH_TRACEHOOK, so the file is there and this never
triggers. I guess that is why you have 12 skips now instead of 13.
Please drop the hunk, or send it separately for UML and friends.

With that:

Reviewed-by: Matt Turner <mattst88@gmail.com>

Build-tested only, with a cross compiler.

Unrelated to this patch: with the selftest setting a3 itself, do we
still need the fixup at the end of alpha_elf_gregs_set()? As it stands a
tracer cannot skip a syscall and have it return a small positive value;
it comes back as an errno. The r0 == syscall_saved_nr check in
alpha_finish_syscall_to_user_mode() has the same kind of problem.

Matt
