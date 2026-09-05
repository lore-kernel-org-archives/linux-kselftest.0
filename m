Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DAD949EC5D
	for <linux-kselftest@vger.kernel.org>; Sat,  5 Sep 2026 12:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788611918; cv=pass; b=I3yWcQgw3KryGHumfl45W8Q2KuR3gJKE0HSzgLVlbzfo7unfqhFPSSba2tXvcbLfizpGV4Lu64XOrJ1gZ/mzVgQxvJ+QvnUNyPDm0FKo8wjZ4PQ6Bt/UfxRFBt5hmHy5M4I6Mwf13BdlR7n3Al21c8G7nOMCfrqArFzF05tLlvk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788611918; c=relaxed/simple;
	bh=/VB8kPsUuiESUyZLNaK7eoeQNFH/O0TKNtSOgdqA5sU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l8PXXAb2P4ZWDHyZsEGmogOaN2C3CJP2O52PZAy+BaGrtAp2zYwdRbzq+fNvVtlo9jVVgyNvOAgDVx99to8DU+QnaJ4XOIP7rxzwx/QOeJBFyFHzY6A6cXV0VVN7i1zsVaVHoJaPUOpNqSTgXhAOzSJOsuuKzae3kUp2pfjgDqo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JF8Ow5yj; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JF8Ow5yj"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a0a4aa99bdso2418191a12.1
        for <linux-kselftest@vger.kernel.org>; Sat, 05 Sep 2026 05:38:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788611915; cv=none;
        d=google.com; s=arc-20260327;
        b=lkDhdkxZ9g5LzkYoMlC1LGaKemzBbYi2hi7kK7daax7Ub+B9vbsbgCBLU6lmX48/UH
         Nqv1AB6b76+E48RCswcD/R/SihX8js06LMOO4jphGFb3K3yNQ5ZQU1zs4/F+vwQyhY87
         AUdCYeuYsN0y3WhP/1pMhPgNQ3zWBQAY+IAifjn2+7WP/VWEiRr9kyaP4/cbrjRysIud
         IOTlxRAXC4JqPM2nDXF0z2vHIiDZHY0VUcsF0WAroHML8XftrY3WmX+UIqS48GTW8CI/
         L9RKkWRhlhXi79I5s3+j3sYpueuJJIu6lbG2VtldHA4yQsIcGxMmSBuHPboxhElm2SXM
         Mpcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qLG7RD9iU+aimxs8BsGNQGssNd0C+fRBfMsrZlcG8GU=;
        fh=NWRHfYnivln8tuELeM9JqGvDhWGHwGiBupEh2bC1rog=;
        b=UsSQUonJ2E1dOgDtNjuLPuyifFh19JyGL5h3C7rYNnnk4KGamA+wGsTUTneshule2i
         kJgAA9JUq8l+FWG+o9TFk+rzWEgEak2Wm2PPam6/TYppT+mUY+nsymjPlV349NaEN22A
         OxopReXEaX1+S7fFlBbn35yqDTw295EEmCtXzpC+i/wr/RCaTJ/TCNi22Q2cdMPH/teY
         agPGZhTPnsS590hYiM0Wi+o+aNfa/nOsMkf8fGAAbJ2L3UWZFImHG5rG3xaLpyOh1z2i
         IP09h8ttZ7sF6ohbgjDRefSbJjUGpT02wTErtZjruoJwCkh8J/mIBWL6xae0X/xFSlOY
         dXsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788611915; x=1789216715; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qLG7RD9iU+aimxs8BsGNQGssNd0C+fRBfMsrZlcG8GU=;
        b=JF8Ow5yjVzTuPuze9HoWLFTO+kwO83VGjNQ3U3U2Q72U76G4cwcwEoLv3lMoAg/M3e
         fVEnIAkzCTiVsrksI5rZbsB++LKXIfKXAFI7c/tfI+ErdLktA8Kh6A8r+zWLvF9nY94J
         DGigDsFRZFmswyRTeaJwSg0nXNET1jqrhC4oXui2FgiwOyMM0ntUGPOtyfsLKsd7eQkA
         A8TqPlwMIBq5wR6zAiW3rHCmMX5t4GNd6w+BUCK2Rz5RevPjUF6yh5qHQDH4/YhRCGwx
         atNP92SUXMie2kgOkCRDWPhOHjT0ngYd2w5+gorA71Zrz24WXxXGiRJWn3RAL1eaM1hU
         gXmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788611915; x=1789216715;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qLG7RD9iU+aimxs8BsGNQGssNd0C+fRBfMsrZlcG8GU=;
        b=VYh1vTkdCm/AhDoFEhqopL27bZKef4RTj5ehsNE45hf2xFwnLkLIBvqw+CF/3QLvz4
         nGQ6AEfVLoB5YYg80Il7z4iOGapVYL4TK1FTbHneeH+eRF9JKXb+ghqy77zRXEJ+ZQUC
         789qu2irE2aDON1E5iprlSBJGYOda7Y4zWxfDPgCVrxYPX5hLxQBkg23baoxppAI/ndZ
         EsNsSm5dKvz0keN21GLm8/mu7ZnYFT9yUcC0DiO7SzC79SmFimyBonvUOpdhg5Xbj5pj
         f8Sx7xA4AI49FbRW+p/WyyujF23lcrn6FMt/Na1kbTnbcltZwLgo02/8IBDro7+F3oXo
         K99A==
