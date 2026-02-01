Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D762926CE05
	for <linux-kselftest@vger.kernel.org>; Sun,  1 Feb 2026 16:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769964209; cv=pass; b=DxgkUBveu0a4wBS2Bf5SjFVevnlY9yb4hzYVMgdOX3yUIC3u4zXWM/COCoQnnxhYSJobmb6YHxjiHGzL4opIfmvWlE0O6OQWh0pHbfXEnOj0YyEBLrxz4j+V1TlaS7amMPNH1kztGfnOUZavtPWg8wpQcDl1Aqv0e/ZW0IXFw00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769964209; c=relaxed/simple;
	bh=vy8irmUiSf/eXcG0W+j1BcyMBQYIq4gz6BF7D2WJiis=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nyqlee+en62ZLkzU5rRHGiyui9TlCUgzYw7T4qFotAgnQ2MdQCVSc3WYa/hcnG1riB1OF1+tcHNgRLznqcPeOZPTqBxmrc7fRs5HofBhKyN5yuAAF6sYWO6J7FdX7kdyygk/tOl2TgyLetoRSVMH5TM/NAo7jXUW3zNfIdBqJU4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AOalesdV; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AOalesdV"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4806e0f6b69so26300785e9.3
        for <linux-kselftest@vger.kernel.org>; Sun, 01 Feb 2026 08:43:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769964205; cv=none;
        d=google.com; s=arc-20240605;
        b=iK9nD8RpKDxG8F7ffm0RJkW2mcp3pumLBUTgQxOzgTRKksVZURiAVXVcU/vmfJfEcL
         Kicx9YOZSxooVRiuUhlJcmmGDuvJXSVXwg7fU0OhnE5gWyNI4teRK2gHj8Fc578TuNGY
         RP72qhrOZUPicLxIoJ4YUdP/WsRcPoe9iDqQAQ7q5Vp2xZdaN7p0EEFqp+k+dF5yNWex
         O3M09pbjYy44WiELcdHoAzsS3+ykodKkHAC5iKi2B1j8k4aqp8H+qgchFhAyzYSsCHA9
         F0+croOs1yW2kwaZazhhEzOrFxoKvOKA2jwSMR6o601WTGfjrtyg496+yH2NrGZbneAI
         9ijA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nc4emD7dbgLczqSrt1DDlXx/t82B84SIO2BT1dkonPY=;
        fh=2FpqrLiX4tr4XGfwAWy59YmtCA9RB541PpoTOxaoAnc=;
        b=LFrm9rxE/IgLtYRM9wDHJ85d23sarUvyQ1WzI0YD46eoq94mM325HdehWGbOcv2lNT
         Bb4feu0gPKIfQKetNNlvKl/5MOM3lH4v/rTxHL9k+nnR68r2uUH+Gw48kthp0JheyIaX
         pnHNNjqACcvFxU28c6Mm3Z2XMKiZlQcXVGb7X3QuCHMlYq36334t2mUTgKFo+AptZE5K
         S+F1YbV0baQeCG5hBhtuWaEfFy6ym3sK0RzGpKrmW7tHfUEpEXYn4oObpw0GqCwBCyrx
         Lei7klSvO7+K/sPyEp9NL+EhFiqfPF/+89w6onTy0sZdAqJb73y7pZPmLpu8cmenRF8y
         9OBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769964205; x=1770569005; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nc4emD7dbgLczqSrt1DDlXx/t82B84SIO2BT1dkonPY=;
        b=AOalesdVMVRw8h2fXSrfWuB5pOUwDTO4rKEzX93Mhvlr1GVyl3UcOAXGtCgEQqymyb
         oHdb84rg62VEcOgKFv15XAKjqFbqUNo86lX9gbMmpPreajkV0Uzmv+B2MkQPsPpud5VM
         BI/B6g2YJOIKGhwtQCeAvdkmhvAtOht3khpcn6ABMfd/UJdvKKlaKeW7EDWBN4CqSGrs
         SxAxiFhLY3Wta6lOzr2EZYk7IFXayU526BvB2E9lipA7LPD0+OsnPnvKDNg2I2yX1hoU
         R1b1rjSjxdUZgHfzp4UlksmZAy1gbfd7/qmRgXBbaSODX/7V5KdR4IDCkPdB5RfC2yzw
         EWgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769964205; x=1770569005;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nc4emD7dbgLczqSrt1DDlXx/t82B84SIO2BT1dkonPY=;
        b=i1ddHctuieBZ1UcwY9VnHOfiL0mxUmH1PFD+W7hkpZx76uhDeyCpbtk9eUymNpAeK1
         IH/wg5a7y8kZhDdMJWkNf4JrURuDy4+ZcOYX0Mc3y2Q13mGuDcNq87j11xnOriK5FQRy
         K1UcIKM//vfpJF+JfdIZn5VW4kGVmkhKZQaFyBWXmivF0P8liIsSlxooWriSEvSeUHH7
         EcMA+3QNXYYwHxbzsrqmrsE88K3ZUP2xDB7WwUqrB/Xrb2BWeHHB6V8sAqf2rIJMNozo
         P9+8MJAW8LWwU5RD5iR7x8sicVoF/ryqBkn593s6EuuyPS06XWydN1IIqR803Zrs+O9n
         w6/A==
