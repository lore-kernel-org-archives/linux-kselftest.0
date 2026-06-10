Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966F725B08B
	for <linux-kselftest@vger.kernel.org>; Wed, 10 Jun 2026 01:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781054941; cv=pass; b=Kb6OL7spQo7z1wMQOBX6SWnXcjDWPpqBxsjfWNA9fNxMaonwVtqnKGo9rKLJ0lnRliUxQ0JPQ2x8HJrhWJotHZqZomhlysfO+/9QUEZMCNtSevjdtdy40EGPUhDmYrQsHQZQAjXUcZogrZm3rZ+RycM3c13on30oXI02K7eiX58=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781054941; c=relaxed/simple;
	bh=IqOK1+5fudVeP8BL8gBmTaJE/H2hbOMc0XnCEqUPqSI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i4xWzv0rLHj6QLGB4H4IDP+IrOW6LjRHgX9/GLjUsLv+ECRJWAM5rx2ZZmuf0PhVwgdfgvQ6ZA4SV1qyuYfi5PW4tTM1KVCF879iDMb91q0EGS3AXgbMuH9wbH6JMQJO55sSU69xJXBE5Q4EniA77MZX+zVJi6fBQ1A+XT74cyI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eMQZf7kE; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eMQZf7kE"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-137ec563a95so7788278c88.0
        for <linux-kselftest@vger.kernel.org>; Tue, 09 Jun 2026 18:28:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781054938; cv=none;
        d=google.com; s=arc-20240605;
        b=X1y4yurGcgPSnyUHmkztFfSqi/Yo3eWuLdks+hDypbyY95EEECr6pbon+Iho3ixEX+
         ZrxVAf2VwwWiBtiIcsRQgroQh+kvfiIlZDIXmEcma9mc4yhIISQL52Z028mjJQ34/n9U
         TQ+iTxKAPBbP79LlLjiX0YD+kR8vD+OL9Ehetdn4mMGijYTRMOyuNl1wgCuaeb7Hmf0/
         NvNP2LuB1AMJKghnNNlczEvM/Gwq3y9iwbOuzCsf6apI1kaCEa5H1hxpb5CEwTF6wAGx
         9Hqav4eLyHVgUb1LmYPAgYmDg8jQWgsyoSRqpT7sNSE7zFoQXGvHWLpXBrAp/tUZcNK2
         8hew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9pxft4RGSkNVv6GqkodfSGejGxUGbkv6gV2e27BXZj4=;
        fh=9BsV1CAUivw6RBH6r844kzDpZ/2z5F7IaqBe6rEE1cU=;
        b=Vtm/Nc2SWbu6DD2lXPf4d/XZzzhSlu0w8pfRWqJhIK98wirD/lK6ft1GF4pE1QCirb
         DQU97i55ZHzm+38OzVLjQ1ddu+wm9v0F8AfGEADX77JDkW/dUV5ubjWx1C/0HQE3xMbj
         3R5m+sztA5tjvxeTfl1OwAprQerpLvzfCBDPqg4jNFDDYgO5RaPIMDoULx7stNrS4Utx
         YJQEXtCiHdNe7v62MSx0U+XyD8x1l48pXUo6pfdlVYO4vlPnh76ka+wrRtv1vGUl+nT1
         ecv1iZ1gvjJFDgz1CwuMaZU/xNelov/P1cSLQ21MaQv4eMFmBQdt1cD/+SuylpSpqHoQ
         4QQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781054938; x=1781659738; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9pxft4RGSkNVv6GqkodfSGejGxUGbkv6gV2e27BXZj4=;
        b=eMQZf7kEM6RmdFSANL/YNU9fI47PfVEC5DRnbjJ9iOKpE8Npyv310C0CHraoNCf3wF
         vnrImkxolSy4und+oFThBGGErxtzarVr4B4aA8cUXNuB7ZfMrOy8d3g+dnp1r96yTWut
         laQRJSkoPJl8amXvYuclQd0CubsEWQesZf2enH8B5uvmxUUg7WYlxYCd+p6Z/HfHqnYG
         s+a6HTnbDi3a3+shJhGbFhtHcv59Q2pIE44KlDjYEqSQ2ovfkhDWJbrTDTMQ74J2K+wJ
         Sy311tGrNnc3bDFZXMiWeLOQFxanC7YicQ20H8nuh4e737JLkhtkIYZUhi8Jc/xpBwEQ
         rhAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781054938; x=1781659738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9pxft4RGSkNVv6GqkodfSGejGxUGbkv6gV2e27BXZj4=;
        b=nfHixOvGrGbV4Y6JBzFVB5BAww0krMMFLXrukx5767Swn+C+QdrkVqZOH6/0fROVBE
         Eae1trq7TA6uXCgduoY3MzWw4nxXejqIvcnNr8Nv0pOxeu7vJhjtd7p5GY95ZK2GWjUj
         Vs7YpSkzVetT1Er+zXt7uNhol58Sm4gU/T82GwuFv/gXIza5W8FNPPhy3BwnIeZSCvum
         rwqP/Vmvmc3PCZ3YPXyOHU8znLA9kPdAFOPSjas1HChL39LKds+2O7axcMui5n8KkAkZ
         MqlWpnxqS+EYMqSxKIJfgOgRj9cY9pXhCVrlcqDEgWH83u1oZV8OHV4FvBMCSqg12nkX
         YRqQ==
