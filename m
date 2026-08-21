Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F89C492505
	for <linux-kselftest@vger.kernel.org>; Fri, 21 Aug 2026 16:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787328589; cv=pass; b=Sav1bMzXWVM5lArzrtkiv/cPXypeGCgHEApcQ+zUirjPRRQwgaFvYPRwSWZ3KvhyLb4CsTi4yuMYp9Pm+zfjk25Svd1wtDOE6+UONfOzHRCvn5U9bLR0GMoTy/INVywnnWfg6DwZ7HY+EUFX/o3QSqEiCVeYQFVylMEnvXUGyoM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787328589; c=relaxed/simple;
	bh=qlIGS/bfjSwjQyUgloEYDDpbbb2frDUVh7GrW+zhEfM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cr12d5PH0pHI48xEuaN1d3AD/+F/JEjFOgV1rDqd8yLSYN+k1CjvOEKJbqsrPUcoHZYDzQ6oW+qjctBMrJ1u81+VHjeRlMW3BP8d2buHNio0UpVn60y5+A2AZjFSspmcKNmP15faRPFZHBfw/sAE7NodsT1Ptu4nzvDNc2Sl/AU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XJ8THTki; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XJ8THTki"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d5655cc850so14969285ad.3
        for <linux-kselftest@vger.kernel.org>; Fri, 21 Aug 2026 09:09:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787328587; cv=none;
        d=google.com; s=arc-20260327;
        b=cn5DWxpgmPqZpV4h9WNJK4fyPZGlQ2Ch7JhZyfrwsq+r+WNT44A8CwoHlMi9FQJ3bE
         tZ6IoF8H2ZDx5F3g9/RXfAHbnmAuPGOuf+KZ6JyiRIecVQHR4QQ2py9st3SQ6Gz/iZW/
         De6JJXc+gSLaiJemBQI3kXm/AxhO/NpXJg8VrUQPo2RpffDS2ax0G0SlNEjow89sqadm
         F1a4IaW9qYMei/NNw87Xqd5JJlJKNpHveh6AdUhFVIpJI8WUXL1xSyTsuinJRbXBPR2Q
         HJo/0qVoF/7+RZD2PQQQj9IVr4iQtGozypMMhgkbyeVd29dHFZVXQCque+V7mmiLH3Ek
         LBpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Tazxm5NFBsMsYMGez4lAodAlGpJHR0dLcykvQtxWQkU=;
        fh=1x+GXnBHrdZqBuHC51RhNRkHXxFPBEEkpi8JS71vw3I=;
        b=b0713RZevQ8bqhWm+h/PvltzxhivD+QfM7QW9trj+lvYoobftCizZhC4D51Zwkq6Tp
         c39EW2U0EBd+DlZEpovUSnmEeZtA9K6sLU32cqLme27YLZ2+oRULIz2FhHGkZgzOYvyT
         3+7jkehguxw4GSEGXQBiGos8PgpZ7zuEGElUcXK8oPoA0dzCRfxjGCnICIsmRipUmcxw
         rGQ8f6JRSftllGHdqPhZuvaXNAMtLgwZf7Kp6Serpu5zFfQ1Jh3ikrIsn58HIO+d6iDO
         YoiMSav5rgB51HZFLllggqvHHW3mqGptqNn3hY/bQm1aad6mgXNVr3/lwyc61gmTleLt
         1dkw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787328587; x=1787933387; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Tazxm5NFBsMsYMGez4lAodAlGpJHR0dLcykvQtxWQkU=;
        b=XJ8THTkibT081XVi9Al5zTVuZNJZ3cUveMMPvAHyjr5cbHrDoBprcPkursRGndae5E
         xyeE5ySVs/XYGpeXUt4YtZzkaO+GX26Hj2bWPE/mw503DfQr/e2cIx7QwPGBdQ4rzle/
         W/DE4tGb+XnHztor6LNNVx1uQy0NNxGtURfz1ogCDt/eqdCmpdZrFbNUKxb5TdC96iP0
         RvuJGyNyizIWPIK0AFig1sK/3otNFb4fpy7CIR+tWleyElxWPQaZdXyU7FCeFJZOxYSd
         POI4S5LfpgChQnloF+Udi8ShLAIhN3hzdmqOG3+T6n6prLpRTbDc4nknJOIOw5vxdceV
         QQTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787328587; x=1787933387;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tazxm5NFBsMsYMGez4lAodAlGpJHR0dLcykvQtxWQkU=;
        b=m4nb3iboZGCvml9sI9MtacrqDBBCMEuPdoSs3tAek/zEtdwuSz+f5tECNyGCLIRTFO
         wJlnx4UIZqk3x8xnreKWaEfOmv1kj3NlakTg9PRW6pqsFAjYLYFdpHzuSfTgXTCFLmX1
         trS6Evqsmo8ZD1AMul6XUPNtx0OWviLLU0wFq7wNOMqDXSi9MJ+D6bTWl75GbVNZZ1Xf
         aqyihryh/Tc6LbnPryOjBUwDj5c7VT4XghlXf4NC0PAU517oA+qtjAa6dEKRQ0PQXu3J
         Fiz3FDUouQ7d3qg1ViP7TkeTCU9pLGwEYaLYW340XjAwfxX1OgO5gcPyD5Xfaz6gieLJ
         3c3g==
