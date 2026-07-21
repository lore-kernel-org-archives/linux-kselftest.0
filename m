Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29898480DCD
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 10:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784630605; cv=pass; b=sfDcRH+dYsSb1vD7JPgZKbssIGl3mKLNMlxMOZU/KK+yun31lze3dJwXoP8I0O4TQjIYrEmWYVk0Mga3CqWfKFos7oF+N2hL8L4zFVBMcBijloQby/4+R8/ZNGUUcnuEf3gaOG/5fFzDUn+hHvjM4faxx5TIQ50DWIEoRcK60X0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784630605; c=relaxed/simple;
	bh=A25viQ7EAG6emyGkQ7HiOnM6vg0tcED8YtAzWy0+LTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ktJEOWyKLrbbDPRtFILKtMSsRPmE218QqbFc8VVneAsVZp75ZAtwNUMBu5ZxM0JroRqHq/WCw0LMUxMD1b7f9BFknx9GYrXFye+eYOwN19jj+3SE6flNAFSgvCgX2OirrQskmm1mHWmEaOvTGq9YslAqe6OrOJfk5+20G5TXSkY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V1dS5+Cx; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V1dS5+Cx"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-69c7697d523so6857176a12.2
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 03:43:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784630601; cv=none;
        d=google.com; s=arc-20260327;
        b=LHB1hAouJfQ18uwOqsCAPqVy5JQ0yCDs+iBmFDJD+QvSvAfyO+YAn8pOw+EK0NEg88
         Ts7zG2gyU1dc5uZhH9+XKWQ+lf+U5lZtY+qSvRQHddMydlkDRJLYJQoosJtVusR0FZdN
         FeWMPxQ5TmLUJs3KiELixhTJvHf31gMchIWfmqddaA5ZG+ryo0yquscQqOnks/tG+mAD
         CeTO6LNXJktlaiInvGXRCmqQ5a+4PCM1BFtVdUPkkDHYNpm22mCaRCYL1WE0bIPYA8BI
         4rGSwXtgwemoYSQMM5oG4584p3iwpYmLWPuWs86yR1BqvjodELu/K+TNLh9MvESAK7Pl
         I/FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jFR4MxJKt991gKtgkD97i/FsFQMAvicdyhpcnCFtKs4=;
        fh=mhpAWMPvdlUf+1A7LKzLiC8RSIru+ohC9mFP8jwM4Ws=;
        b=IwKyybFLbySGw20umSOsGCiXWhYn4YUTMiDage3LSZIYDE9CYuu/xD7LiqjzNvZAVa
         EtZnb+vw/QqUhvj1S24vSHHtHvLC4qHfq2n5HcW/unKs9Rff0IfZtzQDGDxk5M9raJol
         m8Nw7x6NyGm3Q3VBwXxjm0vxxdGtu/D3sLJg6HZhb5SmGLFW/JHfMBp7zBliSgJDKUIF
         XOfaOlg8upnp9kDTIerSrUJt72Nzb5+TRk88OX5gKYQ03fIIQyi2VTX5XmL8gu1kuGM9
         ADBIa7Zwg4tkVWEBw3dAtjRahwcXxGC9PexHg1DDFfVXRYuvpyHvo78+FP3pGEKD1Yh5
         ll/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784630601; x=1785235401; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jFR4MxJKt991gKtgkD97i/FsFQMAvicdyhpcnCFtKs4=;
        b=V1dS5+Cxxvv31CPZDpR9Xr7YaxwBECxIcb9HN0cSspNL+HhnahjRakbISmJlR2nCaZ
         WYTMzmNVsxA5P+8b0npTQy70VwweYvTTtnx7n7VaEdmbHWmb51qLoPy5T3SGdujGMlij
         JhPgvoEp7RDTe4fQWgqFd+tUk5LNmVPjB1DeFP471zu0gvXdL93cgrWBmDfdw1Iinzde
         qF0PBhG3rm9M5f4DzX6Zg060drdkKgZTYhwm9rKkQVu3jZ2TxG90GbVVBAlwWnDf/ymV
         jhzU5RO9xr4KoBhNb2ZWZ9j4sQmJzjz2taI2TjDPlWPNzmvYF4VId7ldDADI51NEgW3Q
         9aWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784630601; x=1785235401;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jFR4MxJKt991gKtgkD97i/FsFQMAvicdyhpcnCFtKs4=;
        b=Y7FobiGY4C6CZbspRPtU/HTXe+s9x9SdkzrZBlRlAbDDZKXhmFsJY2r6MQbE09r5az
         sbRJjm92yCJKxbd6DYMx1IZDCzKN2rBBxmO3PtTanVzjBRksKEYRcYcKFnzCfqJ074af
         ZNFVfkOho03IeEG4v0D20KUVB8PnCdzEev7lQFKRSXyptYcbGMIa1kgOohnbiduqVZqR
         +irZS3nQrzDlPf5ZVFhQtpW3hJ9/t0gLFY7Nu5oKE9xaT62f/Af93SUFY6Pr7mK/nsTK
         TFuB0n6czPLB+LMKJh8/tTpdBy+CdTK8/5jb+t1g9cLPvHTndLfUNdLJTlLSN2BkF9pm
         IyAw==
