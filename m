Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4221F2BE644
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Feb 2026 18:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772044704; cv=pass; b=OaVx5QvuxJdGsWmtc6arXT+sXvSZGe9d5B0NGSk9uYhBx0nvwDRwGbr6adNFKImY7EepU4hMfK7uv/xeLtjHiO2Wuh/1Yque9G6ELBH0KyCWRIazTlwJT3wb0W6tn2uaaKRAKHb/UgMK9d/KJbtNxo3CWqYxcQCZNtpwzjpyRoQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772044704; c=relaxed/simple;
	bh=HmJwqZe7CRo9EQzBICHeCcmLZm5IJYG0enADbASR7tg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=irBuDwjXquubqHsAVSZrPBOPkefCPScgio7qpRakX9VGCf3AhTiuvwV7DFJZ5jqz76z2/a1Kw5+oRvl1UWrbp4sbMiNFIu0AAdYmNA23E0GzCuLquGmbWIi1BMrpdSM5LkdD8uyMlCXanQ+3/niKHeqbWpPp/EsjXMmpKufecKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XJEoqGtA; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XJEoqGtA"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5069a785ed2so36731cf.1
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Feb 2026 10:38:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772044702; cv=none;
        d=google.com; s=arc-20240605;
        b=R+cUkj3b7JxN+X6Dy+jcPxCVVwFnYs+hC00ETtWD/J0WxSSPL4WzfYxXUa0gBX3dMG
         2uUny4iEAl9xgz1KFI5bOlbLx2IMDH/UyKK9CmGyZm+aLrYw1AQXU3j+XSddXkS8iMtE
         JuK+AHetIFeQQwRH6DXtRq17u/4Dg4Fx9GLeyG476W/qrQUolZz8dt8Qa8KbbzKspU3R
         0BF/HtsUTfIxyC8e0Eb4PaSnEorePSVnektz9///jKF73DLQp4//knFkLaRZuUrCD2UG
         0sFtY7npbqsWj5XfwBSGkx61I8GC+SL9gV8/Y2sxMheUOhqpw5B79BWXnV5dA1KsM+yz
         3NTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YRNfssoOYnj7DwadpEhtOqHiGmKc3zJlebRcyDYCah4=;
        fh=jr45P9RrP/+QC/fJaCaHdXO1n/mO/Z498zFwo/6NpSs=;
        b=hHQrnlN1UzBZ0ptMQBmRgYMPT03VjIwRUvmJPtIi4LDwDK8eZHGsm5K7wKrAYLeflg
         hI5skOGF+cZjdnrEVrHW+IXOAPDBZgn7DLYvFN2O+LFjt+v1agvlVMOLYlPx8yLYdOlr
         aJc70/8lV4o499YHBoXrWcTnFNrHu8EQkgp5QuMRrWFXzuG2YGjcc3FXRdLZLNRcbX99
         2xjKjMgKv3r7FApDHyIXAQPom5A0LuEpeNfQzYsrCjSVUCuNi8i95KCGKb2hRx4sfnVh
         9Ryelg1HluPWbG+4f17VUbKDiQRmqGL3fyLA/9+I2v/plNhtUIs7fJicRO0Wwdz2/7HQ
         mlYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772044702; x=1772649502; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YRNfssoOYnj7DwadpEhtOqHiGmKc3zJlebRcyDYCah4=;
        b=XJEoqGtAFAqUdJyQl4Lx9FrQB237MAQHJy9/+EUZmxazOrxiO6iSqxMJkKmZalDs7L
         tN6Mj0tx1RrIjXA6A9FI9UWGYfs/mIA8K3SITAOGZRoq7ldXCL8DKgqfW3zQyRSx9PZf
         A+ljPgvlqCFNuL4wniw1zM8a0kJbsR1sdDODMTB/mAiy0Rs7iojlYYs/UafAvJG5vQ/B
         rwvk5dKwgd5kqeMjjAFTFUgkyBA7Zr4V54Drdz37nE0np2w6eeoR0E9af/fIrRt51DLn
         M5lCY5+cshEgaE8esAssE+cfLAKpyq+YhdX2gfSVUkj8Yl01Djzfok9RJszY/iIm8j/s
         +9+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772044702; x=1772649502;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YRNfssoOYnj7DwadpEhtOqHiGmKc3zJlebRcyDYCah4=;
        b=RjQAJdHT/3SsNAdm+PmiQLO47BrQ77wvSewy8dNIlLuTklLNUAkEFodlO4+idVar4J
         zhSj3xQgOXM3XFfKpxilsGVls9uAqJnsRZFPc/hDWmFkDoaLruvaC7B+nbdDJyH8ftTl
         sfJO4FAj6QRj1GKTZ9Qi1GOwPQT8MzaN00VNyooesTWC+rJaM9Wl9e+jky6p3ExLwhWs
         J/R1IyfmN31IhqTRfBN4erCM+YpW1jj9Nmq6f5oEgoVexrht7KAMaO4kLGaR8QVky5je
         3D0tF8KogtZAVQPqKlGxR2qLyJhuxigcA6ELgcukYC0DM9MwTrkiKVIV/tH0xJG4uFee
         6I2Q==
X-Forwarded-Encrypted: i=1; AJvYcCW5ANyL+XFF86SCyT8kL2I79XcTGYnzMdL3/7KCVlVP4ZxySzaM1yrcUT7CGO4j2644nzTbRW2PZS3l3yDDOz0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUtEl/d6OO+9+1OOgbhVuGFpTBVNsJI078Xpyr1MYg2P+rqQK4
	yHNaIf+33wsjbdove+Xytk4gm8DpzxiM7oJdL1eB5QtMsjl9MEQecx8aUsckeFIdectOuA+3ve3
	cnXZvyT0O8WDtY2In2gotYkjBMOVYZhtThoqCxEO1
