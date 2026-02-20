Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8635423ABBE
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Feb 2026 18:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771610502; cv=pass; b=WaiSGl04nhuJ8sykuNvU1AB/XHxiwWsIQoH/CeJiURUbEEWG2iHXS3E7SNHjMNTSEsWlH6SjitkBYTIgWyI+zXoPJFctNKsf6gX9PHw0ca5ODwJJAIs1xnjKvFDR+07vewqs9CYhoK1SESWR0sZse2uPzVKk2l6VNTfCtdluvuM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771610502; c=relaxed/simple;
	bh=/ExTJNGlpE5IqT17n1+JjF2Vry3iY2HGRkuHp4SOpO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A/TsiOXHbmYzI8yF4JeAyl7RjfvHOLNqiR0J3J4lLsfXNccoVnkZH73uGjY1ZQ3ozqLHXy5y+8TTYXAUkJ8UYaw0KmB65paiZE/xCgZcRWoJWL30voLpjUwuXahp6e7TLP6EUN0FNLo2jpX65zm2p2xaJ1lrdYjkRPcUGQETI8k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QqeJPybR; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QqeJPybR"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-65c4152313fso2700743a12.1
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Feb 2026 10:01:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771610500; cv=none;
        d=google.com; s=arc-20240605;
        b=AH0Y3JCIgKKKdOEepIWetevfh4sY0y2E0ry98eTsNhqO8eTVSodE1ACAQP28RNqj9h
         iKb4Ojq4uWJubr9UJWrDxoF14TRdBeEsAQsdQItagys+xV7dFRhoCjqUQxQSYExsRV6r
         L/8+83u2ppGxJkGEloJ9PrwBDlalk7qBSMQWE2hVeLpga1pEjuHuFgJB4+w0tSmaKTmO
         x/A+pZfR3BCyyWjNkNIN/uEf2VRchcYX84Oqp+B8EciGH0TX2H1aShJOzpmWYUs7Juig
         nms6znlD/NFJNJbZpf0CWLZ4yVtQKY1TRN6JsgzjoxkrTr/4vTfmvOK/gPLvwbwKKZEd
         dmQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mXWsRVT7W81X5HarW7ujq+K0yQZiRQ3sefS+9HVuiEs=;
        fh=JZzKudU8zX0D7v9e4kUZt1BTgWHa+EFOSCSWprspz+g=;
        b=ToLb8wVMzjU1vLfDSDkjOyNZdizvqWKciYDuikOFsZkUybf+MoT2rMxGyhYWm/TeVR
         pggVvQMDrOtWBK6I5go3COln6b0MOcNSoLyuXRQIwFjlEOEjLNpdGOMBull2wH+0lUC8
         RRVYgjS6tY1/Httl+oM6IoM8xirRvAXojxi1CHEfMfRNT50daXAAtsdpIgEyW1RTJoHa
         SvVEEOlFEM5LeRQpjpbY4om/jNjOmqRyaEHVsl8F3X3zNRmSwhXx6gE8sAmr5LjbkHUS
         i6O8Fwlmhm46AsrwipPUWyWVYCaT/+sEdsy3KGGeWez5FfMb3Gy3Zq5cbQK8iIHejY1e
         2q5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771610500; x=1772215300; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mXWsRVT7W81X5HarW7ujq+K0yQZiRQ3sefS+9HVuiEs=;
        b=QqeJPybRLGSHeMJ/OFsJM09BDSFsYFbQ3t4OkN4vv5GyuFG+FCJoIAHfCYEW9ZcNMx
         Esb3AwxclKidVoXWhkLwmsGRkqkgJGeMGzPmJtLsaLdk7pnC+a58b7p91+dX8DOuV4pi
         djMi+T2rX8Egzcf+pncVov8yaCbVXBvdXbfUcQC79mDurp117cjXbRSWY8rZtM1MhEUo
         bPYU82soriTLtcc3dwJRvsh+1cCI7qtVIJ0+VNZtm+k1FMPp0uoBXxaMDVeDw9LfNJDi
         thY1ISYHcx5roiKcN5jUqvt4djY2DHtPjuYJUAYJAtsY5eLxoPU+bRmQmVhOMWQHO1hl
         1fnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771610500; x=1772215300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mXWsRVT7W81X5HarW7ujq+K0yQZiRQ3sefS+9HVuiEs=;
        b=vvNgzaQFJiikXwUe3aBXHh0n0iFrJwZ70w1FJpm2JZFamlb79c2rbLevdYkqPs7KZr
         dU/kb55fdmJgbj/5zOVHkaB71y9NAvqLCkDEg4fKPWETJ6uuJZXL2WzAJ6efHyV5+jDU
         xCdkmAmnuceIYH0yCy5qyGdT69Q0rLhzs0zxiLMk1abrPHd0W+ifYQMTj0HXY7JGKQyx
         oh3ZoDehalVFXqoZy29g1/B9WNcrbTB3TfzYL28NC/SHcnCEpXRP8AcEU1sxHqTGHTK8
         RRAe8wN5ZQSlJWnDbmeEanFznJ1hqpj1USc1cIQQm3ywfyNsCG6BxxBQZQfFL7LzyoUY
         csbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnrAGV/hB7on5XvBoJwr0I6ZtCKxkAvL1nSU6oZrcsq3Su/j8WoRx7Llpw48RRHqIyM4kwTzmvvB/lbbRQ5HU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi4d+DHV5ev1gb+PvdCUslIhXQrNg5SGJgt/RYqYFuqchCuYPm
	JwFLHohAqPIPUrlvFz9hyJ24qtijWHR498FHuxJbANd5KQJsVfTVvlMgKYnL7uvVZN/hEleoQz1
	jBaCuy0AcUqsyPQ1X+iRojp9S3ynBrvo=
