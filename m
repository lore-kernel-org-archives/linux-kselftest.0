Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E8819046E
	for <linux-kselftest@vger.kernel.org>; Tue, 18 Aug 2026 13:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787058613; cv=pass; b=BRiIu35UcZ9EL3nvGncdd53DY5FKBUZOa0JQUiUogysm5suOf0L5iQC3GcXqpqVy9KwlymVkgdUJg4OYcnvlPpcodUL416+KvRioVtg0tOYcP70TFQsQlvxFH4X0+Z8d6pio0H41o/6LfrG46akyn/eO36cvl1kh3kHgT9QlkgI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787058613; c=relaxed/simple;
	bh=73gAlgpoJyy1D7VzXCf22FlOlZS5/jAqPmtYq5Tn1kk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nOjKKz4fdFtWd0d6jmaOozGBtkWFTUEgGzt4gk4Ggvjp8BKfwOoBiUDhcPSbOniGwdqsjf/+3TSfDgTuqkxGirKtYVxr/np+HOQHcY3gikIIg1H+3FxmTKZY4lJOjrkyhWgd0SOjCPmqX2S3nhL9sc6hdpUMC+Tr6NSzz5iKZAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M54qxXIT; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M54qxXIT"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6a082b3671fso6360935a12.3
        for <linux-kselftest@vger.kernel.org>; Tue, 18 Aug 2026 06:10:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787058610; cv=none;
        d=google.com; s=arc-20260327;
        b=d7fabqsThGFWYj9kpMsofGgZ4f07HxIVC6cau1EDGJbaT2+z2E+SmfsYRGI/o88NPn
         2D02VKkkzFERbu0b6ItMOreHx8UUPcZiuqiZywDjw/a9q97eyiEXfkGk0VhI9uS2FIbI
         C5PhmurOcL7WSyuHYNmHpr+RqnFyBA2KNJCNnH54KYd78fzGxWpmojZ3thOmZBJJPwP3
         fPJpf+zOSeJfcVPKlD5Xfdpd70kxEIV5GAzhFJ8/n70eK7VAw6i+SGzEZjHkBDeTpCeV
         gldiGjBX3Rd3c5/K3gf62gUOIcslVbJcncmue6yF8b2t3FtIoGlD0E/BtXE0CnmiE3Pc
         BH+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dGG09TZgpGEihO9jRJv0GpS2z8N8d+8AwbLPkXQ4xj8=;
        fh=pr1ipIJ4itvfTmQL0ZzzPyjzbriQh8NgtJy9E4JDy2c=;
        b=pxFSLZbxRb3r9F0aXsc+v20K+Ul6zPFpDzRCRVVJKbEaloDIJd3cxFYJ+nx4H0nDpc
         SAuanO0ScMAXCE99xgOfgKNGuFrH04sMjZ17uRR+B0rN6dzhh65baCef3/mlEEYXdz7Y
         ScelFwRAs8kCB5x+6MLwCsvxKj2g9bhPSR/ermv5VEqn6r8d9DrFrpJ/s+NWGXCg0xhO
         jWcF4Q1W7vbbH4WI5DkZIkF4UgbXEyWUjEeFDk/cNjurOIa1NYUmlTh90MphUecPQmds
         rqc/WRbfDegmBRpvZ3pLJypcsm7rmUO3fQOmv7r2ouMP7Oox151rZv8KnpNrB3iJc5+Z
         FmEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787058610; x=1787663410; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dGG09TZgpGEihO9jRJv0GpS2z8N8d+8AwbLPkXQ4xj8=;
        b=M54qxXITUKdVDz6LRcUR8aDE/HmTYXdDDVGpKzPj28Jo/qwjuPW0wr+LeRnL/iBVm/
         joXftQFghyvBmq5xfuIFkpHGYtMxFGU+Ug91grn06l0cgSye2KuKJTUmvibh4/pPhSX7
         ZvMlfJvm9gVZHam+2kFkjWyznuqoCclsKH49UFY3Il7pHnFWOFcV0xuT/lsZQUx+Lt6U
         9iBtnsFejbZIyE8GyOjqzlTkuzZzb9z06zXoTlxalck3J5sMKz/dSq+dtIbpxph9dj9j
         SyTmoiC+dwxPzju5nJ/3uS2eXS0YzG+qKd39fHxKj8qvo2RPbVfYcZUs+8x+9oojwz2Z
         f/5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787058610; x=1787663410;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dGG09TZgpGEihO9jRJv0GpS2z8N8d+8AwbLPkXQ4xj8=;
        b=LX6wdjfiTLP8rF+fFjP5M/qgMltm28EocdHerxo5MbdFkoC2Xju1ITfa/WwRclJblp
         AVBI6VJxxk7JRKubyisiGdZv0NtfEvBtVsEi3865eY+wF07d0bUFcw4RHA2JE/C07Dl1
         zuJy0sXNaZkYOpvMEnyfE2i9S23EuHMy3+0VelcZ+/UpDyB4HAyBK9vqNTocEWZbM4z8
         721ryuu+z8NTyYhEQZNKpFCMCn85MM9LxaMHEYe2el2MO+JV0bN76cW7Hg74kDtAjOUp
         gc2+K6sOG35RgWV4SFM5ZCdTGRONwLNhc5vVRN3jqF1Qf1q94ihzg2lJS3AXby8PhV4m
         FHsg==
