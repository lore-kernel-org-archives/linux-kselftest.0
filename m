Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553E931AA95
	for <linux-kselftest@vger.kernel.org>; Sun, 25 Jan 2026 15:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769355304; cv=pass; b=e+6rmylGbUUwCHG3joOqIYUeWTO5uhga7EbvUkk+Jjc7Yz31ywK8MRAziFJvWgdRtHnNEx3D8d5bw/pYUBG+0VFJjgRPtRg53Mt5uPh11eSyhWzkOnOYVDWexGn+ikUd8thj0wWcmVKWMFtFD99VD4zbLbhgutC9ZH3aGPftEnA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769355304; c=relaxed/simple;
	bh=8vgTsasdoGFJyysV4QshjqJZujkRrkBDPiELEwZd58w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hGit9VeVlrjM0dC2uZjj3VFE/htD614K81VmMyERoFry9M6e2D5xWm1TyGQlXvZxOg5f3PH7TKbfEnt0RgkU+wZPLjtsiS91z0iTP2x5s1TGTANU4Q1B577Aezuvq+MLqDJa1rjQ98MIR6TmrXveEQPPO6gdtSPX7ivrwgAm7Ro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dByZVtR4; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=muZcKJsh; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dByZVtR4";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="muZcKJsh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769355302;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hh86i8LoFrdXRrDy9tOfNcziJFbkWPtFbzTiy83QQwQ=;
	b=dByZVtR4IVkJ5AbniCGGC2O9MvqJ5w1OL46faU2W1hT8j8nAIFbNpTseP5uu6OxpOR2xFB
	+N9Z54a8WsCFw4lOgtCusBfOj7eOZCnFo+TB7bEjAqTWS0DLVun48ILtXZ93k7tvc/FVyT
	4jYxR2Puq2ejO1xapWDuwTHFNr0w7q4=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-220-fREJTkr-PteTZCR_PEiv5w-1; Sun, 25 Jan 2026 10:35:00 -0500
X-MC-Unique: fREJTkr-PteTZCR_PEiv5w-1
X-Mimecast-MFC-AGG-ID: fREJTkr-PteTZCR_PEiv5w_1769355300
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9412e67d171so15525285241.1
        for <linux-kselftest@vger.kernel.org>; Sun, 25 Jan 2026 07:35:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769355300; cv=none;
        d=google.com; s=arc-20240605;
        b=KZvS6XuuFPPYEAJNDdM4S0yng1zQr/QWddSGDf38bTRpOPpCX+PLzQ2YsIi6MIo0NY
         GsE7xIuou6MKQvcMReFXr9lxYWXie2Ha7geML5EcCcrdgVijz4g+qYbkXegVNDg0dnv4
         tSgzz3uyVzFPOEmJ499yLgnME8JuhFfUisYFxW+mtpEJ+VVOLo/z2NDVlQ9dNSyorDWv
         zoSe38+SXpP8VAClYLD153gqEw4+KPehd9BB/V9U67DhfixkfkdUFAHILOAk46fR+uyp
         OFC0TmWjEDq2DOl9PWQKyxoa4V22QEF3hx9wrcKbtTJakDqPw/xG95qV+4zZ5qcKZUZs
         gvsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Hh86i8LoFrdXRrDy9tOfNcziJFbkWPtFbzTiy83QQwQ=;
        fh=P7V2USKI/P5lOZpD1Z6onmF9sarwqVGTYawY5RFaMFg=;
        b=aofNbZRCS0EXWDB+f7xduVKk3bOvY8oybhHYBd1biaUYpb4CUzfsOXJ7t2wbsC7H1W
         SefRz7Y1Rn6qLibrnWe4ItU7q9K7KD5dLDsK6A3F8nRBxgkpjfJEqyZaieAFpVk8jx+Y
         xd1plygKL0mkCCXVmQ8IM0zJbZsdxsXGgE/QEl5ISfE2Z5LgWduaQUJ89UEAmO6GdfVS
         dpC4Kvq/rwYEJQhqD38hptBWoYgFo2yM+mzfQNibBnLBXL5XJJjSFhbzlGilLkApIyB/
         zS4V4VJ3xWTQvjzuKKcqh4WU/T5OOY3SL9UETNUGzCAP9BDhBWF9DSOx4s6fbeWeD3v7
         Dhlw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1769355300; x=1769960100; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hh86i8LoFrdXRrDy9tOfNcziJFbkWPtFbzTiy83QQwQ=;
        b=muZcKJshEbDkmfNweNe6WRH9Joykn+wh8kFspH80xPKri1hSw6Tus/hREli8ZyfUuY
         O3lwYiFT2BR6qqLptfAPD+r2WpAyYoKvUNnOXSG3gD/wkmkKVJFb4cyHU9GrFZPjSdJs
         vh8Bto/M2vRyHJbtutisAeQlUdrVzoQuW/hwEntyr1T08g7TgEG5klmXvAN0D9qsKWPh
         DTxqK0CWNQ4JMwoBHOWhgLMF7hGXUYw5BqR6q4db/kbgS8BZgS/8RAYBVGfdV8/x6NL1
         2yyNuQFmVtm5rRH/u1YluzmyTcONpYfBg/e4A9Zs+cxJnG14sOpqC7emv5oRrBTtxloU
         rqug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769355300; x=1769960100;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Hh86i8LoFrdXRrDy9tOfNcziJFbkWPtFbzTiy83QQwQ=;
        b=W3mUylRhH1vN/5S6TjfVc7heMlXSuVGnsYc20nZA9x6dX0g29n7uvzTTEbTHzcJ/vg
         1CabYBsXfOI04qe+8AEqYfw8SP+fCtZm5ap5TrYQHBQub0wouEcG+sCd/IkxUVNHy8Td
         qkijVARnBRB60t6ogK2hiELJfIaavsIN/rXB8zMmN8Nxk4fYqXLdvnjdLBj5buMz75Ur
         BKB+8xH2S+aIqEp2CDwJxKWSDSXAEjowInkiH8Ac0lAc65EMIkgnA+4cZE5FzH862eqq
         QDSgfYdLlUT5bmBLPsVmSCmd0KvbvrxJLu3VCZ9+9DEBUcwojX/2zLVrDbJLdLwkjR+O
         Knig==
