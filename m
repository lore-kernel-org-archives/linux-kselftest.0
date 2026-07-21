Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4751C48165D
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 10:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784630379; cv=pass; b=RYunPSUrxGXFNMeCBUAZE6USuYNuodk76Yjl9R7Gdbc4UCjJQep97jY/w4xRj8kpGZexTDOFHF5MtEB/7Q9E8AjDE2oWMB5Tmju7+uJuH46fTxYuWcdyl5bUjBYjua3GZkWNmPnWFwcUH5aPpxR6JN7jDt2oJBEeoSBUBkyFKz4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784630379; c=relaxed/simple;
	bh=q2S9wAy3pcTDclyoRWq2ZXiivaO0b40nJXuVk3VpHtA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ttqQLNOLc6oDvWTvgQuOH9rVR/jIYJqtghbFZSGHaPefkNmb05CvHySnIxbuzrpnpFEf8Z3YqMyRMmVAcJVMXt48FDm8EhO54scBfH9IcJFZ8yk8uUfnfMpR9PcAbwdob4LHoihJ7Cv3fYUv8MCzEwne5d/J3aXvb7n/QseB4x4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UPXieIy3; arc=pass smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UPXieIy3"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-667b0ced2d3so12397573d50.2
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 03:39:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784630376; cv=none;
        d=google.com; s=arc-20260327;
        b=QU11+fxekZ60lwAZ7nDZ6soPi72I+KxFBrVTFcCjVaiV/Kh+/o0mQ6LCn7/2nru7Q0
         HrWaBx5JIffvAW035MDsnMuN690a4kRgIjLYeAFyBrWrEVpIHszd6LWZwPg0zQGlN9e0
         S018i6z2SsUTew6d5vpMWMYfCjXKf6wCuA9daZDJs/W67FGFbKGrbe0gZfY4wecFv38T
         lc9UZ53zshCydDetmYnZm8c/8kXxwpc09QwLEoa+SFfP/JSGq7oqEkUYCRQ2okyNs/H2
         KVwzb0QEkb83OKNCrHe4SvkN5Cyvdej4yFMzvjeUloFlFv7zWDp9UkDobEAJnc2a/gI9
         VMLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0HeOpmB3W7tkmJB+bdsI5V2c8gp/aeBd8FA8ZZtHKXU=;
        fh=I+LHasfwvNj9exyDhtWcI5QgMjKl4Ymc5krOZyAQ/AY=;
        b=BoAlfK6LvVwYOMLySbg2smz1H7PsQj2y11XYTGw6HWC/7q7g/D+Se3Kz5OCYSyA6Tz
         nL2GOVWNyIWUqL2BCwBysxMW0YeVZKE2xD4kbrRz0x1rNcSBFMUykpE62HVQz32zY1L5
         betM7a1Y7hjBn1wVUqEoNXCgO1kP6nZ5Zc3l4Olqm85P6YimtJM37iaK+Ug6bNsOmtdB
         OoY2SyyscunjeWykniOz80XNnUx27kzIi8yIkKhUPbRH5f3VDslugMFRLy+C0rFwL0Dt
         Wfs3NrCln+wF3k3c5WsQAME2mgF+XUUeqZEJ4+DehvgXL17owWtkQ7xXQ3xsvXXMWJVx
         QPBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784630376; x=1785235176; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0HeOpmB3W7tkmJB+bdsI5V2c8gp/aeBd8FA8ZZtHKXU=;
        b=UPXieIy3/y90TyfHyXbtdiDA8IoiS7DCzdFqUHDG9NtEJ5SR1BNj6cMCh9sorCzlkO
         bmGdkhkGSYIfNmFH5ajpXVN6tk4zE5S8R0J4QrigqLRBuQFciWFlECPQ/63MDh0ZPXDN
         OdEaRiZNKriwgTKqkeX9xB7B/MA6vZBoZ7usBhszL1jTFdAQF1aYdV/VnSbXfAz/ud1T
         QNsaGl3WDUKbqrjwch15OabKzi7z5uxkFNP/NWV2lrxdy+tHfn06XahDZAHKMm6TESQy
         n/jgDqwTOM8Zpu7Fse5W3Imy3mQAfc5WJOYvRdhqKKdU6V+9ZtFjLRVpIzMYon5++U7h
         cQcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784630376; x=1785235176;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0HeOpmB3W7tkmJB+bdsI5V2c8gp/aeBd8FA8ZZtHKXU=;
        b=avCwbBz84kHCe6vCH9L/TM6gBwxhUBc9ogytPF0SNLyJDtnGd+JfmWROU0Aye5nrWS
         E8xSNa8ukPlcFgOcJUg4CvuOsgwluizskkfFzO7BwpqNM6uIcWL8nERcBB9DQiUCxFxm
         13dha4VxkXmFxcjxxFG3pkiigM5xQugHCF4wMdKgjgLSg/8ZoGBwWyovDIYM8YGxBNCU
         jkQenRXC6m5g0j7tIp2U8zmsOOduiB5NJhRY2ho/8ffPs3LRF59wprflZIcO3kmNcBcf
         OgVDFOtfcjZ9zQ4gJTC8E9kEHBvBpXRTcT0549ADB1H5wVAcMBcAGMT5PEX0/Xk0yyN5
         jUtg==
