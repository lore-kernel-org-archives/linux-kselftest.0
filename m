Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800E42FD1A1
	for <linux-kselftest@vger.kernel.org>; Sun, 22 Mar 2026 01:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774141532; cv=pass; b=Nos7BJzVJYaainDMLQ2BH50IJtNk/tgmn7ehKY8HgDlVukNHPPTgADZrAMnNQ+My/B4mdrY5QQZBZ2kuf01S0+viONoj3Dgk/Ld1zVoRoYRgpI5UZfhW7DUIYun+zVpZyKB4ugWgxtC0Ag5VVq6TP+Xk10eVwFZPWRZSXync+7A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774141532; c=relaxed/simple;
	bh=11mgqqe7SKhI5UFGsfbHm/kovDNRlUSdS9YbtwLN2as=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=j6pUdPoj34XgueCRSCDmxd8E9aASX2lK5X5JN00UW6asAbYe3edq+pm0OkTCJtQcKlsoRl2Gp9qEJ23PLKTpfKxmvo3ShPEQ2vMmK4prYeFSXhgJM+OSZR/QZx00qbfPlBYl46sdrPAUBINmnHVFKPr5A0FNQLsVWllHidMCebg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=Mb4qqQVV; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="Mb4qqQVV"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-669462b0fecso1638262a12.3
        for <linux-kselftest@vger.kernel.org>; Sat, 21 Mar 2026 18:05:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774141529; cv=none;
        d=google.com; s=arc-20240605;
        b=VAw6VX/unBzXFSV21JEiS0XaDyOS+qhB22cG1Q0LW9II8NKe5NWBrAHj3fvrIzvAek
         cqz1mdQO95d8ob0AL35Vc/SnlOdlIdvB2Z+EyoEMTTmCQ+eHOBuuyVsxf3MUaNiao+Q1
         gnWLKsDz0Et4nmJGCGgBqUCO1/CrRvl6qzD/cFvynzxsMBYJf1k4puY3AEjusPtU6+Ev
         XMwDaGV29fjXJ9Y2rlkSka/yGgP+eemFQ3MFyWCNX7skOZWecBOTHgUdNIPV6Qqks1p/
         dWasRUSdJMQuvdh1eVHug+D0eRPT4aNF9teTpPa1y/5UxFkGwCL9Zht4nhLMiJVeBT1m
         FAHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z71A4A/9WIsYeL7CrSvLjwvAwzNvfNtlpf1MFBL4KRA=;
        fh=jfWAcPtiShZpB77VQQfn1wzcqsx55mZo4EczTjh/wKU=;
        b=I+CxIGWSFZfDs7AfAYuRcbUTnN4Zo1uxWwkFSzRczca+wDhoNSJotNBOviKtoJ6wCU
         AOoBO6Vnw0JbO+cRVNmKmonuEuOGZpsT2dP9QwH7AmOXeK+JoMqRTcWYmr2emKvhveSv
         jZPzUVrne3joVANjI3hak0cBcUaOe96BbBZVKT228yOb9r4Lw60DZptQq+N78Mj61rac
         GcoYvrUNJAudQd0h8Dfzv1PU7/hbCsaa10ItVytWFgMZkgTe46jW+a7feXbv0QRyt+bS
         q188D7G74fVcsgBkUcA9qtKDBXabxtXkf7wFZHuzgiD5q7sAaYnvbgmKacD0WgeV4b1f
         lCCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1774141529; x=1774746329; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z71A4A/9WIsYeL7CrSvLjwvAwzNvfNtlpf1MFBL4KRA=;
        b=Mb4qqQVVDJB1jbdJIbTFZnSuM2KwOnFoNIDPaQGelz8XWQLuvPvwS37HxV3gg0xRyg
         HmYSp3W6N0/WPgfIRcA19cR9TWJWZSdAhwI2onGgT/d+LuYPKSq8h/sS+agl0ZnJIrD+
         2l07dWyT3YjoUdXuEYywOq8k+9RQlHFEeI1Fkv8/FaeiJ/bFNTTznQQGl+UjuJn0KaN/
         YPtBCTVG0/SzEISu97Y4nRFv6/DNhwJpJljRZtHRHZr8/8Y2VXrxxtWd8SSeFg6MDc8p
         9Dmw2EKJNiE8lGAJIp6nZRm5Y1/h1BnDCh1L0a+T9xxN5tXSkojL/QnbWkR81ht+6X6h
         3ydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774141529; x=1774746329;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z71A4A/9WIsYeL7CrSvLjwvAwzNvfNtlpf1MFBL4KRA=;
        b=CgrOoZRfFxttr6CXLnqL2pHRZg3ya0rYtSmqk810KWnTbciwNZU/M322eUndsOkLCc
         GqxtRlcMo0WrratnJrAlP1u6hFf9qkmToTufR50Oz5cgg99/z2QwW2Me7JCUuD/2PqDY
         KIpP+lKe3U2MF//FKumWWcYsT6JxETfs8iuJ/1TvLhJZYVnm4wmeSbOLJmAuEQcqAuQ0
         VKEPH5iIE1BfuFXQwB1nZAyPOJO5M3DEjAhacAPLLiJVM8j2lJKPFRPxEZTSjxdYUeyO
         V8QGSDHWRaxtDJVGYNUdX5/lxk2IBXK/lidjD3cHx9Ifv6djJCOZdnj4vr8DffcC2v/2
         q25Q==
