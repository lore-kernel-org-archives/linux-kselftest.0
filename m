Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757142BF3E2
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Feb 2026 08:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771403469; cv=pass; b=FWs4j3IdsFkBx2RCD8/T+owppDG7CruubHRvMdE9dSlwMcxUYVamtvp+BDh29mr0jZ2hX+xRSU4sHnCrY45RsNZYiw8OC/8qUBcMRpttElk//OzAtQEj/MmgqPWqVYX5HJW7IvNE4oLT+lV8Ww3GE9P3InIjz4hev9lMgAfk7fE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771403469; c=relaxed/simple;
	bh=pOcrR9g/30b877GWLIQEiogDavQ6piFbc5NysJoGEjE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oTbiPLS0bi4KZWPLZXKrFrlkD3E79pdPSHIMUto11pMju/mi9cBFRTwo9ifDo4LF8ggOLpbGeqwVgExu1Pr7Wn83On+lmOZsLDVESOOp5zyIC3vk8kOYOiHaIioNxfVfWxvZf1IRafPKWOs5mU9w/MTRXaHpDQPeEg8pnE5UcoA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W8+nrWs0; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W8+nrWs0"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b8845cb580bso908029166b.3
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Feb 2026 00:31:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771403465; cv=none;
        d=google.com; s=arc-20240605;
        b=F911yda4ChEkZgsc8XnZSYxIDfebN2awJoSM+saXOTu2wurekNMvDVparIZbUxIX1H
         a1jVPo91GHu8M2+8N5Z86U6E32O+R4BL8aLK5NYKHN9IlMIseUVVCl88Y9h/tLUA2nDl
         erZELrWisDwYq3vM4/ql1DUF6MWfqqPYtf4bAEkpJOCX50Lde/ljCI6+nZt3NjC0WG6r
         vjXZOP0Q6phsrjpJX972/h0/Dd9ofq6Lnez83dO31Mh+ZrDrcdgm2090OiDJEhQl47tw
         Qmlum7Fq9dpi+1QGDhEDtSakriw8PwdsbIULKgRRkXCbgbI39nnrZ9wSCTCcOeDbxUTv
         QrNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Cd+FmpSKeZY657ydPhpXWP28mI30FM0F7sFttu1MBmg=;
        fh=z8nDcYi3Rm7XzkmupVXgtTkbWcq5ThhIX3Ve6tf5Twk=;
        b=jh1WG225ik4gisqoH54X+u1wrVxnYXHhVnvM7t4aIq41lQ508HpRA5kzW0jezL7W5c
         nJ8QdsIlEsMCTCpEeK0lgooQGdkafs4MjXd4dGgdary8+Iy4BXCXvihG39QP4pBnPQeN
         0+f4mzoYtsWGtltxinMr/glkRM5sTs+EykhKKzc8s0LrKzXyYaMgA+4r6WNu7L5mt3ld
         FezdtKFW0h+n1CribG2DzsaKhFazGxET1cOFFIUBzwCXWhxmlL8bINE5V7o8Xi/zU1bJ
         GX3HGw4kiwfwgYLtxoikuym1jwQn787HXBhqpJXJWYySelYsFRc6xZgFArejjCZXFpwT
         ZwAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771403465; x=1772008265; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cd+FmpSKeZY657ydPhpXWP28mI30FM0F7sFttu1MBmg=;
        b=W8+nrWs0t3nYly9aQdYDojfd/ojwSO6NGcTkZun3NnlNXxO080HxchVbR6K06rovo5
         9RJqIvUzAh4QbIKjNo3vm3ktm4ielFDx1LY0HJCimG09ox3gqIyTMo808CbL3YXfNcAA
         drmAR19cUxBWdTr/SCrddODp2BY2cSsys4KQIKSLedZkKD+JDHWCzxIqZlr4UcbgIbUS
         0dO6IIHOlPjD/lMhbmkJz3+oj9aUJ2Tboj8V4BMnfb0QdhZcHfp7RUwkPKE8aFrNHchX
         9ylLt0AtavYtMsY2db7Fc8qYdv4vhs7S6Wrn90WUZ+K8DxbtCPR/Zv7QLoMEAY1h+l5G
         CEzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771403465; x=1772008265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cd+FmpSKeZY657ydPhpXWP28mI30FM0F7sFttu1MBmg=;
        b=Cyo/3S3lLFvNW96r/2uyVUXlwd8B69GWDjbW4/FBNVu6q4E2Dw4px2lPekzEMx0ear
         v9gLlNjpvXcwDi9eFATDtxfpUp9K72St2UxduvI53/uU9hgXHUPL1R49dCEFLcb+GhY8
         qFBAsfoS1jzH6ygecZx3dy/DqYDJIYUEiUXgh1axuTw6S6RPEK7FQ5ZkgmMoI/iIFwbj
         JRgHvEMHZx6sSgX6wmOvkaOJSWPYwHFeMJVlbKq59J6o9MvYVSaFJVyUTXhFlMysp9iD
         xPJSxp+6PJAXhTxcKwEh0w/D9d2Jx5ldctmAvNGZ6pbSwY+hDEQJolQhs4O5JyUtJjMg
         vVwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmSf842z9Tl89jgHBUwvv8UhjbiiWhKw4rV8bgdGQf+rLtuYGecEydaiyLMAmmuuPcoK7SbmTHHBVo3FkBn04=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMvgJM7n/Yh7dYaK6arlhpKSzJ0krdYSdM6/10P6BYtaTFhn8M
	/DcvAPz9TcT5b+tBU8bh4N+TX8iG91r6hxseZN21oeixRkVzU/45k0k8AmsnZK7fL3u5Hh0qXBT
	qVCO6DbEXQhKHvxoq/mpTc+4YA/VWASE=
