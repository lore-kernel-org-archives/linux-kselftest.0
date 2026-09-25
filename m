Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0034D5980
	for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 15:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790351859; cv=pass; b=BrXjhZT6+aNyN1VobOSTSaXvVoOxpKOHa7Z9k8dKm1lh9K0Ol8QuAuhxDDaD1RAMBV603SInNGkqFdU0Is6JYKtTtOc/x3YbgyEXHh/JvRiVtqW7pQ5zXXj1A5KMBRpx9iXE5gquBdAqyRPnd0XJId6v+fm6Q0Nl1vr9ZLc8syU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790351859; c=relaxed/simple;
	bh=+rd9BLTE4a5WJJ+eX0XRtQ3schbzUk6dFpAODuJHfJE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h9R2Jl/q3qx+/MzwEomaxbV9i06e0QvjlIZN61SxTxrmZ2HiEB52FMfOnLsvdXM02ggRupUtaq1T7Vpu7lbx9aNqIJKOmn36wOsUzz9hFbn3TywG/QgiPyNOUY8a6ubcZWqdwzuQqnEqhrsEGM6gFfhp8O19x//I3FTblgLnd5k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gAVYgi67; arc=pass smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gAVYgi67"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a99cd5115bso1829659a12.3
        for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 08:57:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790351855; cv=none;
        d=google.com; s=arc-20260327;
        b=CZyvbXOeRrhREp4igArsKwl/Uw2cw1zGFNHAEA0IwRa8ooAAvwpwzUDNXJSPCVowv/
         4Vos8AwUKU8MgT9Cisd2HJJqS2A59KAj/8IOGskXOuOQkJ/WMGHbrMQk71XvuwP0r3wn
         /ZRhSDZey7ssyZL9Tyfx754gB5WYzzDYs9RZ/XuFIhwigKE2b17zgmJYB31sV7KKKZ7g
         SIv3JFvdhwxlrcx56U4fdhSE8RbSZA3yGOfsOhtgIYMLSk/1Cq0cucw1kG8N4RzLCuK5
         AfOhPsXFycetnXrX2EJRquyS0CVGr04haypgT+4DOx6dM720okWjjmsPY2G4nu8N29Ne
         y+vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nMAg6pX/HlA77Pu3mxpzrHzAZUs7ETdSimrKmiOB8sM=;
        fh=bfy2jwaBz6xkhW07GeDxHXfezxi6mbI3P8aZqzHA8vs=;
        b=jZxOG1ojBG7aDWREIDPY0RqXztbX1/ybFP9IwsaahD9naiKMCffaWvMYp9MBL/OFBR
         Jn9r+2+r0Fb31C0uGYFW42qZg0SRnEHbCd0VOcLZGRzh8b4fqgqgejj06tnMO6IYrq3i
         ay7OGZiWiQTmC/n8VnFD9kSmhVqiehibW0lRqRRSPcgRyb6tTw09o5EZzo8DeKc3huI+
         iM1OP0YY5kImgOJegMmyW4EyZFCR2waow1JQjFPya9zsVl9rxKDAr5LXw5wYFoBG+mjB
         Uqpr/NexVZvIcpZosylXIDVN82EQrJBHqQUwBmEHyp0bDJ+2ix/yEGciSZwpzpp87AYa
         +zMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790351855; x=1790956655; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nMAg6pX/HlA77Pu3mxpzrHzAZUs7ETdSimrKmiOB8sM=;
        b=gAVYgi670zfKUzzOMdMCKrTF6MMXXzY8WhAoWiALNjDT0aSxm1+Laa13xnVRtje+KY
         eXXdZ5NM4LqLNJo91LvvAKoC/F9w5xeM45n/3LOM/psf7agz8GkVuzYPjLgschPnZ+OS
         +M3P6IubLFHbk2NN8pNpO3B6bmRqqtEnhbaSpqfGDeRjl7jowo8Z1YjfFs2ekTXLjDkJ
         kZ3P4eILmpqjwC7qIvvQF9x1+E7b6VatTpajjZNY1gguT6V5fqXkrFL5BdsYkY6z0P8m
         lnxYWQrsxTHxC1ARkai7VLjh+HeYwzXmg6KYIa2Io+l09O05k35N8EImSMZSG3SDXgiJ
         UxUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790351855; x=1790956655;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nMAg6pX/HlA77Pu3mxpzrHzAZUs7ETdSimrKmiOB8sM=;
        b=rFhv9oBpZYEMDHQuxiqiMVC6FcHyh2Ttqm5amLq1QN8s6nu+x07vXeuv/VbGyLxipa
         5fJY74KLSjADcaZIN0tu25icxlQsEmM213dJ5HPG0frYaNgBQUFmN1kDaYk0m6PP7bIf
         qcecUDv9BWFnatBWz/m2qu364sLED5c+QV84R+hfUUdo+FS/bCpbFmvvMwKCe4WnEIyS
         QyD4Jljdhy/7s39dYum9vcl5HGMrC04clAqr7dSHuzBSB9f8plSRgNtOHkbeBkHt0zBu
         tEMeia3/kI7x9CXvBPnpNrBtMO7REpdKdobeVuFX1QV5/ey44b39K7f2h6dwNoopz0ej
         q/DQ==