X-Forwarded-Encrypted: i=1; AJvYcCWl6HpKG98j4WzE5Xxdq77kw+Rjb2v9bFXqpLiCB01rc890PpqV8yX9ocqADcfR7eVM0mUb5RT9GyOTQDFbpw0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSEdSdMGnjjbMkkGDybUwfepFhV66P5o4BAk8wUPQ9tB7uBJC8
	uxtkF8H8TVbGgtfyB/jSg/7sisJ/l+14R12rjz/OxtwZ31cqQzpuxUeM/T2RbztXGiltEml0yIy
	mWo+WAxYkmuXNUmyRjPuQpDPJ8KMWw0gFWREYAT0tUQ==
X-Gm-Gg: ATEYQzzr3aYQO45DfZz490/n6pSBJ+Frjb6IAfnwfT0sYOBTIejQqIJJICoHvExzQGM
	0RDVXBw7R79hLvY09ffG9CGJnt0mlOjRpQbQZBV35Epr/KTva6vWMlAcOv2RUIxEa8vMWSd3hyh
	TBIi28HKVn7fSkpPsLFOhdCODvKY8UyuMT5luDxDjbGcW4UGEIn+0yux2l3ANoqrglapUvHFhFu
	DWJSn92y1S4VU7j+Hw39+l2AEw39lFcA5JNK1XWyeMUmZ1XVtTfahxNLt/yVl8mL5qivcfJtnnT
	JuwfN0ApjEJTxNDycTnnVhcGpKlRmui5X/qzLw==
X-Received: by 2002:a05:6402:3513:b0:667:df35:8739 with SMTP id
 4fb4d7f45d1cf-668c9119018mr5809668a12.11.1774141528777; Sat, 21 Mar 2026
 18:05:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260321175808.57942-1-pasha.tatashin@soleen.com> <20260321175808.57942-2-pasha.tatashin@soleen.com>
In-Reply-To: <20260321175808.57942-2-pasha.tatashin@soleen.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sat, 21 Mar 2026 21:04:53 -0400
X-Gm-Features: AaiRm52fD9VvtuC5_UHR4ptbTaHmC_PzXcfxEAIOVyW6x1v9oh_L8TjB8925SVE
Message-ID: <CA+CK2bD2aNu-NByET4KkBP0n2j8WQE2zjxb4g-1cv2hYfjaRZQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] liveupdate: prevent double management of files
To: brauner@kernel.org, linux-kselftest@vger.kernel.org, rppt@kernel.org, 
	jack@suse.cz, shuah@kernel.org, linux-fsdevel@vger.kernel.org, 
	akpm@linux-foundation.org, linux-mm@kvack.org, viro@zeniv.linux.org.uk, 
	linux-kernel@vger.kernel.org, pasha.tatashin@soleen.com, dmatlack@google.com, 
	pratyush@kernel.org, skhawaja@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 21, 2026 at 1:58=E2=80=AFPM Pasha Tatashin
