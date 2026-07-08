Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8FB388E43
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Jul 2026 10:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783504855; cv=pass; b=rcoWmnMedmtwPolxsl1R3IMuRRWPat0c7hN1rJ3mq2E4iOREKD9nODy4rMNDEElxxc8vQzfkSk7JD+N4Bc7onwNyT7VwDJjsgkqbekcI2ZWvTTSO7vOBxjvTIZ9boyl6fCWutRPYWoHJzUHqKq4hZQDNomGRSp62vQv+JvI5YWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783504855; c=relaxed/simple;
	bh=zMb4vGxKg5zXPjuNFFDp0IQHLFIs00h4Ggo7w7Y/6K8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OmsP0ET4ABmbIXtkbPxkmZmxoLN8CnP5pdHaHwTxNymDoEmtS2sVVOe++uT+W+PrasAuzzQ9fuAbsJFiJWLvvWqjLzVmIL0NTbw/yev4kvnH2nwnVRoUyInRnf8UJ8yvsNHx2sO9jM/YbDwryC32UqZDqROtavNnQphnAcPy6Gw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Pi+vg+cG; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ij73lVck; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Pi+vg+cG";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ij73lVck"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783504853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yE7SABVDqZevBVFAhiLXSdt8sJh3auncorNJpdn2UKg=;
	b=Pi+vg+cGVkoWpegamyx4kecJFkkhQx+qVQQm2JMv0gyiMLoc7eSSsk5QAk0qLmgH734l1q
	H6JzmuNf73xW76AanIa3OF7XHzl2MajPn8H+Sh7SDMJyep9Gi1ry/CspFWDToub7dEHk9o
	v2nkfAosJPolozTpFecDDKrnT2SfG4c=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-656-KM1ke6-NNWiTXjzrAYEXaw-1; Wed, 08 Jul 2026 06:00:52 -0400
X-MC-Unique: KM1ke6-NNWiTXjzrAYEXaw-1
X-Mimecast-MFC-AGG-ID: KM1ke6-NNWiTXjzrAYEXaw_1783504852
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-81c58965af4so20399047b3.1
        for <linux-kselftest@vger.kernel.org>; Wed, 08 Jul 2026 03:00:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783504852; cv=none;
        d=google.com; s=arc-20260327;
        b=d6AxoOtwO5cvdhqndSnzDQFL+oThVMpDz8Hyjv/gZFYzjbnqCZAG+1QwbYNtjdQO6k
         6YTVE+18FalOIw32cmsjblgWgjXs3MTzsDFkcGdSLx+GqVhEI843NVWcxmME2B84sV7Y
         npvKz7hMiMk9JY/98sLlCC1R2BNeaQYHPkwPd+pKnOLz3Sxq9LwPzeh3LNtf+p86fi8t
         gM423T+QlEN6K/bgAjvwK0ooqs21rI38GaYeqnyJoTOXFqowDlGVsahp8mM4IA2TEZBf
         jSbYlyo4AdR7PWUytGUBtyS2O9OHXrRERcLXps8h5JsnPrU6kRXDv1bqTTHNS6FK+S1C
         brCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yE7SABVDqZevBVFAhiLXSdt8sJh3auncorNJpdn2UKg=;
        fh=vP6ZyQzzo14XqrUTxWpoRFi3LLibkI9XtuWCbCpf1pc=;
        b=ZsptcIAmgcDx771lihPfmN4j0ShiYT0eL4f88jM4sT4u5F7Hed2UnqNgwCL28mCQGw
         RZ2i+B/A7bI5GgX6vk3gCasQCX69OzqTciDXr+d/hVHzlIrBx1c5gqK+AKbh14J2M+jD
         phPOUbSlCV15W9T0Bq9DWnJ5CyqXFqwEwQvv59/xzD7HPPgeR4LVT31FNhGDyZh6rBDz
         6/UFrjxyYFZ+0KMSgy/XqHryoz53EhrFiCQPkEY2fa9jMIdqxJxaszUVifKUBleVYypr
         zNxCPdHdBd6MFpQaZ3lHK+W6rNOZH/af1gQIE7PkIW5O2JrQA171EztKTorL/YlE9A0d
         vVeA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783504852; x=1784109652; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yE7SABVDqZevBVFAhiLXSdt8sJh3auncorNJpdn2UKg=;
        b=ij73lVckIHWgg3i8Bs8Ab/NSF5C4fUhO9b+clm/QfqhvxG9KpjmbApx1JMQrOU73zk
         Tm/pAr+aTv1TJFEPT7DozNdSyIfgI+ZnlR0kc2vgStnTIrGA6yU3pAKBjFq9TDIjk2ss
         0c4uh1fD1e0YrWNj9Bs4u8tT3sEiiVfR65zUnKvdLL4HehiTSFEQa10ugMcND5HRElQB
         CLaTODtdjP8smvbWV0MOetJKD7OKshuS9d9hhmDv8ZtNaNGcGWe506Ax6RopxqGc0dAt
         rk8wxKDX5ujwNEW1qmBs3vBwE7RSDhvtMaQAwPL1zJ39KXKWi0/g2xFThQoaUvV20SXu
         ePuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783504852; x=1784109652;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yE7SABVDqZevBVFAhiLXSdt8sJh3auncorNJpdn2UKg=;
        b=mN6B0CBLHjc5mxoZlHtsbiZj6rW6hVTexj6j2gHLWp/cFrHdB6srNlNwkBK0NhCGp/
         JTiTDBpc9FioJoVqDV56lsgScM6lnPsxsT1zFg2UEZlfX/BzVBKr7cr7Bk41wFLyDUqY
         mHCB92sQnGpKOD3U29Bn0yIFBfLurehO6iu7rzVxBSGvwFQE4xdgb/TpxI2fzlDgVjHy
         A+7oqZZ6sWhXssO9aJZp4cdcV1dyabbFMc5jHojKVeYSQmms4J424w1c/UWEqyREq704
         Gzc7gDQvkTV0AAROC24zZJfM76dts9ovFQ9KgAB1EXz6N0oreD0l6Kvynm5a6wWyoO39
         Wh2A==
