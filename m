Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459743859D7;
	Fri, 18 Sep 2026 09:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789723637; cv=none; b=pdsJHdjFlsD5Vfft43uVDShrFrT/j2mLrv5eagVe2s4kYAGSkoGG5Bin4YR7AV2Twpcee/OfV2zkm+QLqpQl8mAnYXmIhgyDNmGKuiTfVqNn8h22vSi5mjBl9fxXisS5W5rca3XeMx0fDj0CSNj7QU5371W+v37ckXkPf6FCbLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789723637; c=relaxed/simple;
	bh=Te3k78FtHQODlS8vaGxp5J/W285GftnYzSs6n4Z3G1M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=P0OEi1b7XsEhwu3pr2/eaQ4BKQbxJDFuHmof91euKPg1P8KzhptRZGSEpXV7gmmjcAqlDmAVuFTkpC+0JhlIO7f/rEunjdEo5wvwhhKC9EbUNNvuPgmEsVcMCeYc1GPg4uCknSNPOiiH3bGusf8s5xC1pxPQl8UtqN+KNQoJJ54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=aCOhb5kV; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="aCOhb5kV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Date:Subject:Cc:To:From:From:Reply-To;
	bh=QiuzCePKqgJODz3geyNPYIV352fWdv3Mgyzmoh66kOI=; b=aCOhb5kV9dJuzyGxOMUi67zPFI
	NGC088DhKisMOEbLiuQDSl4UISkZqAffFIVkXjUMgGnkwOXAs3Wr6XSZy8Ou5sHJA1SFGLc/vk9ld
	SZpMHFhamStWnv0OjtNlBgJa/ukfVRI1sPErDag5q8MbDgwDgjG6UZ5TlFmVtIPOkhQ1SGKVt7m1Q
	KTW3EQMHckyz07v7Jw6QNyCi0UQWGjyBiuFbL6Fe642k/c+s6r7UTm4iXurnJJgiIPQz4Vsx0/hmL
	AZ3Uo8DvZBhNDqES2JdgusmwGXByijmTsgVuodg3ksg8zk7FoC/Cyae7IDgSxzO2TG2rbujSul6pG
	m05oaW9A==;