X-Gm-Gg: AZuq6aLPd//bwhf0kuOP3fDquPAM+nluCylLdpmNKh/UYE0msWiQfnFKa+ghT9wDkMg
	HRfwxI5lZ2++xMW/tOLiJqB45XybujUX+Ku/SIYt2kM0gw6TzEM4rmUyCK98gFmFOpZYYJ/xhgb
	GCRygAtTeskQyQc7mzs+oge/bHBXQWm8WWHe11lMBrcYZLkMQPC92cisFGU1qrG84EFOuu5LxDL
	oi60N90WTuxKeHMVI1wV1x97iDFv9ME4F0H0B8CtE4m7Ap+rrqPc6UQNhPPmd18C9lUr9pCV2ow
	dBF2zh0m
X-Received: by 2002:a17:907:c23:b0:b87:3beb:194a with SMTP id
 a640c23a62f3a-b8fc3cb90cfmr783252566b.44.1771403464353; Wed, 18 Feb 2026
 00:31:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260218032232.4049467-1-tjmercier@google.com> <20260218032232.4049467-3-tjmercier@google.com>
In-Reply-To: <20260218032232.4049467-3-tjmercier@google.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 18 Feb 2026 09:30:52 +0100
X-Gm-Features: AaiRm52rcAO1uVM86zLcvkOqxQIDflGCfwWsZ-SPyqDCOtD9nqwyY5fQY1S-rmY
Message-ID: <CAOQ4uxjwO6JVy5GKJ6k+Rm4Ey1=TD9=gXMiuB=JvwQSA13iXjA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] kernfs: send IN_DELETE_SELF and IN_IGNORED on file deletion
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
> Currently some kernfs files (e.g. cgroup.events, memory.events) support
> inotify watches for IN_MODIFY, but unlike with regular filesystems, they
> do not receive IN_DELETE_SELF or IN_IGNORED events when they are
> removed.
>
> This creates a problem for processes monitoring cgroups. For example, a
> service monitoring memory.events for memory.high breaches needs to know
> when a cgroup is removed to clean up its state. Where it's known that a
> cgroup is removed when all processes die, without IN_DELETE_SELF the
> service must resort to inefficient workarounds such as:
> 1.  Periodically scanning procfs to detect process death (wastes CPU and
>     is susceptible to PID reuse).
> 2.  Placing an additional IN_DELETE watch on the parent directory
>     (wastes resources managing double the watches).

This sentence is a red flag for me.
"wastes resources"? What resources are you talking about?
A single inotify watch? That's nothing.
This is not a valid argument IMO.
I fail to see how managing N watches is different than managing 2N watches.
I have no objection to your patch, but we need to keep our arguments honest=
.

> 3.  Holding a pidfd for every monitored cgroup (can exhaust file
>     descriptors).
>
> This patch enables kernfs to send IN_DELETE_SELF and IN_IGNORED events.
> This allows applications to rely on a single existing watch on the file
> of interest (e.g. memory.events) to receive notifications for both
> modifications and the eventual removal of the file, as well as automatic
> watch descriptor cleanup, simplifying userspace logic and improving
> resource efficiency.
>
> Implementation details:
> The kernfs notification worker is updated to handle file deletion.
> The optimized single call for MODIFY events to both the parent and the
> file is retained, however because CREATE (parent) events remain
> unsupported for kernfs files, support for DELETE (parent) events is not

Either drop this story about DELETE or expand it.
inotify does not generate a DELETE event when watching a file,
because DELETE is an event notifying a change of a directory.
If you would have kept your DELETE implementation that would have
broken this rule.

