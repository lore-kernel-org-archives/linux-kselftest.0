Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910B5248F64
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Feb 2026 19:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771356372; cv=pass; b=kGXvfPokmodhhTG1GROC0d1EwvDh1AqNPIMN3u9J3entS6NAoJk9yssYHs8I74EjN2av1rkdtvFk4j1hWVHWHHMJBQE2dUC587y5ihgowSEUx3/Dx7sq17sgznJ+iCx+X6e2NLUeM7XYg87sWj3Jway9ekAQUP1V4L3ueQUZpS4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771356372; c=relaxed/simple;
	bh=ZInnzvFTqZm3vNXw0nWFlKKRjaD+CRuq9E6Kn9OzF8A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sZ21DynGt2PRsguKIJjdIu7MMwSVPiGaEGZfwN9DQCbhL6AnlLc0tRO6q5SObWPv2lTS2w6L7IP3SNH7uEI/gc+jF5I5+BfnMsVCuIl5ffWa0bIlDFwaPQPz103y4TPST+9khYE5PItC0KHXji9w49LosunmAIGEk4UABFgDb6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Hcwa2qfh; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Hcwa2qfh"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48371d2f661so8195e9.1
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Feb 2026 11:26:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771356369; cv=none;
        d=google.com; s=arc-20240605;
        b=ZsyUdjG5zCCHKxI7owmt9X4/QrIhMKVCXCt+1vw8eipmYzkrTcF0vxJLnqUNV2uEjG
         /V2RV7jKy6hnx7PT5WNGxFGC9CIqAIXkisCIWWooFbMsjf84+pLg9EFaKITCKatQ7vrI
         tuU+apQHce+rbhqTVUlcNuLNBXeWygVBb5w/6vnzeP1smlLlK2qVRPnHk0ddsejoaDkQ
         c0d79z3DqN+uXarF/6lAivzHJVT61mXAzZxbtVx+2rfny567slNFZs9iVZ3M4PD2Kfgg
         /ndmiOKXg6ZyuCHpX4cLaJ2LcD8+BUAAkWJqCmn3bpJKu0hN78KAPgffGhW2y9+nfQj1
         4bJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4ZGsA3xReBt7X5+3ZrIcwe+PD8olQd0gZLMTyqBqYmI=;
        fh=ZtMurev/ZD/MBA4G6q9/TL2hwnZK6vK+M3lbhzni18w=;
        b=hj2RwNARFDIHSizIHY0R+O36iGiKqJzLsuDoEKm67lXlbtHYia52B2LGJrX50IBxyf
         Y9aZu9GAAuuso7Vb3C0RN6LN3bKzlxnMAV7PX6DvkJkUT2z18s99y87Cl2jwr5LB/hTQ
         4H3/kpghMo2DxHjuFUOVkaKEmCj+x1tNb0HDKG8niRGcDC4qDKFA2wO9x+nSi3RmmzHO
         Lqgq9I9ogL4a278d33z9nk+GZFvOFlchmeb77NY2KpsyeN9AvRGDq6L06eU8kwwO/Tqx
         Vn+hlJKKdWWorYObC3PQR1CVdsRd4Vf7/kBi2knhz0cAaLyGRzT/IGI6vQXoxiDiw8BS
         Vo1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771356369; x=1771961169; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ZGsA3xReBt7X5+3ZrIcwe+PD8olQd0gZLMTyqBqYmI=;
        b=Hcwa2qfhD37w0DSM/jVb+Us1qJb5nwMOi63RYin9XDPFpS9mcQ87+8VFc/r6Sct4f3
         nfE2o3FE9/smhYeSm8NsL1BAKhSg/exZ17gaYNEoQPSac4aLDID6AGnBn/fk3O3vZNzN
         T252mMX3sDwUf8UJFK896Bwk1ZO6dfyvDJpypwy6g+fOu6f545J5a9lUXOvFaLUUhjvP
         pyqQJpOHadx2tHUoe70L1g19axUk1qdZG+3A6LVbo7rqdhGX/rySbd2km39uTzgf8o5R
         YRQ4vPeQlWGw0O3WvasuNp+cs3/vFrStWXHT49uqaiphCmDGjuxWjZ+rBaVPNChSJrBC
         OPRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771356369; x=1771961169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4ZGsA3xReBt7X5+3ZrIcwe+PD8olQd0gZLMTyqBqYmI=;
        b=RNn6BButsGujViq4uT3HIzu13DPNDOq8Sma13El+KL1tL6wo11C+8vpK8vZBRcSaeG
         eHUOkB9BMZEzux8zChAh3rkV9Jq7pio0f615cxVWd8PApswYvE0IZfslNYTirQ1u3Zg+
         0PVMiJHXkO89At3Wb1g2gZ/O/mNhCgSe7tB3xwURygx02+hXr+TdfaRYw6/WJtiGb13X
         oBEtmirzz/0G9PDK2uDGTRiNatYVpP0OxlKU7u9ITdj4TZTMGyh25Qd/CsEx4FBCM3CX
         Y7usWSX8MYgxt4NyfXNW0BEiznWg+T0CHUTxQV3vHbiukquLxlAJbCwe/U11AlLKaDC8
         jpVg==
