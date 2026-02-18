Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D8F309EE9
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Feb 2026 22:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771452659; cv=pass; b=UStdfTK5svbp9BP3e0G/w70Au7Rdpcg1A5JuV/Ivqvd2uyDrq6zeXWtwojljD+wxvkajuARNdPUgLLLgYqiYRCOSgTwyk9FDq8MoYv7UhpHmT0LUqVZZR4YmzrO1vgHPY5/6evPxiGpx257E2aWrnKqwvdm0RCE/aM21crwCFyE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771452659; c=relaxed/simple;
	bh=lPYt0pFhbd6M7kXSQtBzYZaVvT2A54L7thEUJD072Aw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VGBRs3Aa3Nz+1PAAOfryIvYzKYzxMfhacDuu+TWha4h6klKiUuXA+HJ2s5V5rW2sQuf+ScjNSvK7l7esLJZmNcuasuICLv1HVSi/W5vlRTt3xxUI88mIIkunfNz8l77O7j2dlzOO+AFxbbwxj0Aa5XzrXWaE8MGuX8uyyPp2IfA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gHXlcvqR; arc=pass smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gHXlcvqR"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48373ad38d2so26175e9.0
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Feb 2026 14:10:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771452656; cv=none;
        d=google.com; s=arc-20240605;
        b=a5uDri3A689ufvlBn7tRbzcHKdxd50gGBjG/26fNoVVd9G0J6BErOiIBU59Va+pm/5
         A9AeRa9BCDTbsIHfDWdkl+fm9rAJcrRNkuRagrJfeuVoKN6hXwcXOs8amJksA0zn8RQN
         vpcYEoqxmstlo+YEOjQg7X4HXoW3nkAbC1rTFefhWhZUx36zGOXu4rZm+271KamHjrdh
         RrQe2Y+itgECmKO+os8pmw5XmXtia+7U4OpSWfrk9Grl1hyln8oPkRVzsMZNVBRcn8QV
         gi4c5APX8XxByF2QhRO5cWduKo9SPM2VKR3FOXzXHot92s+uGsUglCuI1DC3OTPKbVai
         uRwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GFceulQD+cH2ZvMG6LJDvnAg6v30pKU0WTiw2QCY5N0=;
        fh=UXkWSpPXEHEDKSFPBsWCFtT7zluJmCy9y+DVq5gUG7o=;
        b=ec79gNVuaBkHtERFx4IU3C3B0aBGaqW82y07qsFfuv6c36JOkoM53MpuMmrm6yQNgR
         APjYEa9lPnI6a56qKyAOa4V2h3jlfOOiZAWwHWzzii2Wnidq5/ZdHMhn7CRDlCVyxD00
         rR32y3KAS06agxqUhKL8rocZzZlglnP8Qcz6nV3rxn0rmhx2ZkSmS86rJ5RILTZNtyka
         tRELICVRjJk+5J/sIML/h8Zw03cHO2c36AANE4csqaW6QcnP+Cex9HNvso//Ery/Go8V
         fW1o7smxPZeNpGKUHQPCdDOPo/yQBcEdKMcJO+HENjnCtwK5DPC604zO4aIyQFK972DH
         j+lw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771452656; x=1772057456; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GFceulQD+cH2ZvMG6LJDvnAg6v30pKU0WTiw2QCY5N0=;
        b=gHXlcvqRsCXRFRWgKe2rCQ+pBr2va665XoRPpX94fX/z6KkXa7Eek/zmzIcgqrrMt7
         2D29ca6OTzPQtkc0XnawaXDloZM2bveVMyzqxPugfnwsquJ9FP+xvG0InyqiwPbgni3e
         ZktSpe5qmA2gHbik95BElCBIHX8gL9NTrEBeOOec+BZqkN3J0jhUQFJ49+rLFwnTQeUP
         Qz7fhSkiAWGqyzwRslZ/TDy9iUQtEC7Vr/g8et7rgSs1RVELu4iW5Bvh640XmcCfM71Y
         bPzzb/m3mUnqsbrHNrW+6eQ78RU8UFE/jo0JTlqDpraGUCgODweN06T8F4/6r1W5p9dp
         /R2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771452656; x=1772057456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GFceulQD+cH2ZvMG6LJDvnAg6v30pKU0WTiw2QCY5N0=;
        b=ftUqGgCeTl3Ml8Yh6Qz96uBdMiiWWfjRRzFNJcPOlR40EWt2mWPuBcMUSHBlBPeRh6
         bq2D8HdwfqvgSDnfs/QNzHwSv6d8s9kOpHYLpJ24CjZPaVwXUAcEIV+qLPQMzhw5HK5I
         K6gOapHJUjb1o/j6sHVN1mLDBlbh6JCJj3lHPjqZfMjpc25as3FBANdpYhY29lFLZFqY
         2aPn1qzTYeDK3J69hyyXfwNKLo1if4aN8fG9dUDo2vi1sICgBDfoEqdH3co3vZIKo31Q
         Xjl+CBxtvpXstEsp8zOoniVBTwcY1s31VX8cYgwnmzvxK+b3hmrkdxGWFH7tf8hEXPzb
         55Dw==
