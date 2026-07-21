Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE9B4657DD
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 10:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784630234; cv=pass; b=m0tjR1RzxFFkg0CSftPWdPmEL/K6CKNpXfaR6mxQ6pJSTFG0VAFzRJFJTZ43VEOPQBKpEXXeaT3Dbj5zqIPbzUMmCZty2+Kh9yA35xt2D3ZRIX50T2FmQrsn0qZ7hfc3GUlcZqewSkU2RDzpZVQL8qJ5OcM8xV+8GTUY2mUUaog=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784630234; c=relaxed/simple;
	bh=oyXeb7Pl/hzEZu/+TWbwy7LD9xPS1dj+pHjiaZVYzs4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HJ1GFzqQckH5yqQWCuKSPTm9cBE1LGKFwvYS/ThUDjR/zNu/8BCMb52H8VqFO9EbBEQqLkkf0708DOkwCiVj7gNrFVxhSTUzHCEJ8GNsYHJad14jI7nNMI8pAsTRrx/JmMYEAtsUukKhWe0MptpP0RKCLouQyu4O1xp3DSk8i4E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mtqd17EI; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mtqd17EI"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c15cd3fd760so1249606366b.2
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 03:37:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784630226; cv=none;
        d=google.com; s=arc-20260327;
        b=XkuDFnicZ6qYu9YWoS/vXW+3sSntlsmR/yXT2Id42wWWxBGdFBnPuYoByFcwGnMc9s
         XtoHgF5V3EAdmF6Y7M2G7c33dL7gQ4U31jb47CAKM/5LTfXKTR6QQP2JuFdPRBg67qRW
         ox63ALX6EIWccP7MF9VkMfhqI91X3frktkOvLmFxnhAIJL4ZRkCBwZvFEOq8qatXfCtj
         fIAsPtSaUBDOU9+km24iMz/pU/rDRtoBFR8QVBATfug/MvXdodMgRMjZFydnF/h+PUaJ
         4rWEDpuZIIuS9rPizjTzB1H2U6fF6GrsW4kD07ZiIJbZJb8aMz+OYg9G7X2Pd2/KJPqC
         2Ckw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z/e3cVrC8aYr3ehhgb7J6RmkXpl7ImRf/nGNK62se0M=;
        fh=Ya8yHtnjbCN4yMFYv3kV6pT13Drabwo/RyZn7VWpZow=;
        b=GiinBhZ4GUM/wcgvhgo2QPRcInCcR1hrCXuRkfcFrHWyw+D/rntBtdiB5LPYYH2hvE
         H60ZlRbt43slRhHF3bp2/lh/X5N+k5JxlV7Vm/3v7TNcunF738mskJjHbysB7+X6hBvy
         F/zrUMejUXxrMYTMOXGszIpVpGyZOyCJLWaoxejkbWYplSSrHD+oYWQmV2Nx9hGxsa7F
         QwBxVmsdw0Ylq4l96IjVIIZ0s0GKk3XhdYMsvl3bj66urXR8O4LzexIzOkOmaJ8T799Y
         Y/MYW2RFnqoK8mF++Rq+n6zJQwQ1m8+7pAPEMwiZ2BRJc6y/o1TSN5iD5WE/GK3JfUWl
         c8/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784630226; x=1785235026; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z/e3cVrC8aYr3ehhgb7J6RmkXpl7ImRf/nGNK62se0M=;
        b=Mtqd17EIcM+q2sJNJ+r6dB87dYl34b+C+bdlhG8n7UuueiuHErbRH8Tb0NssYxKLLL
         DlI5wJg1b3eWDs0MlFaKzAaIJFtyltxQo0cntsGi3hy7LM+XWVcdpuMXoUZe9kuC0vKq
         wn9ntsoiCNecAEK+5D8XMlT9+He8ANosb5mih3GLBKRlb1KLq/HJjmCHbPyvXTkBrwul
         tF9DGUluG71Jy+DnPhxebF5iD5pjSGKAVGcJtAdvcj96h+vcVE1Cu6DQbTvfiNXx7oFk
         0BpS2isrivU5BhOmFhXkICsQJZm1LOl6VmRinYK/HTCJ4CkJGDoDAS8m4utAloicqUwH
         YTig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784630226; x=1785235026;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z/e3cVrC8aYr3ehhgb7J6RmkXpl7ImRf/nGNK62se0M=;
        b=A6clWE3BEDDQP6fNWWxMfsiZ9k9QLHtQ8yo78m4I6ouCctLd4ZZytpMSgUeH5p0uvX
         QN8zVFB1Ucn3VYjQQSX3Rs013hLjO2oTceHy3Yy6CtWehFGMJZWinj8g5ZnLmzH2fPaG
         Q7qLrRCqJB6z+Y/jby7dB0uWcI7OcA8NccFoPjxyxaa5tJ3uzosUZ7ljxhqmCbllLCF/
         EyeMyEQSbnDc9ZDAMHp6SjcJY+ItZlz2sWdYHWBMHJtvz99jvCkRens8zKp6bBtZagMc
         TJRwONu7MPDEt9qzMTunLBA+62Z8xRAKg0rlRXFcpFIdG4/LGLXUZx1cHQYkqAs7VJJe
         DLaA==