Received: from bl21-120-122.dsl.telepac.pt ([2.82.120.122] helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x7Us5-003rhC-HF; Fri, 18 Sep 2026 11:27:05 +0200
From: Luis Henriques <luis@igalia.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>,  Chen Linxuan <me@black-desk.cn>,
  Jonathan Corbet <corbet@lwn.net>,  Shuah Khan
 <skhan@linuxfoundation.org>,  fuse-devel@lists.linux.dev,
  linux-kernel@vger.kernel.org,  linux-kselftest@vger.kernel.org,  Matt
 Harvey <mharvey@jumptrading.com>,  kernel-dev@igalia.com
Subject: Re: [RFC PATCH v4 4/8] selftests/fuse: factor-out test fixture
 setup/teardown
In-Reply-To: <CAOQ4uxgOGm3Eo97M32CK84HWEsXNgnYU5uunTV0g_Si9NRj5tw@mail.gmail.com>
References: <20260916155629.32421-1-luis@igalia.com>
	<20260916155629.32421-5-luis@igalia.com>
	<CAOQ4uxgOGm3Eo97M32CK84HWEsXNgnYU5uunTV0g_Si9NRj5tw@mail.gmail.com>
Date: Fri, 18 Sep 2026 10:28:03 +0100
Message-ID: <87fqz66h98.fsf@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17 2026, Amir Goldstein wrote:

> On Wed, Sep 16, 2026 at 5:55=E2=80=AFPM Luis Henriques <luis@igalia.com> =
wrote:
>>
>> In order to reduce new tests setup/teardown code duplication, factor-out
>> these functions from the existing acl_cache test into a new fuse_common.c
>> file that can be reused in other tests.
>>
>> While there, also move some of the FIXTURE members into a fuse_common_ctx
>> structure that can be passed into setup/teardown instead of passing them=
 by
>> reference.
>>
>> Signed-off-by: Luis Henriques <luis@igalia.com>
>> ---
>>  .../selftests/filesystems/fuse/Makefile       |  8 +-
>>  .../filesystems/fuse/fuse_acl_cache_test.c    | 73 ++++---------------
>>  .../selftests/filesystems/fuse/fuse_common.c  | 58 +++++++++++++++
>>  .../selftests/filesystems/fuse/fuse_common.h  | 31 ++++++++
>>  4 files changed, 111 insertions(+), 59 deletions(-)
>>  create mode 100644 tools/testing/selftests/filesystems/fuse/fuse_common=
.c
>>  create mode 100644 tools/testing/selftests/filesystems/fuse/fuse_common=
.h
>>
>> diff --git a/tools/testing/selftests/filesystems/fuse/Makefile b/tools/t=
esting/selftests/filesystems/fuse/Makefile
>> index a3ee9b3a2f5d..7744f796eb06 100644
>> --- a/tools/testing/selftests/filesystems/fuse/Makefile
>> +++ b/tools/testing/selftests/filesystems/fuse/Makefile
>> @@ -21,8 +21,12 @@ ifeq ($(VAR_LDLIBS),)
>>  VAR_LDLIBS :=3D -lfuse3 -pthread
>>  endif
>>
>> +CFLAGS +=3D $(VAR_CFLAGS)
>> +LDLIBS +=3D $(VAR_LDLIBS)
>> +
>>  $(OUTPUT)/fuse_mnt: CFLAGS +=3D $(VAR_CFLAGS)
>>  $(OUTPUT)/fuse_mnt: LDLIBS +=3D $(VAR_LDLIBS)
>>
>> -$(OUTPUT)/fuse_acl_cache_test: CFLAGS +=3D $(VAR_CFLAGS)
>> -$(OUTPUT)/fuse_acl_cache_test: LDLIBS +=3D $(VAR_LDLIBS)
>> +$(OUTPUT)/fuse_acl_cache_test: fuse_common.c fuse_acl_cache_test.c
>> +
>> +EXTRA_CLEAN :=3D fuse_common.o
>> diff --git a/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_tes=
t.c b/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
>> index 2411a6e285f1..d5a966e7fc15 100644
>> --- a/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
>> +++ b/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
>> @@ -33,23 +33,15 @@
>>   */
>>
>>  #define _GNU_SOURCE
>> -#include <errno.h>
>>  #include <fcntl.h>
>>  #include <linux/limits.h>
>> -#include <pthread.h>
>>  #include <stdint.h>
>> -#include <stdio.h>
>> -#include <stdlib.h>
>> -#include <string.h>
>> -#include <sys/stat.h>
>>  #include <sys/xattr.h>
>> -#include <unistd.h>
>> -
>> -#define FUSE_USE_VERSION 31
>> -#include <fuse_lowlevel.h>
>>
>>  #include "kselftest_harness.h"
>>
>> +#include "fuse_common.h"
>> +
>>  /* ---- ACL binary encoding -------------------------------------------=
----- */
>>  /*
>>   * POSIX ACL v2 xattr format (little-endian):
>> @@ -88,6 +80,7 @@ static const uint8_t acl_b[] =3D {
>>
>>  struct daemon_state {
>>         pthread_mutex_t lock;
>> +       struct fuse_common_ctx ctx;
>>         const uint8_t  *acl;
>>         size_t          acl_size;
>>         int             getxattr_count;
>> @@ -176,69 +169,35 @@ static const struct fuse_lowlevel_ops fs_ops =3D {
>>         .getxattr =3D fs_getxattr,
>>  };
>>
>> -/* ---- Daemon thread -------------------------------------------------=
------ */
>> -
>> -static void *run_daemon(void *arg)
>> -{
>> -       fuse_session_loop((struct fuse_session *)arg);
>> -       return NULL;
>> -}
>> -
>>  /* ---- kselftest harness ---------------------------------------------=
------ */
>>
>>  FIXTURE(acl_cache) {
>> -       struct fuse_session *se;
>> -       char                 mountpoint[PATH_MAX];
>> -       char                 file_path[PATH_MAX];
>> -       pthread_t            thread;
>> +       char file_path[PATH_MAX];
>>  };
>>
>
> Hi Luis,
>
> Thanks for the followup cleanup.
> Question: why did you move struct fuse_common_ctx out of the test
> fixture and into the global state?
> It not terribly wrong but seems unnecessary and inconsistent -
> fs_setup/teardown are in FIXTURE_SETUP/TEARDOWN
> so it is more consistent that fuse_common_ctx stays embedded in the
> fixure object, unless you have a reason to counter.

Well, I do not have a good reason so I'll move that struct into the
FIXTURE :-)

