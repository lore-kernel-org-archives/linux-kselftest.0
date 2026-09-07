Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2292045561F;
	Mon,  7 Sep 2026 10:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788777865; cv=none; b=BiAiVKUEjTuiklw+LERTXIPtD25Kw7AmaTmbPqSL5PhV/xELMaxmUkkeQR+n6/XxaEBZF96CVTcfn4i4DXHHSA3s/VfLL5s73IeF0fw832Usb4avNgCEpp3R9jb2L63rrRVcpGoYN3HPgyMTSncDATNajlTONl2ti+FHbltB4qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788777865; c=relaxed/simple;
	bh=HfUjNdqwF8k05W8k8ECuUMgIMjwA8JbbF+FafzXP4TU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=c7fvaNtv05C3+Xp0fuu36hAEtjIi5ZjcOheGPH0axDBAgxNTw/zSQwJviYJDislNAK6oAKgt+COaBrTd1ilebCjiYfUNoxiCK6rvAvXRO6UJmEBMswkULl9LMeGsuI8/0VONKFcPoEifi3g89lGi7uoZxj3m76Znrg7OAzAF6uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=RxK9PcPY; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="RxK9PcPY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Date:Subject:Cc:To:From:From:Reply-To;
	bh=pBCg7u49xpfBsWBvFB9jk6E2nhJPT8YcUxlHzKNM8WM=; b=RxK9PcPYkOrTuOM7DTVueJYSLt
	FJANQJZNPFqnzcVCY3ecpmaakRjFGhlLVw0dK2a0GQwdSglGG+w6glu+SedKwqRxNJyS+qLKVI+i5
	HjDaSaCjZQLns2bQOsQWROXxLy5vKufZPYE+WUolGOWiC4jOLpcEHPS2ATCQnjE8EGiv54jHgRhUA
	oKs5YIao02R0PhnkjTDwNExrpIcsDgI7IczuYBU9tYYBFit++5HtvtEMH5BNKQBqWXdwo9I42IPh6
	l9axhfsspxE6TASh00U2yfiXM4GpDoI2EsMjQDuFGD5dGAkSxAJbohhsQ1GDZq+3n34lJamMp9KXF
	LSzVcHow==;