X-Forwarded-Encrypted: i=1; AKwUvBw5aC+0bGpe/GbI2VVkymCn0lifHXPC0/3nIJ5BdtaCM0MUFUdrAsKLTTt6kX4UUZkSD6Gl9+3NhownURBoDNc=@vger.kernel.org
X-Gm-Message-State: AFuF++nb4RkzokxFup8MR1idpz90VJbnVG5CVbK34v2I5j/TdVHENSfe
	vpFauRrbGu44xRa4aFzs6vAWXfs+4Yj8UVcRAAHke1XOjhj1cQVj7eXJ0rhCCwWjs3JpxTYw6rH
	BWsB+4pBfFuS9Ug58VumT2bjsaCeQMCRDvTRQ438=
X-Gm-Gg: AYBFou06UNJsr3VsK1dkyWDolqkO5qLb9uhYXhZ2PrI5AqpEG4hdWyFZpmO/p1inYMP
	HxmHa296FxGQ8H780J1h1ebgW7wiLlvJ3To+azqT/QMe2EYA/rHTya69uBQbP7JrNN8y8YxJmYC
	/28Okrw1v5PBDsIunNx9/loAwEjaJXvQI8fnX2lSwV9kfkbtp/+yCC7xed6BH63Bux2Xz1gi2+x
	vDMq+LBZFWWL+igz2IO6KWttEhTyR6GTpv3IlF8HFDzmzNjYKnDhcZLHsfo90RpuU+k6uzWVExV
	RB1hXPOhbJT2FbhNYTD42j6eGAzjKRGQ+/fVvrkmLbxqsWwolkX5BDpz
X-Received: by 2002:a17:907:da4:b0:c26:1649:47af with SMTP id
 a640c23a62f3a-c26164955fcmr405970966b.37.1788611915386; Sat, 05 Sep 2026
 05:38:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904103920.4471-1-luis@igalia.com> <20260904103920.4471-7-luis@igalia.com>
