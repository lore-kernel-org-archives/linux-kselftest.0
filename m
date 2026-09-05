Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE65365A14
	for <linux-kselftest@vger.kernel.org>; Sat,  5 Sep 2026 13:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788616775; cv=pass; b=gTcQZZjipZi2zI7DgaLyzNLyspDkWNgP/284zAhzo6J011soO4WzJWG7vANDdj6CBNRsnjIG1ZDX1tnqSwrlwmF+b2+9J7BABQxux8MJFE7mdZXt2IdNIKvNt0kn4Au932LuQWcySN8keQTSvezMfjRg//lwbiYfhwp2TG7WsFI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788616775; c=relaxed/simple;
	bh=0NZgvcjxD//y9TcBVnzxsrfCCQmI3Ud37a8Ni4R+RGs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CIkJ3UR5mJgB9dL/jZj0Y0DSfZdMzAx0DCXRZkA444kB0r+HzZy8ioSo3FTZNcf8EREoKoFBmJ8rlb7sA3sSIFLfL9s66ZRlrSih6DCIeRzb+0I/KGM8x1Hbu0jsgecDPNQkUEuB2f8CLT3KTo6mObx7mMJBE0yar4BOXhmKw+Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H+hYeY0e; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H+hYeY0e"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a38098734bso3435494a12.1
        for <linux-kselftest@vger.kernel.org>; Sat, 05 Sep 2026 06:59:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788616772; cv=none;
        d=google.com; s=arc-20260327;
        b=q93O06vepXSdg44cyl2N3iz377nckwdtrzqihgQozb3PR1gM19SpO8M/n6ui69OkKa
         NOuzYLQiURDg3a20agi9ha/Ih097hSzugNBgYy/NRsvftQCP4u0Z++SfCt7pudsemsuL
         G6MFvd0WfEieXHMhSIqhLYdWqv3uAFJkf1jrwCy3azGGejgti/yWsKHVMR2Jyd1nVGP/
         idrqE/qhXCTHCJguQadnGz0n+pBDWMHzUDqQpINyg7OL651fV0c3ONEnoq7D3zAQLNyf
         ohG5iaqy0A0ePQ+QiNh7N4tpyAcKmfIk8aN6d1+QxbuVLNZqjoK2VZeFuXZxDS69CSq4
         4fEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iWHfzIxXlwPck3mW+IxFV0BJz5vdTVjdjrFzdDbobSI=;
        fh=GOZUG6tLauxry750qyMQUnoRN1x6I+9FymOvmGEgSns=;
        b=jSlCljF16KIGhxXVUAig9aYu8/vdj8IDQUKmMfnEJaGoGkUKbAWQPK8QfcgIcuSi1K
         uuMtaWpbT0DNHgivqaAW/rRnJAJPKzfgsTFECg5ytkdu3dwuvjNE/my8gXin+HhNurZx
         6yueWSD2BrM3K8bc/qcAcJjasjawKdtsxx20hQS3eXambs8bXk5WMzUTRS2l1DJGL/id
         PsdLUTVZEHvLRDmInAwYM2pIIgW3tkpspZU4j1RHwZMAGKpgtCs6omWSRePGOnlMCOFC
         Hs4ZeNqx2KqB2o2tRLsXNGIBir28kQSRoRTmgLVR8A+7t8iLn6yoNJTupfznUY0hX5B6
         KHtg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788616772; x=1789221572; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iWHfzIxXlwPck3mW+IxFV0BJz5vdTVjdjrFzdDbobSI=;
        b=H+hYeY0ekhuwq6EzSOpXyPjw0JubJRtzQzwN/zPkUWxz1pC22fokJYR+IdLNkhJEwt
         FzTT973ks9udGWyjCXyQERFn+DMXlEgwLy1pw/rI7PhYnfJNZUOJU5xykhiRsGbl+1tZ
         adj2azTtCGVhP/eiaphHW1PRm7SIvIuu9Fn2wIBpQK339QMu3h6bp86+yYBoELNVcc/N
         F70nc2EL+wcecxCApC1qxRsf61QaGrAkerrTtEIHzkBCVJxuY3l9hHelNEpbY8K4i184
         Z/EJRQLe+wZQ2yNqgedjWTNfh7MYZ9ys5PzSicFnad5QEgMMA3j9y+cQ+97ee5AJqH0c
         nG8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788616772; x=1789221572;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iWHfzIxXlwPck3mW+IxFV0BJz5vdTVjdjrFzdDbobSI=;
        b=GRa19zPJwHNndFmgbIPc4pMdQv58w7EQZ2dtKUDp7xiqFBV/+qIHtZkFJ8VJv2UayV
         8O78C9/0candLd5uEy8T0Rd6wWV4zLnPoLycUEFUj1Sf44+OUfqV2vFrhP5wo+vFHenl
         W/s9eAyrXxijUy09GkJwVBFJrRt4DO14jlZ4ah4pnJPKuTzdVWTArXX/gHtU+WuGGXLb
         jFk1eMcilvTpWSBx9GVN+/+ta7k7hLjugtv1/aMrh2RBMDufqoN2I1FCoPyT6azI1quf
         w8JX5lyBzL/ZAJE4pkKGI2nLYfHw5ZBEDXuRdAz1bOhaZftOVgjLuZvYJCT7DEgMvJ2a
         6dOQ==