Received: from bl21-120-122.dsl.telepac.pt ([2.82.120.122] helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x3Wpg-00FzOb-Dm; Mon, 07 Sep 2026 12:44:12 +0200
From: Luis Henriques <luis@igalia.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>,  Chen Linxuan <me@black-desk.cn>,
  Jonathan Corbet <corbet@lwn.net>,  Shuah Khan
 <skhan@linuxfoundation.org>,  fuse-devel@lists.linux.dev,
  linux-kernel@vger.kernel.org,  linux-kselftest@vger.kernel.org,  Matt
 Harvey <mharvey@jumptrading.com>,  kernel-dev@igalia.com
Subject: Re: [RFC PATCH v3 4/8] selftests/fuse: factor-out test fixture
 setup/teardown
In-Reply-To: <CAOQ4uxgR8v6H=8fHMmLjChsuXUn8560nzda55t8pCNA1ocvg_A@mail.gmail.com>
	(Amir Goldstein's message of "Sat, 5 Sep 2026 14:45:08 +0200")
References: <20260904103920.4471-1-luis@igalia.com>
	<20260904103920.4471-5-luis@igalia.com>
	<CAOQ4uxgR8v6H=8fHMmLjChsuXUn8560nzda55t8pCNA1ocvg_A@mail.gmail.com>
Date: Mon, 07 Sep 2026 11:44:59 +0100
Message-ID: <87pkypfihg.fsf@wotan.olymp>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 05 2026, Amir Goldstein wrote:

> On Fri, Sep 4, 2026 at 12:38=E2=80=AFPM Luis Henriques <luis@igalia.com> =
wrote:
>>
>> In order to reduce new tests setup/teardown code duplication, factor-out
>> these functions from the existing acl_cache test into a new fuse_common.c
>> file that can be reused in other tests.
>>
>> Signed-off-by: Luis Henriques <luis@igalia.com>
>> ---
>>  .../selftests/filesystems/fuse/Makefile       |  8 ++-
>>  .../filesystems/fuse/fuse_acl_cache_test.c    | 62 +++----------------
>>  .../selftests/filesystems/fuse/fuse_common.c  | 60 ++++++++++++++++++
>>  .../selftests/filesystems/fuse/fuse_common.h  | 25 ++++++++
>>  4 files changed, 100 insertions(+), 55 deletions(-)
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
>> index 2411a6e285f1..12cbf9753d03 100644
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
>> @@ -176,69 +168,33 @@ static const struct fuse_lowlevel_ops fs_ops =3D {
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
>>         struct fuse_session *se;
>> -       char                 mountpoint[PATH_MAX];
>> +       char                 mountpoint[MOUNTPOINT_SZ];
>>         char                 file_path[PATH_MAX];
>>         pthread_t            thread;
>>  };
>
> Nice!
> I think it would be even nicer to have struct fuse_common_ctx
> with the common members embedded in the per test state,
> but I'll let you decide if you want to do that or not.

Thanks for the suggestion.  It may make sense indeed to have that common
struct, although it would probably only include the spinlock and a bool
for enabling/disabling the cache.  I'll have a closer look and see if it
makes sense.

Cheers,
--=20
Lu=C3=ADs

>
> Thanks,
> Amir.
>
>>
>>  FIXTURE_SETUP(acl_cache)
>>  {
>> -       char *fuse_argv[] =3D { "fuse_acl_cache_test", NULL };
>> -       struct fuse_args args =3D FUSE_ARGS_INIT(1, fuse_argv);
>> +       char err[MAX_ERR_MSG];
>>
>> -       g_ds.acl            =3D acl_a;
>> -       g_ds.acl_size       =3D sizeof(acl_a);
>> +       g_ds.acl =3D acl_a;
>> +       g_ds.acl_size =3D sizeof(acl_a);
>>         g_ds.getxattr_count =3D 0;
>>
>> -       strcpy(self->mountpoint, "/tmp/acl_cache_test_XXXXXX");
>> -       if (!mkdtemp(self->mountpoint))
>> -               SKIP(return, "mkdtemp: %s", strerror(errno));
>> +       if (fs_setup(&self->se, self->mountpoint, &fs_ops, &self->thread=
, err))
>> +               SKIP(return, err);
>>
>>         snprintf(self->file_path, sizeof(self->file_path),
>>                  "%s/" FILE_NAME, self->mountpoint);
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
>>  }
>>
>>  FIXTURE_TEARDOWN(acl_cache)
>>  {
>> -       fuse_session_exit(self->se);
>> -       fuse_session_unmount(self->se);
>> -       pthread_join(self->thread, NULL);
>> -       fuse_session_destroy(self->se);
>> -       rmdir(self->mountpoint);
>> +       fs_teardown(self->se, self->thread, self->mountpoint);
>>  }
>>
>>  static int do_force_statx(const char *path)
>> diff --git a/tools/testing/selftests/filesystems/fuse/fuse_common.c b/to=
ols/testing/selftests/filesystems/fuse/fuse_common.c
>> new file mode 100644
>> index 000000000000..3a91cac25b81
>> --- /dev/null
>> +++ b/tools/testing/selftests/filesystems/fuse/fuse_common.c
>> @@ -0,0 +1,60 @@
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
>> +int fs_setup(struct fuse_session **se, char *mountpoint,
>> +            const struct fuse_lowlevel_ops *fs_ops,
>> +            pthread_t *thread, char *err)
>> +{
>> +       char *fuse_argv[] =3D { "fuse_test", NULL };
>> +       struct fuse_args args =3D FUSE_ARGS_INIT(1, fuse_argv);
>> +
>> +       strcpy(mountpoint, MOUNTPOINT_TEMPLATE);
>> +       if (!mkdtemp(mountpoint)) {
>> +               snprintf(err, MAX_ERR_MSG, "mkdtemp: %s", strerror(errno=
));
>> +               return -1;
>> +       }
>> +
>> +       *se =3D fuse_session_new(&args, fs_ops, sizeof(*fs_ops), NULL);
>> +       if (!*se) {
>> +               rmdir(mountpoint);
>> +               snprintf(err, MAX_ERR_MSG, "fuse_session_new failed");
>> +               return -1;
>> +       }
>> +
>> +       if (fuse_session_mount(*se, mountpoint)) {
>> +               fuse_session_destroy(*se);
>> +               rmdir(mountpoint);
>> +               snprintf(err, MAX_ERR_MSG, "fuse_session_mount failed "
>> +                       "(missing fusermount3 or insufficient privileges=
)");
>> +               return -1;
>> +       }
>> +
>> +       if (pthread_create(thread, NULL, run_daemon, *se)) {
>> +               fuse_session_unmount(*se);
>> +               fuse_session_destroy(*se);
>> +               rmdir(mountpoint);
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
>> +void fs_teardown(struct fuse_session *se, pthread_t thread, char *mount=
point)
>> +{
>> +       fuse_session_exit(se);
>> +       fuse_session_unmount(se);
>> +       pthread_join(thread, NULL);
>> +       fuse_session_destroy(se);
>> +       rmdir(mountpoint);
>> +}
>> +
>> diff --git a/tools/testing/selftests/filesystems/fuse/fuse_common.h b/to=
ols/testing/selftests/filesystems/fuse/fuse_common.h
>> new file mode 100644
>> index 000000000000..77d5eb58550d
>> --- /dev/null
>> +++ b/tools/testing/selftests/filesystems/fuse/fuse_common.h
>> @@ -0,0 +1,25 @@
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
>> +
>> +#define FUSE_USE_VERSION 31
>> +#include <fuse_lowlevel.h>
>> +
>> +#define MAX_ERR_MSG 256
>> +
>> +#define MOUNTPOINT_TEMPLATE "/tmp/fuse_test_XXXXXX"
>> +#define MOUNTPOINT_SZ 64
>> +
>> +int fs_setup(struct fuse_session **se, char *mountpoint,
>> +            const struct fuse_lowlevel_ops *fs_ops,
>> +            pthread_t *thread, char *err);
>> +void fs_teardown(struct fuse_session *se, pthread_t thread, char *mount=
point);
>> +
>> +#endif /* __SELFTEST_FUSE_COMMON_H__ */

