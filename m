Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D50C3624A6
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 03:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783652673; cv=pass; b=YnlD2G/SL5WBnLSWY44S0aK4lCng+39ZKpq2L+se3o/JeAUZZPs8pTXa5M/4xDHcLgNaDOxO7ryge2vBJ9B/CzNxsXfMZAPb1zEqmnjMx17sRfgGziZ/YFmP6HEGq3rV3vGadhJ4RPe5lJy07OFbwumMYnsdCMIkXdetID8hTJ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783652673; c=relaxed/simple;
	bh=dLcL34IFn1E9Ll2360H52vcSUchibGxDjGdZL0fvGUI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NfVbktu7pHRJ+pTYHbadUoOiybbzAcSI9AdR5wQ/dWapvTNNnIdGtOw+70yDqb1R/VfdWstCMD5qcCTJ7KLTfJkuFmJXVKXXgDU9PO7pkTwVFR/R4Da5NsO9FG8Mowq+Y+j1RnjDaEQVSzfr22vjTeLE4A6j+a4ghCSBQ6QoY+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eM9zAR/P; arc=pass smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eM9zAR/P"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c9fe3c9bd5fso1173220a12.0
        for <linux-kselftest@vger.kernel.org>; Thu, 09 Jul 2026 20:04:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783652672; cv=none;
        d=google.com; s=arc-20260327;
        b=mpvvjgDG+LteJ6Yta8whLgwJVUTqKHIoacIX9torKRArLmdvfd0SEseVooWJX9BBDg
         Vy4PTtOoMC6iYTl5n0/GEGWfzQFruDBzi6ZDlJAw5ru1hv3prAZUvTFph8O4w9GStYE5
         nzIJOUlpcdGqkvWEPmV+MKNfOdQ3LyXUyFeH8wISTRp00FB8AXHJgpfkceJbTtA3qc3M
         0zfkEJUN5X9c+y4TCc1FkwOWdomvqi3QiHB56EVdTEMKAl1KV78LSDBamtecVVzrhe8m
         /p+ukedpDmAA/qn4+JJWjY4hrQ60vjz1nFANItfkhib7CE02S1j/Y/FpPMuYliHRoHWx
         gyzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nOaDP1TZ6EpH/3Af4xsHwklz6kPdgm3ywq3lyASzbzA=;
        fh=vmisahYbCwACf0ny2LJFrEMCKP69oS5paFGM/3LouU4=;
        b=bNiZdoKURuZ0p/5IafGrg86TTBkxmkHcRrulAAGWndvXp1SGMOzhYGItKGXGr7evdR
         Ypp32ETC0V7d9AJrjezPS7LeqE3ZvtVqg3R6o/mAyaZ4jmXkPb2YRc9ZYj8VoYJFqbCz
         yumkA1tvnszcejJuLBbetD/Humr27DYgYLDrntd+wt22y/2EOr1D83n8Gophh3zh9x3M
         sA+yOJTfhvnfgF/IQxCQt0Yn4c+SbXWsD+FvhwLYAWPkPw0zDwXa0VzqaqRvzUjZozRo
         wrQmmHA/U0KXzYWNgAvGXCBu5atRYZKxZKqcF4v+zUI4tApQIajf+Qe1e0ZqVjWvW8is
         s+Rg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783652672; x=1784257472; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nOaDP1TZ6EpH/3Af4xsHwklz6kPdgm3ywq3lyASzbzA=;
        b=eM9zAR/P6LwKCnccQeP1uPlXkXFN39Gnf6UhjAJ0CY1iZlyEKYWZ8Gah83nQMUAc/2
         0f8w+0ttZu0pSnV2mTS78Vyz8lNJg98FURO+Ju+OyZX+TxXPGfmYGy+hH73Nf7NBxI53
         UAgQyWhdlPaawQa1ubX4eEVEnW7ZLyjqmJg9ENtS5vAP6VhJWz16O3ZTHFQcgo+IBvqU
         sG81Es05KtHIN9ia0HaELfE/BPQd/PfGj62cC0ozpEMQ/PdidrIzB7iX+Zeh5NCQ0KNn
         2Ft8leDsB3jPUwsRvJQajFNP82DOh3k2ySdwhkeNK3FIaAYaLI4/IVp39E1jzaAoKlPh
         W/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783652672; x=1784257472;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nOaDP1TZ6EpH/3Af4xsHwklz6kPdgm3ywq3lyASzbzA=;
        b=cVUlDoAkIvPK4yNWSYNBxrAJ1orEUGHEVbI+HtAMTKeU+QkhiRQfHAFGxWZHDEyWpF
         MzVEutWrBmcEREv6nnMooHoMij3MkYuHfnjEN6GbgrCG6Smsoz1Ei/8y7WBdCdKP5wHM
         kuQgfUwsuojkHbV2QM1yprhwBh4DbI0qPt8ifajcRzmAb6GjIDsQSDyQ98n9fXTHlsEz
         2CM4BB1YBTyfMn8HjAb48IB3bMdv0ykXIOjyXv1kYhGtOENPQbXAfbtykrX5Ug23EHkW
         uF34eUymM2+3Z7hL0h0NJUAak3RJJcoNQEV3nuiS99cxIVz3RvP+9NP2EITNZphduKiE
         33aA==