X-Forwarded-Encrypted: i=1; AHgh+Rpd1FrMNHI1/oXyjlTBo8+wWM/X4P0WK85f/mmIoPk/nh7UGPGswKr6+TXkwLaU9F9aFc2Ut1Lc2xCy++ZiT7c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGRBd9GSK2rKYbI++WOt6aqcigwX/hypx5InYK1wUhIQz0iIA1
	2vTEPPe+0qK07Kcuqc/bfN6y8nCGPNsCWuxq1qbvuleqJb1T2HK3Oq/eXxqiAisyLfVkeg93VzV
	Y3ZugVysfKtj1k2/fwZHIEnsMYICpbAo=
X-Gm-Gg: AR+sD10gP6qDFzgvwN1OaaoZ4sDPEKrRT6c47xDHRD7Be3irUftKxAriaa6/9/8wMLV
	f7rWiiVlIf+h62nA2sWXuclAieFVdCmtDqR1S+WWO+aD7zOeBmLgRSyAuqx+3w6BeN7g3arLEcy
	1CW+5gTDIK2+EIZGOAaM493IrgFkv5DHMEFBtrolBmRDcX2BnUyE3xVqofUNa3w96X+yUZFrr29
	sBcjdThmfK+0lc4o/4QHZoGbtzaKvn5rAh53L2+qeatUITqsln+8QrPySYjrsw=
X-Received: by 2002:a05:6402:5186:b0:697:cd86:7626 with SMTP id
 4fb4d7f45d1cf-69e6525c6a4mr6666445a12.8.1784630601191; Tue, 21 Jul 2026
 03:43:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708131122.2917-1-luis@igalia.com> <20260708131122.2917-6-luis@igalia.com>
