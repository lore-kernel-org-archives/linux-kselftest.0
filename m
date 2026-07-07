Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0253FB7DE
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Jul 2026 13:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783430284; cv=pass; b=KbrLP/fsdX+vuZqJ22BECdZGy4dL/uwxZeIzdqoTO9UCAfPpYFi9f5vmV7LWmORrNrNy4b3ksgIY2vC1YZF0/klMVQnw/7noQ2gF08Z1MAmKHSM/s6nQvvp774Wibxs4NBth+tZkz/IImNVsCe08ttL5UzeQoaqhw/U43J+GE1A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783430284; c=relaxed/simple;
	bh=HcHtACwu8/iGQkr2r+eW84TtzcCN38sbtol1tFCcY9g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iyPIn9mMMgjPfEKaQxhw6TxB4oWOszVKzhX3dIBBkpF1BQ8g3FxITGsmtfgiZ68rGMNL/CU6ymWAwlIuadF8VH3k/WGW+CYYqtMoFXPdcCJc6x0dPZJIYBihkvvYM545ebmcKg00WpJDVmrQSl9X8PvvAFHXIgupVcVl0+dbZcg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aNXJNDbn; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=tHWWexg0; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aNXJNDbn";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="tHWWexg0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783430282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G+ucBQNKh2u8TygJUyr/SqZFCxEUaj4Cx7Z/tP8WgQ4=;
	b=aNXJNDbnkrU4I+KVYbjhJ6ANKpYOL5k2PfeZxZIk+vXyVVwPH7zkbMJCAvatLh5RCyUp55
	yUIR6z/+aXZSdYz1c5vsAqpPquvWucVte3EquTrosgktngUaAanUho5oBAdUAL5fFDoEpK
	/bCeFOj72D5fZyTgb2gpRF9TX0Ztb9A=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-548-_4CPAs6eM6uiVX91sE1odw-1; Tue, 07 Jul 2026 09:18:01 -0400
X-MC-Unique: _4CPAs6eM6uiVX91sE1odw-1
X-Mimecast-MFC-AGG-ID: _4CPAs6eM6uiVX91sE1odw_1783430281
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-487059fb570so1896798b6e.0
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Jul 2026 06:18:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783430281; cv=none;
        d=google.com; s=arc-20260327;
        b=qhlQ5opmJ5OOzgMNbWUsZlm9pIqVJtisczzTqAb05CztVqt+KUmAPOrynzbNfXPb2U
         xZRrQYbuokoagpLs3qhHOfCYLKmFM4LvBD8iUkxBYBgI/RtwqjQF2tyoQHdf0lqtyS17
         cImjtv8LcJ892fIa/9M4pQv+cfLFuOiTo0nVxliWUAB2ZhBk1h99aK+M7md7/n8fgOCU
         ptsFbrIFbzN6I//2p6Ac5XnGt8BTYSS9NmF9aPQSdfraLxrQduDr94WD7JTvgGSkTB1w
         6E9uCuC/5KhaCLcJ1d9WGl9waTTw2SlmbdCHm6goNXDcSNDpnWzj0zpSpZuAfLLPoKga
         DqMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G+ucBQNKh2u8TygJUyr/SqZFCxEUaj4Cx7Z/tP8WgQ4=;
        fh=M8eGOWRnqYftVNHq2S2N7K9aRU92isd7W2uasJ9bkFs=;
        b=mbxxrEBjcxJ1JatPus/80Rb+vhSYimuBTUN5+kNoDwh5v3e1MqU5TGktHYNfYAKxoc
         2XY0gxv//zusUmqapRGKG9U15YuSC6IkRKlblMLmwjlMcShoN4s3TM4YcBasUqzdfnl2
         GVgjy1N1qRHbWi0IpX5giTXHMpENxBjBDANgnweIFbHqhYoFbeYKHV1o0Nk4JNvWnwUG
         VHllxHj+9jXECIcZ9482dY7oAPnzd76DV8FGtJwZhdFFjS68dGhh4xZMzZ1FvSACAo+V
         ZvFBKOGMvAlnSqLKGWdv8KLsb0FiLUxNEbEVLx/p5XMsDk6GJ9hH0u16FJu603pRVGXQ
         Tp5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783430281; x=1784035081; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G+ucBQNKh2u8TygJUyr/SqZFCxEUaj4Cx7Z/tP8WgQ4=;
        b=tHWWexg0dg1cYlR682DWKYr5qkL3uPly/lemmv/i06OHZ81CLiGbMf+HOsnY2n9xhh
         7xIEcvH224N+WIjz1hKMyn3rbpoWSjN6KCbFRkQ6SvNuxXK/Dw15WBx2S6c+3A+KZw7X
         7SSGYG+6ksis5wwjqv7cnVZWEuNbU/mPJq3ftIPVno310tH2g6DHq7JkfOSs+fpP5ZZ6
         eplQQdAheRe9xdKz89vgGGdQrrzDKL+Tb35IOtEcPCUQ1nNkzqf0h8jNzIrwktOfS/Ij
         shFwZHJ5NEj7/9zb04aoChrp3dvmy6RuglRv42ColfTuWy0PYar3ws69nQnhBSklQTvh
         yFkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783430281; x=1784035081;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G+ucBQNKh2u8TygJUyr/SqZFCxEUaj4Cx7Z/tP8WgQ4=;
        b=LqSPzRBr3OHcXIwXTMgk0nuYw24P5rDHucEd6I+6sHAFNgVXaQaE29/k7NiXLcQa0y
         nZHs3xIlb1/l55HJSiCKwDjGnkvomJ6hITvpqTU0ND/lkHUlLnbklo6h+4OPm9TVZlmQ
         EWPtP8ELPY0YNqyFvBZ1qEWSF/oLEkHu42+16p3vgBgSJXLbgRI/6MQ8og3JGGn6GEg+
         i+mB3xpj9FwUsoQf+ySLYDLs1wGW3aHXqE3meqMWAtXkpGACRZmwYBL9+adR05hk3IeW
         7UztySz1xPMRnse1VE+ZVYjNc725honenn3SyFXqoxLyBAzRBBNPo2+tnTu0eqj9gSt3
         fwxg==