X-Forwarded-Encrypted: i=1; AJvYcCVslW1CWEXeiETDnC9unPMc/NuIfDo4uRZFmj988sqIf6fiEpTXNhlBcdeZy8PufGQpQKfCs+kpWuISQ4ctl/o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxitZqbcGy9704J/6OPVOvGaC3CxHzkXgM1FcaeSAaZdwtdjlSj
	gA7Ohk4T7ItD60bquIPaLbJ8lCYNohvIgDA2GP9jeJULXaEx3PVHAocf8Q8nFgCC3V6D7bbDm8r
	G5pdku+z4r3FgbtVDNAK+LFr0vFmEDaGbOsMwOrlRpQEY5aFA3vOv/g5Rd6LfOZU5HVGalMWsbI
	7hjup2KUOV8xDm0zwwRvf3w4+XAcdL+bFTHoHaCkSolpKNWvSvtnWLJE8=
X-Gm-Gg: AZuq6aKormV29V47EEDumHoclkqgHCLVq7Dz/2zMq1ayhUzLfQLkloRxA6bhMOgbKx9
	krRwcL4+ftAw45ow81tl/EaU4YW4AT5uNIuCvY1LsgEndsRCXn7MulEbJBvTYv+243hh3Jd388x
	64kMgmXOwdz/pRivhENNoq7K2eH0ZUWZU4YO9Lq4pT3o4XnabxMDbrWwqUJL7yiF9LoWc=
X-Received: by 2002:a05:6102:440a:b0:5ef:b32c:dff8 with SMTP id ada2fe7eead31-5f5771afee6mr466114137.5.1769355299905;
        Sun, 25 Jan 2026 07:34:59 -0800 (PST)
X-Received: by 2002:a05:6102:440a:b0:5ef:b32c:dff8 with SMTP id
 ada2fe7eead31-5f5771afee6mr466107137.5.1769355299558; Sun, 25 Jan 2026
 07:34:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123112039.1370223-1-alex@zazolabs.com> <aXN4mFuoXhtJDKyF@fedora>
 <147635F1-943E-46D5-8EF1-D1C965F85EC1@zazolabs.com> <aXOGrXo3AbXPHA-K@fedora>
 <03C8F5B9-B2E1-4C78-A043-B4F9422508B7@zazolabs.com> <aXY2qdYtfVTSc7jB@fedora>
In-Reply-To: <aXY2qdYtfVTSc7jB@fedora>
From: Ming Lei <ming.lei@redhat.com>
Date: Sun, 25 Jan 2026 23:34:48 +0800
X-Gm-Features: AZwV_QgarjvWYF4UOUXMdwNp7c1A1qUIGGWrhDgv7qw_q1o9HQBQeyECn9XA0Pw
Message-ID: <CAFj5m9+hGUkm2Se3iEhkmtVs8sDxVVdfvzCc-WUjYmRd+OdUrg@mail.gmail.com>
Subject: Re: [PATCH] selftests: ublk: io-reorder triggered in test_generic_01.sh
To: Alexander Atanasov <alex@zazolabs.com>
Cc: Shuah Khan <shuah@kernel.org>, linux-block@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 25, 2026 at 11:28=E2=80=AFPM Ming Lei <ming.lei@redhat.com> wro=
te:
>
...