In-Reply-To: <20260708131122.2917-6-luis@igalia.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 21 Jul 2026 12:43:09 +0200
X-Gm-Features: AUfX_mzJE1zhKJjoqFDdPmAYFJP_IT0AkKnoZ5roRGFl4ifYtgBZ-2w1TlYJLYo
Message-ID: <CAOQ4uxg6WHG1S4--ZN7dsEnYOKY+q8y6qCNYL7=UE+=9G4-+GQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 5/5] selftests/filesystems: add fuse ACLs caching test
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
> This patch adds a simple test that allows to verify that ACLs caching is
> working as expected.  I.e. it verifies that, if FUSE_POSIX_ACL flag is se=
t,
> user-space is only called once when accessing an inode ACL and that
> subsequent accesses are cached in the kernel.
>
> Signed-off-by: Luis Henriques <luis@igalia.com>
> ---
>  .../selftests/filesystems/fuse/.gitignore     |   2 +
>  .../selftests/filesystems/fuse/Makefile       |  13 +-
>  .../selftests/filesystems/fuse/acl_fs.c       | 216 ++++++++++++++++++
>  .../selftests/filesystems/fuse/acl_test.sh    |  66 ++++++
>  .../selftests/filesystems/fuse/setgetacl.c    |  62 +++++
>  5 files changed, 357 insertions(+), 2 deletions(-)
>  create mode 100644 tools/testing/selftests/filesystems/fuse/acl_fs.c
>  create mode 100755 tools/testing/selftests/filesystems/fuse/acl_test.sh
>  create mode 100644 tools/testing/selftests/filesystems/fuse/setgetacl.c
>
> diff --git a/tools/testing/selftests/filesystems/fuse/.gitignore b/tools/=
testing/selftests/filesystems/fuse/.gitignore
> index cfdc5ca3ded4..1733ebb9d7fd 100644
> --- a/tools/testing/selftests/filesystems/fuse/.gitignore
> +++ b/tools/testing/selftests/filesystems/fuse/.gitignore
> @@ -2,3 +2,5 @@
>  fuse_mnt
>  fusectl_test
>  symlink_fs
> +acl_fs
> +setgetacl
> diff --git a/tools/testing/selftests/filesystems/fuse/Makefile b/tools/te=
sting/selftests/filesystems/fuse/Makefile
> index 342da0878006..3bbf9d837e9a 100644
> --- a/tools/testing/selftests/filesystems/fuse/Makefile
> +++ b/tools/testing/selftests/filesystems/fuse/Makefile
> @@ -3,8 +3,8 @@
>  CFLAGS +=3D -Wall -O2 -g $(KHDR_INCLUDES)
>
>  TEST_GEN_PROGS :=3D fusectl_test
> -TEST_PROGS :=3D symlink_test.sh
> -TEST_GEN_FILES :=3D fuse_mnt symlink_fs
> +TEST_PROGS :=3D symlink_test.sh acl_test.sh
> +TEST_GEN_FILES :=3D fuse_mnt symlink_fs acl_fs setgetacl
>
>  include ../../lib.mk
>
> @@ -18,8 +18,17 @@ ifeq ($(VAR_LDLIBS),)
>  VAR_LDLIBS :=3D -lfuse3 -pthread
>  endif
>
> +ACL_CFLAGS :=3D $(shell pkg-config libacl --cflags 2>/dev/null)
> +ACL_LDLIBS :=3D $(shell pkg-config libacl --libs 2>/dev/null)
> +
>  $(OUTPUT)/fuse_mnt: CFLAGS +=3D $(VAR_CFLAGS)
>  $(OUTPUT)/fuse_mnt: LDLIBS +=3D $(VAR_LDLIBS)
>
>  $(OUTPUT)/symlink_fs: CFLAGS +=3D $(VAR_CFLAGS)
>  $(OUTPUT)/symlink_fs: LDLIBS +=3D $(VAR_LDLIBS)
> +
> +$(OUTPUT)/acl_fs: CFLAGS +=3D $(VAR_CFLAGS)
> +$(OUTPUT)/acl_fs: LDLIBS +=3D $(VAR_LDLIBS)
> +
> +$(OUTPUT)/setgetacl: CFLAGS +=3D $(ACL_CFLAGS)
> +$(OUTPUT)/setgetacl: LDLIBS +=3D $(ACL_LDLIBS)
> diff --git a/tools/testing/selftests/filesystems/fuse/acl_fs.c b/tools/te=
sting/selftests/filesystems/fuse/acl_fs.c
> new file mode 100644
> index 000000000000..4b5e0073ab4f
> --- /dev/null
> +++ b/tools/testing/selftests/filesystems/fuse/acl_fs.c
> @@ -0,0 +1,216 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/*
> + * Simple filesystem to test FUSE ACLs cache
> + *
> + * This is a simple FUSE filesystem that contains a single object (a fil=
e named
> + * 'file') and which allows to set the 'system.posix_acl_access' ACL on =
that
> + * object.  Whenever this ACL is read from the FUSE filesystem, a counte=
r is
> + * incremented.  And value for this counter can be obtained from reading=
 from
> + * this file.
> + *
> + * When ACLs are being cached (the '--cache' argument was used to mount =
this
> + * filesystem), this counter will only be incremented the first time the=
 ACL is
> + * read, as the kernel won't be calling into user-space again until that=
 cache
> + * is invalidated.
> + */
> +#define FUSE_USE_VERSION FUSE_MAKE_VERSION(3, 12)
> +
> +#include <fuse_lowlevel.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <time.h>
> +#include <sys/stat.h>
> +#include <sys/param.h>
> +#include <sys/xattr.h>
> +
> +#define FILE   "file"
> +#define TIMEOUT        86400.0f
> +
> +static struct options {
> +       int cache_acls;
> +} options;
> +
> +static const struct fuse_opt option_spec[] =3D {
> +       { "--cache", offsetof(struct options, cache_acls), 1 },
> +       FUSE_OPT_END
> +};
> +
> +static int getxattr_counter =3D 0;
> +
> +static void acl_init(void *userdata, struct fuse_conn_info *conn)
> +{
> +       if (options.cache_acls)
> +               fuse_set_feature_flag(conn, FUSE_CAP_POSIX_ACL);
> +       else
> +               fuse_unset_feature_flag(conn, FUSE_CAP_POSIX_ACL);
> +}
> +
> +static int acl_stat(fuse_ino_t ino, struct stat *stbuf)
> +{
> +       char data[64];
> +
> +       stbuf->st_ino =3D ino;
> +       switch (ino) {
> +       case 1:
> +               stbuf->st_mode =3D S_IFDIR | 0755;
> +               stbuf->st_nlink =3D 2;
> +               break;
> +       case 42:
> +               stbuf->st_mode =3D S_IFREG | 0444;
> +               stbuf->st_nlink =3D 1;
> +               stbuf->st_size =3D sprintf(data, "%d\n", getxattr_counter=
);
> +               break;
> +       default:
> +               return -1;
> +       }
> +
> +       stbuf->st_uid =3D getuid();
> +       stbuf->st_gid =3D getgid();
> +       stbuf->st_atime =3D stbuf->st_mtime =3D stbuf->st_ctime =3D time(=
NULL);
> +
> +       return 0;
> +}
> +
> +static void acl_lookup(fuse_req_t req, fuse_ino_t parent, const char *na=
me)
> +{
> +       struct fuse_entry_param e;
> +
> +       memset(&e, 0, sizeof(e));
> +
> +       if (parent !=3D 1 || strcmp(name, FILE) !=3D 0)
> +               fuse_reply_err(req, ENOENT);
> +       else {
> +               e.ino =3D 42;
> +               e.attr_timeout =3D TIMEOUT;
> +               e.entry_timeout =3D TIMEOUT;
> +               acl_stat(e.ino, &e.attr);
> +               fuse_reply_entry(req, &e);
> +       }
> +}
> +
> +static void acl_getattr(fuse_req_t req, fuse_ino_t ino,
> +                       struct fuse_file_info *fi)
> +{
> +       struct stat attr;
> +
> +       memset(&attr, 0, sizeof(struct stat));
> +       if (acl_stat(ino, &attr) =3D=3D -1)
> +               fuse_reply_err(req, ENOENT);
> +       else
> +               fuse_reply_attr(req, &attr, TIMEOUT);
> +}
> +
> +static void acl_read(fuse_req_t req, fuse_ino_t ino, size_t size,
> +                    off_t off, struct fuse_file_info *fi)
> +{
> +       char data[64];
> +       int len;
> +
> +       len =3D sprintf(data, "%d\n", getxattr_counter);
> +       if (off < len)
> +               fuse_reply_buf(req, data + off, MIN(len - off, size));
> +       else
> +               fuse_reply_buf(req, NULL, 0);
> +}
> +
> +char *xattr_value =3D NULL;
> +size_t xattr_value_sz =3D 0;
> +
> +static void acl_setxattr(fuse_req_t req, fuse_ino_t ino, const char *nam=
e,
> +                        const char *value, size_t size, int flags)
> +{
> +       int ret =3D 0;
> +
> +       if (ino !=3D 42)
> +               ret =3D ENOENT;
> +       else if (!strcmp(name, "system.posix_acl_access")) {
> +               if (xattr_value)
> +                       free(xattr_value);
> +               xattr_value =3D malloc(size);
> +               memcpy(xattr_value, value, size);
> +               xattr_value_sz =3D size;
> +       } else
> +               ret =3D ENOTSUP;
> +
> +       fuse_reply_err(req, ret);
> +}
> +
> +static void acl_getxattr(fuse_req_t req, fuse_ino_t ino, const char *nam=
e,
> +                        size_t size)
> +{
> +       if (ino !=3D 42)
> +               fuse_reply_err(req, ENOENT);
> +       else if (!xattr_value || strcmp(name, "system.posix_acl_access"))
> +               fuse_reply_err(req, ENODATA);
> +       else if (size) {
> +               fuse_reply_buf(req, xattr_value, xattr_value_sz);
> +               getxattr_counter++;
> +       } else
> +               fuse_reply_xattr(req, xattr_value_sz);
> +}
> +
> +static const struct fuse_lowlevel_ops acl_op =3D {
> +       .init           =3D acl_init,
> +       .lookup         =3D acl_lookup,
> +       .getattr        =3D acl_getattr,
> +       .getxattr       =3D acl_getxattr,
> +       .setxattr       =3D acl_setxattr,
> +       .read           =3D acl_read,
> +};
> +
> +int main(int argc, char *argv[])
> +{
> +       struct fuse_session *se;
> +       struct fuse_loop_config *config;
> +       struct fuse_args args =3D FUSE_ARGS_INIT(argc, argv);
> +       struct fuse_cmdline_opts opts;
> +       int ret =3D -1;
> +
> +       options.cache_acls =3D 0;
> +
> +       if (fuse_parse_cmdline(&args, &opts) !=3D 0)
> +               return ret;
> +
> +       if (opts.mountpoint =3D=3D NULL) {
> +               printf("usage: %s [options] <mountpoint>\n", argv[0]);
> +               goto out_args;
> +       }
> +
> +       if (fuse_opt_parse(&args, &options, option_spec, NULL) =3D=3D -1)
> +               goto out_args;
> +
> +       se =3D fuse_session_new(&args, &acl_op, sizeof(acl_op), NULL);
> +       if (!se)
> +               goto out_args;
> +       if (fuse_set_signal_handlers(se))
> +               goto out_session;
> +       if (fuse_session_mount(se, opts.mountpoint))
> +               goto out_signal;
> +
> +       fuse_daemonize(opts.foreground);
> +       if (opts.singlethread) {
> +               ret =3D fuse_session_loop(se);
> +       } else {
> +               config =3D fuse_loop_cfg_create();
> +               fuse_loop_cfg_set_clone_fd(config, opts.clone_fd);
> +               fuse_loop_cfg_set_max_threads(config, opts.max_threads);
> +               ret =3D fuse_session_loop_mt(se, config);
> +               fuse_loop_cfg_destroy(config);
> +               config =3D NULL;
> +       }
> +       fuse_session_unmount(se);
> +
> +out_signal:
> +       fuse_remove_signal_handlers(se);
> +out_session:
> +       fuse_session_destroy(se);
> +out_args:
> +       free(opts.mountpoint);
> +       fuse_opt_free_args(&args);
> +
> +       return ret;
> +}
> diff --git a/tools/testing/selftests/filesystems/fuse/acl_test.sh b/tools=
/testing/selftests/filesystems/fuse/acl_test.sh
> new file mode 100755
> index 000000000000..9070c51c6784
> --- /dev/null
> +++ b/tools/testing/selftests/filesystems/fuse/acl_test.sh
> @@ -0,0 +1,66 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +
> +exit_cleanup()
> +{
> +       fusermount -u ./mnt
> +       rmdir ./mnt
> +}
> +
> +assert_value ()
> +{
> +       if [ $1 -ne $2 ]; then
> +               echo "FAILED"
> +               echo $3
> +               exit 1
> +       fi
> +}
> +
> +set -e
> +
> +trap exit_cleanup EXIT
> +
> +mkdir -p mnt
> +
> +#sudo su -
> +#cd /home/miguel/kernel/linux/tools/testing/selftests/filesystems/fuse
> +#dmesg -c > /dev/null
> +#tmux -S ./bla -f a
> +#./acl_fs -d --cache ./mnt
> +#setfacl -m u:daemon:r mnt/file
> +#getfacl mnt/file
> +
> +./acl_fs ./mnt
> +
> +echo -n "Testing ACLs without cache: "
> +
> +# set ACL
> +./setgetacl ACCESS u::rw-,g::rw-,o::rw-,u:nobody:r--,m::rw- mnt/file
> +
> +# When symlink caching is disabled every access to a symlink is expected=
 to
