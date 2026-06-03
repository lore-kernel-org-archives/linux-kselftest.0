Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0023CF058
	for <linux-kselftest@vger.kernel.org>; Wed,  3 Jun 2026 17:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780508521; cv=pass; b=pXMop6BwYc1GqgBOd0hHPJystVha5GdFFYAqob3SzA/xDhyhRl/UndgPQh7S4wIKHetZ8ZGT40Kk36j7SJtDe9AC3uoyfw21xLcHIcJfUXkAdJaviTU06fH1gFLreyDYIjXtemQ+146PKaVBSY4rVLzgcv+y/koZx7l1j8zIT2w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780508521; c=relaxed/simple;
	bh=ktTZU/YyZ90NPmOMiaPjVO1+hM5aHam3On9tCHw45GY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nzfmXXI7HtaDemOgWq5oxgDKPCAw6uZ2Amsi7L8Y7H6eJ1vQ7kZStV5vSnchmZmu77iNb7HndySGVlib/aANH5ufV7kwkrD+5KNIJ64NGoY0KIz2QiBee5BsDR/el+0JbMVpwRzKOT+Lo26ITiI99PRdhT1sfjlLALktXF1440M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UleC0klB; arc=pass smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UleC0klB"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-137ed2e66faso2314223c88.0
        for <linux-kselftest@vger.kernel.org>; Wed, 03 Jun 2026 10:41:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780508519; cv=none;
        d=google.com; s=arc-20240605;
        b=b+xyUrF5g8/vOLhpmDu2+PllTK14rpyNlKczziPpSakustycemauVvr57aE/AgNJk6
         HMQILzke+wWZoByKZ9lzTRD3+Xvk7OMWlFggKZd+iE7cz/tmkLBsunbs12Av+0c8yJDz
         +zymKonYTWngDukalKctYTI+J16ve6wa2Ux+jzI8uaCeMat7j9IOvwOD3Zka4dh54Lr6
         u3n9GHkYdpH30RHeRn1xinxpHsAmOKNftbykI57ul7X9fcyqdgvbCQbUlxc9NAXPzN8e
         rSX4DXJvXIGrsorl72ET/FTFzaVXf318N7bXTYjsW0DJHtvexE5W8OyJhX9WN+QAIPWH
         zRXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ktTZU/YyZ90NPmOMiaPjVO1+hM5aHam3On9tCHw45GY=;
        fh=oBRpK5r4IJkCMqM82VPS1vpUgQEVABmeT5uuK1UGSKQ=;
        b=dz05uQ5m9QGQQyOCq1IYnFpTd0DvLWEKHBbwnfZoxIGcBRCS+0cQDW/YMMthEwDtqW
         KSsMQS8Q/Hs+02eWZAW/Y5ICfpkQwxvWqFeOhp0l+uEBd3pYJqArm8GbEWR5Y+D0MCPN
         FXHo9SMOFgfZMPTFy2mIMME7z7N7ZjomyzW3DfUqxq895Mq9YEKw5KsOkg9eSO9UHnRo
         KVNJRlIwyDJTN2vM+KJXhyamCEAuaxTpEOO7N3wW17njN4HCLPO65wtVLiHK4nXGXXsZ
         0zk3sczeFJ6cB1TJDr/TZ9iXQepY+77vGDcaALFKenh/uMsuni+oA7cSBAzNOAvY2vpL
         tvOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780508519; x=1781113319; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ktTZU/YyZ90NPmOMiaPjVO1+hM5aHam3On9tCHw45GY=;
        b=UleC0klBktienY7MZxZWkJaOexZ4tWk/PVCsNibKM1RMMW+MZDhaeZ/5ZbUCJwTPAP
         n0zHfIxfHJng/6rlFl4ivCWT0u7nCE0osbb3GOaBEEHwK+g9tf+L9BzOZlCchPGjFrdG
         cidxxEG6ESDWWpyufz2yVc1XY0XHOzQspPYLnl5sZ3qdtACeZyXcRPhQgzNXw534rxtQ
         Xb2YCDGRIu0HAX1x4M/X6HZaScBScJGgrwnr6PZjxX6ZoUhleVTgbvP9zLcCEZdLMvMG
         qpgo7O+z1h+N5N9eKn6ke968Re5utdQfnQoPsq/4ooj1I7s1m4CBwGXJFlLU7HU4XBEu
         yAIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780508519; x=1781113319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ktTZU/YyZ90NPmOMiaPjVO1+hM5aHam3On9tCHw45GY=;
        b=Jt/n/G+zL1RWAbsYjuuELAjlIIoKuFPe8uWfiRTA2ldzUWef8qkb+sqglbG6X9cdPb
         7uTSNQFuK0n8gE6zXhAc+BzLdH5K5MNYY+pYbFQeIn5Xcwmj4aVdaUSS2vYqc6giCkfP
         l5/L8d8/nhGOh9XrXjTxEO1BJ9K7ovDA+byiDXXGZvDamoh37S6qIkPZCzNpKh9A7doo
         1ZzyvulPoyQKbYVR1smKAv+EtUPsICKl3Rf9e9e1d6VErEZRztAmhRfrPrnj5Vy42Nis
         5GhNm/7PuAvPUO3FQrK6F4QWqvhdGXfa/9SikB7FRZtlx8EbV2rqu/0toWxR2NlnyZAm
         0Vvg==
