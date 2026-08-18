Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A42367F4D;
	Tue, 18 Aug 2026 15:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787068302; cv=none; b=X16zt3pBm66D/h6FLVpRQBegRJfgYkY4dx4x3o0d9e+Yl+6ggc9akt2qRP/87Lso5HdyDFC6+9J0fQXetZWlcaqEwM04yMnkMq6AOHu180dN/YgtJT9QRKczs9mKpb6t8LurUMM87061QgbqmYIv1KnLpwUw2ppEPwjd2eAbn0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787068302; c=relaxed/simple;
	bh=d+kq4nXQalbnhKAdHGYPwrjrsHHPGUh4VkJaQh36Qsc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Mr3QgQnvglC2h+HsvdWypFk1Mi2j1sVT5kvOdmR3H0JVIcono5crb3aB7RO7jMIIn4AIC9IloPBAbB9M9vmBm8lLWXJDyXEnYrfHpY9cJZRLC8Fjlq4AX0tkgfXoJYfSIskUtoOSlOWIEMvun+1NYicladZGdOmYWScyefdlLE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=kJxOn4n4; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="kJxOn4n4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Date:Subject:Cc:To:From:From:Reply-To;
	bh=z4H/BmP04WQBQPg3/nKlwktbVuI8DfmqOLIJyydzAWk=; b=kJxOn4n4bhY8P77STa57RQtSN2
	tv4ClOTMn7C4ievzJ5479Y1HtpX7pd6gtMGmGnHm9HmaWDA4uxmZVLbxT5tHZXmdYsDFGnMynkSVM
	JKG+qUyHN3xhBsDISOuwIzupbGXHYuSxl7mNY8pRnn/LgjQ/GTvDIcQXXCCdIJ7eQDdy9eBitTOV3
	MPXRq/I3NRlHN79tdL8Uu6HfLmZSwzQYiV8APFfCpV2fvpSxL9GSj4DmOdf+yE8NVw6sKmQxXWf5g
	N8trLasZIzgzUKZaO4onAR+SWHyjk4mRrTXvWoj/g77GpnhRAEROIUURGygkdbPt7T38WhUVxKecn
	B3t1bG+A==;