X-Forwarded-Encrypted: i=1; AJvYcCU+wJDjqG7LdGNUeghhoLZnY/C3fM9GhjAZwHk49wA1M7c3U5yD5/DN8timitdMnABbaNY0NKaNXLnkN49V5vc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKv9oPted6SR6A3UFOxJXH6ugmG8jHbE+noO6aj+PXDijDT7Cd
	aNB4Yf0Pz6ndoyFRnCGlmzxv707rFJL5IJ+kw53IJ13YS5ELYDoPI3Q3jl3Nsrp+XvPQxNk8UaU
	/AoXOso0re0JEVVnLUqwszLq8I8Nl6ag=
X-Gm-Gg: AZuq6aKOkZf8kSwV9JnnqIN6d5jPfsSHV1rlpuf1FBPf9MlqcG6G5vfIw20Cwd9XNe1
	DK7Z7izDPTXTWFHnbmf53d1kGjtNEi+QlQzdbQ+YRn5/TXobV95+5mJ8LivSOjVvL0T4Fu33K55
	BtgD8J1Enot3Ih7/CghCz7TQ1urLPAuXoUHCtaC34gqS5NqQ96gdSZijVhUni29GbQvmVHnx2QY
	CyzaAlX69Yay3raV3q6/tEacXpIVZ2eZ0HCxaYbliBYXGDZ6K8xrXHNDmRPe0kRP+VCa8Q/lalb
	hzjE/xADx6nH0qzjoPz59FQIVxgHLflydeyQEQzt6jme5Fea6eE/D1JRq9rBcwWdnhRwjJr/hqM
	3PCjrnchlQIPQrA==
X-Received: by 2002:a05:600c:3e1b:b0:477:7af8:c88b with SMTP id
 5b1f17b1804b1-482db45129bmr117686265e9.11.1769964205034; Sun, 01 Feb 2026
 08:43:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260130091245.3824029-1-sun.jian.kdev@gmail.com>
In-Reply-To: <20260130091245.3824029-1-sun.jian.kdev@gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sun, 1 Feb 2026 08:43:14 -0800
X-Gm-Features: AZwV_QhtfWodM26fUs_CN8HXo_1GbDHM_04TebfkG18a66-Lo1RgLS0c7sd7eH0
Message-ID: <CAADnVQL-Gf9SAAhfu3zfPvNPQ11UQmMmF-7wZNYaNOvA=-Bmbg@mail.gmail.com>
Subject: Re: [PATCH] selftests/bpf: skip deny_namespace when bpf LSM is not enabled
To: Sun Jian <sun.jian.kdev@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Shuah Khan <shuah@kernel.org>, bpf <bpf@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 30, 2026 at 1:12=E2=80=AFAM Sun Jian <sun.jian.kdev@gmail.com> =
wrote:
>
> @@ -88,6 +119,13 @@ void test_deny_namespace(void)
>         if (!ASSERT_OK_PTR(skel, "skel load"))
>                 goto close_prog;
>
> +       if (!bpf_lsm_enabled()) {
> +               printf("%s:SKIP:bpf LSM not enabled (boot with lsm=3D...,=
bpf)\n",
> +                      __func__);
> +               test__skip();
> +               goto close_prog;
> +       }

There are lots of bpf-lsm selftests.
You're trying to skip one. What's the point?
Pls use test_progs -d or -b to skip the tests in your step.

pw-bot: cr