X-Forwarded-Encrypted: i=1; AHgh+Rpah4sAIgD6RIsZL5sPOvtOBGUvsPWli3gWMsvD4MkaDM2jhpYlkzJTNx7vomRuhl15SDKZVJWd3YEEoJ2FKd8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYttBiQO+/Yxb0ugvE0lxCgxzLNNh/7R7Cwe3gCasBCSfJU/WT
	URrRxuZsvVeyUHWsGv2QMWVA6I18XD/Zg1ogBErLG79MgbrKHw84rUoeju/Ble+cbvU6JJHzE0J
	3sdR8tEqG+fOAJGkKVM4R8VdeiZcbqok=
X-Gm-Gg: AR+sD1303Bj0Q7LWd3paDntgdZxT7TKB1Nks9eycJc9dQNZX38XCFGPcpqB8GVN9fsa
	aJkSQGaXmfQT1+5NshaXlI7twAWYziObAz10Zt7hkJzk+uAcbJ0cGdtg0D3Yunf1rYgRag9Xe2g
	zdokoLNVaToJlDweX9md679mXEwchtHqRZUHDQJ822ieiQE1TYoN67SIVpteRfDvly1hxHVJUQB
	JGLKKg5LbqDznolb84RGZOU4ddhOTH/oMlSIVjRwUMpJWQnkH3xpMmZfHnYFDb4/iwlMGLV1ZyG
	Q2wP5Xdx1+5QV9sdHW/wvG83dulNR862/Z5alm5h2/pBA12ulljcAtYB
X-Received: by 2002:a05:6402:2411:b0:6a3:ebe1:c2c2 with SMTP id
 4fb4d7f45d1cf-6a3ebe1c47emr3481370a12.2.1787058609896; Tue, 18 Aug 2026
 06:10:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817141156.6079-1-luis@igalia.com> <20260817141156.6079-6-luis@igalia.com>
In-Reply-To: <20260817141156.6079-6-luis@igalia.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 18 Aug 2026 15:09:58 +0200
X-Gm-Features: AcwNN1XX_qer3UzmnYeF7-g6rjmiD1hdkvaAJ3jQKsiCCk6pIgwlzs0nFMRCWP8
Message-ID: <CAOQ4uxgUECPPchwipkH6qg=q1L_Fqg9=_cPOC6wm9TJ27EQqEw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 5/8] selftests/fuse: factor-out test fixture setup/teardown
To: Luis Henriques <luis@igalia.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Chen Linxuan <me@black-desk.cn>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Matt Harvey <mharvey@jumptrading.com>, kernel-dev@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 17, 2026 at 4:11=E2=80=AFPM Luis Henriques <luis@igalia.com> wr=
ote:
>
> In order to reduce new tests setup/teardown code duplication, factor-out
> these functions from the existing acl_cache test.

When I read this I thought you were going to share these helpers with the
new symlink and readdir cache tests, but you did not.

Maybe a fuse_common.c would make sense to reduce boiler plate
in new fuse tests.

These helpers and fixture look pretty similar in all three tests.

Thanks,
Amir.


