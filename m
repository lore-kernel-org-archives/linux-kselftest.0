Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAB7282F0A
	for <linux-kselftest@vger.kernel.org>; Wed, 10 Jun 2026 03:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781061247; cv=pass; b=Dtqc9kRgkI74BMg3kxyUh2BjLFO/3RUYo6iUg6cnTiykGzS711VP48jTD/DCAvndVr1H/iA7ddyqP8hgqF/4iFAsiTHt4xHA5Iph1gTidyX5/sxbLLskVA5Jtb8rySiOjuNsRyI6Lg8sb2/xGfTLXxiYkyn6XN1fS9yOl49LFh4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781061247; c=relaxed/simple;
	bh=rRWUUPWrEuFKKzTFcG99d1+PyYudETp9hD+6e5qPXMY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IFPh+cTfPgfKXErfkZsC/qmXs2JlrD58HdR2DylCdJcR9n5/dgJQr4JSTAUzK3lv+B4N5BKsDhKyLPpZxtrlG4KWOz6beDaMrjGZsABO8V432viqU9j7/PETRLuddX97L+FreRrZcvihM2vjY4T/29Rcm4IIgWIaezQmNqobVIk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fT22wt2d; arc=pass smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fT22wt2d"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c86214eead7so1462285a12.0
        for <linux-kselftest@vger.kernel.org>; Tue, 09 Jun 2026 20:14:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781061245; cv=none;
        d=google.com; s=arc-20240605;
        b=LSvGOgCgwabnBwBUelwlmRrUy/+exJ8rtSAwEtzTsd13UnjIVP/fIJkS4fQ98xmVT/
         TVtqzYcu7Hw5Yx35BSDiA4tH+hAhFgEsQ0M2LD28S3q3pK+tfSPKnx8F0qt9YRV/z+0f
         f4hHHyfRGH3fYE5y6Jwug5wn+IO0EbsEQog9mlPPoiTIn738nTek1iEt8IlRk/45Qg3s
         fX4hfaKmJ9lcdVXj2gSFND8i6hyCbeIstn9KchGgtdHOeJkFfXt4elW7TcF1jmZzRAB+
         UpQnL98NF0RgzDp5Yq17700wdCVetHZ9CwxxWOIEzuz2VZ5ervTEh1800kEnMfhiF0fQ
         Y39A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rRWUUPWrEuFKKzTFcG99d1+PyYudETp9hD+6e5qPXMY=;
        fh=vB+wTfd9KiqBP+Mc6wvygVQ4YSDHiyTvlhXDIwWMZIU=;
        b=ggztDcGYH9kBhl+2/uHvK8CKJ3DisICucJqGYbdcTloFUzdrJb/+zALoa+dHVcPtxc
         92RZ06EAc1jtH+GiiXlvlZxxoVu89BYYXNJc21nEJO4XZ05uGmjFhRlvlTXLWczZepg8
         B6XYqFQuoBBe2eMWlhpdy4mnlaBsIhAc41Ko9PCdzNacMh4Zktb8LXOTuQwOfHKLs/Dg
         FKqfgAnPCYjXE6VJLw+mM8L+6K109e//06y0+egNzAQBeVd7MhI4he0dbDG0NRhDYJUe
         BkYcRVJMzsN/xD4mz3TE2fheTMXx6XLaLxj95NmrGUZ0AQ51ciHmb/dH9cbF1Gp2t/q/
         kaBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781061245; x=1781666045; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rRWUUPWrEuFKKzTFcG99d1+PyYudETp9hD+6e5qPXMY=;
        b=fT22wt2dvtwS8HH3iosWwR/CMV1qDvb5rMOYcrH+kC+pJ1PpOkc6EIqlor4hRNPTdw
         DKY1TM3jEZsg4WZpCtoR4c3/VbPq5e2nZu2scjhjYftGkil4dF0AelECrDof2ZXHg6uT
         87Mhj3KknnNcqVYctv6oK9+1e6sPeCyBwXqFpqjwc1h7xQf5Zx6n+6mf57aohcWlRGff
         jppUm0hqHwjB7v7mQ52BJEsDoxlb3kE6JGZD3wy+9GvS7Ued7SwpbeLOmIw6QpLY8HpO
         FlLWmID8TP1/klhHsoNi0m9gRYALBIhZcFIy0BHiBfqNiZRq1axE2w6mG3/bMt0lpcgv
         0Wog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781061245; x=1781666045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rRWUUPWrEuFKKzTFcG99d1+PyYudETp9hD+6e5qPXMY=;
        b=lOfTlTDgD7sPWQc/nNPPv4iKbnYeQbnhpI3whB98q8U4Ac27jUYAGOojhS+gDledJz
         duvjuKVAxete8WSu/uWMC5lR+L1Zvm41xM08iHjdq9nZKSoPGg+KLf/Ez++RD/zZGoHU
         4nIR/hh8b1C7jN92ojuNZQT36l5S21xwzWvQ4HIeiHMVk8UNmIGq31+bDSgf7KoW8Sj4
         16fgiDxQ3iII3ixciDns+iPXplaXxgXkQsa7rt9UaXbvyGf66mUt+3Us50VEtWof5SuD
         HD55UZ2yGwEHVWb6SxcrTCvbPf2TF0HWN+Uougmk3zIGQ4zVatE4CQD5eQEotEeT0uxd
         vgQg==
