Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462194248BB
	for <linux-kselftest@vger.kernel.org>; Wed, 30 Sep 2026 19:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.167
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790797775; cv=pass; b=XmDdciQ7t19WCU6lypFu35JkSA7Xicm/D8xb5mE9wFq6lL76hlD3oq5qyJksFU3rcAdTQUo2v0B0NNXZCWNqEB+YjMWAbF375J4YKomcLDDmqqafNarUbZu2J6pW30eVwwuvv2CNu3PG7ESC8i2OHLfRSSxWlen24iUsu/Y1t9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790797775; c=relaxed/simple;
	bh=F3Dung+nzJVGL2YRHUmvwY+adZaiJpqAN9OQIrYPVJg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q84rxOTK0svKpBLrCOlLOl1qU8zmBovtG8T8ZUwMzDZIgVb+y5odnZy6XgGrgXOShgMH3E5JcqBDPvwzM1Rbt9aOGevwM7htfygsmfFQovobgwtQC8AVCzBIPnwurSWV3MhwQMMDPf4AFxBULrbl6LG++W51yUiGVQdnmIaUpbw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BceiKZYF; arc=pass smtp.client-ip=74.125.227.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BceiKZYF"
Received: by mail-pj2-f39.google.com with SMTP id 98e67ed59e1d1-3a4805e15cfso1958244a91.0
        for <linux-kselftest@vger.kernel.org>; Wed, 30 Sep 2026 12:49:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790797769; cv=none;
        d=google.com; s=arc-20260327;
        b=haA+ouXTBEfE6E0D4JprQU8sfLtD3jiwdaTO/ChpY0Yg2ksdSPssR3IYXqkHvwwW6a
         wvY2siJFTou/944KTE405TSFfWTPTFm8FJO3uzaYW6PAZJO8LyEyKmaxTw0c0e20zyDv
         KtTwkh07TaJ8Z9WJKUzgAFu5hwsJK7A8NChbAMYsz+qPCRV/fK3QDKwQlnyn391J+B+u
         Kdc037KFLC/eWvcRHRbDTe+ZrHrbVxe0cPZcR5xVesHwmm0OUPY+ugioEQlEDRtZYHjW
         UXDTeuniBrT3zVq1s48aabHsm3pOM4NPYE0GtXdL8IDxOBgG+1/XG8MeSFFZH1Wou5gY
         M0Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vYuuNb8fsv3iPf0xhDXc4/1qYP3hZrQ9mcUnQuSOi8Q=;
        fh=Ro87GV1d857R0XYtJtIvBikAsERazvpZWVwe7YjIa3A=;
        b=N9V9L45rcOF1crQxODy2OIAZTs1N9y5E4DgH8PtBtHdfO6A9ZZAAFYI4CZMja/IU+Z
         cNEGBWvDKzQ6knGglexmpfzh816gapyv8Yal9CCDxzJk9wJ/0qcsKapD2+0LeqGvC77s
         vUrZf2iSv2dqlI+Wv889hZTrGpPj//H52bQIXUvBRPk0UgqmqGmBkNM4qTYJHXnmPaNK
         4yJvTRrlUo2llp47EFFn7WB2A4kHkDjXYfdINmW53lLrDpJZ6jR8QneQgWI1alw2NWx4
         FCkG3VMo3zqJDScnbe0Bp7lA5ma2tu3S22dUpzDF06UivcMRmcMhQvB61QQTYHe6ANAr
         S2Bg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790797769; x=1791402569; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vYuuNb8fsv3iPf0xhDXc4/1qYP3hZrQ9mcUnQuSOi8Q=;
        b=BceiKZYFgwpTQCcc2uKOc7bQ46apJXS1p0mpIESAcLtLxFrCt+eTN33BGmgCHX8wCT
         s0076ZYulwaT2rsd9R6PjixhraJomGackH+U9vi5eHNhKUBCQnZqW+OnyzPOMYA1ODYd
         7Kb1PUFjT8JvHajh9T+AZtOHFHEJg55RSFJ/nsbMnB3X5TKPOpk5XzPDvOd3aj2OMWGD
         DxXsVcr8knz0w4pZ//xL0PCqg/lXHuSYLNKeF/wXw3l6FytSZeHIdu0tENrf+j3Kp746
         VXE2f4fvz6OP40Vjo8pHG1842NsIlMhngY/uKw/5zOIPnfsfx6jRS1FJiOf3ldzvOCht
         WZdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790797769; x=1791402569;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vYuuNb8fsv3iPf0xhDXc4/1qYP3hZrQ9mcUnQuSOi8Q=;
        b=PvHnkdVo4na+wSy4CBTKFwuIOiP0jLOPpEj3U3U6ljz5D57z1Sk6bfT+b9Q3riw4eC
         4OgkFNChEuKBh/l5pKrK0qfxbXLyNBu61s3h6mFTyyhKKhRoo4CRexalC9KofBzg/Mrq
         V1hxlqVgrf52JWi+ktKrrfKbv5PKJqtNClq8NlZmrwkHrmrseSsWCiT3+gj9HWm6h9mE
         TmSucDGegYLP9BxNRqHT6tbYpmYPjwr9DvujX4gMVx3exm8X/8C8UH2D/UdtF7Zdm4/N
         Fw2Nf9jPGna7pEPYQOY/E/5nT0VpUhyxi1It+egolNyqFl6gw62RTVqz6k4qi/IB5iEB
         310g==