>
> Signed-off-by: Luis Henriques <luis@igalia.com>
> ---
>  .../filesystems/fuse/fuse_acl_cache_test.c    | 82 ++++++++++++-------
>  1 file changed, 53 insertions(+), 29 deletions(-)
>
> diff --git a/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test=
.c b/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
> index 2411a6e285f1..8bdc90572be2 100644
> --- a/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
> +++ b/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
> @@ -50,6 +50,8 @@
>
>  #include "kselftest_harness.h"
>
> +#define MAX_ERR_MSG 256
> +
>  /* ---- ACL binary encoding --------------------------------------------=
---- */
>  /*
>   * POSIX ACL v2 xattr format (little-endian):
> @@ -193,52 +195,74 @@ FIXTURE(acl_cache) {
>         pthread_t            thread;
>  };
>
> -FIXTURE_SETUP(acl_cache)
> +int fs_setup(struct fuse_session **se, char *mountpoint, char *file_path=
,
> +            pthread_t *thread, char *err)
>  {
>         char *fuse_argv[] =3D { "fuse_acl_cache_test", NULL };
>         struct fuse_args args =3D FUSE_ARGS_INIT(1, fuse_argv);
>
> -       g_ds.acl            =3D acl_a;
> -       g_ds.acl_size       =3D sizeof(acl_a);
> -       g_ds.getxattr_count =3D 0;
> -
> -       strcpy(self->mountpoint, "/tmp/acl_cache_test_XXXXXX");
> -       if (!mkdtemp(self->mountpoint))
> -               SKIP(return, "mkdtemp: %s", strerror(errno));
> +       strcpy(mountpoint, "/tmp/acl_cache_test_XXXXXX");
> +       if (!mkdtemp(mountpoint)) {
> +               snprintf(err, MAX_ERR_MSG, "mkdtemp: %s", strerror(errno)=
);
> +               return -1;
> +       }
>
> -       snprintf(self->file_path, sizeof(self->file_path),
> -                "%s/" FILE_NAME, self->mountpoint);
> +       snprintf(file_path, PATH_MAX, "%s/" FILE_NAME, mountpoint);
>
> -       self->se =3D fuse_session_new(&args, &fs_ops, sizeof(fs_ops), NUL=
L);
> -       if (!self->se) {
> -               rmdir(self->mountpoint);
> -               SKIP(return, "fuse_session_new failed");
> +       *se =3D fuse_session_new(&args, &fs_ops, sizeof(fs_ops), NULL);
> +       if (!*se) {
> +               rmdir(mountpoint);
> +               snprintf(err, MAX_ERR_MSG, "fuse_session_new failed");
> +               return -1;
>         }
>
> -       if (fuse_session_mount(self->se, self->mountpoint)) {
> -               fuse_session_destroy(self->se);
> -               rmdir(self->mountpoint);
> -               SKIP(return, "fuse_session_mount failed "
> -                            "(missing fusermount3 or insufficient privil=
eges)");
> +       if (fuse_session_mount(*se, mountpoint)) {
> +               fuse_session_destroy(*se);
> +               rmdir(mountpoint);
> +               snprintf(err, MAX_ERR_MSG, "fuse_session_mount failed "
> +                       "(missing fusermount3 or insufficient privileges)=
");
> +               return -1;
>         }
>
> -       if (pthread_create(&self->thread, NULL, run_daemon, self->se)) {
> -               fuse_session_unmount(self->se);
> -               fuse_session_destroy(self->se);
> -               rmdir(self->mountpoint);
> -               SKIP(return, "pthread_create: %s", strerror(errno));
> +       if (pthread_create(thread, NULL, run_daemon, *se)) {
> +               fuse_session_unmount(*se);
> +               fuse_session_destroy(*se);
> +               rmdir(mountpoint);
> +               snprintf(err, MAX_ERR_MSG, "pthread_create: %s", strerror=
(errno));
> +               return -1;
>         }
>
>         fuse_opt_free_args(&args);
> +
> +       return 0;
> +}
> +
> +static void fs_teardown(struct fuse_session *se, pthread_t thread,
> +                       char *mountpoint)
> +{
> +       fuse_session_exit(se);
> +       fuse_session_unmount(se);
> +       pthread_join(thread, NULL);
> +       fuse_session_destroy(se);
> +       rmdir(mountpoint);
> +}
> +
> +FIXTURE_SETUP(acl_cache)
> +{
> +       char err[MAX_ERR_MSG];
> +
> +       g_ds.acl            =3D acl_a;
> +       g_ds.acl_size       =3D sizeof(acl_a);
> +       g_ds.getxattr_count =3D 0;
> +
> +       if (fs_setup(&self->se, self->mountpoint, self->file_path,
> +                    &self->thread, err))
> +               SKIP(return, err);
>  }
>
>  FIXTURE_TEARDOWN(acl_cache)
>  {
> -       fuse_session_exit(self->se);
> -       fuse_session_unmount(self->se);
> -       pthread_join(self->thread, NULL);
> -       fuse_session_destroy(self->se);
> -       rmdir(self->mountpoint);
> +       fs_teardown(self->se, self->thread, self->mountpoint);
>  }
>
>  static int do_force_statx(const char *path)