X-Forwarded-Encrypted: i=1; AJvYcCUATjaeFnSdm45+qyEAgy1hYCzQ685R9lPZnUbVJWsGHNt8/DDI+naE6CvCW7pUhVYpBa+FYmYmSTQDW6ioOIY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3DToHQuGabtwT69LW7+ykdakNgpbq7RahbejLUlrE0OOB0N0y
	UflZiiVicu1qUVTZ/KSKU5TxdCgUnxBQUYdmjiGvwFmGbJeA6js4bY0Pxjl9trNSxeuS4uxxXfI
	40QTezBmFMR3PNDfMKzum2LCNyiWUKmYaq7NArsbV
X-Gm-Gg: AZuq6aL2D1V5I8O1pPKnZShME+OiQi60hk/X7uQylQZZCeSfSNF0IKRji21SL8167h1
	nhtsBN0iDaE7W1nrIpM0Ed8sYPwsmCw0EUnDjiRVQyKJKckney5Brpem5OxK544rnNgYXHk26o0
	o9hX/EZgNwyyBVSoeCeM8ht+rUwYfcwB6ZAe1er5hthioPs9w9W+TR5lAoLCSf49n6mg7NUr5+B
	opzWfOZhtczmHahm9ZQvpu9Veg6SHJIAtUwmNWfJlSEKomXRJKTYwO8wDDrTsxRZTqt8ZQtGZlw
	6DTDb/UYcl5meqixqMOYsBUgVS6bwLDzu349sQpND0DZljZQU1CoHyGhHZ/5XE9mUVFZuU/mvTD
	I5ED6
X-Received: by 2002:a05:600c:6017:b0:477:95a8:2562 with SMTP id
 5b1f17b1804b1-48388599956mr1086505e9.13.1771356368554; Tue, 17 Feb 2026
 11:26:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260212215814.629709-1-tjmercier@google.com> <20260212215814.629709-3-tjmercier@google.com>
 <aZRAkalnJCxSp7ne@amir-ThinkPad-T480>
In-Reply-To: <aZRAkalnJCxSp7ne@amir-ThinkPad-T480>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 17 Feb 2026 11:25:56 -0800
X-Gm-Features: AaiRm51Ypdymx3dN9Uu0r1qkZyxKEOlZU17aaE-kKgHuYF4YzCdc0HZQ1vDObCw
Message-ID: <CABdmKX3wsWphRTDanKwGGiUWoO0xTaC8L_QxjHzhpxfZn256MQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] kernfs: send IN_DELETE_SELF and IN_IGNORED on file deletion
To: Amir Goldstein <amir73il@gmail.com>
Cc: gregkh@linuxfoundation.org, tj@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, jack@suse.cz, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 17, 2026 at 2:19=E2=80=AFAM Amir Goldstein <amir73il@gmail.com>=
 wrote:
>
> On Thu, Feb 12, 2026 at 01:58:13PM -0800, T.J. Mercier wrote:
> > Currently some kernfs files (e.g. cgroup.events, memory.events) support
> > inotify watches for IN_MODIFY, but unlike with regular filesystems, the=
y
> > do not receive IN_DELETE_SELF or IN_IGNORED events when they are
> > removed.
> >
> > This creates a problem for processes monitoring cgroups. For example, a
> > service monitoring memory.events for memory.high breaches needs to know
> > when a cgroup is removed to clean up its state. Where it's known that a
> > cgroup is removed when all processes die, without IN_DELETE_SELF the
> > service must resort to inefficient workarounds such as:
> > 1.  Periodically scanning procfs to detect process death (wastes CPU an=
d
> >     is susceptible to PID reuse).
> > 2.  Placing an additional IN_DELETE watch on the parent directory
> >     (wastes resources managing double the watches).
> > 3.  Holding a pidfd for every monitored cgroup (can exhaust file
> >     descriptors).
> >
> > This patch enables kernfs to send IN_DELETE_SELF and IN_IGNORED events.
> > This allows applications to rely on a single existing watch on the file
> > of interest (e.g. memory.events) to receive notifications for both
> > modifications and the eventual removal of the file, as well as automati=
c
> > watch descriptor cleanup, simplifying userspace logic and improving
> > resource efficiency.
>
> This looks very useful,
> But,
> How will the application know that ti can rely on IN_DELETE_SELF
> from cgroups if this is not an opt-in feature?
>
> Essentially, this is similar to the discussions on adding "remote"
> fs notification support (e.g. for smb) and in those discussions
> I insist that "remote" notification should be opt-in (which is
> easy to do with an fanotify init flag) and I claim that mixing
> "remote" events with "local" events on the same group is undesired.

I think this situation is a bit different because this isn't adding
new features to fsnotify. This is filling a gap that you'd expect to
work if you only read the cgroups or inotify documentation without
realizing that kernfs is simply wired up differently for notification
support than most other filesystems, and only partially supports the
existing notification events. It's opt-in in the sense that an
application registers for IN_DELETE_SELF, but other than a runtime
test like what I added in the selftests I'm not sure if there's a good
way to detect the kernel will actually send the event. Practically
speaking though, if merged upstream I will backport these patches to
all the kernels we use so a runtime check shouldn't be necessary for
our applications.

> However, IN_IGNORED is created when an inotify watch is removed
> and IN_DELETE_SELF is called when a vfs inode is destroyed.
> When setting an inotify watch for IN_IGNORED|IN_DELETE_SELF there
> has to be a vfs inode with inotify mark attached, so why are those
> events not created already? What am I missing?

The difference is vfs isn't involved when kernfs files are unlinked.
When a cgroup removal occurs, we get to kernfs_remove via kernfs'
inode_operations without calling vfs_unlink. (You can't rm cgroup
files directly.)

> Are you expecting to get IN_IGNORED|IN_DELETE_SELF on an entry
> while watching the parent? Because this is not how the API works.

No, only on the file being watched. The parent should only get
IN_DELETE, but I read your feedback below and I'm fine with removing
that part and just sending the DELETE_SELF and IN_IGNORED events.

> I think it should be possible to set a super block fanotify watch
> on cgroupfs and get all the FAN_DELETE_SELF events, but maybe we
> do not allow this right now, I did not check - just wanted to give
> you another direction to follow.
>
> >
> > Implementation details:
> > The kernfs notification worker is updated to handle file deletion.
> > fsnotify handles sending MODIFY events to both a watched file and its
> > parent, but it does not handle sending a DELETE event to the parent and
> > a DELETE_SELF event to the watched file in a single call. Therefore,
> > separate fsnotify calls are made: one for the parent (DELETE) and one
> > for the child (DELETE_SELF), while retaining the optimized single call
>
> IN_DELETE_SELF and IN_IGNORED are special and I don't really mind adding
> them to kernfs seeing that they are very useful, but adding IN_DELETE
> without adding IN_CREATE, that is very arbitrary and I don't like it as
> much.

That's fair, and the IN_DELETE isn't actually needed for my use case,
but I figured I would add the parent notification for file deletions
since it is already there for MODIFY events, and I was modifying that
area of the code anyway. I'll remove the parent notification for
DELETE and just send DELETE_SELF and IGNORED with
fsnotify_inoderemove() in V3.