X-Forwarded-Encrypted: i=1; AKwUvBy/I6IGJULWm3l2v8IoWv47uyfq8dpTN0DM1Oy+bz+J5iNDUf0RN0m2YesdpJbRhPzMO14b5Rl84dNwYg3WRxY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQDK9BCj+f/7eXIptZGJCxbcDrwCtLy1jTktFAHzGWgkcugp6e
	6x5uWZ/CTjx117n5eTOEGNg9dfTehpPmYSsge54C+4iyYdkYuwhQ0RdS7QGkmE6FR6UIoPUUSlW
	EpqbcVgg90Sl9fqI0iYaJTzhGE88OP5M=
X-Gm-Gg: AYBFou0/YDHjq/6fdICQHfbTHNwZ5HP55tqRFdfAaUkyV817sc1hOipaXpuz5zMqAib
	y9yH4d3u14838/oqP+z1A/nsAp6d55/tBbFvSlcFPbJ5cGQA/t/sqg/3J60yGeXd+JUjLizkZBv
	HY/067yjZZKMLp5rGdbII7ZYqGe1ukRDK0DSZXeUDaXh2kyVMDFCqBwjePimrZugW1FMBCu5/5B
	RuD9jH8E/rWLNCYe1WTkDNOl+Rs8QOE9Sz8a9C2nLRF0ABoNTO3WBMMwN1c3hhU3PhZ6+FGB9M7
	98ZLKG74REeYB246eIzJIqaGf8+OulyXm8dSOyezRJcLMFTOPVvpBEI=
X-Received: by 2002:a17:90a:e7c9:b0:3a4:85c4:68fc with SMTP id
 98e67ed59e1d1-3a4d1545a03mr2271482a91.29.1790797769174; Wed, 30 Sep 2026
 12:49:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926-nsfs-prune-rfc-v2-0-53509260e4e7@gmail.com>
 <20260926-nsfs-prune-rfc-v2-1-53509260e4e7@gmail.com> <CANaxB-yj2QV183nk3UC-2PD6qh6hh-_iLRuryTdUsebd+RqxdA@mail.gmail.com>
In-Reply-To: <CANaxB-yj2QV183nk3UC-2PD6qh6hh-_iLRuryTdUsebd+RqxdA@mail.gmail.com>
From: Kirill Kolyshkin <kolyshkin@gmail.com>
Date: Wed, 30 Sep 2026 12:49:18 -0700
X-Gm-Features: AclHuK_hWd00XXCC76l8VVWW4Hx6PvZ0qFMn_sLHCwFO53Dqn518ibmeNSsj6yg
Message-ID: <CAGmPdrwOnNRHJqk1mZVB+tFCnJBr3ZTaSZqbiGu54kXPkMtRoQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mount: add OPEN_TREE_DROP_MNTNS_MOUNTS
To: Andrei Vagin <avagin@gmail.com>
Cc: Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Aleksa Sarai <cyphar@cyphar.com>, Jan Kara <jack@suse.cz>, Jeff Layton <jlayton@kernel.org>, 
	"Eric W . Biederman" <ebiederm@xmission.com>, David Howells <dhowells@redhat.com>, 
	Amir Goldstein <amir73il@gmail.com>, Andrei Vagin <avagin@google.com>, Shuah Khan <shuah@kernel.org>, 
	Giuseppe Scrivano <giuseppe@scrivano.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	containers@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 10:22=E2=80=AFAM Andrei Vagin <avagin@gmail.com> wr=