<pasha.tatashin@soleen.com> wrote:
>
> Currently, LUO does not prevent the same file from being managed twice
> across different active sessions.
>
> Add a new i_state flag I_LUO_MANAGED and update luo_preserve_file()
> to check and set this flag when a file is preserved, and clear it in
> luo_file_unpreserve_files() when it is released.
>
> Additionally, set this flag in luo_retrieve_file() after a file is
> successfully restored in the new kernel, and clear it in
> luo_file_finish() when the LUO session is finalized.
>
> This ensures that the same file (inode) cannot be managed by multiple
> sessions. If another session attempts to preserve an already managed
> file, it will now fail with -EBUSY.
>
> Acked-by: Pratyush Yadav (Google) <pratyush@kernel.org>
> Acked-by: Jan Kara <jack@suse.cz>
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> ---
>  include/linux/fs.h           |  5 ++++-
>  kernel/liveupdate/luo_file.c | 27 ++++++++++++++++++++++++---
>  2 files changed, 28 insertions(+), 4 deletions(-)
>
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 23f36a2613a3..692a8be56f3c 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -712,6 +712,8 @@ is_uncached_acl(struct posix_acl *acl)
>   * I_LRU_ISOLATING     Inode is pinned being isolated from LRU without h=
olding
>   *                     i_count.
>   *
> + * I_LUO_MANAGED       Inode is being managed by a live update session.
> + *
>   * Q: What is the difference between I_WILL_FREE and I_FREEING?
>   *
>   * __I_{SYNC,NEW,LRU_ISOLATING} are used to derive unique addresses to w=
ait
> @@ -744,7 +746,8 @@ enum inode_state_flags_enum {
>         I_CREATING              =3D (1U << 15),
>         I_DONTCACHE             =3D (1U << 16),
>         I_SYNC_QUEUED           =3D (1U << 17),
> -       I_PINNING_NETFS_WB      =3D (1U << 18)
> +       I_PINNING_NETFS_WB      =3D (1U << 18),
> +       I_LUO_MANAGED           =3D (1U << 19),
>  };
>
>  #define I_DIRTY_INODE (I_DIRTY_SYNC | I_DIRTY_DATASYNC)
> diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
> index 5acee4174bf0..86911beeff71 100644
> --- a/kernel/liveupdate/luo_file.c
> +++ b/kernel/liveupdate/luo_file.c
> @@ -248,6 +248,7 @@ static bool luo_token_is_used(struct luo_file_set *fi=
le_set, u64 token)
>   * Context: Can be called from an ioctl handler during normal system ope=
ration.
>   * Return: 0 on success. Returns a negative errno on failure:
>   *         -EEXIST if the token is already used.
> + *         -EBUSY if the file descriptor is already preserved by another=
 session.
>   *         -EBADF if the file descriptor is invalid.
>   *         -ENOSPC if the file_set is full.
>   *         -ENOENT if no compatible handler is found.
> @@ -276,6 +277,14 @@ int luo_preserve_file(struct luo_file_set *file_set,=
 u64 token, int fd)