X-Forwarded-Encrypted: i=1; AJvYcCVwrSm12nZpC8fazcNO7wU5Nlud5Y6S0NrJLYvpoTFmpFfD2c1hqVElL/OZmnlMt8zNjjtQ/ps9qQ0jFqm9v4I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjKr6jc+gc6/yut4qY4wD0mHpjuIkB8KzBSuLh9PXuAamCwcRC
	pvRvHyz/Ofo8rT2cFHK8dHwaEhrG2gg6CrbPwurQgispNuFmsrLYnREFpQ8P7D9fsfj+v7zAS+n
	S/WrTdNly+sNHJLe2TuiVRQxNKzAGfYBh5fY2w7GR
X-Gm-Gg: AZuq6aLdmEHQk4xlTEi5c4MnAIplajcFuGDLwMZ89PWMkaxsxxZ4WmcEeYQO4aMNpji
	Ldv1WIHtqUqKh1gRIeJla+hSfVxXDfCUkXHinw7hb84xLKFGm45/780pa2tnkrHvhynW9BwyMAi
	Wjz7RU2yUzXgrw6N1WyhCHenblJq07uRAun9ybGCjtzUuRQlj6ii5bDgrFNNrBJDoPRcw9XyY5i
	OoKC6deTH/UM0iDo4QRC6ssL50N3rOUfv9KyN5IRkrqs85Xo3qAgpnq4gjZhXNpEqcUfey0UwBf
	1F/a8OhnbOguXwylk9OhSzFNFfzuamnYiUxqJruF8G644ZxtdSApF51TG4orINA8rXqZbg==
X-Received: by 2002:a05:600c:3e06:b0:45f:2940:d194 with SMTP id
 5b1f17b1804b1-4839f8fbec9mr92205e9.2.1771452655867; Wed, 18 Feb 2026 14:10:55
 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260218032232.4049467-1-tjmercier@google.com>
 <20260218032232.4049467-3-tjmercier@google.com> <e7b4xiqvh76jvqukvcocblq5lrc5hldoiiexjlo5fmagbv3mgn@zhpzm4jwx3kg>
 <CABdmKX1S4wWFdsUOFOQ=_uVbmQVcQk0+VUVQjgAx_yqUcEd60A@mail.gmail.com>
 <s4vb5vshejyasdw2tkydhhk4m6p3ybexoi254qjiqexzgcxb5c@ctazolc3nh6f>
 <CABdmKX2cQCneFyZhTWmWYz-RTmAOQcEKh5ZQewz25E6Xfok1tQ@mail.gmail.com> <CABdmKX0BJcsv0TaPSsGN2a4nkQaKF=cX8rnnoL5kPTHNfuKL7Q@mail.gmail.com>
