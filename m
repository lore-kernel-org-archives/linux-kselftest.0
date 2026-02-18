Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79771E1DE9
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Feb 2026 08:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771403515; cv=pass; b=JtAbyS2gWqFKZmn8rx/E7IwSN9p7r4cbOZsROmu9wU9kjQw1gj9DKDRQ17wuHTj8Po1QHeC0q1ELGJnt3vrAglnxQ0n29/BmahC+90aDpnrBjhlBHwc63ZZBYU4WEJFb0lznRlaSGKVkNzgN2yNRcecJIbrZJ4zlMGrDMc+UIFs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771403515; c=relaxed/simple;
	bh=g34/cXMgvqM8CAz3Jm7hMSLsp37KovcyCljYWpgZMh8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X9CKj69SUHzrM24UBz1Z6B8K0btMTiBFP15G+4JKZFD/+SGeqfhGZCeosbQEAJ3iwNeyt4zoKYAFhbuRjTC6KSnFKt7KWX+3qU37jiIIctOGTegqy1Gr3t4tXEZyiuM6qFMAleJS80jauNcKQtae5qQs5E5y5IN77a9a6VpQoeg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cV0DEnxP; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cV0DEnxP"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-65a1970b912so995809a12.1
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Feb 2026 00:31:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771403511; cv=none;
        d=google.com; s=arc-20240605;
        b=CZqCu1WVMHWPYlOG/hUoFfEpNfYmlsWSh48Y+UG5kc9qPdIUmBpSQPIEYgXj4fFT/K
         G6bPq8AsN32VPN641s0UPlH0uwa+OMX1rl001Ra178kM76M0H6j4gG8VydWI+p2ltA7D
         SDBWcdFckMg3OedoUmTTi2rfRAXEUxQ4toPw9NCQuHSf5HoaX78swrViUAAJfy1YW2gX
         oVq8JIvBEogNk1vhrUzV2mEgz6Cwt3lUCBhxJ4gS6JeC5UEAU+SpIBdFy71dzEvfFs9F
         zCrFHMD0eL9l54Pb3o3ludTU9MGay8xbPHG5sqr6vbEKzCuBeT2ubE2SYBfUOogeGyo/
         Y1cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T3U76qnvucsTLQ+BdD/Esd8/yZzq4QLRxWdPKbrqOpc=;
        fh=uf7mjdj7StbiF10IAwPZnhr/N1yLLDghwrUx8GT6sq4=;
        b=DmlFDrlK3B+3zSlq2dwh6j66ICJR6CI3vXFPl3oPuhUJm0u5rfvWIn3eUDLDhAi6ZE
         UT5wO+ztTqg8ijmJZbMQ7Idxv1Z0nbDvh+R69HyoztA/7nGGYr1ABd69tO/5Di4vUwbk
         boqci3eCT9ezmckVIhD9ASjHeIf7HdzphyFyvKt0QJDQMSJgCUfVCtLma+LIL8RTrmg6
         1NZwImKf0/MHq8uYEa9MAcVmldl12XyNUSIJIZJQbs3RHRopDWFa4hwrcO4iuGMMBkPr
         a7nGyGirHDQBF8p546f4kJXLQDDutGtaGhJd1xzApxxiKAmgolb+RVmgNf4uPfcdePz1
         Esnw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771403511; x=1772008311; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T3U76qnvucsTLQ+BdD/Esd8/yZzq4QLRxWdPKbrqOpc=;
        b=cV0DEnxPnsQlkkqBoKaJBnR9i1cJOj5Ru4XBw6d/4t6WYqZol6c/Rbg8DXX1lSuzMt
         NIQhNbv+VUpFyMhdhKtwNP3b2U0XLEzOBaw1HWYP8hYbBtKZjLTYgOAn1jTebwrv0oYt
         D3KOnJZzFbY/lbxTkUlkuF2Tym2dUh1C+/yPV+o183OvaoTKivCEx6dupgrq4JyJNpAm
         ITiNuqapI/kBnRVks42K/JqKr5BbX6fY9dVENXb0XoStRY0/xJtwLIWEgrhRYhJR/Izb
         t/JqDZaAVKQOXy/nIXzHstKYshLIGZ660aXxQy5QwSgrfGJCd0PB8YfuAs+lUvGxPApY
         Izeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771403511; x=1772008311;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T3U76qnvucsTLQ+BdD/Esd8/yZzq4QLRxWdPKbrqOpc=;
        b=jnV61nA0fjDtjWq1+qhsIKVg9kcCY9FcBqR3KyWFdyNrdHsujdjfAB3RAEME41XFZc
         WuedANkAkP5BXsvxsSze3GDJBE+j89cam/M5mWkm3fGshwha3zClA9uiwHoSgZhSNHTp
         vo5laGGQUOSWSlxdrqPAHbL85EZHneQggdy2B1gtaPmO8cRyI/KUPLs2hAKy4MHAWy9N
         r5qlzlUXDn0cuXdLJ0TDfHI5+4KKRNDXPLzQU9LnOUFfxuImibaQlk9zwAxlqHa+mXP+
         qrlGlaC7M0PHO5YSC82EmKV8Uym3F80BVSm8fkDIgEJDEzvFLfY8r+hqD5CbqrWFeM4x
         sf5w==
