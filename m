Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05280338936
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Feb 2026 22:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771455373; cv=pass; b=OJg5ihMX+O+rY/x8N2s0WOYacbEwiaOP1qYDN7+qObzdilhTadSX5mBbzw7NRVdaH+2co8oEqEgbPIYhHgNnEdMngWayHItO7bC4yd+YRCPePikxx9CRpk5K6QFi+HTe78wZYx6wr/0qC0PdARLh8elBVmtyQV6KmCn4nB5mJPI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771455373; c=relaxed/simple;
	bh=JCFoaESIl/QxCrjmGNPhcuSnGB4Slki2xY4HPtQx/4s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f6KLqMLOAfyRpg0sIzmsYP0ZzfaZMqyxaduds3u2QuFjM2nLetF8lB4OrICqSlieBRM3Low8qRmsfM59rQu0ZAuGza0TNCRvxGS2UpdYkLoa92BsLcTGfAVpli0eQJHuRsEgM+GbBHMf+sSbIfpj+Fv1fYsD52wOxd0immlspvU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ShmlCCdd; arc=pass smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ShmlCCdd"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4806b0963a9so27075e9.0
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Feb 2026 14:56:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771455370; cv=none;
        d=google.com; s=arc-20240605;
        b=OUrKqxufY+JvvQ0mpXAdYoQsJeUiLIWileG87uzlCoq4dh7JPMqFYqW3CxgNJMB//O
         /dIGz3zWb+m85iGdvraaLP8O9RZn8qogCIg04eVG3/MInw3nsiAbffbHZksxN4Ob7WLa
         EzDrKUP0EEi7dqImeQQllS1//8D8cOMf2eDiHxRYjndypMCv5dsmFlY3zb/frMamdwE9
         8DTzcYLnFE2GlMipAeVenZKKvrtX0LF5lG3KfU8rlM1tPtZfbobuK+K5TDtiGI1poryy
         5HOf39Chn9nNLeNrbLbEzsEt7B3YIL8uTx0Yih24j0QM+Gn/XSCZ7UPdvItE7I/GOibR
         iDSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ObMI2eFUctqy8D6J4/YNbtZUvjU4iP4F1TUzixbIpBQ=;
        fh=QZ4Hvv/XfAS0Rl/VvTE6ca4p6rQ0UB4lFWWU8Y6Nlyc=;
        b=Lw1sN/4twCJDzv/3wYK+ElDajGmsTiLKhylTk+EfhJAuIpL747XAU4RlbwQlwKA0qM
         Lnay4sHzAHC0eoNXE+WDHbC1UsKoUE3P+6pV1Pb1JG5CEeackEuvpNWUxxzyT0ezDsew
         oZ/9rAC/HxU/mMXM4aO3EebDZVdm7scEo9OR7D+ign/39DysdZGzVVNGQOXvb91oRhGb
         E1Rj/VeV5hS9k8P/XMG9cSYfsJmdG1+8PhcbSCvkrEWATphZu7mffgUjhaslP0Op2Cfi
         sy7SJAFO9h9ARuLkG6TIuAgevvOKqa4K057m8dNUIP5yz0AT0VlAdN1juDrnCKC73Wkl
         ag+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771455370; x=1772060170; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ObMI2eFUctqy8D6J4/YNbtZUvjU4iP4F1TUzixbIpBQ=;
        b=ShmlCCdd4EYuW9SOyL9+33ELtNZugmxb1vZGD+0++2FLl3YTln9waf8vfCSGY6ZD0x
         jP+RLd04LGQpO/oDCeie7WdtsLBJejFnTFwQ6xsRLodaPWPoXWDrm1MD7Qvm47axmHgd
         dw7hLe4igMVXsKucUSRXovB+QY9Srq2PAvp5/tYJR3J0k9/qAHCN4xh0QIagY9Ne0ioE
         7qEpB3pz5U0X5Pao/4YTDCP/hyhecbXvIlyADXefqBYPi/zcpViDvqMC3lS+yf1274Ox
         VqROLP0iXNQlAhM7GctLHzXu8KqdHArPrAmF4Ws2mGmmwCKuYiqQjmdNvRsdC2egNbpu
         kQoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771455370; x=1772060170;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ObMI2eFUctqy8D6J4/YNbtZUvjU4iP4F1TUzixbIpBQ=;
        b=le5ItE/x7JPY/+yaSow84jy+e3eTr3mT6kwDzXy/oEpmpylXblwQHA/MDWKFvZPolP
         ih/8NbKmlUyQv/MxaOaEYum3SV77urGFjCSqWhZFotNl0HoXBQnHHe2L+mGFyY1bDnRr
         uhFJ/34ozG3gm1YW72u5NuOzAsyGMh6XeFX0sXGe7Feh//EwrZ/V0q+GhJIe/JrssaHb
         CA3Lhnin9G6Pj8j9RR8cPRoiXeUASa510Q5O7gb0HaJZraEL/XgB8tkWQI3ZExOldWNz
         4dZ7iSDB8txXjsfz1n1Xt880tp1w7lqUMoAW5jTrkqxMHYIb6EEPgE+lYoW6rNmjr9WI
         A9rw==
