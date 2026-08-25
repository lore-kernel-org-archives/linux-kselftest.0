Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D455F3B6379
	for <linux-kselftest@vger.kernel.org>; Tue, 25 Aug 2026 20:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787689352; cv=pass; b=pjt+be+vpitDtI/spq/y2gC1M5vA3nqfSEqb+Roeq8q0jCAZjLdSnpMMQpahKLQTBd9YfK/Ij3NOxCfJWhHpPhD4CS2FSp5AR2vV6QXjkdnUfs97UpJV/w/x8ytCQ4kbElb/Utu9l9wlccrE4nXEW2lVALDhQonekLNyvf+LCMs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787689352; c=relaxed/simple;
	bh=3N4AL1MgbXLbBitjzFAxv8qLhZPxJNx8xVWe1w5QxPc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PmrNBySBudtB4KH8UDYDEdF6bQ2CATfWXwJXtHuPpRoCOcVegnZSawnsrg4IJxbvA2xXMiw2bE1XKkcuGb9HfSjYbIwTsGw/BIPYhNSDqtGPXVe68cudy3DvWxv7+teqnEKdqRHaWmkmbFeuFG8XklLpbmbMW2Gk//fnB19Sr6s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=djg/RSZn; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="djg/RSZn"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47fd66a094eso71365f8f.3
        for <linux-kselftest@vger.kernel.org>; Tue, 25 Aug 2026 13:22:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787689349; cv=none;
        d=google.com; s=arc-20260327;
        b=rbiYNgCfgfafXdItt9EcZI3edR+s1dzqwBGQNthzfo/GUfy0JdZ37QEsuSS3roHTki
         TCLSDhr8x3WwozWtd92XOOcGGqFP6vgmGt07YpioLppy7q5fv+4OS2eOzcSCc2Ai+OaZ
         +N5WOW0E3Jjzo13ddDWujbrGO89MjZm698/FFv2EPOKOXlU3+bbWZTYDNjERraNjkQ5s
         t1RLg6xIFlR9ONRq/VzW1jh4h2+s6gsFlejG8egS3F9eCXZEnjupMbvqWofBlQ8K2tx0
         tI9VxgP3+fEZBVXEehA6LGUnbcgHfBC6qW3yxnSGaFRZt/hP5bNg8HLnR8ARnORknMWw
         pbnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gq1Tlyz+u7g6Lm4P7CYksM8eHc7IOHYEqu0HF/W/vwE=;
        fh=HPIyhXPrioSxqlFa45FehjyQAyXnpsyBoBSeTHnmapM=;
        b=YSMSEYX2IIixnf+rjUcHhCilj7Rbvu/hKhoX+CusBg8G2TCgMnQ5PRE6r6bD+wE6Q+
         KjgN7CfOUP0o0Jb5SEnt2kI5/Km92owJNhZODGxHdyw9pVHeuPJUcYgz2jQn0DNeuPYt
         6Eyx59ZuZ949ENk0/VnXMpCGipNi3XRou13LRpE+p+3oG0D8avWzlYhDsX0M+mAJHfmK
         JpxWRgfA5eXjyFVlFrpD47IDLjVcXkVl7YND0wpb99zOeNx+BJH9M+A+X4DSqCHm4/KY
         VYSPSMsFLUUlHJ2a9H4VjqnSjVsMgu9olEpf22Bb96kj587qhhgsG9xNJ9tYTfcFdDw3
         ITXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787689349; x=1788294149; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gq1Tlyz+u7g6Lm4P7CYksM8eHc7IOHYEqu0HF/W/vwE=;
        b=djg/RSZnQr8mxGUYRBHpDqXSJVbUX+WatRz4RC/XmFSUDgx0d1+19kWPdsBlCx4kgB
         LQpH5hzfp1cgYYhNCpbFtBi6hdYZd3OBGkyPO4o/VhPxQSyEypXgAuQ9XsUGwHrzqEQ8
         j96JiRAEPtRfLECo1nIaq/ENDRHeGct7nAA2qbmwA15eEjISFuEFHhiYcKpZNEU1ckwc
         KvowbkZDl3yVpHEots8p4/2MPNrr2thUzdlCbH8d3lGEDPTUEhb7Uf0zoxmE8DlBj77H
         6Gxv0KGFXSyVPUmmPYjDrAUcByj1/pVhv8fWcCsIniq/HRy+AOlsIewJ0WJltm1l6X+K
         K01w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787689349; x=1788294149;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gq1Tlyz+u7g6Lm4P7CYksM8eHc7IOHYEqu0HF/W/vwE=;
        b=BDBz3dxtOKLVRvNUl9alTnQCxIjx3UeZVrxB9aAEfgFSQLnNxykjAUPqjszwNd/MII
         TlcAfTj+QJfsFLxlrgDBjozpaNOgnzU4lm8M0Ej9C0vSlqQfOWas354168reBxzMd3f5
         xflW8WN5YOI0I/x6m4Pjp+nc5XtHWvXYIRrh7K/LnaCXzBX9kTaXqKStrnjBNfUQNas5
         16KkcKVC3/eQQkYU09Ph87pTfxSSrsreOmCeDhOq7/zMoUKeCy8pyHV3Hkz+qJLTmgjy
         Wj4OFgZ8MRY/JPLbfevurTqiVP65iPqX7pXgnyo7M8H74UHU9fE/O5p0EwOgUDbYhcN3
         L0uw==