You're right, it probably makes more sense to keep these separate from the
test state.  I'll fix this test (and the other ones).

Cheers,
--=20
Lu=C3=ADs


> With that fix, feel free to add
>
> Reviewed-by: Amir Goldstein <amir73il@gmail.com>
>
> Thanks,
> Amir.
>
>>  FIXTURE_SETUP(acl_cache)
>>  {
>> -       char *fuse_argv[] =3D { "fuse_acl_cache_test", NULL };
>> -       struct fuse_args args =3D FUSE_ARGS_INIT(1, fuse_argv);
>> +       char err[MAX_ERR_MSG];
>>
>> -       g_ds.acl            =3D acl_a;
>> -       g_ds.acl_size       =3D sizeof(acl_a);
>> +       pthread_mutex_lock(&g_ds.lock);
>> +       g_ds.acl =3D acl_a;
>> +       g_ds.acl_size =3D sizeof(acl_a);
>>         g_ds.getxattr_count =3D 0;
>>
>> -       strcpy(self->mountpoint, "/tmp/acl_cache_test_XXXXXX");
>> -       if (!mkdtemp(self->mountpoint))
>> -               SKIP(return, "mkdtemp: %s", strerror(errno));
>> +       if (fs_setup(&fs_ops, &g_ds.ctx, err))
>> +               SKIP(goto out, err);
>>
>>         snprintf(self->file_path, sizeof(self->file_path),
>> -                "%s/" FILE_NAME, self->mountpoint);
>> -
>> -       self->se =3D fuse_session_new(&args, &fs_ops, sizeof(fs_ops), NU=
LL);
>> -       if (!self->se) {
>> -               rmdir(self->mountpoint);
>> -               SKIP(return, "fuse_session_new failed");
>> -       }
>> -
>> -       if (fuse_session_mount(self->se, self->mountpoint)) {
>> -               fuse_session_destroy(self->se);
>> -               rmdir(self->mountpoint);
>> -               SKIP(return, "fuse_session_mount failed "
>> -                            "(missing fusermount3 or insufficient privi=
leges)");
>> -       }
>> -
>> -       if (pthread_create(&self->thread, NULL, run_daemon, self->se)) {
>> -               fuse_session_unmount(self->se);
>> -               fuse_session_destroy(self->se);
>> -               rmdir(self->mountpoint);
>> -               SKIP(return, "pthread_create: %s", strerror(errno));
>> -       }
>> -
>> -       fuse_opt_free_args(&args);
>> +                "%s/" FILE_NAME, g_ds.ctx.mountpoint);
>> +out:
>> +       pthread_mutex_unlock(&g_ds.lock);
>>  }
>>
>>  FIXTURE_TEARDOWN(acl_cache)
>>  {
>> -       fuse_session_exit(self->se);
>> -       fuse_session_unmount(self->se);
>> -       pthread_join(self->thread, NULL);
>> -       fuse_session_destroy(self->se);
>> -       rmdir(self->mountpoint);
>> +       pthread_mutex_lock(&g_ds.lock);
>> +       fs_teardown(&g_ds.ctx);
>> +       pthread_mutex_unlock(&g_ds.lock);
>>  }
>>
>>  static int do_force_statx(const char *path)
>> diff --git a/tools/testing/selftests/filesystems/fuse/fuse_common.c b/to=
ols/testing/selftests/filesystems/fuse/fuse_common.c
>> new file mode 100644
>> index 000000000000..d1d3dfd2ea67
>> --- /dev/null
>> +++ b/tools/testing/selftests/filesystems/fuse/fuse_common.c
>> @@ -0,0 +1,58 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +#include "fuse_common.h"
>> +
>> +static void *run_daemon(void *arg)
>> +{
>> +       fuse_session_loop((struct fuse_session *)arg);
>> +       return NULL;
>> +}
>> +
>> +int fs_setup(const struct fuse_lowlevel_ops *fs_ops,
>> +            struct fuse_common_ctx *ctx, char *err)
>> +{
>> +       char *fuse_argv[] =3D { "fuse_test", NULL };
>> +       struct fuse_args args =3D FUSE_ARGS_INIT(1, fuse_argv);
>> +
>> +       strcpy(ctx->mountpoint, MOUNTPOINT_TEMPLATE);
>> +       if (!mkdtemp(ctx->mountpoint)) {
>> +               snprintf(err, MAX_ERR_MSG, "mkdtemp: %s", strerror(errno=
));
>> +               return -1;
>> +       }
>> +
>> +       ctx->se =3D fuse_session_new(&args, fs_ops, sizeof(*fs_ops), NUL=
L);
>> +       if (!ctx->se) {
>> +               rmdir(ctx->mountpoint);
>> +               snprintf(err, MAX_ERR_MSG, "fuse_session_new failed");
>> +               return -1;
>> +       }
>> +
>> +       if (fuse_session_mount(ctx->se, ctx->mountpoint)) {
>> +               fuse_session_destroy(ctx->se);
>> +               rmdir(ctx->mountpoint);
>> +               snprintf(err, MAX_ERR_MSG, "fuse_session_mount failed "
>> +                       "(missing fusermount3 or insufficient privileges=
)");
>> +               return -1;
>> +       }
>> +
>> +       if (pthread_create(&ctx->thread, NULL, run_daemon, ctx->se)) {
>> +               fuse_session_unmount(ctx->se);
>> +               fuse_session_destroy(ctx->se);
>> +               rmdir(ctx->mountpoint);
>> +               snprintf(err, MAX_ERR_MSG, "pthread_create: %s", strerro=
r(errno));
>> +               return -1;
>> +       }
>> +
>> +       fuse_opt_free_args(&args);
>> +
>> +       return 0;
>> +}
>> +
>> +void fs_teardown(struct fuse_common_ctx *ctx)
>> +{
>> +       fuse_session_exit(ctx->se);
>> +       fuse_session_unmount(ctx->se);
>> +       pthread_join(ctx->thread, NULL);
>> +       fuse_session_destroy(ctx->se);
>> +       rmdir(ctx->mountpoint);
>> +}
>> diff --git a/tools/testing/selftests/filesystems/fuse/fuse_common.h b/to=
ols/testing/selftests/filesystems/fuse/fuse_common.h
>> new file mode 100644
>> index 000000000000..e3dd85daa4b0
>> --- /dev/null
>> +++ b/tools/testing/selftests/filesystems/fuse/fuse_common.h
>> @@ -0,0 +1,31 @@
>> +#ifndef __SELFTEST_FUSE_COMMON_H__
>> +#define __SELFTEST_FUSE_COMMON_H__
>> +
>> +#define _GNU_SOURCE
>> +#include <errno.h>
>> +#include <pthread.h>
>> +#include <stdio.h>
>> +#include <stdlib.h>
>> +#include <string.h>
>> +#include <unistd.h>
>> +#include <limits.h>
>> +
>> +#define FUSE_USE_VERSION 31
>> +#include <fuse_lowlevel.h>
>> +
>> +#define MAX_ERR_MSG 256
>> +
>> +#define MOUNTPOINT_TEMPLATE "/tmp/fuse_test_XXXXXX"
>> +#define MOUNTPOINT_SZ 64
>> +
>> +struct fuse_common_ctx {
>> +       struct fuse_session *se;
>> +       char mountpoint[MOUNTPOINT_SZ];
>> +       pthread_t thread;
>> +};
>> +
>> +int fs_setup(const struct fuse_lowlevel_ops *fs_ops,
>> +            struct fuse_common_ctx *ctx, char *err);
>> +void fs_teardown(struct fuse_common_ctx *ctx);
>> +
>> +#endif /* __SELFTEST_FUSE_COMMON_H__ */