X-Forwarded-Encrypted: i=1; AFNElJ95eq/UH+d60ZXfsoNXX3VtBBMduISSPlqg3+PIAsHABa5ZVoLT+dg6iZy8L1l2xcImI/wRgG8lxMA745TH0ow=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCfSsSylkvifRZoensUkouUxJEyCQLarpFPMt5RNBA5k4SsTM2
	zbbjuZlHIGiUdP9yZaXg+0vJLnTyebq5fENJNdBrYzU2ItgQEffhrilkx/jEQYUMoRhEqQWZbUD
	L7mL0v2HkQi5oPeXBlm2q0Yz/7yucuSyHJrDXUrk=
X-Gm-Gg: Acq92OFpLLskCfwyW/2JMTaZPNT5RM75/yIPEqF9yhOPJPQrOq/OaPg6P+bmfLPEFD+
	wNslVOD+pM7p1cUgqwNSh5ZwzavtmY7bhLLy9icGLAuQZl3sYy9TS6IVFCCTO8oO1/9GYke0f2r
	+gfpEdqcqBhlXvIw7O5djpNAPcTJsuwFGBHuLZvmBYOONhJXVtrbjwofi5FRgqITZzPiddjMp75
	xxEMK4er73Abs1cydBT/PBZfqf7yorPU54FbbYTiod10h9bO6X/NzlawBWMaY9WZYQGW10U+UFA
	fYY5yPIUPhATc1nCYT9fK0lEhQ8/IyIiMdJrQXvGKceNaQTkLVzHl6y1JryCo828wjon+1IVKNG
	AO4xHN+6QAgUe2iSdPx164hbTudYkhteDS+3iQViAGNTfXw==
X-Received: by 2002:a05:7022:6999:b0:12d:de3f:f3d9 with SMTP id
 a92af1059eb24-13806720fffmr10805225c88.35.1781054935824; Tue, 09 Jun 2026
 18:28:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANDhNCqpWoQcPqyvg2VBHUmC0Y2mw2qMH5eU15gBouCOPbX5VA@mail.gmail.com>
 <20260609075605.234798-1-wakel@google.com>
In-Reply-To: <20260609075605.234798-1-wakel@google.com>
From: John Stultz <jstultz@google.com>
Date: Tue, 9 Jun 2026 18:28:43 -0700
X-Gm-Features: AVVi8CcV_jSEqK_lxABg-Za6DTLT6l8m0xKxlZQt0FLZB1B7j2MhkuoqfxjnirA
Message-ID: <CANDhNCrDSy8Zf9yo4uKGOtJnLVSNqF6pOqZiRr9giyEG89qpMg@mail.gmail.com>
Subject: Re: [PATCH] Revert "selftests: timers: Remove local NSEC_PER_SEC and
 USEC_PER_SEC defines"
To: Wake Liu <wakel@google.com>
Cc: anna-maria@linutronix.de, frederic@kernel.org, tglx@kernel.org, 
	shuah@kernel.org, sboyd@kernel.org, cmllamas@google.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2026 at 12:56=E2=80=AFAM Wake Liu <wakel@google.com> wrote:
