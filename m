Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626F92116F4
	for <linux-kselftest@vger.kernel.org>; Mon, 13 Jul 2026 02:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783908455; cv=pass; b=MOKpRLP3Eg29R5SQLAF4JC8yIA9u19l+PjOs0TPWYl7QNsRYgsnqSTGcf/aSHOgYHHOG1X4Omtw/vRGUTkemv/RgeFeZHqdMg9FUfJZiaxsSC+MpJMsLw5I9DOSRpUINbCuSDiAMpvas9zjr+ZI1YYL0VtAqQE/FuaiNp8Wa0Ic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783908455; c=relaxed/simple;
	bh=B4CP/5mOgM5w/hZ9MMzFXqj8QduMR1BQXiOkWHP5tk0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qr0m72XDOKlnZQ09UBNeBPHoYbcnTI48tONFrhUcJUuAD56wBL8tCOpb0JXAKMBsqSl9ZhGG2acVkfbRw1iXQSsa+IYULKws5J+2xozgRLxHgeQka1ACryiqYu+L8/zE+ZooC6gRoAuLiu7gvBZ3WmmonD7TmWNO47t9Nb3+5Fg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M1fDV2zP; arc=pass smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M1fDV2zP"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-80a123ef90aso41731307b3.0
        for <linux-kselftest@vger.kernel.org>; Sun, 12 Jul 2026 19:07:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783908453; cv=none;
        d=google.com; s=arc-20260327;
        b=LDFzSsbG9BnkNz+vd+0PRmGXHrdKiu2rbQCNyz2YGLZzmF8Df4mEuLKFCJI2vucl4N
         R4JAs4FFDXS934ZlwLPmGik21gVHARdeO/RorP3qKcboGEhowgsd5zPeb0vQc+vPx8rT
         DZR+5dR3nlfLisnS7iyPYYhhPSyQRySSGeINISQvo/jZWaZvrBy85sUaLQKqgiM40bVW
         50QaAaKGbSjRolVQFOryPHhGFO08FbktHZrFRpLjkHKo/3eon407DyIy+TZCbccxjg8W
         PIRe0mO739U1TxSqiVM9LwbqsMLkBVSxeYwq6uVlf8KHpWL48337zhyT0hKEojtlWqSt
         l1Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6spuyYVOVitIL40cBcBL/hduox+1UpSH0BYXqXfaKNc=;
        fh=K7MBHSh+QxsPltAAtOi0YIzg40PefkMNx9q1M1fmDwA=;
        b=KtDZes/GdU+icacLFfQhJfLDbHVEKEyR6a3p6TLDgnqzAtrzIPC2ww0NszAVLPdNkD
         mcYYQIwtqaxZSWqq0wouCXORIO+SZrObHBkbiI+04liiwIO/mgzZBNsNZ8zHRY10DzRC
         teoIgsyPV9Ee4R5eYmISKH0R8ZmS7n+GrfnWwbltD2AtbnCgZab5lftwwOmhZUSJvNVb
         r8rIieWtD0E4j8moWd4tG6k5gYldfXu2rJhkSEYmArpqPW5gm9Vafsw3OeDER97xgpxc
         Hv68E7xjMU2QW2B8eSEroJBFyWNp1lKeBVfoxELO/3A2jR+Jf4BJrq0bTHazTr/CRYxn
         I2uQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783908453; x=1784513253; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6spuyYVOVitIL40cBcBL/hduox+1UpSH0BYXqXfaKNc=;
        b=M1fDV2zPMunZLePEe7KounHa4/VwcUbffYCJ8qE4hFlduB70q39TF0Gj6QJ13Zl340
         ecY15c4Q3rOONmwaAHNuOxOfsGcoHWekcYiF90fUvQNk6BNyqaNVS0ejqrDLK/Hih9Vz
         +KMMTcAOZytkNLeIKDtDUtRiAI1myLBel1SIgP+6Oz/9Fc2OGKml0mJ3vBjcvjfE3Llk
         bSUSCEK3VfyYy5XzsQZfqPCrXqE5+0HiqkEA6MeLZDW3iYiGBMeF5959xbHu6fi+n/+g
         tiANU5OWx1tQ89wI73lo9Ue2zmzZLZfVVZ8KPZuzIctTmtW+1RzlpNT9W6oHYmukxnNL
         ayKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783908453; x=1784513253;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6spuyYVOVitIL40cBcBL/hduox+1UpSH0BYXqXfaKNc=;
        b=dTnrOhKfhf/vaJojkcvO1NpM8Em38YCVtNkXuLJ7yG9C5PiDsslMKtrxOCH4tkSp8A
         w2mSjfwj6LY/Cc27vQr28/T5q7lx9MbU7NWLYT3+WvpYpP/W91iGuiQsmR0j3UCpCTtO
         ZyjxZyKhZnBzSNx+QAX7Xvdq1WzHJxiKiIJDOBusu0BYUB4EQVsp6ve1a5iPFDI0KGVt
         nOCHLPc2IDX6A8xlBiIxb6FCsfQfvYI2tC9+SGLSpsgEWMJZj0p1K2PMw2qV0hQkSosU
         Sl8I3MycvWMOmYy3PvYZD0udFzKRoQIn4XpBnc+3mGferYd8rZdYyTp1jouCaa4swwxM
         pw6g==