X-Forwarded-Encrypted: i=1; AHgh+RowB12kd5O6ylnoBqmFUMNoKouLKHUOL4A9Mqd13N4ID1mG1hmD5sEHQSND8bexFyrHm8qNZLTzAJ59B+yvFbg=@vger.kernel.org
X-Gm-Message-State: AFuF++nswGfSGdsUjcH1lJ8Pe3YCAL2l5uf4zBXjqbPvVPnwOKqz7PEn
	PZ4GpE75B7rpKzq0kphcSBlo35i6n5ymrVf+wzKq32sF7s0kGhbW54VixRaLBC8G2O/CPgaGmhb
	24gDIpcoKtG/XJSGdD5LV6IDaccNCqII=
X-Gm-Gg: AR+sD101MVM4lbQzr/rIxGbMnp7TUdOSTQbZzxs/gpbHiE1GSM8r9+iBFLGu2jIr/If
	q47QwO5a+lel7dMXv7+TwJA3JESMgZ5W6LpzisdzNQItfkkHqQ51a7M318BnRMTpL2+/K+8Bvh7
	vh93+r9X16fIg7aI8U1njYjTj0Ev2NZxMhO4bmq2is4aEEIrAysGkeQ3lesR6hu7MaZTPhCEqak
	fn5rODhEt+UuQrh+IOnRUaPUXsDv+iZZTYEEC0UaIe1pFkbth7BDLU04DKisjF/rwTudbbijQUz
	Ho9V/FfwT+f1J/yABZ+M+3adYHN4DBf5EsQcErRcwelz0ARQETyq1zaer0X3NZfx9MQufo84zKN
	cqz0=
X-Received: by 2002:a17:903:2c0c:b0:2cf:8131:75f4 with SMTP id
 d9443c01a7336-2d64b036898mr149534745ad.11.1787328587312; Fri, 21 Aug 2026
 09:09:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821114416.12255-1-anshumantewari123@gmail.com> <7bb2d581-924e-4a59-9955-b8afa2b51268@kernel.org>
In-Reply-To: <7bb2d581-924e-4a59-9955-b8afa2b51268@kernel.org>
From: Anshuman Tewari <anshumantewari123@gmail.com>
Date: Fri, 21 Aug 2026 21:39:35 +0530
X-Gm-Features: AcwNN1XKYZiaEhnwGrJCHIYlV_rZXplCdB7CN_bs-y4gxXJBSCqD5LOGANhLuA4
Message-ID: <CAJqi8kJf9EzfZWBo=1KpEzGiq+vGRz0J0mN+-NXAjrtq9HDrMg@mail.gmail.com>
Subject: Re: [PATCH] selftests/mm: check strdup() and fix buf leak in parse_test_type()
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R . Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks David, agreed =E2=80=94 strdup() is overkill here for a single-use
parse, and dropping it is the right call.

