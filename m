Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7813B369215
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 16:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773244977; cv=pass; b=e4zQzgrLe65WIaXHbU65vat9zm7/AoZdEiZSxn0aW1eAnz3el1fZSyMF5WOPnBAjatLysORWMrCHeJJP8WHyRh/tCDl6/6D9u+NUN3Sv38f/TZZ8D7x9hc1S1QMXcaCMmck+gqgb5/tPj481n5729FyHJ7UaQmvRbfwzt/echqU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773244977; c=relaxed/simple;
	bh=TTGYknl5DMVw66RIprGNex8QxI0DcgJDnPePFyUvgSo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bz8MMEdUTCHrEZasja3IdGem+CTJBcSKNogPw4u0zE5EYQz2d5fuwvhdLTYuq52NqLmbMyGBLy/3V4QgDRDFSxB0YaFHY7WhwC1HZnge4vmO2fUbhLTmIVdnXtTAIPp6UsU8nbEO334puwTSC60vrgeJgraiOwZl3VzbNtRFzEY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LJk+dXwK; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LJk+dXwK"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b79f8f7ea43so2274415166b.2
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 09:02:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773244975; cv=none;
        d=google.com; s=arc-20240605;
        b=gud/DyyqkQLMaq1FtRB+9pn71RDhTR062Y5iR9SM+1eSUvmEnVUypjBF2yg8nV445M
         FmnwRttFQHKWWAqZZJ2IR9FHFvnmNmL+oyGpJVfOl29fscH25vERnKYartqvXfW9z6uF
         AOdu/xp8HS1lJ5mWEWAZKxH4PX9Mi1LpJYog+KrXgyPYGMnugFCpBSvkeroNf+/kzCs8
         CelRyVkpWzeWJjvFbugL5sOGfMxGSXWgq+34IxZ0LokClaSvkMR3JxygdZJe+seg+viD
         wTCxqhhxZdAq76ieIBqeMkeAi19Kbl5x7tG4i+yopHltknVDabXXxkbWVOVrJAl9nezT
         is7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UAvqaxfPguwjQoaqkzApmgLeUnEZxmw7DGBlz6NQr7k=;
        fh=Sjr4DApNUvopzCAkTW5Xre26hOMgLKc4MXDszLywxj0=;
        b=Qdb3Gr2EKU4GE31IlHHBhq88oblSUb6kA/EdfE3SAvLqJvWSlQ9T1ZTudEJ9COTZBf
         WNBpFFVDDWIuvEr5raIl5FnF6UX5LZyjpygL1JjN0jHr5EfemE8L2uxciNRIajMnI9ia
         86lOs9dcQj70INh3kub4rWIHbUYb6F9V/pOMgilwAhIxYXH83F7nvgZtNORwcK1nNlJV
         jzqwN0ZyzufsppPbhc8Guy9moWIj9H2DBLTPYA8sSh77hKGNYhkivVpZGEz0VW/fzEW1
         7UkVDiajL/BO7y1MpPT2yc02tuZn2e6gL+zGzLf7V2O5JdTZXp8YQH88BMbmWA2JcF1r
         Bgmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773244975; x=1773849775; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UAvqaxfPguwjQoaqkzApmgLeUnEZxmw7DGBlz6NQr7k=;
        b=LJk+dXwKiSRqYB3vp3XTUpL3w4DjOP8FKD7KSueVKx32s0QGkdrjvOzKzdifW8MzQj
         fm4XkR4VWvL+OoMavnMC57XhN4BslwTwtkFaX52Sl585gC9ar/vjLeFWtOA13DYF41+5
         1Ns+z7hRCbOGC2ppcA9SmcArrddyG5BQ8nIAzYgppJUeeGNELm0txLOTp3zAslyu4iLV
         YIwpvZBe5/0DIe4lMbIKzs2YFhI/1RBBbKRtzX/1rcIM24izQRs5KbnsClaTfqrgUPwk
         buKTkI//n859RgJeaW2oUV5Z07kWMCMVYGOgzBLThPwrPhQM/Ut1EVvZL0dv6DiiM5UX
         t/Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773244975; x=1773849775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UAvqaxfPguwjQoaqkzApmgLeUnEZxmw7DGBlz6NQr7k=;
        b=FkZ15jrSabI/ppLL4Cv5yDR08MjEiuDhLYvzBdCVDEUQfbokPotVyXjzE5Scv7goqI
         fY17S0rArAplsJcMcYkCptKIx1TOWLEsU43ZWPQ4LBahRj9K5uerV8ARuW83pS1/bG6n
         coe/V+01+ugsZraNFMNWGTZKzkbgLjECt9BU3fVqUc8vld5wNAzChBs0BBNlUekg5GPw
         OMLswfToushmOIffJeAog2VMPWT6CTfrNagm/8X2BotTSLHqSalM8v43lF2rU3z+hspF
         8paVTKWGw1jf7Mt1nwAia5MokWDreJM2Px6PoNMgNm3Dnge1oJg8IWVnyMI8DgSFETv3
         cxIg==