X-Forwarded-Encrypted: i=1; AHgh+RpT9cqJ6haHIerlLTkdpOz0rAtCinPevSa/LvemoXqItWjfwnQkrv6Mq7kzqDQKgh/wp3oUfw69EGv5IK6eDu0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgX0RMW5EqJU7ec0TOp9IdK9VfIf7a/iAinSb5Qt8TludNNDpz
	lR2+kTYHsgAUWI8IiGJKTjRlWIXazAMRDJW+YTNZWzx9+I+TgS1xpqfAH8/HyJkUPSpOhOdYc7z
	PNrJfRBZyd2T1S87jrvYko4Sl1v1rImyr11P/CXw=
X-Gm-Gg: AfdE7cnKiH/pxXfBon4S7abzJJTRVep/+g1xp0faab86uuHfytGRBrgRwq+999ASNy5
	9c2806Ca5+kwxMMQo64r1CEz6Vjq8xGjLDmLsZGgc/9yH70Uhcdy9pGXjEXXoLtki9IT3+OMvYO
	YXEjt9TeMGyBCOMK8ekZXOBPbPro5Kq9ZxXree4ePvwGWVpUOcoeQAYz3Co7jbqWFEENxcn1pg4
	53eo8+k1p6jzDUXiEnSoNsttbFxuyij23XBZ5sURYUstHRBswRz07lsFV8tcbNpLLTD2HON/7Io
	4kEk03VqvQ5n+/eXuOuUuZezH/soktVwkyAQEYMnCP+6cdKnNv1s0dpA9CiuN7/DTyxrKT2ucIP
	iguVF384xMcfofFJUih3qvmtc
X-Received: by 2002:a05:6a21:4688:b0:3c0:4179:b5d5 with SMTP id
 adf61e73a8af0-3c0f0b72f85mr2270517637.28.1783652671212; Thu, 09 Jul 2026
 20:04:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710025144.2000000-1-wakel@google.com>
In-Reply-To: <20260710025144.2000000-1-wakel@google.com>
From: John Stultz <jstultz@google.com>
Date: Thu, 9 Jul 2026 20:04:18 -0700
X-Gm-Features: AVVi8Cd7b32F9NWCK96S1SGVXaCqaVeCIrrLzY8Pt_RoR4QOeYbAjI6S6TI7GYo
Message-ID: <CANDhNCqqAqVTXXNZvKD8sppJhVY7xjb+n-33Aj1d7Kp3XoMv4Q@mail.gmail.com>
Subject: Re: [PATCH] selftests: timers: Make sleep time in raw_skew configurable
To: Wake Liu <wakel@google.com>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Shuah Khan <shuah@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 9, 2026 at 7:51=E2=80=AFPM Wake Liu <wakel@google.com> wrote:
>
> The raw_skew test currently sleeps for 120 seconds to estimate clock
> drift. This is a very long time for a single test, and can cause
> timeouts in automated test suites or CI systems.
>

Sheesh, nobody has two minutes to spare?  :)

> Allow overriding the sleep time via a command line argument,
> so it can be adjusted if needed in different environments, while
> keeping the default at 120 seconds to preserve original behavior.
>
> Signed-off-by: Wake Liu <wakel@google.com>
> ---
>  tools/testing/selftests/timers/raw_skew.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/tools/testing/selftests/timers/raw_skew.c b/tools/testing/se=
lftests/timers/raw_skew.c
> index a7bae7d80916..03cdcecba8f4 100644
> --- a/tools/testing/selftests/timers/raw_skew.c
> +++ b/tools/testing/selftests/timers/raw_skew.c
> @@ -92,6 +92,15 @@ int main(int argc, char **argv)
>         struct timespec mon, raw, start, end;
>         long long delta1, delta2, interval, eppm, ppm;
>         struct timex tx1, tx2;
> +       int sleep_sec =3D 120;
> +
> +       if (argc > 1) {
> +               sleep_sec =3D atoi(argv[1]);
> +               if (sleep_sec <=3D 0) {
> +                       printf("Invalid sleep time, using default 120s\n"=
);
> +                       sleep_sec =3D 120;
> +               }
> +       }

This probably needs some usage documentation so folks can discover this?
(Which may mean also supporting -h/--help)

Otherwise seems reasonable.

thanks!
-john