X-Forwarded-Encrypted: i=1; AFNElJ9wrCOcz+jnMIXs8uOtKDrA+HR2efI7Dv0M8qqcuR5h7BwlEAPGkPSxZlB0y3uE1mH+yQUjC1L75F7bsSxj4jI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9kOuWi6k/Mx+W10Ph0xyQabEd2HFeGJ3bmC/O4MBD5uz1NY5P
	99A3TQVyu5EBFo26wUIlg4JVNM52+TImbZfI2D7VYoDDK7Re1nQLR12c32jHGYK7IKXc929Byy7
	VWV2Q7Ew9YNDYPvaNECMTLC+cZcN12f8whKM7HDukpHR8xXesGnKb7NCNFuF2LKbW4nSCuziiEf
	yn3rdj5KmrC+B5U6th842T7U7ZZ6tSvDsfHPH/8MFR5XlN
X-Gm-Gg: AfdE7cmNURJ0InNJEGj3e/jILKi15gf7IJzCJ5Ju8jyvAvYGFkoRcgps0woPeW96YWu
	VhPU3OklnFWYWsMDGjq4VgpOLQc0RO/HuOJi6yp4C2+M2QK8NyzhCCZ3YrKA1ivKDRY+tpE4i4Q
	iNSV2lNrY3jfFF+UIzKYHiVXaB61PO2s0ifX4e6NoUz9AUQDT/1EU6Vbhha2cYFSmTAp0=
X-Received: by 2002:a05:6808:4701:b0:495:effa:f06e with SMTP id 5614622812f47-49fdf307c8cmr4281348b6e.42.1783430279385;
        Tue, 07 Jul 2026 06:17:59 -0700 (PDT)
X-Received: by 2002:a05:6808:4701:b0:495:effa:f06e with SMTP id
 5614622812f47-49fdf307c8cmr4281307b6e.42.1783430278702; Tue, 07 Jul 2026
 06:17:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707125837.57256-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260707125837.57256-1-bartosz.golaszewski@oss.qualcomm.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Tue, 7 Jul 2026 15:17:47 +0200
X-Gm-Features: AVVi8CcyzJYF53EZRdJRAa2OjT7bI6MDT1HI0t6HzQ3B3Epg4HnpwPsiwafwkSc
Message-ID: <CADSE00JrbEXXczJUwT8Lpn4MkMdSjcHWOsX+7F1Z_hkzjMos0Q@mail.gmail.com>
Subject: Re: [PATCH] bug: fix warning suppressions with kunit built as module
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, 
	Kees Cook <kees@kernel.org>, Alessandro Carminati <acarmina@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, brgl@kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 7, 2026 at 2:58=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> CONFIG_KUNIT is a tristate symbol but the warning suppression code in
> lib/bug.c is only built if it's built-in. Use IS_ENABLE(CONFIG_KUNIT) to
> enable it for a loadable kunit module as well. When using a plain #ifdef,
> the suppressions only work if kunit is built-in.
>
> Cc: stable@vger.kernel.org
> Fixes: 85347718ab0d ("bug/kunit: Core support for suppressing warning bac=
ktraces")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  lib/bug.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/bug.c b/lib/bug.c
> index 292420f45811..b9820a0226f5 100644
> --- a/lib/bug.c
> +++ b/lib/bug.c
> @@ -219,7 +219,7 @@ static enum bug_trap_type __report_bug(struct bug_ent=
ry *bug, unsigned long buga
>         no_cut   =3D bug->flags & BUGFLAG_NO_CUT_HERE;
>         has_args =3D bug->flags & BUGFLAG_ARGS;
>
> -#ifdef CONFIG_KUNIT
> +#if IS_ENABLED(CONFIG_KUNIT)

Hello Bartosz,

Thanks for the fix! While it is correct, I think we could just drop
the guard completely. kunit_is_suppressed_warning() already has a
correct stub in the #else branch of include/kunit/test-bug.h when
CONFIG_KUNIT is not enabled:

    static inline bool kunit_is_suppressed_warning(bool count) { return fal=
se; }

With it, the check in lib/bug.c is redundant.

BR,
Albert

>         /*
>          * Before the once logic so suppressed warnings do not consume
>          * the single-fire budget of WARN_ON_ONCE().
> --
> 2.47.3
>

