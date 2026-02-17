Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2269316189
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Feb 2026 23:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771370022; cv=pass; b=QJ9x+WWpoY9udSAivgf6ACcwryhj5jehG+UmRIEa12wjefAqyWZZFgB8HVXl2HoVauZ5V6oa95rDC6eCnrGxIG4gjPXAw3hXtYRWVQTQ5rrE3RF0fxeV3YAr4d36vVTp/CBvDOmGPfFr7tf1oZMA684Ll689+ksGxZDjWnnzR2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771370022; c=relaxed/simple;
	bh=r79iQhNrRyLXah4G9YOSWVaBuc5LQcACm1x/uvKMWos=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CSJ70ExWsGDrNh1QO+VrZvGCTpo8sqf03SjUQD8gcj17H+bTE6Iu/iLewotLJrrxE2glmgpa9hao9sWvyrNVBATkuYLN/KdJCgWTNrHlqzgJsi1Oo4fJq8QdgEtJGfmz54Ye/pT9WwFMWgGe3mf1rsb/3OpxLGpaKKHzlqWNIw4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GYwo2P37; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GYwo2P37"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b8850aa5b56so202148366b.2
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Feb 2026 15:13:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771370019; cv=none;
        d=google.com; s=arc-20240605;
        b=JaGInF+0KRHXeUBbhnTa2TOi8+OO+b7nem4GGCe3NPLbsw3qy9MXMlOg0wuaK6949M
         Tox/MX984WXcHXgqfFqvUivveT2Ejh3V0qpzRHCvGKX/U+DjhJ9b9Ao5HYyM9t9pOqih
         1uMqm8yRJQ5Eir0E25Srm/hSerYCxQAA9eOJr0aCfJQM9VtqtI/p/dmU/iNX2FAjZAHZ
         f/clWGgqNT+1G11HeG9p2UxNujDdcx5M08XlqhHap+wHTlTj3uEEDxV9dP2Y5mz29w44
         3fqvNmQ3vVQrw7feHhbe2d80olGvDwtbkRbTPCsJnuvJigfeqEaIWLGolONwLug4Rhhn
         L39A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lBoiDccagGFr7t/Rdt9JIQl1MV82SoTCGhUB9Q/6K18=;
        fh=kJlfNVEqAuW9ZHeQmI5wcznlFnU5mAkHpdoy35LAMUw=;
        b=cFrOgVMlKsviBsiHzliiSbfnFpeEyFyja6dFs18lxduv0JR0MjvngYRUpi4Te0TYPx
         djACg9gJ5LzePM5A3cuEd8zPE8QuKrwDO6nlOJJkjSW9ZPPv8nKi2NXVwXky35movrXa
         ZPCBPpOBJy1HWe34j4BV7XoZbbP9RWhIwhCMqWGgmq+Jaa3XV86tcV6kUnZr05xbDNQl
         Uic0I6rZ3GuZ2/2c3HS4746u2L8sRL6zWhbtAAGxl+vs6auTG/Qetp5lZvpA/KMIimBo
         +7YxiSpJUzGumyoAK/5o5mflVLzGsVH8I5bhGLhn+jjLgW3I4glWZoJw5SEuE6Uf4u5x
         lbpA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771370019; x=1771974819; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lBoiDccagGFr7t/Rdt9JIQl1MV82SoTCGhUB9Q/6K18=;
        b=GYwo2P374OGPIRSL8ahSMr3tYI+GVcmhyuhgf0u92+f4xLJors3KeHbwqFQ1r9DuFt
         YTqvPWIMAqJUGcOw9TR5h3DDoeV+cMLZJ1NL+I2W9W6XHYGhLRcAgTfUrRqDrXr2v1un
         S846PICCuLLaZ+SVK6mYuaLt6HFwHrqzc4zlkIoqX/xiuVw24tOu5sJekFQ1N+P247+O
         KiER96h2knhGogDqNYvdGGSZzUmu0C0AXP5/pml19YKnfejc0kLVHx6YqhvD9cwq3Pa6
         5YVwB+bGEmmXWS8sJKlRTnCjsT9+71DMGHfqwuzyi+8JPJZ7AgHIkZrNEF6iA7kg0yEx
         Eq2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771370019; x=1771974819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lBoiDccagGFr7t/Rdt9JIQl1MV82SoTCGhUB9Q/6K18=;
        b=iTj7v9biIy+CN51h97oRFDfrvfb/nBGH4v15LTmUknwA5i8TA9+Kr43YVaZ6duNxKe
         VDk3Kawu2D5G8rZiqtkYaVt0MJEIuS7gzadPx+CwV4zqogcq4JrjzupvXy4/jRk7pWiO
         gzjnJBZ0Tef3S575qA3A3Rd4fCNDyXwxOxgcOlUyF8vGbpTTZQaeMWIE7eSrz38KQIlK
         i2CtxX5zeppE0Tk/dSXn9YPPtVbwl1B5ofTEtpIIcdmmpEgM21HAHZcnoMbQu7BusCf1
         69AEhmhy8rb6kVgmyYAqGdFyhMS1riEZ9K+ImG/2fUP1sMzZuCGakUfo+PmqZbPPxvh9
         GHsQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7IbxGUFbIWMh69p4z4Khoev3rdDkAiix4eZCqLBekgW0aPjkepBo1hNnz6gcgmQjBi2dON47CDGfZSe5pOxE=@vger.kernel.org
