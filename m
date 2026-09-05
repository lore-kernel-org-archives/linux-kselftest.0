Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE2835AC1C
	for <linux-kselftest@vger.kernel.org>; Sat,  5 Sep 2026 14:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788616886; cv=pass; b=XMn7KyO2x4YCj6d4GsM9ases/7iLdGTrjdNwO6Cd3Uz2WPuLZJQ7B7jmF3WPs6gnKIuBbrn+I+V0BrFwHC20OG7iSiYFIHibBzyMjgy0cyldxwyUylj5ZHaGhKsaf3CUbcxEFmfh7hTf+eGYqUW2thi8DsgyA971iHuZH+iJcBE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788616886; c=relaxed/simple;
	bh=M7fAdXtBDfEORDW145jXu6v4iUab4x+K54eSd0w9thQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o7MItlcyd/sS1ZfkmLmekEMH6PZkfDQWXr4uSpK7T6XBlkYFYSkkx25PvO5kw79tqKtJ7mHf0Le/E0WSF6l6ojvzQvfSy4oYG91v2g1sf3+SvaMeO1InlS27WubCBxptzAZ84Twje46tHtAzLYbyq12j4WrYDQ81KpsEctb2FSA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sm/6crZo; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sm/6crZo"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a374bea882so2996676a12.1
        for <linux-kselftest@vger.kernel.org>; Sat, 05 Sep 2026 07:01:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788616871; cv=none;
        d=google.com; s=arc-20260327;
        b=V8CURkYX+Ev0i3tCnZGGngJ2RmPazBeDSKMxnkiZeqX4RIkecC3jh8j0d2HvbHoSVn
         8r7n5DGWPxil3U6TXkL3luKKFLPDtQWBlIYmuEjvsUEmovz/WYP9WhLASzBxCwwEaESQ
         L/Sv141yHJd+MZjLQoL4V/FWjSVBNFiYtWr43iEzJerREmU+ouHkLNdXvt15Hf+WXqI9
         QlylXWQjq3P/4EEC7xygbhG5RR7zTpxhVQE+2DYJapNTjFSs5saxOjcS3DOTHmh1L1DA
         +Mh927BbXESd9NKKqvhOflfQhUkWT2BF97RV/kxyclaVv0PtG4zig7zd7t9qGWhVUH8O
         U6Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I+I8QUj3WVciHxoRXxP9OcDrC3AowirtGwOcl3KlFtc=;
        fh=Byv4KN4ANGHEM+0380DOXL5tNODp0cnsRQBjrD3JYT4=;
        b=KTbdHj15z26KEbvhPEGKbdYdzSWahjY+E8ubTFbyVL94oYBzTB+ceTe74OdMruK/fd
         CBEdb0yU8Co+XHzrhOfeCUjiALOa2QtZnZpdhWpbDzwIxqG5NqmOAJ0ws/fzqZnUj2Ma
         /mbTv/PoHEeVkN7NYwPMrf6GMKSkQ2GMTBwU/zXSU0RCR1IzQyzAS/zB1vjf8CLSjWP6
         2OUS8se3cbsbMPKJzVyRw1qnz5HS0e/Fzr+TJ05k0z50Vp6LR0Tme/RYXlBJ7iFAc8mH
         sFSTxgYGsBwyWjSBsdwnCE92Ec+YJaHlcVfjKt/GTukhTeVOCDcDFWRFpFFnsMqbZ5Mz
         cRGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788616871; x=1789221671; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I+I8QUj3WVciHxoRXxP9OcDrC3AowirtGwOcl3KlFtc=;
        b=sm/6crZoqqJb0rHTIh/9PWDyM7U9hV0twURs771oPobP5vsHp2XIQDoL8zBpN7dMNb
         yrdc7KdpFGyhRtmZiQvo/aBi+yIP+qBV/6aNGY5p49IsrIauRQu7ErfTbFSkvk5EaagL
         FkWcmSlJf4KDnlNINBeHs4+SstUkZvXn4HVQytj5WWeiVnAr9gCdxI0IF1UzCz4xhMRJ
         wXd7CnXkBysQRK62h7Kjs61bJZjTmU4NzERGM1HViEd0ZfZ75Px26FEBUKn64etg61bw
         P5Q8qSZMAVZAgseiDqQdrfo4nle4xfQS5Ii//JNX/BlvMIzmYpdiFMi2tFbp8IR2VIYb
         FVTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788616871; x=1789221671;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I+I8QUj3WVciHxoRXxP9OcDrC3AowirtGwOcl3KlFtc=;
        b=BAKQSASkpxl0DpR7OS2PpTT3XnnIKWpxBtv+ytakvtNOcf/Vnjh5D6NZ3NZAv4BvIB
         k3W0xi53c/RlwuLulkERKnwuNId/8G0BFZ9vbQ3XszwD9wRQ5t7XBjOAX+tYHkkdLfiJ
         uvLn6DV/5mPqnVlwGOtabkX4aaJXKL5I15SjK9sbAA9bXvwWmR8gMboX9Hs4mvD1afd1
         9n5Q9CszBht08oPNzfBg5rihLggNDIkZ4RSu1bK10oPo1FklYKa+Ngd1cizXm5eLoI2l
         lVqkwAA64BeucgI7WVK2JZF0S2FVnC6Vb7+2nVAGhm8rQZErqQc6g7mLnP3MiH9toTcb
         5LZw==