X-Forwarded-Encrypted: i=1; AFNElJ/vBsLSr6np4VcyAEpQXZdbvPnfVj9EbImleHOAtapM3AG2M2MDCi5pDFiHBdERvQu+LJToQYyXMuohMzM6sGk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUcQKwfkZ0/3Iw2u+jLkDJv4CM+r6YKGyFGmpNwyX3qjQZ1R4O
	RB47/88gxGkn+e7F9/M6HIzdxR1THNCU/9AQePoWX+mRkF5sk3JKBSEckQLsBMNiTTnv6X9cmY0
	Er02+V5zokW8UseTacKu3jDmLI+vyNwKDTVHzkzw=
X-Gm-Gg: Acq92OHD2YLNZsuqXXWkGPk7S6tFQTkwp2y6uR4ev75/oTMRbY2to2GPRdpgw+/YS5F
	w5jEbq2fw+vg+htNo1y862HYtIUl7CvRDpYfuAzJIduUIsS4KlznjbyT5MsY7XrqmakkgA4TbnD
	R3JIRBj++LUgA4nilY9II+vuMez36ZQ6fpAXW2AoQ2WUYakEzQa98ZB4NUJ7NLA7nikg9V5qeQC
	jF5kZv/DfzpjHrgLIxlhlvMhOBTDKGnT1YlAgxq+xl4EIJZcZxCiEkkXO4CSqmlff+T1Wm1ofYc
	OdWwzjrNMxWiWchlw5RfLcKz1IZ4nfqvzCXcbsNFLGkNNcH7ubg/nUxe7oj8oZpkUKoubBOuUJm
	MZELeNbb1hnedovXD02ahTfZqvSqri9BF5l4NCJ4D9SFd
X-Received: by 2002:a05:7022:6185:b0:137:ae1d:5b41 with SMTP id
 a92af1059eb24-137f6939d20mr1945329c88.2.1780508518224; Wed, 03 Jun 2026
 10:41:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603075540.659524-1-wakel@google.com>
In-Reply-To: <20260603075540.659524-1-wakel@google.com>
From: John Stultz <jstultz@google.com>
Date: Wed, 3 Jun 2026 10:41:46 -0700
X-Gm-Features: AVHnY4LI5CArKQytxrkS3crkUmy8AisHg1SJgHNdISFPijxZcCVZYo8iGeJIjtI
Message-ID: <CANDhNCqpWoQcPqyvg2VBHUmC0Y2mw2qMH5eU15gBouCOPbX5VA@mail.gmail.com>
Subject: Re: [PATCH] selftests: timers: Fix integer overflows in 32-bit mode
To: Wake Liu <wakel@google.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Frederic Weisbecker <frederic@kernel.org>, Shuah Khan <shuah@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	cmllamas@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 3, 2026 at 12:55=E2=80=AFAM Wake Liu <wakel@google.com> wrote:
>
> Several timer tests use NSEC_PER_SEC for arithmetic. Since NSEC_PER_SEC
> is defined as 1000000000L in vdso/time64.h, it is 32-bit on 32-bit
> architectures. Multiplications like NSEC_PER_SEC * 10 or 5 * NSEC_PER_SEC
> overflow 32-bit signed long.
>
> Fix this by using LL suffixes or casting NSEC_PER_SEC to long long to
> force 64-bit multiplication.
>
> Signed-off-by: Wake Liu <wakel@google.com>

I feel like this has come up a few ways since commit 80fa614e2fbc
("selftests: timers: Remove local NSEC_PER_SEC and USEC_PER_SEC
defines"), and I definitely missed in that patch that the
include/vdso/time64.h NSEC_PER_SEC is defined as a long instead of a
long long.

Setting include/vdso/time64.h NSEC_PER_SEC to a long long probably
isn't a great idea as its a value that gets divided & used as a
divisor, so we want to keep it cheaper on 32bit systems, but anywhere
its multiplied you are really close to an overflow without explicit
casts (which has been a pretty good foot gun over the years).

So I'm wondering if it would be simpler to just revert 80fa614e2fbc
for the selftests as we don't have to worry about the performance cost
of doing the 64bit math everywhere there?

thanks
-john
