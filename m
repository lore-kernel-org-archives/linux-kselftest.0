Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7DB46DFE7;
	Mon,  7 Sep 2026 10:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788778503; cv=none; b=T4sK+u5PUsEdzE9IuYqL0b5s4F2P4cPTP+VvM834axdkneGM1hJreiQYXhmcEcjt+kgfGKcs7U+BtJEsYEENtToPZ676Hq86iT9YVpqM1Xvu8b8RworK9zYTSNsUWC5j35AtqJkR1knkQq5KQkhnvclzQ6fd5URWhZ7Yi6PTZyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788778503; c=relaxed/simple;
	bh=MDeq+ysxyod3D1VpGQ+eDp9LfyHeDn9wPDHxTJ0lMVM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jGD9xQyS3HCjGzeZ8k8/0p4ohNJe0LdEM8WbZbPdrXhRqfjO2LEgO1l0oVzoBu5GzjNdNXD2IG2iVovmHshTfZzU2FlBlkQ2rNLViKBJwvf3isBRCSSBQoSJBZboBuJ5pmIoXV8vZe1zj152IKGAQ5QrpGvYI3O62sQaIjMJ3AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=Idv2XM9b; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="Idv2XM9b"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Date:Subject:Cc:To:From:From:Reply-To;
	bh=B5HTZtb5iOjzytlKmQkikeIuBYLkBdHws6qM+u8yKO4=; b=Idv2XM9bj9WTti7gLf4XfOfsc7
	wF4UrOyy2qy94EknT1MDfz1lIJQwAgaAAY1k2cLMtAECqId2AypL0TcGD1NVSARgIeGTu4U7Pbr4t
	80uji4OkghNzew6dvSK3infB/PVM1bXgPU7UNoS2HzRk5KSG4D+FMosBsGFI5gRdByNBbk0FyrbH8
	7Tm7JDtw61MCgoVG/1j0JmoOxNBClcEEbpA0aUKEqHUyaHG3TUP29XWbIdbgp0BXcrBrXAEBVDDXb
	0A6dzOaGHlrPxnhyNFFJMqDKbpdJqDTQabOhoh5/Ahx2qIg0o6LRS2OLtYffs+ZZD8j7CfHAxwyJ0
	Jxxz4VRg==;