In-Reply-To: <CABdmKX0BJcsv0TaPSsGN2a4nkQaKF=cX8rnnoL5kPTHNfuKL7Q@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 18 Feb 2026 14:10:42 -0800
X-Gm-Features: AaiRm50oJmkhv3JVc8QRZs9eNQOIt0sVOkSFuyILAnwFvxKBu7Elyj-9uDHYoK8
Message-ID: <CABdmKX0DGP9=OOPwU8WjqHnmRDfPnxoAjm8Rvy-D2GYQX0GE0A@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] kernfs: send IN_DELETE_SELF and IN_IGNORED on file deletion
To: Jan Kara <jack@suse.cz>
Cc: gregkh@linuxfoundation.org, tj@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, amir73il@gmail.com, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 18, 2026 at 11:58=E2=80=AFAM T.J. Mercier <tjmercier@google.com=
> wrote:
>
> On Wed, Feb 18, 2026 at 11:15=E2=80=AFAM T.J. Mercier <tjmercier@google.c=
om> wrote:
> >
> > On Wed, Feb 18, 2026 at 10:37=E2=80=AFAM Jan Kara <jack@suse.cz> wrote:
> > >
> > > On Wed 18-02-26 10:06:35, T.J. Mercier wrote:
> > > > On Wed, Feb 18, 2026 at 10:01=E2=80=AFAM Jan Kara <jack@suse.cz> wr=
ote:
> > > > >
> > > > > On Tue 17-02-26 19:22:31, T.J. Mercier wrote:
> > > > > > Currently some kernfs files (e.g. cgroup.events, memory.events)=
 support
> > > > > > inotify watches for IN_MODIFY, but unlike with regular filesyst=
ems, they
> > > > > > do not receive IN_DELETE_SELF or IN_IGNORED events when they ar=
e
> > > > > > removed.
> > > > >
> > > > > Please see my email:
> > > > > https://lore.kernel.org/all/lc2jgt3yrvuvtdj2kk7q3rloie2c5mzyhfdy4=
zvxylx732voet@ol3kl4ackrpb
> > > > >
> > > > > I think this is actually a bug in kernfs...
> > > > >
> > > > >                                                                 H=
onza
> > > >
> > > > Thanks, I'm looking at this now. I've tried calling clear_nlink in
> > > > kernfs_iop_rmdir, but I've found that when we get back to vfs_rmdir
> > > > and shrink_dcache_parent is called, d_walk doesn't find any entries=
,
> > > > so shrink_kill->__dentry_kill is not called. I'm investigating why
> > > > that is...
> > >
> > > Strange because when I was experimenting with this in my VM I have se=
en
> > > __dentry_kill being called (if the dentries were created by someone l=
ooking
> > > up the names).
> >
> > Ahh yes, that's the difference. I was just doing mkdir
> > /sys/fs/cgroup/foo immediately followed by rmdir /sys/fs/cgroup/foo.
> > kernfs creates the dentries in kernfs_iop_lookup, so there were none
> > when I did the rmdir because I didn't cause any lookups.
> >
> > If I actually have a program watching
> > /sys/fs/cgroup/foo/memory.events, then I do see the __dentry_kill kill
> > calls, but despite the prior clear_nlink call i_nlink is 1 so
> > fsnotify_inoderemove is skipped. Something must be incrementing it.
>
> The issue was that kernfs_remove unlinks the kernfs nodes, but doesn't
> clear_nlink when it does so. Adding that seems to work to generate
> IN_DELETE_SELF and IN_IGNORED. I'll do some more testing and get a
> patch ready.

This works for the rmdir case, because
vfs_rmdir->shrink_dcache_parent->shrink_kill->__dentry_kill is invoked
when the user runs rmdir.

However the case where a kernfs file is removed because a cgroup
subsys is deactivated does not work, because it occurs when the user
writes to cgroup.subtree_control. That is a vfs_write which calls
fsnotify_modify for cgroup.subtree_control, but (very reasonably)
there is no attempt made to clean up the dcache in VFS on writes.

So I think kernfs still needs to generate fsnotify events manually for
the cgroup_subtree_control_write->cgroup_apply_control_disable case.
Those removals happen via kernfs_remove_by_name->__kernfs_remove, so
that would look a lot like what I sent in this v3 patch, even if we
also add clear_nlink calls for the rmdir case.