X-Forwarded-Encrypted: i=1; AJvYcCWqTiO7kWKrzV1ft/wMxa/AD33XdFwVbGDpwfLsi/KtcsFk3qoAIn5/OG2sSnAlOOti/rrxY37DN1SgyVHNxWM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHGaK/bgyaE1illYxql+Kkj0EwhnwT2qiTybbs7uiL/tvQtTU2
	YArWGjst3aZPMUWSNPLJQIQcqaLNzpZPm+pM5Y23cwOqDtdo8oHIM97h+0jLCMjvNsC+eAZHbs1
	oEPvm0oiNXqKMDSS6zN2kyzl74+XXzPajbUq3
X-Gm-Gg: AZuq6aKN4NTDc+shZfnI/jkl6JZUIP8ZBmYVs/Nh15HaZgiBCN8NCTVT5ocAq08vpgO
	096n3ZXU3qzhbZVDrbLhuoU0sdLrsqUKgeQ4LMP+0SWALEtGG95tvzySNkNvAqy43zUrHreAJKn
	PkghtVx/XoVjXHTCsPwsfKGiz8r8Q7N3xxbHrjar1RHPxfvZqjXHmNeB7QnsrWhdBlnbed1ZXv3
	uYkgzLVsaDt0VynmLVLMPOFiKfG5RVTwASypTT/gxmgdHQ3OifKvHHLuuckNxkBDjnD98y4jBWI
	Pzs6zY4n
X-Received: by 2002:a05:6402:1141:b0:65a:4207:fbf0 with SMTP id
 4fb4d7f45d1cf-65c7720cc7bmr375715a12.15.1771403510892; Wed, 18 Feb 2026
 00:31:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260218032232.4049467-1-tjmercier@google.com> <20260218032232.4049467-4-tjmercier@google.com>
In-Reply-To: <20260218032232.4049467-4-tjmercier@google.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 18 Feb 2026 09:31:39 +0100
X-Gm-Features: AaiRm53vob00Ykj2SozMaQzwl7X3rV4VFQLdOBL-uAsZ0fNoE8t3B9B1XVNGy1c
Message-ID: <CAOQ4uxh4js=3yk_RxjY5AZmC4kCMVJzbq+4Wnn3mky-_i75QMw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] selftests: memcg: Add tests IN_DELETE_SELF and
 IN_IGNORED on memory.events
To: "T.J. Mercier" <tjmercier@google.com>
Cc: gregkh@linuxfoundation.org, tj@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, jack@suse.cz, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 18, 2026 at 5:22=E2=80=AFAM T.J. Mercier <tjmercier@google.com>=
 wrote:
>
> Add two new tests that verify inotify events are sent when memcg files
> are removed.
>
> Signed-off-by: T.J. Mercier <tjmercier@google.com>
> Acked-by: Tejun Heo <tj@kernel.org>

Feel free to add:
Acked-by: Amir Goldstein <amir73il@gmail.com>

Although...

