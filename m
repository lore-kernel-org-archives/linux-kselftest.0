Received: from mail-vs2-f1.google.com (mail-vs2-f1.google.com [74.125.227.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF8241F5CE
	for <linux-kselftest@vger.kernel.org>; Thu, 16 Jul 2026 13:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784209569; cv=pass; b=qKImepe1zWvcnwSolmfPhqmD0TO0e3d8cRDfxO/JnI/q87OfFrpkdPtwPV2dCF7v+/HENgxVbQXcHgqNTSaUNWJsi3AtjVRzUcHv2p4RHkVlwnjIhzfVNYAJtRztZV6xjpTrMsj/r5WOrvQSt8WkPwmmwCdmmUumOAyrDtbo34c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784209569; c=relaxed/simple;
	bh=88rg4ap1Ij07RRYdBTBtaSzG/94ti+xgqSgbMDQsOH0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mL6mLOysObGuHYd7xEPfR+9Ez9MULOiX+QYg5xO1u47G2c4mWtsAOh6Y11HIqs4Z4KhA7ADHbzic6LBiHeB1vFGxb1cc3QYPTEsT/UxeylV8nGU50JoCbyGL+0pxItBTb0sez+oZQHNqblReYb8gNFqgb+d+AajGAdCQQYeAXnM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VYuRz6he; arc=pass smtp.client-ip=74.125.227.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VYuRz6he"
Received: by mail-vs2-f1.google.com with SMTP id ada2fe7eead31-739936d2c87so5650378137.0
        for <linux-kselftest@vger.kernel.org>; Thu, 16 Jul 2026 06:46:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784209563; cv=none;
        d=google.com; s=arc-20260327;
        b=HdyJbQERrctc3dYUT+MfLqNH/hdDvZo4/q80sPkZ+TH6ablYJRryAPQvZnztxrQkpX
         Ys/OFKqDNG8jCikyRZAQzhxoF9TzK+qy4FHb6aRSexMSdXSmj9dX7fp79j8OIeMMg9JF
         vjsbz10F9vP7V2nMRj3F4JnFJIo+qWAjNgLUlBO/RkVFjsk+0ABSJwn2adc+VdlEj1v0
         cg5uUYGxePjwW1wKhJLyhdZf+/8LxVUEwmxjKL81svRG2DypxXVpSAbWdDHPv2x9qugU
         PgMeGxC69H5rl3mBPDr319yR9vYy8aWnmMZYzvApTbGkkq8dIwFBYk5IegaFcs36Z9kA
         sSFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QxAFuQ5xZZyrvLrkS+Zmn99zGko7SEm0ZPZdWZNa3q0=;
        fh=jRh19WRIDL8Gm7HhV/D1dazZKqfz9fou0vvCPqFJU38=;
        b=q92nsyvVw7xygIUYQWm5kghZaayGn+u+GuQwdcbUmyKRdovZReI0jX7u5fmldumsom
         khprXML0liDXqtu1BztOt57LU81sESvyFpTrVZ8qpuwuqCRdQ/xS8Pet4qRvMHD9UTpK
         RxMilcMjq2nyXgnMbyuGLD0SOCStlLaIf6Pw40bxZcNy5Zz9uiklrpgrJuijcJhF6JZK
         5ohA0P9Q1pUeRtASdPPgCKLhZLgCC4tP5xfD6RIH8XtKQx2AiJHBe3sk5xifQ2d/1P2Y
         P2zC7K+0ze24HMRrNJS21h68g3nZBD888hdm3cm0P2RxPpEgR6RlHscJv9r9IHAMvwRb
         914Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784209563; x=1784814363; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QxAFuQ5xZZyrvLrkS+Zmn99zGko7SEm0ZPZdWZNa3q0=;
        b=VYuRz6hetOoRp83mnGo7c6pyyMb4x3+G+jf1PYMj/66Yx0e1UnPJ0iZO6/4DrABe7N
         chIMBGnR1nJwnN75Hctgypc3AZFIcSqCy+JWPBd2/PxgRoBPUFtcUT4yilFRWRgfe6/6
         7qib7un43BdBNpcgqUNmCPvo1mjoNAoFg19+xtz/2dlshMlnzYDoXMV9eGbDTaNpUnSJ
         iCwZo1tbHUbWVJ9QO30WcWTHgalkeOXh6CcMUJC/XulMzPI2uffJ+njEFuG/kaPe6eBX
         +j/EKfupuQZ16296WuTIWNeWV1FTYRXPXzTub9Ps9DBMJ0JmnicHbRZFnTlWadJ5irrU
         NDdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784209563; x=1784814363;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QxAFuQ5xZZyrvLrkS+Zmn99zGko7SEm0ZPZdWZNa3q0=;
        b=tCsBCmdKGB7l+rdPAO79U5xTFKLJFxyBK3z2oWgLdB65ujtesWQAXasycz21Lka0gf
         Jsm+ULQ4u/gi1ST/+pZINDMwuJSnAshCaJvYcB5b91aFlheb76pV8JWlLgG9ZCQOi1NA
         +eHLsZj/uN6jscRhOoHMgWWhwCmWX5fsDqrBwJjwaMAK/f4ypVuHGb6LBZ6zp8OlCS39
         oarYbzqkPozeqPeJhn7tLUMBNb51W8kmg0sVXAwKolsAYhWjLdHcIvAk7KepKmFTmk0o
         CbTqgxuZPay/9oL3qpvEkLhnAlxyt+Qd9XrZkRTb/H3Zh8+D5FnXMp8U4zdIiaHrovb7
         9M4g==
X-Forwarded-Encrypted: i=1; AHgh+RpmlfEeCQOkjIQVf8P6IDPIbKEqcOrhouG6i+0j9FFv2QAWqMmXLZzQHNrJAjOsSAl27qd9M3XAiAyqtxbDb/c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVb24sYNqZqKIuufrPYEEM51Xqeu0tanD30PjmMDLQbrM4s8o6
	NYi6PTWXOab2uZOD5qYP+ST0Ox8W57Ud+CfSwddy/11OwlFqLM4dgbYuW6oqmrl1h8xYA5C17qM
	K/HZnWb5PWNeJbcKJZzDtmI1BQL2UamcDFSKgfAY=
X-Gm-Gg: AfdE7ck64AF1M/lVYLYMJno/G58XN4VH0u37JDTyVF40dxSSw31xXMhf9TGFTtx9aWu
	+Aw2vjh/kj9bK69tLRE4QKTxCepFcngH14ND5MAdwPsTj6tKlXbJHJlcoSIVg3s+aCk2BIZEhUx
	x2e6+LJnu7fRDXd5E2Mli/dmtRWEmukkh31h0sBVbO3a0PcTLkuWbavl+ZrWw+3FxwkIszvFa19
	VKFgugMYGJEvnAjRiFay+AQQRFfVn3zExLf5VGHFcV0PfhpZohJ2BBQS8YiUQcOChTer+zOi7oE
	sE/tR0zCQKINuhKaKTNd5/sr48/z4w==
X-Received: by 2002:a05:6102:5e93:b0:738:9c79:7507 with SMTP id
 ada2fe7eead31-7458754907fmr6687137137.21.1784209563424; Thu, 16 Jul 2026
 06:46:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715133418.170386-1-jaeyeon.lee.dev@gmail.com>
 <4b6904b5-81f9-4e27-8ac5-5bd7e7174c5d@kernel.org> <6c474ce7-8f1d-4e85-8587-8a60983cec03@arm.com>
 <0c278b69-3ecd-4ec3-b418-dea84e043732@kernel.org>
In-Reply-To: <0c278b69-3ecd-4ec3-b418-dea84e043732@kernel.org>
From: Jaeyeon Lee <jaeyeon.lee.dev@gmail.com>
Date: Thu, 16 Jul 2026 15:45:52 +0200
X-Gm-Features: AUfX_mxaZp1KmD29X-ZII3zTTTVur5EMlazjDkqL0QNPD91M51xZ8UzVLh_5paA
Message-ID: <CAD+X6aB79DQCVZgp7ZkcS1qRuFC8Ypjc2MvTrJy6qhbryri88Q@mail.gmail.com>
Subject: Re: [PATCH] selftests/mm: khugepaged: skip swap tests when swap is unavailable
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Dev Jain <dev.jain@arm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> I would not pack a "let's test if swapping in the system even works" into=
 a
> khugeapged test.
>
> I think we can reasonably assume here "swap subsystem is not completely b=
roken".

I understand the point. I won't pursue this further.
Thank you for taking the time to review.


On Thu, Jul 16, 2026 at 1:20=E2=80=AFPM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 7/15/26 16:47, Dev Jain wrote:
> >
> >
> > On 15/07/26 7:39 pm, David Hildenbrand (Arm) wrote:
> >> On 7/15/26 15:34, Jaeyeon Lee wrote:
> >>> The collapse_swapin_single_pte and collapse_max_ptes_swap tests use
> >>> MADV_PAGEOUT to swap out pages before verifying khugepaged collapse
> >>> behavior. On systems without swap configured, MADV_PAGEOUT succeeds
> >>> but the pages are not actually swapped out, so check_swap() returns
> >>> false and the tests report a failure.
> >>>
> >>> These tests cannot run meaningfully without swap, so a missing swap
> >>> area is an environment limitation rather than a test failure. Detect
> >>> the absence of swap via /proc/swaps and skip the affected tests
> >>> instead of failing them.
> >>>
> >>> Signed-off-by: Jaeyeon Lee <jaeyeon.lee.dev@gmail.com>
> >>> ---
> >>>  tools/testing/selftests/mm/khugepaged.c | 25 +++++++++++++++++++++++=
++
> >>>  1 file changed, 25 insertions(+)
> >>>
> >>> diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/=
selftests/mm/khugepaged.c
> >>> index 10e8dedcb087..f9b4ebe733ce 100644
> >>> --- a/tools/testing/selftests/mm/khugepaged.c
> >>> +++ b/tools/testing/selftests/mm/khugepaged.c
> >>> @@ -100,6 +100,22 @@ static void skip(const char *msg)
> >>>     exit_status =3D KSFT_SKIP;
> >>>  }
> >>>
> >>> +static bool swap_available(void)
> >>> +{
> >>> +   char buf[256];
> >>> +   bool ret;
> >>> +   FILE *fp =3D fopen("/proc/swaps", "r");
> >>> +
> >>> +   if (!fp)
> >>> +           return false;
> >>> +
> >>> +   fgets(buf, sizeof(buf), fp);
> >>> +   ret =3D !!fgets(buf, sizeof(buf), fp);
> >>> +
> >>> +   fclose(fp);
> >>> +   return ret;
> >>> +}
> >>> +
> >>
> >> That doesn't mean that swapout will succeed.
> >>
> >> Take a look at cow.c where we use pagemap_is_swapped() after MADV_PAGE=
OUT.
> >
> > That suffers from the reverse problem - in case of a real swap bug, cow=
.c
> > will skip the test and anyone running the test won't bother.
>
> Yes, because there could be other reasons why MADV_PAGEOUT would not be
> successful (speculative page references, out of swap space).
>
> >
> > I think this patch idea is reasonable, we need a way to say "swap defin=
itely
> > won't succeed because there is no swap device, so skip" vs "swap failed=
,
> > need to dig in!" .
>
> I would not pack a "let's test if swapping in the system even works" into=
 a
> khugeapged test.
>
> I think we can reasonably assume here "swap subsystem is not completely b=
roken".
>
> And if we want to check for that, have a separate test that stresses swap=
ping,
> if available.
>
> --
> Cheers,
>
> David