> >
> > Fedora 43 default config with some debugging options enabled, but no ch=
anges in schedulers.
> > Test VM storage is on a networked NAS over iSCSI - both boxes VM host a=
nd NAS have two NICs,
> > I get the errors when I load the network. So I believe the requests rea=
lly complete out of
> > order due to the network in my case. All tests that have the bpftrace c=
heck fail on occasion.
>
> Can you test the following patch and see if re-order still can happen?
>
>
> diff --git a/tools/testing/selftests/ublk/test_generic_01.sh b/tools/test=
ing/selftests/ublk/test_generic_01.sh
> index 26cf3c7ceeb5..26d5e52ece29 100755
> --- a/tools/testing/selftests/ublk/test_generic_01.sh
> +++ b/tools/testing/selftests/ublk/test_generic_01.sh
> @@ -13,7 +13,7 @@ if ! _have_program fio; then
>         exit "$UBLK_SKIP_CODE"
>  fi
>
> -_prep_test "null" "sequential io order"
> +_prep_test "null" "ublk dispatch won't reorder IO"
>
>  dev_id=3D$(_add_ublk_dev -t null)
>  _check_add_dev $TID $?
> @@ -39,9 +39,13 @@ fio --name=3Dwrite_seq \
>  ERR_CODE=3D$?
>  kill "$btrace_pid"
>  wait
> -if grep -q "io_out_of_order" "$UBLK_TMP"; then
> -       cat "$UBLK_TMP"
> +
> +# Check for out-of-order completions detected by bpftrace
> +if grep -q "^out_of_order:" "$UBLK_TMP"; then
> +       echo "I/O reordering detected:"
> +       grep "^out_of_order:" "$UBLK_TMP"
>         ERR_CODE=3D255
>  fi
> +
>  _cleanup_test "null"
>  _show_result $TID $ERR_CODE
> diff --git a/tools/testing/selftests/ublk/trace/seq_io.bt b/tools/testing=
/selftests/ublk/trace/seq_io.bt
> index b2f60a92b118..60ac40e66606 100644
> --- a/tools/testing/selftests/ublk/trace/seq_io.bt
> +++ b/tools/testing/selftests/ublk/trace/seq_io.bt
> @@ -2,23 +2,45 @@
>         $1:     dev_t
>         $2:     RWBS
>         $3:     strlen($2)
> +
> +       Track request order between block_io_start and block_rq_complete.
> +       For each request, record its start sequence number and verify
> +       completions happen in the same order.
>  */
> +
>  BEGIN {
> -       @last_rw[$1, str($2)] =3D (uint64)0;
> +       @start_seq =3D (uint64)0;
> +       @complete_seq =3D (uint64)0;
> +       @out_of_order =3D (uint64)0;
> +}
> +
> +tracepoint:block:block_io_start
> +{
> +       if ((int64)args.dev =3D=3D $1 && !strncmp(args.rwbs, str($2), $3)=
) {
> +               @start_order[args.sector] =3D @start_seq;
> +               @start_seq =3D @start_seq + 1;
> +       }
>  }
> +
>  tracepoint:block:block_rq_complete
>  {
> -       $dev =3D $1;
>         if ((int64)args.dev =3D=3D $1 && !strncmp(args.rwbs, str($2), $3)=
) {
> -               $last =3D @last_rw[$dev, str($2)];
> -               if ((uint64)args.sector !=3D $last) {
> -                       printf("io_out_of_order: exp %llu actual %llu\n",
> -                               args.sector, $last);
> +               $expected_order =3D @start_order[args.sector];
> +               if ($expected_order !=3D @complete_seq) {
> +                       printf("out_of_order: sector %llu started at seq =
%llu but completed at seq %llu\n",
> +                               args.sector, $expected_order, @complete_s=
eq);
> +                       @out_of_order =3D @out_of_order + 1;
>                 }
> -               @last_rw[$dev, str($2)] =3D (args.sector + args.nr_sector=
);
> +               delete(@start_order[args.sector]);
> +               @complete_seq =3D @complete_seq + 1;
>         }
>  }
>
>  END {
> -       clear(@last_rw);
> +       printf("total_start: %llu total_complete: %llu out_of_order: %llu=
\n",
> +               @start_seq, @complete_seq, @out_of_order);
> +       clear(@start_order);
> +       clear(@start_seq);
> +       clear(@complete_seq);
> +       clear(@out_of_order);
>  }

Forget another change, please apply the following delta too:

@@ -28,8 +28,8 @@ if ! kill -0 "$btrace_pid" > /dev/null 2>&1; then
        exit "$UBLK_SKIP_CODE"
 fi

-# run fio over this ublk disk
-fio --name=3Dwrite_seq \
+# run fio over this ublk disk (pinned to CPU 0)
+taskset -c 0 fio --name=3Dwrite_seq \


Thanks,