X-Forwarded-Encrypted: i=1; AKwUvBzjBiAbhgX800LP2o0atKAOhFLnAVp5y+ctFPNimnSW6qmIpWSXcGcvzJXEHPCsT1c3mgmBWJyULigZVEtyW2A=@vger.kernel.org
X-Gm-Message-State: AFuF++m1RDwKu0g030CvmN80xahMYvegnrC1m0sxrzugbufn6yw8Djf9
	VqlIi5MVjAcSCQ4BivAA0F3KVDXmkljzWViSLeYwTj4Hm1zBJq3cuwW5fBriyKhcfoueTnajMLy
	ed8b5XZY2B+QDN3nEUvRysqrlQqgQVs4=
X-Gm-Gg: AYBFou3qakt09huBm55ptdxjK2MHWbmnyxHdV/WZD5Fdos4VrIl1EJkQWnqBA5LsEZv
	CDdvppNaK4q7S/cGzUHX5qilW7YG2+Lw1Jy8M0oFgOtPCXqgWp/2w6ZvujYPV5WxetevQONbNAm
	rH9QL5UfC4SobJr1KOMhkZEZDelDYMYCvD6zLZNrOVazZE+HVevvC/9xqF7AXq/o5Crk9pdJBwC
	6rXHA+/MC2epBoU+tAXpkcgCJW6h05QA21LT5EFN2Dfb/zIeFHadrK4rrzTBqZ8jlV0+cAEcLHm
	iTmc1e7+sB34BY1L8qPRF+eTPFlAS23K0N+S+BRhqBz80g==
X-Received: by 2002:a05:6402:3220:b0:6a6:3ee3:655a with SMTP id
 4fb4d7f45d1cf-6a7e8d368f2mr9247527a12.3.1788616869820; Sat, 05 Sep 2026
 07:01:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904103920.4471-1-luis@igalia.com> <20260904103920.4471-6-luis@igalia.com>
In-Reply-To: <20260904103920.4471-6-luis@igalia.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sat, 5 Sep 2026 16:00:58 +0200
X-Gm-Features: AcwNN1XVifAlKbq_jupyMk4YvbgYjZtTaM8XtGl9N8tec_dpEk5CYKJCab76ZDY
Message-ID: <CAOQ4uxjMvHdaZfwjkHK3tV6ChsapobpHE9mq8NJSvduOGruvMg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 5/8] selftests/fuse: use dynamically allocated
 memory to store ACLs
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
> Instead of directly using static arrays for the ACL value, allocate memor=
y
> for storing it.  This will make it easier to implement ACL tests that als=
o
> set the xattr dynamically.
>
> Signed-off-by: Luis Henriques <luis@igalia.com>