Received: from bl21-120-122.dsl.telepac.pt ([2.82.120.122] helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wwM68-005h0J-9X; Tue, 18 Aug 2026 17:51:32 +0200
From: Luis Henriques <luis@igalia.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>,  Chen Linxuan <me@black-desk.cn>,
  Jonathan Corbet <corbet@lwn.net>,  Shuah Khan
 <skhan@linuxfoundation.org>,  fuse-devel@lists.linux.dev,
  linux-kernel@vger.kernel.org,  linux-kselftest@vger.kernel.org,  Matt
 Harvey <mharvey@jumptrading.com>,  kernel-dev@igalia.com
Subject: Re: [RFC PATCH v2 5/8] selftests/fuse: factor-out test fixture
 setup/teardown
In-Reply-To: <CAOQ4uxgUECPPchwipkH6qg=q1L_Fqg9=_cPOC6wm9TJ27EQqEw@mail.gmail.com>
	(Amir Goldstein's message of "Tue, 18 Aug 2026 15:09:58 +0200")
References: <20260817141156.6079-1-luis@igalia.com>
	<20260817141156.6079-6-luis@igalia.com>
	<CAOQ4uxgUECPPchwipkH6qg=q1L_Fqg9=_cPOC6wm9TJ27EQqEw@mail.gmail.com>
Date: Tue, 18 Aug 2026 16:51:58 +0100
Message-ID: <87lda3e89t.fsf@wotan.olymp>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18 2026, Amir Goldstein wrote:

> On Mon, Aug 17, 2026 at 4:11=E2=80=AFPM Luis Henriques <luis@igalia.com> =
wrote:
>>
>> In order to reduce new tests setup/teardown code duplication, factor-out
>> these functions from the existing acl_cache test.
>
> When I read this I thought you were going to share these helpers with the
> new symlink and readdir cache tests, but you did not.
>
> Maybe a fuse_common.c would make sense to reduce boiler plate
> in new fuse tests.
>
> These helpers and fixture look pretty similar in all three tests.

True.  I'll try to reduce the duplication by moving the common place.

Cheers,
--=20
Lu=C3=ADs


> Thanks,
> Amir.
>
>
>>
>> Signed-off-by: Luis Henriques <luis@igalia.com>
>> ---
>>  .../filesystems/fuse/fuse_acl_cache_test.c    | 82 ++++++++++++-------
>>  1 file changed, 53 insertions(+), 29 deletions(-)
>>
>> diff --git a/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_tes=
t.c b/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
>> index 2411a6e285f1..8bdc90572be2 100644
>> --- a/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
>> +++ b/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
>> @@ -50,6 +50,8 @@
>>
>>  #include "kselftest_harness.h"
>>
>> +#define MAX_ERR_MSG 256
>> +
>>  /* ---- ACL binary encoding -------------------------------------------=
----- */
>>  /*
>>   * POSIX ACL v2 xattr format (little-endian):
>> @@ -193,52 +195,74 @@ FIXTURE(acl_cache) {
>>         pthread_t            thread;
>>  };
>>
>> -FIXTURE_SETUP(acl_cache)
>> +int fs_setup(struct fuse_session **se, char *mountpoint, char *file_pat=
h,
>> +            pthread_t *thread, char *err)
>>  {
>>         char *fuse_argv[] =3D { "fuse_acl_cache_test", NULL };
>>         struct fuse_args args =3D FUSE_ARGS_INIT(1, fuse_argv);
>>
>> -       g_ds.acl            =3D acl_a;
>> -       g_ds.acl_size       =3D sizeof(acl_a);
>> -       g_ds.getxattr_count =3D 0;
>> -
>> -       strcpy(self->mountpoint, "/tmp/acl_cache_test_XXXXXX");
>> -       if (!mkdtemp(self->mountpoint))
>> -               SKIP(return, "mkdtemp: %s", strerror(errno));
>> +       strcpy(mountpoint, "/tmp/acl_cache_test_XXXXXX");
>> +       if (!mkdtemp(mountpoint)) {
>> +               snprintf(err, MAX_ERR_MSG, "mkdtemp: %s", strerror(errno=
));
>> +               return -1;
>> +       }
>>
>> -       snprintf(self->file_path, sizeof(self->file_path),
>> -                "%s/" FILE_NAME, self->mountpoint);
>> +       snprintf(file_path, PATH_MAX, "%s/" FILE_NAME, mountpoint);
>>
>> -       self->se =3D fuse_session_new(&args, &fs_ops, sizeof(fs_ops), NU=
LL);
>> -       if (!self->se) {
>> -               rmdir(self->mountpoint);
>> -               SKIP(return, "fuse_session_new failed");
>> +       *se =3D fuse_session_new(&args, &fs_ops, sizeof(fs_ops), NULL);
>> +       if (!*se) {
>> +               rmdir(mountpoint);
>> +               snprintf(err, MAX_ERR_MSG, "fuse_session_new failed");
>> +               return -1;
>>         }
>>
>> -       if (fuse_session_mount(self->se, self->mountpoint)) {
>> -               fuse_session_destroy(self->se);
>> -               rmdir(self->mountpoint);
>> -               SKIP(return, "fuse_session_mount failed "
>> -                            "(missing fusermount3 or insufficient privi=
leges)");
>> +       if (fuse_session_mount(*se, mountpoint)) {
>> +               fuse_session_destroy(*se);
>> +               rmdir(mountpoint);
>> +               snprintf(err, MAX_ERR_MSG, "fuse_session_mount failed "
>> +                       "(missing fusermount3 or insufficient privileges=
)");
>> +               return -1;
>>         }
>>
>> -       if (pthread_create(&self->thread, NULL, run_daemon, self->se)) {
>> -               fuse_session_unmount(self->se);
>> -               fuse_session_destroy(self->se);
>> -               rmdir(self->mountpoint);
>> -               SKIP(return, "pthread_create: %s", strerror(errno));
>> +       if (pthread_create(thread, NULL, run_daemon, *se)) {
>> +               fuse_session_unmount(*se);
>> +               fuse_session_destroy(*se);
>> +               rmdir(mountpoint);
>> +               snprintf(err, MAX_ERR_MSG, "pthread_create: %s", strerro=
r(errno));
>> +               return -1;
>>         }
>>
>>         fuse_opt_free_args(&args);
>> +
>> +       return 0;
>> +}
>> +
>> +static void fs_teardown(struct fuse_session *se, pthread_t thread,
>> +                       char *mountpoint)
>> +{
>> +       fuse_session_exit(se);
>> +       fuse_session_unmount(se);
>> +       pthread_join(thread, NULL);
>> +       fuse_session_destroy(se);
>> +       rmdir(mountpoint);
>> +}
>> +
>> +FIXTURE_SETUP(acl_cache)
>> +{
>> +       char err[MAX_ERR_MSG];
>> +
>> +       g_ds.acl            =3D acl_a;
>> +       g_ds.acl_size       =3D sizeof(acl_a);
>> +       g_ds.getxattr_count =3D 0;
>> +
>> +       if (fs_setup(&self->se, self->mountpoint, self->file_path,
>> +                    &self->thread, err))
>> +               SKIP(return, err);
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

