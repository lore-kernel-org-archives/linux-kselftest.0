Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB6E484254
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 15:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790177910; cv=pass; b=KQb+/ZCCHBFj8R8PeLLkWAhV8vetF5olVGZMfHnDYOYSv0wldbBBtw/dhkYRy4GDRysI/kgoiFO2WhSwe8u+tX1/Y3Z9x30hvcgXntDAv39Z9/z1TEgy0o1OhcxbR9y4B7Z+U24adKHJ4gl/cANKpmqMxyDRU5h18/6GJo3V9tw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790177910; c=relaxed/simple;
	bh=gEeSEkSOfRu+0wU1/5d2sKj9+XsQVOzf6RYN8jzfDRo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gWd9xgZmEXtbHvZXNust9AnemnaoVUt7R1r28CckfsHWqj7rKkOoXBinULml4AhEo3cJedxDxXi5FSnH8vtoQZx2YO6C4szbfvSif8IFOxV+cHHf5Ki/kWry17H0cYR7UgnJdSqrfWJ9RNDG+k+OtVhxHLiCHjElEfjCAWPd5So=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R1rfZCpV; arc=pass smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R1rfZCpV"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c556f35e70so167900b6e.3
        for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 08:38:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790177906; cv=none;
        d=google.com; s=arc-20260327;
        b=jXlVY/qw9liqMnUJB89BjLMQA7hI4+LBVbrGCUvj6wrYyA6fv8b49PnwAZzLbcTGSK
         UfE8d4UxzGZUO2LebK37ecdiNt7u2JhEK4xWCIU9bds1JTE8IMsMDeVlQKH2sgPz6Him
         +eT4HECVP5KrWSWJPPgQvN001iSXS8Y6KCrZ4oStt+WngCKc5DZg3YtR7c1SDsIPkjsk
         Gg7m9T2aYoScgrcwTlo+2cyAR6ULmDYVoaQhoRfE/pq4Hdb0fVnuS31GMVuUBAHFGvOj
         8eU5IvKYIlklS1e6GjO0g6v3/tc80gzgmZ1gvY+B0wFt7W98qrH9i0cLSSoHT5VV+h4r
         Bl1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gEeSEkSOfRu+0wU1/5d2sKj9+XsQVOzf6RYN8jzfDRo=;
        fh=ApezTUya+qFL+HCu29UzhaD1bbB3Q1zyVbdoyxk+YVk=;
        b=ZG2GRZUEJiCXDU4Rn2mYQBBSD0In5GJb2BTtwKtpdZ6xVNs0SUnp7+r4dCrZ7AxrGF
         Ccb58jB8DyfqznnFBzGtLINLj/jXMXoRY3KMoBWpu48dNGV+l0FFpDsM+J7ksLOU3SJF
         MCYUSD0DlWgncWXa2sXuAdi/P1bWJWis8Lz/Q+nZiSAbyrqTtnrmJgBv1KZDupcMrlkO
         3Ys5cy+awcJAR6/waLbPjPFOCLqobU4kDq7ZMtB/Hv8zCE5XpQfQQvC31zYIzwSC4VpA
         6Sky8rT0nqzwRaZzGvduO0J9evRVCIer03boV3ScsWTQyEQ29RTtShicDR/tUjl7KSAL
         K9Mg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790177906; x=1790782706; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gEeSEkSOfRu+0wU1/5d2sKj9+XsQVOzf6RYN8jzfDRo=;
        b=R1rfZCpVaoeS1I2e9V3K7gFOBN4qX9lpx2qWsDz6TSFzILf9pqdosDuJZkprYzJUqy
         mPSNCdaCsCRHbpk6WVGCjxaAALCpoiyA30X/TtQbkLIz1p4ceuY6XUPBKEdEBXv4EE9S
         2fnqvMF+M+RxE6Kgwj8mBgt12nP7s+GU9YdFI7tJbg+4wH3JmHZwJNGEVvwPJVaBrIo2
         VbHltlbqfqRtmHgK6nkQyVs7NwGN4y/3T/7N7X0qCtJvrBZ5D8pCB62U4Vz/hOvHUKi4
         seRU0faKnD9B/KzQxPXca3DwxLerTBl0nDK9kHyaN+DvX+i5ebUXe7rwbaDdIJmBDZuH
         CJlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790177906; x=1790782706;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gEeSEkSOfRu+0wU1/5d2sKj9+XsQVOzf6RYN8jzfDRo=;
        b=USlsR1S3Pj9f3r4Lovn+QhFrvkm9PIPoV8rsVzWS/gnZCaWQOwZlgorS9TQoPLUgDI
         Qjk9zKNOa+Bq0F7s7N042NTDZ70FYzNiqcaHZVv7yjf4dBN1If2zVjlG9uWifAsJbTqS
         pj537+8A5A+v/yGq6lnTYZahSJT2z24YP2TSc+j5SMMKTv17nEOXwU5Gv7F3PtZ0T6lB
         C6W3ighCPZJFsu5QjdjhDGCF+oP98EKT8snD+K8uHgqTcHdWw56Wd4nUtXpTXS/lQTiW
         +OEiNsFUPcCS3bIUJnN481agyRneARJi9unY3hNBJ1mATzctv5dIuJhKIvfYsRGvYdSl
         RLAg==