In-Reply-To: <20260904103920.4471-7-luis@igalia.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sat, 5 Sep 2026 14:38:24 +0200
X-Gm-Features: AcwNN1WjNoiriBKtkS17brUNdc8C7v-N5CE5oPlkC6f9qSJ0JKBzPQ3mpwZvTEM
Message-ID: <CAOQ4uxhF6qaAxLFt0UP8nBbZTWVVYf_Y7zgL8Lu9xEnJzg=GiA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 6/8] selftests/fuse: add some extra ACL caching tests
To: Luis Henriques <luis@igalia.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Chen Linxuan <me@black-desk.cn>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Matt Harvey <mharvey@jumptrading.com>, kernel-dev@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 12:38=E2=80=AFPM Luis Henriques <luis@igalia.com> wr=
ote:
>
> This adds some extra tests to ACL caching:
> - Verify that reading ACLs results in the expected number of requests
>   being sent user-space, depending on whether cache is enabled or disable=
d
> - Verify caching behaviour on some caching invalidation scenarios
>
> While there, add test binary to .gitignore.
>
> Signed-off-by: Luis Henriques <luis@igalia.com>
> ---
>  .../selftests/filesystems/fuse/.gitignore     |   1 +
>  .../filesystems/fuse/fuse_acl_cache_test.c    | 179 ++++++++++++++++++
>  2 files changed, 180 insertions(+)
>
> diff --git a/tools/testing/selftests/filesystems/fuse/.gitignore b/tools/=
testing/selftests/filesystems/fuse/.gitignore
> index fb51603fe419..f7f3dd345a50 100644
> --- a/tools/testing/selftests/filesystems/fuse/.gitignore
> +++ b/tools/testing/selftests/filesystems/fuse/.gitignore
> @@ -2,3 +2,4 @@
>  fuse_mnt
>  fusectl_test
>  write_extend_eof_test
> +fuse_acl_cache_test
> diff --git a/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test=
.c b/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
> index c2d6658ff7de..9608a0adb967 100644
> --- a/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
> +++ b/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
> @@ -83,6 +83,7 @@ struct daemon_state {
>         uint8_t        *acl;
>         size_t          acl_size;
>         int             getxattr_count;
> +       bool            cache;
>  };
>
>  /*
> @@ -91,9 +92,17 @@ struct daemon_state {
>   */
>  static struct daemon_state g_ds =3D {
>         .lock =3D PTHREAD_MUTEX_INITIALIZER,
> +       .cache =3D false,
>  };
>
>  /* ---- FUSE lowlevel callbacks ----------------------------------------=
---- */
> +static void fs_init(void *userdata, struct fuse_conn_info *conn)
> +{
> +       pthread_mutex_lock(&g_ds.lock);
> +       if (g_ds.cache)
> +               fuse_set_feature_flag(conn, FUSE_CAP_POSIX_ACL);
> +       pthread_mutex_unlock(&g_ds.lock);
> +}
>
>  static void fs_lookup(fuse_req_t req, fuse_ino_t parent, const char *nam=
e)
>  {
> @@ -115,6 +124,8 @@ static void fs_lookup(fuse_req_t req, fuse_ino_t pare=
nt, const char *name)
>         e.attr.st_ino     =3D FILE_INO;
>         e.attr.st_mode    =3D S_IFREG | 0644;
>         e.attr.st_nlink   =3D 1;
> +       e.attr.st_uid =3D getuid();
> +       e.attr.st_gid =3D getgid();
>         fuse_reply_entry(req, &e);
>  }
>
> @@ -175,10 +186,38 @@ static void fs_getxattr(fuse_req_t req, fuse_ino_t =
ino, const char *name,
>         free(acl);
>  }
>
> +static void fs_setxattr(fuse_req_t req, fuse_ino_t ino, const char *name=
,
> +                           const char *value, size_t size, int flags)
> +{
> +       int ret =3D 0;
> +       uint8_t *acl;
> +
> +       if (ino !=3D FILE_INO)
> +               ret =3D ENOENT;
> +       else if (!strcmp(name, "system.posix_acl_access")) {
> +               acl =3D malloc(size);
> +               if (acl) {
> +                       memcpy(acl, value, size);
> +                       pthread_mutex_lock(&g_ds.lock);
> +                       if (g_ds.acl)
> +                               free(g_ds.acl);
> +                       g_ds.acl =3D acl;
> +                       g_ds.acl_size =3D size;
> +                       pthread_mutex_unlock(&g_ds.lock);
> +               } else
> +                       ret =3D ENOMEM;
> +       } else
> +               ret =3D ENOTSUP;
> +

I am allergic to mismatching {} in if/else statements.
I personally think that code will be cleaner with a goto error
without all these multi nesting levels.

Thanks,
Amir.