>         if (err)
>                 goto  err_fput;
>
> +       scoped_guard(spinlock, &file_inode(file)->i_lock) {
> +               if (inode_state_read(file_inode(file)) & I_LUO_MANAGED) {
> +                       err =3D -EBUSY;
> +                       goto err_free_files_mem;
> +               }
> +               inode_state_set(file_inode(file), I_LUO_MANAGED);
> +       }
> +
>         err =3D -ENOENT;
>         list_private_for_each_entry(fh, &luo_file_handler_list, list) {
>                 if (fh->ops->can_preserve(fh, file)) {
> @@ -286,11 +295,11 @@ int luo_preserve_file(struct luo_file_set *file_set=
, u64 token, int fd)
>
>         /* err is still -ENOENT if no handler was found */
>         if (err)
> -               goto err_free_files_mem;
> +               goto err_unpreserve_inode;
>
>         err =3D luo_flb_file_preserve(fh);
>         if (err)
> -               goto err_free_files_mem;
> +               goto err_unpreserve_inode;
>
>         luo_file =3D kzalloc_obj(*luo_file);
>         if (!luo_file) {
> @@ -320,6 +329,9 @@ int luo_preserve_file(struct luo_file_set *file_set, =
u64 token, int fd)
>         kfree(luo_file);
>  err_flb_unpreserve:
>         luo_flb_file_unpreserve(fh);
> +err_unpreserve_inode:
> +       scoped_guard(spinlock, &file_inode(file)->i_lock)
> +               inode_state_clear(file_inode(file), I_LUO_MANAGED);
>  err_free_files_mem:
>         luo_free_files_mem(file_set);
>  err_fput:
> @@ -363,6 +375,9 @@ void luo_file_unpreserve_files(struct luo_file_set *f=
ile_set)
>                 luo_file->fh->ops->unpreserve(&args);
>                 luo_flb_file_unpreserve(luo_file->fh);
>
> +               scoped_guard(spinlock, &file_inode(luo_file->file)->i_loc=
k)
> +                       inode_state_clear(file_inode(luo_file->file), I_L=
UO_MANAGED);
> +
>                 list_del(&luo_file->list);
>                 file_set->count--;
>
> @@ -609,6 +624,9 @@ int luo_retrieve_file(struct luo_file_set *file_set, =
u64 token,
>         *filep =3D luo_file->file;
>         luo_file->retrieve_status =3D 1;
>
> +       scoped_guard(spinlock, &file_inode(luo_file->file)->i_lock)
> +               inode_state_set(file_inode(luo_file->file), I_LUO_MANAGED=
);
> +
>         return 0;
>  }
>
> @@ -701,8 +719,11 @@ int luo_file_finish(struct luo_file_set *file_set)
>
>                 luo_file_finish_one(file_set, luo_file);
>
> -               if (luo_file->file)
> +               if (luo_file->file) {
> +                       scoped_guard(spinlock, &file_inode(luo_file->file=
)->i_lock)
> +                               inode_state_clear(file_inode(luo_file->fi=
le), I_LUO_MANAGED);
>                         fput(luo_file->file);
> +               }
>                 list_del(&luo_file->list);
>                 file_set->count--;
>                 mutex_destroy(&luo_file->mutex);
> --
> 2.43.0
>

> Sashiko: https://sashiko.dev/#/patchset/20260321175808.57942-1-pasha.tata=
shin@soleen.com

Sashiko reported two problems:

1. Are there any issues with mixing goto-based error handling and scope-bas=
ed
cleanups like scoped_guard() in the same function?

Initially, I thought that there should not be any problems, however,
after looking this up  I found in include/linux/cleanup.h the
following comment:

 * Lastly, given that the benefit of cleanup helpers is removal of
 * "goto", and that the "goto" statement can jump between scopes, the
 * expectation is that usage of "goto" and cleanup helpers is never
 * mixed in the same function.

Well, good to know, will not use goto inside scoped_guards.

2. Additionally, does setting I_LUO_MANAGED on the inode break the preserva=
tion
of anonymous inodes? Many file types (like eventfd, epoll, timerfd,
signalfd)

This is actually a very good point. It looks like everyone who uses
anon_inode_getfd() has one shared inode. This is not a problem for the
existing LUO user memfd, or for the upcoming vfiofd and memfd, but
kvm-vmfd and kvm-cpufd also use it, and that might be a problem in the
future once we add support for Orphaned VMs.

Therefore, we have two choices: either use a hash table, which adds
performance and memory overhead, or delegate this double-check to the
LUO file handlers, as they can use a private context to know if the FD
is already preserved.

Pasha
