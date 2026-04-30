Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F3425F98A
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 02:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777515831; cv=pass; b=EmU6m7O/5iyXUScidKRyfFgd4MD2y5c3iBNWfkxtRMu93dQdC4Ua1JioQucscOEtisMGtrk7kAKHRo8ZFVNDSaGIJX9WQiV073iAMZxeRBDCpskMabujz0VYDsEf9V2RYncEqeDt6Gurk5yTIIScSiNEqos494ee++7JqwrcKBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777515831; c=relaxed/simple;
	bh=nArF9jaIxcOJ1WZmf24ba1jnkMFwgwYjWZ0kxOu3vxM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nnrEa2lsfhZYhO0b4LIPENEwxWFG0M1QgCmKXDueEX7M1zOtn8AJWKyf6By84+t/AQZF7TEw0A30R65omYc7JxJZJjC96PE1QQ8wLSoL3ogGdOPr1H6NX1WHauDujq2jM5t/HS3ZbGUkkf+KQPUPOrYcq2Paxza4Bz83ubf4ZiQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f5d7s9RU; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f5d7s9RU"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-79a7109f568so4746677b3.1
        for <linux-kselftest@vger.kernel.org>; Wed, 29 Apr 2026 19:23:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777515829; cv=none;
        d=google.com; s=arc-20240605;
        b=VflaPw6Von5tRQjZDJbE56J576BHdqpe0dELHOUsfdqyKS7dWqxjr3REWg8MPCgN5y
         aMdUtlxtFRXNyWvMDXhJdB6OgIrazE4wy+LAxfXbbyem3oeI8qWsjt8zdxsuPJMuQDYs
         ercVmlulGd587wi07wXSWD/8PyZijQ0kiBVB6Q/o0Mv0TbSce5OJJL4s/ZFt8AG3juyM
         e9vlIzY1FZghatvgH/Z2QmGywmfxxAcwrx4ahJIXO9IKxRyD2ut9b2I8yP00rfaslSPz
         E2Orb1B+ZP8cJ9oycgldlqJd+xjJhyqtgscOm7rvO8KlLV9Qv5lb4oZ6oWTSKp53bDVP
         vrmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zb/T3WdfnkSWLrMZ8jlRYsuAiMed/BDWgXCXaUjI2lk=;
        fh=nW6vY4la9fcX1S9eyprGJhCa1MAQue4Bo+yg/KVu20s=;
        b=TeeXhO13W7gIK1ZTY1coqd2Hx6BD7B5A4pEevxT3PxpzVYcGybR4oaF50J8aJ0/YqJ
         jOQxMkuXl4cQeDXwpIig0wPtB75sT16ggn71/ixvoMbsfSNXIz6izbvjOnFfiyWd/vSb
         NMghQZECv2kxynFtI7NW5Rh8hygZiV7oVUyNNIL+9/yjGRIvIukOLI8krDsbwQuWYpni
         o1TUH36JTbAVa3ybHQEIhQgqQSolZMFPwpEhWD3tfF0UK3o+CYpZXicKiXmN6HjndMvx
         cyJOpUA7009vtiWQHRfBOgAOLbx30WkNKSyVHrWXbkw6UVfU/nlvq2o7Z7onOrDqUg99
         5Tnw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777515829; x=1778120629; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zb/T3WdfnkSWLrMZ8jlRYsuAiMed/BDWgXCXaUjI2lk=;
        b=f5d7s9RU8V4fy5tQ0Zh/vEjJwKo8z0csOJLY6GJmffbJAAm57YoIsV6OWO/ex3bf68
         tBRKq22j6G654Tuu72z8MwIzo4ezd8ZA8xAlXg624IkNyeLCp2uw9xUKWBOxO5kqoyu5
         69Gg5fswKadJjdzbxNni5XZlhrQqAu9pZnMoZkfU7bC19XD3YqgxjYgngq4xtHTfodT6
         FBtvVvI4Ip7S/xhxyiSPRgzF5KOCNm14AMoUYRW9u7MTxHFvlIyd6q0Q5YEwqkT8WWdL
         oVRxOPagpUWDdQpnvAlf8hla02J3oxhpew/6p/yheeXVtIBED7Ph9EDie5bMbZgH0ENV
         KX7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777515829; x=1778120629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zb/T3WdfnkSWLrMZ8jlRYsuAiMed/BDWgXCXaUjI2lk=;
        b=kD8aOZo59vuTlzOhI9Fq9Wjejhj1fBeaVrJZRzU4UIFquoAmx51Sv9ZqT+wwdQWjaq
         pRGDxgL122K4Yx6Rt+TeV+MAaxpS2ZvlgrBG04SSLnqGLyp7d/AQfRLDJzE7D4ZW+Mem
         JbeXaw+yxNezZyAgzYRzbqxqoykAWbt/t8IiIEuZBiOyz6JzxC7SxS+o874n+kyQQSUz
         nMitQgc5HBS46Jzbakq+obaexvFWChLlAwBjD+QZdJkTdt7cNBs1zAq9NmL2uLRmWvmo
         UIMPXVHbDGbFESGxl7MUBh8+dpKFSYd5fYDvcAbj0Uzn9oFlLovYa9n9wDYKqZXh8D0/
         SRZw==