> ---
>  .../selftests/cgroup/test_memcontrol.c        | 122 ++++++++++++++++++
>  1 file changed, 122 insertions(+)
>
> diff --git a/tools/testing/selftests/cgroup/test_memcontrol.c b/tools/tes=
ting/selftests/cgroup/test_memcontrol.c
> index 4e1647568c5b..2b065d03b730 100644
> --- a/tools/testing/selftests/cgroup/test_memcontrol.c
> +++ b/tools/testing/selftests/cgroup/test_memcontrol.c
> @@ -10,6 +10,7 @@
>  #include <sys/stat.h>
>  #include <sys/types.h>
>  #include <unistd.h>
> +#include <sys/inotify.h>
>  #include <sys/socket.h>
>  #include <sys/wait.h>
>  #include <arpa/inet.h>
> @@ -1625,6 +1626,125 @@ static int test_memcg_oom_group_score_events(cons=
t char *root)
>         return ret;
>  }
>
> +static int read_event(int inotify_fd, int expected_event, int expected_w=
d)
> +{
> +       struct inotify_event event;
> +       ssize_t len =3D 0;
> +
> +       len =3D read(inotify_fd, &event, sizeof(event));
> +       if (len < (ssize_t)sizeof(event))
> +               return -1;
> +
> +       if (event.mask !=3D expected_event || event.wd !=3D expected_wd) =
{
> +               fprintf(stderr,
> +                       "event does not match expected values: mask %d (e=
xpected %d) wd %d (expected %d)\n",
> +                       event.mask, expected_event, event.wd, expected_wd=
);
> +               return -1;
> +       }
> +
> +       return 0;
> +}
> +
> +static int test_memcg_inotify_delete_file(const char *root)
> +{
> +       int ret =3D KSFT_FAIL;
> +       char *memcg =3D NULL, *child_memcg =3D NULL;
> +       int fd, wd;
> +
> +       memcg =3D cg_name(root, "memcg_test_0");
> +
> +       if (!memcg)
> +               goto cleanup;
> +
> +       if (cg_create(memcg))
> +               goto cleanup;
> +
> +       if (cg_write(memcg, "cgroup.subtree_control", "+memory"))
> +               goto cleanup;
> +
> +       child_memcg =3D cg_name(memcg, "child");
> +       if (!child_memcg)
> +               goto cleanup;
> +
> +       if (cg_create(child_memcg))
> +               goto cleanup;
> +
> +       fd =3D inotify_init1(0);
> +       if (fd =3D=3D -1)
> +               goto cleanup;
> +
> +       wd =3D inotify_add_watch(fd, cg_control(child_memcg, "memory.even=
ts"), IN_DELETE_SELF);
> +       if (wd =3D=3D -1)
> +               goto cleanup;
> +
> +       cg_write(memcg, "cgroup.subtree_control", "-memory");
> +
> +       if (read_event(fd, IN_DELETE_SELF, wd))
> +               goto cleanup;
> +
> +       if (read_event(fd, IN_IGNORED, wd))
> +               goto cleanup;
> +
> +       ret =3D KSFT_PASS;
> +
> +cleanup:
> +       if (fd >=3D 0)
> +               close(fd);
> +       if (child_memcg)
> +               cg_destroy(child_memcg);
> +       free(child_memcg);
> +       if (memcg)
> +               cg_destroy(memcg);
> +       free(memcg);
> +
> +       return ret;
> +}
> +
> +static int test_memcg_inotify_delete_rmdir(const char *root)
> +{
> +       int ret =3D KSFT_FAIL;
> +       char *memcg =3D NULL;
> +       int fd, wd;
> +
> +       memcg =3D cg_name(root, "memcg_test_0");
> +
> +       if (!memcg)
> +               goto cleanup;
> +
> +       if (cg_create(memcg))
> +               goto cleanup;
> +
> +       fd =3D inotify_init1(0);
> +       if (fd =3D=3D -1)
> +               goto cleanup;
> +
> +       wd =3D inotify_add_watch(fd, cg_control(memcg, "memory.events"), =
IN_DELETE_SELF);
> +       if (wd =3D=3D -1)
> +               goto cleanup;
> +
> +       if (cg_destroy(memcg))
> +               goto cleanup;
> +       free(memcg);
> +       memcg =3D NULL;
> +
> +       if (read_event(fd, IN_DELETE_SELF, wd))
> +               goto cleanup;
> +
> +       if (read_event(fd, IN_IGNORED, wd))
> +               goto cleanup;
> +
> +       ret =3D KSFT_PASS;
> +
> +cleanup:
> +       if (fd >=3D 0)
> +               close(fd);
> +       if (memcg)
> +               cg_destroy(memcg);
> +       free(memcg);
> +
> +       return ret;
> +}
> +
>  #define T(x) { x, #x }
>  struct memcg_test {
>         int (*fn)(const char *root);
> @@ -1644,6 +1764,8 @@ struct memcg_test {
>         T(test_memcg_oom_group_leaf_events),
>         T(test_memcg_oom_group_parent_events),
>         T(test_memcg_oom_group_score_events),
> +       T(test_memcg_inotify_delete_file),
> +       T(test_memcg_inotify_delete_rmdir),

How about another test case:
- Watch the cgroup directory (not the child file)
- Destroy cgroup
- Expect IN_DELETE_SELF | IN_ISDIR

I realize that this test won't pass with your implementation (right?)
but that is not ok IMO.

If we wish to make IN_DELETE_SELF available for kernfs,
it should not be confined to regular files IMO.

Thanks,
Amir.