> +# result in a call to user-space
> +for i in $(seq 1 10); do
> +       ./setgetacl ACCESS mnt/file > /dev/null
> +done
> +
> +res=3D$(cat ./mnt/file)
> +assert_value $res $i "Got $res, expected $i"
> +echo "PASSED"
> +
> +fusermount -u ./mnt
> +
> +./acl_fs --cache ./mnt
> +
> +echo -n "Testing ACLs with cache: "
> +
> +# set ACL
> +./setgetacl ACCESS u::rw-,g::rw-,o::rw-,u:nobody:r--,m::rw- mnt/file
> +
> +# With caching enabled, there will be a single call into user-space
> +for i in $(seq 1 10); do
> +       ./setgetacl ACCESS mnt/file > /dev/null
> +done
> +res=3D$(cat ./mnt/file)
> +assert_value $res 1 "Got $res, expected 1"
> +
> +echo "PASSED"
> diff --git a/tools/testing/selftests/filesystems/fuse/setgetacl.c b/tools=
/testing/selftests/filesystems/fuse/setgetacl.c
> new file mode 100644
> index 000000000000..035e7daa1c5d
> --- /dev/null
> +++ b/tools/testing/selftests/filesystems/fuse/setgetacl.c
> @@ -0,0 +1,62 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/* Simple ACL set/get wrapper */
> +
> +#include <stdio.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <sys/types.h>
> +#include <sys/acl.h>
> +
> +int main(int argc, char *argv[])
> +{
> +       acl_t acl;
> +       acl_type_t type;
> +       char *buf;
> +
> +       if ((argc !=3D 3) && (argc !=3D 4)) {
> +               fprintf(stderr, "Usage: %s <acl type> [<value>] <file>\n"=
,
> +                       argv[0]);
> +               fprintf(stderr, "where <acl type> is ACCESS or DEFAULT\n"=
);
> +               return 1;
> +       }
> +
> +       if (!strcmp(argv[1], "ACCESS"))
> +               type =3D ACL_TYPE_ACCESS;
> +       else if (!strcmp(argv[1], "DEFAULT"))
> +               type =3D ACL_TYPE_DEFAULT;
> +       else {
> +               fprintf(stderr, "Invalid ACL type\n");
> +               return 1;
> +       }
> +
> +       if (argc =3D=3D 3) {
> +               /* Get ACL */
> +               acl =3D acl_get_file(argv[2], type);
> +               if (acl =3D=3D NULL) {
> +                       perror("acl_get_file");
> +                       return 1;
> +               }
> +               buf =3D acl_to_text(acl, NULL);
> +               if (buf =3D=3D NULL)
> +                       perror("acl_from_text");
> +               else {
> +                       fprintf(stdout, "%s\n", buf);
> +                       acl_free(buf);
> +               }
> +       } else {
> +               /* Set ACL */
> +               acl =3D acl_from_text(argv[2]);
> +               if (acl =3D=3D NULL) {
> +                       perror("acl_from_text");
> +                       return 1;
> +               }
> +               if (acl_set_file(argv[3], type, acl) !=3D 0)
> +                       perror("acl_set_file");
> +       }
> +
> +       acl_free(acl);
> +
> +       return 0;
> +}
>

I think this test is already covered by
https://lore.kernel.org/linux-fsdevel/20260713220932.413004-3-amir73il@gmai=
l.com/

If there is any missing coverage, it could be added to my test,
assuming that my test (which tests a regression) will be merged first.

Thanks,
Amir.