X-Gm-Gg: AZuq6aJscseAGjpLmujURuCxWNRKtQw8nBmKBZew2v9mHzfGxkrc9vys7STikY/DazU
	FaUWemKmEDQ88errTQ0fvRsVymjT+Je1YlTjGY00whkehyGV4smCfT4DD5rwwe1HkwHxIN/xi5M
	9oVweLTXq163/dxskymS6h1svKeBUaMWhincwG1GO2WP7KWYxPWk/wwwn+hAr9lFg65vGYmasBf
	anix8QJT2oC7c+GCcJ4Xnd+Wnv/OsRtAMe/h2Vv4lvw/lXkNEU4f76jPke0IYwpXgou20Chdl6d
	2QYqNorj3GAcjTbuNivDmtnN7jZqBJA2iyDP4mXz8g==
X-Received: by 2002:a17:907:1c89:b0:b88:5182:b869 with SMTP id
 a640c23a62f3a-b9081a490f8mr28173866b.23.1771610499642; Fri, 20 Feb 2026
 10:01:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260220055449.3073-1-tjmercier@google.com> <20260220055449.3073-4-tjmercier@google.com>
 <CAOQ4uxiPqUzBQAk8Tic7aFMsHtajEWENCTg+CQPMy5XtmS4kBQ@mail.gmail.com>
 <CABdmKX3Pd8sJpzuQD0tfKCznOy3=cDoAOEnN-COQa59weUFrqw@mail.gmail.com> <CABdmKX0H5Bx7qsk7JmOEnA2NZBHXd+QSYuwXHQGvaN6ppM38NA@mail.gmail.com>
In-Reply-To: <CABdmKX0H5Bx7qsk7JmOEnA2NZBHXd+QSYuwXHQGvaN6ppM38NA@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 20 Feb 2026 20:01:28 +0200
X-Gm-Features: AaiRm5108EmSEAIlvJnftlLPzXZCKopsIxjc3etyrxL3lbPc5X0FWzsfY5M1N74
Message-ID: <CAOQ4uxi8-nc2+b5kjZshaDdfhmt994zUDqJ32B5b+600_Ep48A@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] selftests: memcg: Add tests for IN_DELETE_SELF and IN_IGNORED
To: "T.J. Mercier" <tjmercier@google.com>
Cc: gregkh@linuxfoundation.org, tj@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, jack@suse.cz, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 20, 2026 at 6:53=E2=80=AFPM T.J. Mercier <tjmercier@google.com>=
 wrote:
>
> On Fri, Feb 20, 2026 at 9:46=E2=80=AFAM T.J. Mercier <tjmercier@google.co=
m> wrote:
> >
> > On Fri, Feb 20, 2026 at 9:44=E2=80=AFAM Amir Goldstein <amir73il@gmail.=
com> wrote:
> > >
> > > On Fri, Feb 20, 2026 at 6:55=E2=80=AFAM T.J. Mercier <tjmercier@googl=
e.com> wrote:
> > > >
> > > > Add two new tests that verify inotify events are sent when memcg fi=
les
> > > > or directories are removed with rmdir.
> > > >
> > > > Signed-off-by: T.J. Mercier <tjmercier@google.com>
> > > > Acked-by: Tejun Heo <tj@kernel.org>
> > > > Acked-by: Amir Goldstein <amir73il@gmail.com>
> > > > ---
> > > >  .../selftests/cgroup/test_memcontrol.c        | 112 ++++++++++++++=
++++
> > > >  1 file changed, 112 insertions(+)
> > > >
> > > > diff --git a/tools/testing/selftests/cgroup/test_memcontrol.c b/too=
ls/testing/selftests/cgroup/test_memcontrol.c
> > > > index 4e1647568c5b..57726bc82757 100644
> > > > --- a/tools/testing/selftests/cgroup/test_memcontrol.c
> > > > +++ b/tools/testing/selftests/cgroup/test_memcontrol.c
> > > > @@ -10,6 +10,7 @@
> > > >  #include <sys/stat.h>
> > > >  #include <sys/types.h>
> > > >  #include <unistd.h>
> > > > +#include <sys/inotify.h>
> > > >  #include <sys/socket.h>
> > > >  #include <sys/wait.h>
> > > >  #include <arpa/inet.h>
> > > > @@ -1625,6 +1626,115 @@ static int test_memcg_oom_group_score_event=
s(const char *root)
> > > >         return ret;
> > > >  }
> > > >
> > > > +static int read_event(int inotify_fd, int expected_event, int expe=
cted_wd)
> > > > +{
> > > > +       struct inotify_event event;
> > > > +       ssize_t len =3D 0;
> > > > +
> > > > +       len =3D read(inotify_fd, &event, sizeof(event));
> > > > +       if (len < (ssize_t)sizeof(event))
> > > > +               return -1;
> > > > +
> > > > +       if (event.mask !=3D expected_event || event.wd !=3D expecte=
d_wd) {
> > > > +               fprintf(stderr,
> > > > +                       "event does not match expected values: mask=
 %d (expected %d) wd %d (expected %d)\n",
> > > > +                       event.mask, expected_event, event.wd, expec=
ted_wd);
> > > > +               return -1;
> > > > +       }
> > > > +
> > > > +       return 0;
> > > > +}
> > > > +
> > > > +static int test_memcg_inotify_delete_file(const char *root)
> > > > +{
> > > > +       int ret =3D KSFT_FAIL;
> > > > +       char *memcg =3D NULL;
> > > > +       int fd, wd;
> > > > +
> > > > +       memcg =3D cg_name(root, "memcg_test_0");
> > > > +
> > > > +       if (!memcg)
> > > > +               goto cleanup;
> > > > +
> > > > +       if (cg_create(memcg))
> > > > +               goto cleanup;
> > > > +
> > > > +       fd =3D inotify_init1(0);
> > > > +       if (fd =3D=3D -1)
> > > > +               goto cleanup;
> > > > +
> > > > +       wd =3D inotify_add_watch(fd, cg_control(memcg, "memory.even=
ts"), IN_DELETE_SELF);
> > > > +       if (wd =3D=3D -1)
> > > > +               goto cleanup;
> > > > +
> > > > +       if (cg_destroy(memcg))
> > > > +               goto cleanup;
> > > > +       free(memcg);
> > > > +       memcg =3D NULL;
> > > > +
> > > > +       if (read_event(fd, IN_DELETE_SELF, wd))
> > > > +               goto cleanup;
> > > > +
> > > > +       if (read_event(fd, IN_IGNORED, wd))
> > > > +               goto cleanup;
> > > > +
> > > > +       ret =3D KSFT_PASS;
> > > > +
> > > > +cleanup:
> > > > +       if (fd >=3D 0)
> > > > +               close(fd);
> > > > +       if (memcg)
> > > > +               cg_destroy(memcg);
> > > > +       free(memcg);
> > > > +
> > > > +       return ret;
> > > > +}
> > > > +
> > > > +static int test_memcg_inotify_delete_dir(const char *root)
> > > > +{
> > > > +       int ret =3D KSFT_FAIL;
> > > > +       char *memcg =3D NULL;
> > > > +       int fd, wd;
> > > > +
> > > > +       memcg =3D cg_name(root, "memcg_test_0");
> > > > +
> > > > +       if (!memcg)
> > > > +               goto cleanup;
> > > > +
> > > > +       if (cg_create(memcg))
> > > > +               goto cleanup;
> > > > +
> > > > +       fd =3D inotify_init1(0);
> > > > +       if (fd =3D=3D -1)
> > > > +               goto cleanup;
> > > > +
> > > > +       wd =3D inotify_add_watch(fd, memcg, IN_DELETE_SELF);
> > > > +       if (wd =3D=3D -1)
> > > > +               goto cleanup;
> > > > +
> > > > +       if (cg_destroy(memcg))
> > > > +               goto cleanup;
> > > > +       free(memcg);
> > > > +       memcg =3D NULL;
> > > > +
> > > > +       if (read_event(fd, IN_DELETE_SELF, wd))
> > > > +               goto cleanup;
> > >
> > >
> > > Does this test pass? I expect that listener would get event mask
> > > IN_DELETE_SELF | IN_ISDIR?
> >
> > Yes, I tested on 4 different machines across different filesystems and
> > none of them set IN_ISDIR with IN_DELETE_SELF. The inotify docs say,
> > "may be set"... I wonder if that is wishful thinking?
>
> Oh, very intentional:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/f=
s/notify/inotify/inotify_fsnotify.c?h=3Dv6.19#n109

LOL yeh ok :)

Thanks for checking

Amir.