>
> This reverts commit 80fa614e2fbcf11069f0995e1601fb2e5702e2f4.
>
> The reverted commit replaced local definitions of NSEC_PER_SEC and
> USEC_PER_SEC with inclusion of <include/vdso/time64.h>. However,
> NSEC_PER_SEC in vdso/time64.h is defined as 1000000000L, which is
> 32-bit on 32-bit architectures. This causes integer overflow warnings
> in several timer tests when doing arithmetic like NSEC_PER_SEC * 10.
>
> Reverting this change restores the local definitions which use
> unsigned long long (ULL) or long long (LL) suffixes, ensuring 64-bit
> multiplication and avoiding overflows on 32-bit systems.
> This also decouples the userspace selftests from internal kernel
> headers.

Hey Wake,
  Thanks for sending this out. While I agree reverting back to local
definitions to ensure we're using 64bit values is better then adding
lots of casting, I think a straight revert isn't maybe the best, since
the original patch did have value in cleaning up the inconsistencies
between tests.

Maybe a "partial" revert would be best, re-adding the local
definitions but avoiding the quirks and inconsistencies between the
tests.


> diff --git a/tools/testing/selftests/timers/adjtick.c b/tools/testing/sel=
ftests/timers/adjtick.c
> index 5b3ef708d6e9..0053c6c5bfc0 100644
> --- a/tools/testing/selftests/timers/adjtick.c
> +++ b/tools/testing/selftests/timers/adjtick.c
> @@ -22,10 +22,12 @@
>  #include <sys/time.h>
>  #include <sys/timex.h>
>  #include <time.h>
> -#include <include/vdso/time64.h>
>
>  #include "kselftest.h"
>
> +#define NSEC_PER_SEC           1000000000LL
> +#define USEC_PER_SEC           1000000
> +
>  #define MILLION                        1000000
>
>  long systick;
> diff --git a/tools/testing/selftests/timers/alarmtimer-suspend.c b/tools/=
testing/selftests/timers/alarmtimer-suspend.c
> index aa66c805f6a4..ba277a708aba 100644
> --- a/tools/testing/selftests/timers/alarmtimer-suspend.c
> +++ b/tools/testing/selftests/timers/alarmtimer-suspend.c
> @@ -28,10 +28,10 @@
>  #include <signal.h>
>  #include <stdlib.h>
>  #include <pthread.h>
> -#include <include/vdso/time64.h>
>  #include <errno.h>
>  #include "kselftest.h"
>
> +#define NSEC_PER_SEC 1000000000ULL


It seems like picking LL across the board would probably be a good idea.


> diff --git a/tools/testing/selftests/timers/posix_timers.c b/tools/testin=
g/selftests/timers/posix_timers.c
> index 38512623622a..6f78b6068589 100644
> --- a/tools/testing/selftests/timers/posix_timers.c
> +++ b/tools/testing/selftests/timers/posix_timers.c
> @@ -16,13 +16,14 @@
>  #include <string.h>
>  #include <unistd.h>
>  #include <time.h>
> -#include <include/vdso/time64.h>
>  #include <pthread.h>
>  #include <stdbool.h>
>
>  #include "kselftest.h"
>
>  #define DELAY 2
> +#define USECS_PER_SEC 1000000
> +#define NSECS_PER_SEC 1000000000
>
>  static void __fatal_error(const char *test, const char *name, const char=
 *what)
>  {
> @@ -87,9 +88,9 @@ static int check_diff(struct timeval start, struct time=
val end)
>         long long diff;
>
>         diff =3D end.tv_usec - start.tv_usec;
> -       diff +=3D (end.tv_sec - start.tv_sec) * USEC_PER_SEC;
> +       diff +=3D (end.tv_sec - start.tv_sec) * USECS_PER_SEC;
>
> -       if (llabs(diff - DELAY * USEC_PER_SEC) > USEC_PER_SEC / 2) {
> +       if (llabs(diff - DELAY * USECS_PER_SEC) > USECS_PER_SEC / 2) {
>                 printf("Diff too high: %lld..", diff);
>                 return -1;
>         }

Similarly I don't think re-introducing the plural definitions to the
code here is useful. Lets keep the cleanups, but just re-add the local
definition.

thanks
-john