Received: from bl21-120-122.dsl.telepac.pt ([2.82.120.122] helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x3Wzv-00FzcM-Pj; Mon, 07 Sep 2026 12:54:47 +0200
From: Luis Henriques <luis@igalia.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>,  Chen Linxuan <me@black-desk.cn>,
  Jonathan Corbet <corbet@lwn.net>,  Shuah Khan
 <skhan@linuxfoundation.org>,  fuse-devel@lists.linux.dev,
  linux-kernel@vger.kernel.org,  linux-kselftest@vger.kernel.org,  Matt
 Harvey <mharvey@jumptrading.com>,  kernel-dev@igalia.com
Subject: Re: [RFC PATCH v3 8/8] selftests/fuse: add fuse readdir caching test
In-Reply-To: <CAOQ4uxh+rKuR39ruJO6PxoUCCdP_U0M=ecn-dayv+7-jKgrDNg@mail.gmail.com>
	(Amir Goldstein's message of "Sat, 5 Sep 2026 16:11:43 +0200")
References: <20260904103920.4471-1-luis@igalia.com>
	<20260904103920.4471-9-luis@igalia.com>
	<CAOQ4uxh+rKuR39ruJO6PxoUCCdP_U0M=ecn-dayv+7-jKgrDNg@mail.gmail.com>
Date: Mon, 07 Sep 2026 11:55:34 +0100
Message-ID: <87h5k1fhzt.fsf@wotan.olymp>
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
>> This new test will check the caching behaviour using combinations of two
>> opendir flags: FOPEN_KEEP_CACHE and FOPEN_CACHE_DIR.
>>
>> Signed-off-by: Luis Henriques <luis@igalia.com>
>> ---
>>  .../selftests/filesystems/fuse/.gitignore     |   1 +
>>  .../selftests/filesystems/fuse/Makefile       |   2 +
>>  .../fuse/fuse_readdir_cache_test.c            | 274 ++++++++++++++++++
>>  3 files changed, 277 insertions(+)
>>  create mode 100644 tools/testing/selftests/filesystems/fuse/fuse_readdi=
r_cache_test.c
>>
>> diff --git a/tools/testing/selftests/filesystems/fuse/.gitignore b/tools=
/testing/selftests/filesystems/fuse/.gitignore
>> index ebfe7133d811..ffa356f23e8c 100644
>> --- a/tools/testing/selftests/filesystems/fuse/.gitignore
>> +++ b/tools/testing/selftests/filesystems/fuse/.gitignore
>> @@ -4,3 +4,4 @@ fusectl_test
>>  write_extend_eof_test
>>  fuse_acl_cache_test
>>  fuse_symlink_cache_test
>> +fuse_readdir_cache_test
>> diff --git a/tools/testing/selftests/filesystems/fuse/Makefile b/tools/t=
esting/selftests/filesystems/fuse/Makefile
>> index 3a5a557dde7a..570ced181168 100644
>> --- a/tools/testing/selftests/filesystems/fuse/Makefile
>> +++ b/tools/testing/selftests/filesystems/fuse/Makefile
>> @@ -6,6 +6,7 @@ TEST_GEN_PROGS :=3D fusectl_test
>>  TEST_GEN_PROGS +=3D write_extend_eof_test
>>  TEST_GEN_PROGS +=3D fuse_acl_cache_test
>>  TEST_GEN_PROGS +=3D fuse_symlink_cache_test
>> +TEST_GEN_PROGS +=3D fuse_readdir_cache_test
>>  TEST_GEN_FILES :=3D fuse_mnt
>>
>>  include ../../lib.mk
>> @@ -30,5 +31,6 @@ $(OUTPUT)/fuse_mnt: LDLIBS +=3D $(VAR_LDLIBS)
>>
>>  $(OUTPUT)/fuse_acl_cache_test: fuse_common.c fuse_acl_cache_test.c
>>  $(OUTPUT)/fuse_symlink_cache_test: fuse_common.c fuse_symlink_cache_tes=
t.c
>> +$(OUTPUT)/fuse_readdir_cache_test: fuse_common.c fuse_readdir_cache_tes=
t.c
>>
>>  EXTRA_CLEAN :=3D fuse_common.o
>> diff --git a/tools/testing/selftests/filesystems/fuse/fuse_readdir_cache=
_test.c b/tools/testing/selftests/filesystems/fuse/fuse_readdir_cache_test.c
>> new file mode 100644
>> index 000000000000..7c49cc6a23e3
>> --- /dev/null
>> +++ b/tools/testing/selftests/filesystems/fuse/fuse_readdir_cache_test.c
>> @@ -0,0 +1,274 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Simple filesystem to test FUSE readdir cache
>> + *
>> + * It will simply perform readdir operations on a directory checking ho=
w many
>> + * times a request is sent to user-space using all the possible caching
>> + * combination setting (FOPEN_KEEP_CACHE and FOPEN_CACHE_DIR flags).
>> + */
>> +
>> +#include <stdio.h>
>> +#include <limits.h>
>> +#include <dirent.h>
>> +
>> +#include "kselftest_harness.h"
>> +
>> +#include "fuse_common.h"
>> +
>> +#define DIRNAME "mydir"
>> +#define FILENAME "myfile"
>> +
>> +#define DIR_INO 42
>> +#define FILE_INO 43
>> +#define DOT_INO 40
>> +#define DOTDOT_INO 41
>> +
>> +#define TIMEOUT        86400.0f
>> +
>> +struct test_state {
>> +       pthread_mutex_t lock;
>> +       bool cache_readdir;
>> +       bool keep_cache;
>> +       int readdir_counter;
>> +} test_state =3D {
>> +       .lock =3D PTHREAD_MUTEX_INITIALIZER,
>> +};
>> +
>> +static void fs_lookup(fuse_req_t req, fuse_ino_t parent, const char *na=
me)
>> +{
>> +       struct fuse_entry_param e =3D {};
>> +
>> +       if (parent !=3D FUSE_ROOT_ID || strcmp(name, DIRNAME) !=3D 0)
>> +               fuse_reply_err(req, ENOENT);
>
> Again: allergic to non matching {} and can just return here no need
> for all this nesting

ACK.

>> +       else {
>> +               if (!strcmp(name, DIRNAME)) {
>
> This condition is already guaranteed when we get here

*sigh*
Yeah, likely leftover code from the symlink cache test I used as base.

>> +                       e.ino =3D DIR_INO;
>> +                       e.attr.st_mode =3D S_IFDIR | 0755;
>> +                       e.attr.st_nlink =3D 1;
>> +               } else {
>> +                       e.ino =3D FUSE_ROOT_ID;
>> +                       e.attr.st_mode =3D S_IFDIR | 0755;
>> +                       e.attr.st_nlink =3D 2;
>> +               }
>> +               e.attr.st_mtime =3D time(NULL);
>> +               e.attr_timeout =3D TIMEOUT;
>> +               e.entry_timeout =3D TIMEOUT;
>> +               fuse_reply_entry(req, &e);
>> +       }
>> +}
>> +
>> +static int fill_stat(fuse_ino_t ino, struct stat *st)
>> +{
>> +       int ret =3D 0;
>> +
>> +       st->st_ino =3D ino;
>> +       st->st_mtime =3D time(NULL);
>
> Doesn't this need to be a const value?
> to make sure that it does not change from here to lookup time?

Good point.  That value should probably be kept in the test state
structure.

Cheers,
--=20
Lu=C3=ADs

> Thanks,
> Amir.
>
>> +
>> +       switch (ino) {
>> +       case FUSE_ROOT_ID:
>> +               st->st_mode =3D S_IFDIR | 0755;
>> +               st->st_nlink =3D 2;
>> +               break;
>> +       case DOT_INO:
>> +       case DOTDOT_INO:
>> +       case DIR_INO:
>> +               st->st_mode =3D S_IFDIR | 0755;
>> +               st->st_nlink =3D 1;
>> +               break;
>> +       case FILE_INO:
>> +               st->st_mode =3D S_IFREG | 0444;
>> +               st->st_nlink =3D 1;
>> +               break;
>> +       default:
>> +               ret =3D -1;
>> +               break;
>> +       }
>> +
>> +       return ret;
>> +}
>> +
>> +static void fs_getattr(fuse_req_t req, fuse_ino_t ino,
>> +                      struct fuse_file_info *fi)
>> +{
>> +       struct stat st =3D {};
>> +
>> +       if (fill_stat(ino, &st) < 0)
>> +               fuse_reply_err(req, ENOENT);
>> +       else
>> +               fuse_reply_attr(req, &st, TIMEOUT);
>> +}
>> +
>> +static void fs_opendir(fuse_req_t req, fuse_ino_t ino,
>> +                      struct fuse_file_info *fi)
>> +{
>> +       pthread_mutex_lock(&test_state.lock);
>> +       fi->keep_cache =3D test_state.keep_cache;
>> +       fi->cache_readdir =3D test_state.cache_readdir;
>> +       pthread_mutex_unlock(&test_state.lock);
>> +       fuse_reply_open(req, fi);
>> +}
>> +
>> +static void fs_readdir(fuse_req_t req, fuse_ino_t ino, size_t size,
>> +                      off_t offset, struct fuse_file_info *fi)
>> +{
>> +       struct stat st =3D {};
>> +       char buf[1024];
>> +       char *pbuf;
>> +       size_t rem =3D size;
>> +       size_t sz;
>> +       int nextoff =3D 0;
>> +
>> +       if (ino !=3D DIR_INO) {
>> +               fuse_reply_err(req, ENOTDIR);
>> +               return;
>> +       }
>> +       if (offset) {
>> +               fuse_reply_buf(req, NULL, 0);
>> +               return;
>> +       }
>> +       pbuf =3D buf;
>> +       fill_stat(DOT_INO, &st);
>> +       sz =3D fuse_add_direntry(req, pbuf, rem, ".", &st, nextoff++);
>> +       rem -=3D sz;
>> +       pbuf +=3D sz;
>> +       fill_stat(DOTDOT_INO, &st);
>> +       sz =3D fuse_add_direntry(req, pbuf, rem, "..", &st, nextoff++);
>> +       rem -=3D sz;
>> +       pbuf +=3D sz;
>> +       fill_stat(FILE_INO, &st);
>> +       sz =3D fuse_add_direntry(req, pbuf, rem, FILENAME, &st, nextoff+=
+);
>> +       rem -=3D sz;
>> +
>> +       fuse_reply_buf(req, buf, size - rem);
>> +
>> +       pthread_mutex_lock(&test_state.lock);
>> +       test_state.readdir_counter++;
>> +       pthread_mutex_unlock(&test_state.lock);
>> +}
>> +
>> +static const struct fuse_lowlevel_ops fs_ops =3D {
>> +       .lookup         =3D fs_lookup,
>> +       .getattr        =3D fs_getattr,
>> +       .opendir        =3D fs_opendir,
>> +       .readdir        =3D fs_readdir,
>> +};
>> +
>> +FIXTURE(readdir_cache)
>> +{
>> +       struct fuse_session *se;
>> +       char mountpoint[MOUNTPOINT_SZ];
>> +       pthread_t thread;
>> +};
>> +
>> +FIXTURE_VARIANT(readdir_cache)
>> +{
>> +       bool cache_readdir;
>> +       bool keep_cache;
>> +};
>> +FIXTURE_VARIANT_ADD(readdir_cache, nocache)
>> +{
>> +       .cache_readdir =3D false,
>> +       .keep_cache =3D false,
>> +};
>> +FIXTURE_VARIANT_ADD(readdir_cache, cache_readdir)
>> +{
>> +       .cache_readdir =3D true,
>> +       .keep_cache =3D false,
>> +};
>> +FIXTURE_VARIANT_ADD(readdir_cache, keep_cache)
>> +{
>> +       .cache_readdir =3D false,
>> +       .keep_cache =3D true,
>> +};
>> +FIXTURE_VARIANT_ADD(readdir_cache, cache)
>> +{
>> +       .cache_readdir =3D true,
>> +       .keep_cache =3D true,
>> +};
>> +
>> +FIXTURE_SETUP(readdir_cache)
>> +{
>> +       char err[MAX_ERR_MSG];
>> +
>> +       pthread_mutex_lock(&test_state.lock);
>> +       test_state.readdir_counter =3D 0;
>> +       test_state.cache_readdir =3D variant->cache_readdir;
>> +       test_state.keep_cache =3D variant->keep_cache;
>> +       pthread_mutex_unlock(&test_state.lock);
>> +
>> +       if (fs_setup(&self->se, self->mountpoint, &fs_ops, &self->thread=
, err))
>> +               SKIP(return, err);
>> +}
>> +
>> +FIXTURE_TEARDOWN(readdir_cache)
>> +{
>> +       fs_teardown(self->se, self->thread, self->mountpoint);
>> +}
>> +
>> +TEST_F(readdir_cache, test_readdir_cache)
>> +{
>> +       struct dirent *dentry;
>> +       DIR *dir;
>> +       char pathname[PATH_MAX];
>> +       int total_counter, rewind_counter;
>> +       int dentrycount;
>> +
>> +       sprintf(pathname, "%s/%s", self->mountpoint, DIRNAME);
>> +
>> +       dir =3D opendir(pathname);
>> +       if (dir =3D=3D NULL)
>> +               TH_LOG("opendir(): %s", strerror(errno));
>> +       ASSERT_NE(dir, NULL);
>> +
>> +       errno =3D 0;
>> +       dentrycount =3D 0;
>> +       while ((dentry =3D readdir(dir)))
>> +               dentrycount++;
>> +       ASSERT_EQ(errno, 0);
>> +       ASSERT_EQ(dentrycount, 3);
>> +
>> +       rewinddir(dir);
>> +       errno =3D 0;
>> +       dentrycount =3D 0;
>> +       while ((dentry =3D readdir(dir)))
>> +               dentrycount++;
>> +       ASSERT_EQ(errno, 0);
>> +       ASSERT_EQ(dentrycount, 3);
>> +
>> +       ASSERT_EQ(closedir(dir), 0);
>> +
>> +       pthread_mutex_lock(&test_state.lock);
>> +       rewind_counter =3D test_state.readdir_counter;
>> +       pthread_mutex_unlock(&test_state.lock);
>> +
>> +       dir =3D opendir(pathname);
>> +       if (dir =3D=3D NULL)
>> +               TH_LOG("opendir(): %s", strerror(errno));
>> +       ASSERT_NE(dir, NULL);
>> +
>> +       errno =3D 0;
>> +       dentrycount =3D 0;
>> +       while ((dentry =3D readdir(dir)))
>> +               dentrycount++;
>> +       ASSERT_EQ(errno, 0);
>> +       ASSERT_EQ(dentrycount, 3);
>> +
>> +       ASSERT_EQ(closedir(dir), 0);
>> +
>> +       pthread_mutex_lock(&test_state.lock);
>> +       total_counter =3D test_state.readdir_counter;
>> +       pthread_mutex_unlock(&test_state.lock);
>> +
>> +       if (!variant->cache_readdir) {
>> +               ASSERT_EQ(rewind_counter, 2);
>> +               ASSERT_EQ(total_counter, 3);
>> +       } else if (!variant->keep_cache) {
>> +               ASSERT_EQ(rewind_counter, 1);
>> +               ASSERT_EQ(total_counter, 2);
>> +       } else {
>> +               ASSERT_EQ(rewind_counter, 1);
>> +               ASSERT_EQ(total_counter, 1);
>> +       }
>> +}
>> +
>> +TEST_HARNESS_MAIN