X-Gm-Gg: ATEYQzxUtlMy6EH2ndGZ/rrmQkm1cY2jgFAh5QINHSufDPYCYuBiEfPIupX6NPIXpYd
	3s6kzQH9f5EcXjehEDCDCYewqdvlz/UHYS1ATczyLaoNo3ZZ5RS97hFUzGmbwfgRncZ5tCOp5ga
	Yqnyboy8Zqfa1WC33t+VHf87xMorrlBwEcFTucZxvUSIreSB+kMSvVtcX5tYcm+1+z9UwZsW84p
	KRhARvpg6VXXC+0jSJTu3+xgppP/TP/WtZ4rR4Rf3OP/6746DVyfgXCkEXE7FgVPaO7B3ukYhyU
	rt2ZsOSOvdv/ys0Q6So1JdPTm/mpYkusTFIhIQ==
X-Received: by 2002:ac8:58c4:0:b0:506:a1b1:422d with SMTP id
 d75a77b69052e-507441e2f1dmr515211cf.14.1772044701492; Wed, 25 Feb 2026
 10:38:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225133229.550302-1-ptikhomirov@virtuozzo.com> <20260225133229.550302-4-ptikhomirov@virtuozzo.com>
In-Reply-To: <20260225133229.550302-4-ptikhomirov@virtuozzo.com>
From: Andrei Vagin <avagin@google.com>
Date: Wed, 25 Feb 2026 10:38:08 -0800
X-Gm-Features: AaiRm50_GlTYHWyT5YUB3Dnx8A5YYbsSPDQESsyudqXzcKrLwO5o6uAEDPk1lqA
Message-ID: <CAEWA0a7XkoiG6==hp+a8CLRFY+k9o1rn8tum1c4YY97ki6fkjQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] pid_namespace: allow opening pid_for_children
 before init was created
To: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
Cc: Christian Brauner <brauner@kernel.org>, Shuah Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Jan Kara <jack@suse.cz>, Oleg Nesterov <oleg@redhat.com>, Aleksa Sarai <cyphar@cyphar.com>, 
	Kirill Tkhai <tkhai@ya.ru>, Alexander Mikhalitsyn <alexander@mihalicyn.com>, Adrian Reber <areber@redhat.com>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 25, 2026 at 5:33=E2=80=AFAM Pavel Tikhomirov
<ptikhomirov@virtuozzo.com> wrote:
>
> This effectively gives us an ability to create the pid namespace init as
> a child of the process (setns-ed to the pid namespace) different to the
> process which created the pid namespace itself.
>
> Original problem:
>
> There is a cool set_tid feature in clone3() syscall, it allows you to
> create process with desired pids on multiple pid namespace levels. Which
> is useful to restore processes in CRIU for nested pid namespace case.
>
> In nested container case we can potentially see this kind of pid/user
> namespace tree:
>
>                             Process
>                           =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
>     User NS0 =E2=94=80=E2=94=80=E2=96=B6 Pid NS0 =E2=94=80=E2=94=80=E2=96=
=B6 Pid p0 =E2=94=82
>         =E2=94=82           =E2=94=82     =E2=94=82         =E2=94=82
>         =E2=96=BC           =E2=96=BC     =E2=94=82         =E2=94=82
>     User NS1 =E2=94=80=E2=94=80=E2=96=B6 Pid NS1 =E2=94=80=E2=94=80=E2=96=
=B6 Pid p1 =E2=94=82
>         =E2=94=82           =E2=94=82     =E2=94=82         =E2=94=82
>        ...         ...    =E2=94=82   ...   =E2=94=82
>         =E2=94=82           =E2=94=82     =E2=94=82         =E2=94=82
>         =E2=96=BC           =E2=96=BC     =E2=94=82         =E2=94=82
>     User NSn =E2=94=80=E2=94=80=E2=96=B6 Pid NSn =E2=94=80=E2=94=80=E2=96=
=B6 Pid pn =E2=94=82
>                           =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98
>
> So to create the "Process" and set pids {p0, p1, ... pn} for it on all
> pid namespace levels we can use clone3() syscall set_tid feature, BUT
> the syscall does not allow you to set pid on pid namespace levels you
> don't have permission to. So basically you have to be in "User NS0" when
> creating the "Process" to actually be able to set pids on all levels.
>
> It is ok for almost any process, but with pid namespace init this does
> not work, as currently we can only create pid namespace init and the pid
> namespace itself simultaneously, so to make "Pid NSn" owned by "User
> NSn" we have to be in the "User NSn".
>
> We can't possibly be in "User NS0" and "User NSn" at the same time,
> hence the problem.
>
> Alternative solution:
>
> Yes, for the case of pid namespace init we can use old and gold
> /proc/sys/kernel/ns_last_pid interface on the levels lower than n. But
> it is much more complicated and introduces tons of extra code to do. It
> would be nice to make clone3() set_tid interface also aplicable to this
> corner case.
>
> Implementation:
>
> Now when anyone can setns to the pid namespace before the creation of
> init, and thus multiple processes can fork children to the pid
> namespace, it is important that we enforce the first process created is
> always pid namespace init. (Note that this was done by the previous
> preparational patch as a standalon useful change.) We only allow other
> processes after the init sets pid_namespace->child_reaper.
>
> Reviewed-by: Oleg Nesterov <oleg@redhat.com>
> Signed-off-by: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>

Acked-by: Andrei Vagin <avagin@google.com>

Thanks,
Andrei