> added here to retain symmetry. Only support for DELETE_SELF events is
> added.
>
> Signed-off-by: T.J. Mercier <tjmercier@google.com>
> Acked-by: Tejun Heo <tj@kernel.org>
> ---
>  fs/kernfs/dir.c             | 21 +++++++++++++++++
>  fs/kernfs/file.c            | 45 ++++++++++++++++++++-----------------
>  fs/kernfs/kernfs-internal.h |  3 +++
>  3 files changed, 48 insertions(+), 21 deletions(-)
>
> diff --git a/fs/kernfs/dir.c b/fs/kernfs/dir.c
> index 29baeeb97871..e5bda829fcb8 100644
> --- a/fs/kernfs/dir.c
> +++ b/fs/kernfs/dir.c
> @@ -9,6 +9,7 @@
>
>  #include <linux/sched.h>
>  #include <linux/fs.h>
> +#include <linux/fsnotify_backend.h>
>  #include <linux/namei.h>
>  #include <linux/idr.h>
>  #include <linux/slab.h>
> @@ -1471,6 +1472,23 @@ void kernfs_show(struct kernfs_node *kn, bool show=
)
>         up_write(&root->kernfs_rwsem);
>  }
>
> +static void kernfs_notify_file_deleted(struct kernfs_node *kn)
> +{
> +       static DECLARE_WORK(kernfs_notify_deleted_work,
> +                           kernfs_notify_workfn);
> +
> +       guard(spinlock_irqsave)(&kernfs_notify_lock);
> +       /* may overwite already pending FS_MODIFY events */

Typo: overwite

> +       kn->attr.notify_event =3D FS_DELETE;

FS_DELETE_SELF

> +
> +       if (!kn->attr.notify_next) {
> +               kernfs_get(kn);
> +               kn->attr.notify_next =3D kernfs_notify_list;
> +               kernfs_notify_list =3D kn;
> +               schedule_work(&kernfs_notify_deleted_work);
> +       }
> +}
> +
>  static void __kernfs_remove(struct kernfs_node *kn)
>  {
>         struct kernfs_node *pos, *parent;
> @@ -1520,6 +1538,9 @@ static void __kernfs_remove(struct kernfs_node *kn)
>                         struct kernfs_iattrs *ps_iattr =3D
>                                 parent ? parent->iattr : NULL;
>
> +                       if (kernfs_type(pos) =3D=3D KERNFS_FILE)
> +                               kernfs_notify_file_deleted(pos);
> +

Why are we not notifying a deleted directory?
If users expect DELETE_SELF on a watched cgroup file
they would definitely expect DELETE_SELF on a watched cgroup dir
when the cgroup is destroyed.

I claim that *this* should be the standard way to monitor
destroyed cgroups.

>                         /* update timestamps on the parent */
>                         down_write(&kernfs_root(kn)->kernfs_iattr_rwsem);
>
> diff --git a/fs/kernfs/file.c b/fs/kernfs/file.c
> index e978284ff983..4be9bbe29378 100644
> --- a/fs/kernfs/file.c
> +++ b/fs/kernfs/file.c
> @@ -37,8 +37,8 @@ struct kernfs_open_node {
>   */
>  #define KERNFS_NOTIFY_EOL                      ((void *)&kernfs_notify_l=
ist)
>
> -static DEFINE_SPINLOCK(kernfs_notify_lock);
> -static struct kernfs_node *kernfs_notify_list =3D KERNFS_NOTIFY_EOL;
> +DEFINE_SPINLOCK(kernfs_notify_lock);
> +struct kernfs_node *kernfs_notify_list =3D KERNFS_NOTIFY_EOL;
>
>  static inline struct mutex *kernfs_open_file_mutex_ptr(struct kernfs_nod=
e *kn)
>  {
> @@ -909,7 +909,7 @@ static loff_t kernfs_fop_llseek(struct file *file, lo=
ff_t offset, int whence)
>         return ret;
>  }
>
> -static void kernfs_notify_workfn(struct work_struct *work)
> +void kernfs_notify_workfn(struct work_struct *work)
>  {
>         struct kernfs_node *kn;
>         struct kernfs_super_info *info;
> @@ -935,11 +935,7 @@ static void kernfs_notify_workfn(struct work_struct =
*work)
>         down_read(&root->kernfs_supers_rwsem);
>         down_read(&root->kernfs_rwsem);
>         list_for_each_entry(info, &kernfs_root(kn)->supers, node) {
> -               struct kernfs_node *parent;
> -               struct inode *p_inode =3D NULL;
> -               const char *kn_name;
>                 struct inode *inode;
> -               struct qstr name;
>
>                 /*
>                  * We want fsnotify_modify() on @kn but as the
> @@ -951,24 +947,31 @@ static void kernfs_notify_workfn(struct work_struct=
 *work)
>                 if (!inode)
>                         continue;
>
> -               kn_name =3D kernfs_rcu_name(kn);
> -               name =3D QSTR(kn_name);
> -               parent =3D kernfs_get_parent(kn);
> -               if (parent) {
> -                       p_inode =3D ilookup(info->sb, kernfs_ino(parent))=
;
> -                       if (p_inode) {
> -                               fsnotify(notify_event | FS_EVENT_ON_CHILD=
,
> -                                        inode, FSNOTIFY_EVENT_INODE,
> -                                        p_inode, &name, inode, 0);
> -                               iput(p_inode);
> +               if (notify_event =3D=3D FS_DELETE) {
FS_DELETE_SELF

> +                       fsnotify_inoderemove(inode);
                            iput(inode);
                            continue;
                    }

Avoids all the churn and unneeded extra indentation that follows.

Thanks,
Amir.