X-Forwarded-Encrypted: i=1; AFNElJ+H36oybko9LQOEGOT00sUieqiAs3t6feiSjDAw5A7ADlh7/r1hz25zkBM7g2kfQkwJHJdHSC9mrlkTqRkS2wU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzEITeD4FkuFuHA1ijZDiWkFfhzMoVbaDx8/Zl0Ww9XPG5W4/6
	EoZvVA1YESFwxvQKhLNWsAW2iEiwKWU74PYaIiQrJUngjl6+NfGcWnQDuxpGnNsxoM56I7F016t
	AkvUCP9SWgQ1fYZD/OClfTNnAEgZMrvkMYmjqsIaNyyQ+6cjN5KTD82m+Eww=
X-Gm-Gg: Acq92OHLuctjYuRLCc2MPNMTtOPXdWw60jGIhPu95iR1NTjIMe+VNYgYXE+HzLpsHpl
	TSEtV1obHVmclB6cjZxsv/woiMtlztU0+x9dAS2wM3s1oMI/fHPPnYILuGNSAfSMY38ih4Hjvh1
	NTJ5GWNDLQJ7gALsFNntJNEsd+lgTg0ZCJnktgVshSl9aNRxOXgupUgxfGhoRjzAYoM/CHeP32p
	cv0dETWh5/3NavsW2leNQuoGbni8gncMIXV0ZJ8o148Rb0qY8heWA0uD5sCVyxnmHtidbzBQq/f
	BYmeOc/TQFC4ZkYlAiaJAferKcpox35Hx61GKq6jQuAbS/gN
X-Received: by 2002:a05:6a21:62cc:b0:3b4:913d:1bee with SMTP id
 adf61e73a8af0-3b4d3d49d41mr21003184637.26.1781061245018; Tue, 09 Jun 2026
 20:14:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANDhNCrDSy8Zf9yo4uKGOtJnLVSNqF6pOqZiRr9giyEG89qpMg@mail.gmail.com>
 <20260610014721.718362-1-wakel@google.com> <CANDhNCq9GibNuAfJezCj1xSd4cKcN=5BqEVy6H4QJu_kdD4eXw@mail.gmail.com>
In-Reply-To: <CANDhNCq9GibNuAfJezCj1xSd4cKcN=5BqEVy6H4QJu_kdD4eXw@mail.gmail.com>
From: Wake Liu <wakel@google.com>
Date: Wed, 10 Jun 2026 11:13:28 +0800
X-Gm-Features: AVVi8Cf3WV4geLpdfjm6md4rjLqbawqB-wEUSmip6l3__xcyulDE5eKp17DSan0
Message-ID: <CAOcRiAHt7aa8SJ5aFF5AgMuiDyNQwKKDrhE2jMqyoKkWF+y34g@mail.gmail.com>
Subject: Re: [PATCH v2] selftests: timers: Partially revert "Remove local
 NSEC_PER_SEC and USEC_PER_SEC defines"
To: John Stultz <jstultz@google.com>
Cc: anna-maria@linutronix.de, frederic@kernel.org, tglx@kernel.org, 
	shuah@kernel.org, sboyd@kernel.org, cmllamas@google.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi John,

Thanks for the review and Ack!


On Wed, Jun 10, 2026 at 10:00=E2=80=AFAM John Stultz <jstultz@google.com> w=
rote:
>
> On Tue, Jun 9, 2026 at 6:47=E2=80=AFPM Wake Liu <wakel@google.com> wrote:
> >
> > This partially reverts commit 80fa614e2fbc ("selftests: timers: Remove
> > local NSEC_PER_SEC and USEC_PER_SEC defines").
> >
> > The original commit removed local definitions of NSEC_PER_SEC and
> > USEC_PER_SEC in favor of including <include/vdso/time64.h>. However,
> > NSEC_PER_SEC in vdso/time64.h is defined as 1000000000L, which is
> > 32-bit on 32-bit architectures. This causes integer overflow warnings
> > in several timer tests when doing arithmetic like NSEC_PER_SEC * 10 on
> > 32-bit systems.
> >
> > To fix this, restore the local definitions of NSEC_PER_SEC and
> > USEC_PER_SEC in the test files, but use "LL" suffix consistently
> > (1000000000LL and 1000000LL) to ensure 64-bit arithmetic and avoid
> > overflows.
> >
> > We keep the cleanup from the original commit that renamed plural
> > definitions (NSECS_PER_SEC/USECS_PER_SEC) to singular ones in
> > posix_timers.c, but we now define them locally there as well.
> > This also removes the dependency of the selftests on the internal
> > kernel header <include/vdso/time64.h>.
> >
> > Signed-off-by: Wake Liu <wakel@google.com>
>
> This looks ok to me. Thanks for putting this together!
>
> Acked-by: John Stultz <jstultz@google.com>



--
Best Regards,
Wake Liu