X-Forwarded-Encrypted: i=1; AKwUvByjSFyylBn+PbUul+PFye+89l25CleN2EUxbPxpoIujZAdoAjNitFGZyx2n1lhjBG4+RESNImU8tdqXkhrxATU=@vger.kernel.org
X-Gm-Message-State: AFuF++kQ7CwFvo6DpwffbBRF3bXSOMzV7xUXLJE3OjyXW4qvzthmH3IA
	algXEoCOMRqDxl8tlt4ICT0+L9yVjMjYRz8LtiLJmXPERZ/q3KgSXKSyvWyMmlZStTtl+mSXlB/
	IJDLTKWPLJU2q98qWKI8VqvDEoo0g/Qc=
X-Gm-Gg: AYBFou0EJONEwVm6uvr8dRN9RIORrZVy2iCEaxVOzYqV101xCKOFO0u1RVHGIFgVHO5
	uxLSdEe5hfFQgZHW03za70tE8xNZhLyG4gbTDhWIIgKB7/1MObfBLlPRzKpa1m62vUVfa0aMpk3
	xHPm1lRLWiVofM9ZmjNnTmeiSPOWTMBdfqT4QYgVsDOt6RFVg3PZrW/jDvNQXGOZYyh5BPC9tqp
	BMoErvy04GWjQ0bkqHQ33Cfrb9kxqAA+ZNH4M35CE65/p+S6jeikqvuYLEarhsmVmi5cWs8JwPe
	UnlTEgBpS998sTlkcslC0HDFOIyc0QC9oyHEnFDfWw/T8e6CnCaOLDjQAvjh14tU9/+EA5E=
X-Received: by 2002:a05:6808:ed0:b0:4b3:9985:1734 with SMTP id
 5614622812f47-4d5ba3c4acbmr3726514b6e.4.1790177906420; Wed, 23 Sep 2026
 08:38:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-netcons_ratelimit-v3-0-8e81b789ab37@debian.org> <20260914-netcons_ratelimit-v3-1-8e81b789ab37@debian.org>
In-Reply-To: <20260914-netcons_ratelimit-v3-1-8e81b789ab37@debian.org>
From: Gustavo Luiz Duarte <gustavold@gmail.com>
Date: Wed, 23 Sep 2026 16:38:14 +0100
X-Gm-Features: AclHuK-2YGSrpzgft7by3_dFRSTPGzkf9KPty-TIWRA5mQOXoN0qwCVvVkFO1d8
Message-ID: <CAGSyskXex-Pu1n1wp+YfpVgbZnCRrd3CmGcLR9XWxenVNnk6NQ@mail.gmail.com>
Subject: Re: [PATCH net-next v3 1/5] netconsole: send the oops when oops_only
 is set
To: Breno Leitao <leitao@debian.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, paulmck@kernel.org, asantostc@gmail.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 1:10=E2=80=AFPM Breno Leitao <leitao@debian.org> wr=
ote:
>
> A target running with oops_only=3D1 receives nothing when the kernel
> oopses, which is the one thing the option exists for. Only a panic
> still gets through.
>
> netconsole_write() bails out unless oops_in_progress is set, and that
> flag is already gone by the time netconsole runs. netconsole is
> CON_NBCON_ATOMIC_UNSAFE, so console_is_usable() keeps it out of the
> emergency flush an oops prints in, and the records only leave the box
> once the printer thread runs.
>
> die() wakes that thread from oops_exit(), by which point
> bust_spinlocks(0) has cleared oops_in_progress again. TAINT_DIE is set
> in between, so test that as well, behind a helper.
>
> With oops_only=3D1 on a netdevsim target, an lkdtm EXCEPTION produces 44
> lines of oops. The receiver gets none of them before this change and
> all of them after it, while ordinary messages stay suppressed.
>
> The taint never clears, so from the first oops on, an oops_only target
> sends everything instead of going quiet again. Sending the aftermath of
> a crash beats sending nothing.
>
> Fixes: 7eab73b18630 ("netconsole: convert to NBCON console infrastructure=
")
> Signed-off-by: Breno Leitao <leitao@debian.org>

Reviewed-by: Gustavo Luiz Duarte <gustavold@gmail.com>