X-Forwarded-Encrypted: i=1; AFNElJ/p86IQyFVIQj6PhDWzcnN0Y4j1cApJRUAppuXK2+ChRcbs4Fu6Ut+oXSXeEcSp25JxUL7X1GeyQZtmlZWlepo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkRA2NUE9JWBnoq3EqSNSQ8lHvYYumVuAzXJ5bBChtqyZifuFf
	d6CoAwhgY87NHP8SvVyvCWrSj8DFpmjNH0P1bBLfMNie4GMAZNdqttadGAFqMSi2qb0jSJpMc2i
	UuYco3Q0M1tApfTJq8MfzejwVYzTjHdDkJWu/kas=
X-Gm-Gg: AeBDietYcBn/ecNT+PBwSI4/NsVLlvrYZGGpa4G4Stjb0o0+i9NSnY4/R+O/8Jz7etX
	HMCKyE4z8OXKsqK5InNux4tC0rqSWNW6SXBudeTv+a4hqTA7BcU1CXt8wiqAyWR/anZbuPMLejO
	hbszLaOSWZRWRb84M5TgPwq2jWwetzwrx7mMChABRy/gqCubbKv0Yg7ObFa5Tq0aRvcPLV8o5Yj
	I9sI+cXyRvDnn6XXUsK78X6x3vPUTXPyo5L9ZOiDDIEYFuP/Us3pyWdfjiknMVpU4MWenJKT/ey
	41noold2H66qSEIX0bOfDL1l4cvoaM2pEmAE5dMm+1LWkSgkvfc+7fJ38s8hh0uEoKxnGsQouTP
	jxkkX
X-Received: by 2002:a05:690c:e3cf:b0:7b6:f4f:f06a with SMTP id
 00721157ae682-7bd52833bbdmr12725497b3.6.1777515828865; Wed, 29 Apr 2026
 19:23:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309093752.808533-1-sun.jian.kdev@gmail.com>
 <20260309101044.809074-1-sun.jian.kdev@gmail.com> <3734f485-79d3-4c62-8a1e-bad74c6a54f2@t-8ch.de>
In-Reply-To: <3734f485-79d3-4c62-8a1e-bad74c6a54f2@t-8ch.de>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Thu, 30 Apr 2026 10:23:37 +0800
X-Gm-Features: AVHnY4JBrAseUK7b7Th4skUNakAKpIjitT4QbDJQtPqIGZVsLcR3dh22d7un3pk
Message-ID: <CABFUUZFqVrpR0-=RpW9ac8rTD3BvL7=OXQj9ysUfMHTZ6+-EMw@mail.gmail.com>
Subject: Re: [PATCH v2] selftests/harness: harness-selftest: cover XFAIL_ADD
 ctor ordering
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: shuah@kernel.org, linux-kselftest@vger.kernel.org, kees@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 30, 2026 at 12:21=E2=80=AFAM Thomas Wei=C3=9Fschuh <linux@weiss=
schuh.net> wrote:
>
> Hi!
>
> On 2026-03-09 18:10:44+0800, Sun Jian wrote:
> > Add a fixture-based test with a single variant and mark it with
> > XFAIL_ADD(). The test intentionally fails and is expected to be
> > accounted as XFAIL, covering the constructor ordering dependency
> > between TEST_F() registration and XFAIL_ADD() registration.
> >
> > Suggested-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> > Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
> > ---
> > v2:
> > - update Suggested-by address
> > - update harness-selftest.expected
> > - verify with 'make run_tests'
> >
> >  .../kselftest_harness/harness-selftest.c      | 23 ++++++++++
> >  .../harness-selftest.expected                 | 43 +++++++++++--------
> >  2 files changed, 47 insertions(+), 19 deletions(-)
>
> Can you rebase this on kselftest/fixes?
> https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git=
/log/?h=3Dfixes
>
> This doesn't apply anymore and I suspect the proposed ordering suffers
> from the issue fixed by commit 465b05bae5ac ("selftests: harness:
> Restore order of test functions")
>
>
> Thomas

Hi Thomas,

Thanks, I will send a v3 shortly.

Sun Jian