X-Forwarded-Encrypted: i=1; AKwUvBx6LkdeK8aNb3yB0X6CJw654ckWlfVmtuA9zZkMqE248+1ROA4Dcuev1xPXRPPnLxVw/001VG4TpUeDe82zgAA=@vger.kernel.org
X-Gm-Message-State: AFuF++m9l1WrL0HwySMZYL3D9YB6ykoCluhj4Z835FzhQwxOzvPSZ7hz
	M9v2qnmV+cDl3FjutSUoJ40ka37r6icNLgYm9LA9JYQeJNjq8tUwHgNGcrwy21/OM5IKfo4fq+3
	WCu2qFE61g5kic6UGQeRMSuGbyRlwNh/0y5CfUrg=
X-Gm-Gg: AYBFou13ewaltkYT4aj8oR1zx1hv3Gds880ABwwgAFISsfpqef6iwjtvmX7+E1TFwbg
	ut6os4CJxSijgXD7h2xv9Tqur/9keCz3Qp1JkjozueaToEFBdlI9ISFznIOYikbeP7XhRVriOaI
	6C87o0DKMBGyG4YAlSqvDxVplpm9JtGHyqwe4fDzERtZlMxqG6ntO3j0eD234NVbEyeSrOmrCSq
	+3+YiO5MIcATAM5EGiyCjXZK0LnEJFmpbB//kwJUq4IV+iAHWt29cvYvXRj7MPgxrPTDkWYch7X
	L4jQFudAHTpgjSxWx20/nabqE+hcQ9Rbcgexrp6VYdxMGA==
X-Received: by 2002:a05:6402:4343:b0:6a7:ea53:f624 with SMTP id
 4fb4d7f45d1cf-6a7ea540b3dmr3578271a12.35.1788616771728; Sat, 05 Sep 2026
 06:59:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904103920.4471-1-luis@igalia.com> <20260904103920.4471-4-luis@igalia.com>
In-Reply-To: <20260904103920.4471-4-luis@igalia.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sat, 5 Sep 2026 15:59:20 +0200
X-Gm-Features: AcwNN1W2vMf-WzY4zwsWBAU_vcsCDCHvVaEThEDUXBh2gwCNW5IHuyRc5r8QctI
Message-ID: <CAOQ4uxjCFCS=V5SLH7QT0q1VmJUKKVkWMSgd9DAtdM9U=a_EWw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 3/8] selftests/fuse: check that fusectlfs is mounted
To: Luis Henriques <luis@igalia.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Chen Linxuan <me@black-desk.cn>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Matt Harvey <mharvey@jumptrading.com>, kernel-dev@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 12:38=E2=80=AFPM Luis Henriques <luis@igalia.com> wr=
ote:
>
> The control filesystem for FUSE needs to be mounted for the fusectl_test =
to
> be successfully run.  Skip the test is that is not the case.
>
> Signed-off-by: Luis Henriques <luis@igalia.com>

Reviewed-by: Amir Goldstein <amir73il@gmail.com>
> ---
>  tools/testing/selftests/filesystems/fuse/fusectl_test.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/filesystems/fuse/fusectl_test.c b/to=
ols/testing/selftests/filesystems/fuse/fusectl_test.c
> index 0d1d012c35ed..b828173c01bd 100644
> --- a/tools/testing/selftests/filesystems/fuse/fusectl_test.c
> +++ b/tools/testing/selftests/filesystems/fuse/fusectl_test.c
> @@ -106,8 +106,15 @@ TEST_F(fusectl, abort)
>         char path_buf[PATH_MAX];
>         int abort_fd, test_fd, ret;
>
> -       sprintf(path_buf, "/sys/fs/fuse/connections/%d/abort", self->conn=
ection);
> +       snprintf(path_buf, PATH_MAX, "%s/%d", FUSECTL_MOUNTPOINT,
> +                self->connection);
> +       if (access(path_buf, F_OK) !=3D 0)
> +               SKIP(return,
> +                    "fusectl doesn't seem to be mounted: %s",
> +                    strerror(errno));
>
> +       snprintf(path_buf, PATH_MAX, "%s/%d/abort", FUSECTL_MOUNTPOINT,
> +                self->connection);
>         ASSERT_EQ(0, access(path_buf, F_OK));
>
>         abort_fd =3D open(path_buf, O_WRONLY);