Reviewed-by: Amir Goldstein <amir73il@gmail.com>
> ---
>  .../filesystems/fuse/fuse_acl_cache_test.c    | 32 ++++++++++++++++---
>  1 file changed, 27 insertions(+), 5 deletions(-)
>
> diff --git a/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test=
.c b/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
> index 12cbf9753d03..c2d6658ff7de 100644
> --- a/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
> +++ b/tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test.c
> @@ -80,7 +80,7 @@ static const uint8_t acl_b[] =3D {
>
>  struct daemon_state {
>         pthread_mutex_t lock;
> -       const uint8_t  *acl;
> +       uint8_t        *acl;
>         size_t          acl_size;
>         int             getxattr_count;
>  };
> @@ -142,15 +142,26 @@ static void fs_getattr(fuse_req_t req, fuse_ino_t i=
no,
>  static void fs_getxattr(fuse_req_t req, fuse_ino_t ino, const char *name=
,
>                         size_t size)
>  {
> +       uint8_t *acl =3D NULL;
> +       size_t acl_size;
> +
>         if (ino !=3D FILE_INO ||
>             strcmp(name, "system.posix_acl_access") !=3D 0) {
>                 fuse_reply_err(req, ENODATA);
>                 return;
>         }
>
> +       if (size) {
> +               acl =3D malloc(size);
> +               if (!acl) {
> +                       fuse_reply_err(req, ENOMEM);
> +                       return;
> +               }
> +       }
>         pthread_mutex_lock(&g_ds.lock);
> -       const uint8_t *acl      =3D g_ds.acl;
> -       size_t         acl_size =3D g_ds.acl_size;
> +       acl_size =3D g_ds.acl_size;
> +       if (acl && (size >=3D acl_size))
> +               memcpy(acl, g_ds.acl, acl_size);
>         g_ds.getxattr_count++;
>         pthread_mutex_unlock(&g_ds.lock);
>
> @@ -160,6 +171,8 @@ static void fs_getxattr(fuse_req_t req, fuse_ino_t in=
o, const char *name,
>                 fuse_reply_err(req, ERANGE);
>         else
>                 fuse_reply_buf(req, (const char *)acl, acl_size);
> +
> +       free(acl);
>  }
>
>  static const struct fuse_lowlevel_ops fs_ops =3D {
> @@ -181,8 +194,10 @@ FIXTURE_SETUP(acl_cache)
>  {
>         char err[MAX_ERR_MSG];
>
> -       g_ds.acl =3D acl_a;
>         g_ds.acl_size =3D sizeof(acl_a);
> +       g_ds.acl =3D malloc(g_ds.acl_size);
> +       ASSERT_NE(g_ds.acl, NULL);
> +       memcpy(g_ds.acl, acl_a, g_ds.acl_size);
>         g_ds.getxattr_count =3D 0;
>
>         if (fs_setup(&self->se, self->mountpoint, &fs_ops, &self->thread,=
 err))
> @@ -195,6 +210,7 @@ FIXTURE_SETUP(acl_cache)
>  FIXTURE_TEARDOWN(acl_cache)
>  {
>         fs_teardown(self->se, self->thread, self->mountpoint);
> +       free(g_ds.acl);
>  }
>
>  static int do_force_statx(const char *path)
> @@ -210,6 +226,7 @@ TEST_F(acl_cache, stale_after_force_sync)
>         char    buf[512];
>         ssize_t sz;
>         int     count;
> +       uint8_t *acl;
>
>         /*
>          * Step 1: two getxattr calls before any statx(FORCE_SYNC).
> @@ -270,8 +287,13 @@ TEST_F(acl_cache, stale_after_force_sync)
>          * !fc->posix_acl mounts (it skips forget_all_cached_acls in that=
 case).
>          * On a fixed kernel the ACL was never cached, so this is moot.
>          */
> +       acl =3D malloc(sizeof(acl_b));
> +       ASSERT_NE(acl, NULL);
> +       memcpy(acl, acl_b, sizeof(acl_b));
> +
>         pthread_mutex_lock(&g_ds.lock);
> -       g_ds.acl      =3D acl_b;
> +       free(g_ds.acl);
> +       g_ds.acl      =3D acl;
>         g_ds.acl_size =3D sizeof(acl_b);
>         pthread_mutex_unlock(&g_ds.lock);
>         TH_LOG("step 4: daemon switched to ACL_B (%zu bytes)", sizeof(acl=
_b));