X-Forwarded-Encrypted: i=1; AJvYcCXWK+z5dUqZ4mpH2ShGIRqC7i/F3b4F/kLmpMsAgQGjcQNg3hN1rF1hF+uOnNKlpVBGo5A1ONsqDDNB+bu3iv4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxL6D8vKrLNfmXkxV7fcUaeKps3Dyk1e0msYIBQs1x9wWhLpqw/
	r3EG1kRMBEJ37YISyRHGh0rHLJhzsh7QgaM1qYx5h9HdhLoZptHAOnKrS3Axnpz9qVk0bFWb1o5
	tkBI+4jT0+tEaC9fvUt6c/HUIrdEM4Lrf3oRSMVoz
X-Gm-Gg: AZuq6aIve23Ya3e1tV9nIppCgfxVn5WHR6wp41PeKugD7NT/fJEFnujfy6TKU4IJ8yD
	/o9FEd5JQbHY6iqQOJWq9c9pCd7EwNkVGR+zbntR+EKebQ6WLhUH2rvHYZE4ZkRJZP1TpDlAimf
	/HJKrxRpJE/8uwWUDFRsiLLcGn41qQF9Dv6qC3XLOrllP4mxu2yBrAdCrNBqvog3nDZT6ZEPZji
	Qgp8cd0/HSVEkGFXneNkE6tZPoif//3Xfl4HA/XHiP5Kin3wFBz/+Q019MIqSnTUhVd+HUB7tTg
	8rA7uIgFKtseHkDxN/j8j/7zvvDbex5cLtqyn9Y4K0JQjHZX/CpMIhhY1GzG3Bdr6autUup45gp
	Zpca6
X-Received: by 2002:a05:600c:b4c:b0:477:2f6f:44db with SMTP id
 5b1f17b1804b1-4839fc2b05cmr17515e9.5.1771455370121; Wed, 18 Feb 2026 14:56:10
 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260218032232.4049467-1-tjmercier@google.com>
 <20260218032232.4049467-4-tjmercier@google.com> <CAOQ4uxh4js=3yk_RxjY5AZmC4kCMVJzbq+4Wnn3mky-_i75QMw@mail.gmail.com>
In-Reply-To: <CAOQ4uxh4js=3yk_RxjY5AZmC4kCMVJzbq+4Wnn3mky-_i75QMw@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 18 Feb 2026 14:55:58 -0800
X-Gm-Features: AaiRm50YpaIIErmI92nhYeTavLIal9YPKGY4uR1R97u7wbwoJ0wYYjhpDKRvR7o
Message-ID: <CABdmKX08hFBq3myZqecr1rEYpGMo5xBGJVfB1aNz7t95-8bySQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] selftests: memcg: Add tests IN_DELETE_SELF and
 IN_IGNORED on memory.events
To: Amir Goldstein <amir73il@gmail.com>
Cc: gregkh@linuxfoundation.org, tj@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, jack@suse.cz, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 18, 2026 at 12:31=E2=80=AFAM Amir Goldstein <amir73il@gmail.com=
> wrote:
>
> On Wed, Feb 18, 2026 at 5:22=E2=80=AFAM T.J. Mercier <tjmercier@google.co=
m> wrote:
> >
> > Add two new tests that verify inotify events are sent when memcg files
> > are removed.
> >
> > Signed-off-by: T.J. Mercier <tjmercier@google.com>
> > Acked-by: Tejun Heo <tj@kernel.org>
>
> Feel free to add:
> Acked-by: Amir Goldstein <amir73il@gmail.com>

Thanks!