X-Gm-Message-State: AOJu0YykqjWpTxvn781eo4xb8qXeTAP6fUPym31zb0pk+ud2ocR6iO/g
	Jjx1Z6HcEruCgJJ+1LM88BR9mopEmrB3QiOqpHgZRmertfoMk9O7OBP5lietARxCnKB+3Dq831D
	XV+KFLO5mOKJC7N0a/oteq1tntGCq5t+ulpU3
X-Gm-Gg: AZuq6aK1LRJPX4VTXiLmQPfkXZTpxF89DgNmwxYF4Cqh7D3N8v0pM4lK2Lt01YfMaR7
	uiL/o2mFQCqnIY7ukiTuCZ+lOnBt9uFGfs2Aq50FayvxmBJ2YkQEkGvf65j3EBEWf/29l+8pr0f
	vbLpb4Y8V0VtPtPiVFmv3jA4ib9WFy58YEoCWlnvS/TO3rqtmkhmHPJdLafn+AsuQve314BA0cS
	zAhM6qkIHM8ZfmB1T7yv4kf6WVbL9/4PinyQ1vF0IrfgpI0mv44mT9khG6sYZKDx1gNklNESAzr
	KfqQY5wn
X-Received: by 2002:a17:907:9808:b0:b90:48b:b53c with SMTP id
 a640c23a62f3a-b90048bb667mr408965466b.32.1771370018919; Tue, 17 Feb 2026
 15:13:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260212215814.629709-1-tjmercier@google.com> <20260212215814.629709-3-tjmercier@google.com>
 <aZRAkalnJCxSp7ne@amir-ThinkPad-T480> <CABdmKX3wsWphRTDanKwGGiUWoO0xTaC8L_QxjHzhpxfZn256MQ@mail.gmail.com>
 <CAOQ4uxgrP=VdTKZXKcRE8BeWv6wZy7aFkUF-VoEpRSxVnHZi2w@mail.gmail.com> <CABdmKX1ztzJ6B13uzdDtN-uVWbdWuYJ6PMvjGoAfu40MMHCpaA@mail.gmail.com>
In-Reply-To: <CABdmKX1ztzJ6B13uzdDtN-uVWbdWuYJ6PMvjGoAfu40MMHCpaA@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 18 Feb 2026 00:13:26 +0100
X-Gm-Features: AaiRm52hU7QfH-Wv9-Iuqet313dBf2qvcHaBiSfPSpB5qXd2EOgSyRj8MoDjcQo
Message-ID: <CAOQ4uxijd+viTGvQ8Mn1sLMH7dk1cGUmyU_n4HfW5Pg4FLLRPg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] kernfs: send IN_DELETE_SELF and IN_IGNORED on file deletion
To: "T.J. Mercier" <tjmercier@google.com>
Cc: gregkh@linuxfoundation.org, tj@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, jack@suse.cz, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 18, 2026 at 12:32=E2=80=AFAM T.J. Mercier <tjmercier@google.com=
> wrote:
>
> On Tue, Feb 17, 2026 at 1:25=E2=80=AFPM Amir Goldstein <amir73il@gmail.co=
m> wrote:
> >
> > On Tue, Feb 17, 2026 at 9:26=E2=80=AFPM T.J. Mercier <tjmercier@google.=
com> wrote:
> > >
> > > On Tue, Feb 17, 2026 at 2:19=E2=80=AFAM Amir Goldstein <amir73il@gmai=
l.com> wrote:
> > > >
> > > > On Thu, Feb 12, 2026 at 01:58:13PM -0800, T.J. Mercier wrote:
> > > > > Currently some kernfs files (e.g. cgroup.events, memory.events) s=
upport
> > > > > inotify watches for IN_MODIFY, but unlike with regular filesystem=
s, they
> > > > > do not receive IN_DELETE_SELF or IN_IGNORED events when they are
> > > > > removed.
> > > > >
> > > > > This creates a problem for processes monitoring cgroups. For exam=
ple, a
> > > > > service monitoring memory.events for memory.high breaches needs t=
o know
> > > > > when a cgroup is removed to clean up its state. Where it's known =
that a
> > > > > cgroup is removed when all processes die, without IN_DELETE_SELF =
the
> > > > > service must resort to inefficient workarounds such as:
> > > > > 1.  Periodically scanning procfs to detect process death (wastes =
CPU and
> > > > >     is susceptible to PID reuse).
> > > > > 2.  Placing an additional IN_DELETE watch on the parent directory
> > > > >     (wastes resources managing double the watches).
> > > > > 3.  Holding a pidfd for every monitored cgroup (can exhaust file
> > > > >     descriptors).
> > > > >
> > > > > This patch enables kernfs to send IN_DELETE_SELF and IN_IGNORED e=
vents.
> > > > > This allows applications to rely on a single existing watch on th=
e file
> > > > > of interest (e.g. memory.events) to receive notifications for bot=
h
> > > > > modifications and the eventual removal of the file, as well as au=
tomatic
> > > > > watch descriptor cleanup, simplifying userspace logic and improvi=
ng
> > > > > resource efficiency.
> > > >
> > > > This looks very useful,
> > > > But,
> > > > How will the application know that ti can rely on IN_DELETE_SELF
> > > > from cgroups if this is not an opt-in feature?
> > > >
> > > > Essentially, this is similar to the discussions on adding "remote"
> > > > fs notification support (e.g. for smb) and in those discussions
> > > > I insist that "remote" notification should be opt-in (which is
> > > > easy to do with an fanotify init flag) and I claim that mixing
> > > > "remote" events with "local" events on the same group is undesired.
> > >
> > > I think this situation is a bit different because this isn't adding
> > > new features to fsnotify. This is filling a gap that you'd expect to
> > > work if you only read the cgroups or inotify documentation without
> > > realizing that kernfs is simply wired up differently for notification
> > > support than most other filesystems, and only partially supports the
> > > existing notification events. It's opt-in in the sense that an
> > > application registers for IN_DELETE_SELF, but other than a runtime
> > > test like what I added in the selftests I'm not sure if there's a goo=
d
> > > way to detect the kernel will actually send the event. Practically
> > > speaking though, if merged upstream I will backport these patches to
> > > all the kernels we use so a runtime check shouldn't be necessary for
> > > our applications.
> > >
> >
> > That's besides the point.
> > An application does not know if it running on a kernel with the backpor=
ted
> > patch or not, so an application needs to either rely on getting the eve=
nt
> > or it has to poll. How will the application know if it needs to poll or=
 not?