X-Forwarded-Encrypted: i=1; AHgh+RoG7JiHDUG4d40q3HKocHyI22LcOAPrmP9/Wqgwp3wvq9j/Idmtsr15yqJn6gHS9WvJd5XqHZ2yTRDgrkkCWXQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeT3UP/Q0EpNFlXvSfmlPlaHgIM7mIsg42stvdiNln2gOd9dmr
	vO+RDlTiOlGmX40COctT3dX7IHhfsXZmPfKJvWFCdxNGi4/6yyLtdNA3OOqalPcyaqVwXsZ0+gd
	piNA5ieefKByCwkPNsEjvk+xtJEcndpw=
X-Gm-Gg: AfdE7clzBYH31nUURLZj6i2wDmvw6i8+4YZvm8aLjqIHKZJC7O2W4bUhH0XHI7Cfoqd
	V5kTL5e6PhvsxmcL4PUJgXZcRmszn/Xuctkf5AOGILUbbTMHX/+9xit6Xr4RoN17noE5hGW+/eG
	vdr8kfnvbQzunKsMhzh+I+JclRHNZr1+y+tyAYdm3OJ7oglcIgze60tQQQPJbJIgOG+osoivPtB
	MyfJIgXTLcao3jGaQYdbpNEDTp7mZ6/H7UKrH8fQsi3PpMdB0UUz1YmVVk/c7k=
X-Received: by 2002:a17:907:e8e:b0:c12:6632:e7f0 with SMTP id
 a640c23a62f3a-c16b46e7a56mr798763666b.24.1784630225874; Tue, 21 Jul 2026
 03:37:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708131122.2917-1-luis@igalia.com> <20260708131122.2917-4-luis@igalia.com>
In-Reply-To: <20260708131122.2917-4-luis@igalia.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 21 Jul 2026 12:36:54 +0200
X-Gm-Features: AUfX_mycIVQeVufkTTWG7ndAZWjUPZ8q3Hx_6jdYuD_j9Bu2y9II3KGMFsILqJM
Message-ID: <CAOQ4uxg6Z3rKYXvjKZ8=rCTM9vXQXiw5M8b3G2zXZ1r7hB7qNA@mail.gmail.com>
Subject: Re: [RFC PATCH v1 3/5] selftests/filesystems: check that fusectlfs is mounted
To: Luis Henriques <luis@igalia.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Matt Harvey <mharvey@jumptrading.com>, kernel-dev@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 8, 2026 at 3:11=E2=80=AFPM Luis Henriques <luis@igalia.com> wro=
te:
>
> The control filesystem for FUSE needs to be mounted for the fusectl_test =
to
> be successfully run.  Skip the test is that is not the case.
>
> Signed-off-by: Luis Henriques <luis@igalia.com>
Reviewed-by: Amir Goldstein <amir73il@gmail.com>

> ---
>  tools/testing/selftests/filesystems/fuse/fusectl_test.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/tools/testing/selftests/filesystems/fuse/fusectl_test.c b/to=
ols/testing/selftests/filesystems/fuse/fusectl_test.c
> index 0d1d012c35ed..2dcfd3ebe0d5 100644
> --- a/tools/testing/selftests/filesystems/fuse/fusectl_test.c
> +++ b/tools/testing/selftests/filesystems/fuse/fusectl_test.c
> @@ -48,6 +48,7 @@ FIXTURE_SETUP(fusectl)
>         uid_t uid =3D getuid();
>         gid_t gid =3D getgid();
>         char buf[32];
> +       char path_buf[PATH_MAX];
>
>         /* Setup userns */
>         ASSERT_EQ(unshare(CLONE_NEWNS|CLONE_NEWUSER), 0);
> @@ -93,6 +94,12 @@ FIXTURE_SETUP(fusectl)
>                      strerror(errno));
>
>         self->connection =3D statbuf.st_dev;
> +
> +       sprintf(path_buf, "/sys/fs/fuse/connections/%d", self->connection=
);
> +       if (access(path_buf, F_OK) !=3D 0)
> +               SKIP(return,
> +                    "fusectl doesn't seem to be mounted: %s\n",
> +                    strerror(errno));
>  }
>
>  FIXTURE_TEARDOWN(fusectl)
>