X-Forwarded-Encrypted: i=1; AHgh+RqPjj1LSLyoqesNL6FMy5RpkMOQ5jrdCcGoj1oJV6w5Q5SFZD4vC3xb7hAuSjqc1uwPBz8DLVFAFSszNhQkr4M=@vger.kernel.org
X-Gm-Message-State: AFuF++nyNafr7lwuwz8Su6h73xLc/tIyArPQsG+3tnZk+LEXmbvg0DX2
	zTHHfoUxq99OI1ahtnbJp1OSkYed9KlIOAm5mvY3ZGg/WHaCrPiBfBi3n+VFqHIv9mvk7coTHFg
	q175wchtel1G8IsHC7pHcVnXjvO8gWFf2V1Ib/+s=
X-Gm-Gg: AR+sD13Ndi+6wqRcl4Q6A8qy5hy9h3KWDHVRTvVoUwGGk3KXnVRJDyjpOxGc9ZEGD84
	M7vJvNWy2SbBfdOaCYsV647p+3GIkOHmOLXQF31Sm5gwfj+P6XRru7O97E1rgfR9z4yU2ZgpcrF
	of0+C9wRdlJBuJ8zPI5bFb2oCRSHRRP5djso+GnJdsfU7xft0ruwrdVJxpCoLBk0gcQPxzUw3PI
	ApKlMSdIkjsJIli4lEGZBckQJs07AN9JyQI9XLCLvHsqHSffDjenUjeSqZZI4jf110K37Nly4zF
	evJrBiVe7fhzpis3hXgerLVZ9N+NjiLkKYoeuHAe8QA4bUL412PyXQCiPGg9JSAOYPk7eQkHqps
	ttoKGStI6O6seb45qs/frvnoJZG3FEFb24OPpJllIzrB+rWl7o5UPSJspJTspeuQ8SVVbgIY3
X-Received: by 2002:a05:6000:25fa:b0:482:d3f6:ab41 with SMTP id
 ffacd0b85a97d-482e26786d9mr2102301f8f.3.1787689348601; Tue, 25 Aug 2026
 13:22:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825064605.472889-1-fffsqian@163.com>
In-Reply-To: <20260825064605.472889-1-fffsqian@163.com>
From: John Stultz <jstultz@google.com>
Date: Tue, 25 Aug 2026 13:22:16 -0700
X-Gm-Features: AcwNN1WnoVHfjjdDSBffqa_0SkXYfIAb0_pLlbLNhQ4sied82PCyvkC9hXn5LbE
Message-ID: <CANDhNCrs=tyZbjpTvPTn-CHPNPBY3tMQKyhYRJzaZpNDv3aZ7g@mail.gmail.com>
Subject: Re: [PATCH selftests/timers] selftests/timers: clocksource-switch:
 fix unchecked open()/read()
To: Qingshuang Fu <fffsqian@163.com>
Cc: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Miroslav Lichvar <mlichvar@redhat.com>, Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Qingshuang Fu <fuqingshuang@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2026 at 11:46=E2=80=AFPM Qingshuang Fu <fffsqian@163.com> w=
rote:
>
> From: Qingshuang Fu <fuqingshuang@kylinos.cn>
>
> get_clocksources() and get_cur_clocksource() open and read the
> clocksource sysfs files without checking the return values and without
> NUL-terminating the buffer.
>
> If open() fails, read() is called on fd -1 and returns -1, which is
> stored in a size_t as SIZE_MAX.  The token-scanning loop in
> get_clocksources() then walks past the uninitialized stack buffer,
> reading and writing out of bounds.  Even on success the buffer is not
> NUL-terminated, so a fully read buffer makes the inner scan run past the
> data, and get_cur_clocksource() lets change_clocksource() call strlen()
> on a non-terminated buffer.
>
> Check the open()/read() results, use ssize_t for the read length,
> NUL-terminate the buffer, and close the fd in get_cur_clocksource().
>
> Fixes: 7290ce1423c3 ("selftests/timers: Add clocksource-switch test from =
timetest suite")
> Signed-off-by: Qingshuang Fu <fuqingshuang@kylinos.cn>

Acked-by: John Stultz <jstultz@google.com>