>
> Either by testing for the behavior at runtime like I mentioned, or by
> depending on certification testing for the platform the application is
> running on which would verify that the selftests I added pass. We do
> the former to check for the presence of other features like swappiness
> support with memory.reclaim, and also the latter for all devices.
>
> > > > However, IN_IGNORED is created when an inotify watch is removed
> > > > and IN_DELETE_SELF is called when a vfs inode is destroyed.
> > > > When setting an inotify watch for IN_IGNORED|IN_DELETE_SELF there
> > > > has to be a vfs inode with inotify mark attached, so why are those
> > > > events not created already? What am I missing?
> > >
> > > The difference is vfs isn't involved when kernfs files are unlinked.
> >
> > No, but the vfs is involved when the last reference on the kernfs inode
> > is dropped.
> >
> > > When a cgroup removal occurs, we get to kernfs_remove via kernfs'
> > > inode_operations without calling vfs_unlink. (You can't rm cgroup
> > > files directly.)
> > >
> >
> > Yes and if there was a vfs inode for this kernfs object, the vfs inode =
needs to
> > be dropped.
>
> It should be, but it isn't right now.
>
> > > > Are you expecting to get IN_IGNORED|IN_DELETE_SELF on an entry
> > > > while watching the parent? Because this is not how the API works.
> > >
> > > No, only on the file being watched. The parent should only get
> > > IN_DELETE, but I read your feedback below and I'm fine with removing
> > > that part and just sending the DELETE_SELF and IN_IGNORED events.
> > >
> >
> > So if the file was being watched, some application needed to call
> > inotify_add_watch() with the user path to the cgroupfs inode
> > and inotify watch keeps a live reference to this vfs inode.
> >
> > When the cgroup is being destroyed something needs to drop
> > this vfs inode and call __destroy_inode() -> fsnotify_inode_delete()
> > which should remove the inotify watch and result in IN_IGNORED.
>
> Nothing like this exists before this patch.
>
> > IN_DELETE_SELF is a different story, because the inode does not
> > have zero i_nlink.
> >
> > I did not try to follow the code path of cgroupfs destroy when an
> > inotify watch on a cgroup file exists, but this is what I expect.
> > Please explain - what am I missing?
>
> Yes that's the problem here. The inode isn't dropped unless the watch
> is removed, and the watch isn't removed because kernfs doesn't go
> through vfs to notify about file removal. There is nothing to trigger
> dropping the watch and the associated inode reference except this
> patch calling into fsnotify_inoderemove which both sends
> IN_DELETE_SELF and calls __fsnotify_inode_delete for the IN_IGNORED
> and inode cleanup.
>
> Without this, the watch and inode persist after file deletion until
> the process exits and file descriptors are cleaned up, or until
> inotify_rm_watch gets called manually.
>

Yeh, that's not good.
Will be happy to see that fixed.

Thanks,
Amir.