> > for MODIFY events.
> >
> > Signed-off-by: T.J. Mercier <tjmercier@google.com>
> > ---
> >  fs/kernfs/dir.c             | 21 +++++++++++++++++++++
> >  fs/kernfs/file.c            | 16 ++++++++++------
> >  fs/kernfs/kernfs-internal.h |  3 +++
> >  3 files changed, 34 insertions(+), 6 deletions(-)
> >
> > diff --git a/fs/kernfs/dir.c b/fs/kernfs/dir.c
> > index 29baeeb97871..e5bda829fcb8 100644
> > --- a/fs/kernfs/dir.c
> > +++ b/fs/kernfs/dir.c
> > @@ -9,6 +9,7 @@
> >
> >  #include <linux/sched.h>
> >  #include <linux/fs.h>
> > +#include <linux/fsnotify_backend.h>
> >  #include <linux/namei.h>
> >  #include <linux/idr.h>
> >  #include <linux/slab.h>
> > @@ -1471,6 +1472,23 @@ void kernfs_show(struct kernfs_node *kn, bool sh=
ow)
> >       up_write(&root->kernfs_rwsem);
> >  }
> >
> > +static void kernfs_notify_file_deleted(struct kernfs_node *kn)
> > +{
> > +     static DECLARE_WORK(kernfs_notify_deleted_work,
> > +                         kernfs_notify_workfn);
> > +
> > +     guard(spinlock_irqsave)(&kernfs_notify_lock);
> > +     /* may overwite already pending FS_MODIFY events */
> > +     kn->attr.notify_event =3D FS_DELETE;
> > +
> > +     if (!kn->attr.notify_next) {
> > +             kernfs_get(kn);
> > +             kn->attr.notify_next =3D kernfs_notify_list;
> > +             kernfs_notify_list =3D kn;
> > +             schedule_work(&kernfs_notify_deleted_work);
> > +     }
> > +}
> > +
> >  static void __kernfs_remove(struct kernfs_node *kn)
> >  {
> >       struct kernfs_node *pos, *parent;
> > @@ -1520,6 +1538,9 @@ static void __kernfs_remove(struct kernfs_node *k=
n)
> >                       struct kernfs_iattrs *ps_iattr =3D
> >                               parent ? parent->iattr : NULL;
> >
> > +                     if (kernfs_type(pos) =3D=3D KERNFS_FILE)
> > +                             kernfs_notify_file_deleted(pos);
> > +
> >                       /* update timestamps on the parent */
> >                       down_write(&kernfs_root(kn)->kernfs_iattr_rwsem);
> >
> > diff --git a/fs/kernfs/file.c b/fs/kernfs/file.c
> > index e978284ff983..2d21af3cfcad 100644
> > --- a/fs/kernfs/file.c
> > +++ b/fs/kernfs/file.c
> > @@ -37,8 +37,8 @@ struct kernfs_open_node {
> >   */
> >  #define KERNFS_NOTIFY_EOL                    ((void *)&kernfs_notify_l=
ist)
> >
> > -static DEFINE_SPINLOCK(kernfs_notify_lock);
> > -static struct kernfs_node *kernfs_notify_list =3D KERNFS_NOTIFY_EOL;
> > +DEFINE_SPINLOCK(kernfs_notify_lock);
> > +struct kernfs_node *kernfs_notify_list =3D KERNFS_NOTIFY_EOL;
> >
> >  static inline struct mutex *kernfs_open_file_mutex_ptr(struct kernfs_n=
ode *kn)
> >  {
> > @@ -909,7 +909,7 @@ static loff_t kernfs_fop_llseek(struct file *file, =
loff_t offset, int whence)
> >       return ret;
> >  }
> >
> > -static void kernfs_notify_workfn(struct work_struct *work)
> > +void kernfs_notify_workfn(struct work_struct *work)
> >  {
> >       struct kernfs_node *kn;
> >       struct kernfs_super_info *info;
> > @@ -959,15 +959,19 @@ static void kernfs_notify_workfn(struct work_stru=
ct *work)
> >                       if (p_inode) {
> >                               fsnotify(notify_event | FS_EVENT_ON_CHILD=
,
> >                                        inode, FSNOTIFY_EVENT_INODE,
> > -                                      p_inode, &name, inode, 0);
> > +                                      p_inode, &name,
> > +                                      (notify_event =3D=3D FS_MODIFY) =
?
> > +                                             inode : NULL, 0);
> >                               iput(p_inode);
> >                       }
> >
> >                       kernfs_put(parent);
> >               }
> >
> > -             if (!p_inode)
> > -                     fsnotify_inode(inode, notify_event);
> > +             if (notify_event =3D=3D FS_DELETE)
> > +                     fsnotify_inoderemove(inode);
> > +             else if (!p_inode)
> > +                     fsnotify_inode(inode, FS_MODIFY);
>
> Didn't you mean notify_event?

Yes, that would be better.

> Thanks,
> Amir.

Thanks for looking at my patches Amir,
T.J.