X-Forwarded-Encrypted: i=1; AKwUvBzHsTZ7DWY7qNOyZVqeZ36l5qinHoSYwqT1AAA1zAv+cZmcHosiaC+G/XuwD577ylUglcjHYlIHy4DEUe2MbHg=@vger.kernel.org
X-Gm-Message-State: AFuF++kCSgRdM+lluN8boK33idJ8NgbitWKx5YMvbVa8RW93NngtZPvl
	nRNg9FzwTTRGz/5UmWhfxzh+7VeedE968cn66wxne/vhvt4d6G6RTvv6Egos8pcFS7jBS1r2dtQ
	6A9ynvYIK4RtiAgl/BOT7CncZ/+Yual9D4LkGU4k=
X-Gm-Gg: AYBFou12Vcf1Zcj93bQ7za4hqacDe/LaWJUJ12FIIDf2a7wGALkmuYxRg83MaTzLD+O
	klxKBw62/QEpojKSd4Zl6bHkHVtHpm7v7CJ/WKlPHFQPJz5j8M6XqlkwwrZFeTkbxXZ5Pd7KuMk
	0f6sTjyK9Efa/umnWq+r2t8LGVAVe5yhwoE7wMDsbieMoRrkjFYIVDvtvcBbLTiXp+aU59PPDaK
	+et+SZ6iK2AkuOts6yHf5NHdpmqlZa4mpNq10YL2o4vTUQJ2t3nxWR6MAHOVT1e/pd1x3gxQ8W0
	ZoveBfnYpwhP6wcysNU+9XBsKTPAI19+hR5Fyrb7LAAY8jqklJh2Zq5Y2cJ61amrC9c=
X-Received: by 2002:a05:6402:3806:b0:6aa:e46b:2ca with SMTP id
 4fb4d7f45d1cf-6aae8f391b3mr2402778a12.30.1790351854413; Fri, 25 Sep 2026
 08:57:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924112858.51392-1-disgoel@linux.ibm.com> <20260924112858.51392-2-disgoel@linux.ibm.com>
In-Reply-To: <20260924112858.51392-2-disgoel@linux.ibm.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 25 Sep 2026 17:57:23 +0200
X-Gm-Features: AclHuK92kTEXDHL8m7s-mwWhA-PfNWKaA3m5DTMfLrf-QlUnLQ-m8TUSXfz_Sqs
Message-ID: <CAOQ4uxgj3RL2roivmha9yeWToR-s9kaBm8WUK1vJ_q7pWOjxOQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ovl: fix wrong layer paths in mountinfo for detached
 mount FDs
To: Disha Goel <disgoel@linux.ibm.com>, brauner@kernel.org
Cc: miklos@szeredi.hu, viro@zeniv.linux.org.uk, jack@suse.cz, shuah@kernel.org, 
	linux-unionfs@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 1:29=E2=80=AFPM Disha Goel <disgoel@linux.ibm.com> =