X-Forwarded-Encrypted: i=1; AHgh+RpXUWvHlOFe/oBmozKOLFUgvUYVH/TlelHNPXzMYCaUOy0oyueajigkNj6LV4BNb9Mc0KVwt53uQAFjuYMWNYY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7DV1vxB0sc6U+OM9qKDi7Q1Xxwy6cHTG3A+E/Bt8kC+U2p4aP
	szP1FRR/+Y0ThvByrm0PtJs3sEOJK3QIPSWf/ctVqckwauNoOO4QYc+5SAQN3/Xd0DGEW0yx9yW
	g3BOuQnVgAEnroFAybhU0zjNtB5R+qIfytQ2oZ/wv8TysRcMt6Q65iX/YdiW3RpOmfVGP3olkfQ
	ekHhH1SOZ+651pRf5vybUN2fb5YFvZueuMIRgW5qQT/uo/
X-Gm-Gg: AfdE7cnJ7zs70C/AgU55kNJ+OBr2u6URXPKAyoXFrLxgWDSzXY1kFi6wqef9r4l1CUV
	9sT8GPz0hLN1NloAsnGDht+ElhOMXMjQ/NMh3vWDhc+5zT9v8H8hNhxjp0cg4qXkJGD3ozRNE/A
	88FhU6lqA8uod+0g1lXa6mM35K+8tRqgdrTXPDz6dO0rrkk4wwFDopdCceom1s2BRGa+o=
X-Received: by 2002:a05:690c:e14e:b0:7e9:ea36:f256 with SMTP id 00721157ae682-81c5e30d111mr44250297b3.17.1783504849696;
        Wed, 08 Jul 2026 03:00:49 -0700 (PDT)
X-Received: by 2002:a05:690c:e14e:b0:7e9:ea36:f256 with SMTP id
 00721157ae682-81c5e30d111mr44249947b3.17.1783504849163; Wed, 08 Jul 2026
 03:00:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708095459.12111-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260708095459.12111-1-bartosz.golaszewski@oss.qualcomm.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Wed, 8 Jul 2026 12:00:38 +0200
X-Gm-Features: AUfX_myplwdTWk12ZF-d1YhVEM7RbTmMzfkKP0RwsoDr62uWCGQBm8ctL06w_no
Message-ID: <CADSE00Kt0rnC6bOsLDodpfvpdUC=KBk7reJ=NC2wo_y7w4iNUg@mail.gmail.com>
Subject: Re: [PATCH v2] bug: fix warning suppressions with kunit built as module
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, 
	Kees Cook <kees@kernel.org>, Alessandro Carminati <acarmina@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, brgl@kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 8, 2026 at 11:55=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> CONFIG_KUNIT is a tristate symbol but the warning suppression code in
> lib/bug.c is only built if it's built-in due to it using a plain #ifdef,
> rendering warning suppressions broken for kunit build as loadable module.
>
> kunit_is_suppressed_warning() already has a stub for when kunit is
> disabled so drop that guard entirely.
>
> Suggested-by: Albert Esteve <aesteve@redhat.com>
> Cc: stable@vger.kernel.org
> Fixes: 85347718ab0d ("bug/kunit: Core support for suppressing warning bac=
ktraces")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Albert Esteve <aesteve@redhat.com>

Thanks!


> ---
> Changes in v2:
> - drop the guard entirely instead of switching to IS_ENABLED()
>
>  lib/bug.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/lib/bug.c b/lib/bug.c
> index 292420f45811..7c1c2c27f58e 100644
> --- a/lib/bug.c
> +++ b/lib/bug.c
> @@ -219,14 +219,12 @@ static enum bug_trap_type __report_bug(struct bug_e=
ntry *bug, unsigned long buga
>         no_cut   =3D bug->flags & BUGFLAG_NO_CUT_HERE;
>         has_args =3D bug->flags & BUGFLAG_ARGS;
>
> -#ifdef CONFIG_KUNIT
>         /*
>          * Before the once logic so suppressed warnings do not consume
>          * the single-fire budget of WARN_ON_ONCE().
>          */
>         if (warning && kunit_is_suppressed_warning(true))
>                 return BUG_TRAP_TYPE_WARN;
> -#endif
>
>         disable_trace_on_warning();
>
> --
> 2.47.3
>