One small consideration on the approach: working on argv[0] in place
means strsep() will overwrite the : separator with '\0', so the
original string (e.g. "khugepaged:anon") ends up truncated after
parsing. Nothing today reads argv[0] again afterward, so it's safe as
things stand, but it does mean correctness quietly depends on that
staying true =E2=80=94 a future change that logs argv[0], re-parses it, or
echoes it back in an error/usage message would get the mutated version
instead of what the user actually typed.

If we'd rather not rely on that invariant, an alternative that still
avoids strdup()/free() entirely: copy the type argument into a small
fixed-size stack buffer (with a bounds check against its length first)
and run strsep() on that copy instead of on argv[0] directly. Same
benefit as your version =E2=80=94 no allocation, nothing to free, no
NULL-check needed =E2=80=94 but argv[0] itself stays untouched.

Happy to write this up as a v2 if it seems worthwhile, or if you think
relying on "nothing downstream needs argv[0]" is fine as-is, I'm okay
going with your version too. Your call.


On Fri, 21 Aug 2026 at 19:49, David Hildenbrand (Arm) <david@kernel.org> wr=
ote:
>
> On 8/21/26 13:44, Anshuman wrote:
> > The return value of strdup() is never checked before being passed to
> > strsep() and strcmp(). If strdup() fails and returns NULL, strsep()
> > returns NULL as well, and the subsequent strcmp(NULL, "all") is
> > undefined behavior, likely causing a crash.
>
> In practice this is extraordinarily unlikely to ever fail. :)
>
> So I don't think we would ever experience this.
>
> >
> > Additionally, buf is never freed. strsep() advances the buf pointer
> > past the first token, so by the time buf would normally be freed,
> > the original pointer returned by strdup() has already been
> > overwritten and is no longer available.
>
> Given that parse_test_type() is called only once, nobody cares.
>
> >
> > Check strdup()'s return value and fail cleanly on allocation failure.
> > Keep a separate pointer to the original allocation so it can be
> > freed once buf is done being used, after all parsing has completed
> > successfully.
> >
> > Signed-off-by: Anshuman <anshumantewari123@gmail.com>
> > ---
>
> [...]
> That's too much churn for something that is irrelevant in practice and
> makes the code more complicated.
>
> So the following is better I think:
>
> From 36d525409eb16f56e667b2f979f2c6ef112ff235 Mon Sep 17 00:00:00 2001
> From: "David Hildenbrand (Arm)" <david@kernel.org>
> Date: Fri, 21 Aug 2026 15:57:57 +0200
> Subject: [PATCH] selftests/mm: khugepaged: remove str_dup() usage
>
> We don't check str_dup() return value and never free it. While both
> things are irrelevant in practice, let's just work on argv[0] directly
> and avoid the str_dup().
>
> Nobody after us needs these parts of the argv[0] string.
>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---
>  tools/testing/selftests/mm/khugepaged.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/mm/khugepaged.c
> b/tools/testing/selftests/mm/khugepaged.c
> index d3a53673e1f9..7520fc0483ac 100644
> --- a/tools/testing/selftests/mm/khugepaged.c
> +++ b/tools/testing/selftests/mm/khugepaged.c
> @@ -1226,7 +1226,7 @@ static void parse_test_type(int argc, char **argv)
>                 return;
>         }
>  -      buf =3D strdup(argv[0]);
> +       buf =3D argv[0];
>         token =3D strsep(&buf, ":");
>         if (!strcmp(token, "all")) {
> --
> 2.43.0
>
>
> --
> Cheers,
>
> David
>