X-Forwarded-Encrypted: i=1; AHgh+RrmHPTBPvVJTpOGL/JBRHlhKITC+ffcsz2W26FlmdI/VhIv0Ra4g6irqMm6930iUMV4kUlwMakAob0ZhALhUpI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZYmEygUlAY5QezdWcHP/2ZydsY00ubDcL1J9Zn5Tb/ncuBZ0P
	8PllmChUGWx1o9qp1kw27GQJX7uGZ/XBQdSGl8AjTK8jdeSWf61RYiR3Nz9DiKWVF+Q6coPc5EA
	MBlRfkC0R+iq8A9WTTsnY7UKnBX37Cbr7Iz17gqZJ
X-Gm-Gg: AfdE7clvZsn174amWnu/CDjQLbnSYugzaiFFRbkRgsG0Mo5ZTGuv85deYDtTIgihWgR
	3eqqYxRFv4cX/+8MoyVhvuypx2ijEzW1AE0xsQeIq0O+ekdcvqiHj9yO9QS4LJGqNcIoPNrzoX2
	HN4ASplvrDJqnxH0rdCln1Ica/Qpa3X4QSXyhEeFBTJD4rHhPUiRj4acSGY8cucaTFY+7F+vvhs
	b3KYcWDydkNEfzWHqje3HpA+B7bUDBRVl38292y48gFcDaXvKtEoKiBe3TuNv22FOOi+zlY+ON1
	zozUKT826Y5oIn/pmJuw68dY8Cs=
X-Received: by 2002:a05:690c:688a:b0:81e:6563:72ee with SMTP id
 00721157ae682-81e9073930emr53439507b3.14.1783908452925; Sun, 12 Jul 2026
 19:07:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710025144.2000000-1-wakel@google.com> <CANDhNCqqAqVTXXNZvKD8sppJhVY7xjb+n-33Aj1d7Kp3XoMv4Q@mail.gmail.com>
In-Reply-To: <CANDhNCqqAqVTXXNZvKD8sppJhVY7xjb+n-33Aj1d7Kp3XoMv4Q@mail.gmail.com>
From: Wake Liu <wakel@google.com>
Date: Mon, 13 Jul 2026 10:06:56 +0800
X-Gm-Features: AUfX_mwuJN1dE_PB3zTCuCZX0N75GKuoMW2HZuSaCkaMteTBmB0eeMKpuMcpNwk
Message-ID: <CAOcRiAHxZEQ1h9svyQrWbw0STjJkwy2xgazFgevBecxwhwq+NA@mail.gmail.com>
Subject: Re: [PATCH] selftests: timers: Make sleep time in raw_skew configurable
To: John Stultz <jstultz@google.com>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Shuah Khan <shuah@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review :)
I've sent out v2 which addresses this by adding -h/--help support and
usage documentation.

On Fri, Jul 10, 2026 at 11:04=E2=80=AFAM John Stultz <jstultz@google.com> w=
rote:
>
> On Thu, Jul 9, 2026 at 7:51=E2=80=AFPM Wake Liu <wakel@google.com> wrote:
> >
> > The raw_skew test currently sleeps for 120 seconds to estimate clock
> > drift. This is a very long time for a single test, and can cause
> > timeouts in automated test suites or CI systems.
> >
>
> Sheesh, nobody has two minutes to spare?  :)
>
> > Allow overriding the sleep time via a command line argument,
> > so it can be adjusted if needed in different environments, while
> > keeping the default at 120 seconds to preserve original behavior.
> >
> > Signed-off-by: Wake Liu <wakel@google.com>
> > ---
> >  tools/testing/selftests/timers/raw_skew.c | 13 +++++++++++--
> >  1 file changed, 11 insertions(+), 2 deletions(-)
> >
> > diff --git a/tools/testing/selftests/timers/raw_skew.c b/tools/testing/=
selftests/timers/raw_skew.c
> > index a7bae7d80916..03cdcecba8f4 100644
> > --- a/tools/testing/selftests/timers/raw_skew.c
> > +++ b/tools/testing/selftests/timers/raw_skew.c
> > @@ -92,6 +92,15 @@ int main(int argc, char **argv)
> >         struct timespec mon, raw, start, end;
> >         long long delta1, delta2, interval, eppm, ppm;
> >         struct timex tx1, tx2;
> > +       int sleep_sec =3D 120;
> > +
> > +       if (argc > 1) {
> > +               sleep_sec =3D atoi(argv[1]);
> > +               if (sleep_sec <=3D 0) {
> > +                       printf("Invalid sleep time, using default 120s\=
n");
> > +                       sleep_sec =3D 120;
> > +               }
> > +       }
>
> This probably needs some usage documentation so folks can discover this?
> (Which may mean also supporting -h/--help)
>
> Otherwise seems reasonable.
>
> thanks!
> -john



--=20
Best Regards,
Wake Liu