X-Forwarded-Encrypted: i=1; AHgh+RrXWz0rkU1sXdMuO9eLzH+RimTLXeuSVVIiDZlGW66i4pRKV6vsdZD9RGc67WxQcYtHPB1mwdzibK73++GEv3E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQzuQF/few/VzRscfU1U3iF42tsjxDmXsnU0mQx9Z1vs1AvI+x
	ucAgT90f0sLcNOImQXWZWjzsMzbRn2qQBqtUzFwD1xEKkZ/o90f5fsivCcoiCUyssd59//Up35I
	LuDgeti4W0Hw8X+zQDl1JbqrjJNGb9nO2V0uTgrb3
X-Gm-Gg: AR+sD13788o61Jthr4NnLn5nKpPhCzQIiYAi/BSwUhr5V72qHkeqN6O4vnuZ6T5zh0w
	i1sYU57z4Maa+62zSJgsjexbghYW1K4COC47o/aDo+zLJjeJ3LerVY8grto69zys5D8djnCTIcY
	3oBpGVMy6jKbJBpfevXeHtNKGS1bJcFOTZP2cmbLcWCIwigTEYg5Shkk6b2m3My1mgRzoP2eCgX
	Hdv8YGrk+uf4OUgtBJt03fdYAMO9+NFpKCtfOmJlWO5HAJ4g6mxYQqiQqnC0meB+5QOqfHIbtft
	uoCOe5vF+uf5R//9jGVnnQPhEw==
X-Received: by 2002:a05:690e:1347:b0:668:19df:5597 with SMTP id
 956f58d0204a3-6683bd63571mr4938225d50.106.1784630375558; Tue, 21 Jul 2026
 03:39:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708121544.583552-1-wakel@google.com> <87fr1dn3xf.ffs@fw13>
In-Reply-To: <87fr1dn3xf.ffs@fw13>
From: Wake Liu <wakel@google.com>
Date: Tue, 21 Jul 2026 18:38:59 +0800
X-Gm-Features: AUfX_mzkqSKa9q20uoG2hhbGEJT_meFtwZW07FthwaUuzv5tbFIe-P76QN2zXPw
Message-ID: <CAOcRiAEz5BjvX2kf+4Uv8_QAxwdo+HrHqCa3jqT=aG+46Rf46g@mail.gmail.com>
Subject: Re: [PATCH] selftests: timers: Use CPU time for CPU timers in
 posix_timers test
To: Thomas Gleixner <tglx@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

Thanks for the review. I've addressed all the style issues and sent
out PATCH v2.

On Mon, Jul 20, 2026 at 10:14=E2=80=AFPM Thomas Gleixner <tglx@kernel.org> =
wrote:
>
> On Wed, Jul 08 2026 at 12:15, Wake Liu wrote:
> > The posix_timers test compares the elapsed real time (GTOD) with the
> > expected timer delay to verify if the timer expired. This works fine fo=
r
> > real-time timers (ITIMER_REAL), but is flaky for CPU-time timers
> > (ITIMER_PROF, ITIMER_VIRTUAL, and CLOCK_*_CPUTIME_ID) on loaded systems
> > (like shared test runners) because the test process might be scheduled
> > out, resulting in elapsed real time being larger than the consumed CPU
> > time.
> >
> > Fix this by using the appropriate measurement method for each timer:
> > - Use CPU process/thread time (via clock_gettime or getrusage) for CPU
> >   timers.
> > - Keep using monotonic clock (real time) for real-time timers.
> >
> > This makes the test robust against scheduling delays.
>
> Lacks Signed-off-by ....
>
> > +#include <sys/resource.h>
> > +
> > +static long long get_clock_time_us(clockid_t clock_id)
> > +{
> > +     struct timespec ts;
>
> Newline between declaration and code.
>
> > +     if (clock_gettime(clock_id, &ts) < 0)
> > +             return -1;
> > +     return (long long)ts.tv_sec * USECS_PER_SEC + ts.tv_nsec / 1000;
> > +}
> > +
> > +static long long get_itimer_time_us(int which)
> > +{
> > +     struct rusage usage;
> > +
> > +     switch (which) {
> > +     case ITIMER_REAL:
> > +             return get_clock_time_us(CLOCK_MONOTONIC);
> > +     case ITIMER_PROF:
> > +             return get_clock_time_us(CLOCK_PROCESS_CPUTIME_ID);
> > +     case ITIMER_VIRTUAL:
> > +             if (getrusage(RUSAGE_SELF, &usage) < 0)
> > +                     return -1;
> > +             return (long long)usage.ru_utime.tv_sec * USECS_PER_SEC +=
 usage.ru_utime.tv_usec;
> > +     default:
> > +             return -1;
> > +     }
> > +}
> > +
> > +static int check_diff_us(long long start, long long end)
> >  {
> >       long long diff;
> >
> > -     diff =3D end.tv_usec - start.tv_usec;
> > -     diff +=3D (end.tv_sec - start.tv_sec) * USECS_PER_SEC;
> > +     diff =3D end - start;
>
> Move that to the declaration line.
>
> >       if (llabs(diff - DELAY * USECS_PER_SEC) > USECS_PER_SEC / 2) {
> >               printf("Diff too high: %lld..", diff);
> > @@ -100,7 +123,7 @@ static int check_diff(struct timeval start, struct =
timeval end)
> >
> > -     if (gettimeofday(&end, NULL) < 0)
> > -             fatal_error(name, "gettimeofday()");
> > +     end =3D get_clock_time_us(which);
> > +     if (end < 0)
> > +             fatal_error(name, "get_clock_time_us()");
> >
> > -     ksft_test_result(check_diff(start, end) =3D=3D 0,
> > +     ksft_test_result(check_diff_us(start, end) =3D=3D 0,
> >                        "timer_create() per %s\n", name);
>
> Please get rid of the line break.
>


--=20
Best Regards,
Wake Liu