X-Forwarded-Encrypted: i=1; AJvYcCVk3+rn7+r2ZBKvnRAvcCBjHQl0+5gWbvsEc2Q7b0sLjBUk6y1R3oTagMTJIM50/agYzDvuq2YoKDS+61BJRZM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKYN7ibNfKE0Q+To14qwysqwswMQkCaogwWaaIACcmp38pPF+X
	YyDoARL6ObvBzqiGmCK7SyGlN7LI0Yuo8A0aqHtGSdAGpUx37wpj/1HfWZpsgHBbMd+Jy0BdovC
	Z1aFzYuLj95euLboqfny4osmACcimqEY=
X-Gm-Gg: ATEYQzzCJ42UB4QvFa9gcvPFt9u38ob8dKGyKD1+F1wH6QQ7DQ0gyWafVvceh+RKbvR
	f8Eb8Y8HQK8+YA2ugvjmtzP7ZrcQtNEyUrM5xu6pCBBJQX2tS0jxmcj5iuKYwzIyBX3e/VcslW9
	/r3EkEAJ1ampZksvw89rmMlt3jNbzLfKfHM6hbBlamUPQvUX+bCk1Yd/L5N70ft3hL1nsTzcA5w
	fspCi+dcPzcHAvkWTqS3c65uwTsTLUp6vf6dTF3YEXjZZSLw3lvpFmz4oXqSfqX7/c/a8uxwF/3
	LkQJpIcqy49p+mlMDF8UoedSdo68GIotJu13ElBg+UlC/1ESqsA2QGZyVVG4b8OjVcb3lRrleIy
	xGgfXgLELBsn9qtESxn4ZUB5Spg==
X-Received: by 2002:a17:906:fd87:b0:b96:eb58:92bd with SMTP id
 a640c23a62f3a-b972e5aea9dmr196747766b.49.1773244974508; Wed, 11 Mar 2026
 09:02:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303131453.328674-1-hbathini@linux.ibm.com>
 <CAADnVQKuARvSirPjnTcSifLPunCiKC4Nenq0Mr61GpzbW5WxWg@mail.gmail.com> <bbf6a46c-37e9-4d8d-968e-a99bb12dcc14@linux.ibm.com>
In-Reply-To: <bbf6a46c-37e9-4d8d-968e-a99bb12dcc14@linux.ibm.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 11 Mar 2026 09:02:41 -0700
X-Gm-Features: AaiRm50_VeFbt_qfNvj0SBCBDMtHqyGYVr_6h5_paNycvlXuoc5cm8NuE_iIB6Y
Message-ID: <CAADnVQ+4N4WWLxan_qibZ7HmONJyMZaP=RF+a9tMSPoz=0LqkQ@mail.gmail.com>
Subject: Re: [PATCH] selftests/bpf: improve test coverage for kfunc call
To: Hari Bathini <hbathini@linux.ibm.com>
Cc: Eduard <eddyz87@gmail.com>, Vineet Gupta <vineet.gupta@linux.dev>, 
	"Jose E. Marchesi" <jemarch@gnu.org>, bpf <bpf@vger.kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 8:10=E2=80=AFAM Hari Bathini <hbathini@linux.ibm.co=
m> wrote:
>
> >
> >> +
> >> +       /* Check zero-extension */
> >> +       if (val !=3D (unsigned long)a)
> >> +               return 1;
> >> +       /* Check no sign-extension */
> >> +       if (val < 0)
> >> +               return 2;
> >> +
> >> +       val =3D b;
> >> +       if (val !=3D (unsigned long)b)
> >> +               return 3;
> >> +       if (val < 0)
> >> +               return 4;
> >> +
> >> +       val =3D c;
> >> +       if (val !=3D (unsigned long)c)
> >> +               return 5;
> >> +       if (val < 0)
> >> +               return 6;
> >> +
> >> +       return 0;
> >> +}
> >
> > Overall this looks very useful.
> > I would expand with another test where a,b,c are s8,s16,s32.
>
> Slightly different approach but kfunc_call_test4/bpf_kfunc_call_test4
> cover signed arguments already?

Ahh. Then may be tweak it to adopt similar fine grained
error reporting as your bpf_kfunc_call_test5()
or go other way around an collapse all errors the way test4 is doing it.