ote:
>
> On Sat, Sep 26, 2026 at 12:01=E2=80=AFAM Kir Kolyshkin <kolyshkin@gmail.c=
om> wrote:
> >
> > A recursive open_tree(OPEN_TREE_CLONE) copies the nsfs mounts of any
> > mount namespaces pinned below the source.  When the clone is attached
> > inside a mount namespace younger than a pinned one, move_mount(2) fails
> > with ELOOP from check_for_nsfs_mounts(), per the rule from commit
> > 8823c079ba71 ("vfs: Add setns support for the mount namespace") that
> > prevents mount namespace reference loops.
> >
> > This breaks container runtimes that use OPEN_TREE_NAMESPACE, such as
> > crun [1].  The new namespace is younger than everything else, so bind
> > mounting e.g. the host root fails on any host that pins a mount namespa=
ce
> > (snapd does, under /run/snapd/ns).  By the time it fails, setns() has
> > already run and userspace cannot recover: the host tree is out of reach=
,
> > and the offending mounts cannot be unmounted from the detached copy.
> >
> > copy_mnt_ns() and create_new_namespace() already leave these mounts
> > behind; only get_detached_copy() copies them.  Add an open_tree() flag =
to
> > drop them from the clone, as suggested by Aleksa [2].  Locked nsfs moun=
ts
> > are dropped the same way copy_mnt_ns() does it, so nothing new is expos=
ed.
> >
> > Keep it opt-in: open_tree(OPEN_TREE_CLONE) plus move_mount(2) is how
> > mount --rbind works through a file descriptor, and in the caller's own
> > or an older namespace such mounts remain usable.
> >
> > The flag requires OPEN_TREE_CLONE or OPEN_TREE_NAMESPACE.  With the
> > latter it is a no-op, so a runtime can pass it unconditionally.
> >
> > Link: https://github.com/containers/crun/issues/2262 [1]
> > Link: https://lore.kernel.org/all/2026-01-07-oldest-grim-captions-spill=
s-ywC2O3@cyphar.com/ [2]
> > Assisted-by: Claude:claude-opus-5
> > Signed-off-by: Kir Kolyshkin <kolyshkin@gmail.com>
> > ---
> >  fs/namespace.c             | 14 ++++++++++++--
> >  include/uapi/linux/mount.h |  1 +
> >  2 files changed, 13 insertions(+), 2 deletions(-)
> >
> > diff --git a/fs/namespace.c b/fs/namespace.c
> > index ae5dc64f8b45..a95173996a8f 100644
> > --- a/fs/namespace.c
> > +++ b/fs/namespace.c
> > @@ -3062,7 +3062,8 @@ static struct mnt_namespace *get_detached_copy(co=
nst struct path *path, unsigned
> >                         ns->seq_origin =3D src_mnt_ns->ns.ns_id;
> >         }
> >
> > -       mnt =3D __do_loopback(path, (flags & AT_RECURSIVE), CL_COPY_MNT=
_NS_FILE);
> > +       mnt =3D __do_loopback(path, (flags & AT_RECURSIVE),
> > +                           (flags & OPEN_TREE_DROP_MNTNS_MOUNTS) ? 0 :=
 CL_COPY_MNT_NS_FILE);
>
> Overall, the patch looks good. One small thing is that open_tree() with
> OPEN_TREE_DROP_MNTNS_MOUNTS doesn't fail on a mntns file if AT_RECURSIVE
> isn't set:
>
>   open_tree(AT_FDCWD, "/proc/self/ns/mnt",
>             OPEN_TREE_CLONE|OPEN_TREE_CLOEXEC|0x4) =3D 3
>
> With AT_RECURSIVE, __do_loopback() calls copy_tree(), which checks
> !(flag & CL_COPY_MNT_NS_FILE) && is_mnt_ns_file(dentry) and returns
> -EINVAL, but without AT_RECURSIVE it calls clone_mnt(), which doesn't
> have such check.

Thanks! A call with arguments like this does not make any sense*, as you're
asking to clone a pinned mount namespace while skipping it.

* except maybe to check if the path is indeed a pinned mount namespace,
but there are cheaper ways to do it.

That said, we can either keep things as is, or
1. require AT_RECURSIVE with OPEN_TREE_DROP_MNTNS_MOUNTS
    when checking valid flags; probably the easiest thing to do;
2. add a check to a non-recursive path in __do_loopback, something like:
    if (!(copy_flags & CL_COPY_MNT_NS_FILE) && is_mnt_ns_file(old_path->den=
try))
       return ERR_PTR(-EINVAL);

I'm going to implement either one in the next iteration (v3); do you have
a preference?

Kir.

>
> Thanks,
> Andrei