> Although...
>
> > ---
> >  .../selftests/cgroup/test_memcontrol.c        | 122 ++++++++++++++++++
> >  1 file changed, 122 insertions(+)
> >
> > diff --git a/tools/testing/selftests/cgroup/test_memcontrol.c b/tools/t=
esting/selftests/cgroup/test_memcontrol.c
> > index 4e1647568c5b..2b065d03b730 100644
> > --- a/tools/testing/selftests/cgroup/test_memcontrol.c
> > +++ b/tools/testing/selftests/cgroup/test_memcontrol.c
> > @@ -10,6 +10,7 @@
> >  #include <sys/stat.h>
> >  #include <sys/types.h>
> >  #include <unistd.h>
> > +#include <sys/inotify.h>
> >  #include <sys/socket.h>
> >  #include <sys/wait.h>
> >  #include <arpa/inet.h>
> > @@ -1625,6 +1626,125 @@ static int test_memcg_oom_group_score_events(co=
nst char *root)
> >         return ret;
> >  }
> >
> > +static int read_event(int inotify_fd, int expected_event, int expected=
_wd)
> > +{
> > +       struct inotify_event event;
> > +       ssize_t len =3D 0;
> > +
> > +       len =3D read(inotify_fd, &event, sizeof(event));
> > +       if (len < (ssize_t)sizeof(event))
> > +               return -1;
> > +
> > +       if (event.mask !=3D expected_event || event.wd !=3D expected_wd=
) {
> > +               fprintf(stderr,
> > +                       "event does not match expected values: mask %d =
(expected %d) wd %d (expected %d)\n",
> > +                       event.mask, expected_event, event.wd, expected_=
wd);
> > +               return -1;
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +static int test_memcg_inotify_delete_file(const char *root)
> > +{
> > +       int ret =3D KSFT_FAIL;
> > +       char *memcg =3D NULL, *child_memcg =3D NULL;
> > +       int fd, wd;
> > +
> > +       memcg =3D cg_name(root, "memcg_test_0");
> > +
> > +       if (!memcg)
> > +               goto cleanup;
> > +
> > +       if (cg_create(memcg))
> > +               goto cleanup;
> > +
> > +       if (cg_write(memcg, "cgroup.subtree_control", "+memory"))
> > +               goto cleanup;
> > +
> > +       child_memcg =3D cg_name(memcg, "child");
> > +       if (!child_memcg)
> > +               goto cleanup;
> > +
> > +       if (cg_create(child_memcg))
> > +               goto cleanup;
> > +
> > +       fd =3D inotify_init1(0);
> > +       if (fd =3D=3D -1)
> > +               goto cleanup;
> > +
> > +       wd =3D inotify_add_watch(fd, cg_control(child_memcg, "memory.ev=
ents"), IN_DELETE_SELF);
> > +       if (wd =3D=3D -1)
> > +               goto cleanup;
> > +
> > +       cg_write(memcg, "cgroup.subtree_control", "-memory");
> > +
> > +       if (read_event(fd, IN_DELETE_SELF, wd))
> > +               goto cleanup;
> > +
> > +       if (read_event(fd, IN_IGNORED, wd))
> > +               goto cleanup;
> > +
> > +       ret =3D KSFT_PASS;
> > +
> > +cleanup:
> > +       if (fd >=3D 0)
> > +               close(fd);
> > +       if (child_memcg)
> > +               cg_destroy(child_memcg);
> > +       free(child_memcg);
> > +       if (memcg)
> > +               cg_destroy(memcg);
> > +       free(memcg);
> > +
> > +       return ret;
> > +}
> > +
> > +static int test_memcg_inotify_delete_rmdir(const char *root)
> > +{
> > +       int ret =3D KSFT_FAIL;
> > +       char *memcg =3D NULL;
> > +       int fd, wd;
> > +
> > +       memcg =3D cg_name(root, "memcg_test_0");
> > +
> > +       if (!memcg)
> > +               goto cleanup;
> > +
> > +       if (cg_create(memcg))
> > +               goto cleanup;
> > +
> > +       fd =3D inotify_init1(0);
> > +       if (fd =3D=3D -1)
> > +               goto cleanup;
> > +
> > +       wd =3D inotify_add_watch(fd, cg_control(memcg, "memory.events")=
, IN_DELETE_SELF);
> > +       if (wd =3D=3D -1)
> > +               goto cleanup;
> > +
> > +       if (cg_destroy(memcg))
> > +               goto cleanup;
> > +       free(memcg);
> > +       memcg =3D NULL;
> > +
> > +       if (read_event(fd, IN_DELETE_SELF, wd))
> > +               goto cleanup;
> > +
> > +       if (read_event(fd, IN_IGNORED, wd))
> > +               goto cleanup;
> > +
> > +       ret =3D KSFT_PASS;
> > +
> > +cleanup:
> > +       if (fd >=3D 0)
> > +               close(fd);
> > +       if (memcg)
> > +               cg_destroy(memcg);
> > +       free(memcg);
> > +
> > +       return ret;
> > +}
> > +
> >  #define T(x) { x, #x }
> >  struct memcg_test {
> >         int (*fn)(const char *root);
> > @@ -1644,6 +1764,8 @@ struct memcg_test {
> >         T(test_memcg_oom_group_leaf_events),
> >         T(test_memcg_oom_group_parent_events),
> >         T(test_memcg_oom_group_score_events),
> > +       T(test_memcg_inotify_delete_file),
> > +       T(test_memcg_inotify_delete_rmdir),
>
> How about another test case:
> - Watch the cgroup directory (not the child file)
> - Destroy cgroup
> - Expect IN_DELETE_SELF | IN_ISDIR
>
> I realize that this test won't pass with your implementation (right?)
> but that is not ok IMO.

Yes, that is correct, but I don't think any docs mention support for
monitoring kernfs directories, only files.

> If we wish to make IN_DELETE_SELF available for kernfs,
> it should not be confined to regular files IMO.

Based on what Honza discovered about i_nlink, it looks like we could
get VFS to send IN_DELETE_SELF for kernfs dirs with something like
this:

@@ -1540,6 +1558,9 @@ static void __kernfs_remove(struct kernfs_node *kn)
                         if (kernfs_type(pos) =3D=3D KERNFS_FILE)
                                kernfs_notify_file_deleted(pos);
+                        else if (kernfs_type(pos) =3D=3D KERNFS_DIR)
+                               kernfs_clear_inode_nlink(pos); <--
calls clear_nlink(inode); for every super

But I don't have a use for it at the moment.