wrote:
>
> When overlayfs layers are passed as detached mount file descriptors
> (opened with open_tree(OPEN_TREE_CLONE)), ovl_parse_layer() uses d_path()
> to record the layer's path for display in mountinfo.
>
> d_path() walks up the mount tree to the process's filesystem root.  For
> detached mounts this walk stops at the anonymous namespace root instead
> of the real system root, producing a short incorrect path like "/l1"
> instead of the full absolute path.
>
> Export mnt_is_anon() from fs/namespace.c to detect detached mounts.  In
> ovl_parse_layer(), use dentry_path_raw() for detached mounts instead of
> d_path().  dentry_path_raw() walks the dentry chain independent of mount
> namespace and returns the correct fs-relative path.  The path is
> display-only; the actual layer_path used for mounting is always correct.
>
> Also fix the set_layers_via_detached_mount_fds selftest: the mountinfo
> check strings were copy-pasted from the regular (non-detached) test and
> expected absolute /tmp/ paths, causing the test to always fail.
>
> Fixes: a08557d19ef4 ("ovl: specify layers via file descriptors")
> Cc: stable@vger.kernel.org
> Signed-off-by: Disha Goel <disgoel@linux.ibm.com>

Disha,

Thanks for the report!

> ---
>  fs/namespace.c                                |  9 ++++++++
>  fs/overlayfs/params.c                         | 14 ++++++++++-
>  include/linux/mount.h                         |  1 +
>  .../overlayfs/set_layers_via_fds.c            | 23 +++++++++++--------
>  4 files changed, 37 insertions(+), 10 deletions(-)
>
> diff --git a/fs/namespace.c b/fs/namespace.c
> index ae5dc64f8b45..9feefa0a517d 100644
> --- a/fs/namespace.c
> +++ b/fs/namespace.c
> @@ -363,6 +363,15 @@ bool __mnt_is_readonly(const struct vfsmount *mnt)
>  }
>  EXPORT_SYMBOL_GPL(__mnt_is_readonly);
>
> +bool mnt_is_anon(struct vfsmount *mnt)
> +{
> +       struct mount *m =3D real_mount(mnt);
> +       struct mnt_namespace *ns =3D READ_ONCE(m->mnt_ns);
> +
> +       return !IS_ERR_OR_NULL(ns) && is_anon_ns(ns);
> +}
> +EXPORT_SYMBOL_GPL(mnt_is_anon);
> +
>  static inline void mnt_inc_writers(struct mount *mnt)
>  {
>  #ifdef CONFIG_SMP
> diff --git a/fs/overlayfs/params.c b/fs/overlayfs/params.c
> index c93fcaa45d4a..2758ff8426b7 100644
> --- a/fs/overlayfs/params.c
> +++ b/fs/overlayfs/params.c
> @@ -477,7 +477,19 @@ static int ovl_parse_layer(struct fs_context *fc, st=
ruct fs_parameter *param,
>                 layer_path =3D param->file->f_path;
>                 path_get(&layer_path);
>
> -               layer_name =3D d_path(&layer_path, buf, PATH_MAX);
> +               /*
> +                * For detached mounts (open_tree(OPEN_TREE_CLONE)), d_pa=
th()
> +                * resolves against the anonymous namespace root and retu=
rns a
> +                * short fs-relative path rather than a full system path.=
  Use
> +                * dentry_path_raw() instead, which gives the path relati=
ve to
> +                * the filesystem root regardless of mount namespace.  Th=
e name
> +                * is display-only; layer_path itself is always correct.
> +                */
> +               if (mnt_is_anon(layer_path.mnt))
> +                       layer_name =3D dentry_path_raw(layer_path.dentry,
> +                                                    buf, PATH_MAX);
> +               else
> +                       layer_name =3D d_path(&layer_path, buf, PATH_MAX)=
;
>                 if (IS_ERR(layer_name))
>                         return PTR_ERR(layer_name);
>
> diff --git a/include/linux/mount.h b/include/linux/mount.h
> index acfe7ef86a1b..51e9f228c9d1 100644
> --- a/include/linux/mount.h
> +++ b/include/linux/mount.h
> @@ -78,6 +78,7 @@ extern void mnt_make_shortterm(struct vfsmount *mnt);
>  extern struct vfsmount *mnt_clone_internal(const struct path *path);
>  extern bool __mnt_is_readonly(const struct vfsmount *mnt);
>  extern bool mnt_may_suid(struct vfsmount *mnt);
> +extern bool mnt_is_anon(struct vfsmount *mnt);
>
>  extern struct vfsmount *clone_private_mount(const struct path *path);
>  int mnt_get_write_access(struct vfsmount *mnt);
> diff --git a/tools/testing/selftests/filesystems/overlayfs/set_layers_via=
_fds.c b/tools/testing/selftests/filesystems/overlayfs/set_layers_via_fds.c
> index 7a293544233d..12d930fe46be 100644
> --- a/tools/testing/selftests/filesystems/overlayfs/set_layers_via_fds.c
> +++ b/tools/testing/selftests/filesystems/overlayfs/set_layers_via_fds.c
> @@ -686,23 +686,28 @@ TEST_F(set_layers_via_fds, set_layers_via_detached_=
mount_fds)
>         while (getline(&line, &len, f_mountinfo) !=3D -1) {
>                 char *haystack =3D line;
>
> -               if (strstr(haystack, "workdir=3D/tmp/w"))
> +               /*
> +                * Detached mount FDs are resolved via dentry_path_raw(),
> +                * which gives a path relative to the underlying fs root
> +                * (e.g. "/u/upper", "/l1") rather than a full system pat=
h.
> +                */
> +               if (strstr(haystack, "upperdir=3D/u/upper"))
>                         layers_found[0] =3D true;
> -               if (strstr(haystack, "upperdir=3D/tmp/u"))
> +               if (strstr(haystack, "workdir=3D/u/work"))
>                         layers_found[1] =3D true;
> -               if (strstr(haystack, "lowerdir+=3D/tmp/l1"))
> +               if (strstr(haystack, "lowerdir+=3D/l1"))
>                         layers_found[2] =3D true;
> -               if (strstr(haystack, "lowerdir+=3D/tmp/l2"))
> +               if (strstr(haystack, "lowerdir+=3D/l2"))
>                         layers_found[3] =3D true;
> -               if (strstr(haystack, "lowerdir+=3D/tmp/l3"))
> +               if (strstr(haystack, "lowerdir+=3D/l3"))
>                         layers_found[4] =3D true;
> -               if (strstr(haystack, "lowerdir+=3D/tmp/l4"))
> +               if (strstr(haystack, "lowerdir+=3D/l4"))
>                         layers_found[5] =3D true;
> -               if (strstr(haystack, "datadir+=3D/tmp/d1"))
> +               if (strstr(haystack, "datadir+=3D/d1"))
>                         layers_found[6] =3D true;
> -               if (strstr(haystack, "datadir+=3D/tmp/d2"))
> +               if (strstr(haystack, "datadir+=3D/d2"))
>                         layers_found[7] =3D true;
> -               if (strstr(haystack, "datadir+=3D/tmp/d3"))
> +               if (strstr(haystack, "datadir+=3D/d3"))
>                         layers_found[8] =3D true;
>         }
>         free(line);
> --
> 2.45.1
>

Christian,

I confirm that the test is failing on upstream:

# Starting 1 tests from 1 test cases.
#  RUN           set_layers_via_fds.set_layers_via_detached_mount_fds ...
# set_layers_via_fds.c:717:set_layers_via_detached_mount_fds:Expected
layers_found[i] (0) =3D=3D true (1)
# set_layers_via_fds.c:39:set_layers_via_detached_mount_fds:Expected
rmdir("/set_layers_via_fds") (-1) =3D=3D 0 (0)
# set_layers_via_detached_mount_fds: Test terminated by assertion
#          FAIL  set_layers_via_fds.set_layers_via_detached_mount_fds
not ok 1 set_layers_via_fds.set_layers_via_detached_mount_fds
# FAILED: 0 / 1 tests passed.

I could not find a point of regression.
Could it be that the test was merged failing?
That would be strange.

This is how mountinfo of detached layers look like on upstream:
/ /set_layers_via_fds rw,relatime - overlay none
rw,lowerdir+=3D/,lowerdir+=3D/,lowerdir+=3D/,lowerdir+=3D/,datadir+=3D/,dat=
adir+=3D/,datadir+=3D/,upperdir=3D/upper,workdir=3D/work,uuid=3Don,metacopy=
=3Don

Whether the suggested solution is what we want for it, I am not sure.
I also don't recall if we discussed this at the time and whether
there were any decisions about how to present this mountinfo.

Maybe this mountinfo is fine and then we only need to fix the test.

Thanks,
Amir.
