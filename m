Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D53532AAB2
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Feb 2026 17:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771607771; cv=pass; b=kbWxZAts514cUnKnsp3IBFmQRn3fhFOwqf9uKeI20f5kKZ8IHPCrvj0Firddwc3wEmAJfofYTP0IiZmLLEirrVRIl4ItTL/io+FDnzcfVlNjwbkJpMoVBWodEydYmSYvKWt0yEH2S+VYbU/mkzqMLCESWvcCGQacYN+hH3pHvUg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771607771; c=relaxed/simple;
	bh=qUpADLv3fW4c6VKkfzK/U52QH49WpAV8Od6WUnTJ06g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fF6Wob3DHtggsmnB1WruKAgF7cUiUPS/Ohrl5EMrozGSx/6BRbbX7fYvT5t7aBI2tS//k/uy7FfQrqjR5WLNJhShzPZWjhNK9XntKUUvLQ3tzvCEj6/948bTIkXR26cmQMMionp6T11fs6q/POg6nf+xWz6vbP8QujzkZ46mGVI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T7lquW24; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T7lquW24"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-65c01595276so3481866a12.1
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Feb 2026 09:16:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771607769; cv=none;
        d=google.com; s=arc-20240605;
        b=Coybn1AK0JfRyj+TNoLbyFAqG56WuWDP4gsgNjPGyCjxfRW91D6h9bEG8+mV/wWYgf
         D2G3JKC5a7TP2VhIbAKIf0LWWQAH9XzqWdnXHBfLbX7bF4Ioc0ovy3+cfCqOWQJRD8hc
         +pwm9pmbO/B1YOAXXE+84VCJuU2V0SGp5WY5bq8/AeRKp7Ie6WFDvlTng/KplrwKT/v3
         4tfeBgeX6ZaE+D5UeLDolpip91ECgXFI3E40DhCAzhBaZ+5H9HOq0RbKteLbcMfUw89P
         OzjjbOxpIjY58uCQPxEaaiii7zZU0lO4ZoDWOhkErlEU3uL48akR7e7BiDqCnO+OxUJo
         +ESQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+FIG9q/M+yTBjTrAHAw7SaWHpsPSmQOUIDS7bx4BpBE=;
        fh=XhBfG+/0ie6uaS+DdRI6PwmBHKA1JbmzxEdQa4PMkuo=;
        b=VP98uWjna5UnxqDcoFjZ9KzuWVmkhcaaMlLMirL0uLgaF7eM4ub9EYoj2gtjw1KpLX
         x3Hjkxpd9Bwxlk5doAdo9p1dS0e9pcRAFMxqlYZeSq7FpzI776i+Br0tzPsu0OLNcnB7
         0x4pSqgkcxO90UIMY/zlMTKxQ2qnSo8zcUlxcHY+NyvD9fpGVYZpUTVSElqdPm5Ot5Zl
         UrnxNNYXSocREh36CBqGsyy8Etbo4TPZa6UL92ewD4ETd1+o+Zz57Fqp4VhCYk52SRCf
         l8zqhOxL0YjDncMLDA02Qg8MMUzhkhluKyjCgONwYw/2pnHVE91sw9in329PsS1/rWHr
         SfGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771607769; x=1772212569; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+FIG9q/M+yTBjTrAHAw7SaWHpsPSmQOUIDS7bx4BpBE=;
        b=T7lquW24vMSRjgoEygIGRyE08/+q4o+RUfMXAZBhrE/0bR2snow2U7+jW02AKYKsl3
         0YinK1VhhMdJbjruFy0rRj7VFT1eAKRxExNJgq+w/96MK3FpoSSbHoiwo568oGgUFcV/
         BadXZPqH8QETK/iUAk+5JN3M8UF9i2vEDzFR1Lh/p/SNlEEaxzxLlhOKAd5iMABhg67Y
         g/Ad2mlze4BV1iucz8EwJBH6ee0Zlnk+ZY8V/3L7z0QnrI3Se4T5q+ukxFzE+g1cD60d
         vQVR09MX8uP3WurKjZkhRDQEA3klgP4YGhWfAa8WAIkHgux/rUjyFrQD1qx6bzq5Ytka
         qlyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771607769; x=1772212569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+FIG9q/M+yTBjTrAHAw7SaWHpsPSmQOUIDS7bx4BpBE=;
        b=rWXnl0SnHq6sBf6RI1H31MoMnYTZOss//Oo3M5YWSbCrXxWS+Vbwl5Sag9bqBSYs6Q
         bl+mUVfe6o/ddOeL+hwHsgbImpRTTVhU38VJnlPr5dB98RfYkFCoSzzq7LePIokL2TPv
         Q0X2TM8IZJu1nbwEdbDo26KWW6GsOeFZAxjGqjzd3+kBzB22Ads4CZm+Py8yxWITj2eK
         ZHBOA5GMjEdo6fWzCHYYcbrhw7pIOd+XDNnkmwLEGKDIWhlM5CR5c4Ab/IN4yjG5uuYY
         1sh5h+/b68WpRDqAULTiCQxvyV1NZ37P5T/VCwYe5O5IRtbxXqaQxHmaZDF+VJpRA6P8
         vB0g==
X-Forwarded-Encrypted: i=1; AJvYcCWXUcG3bJUGX+j0gdljrGHYoLgE+4qpuUI8011IbHG7crCw6HkFbQsgOg69tgyuhbCuOdf1KZeltlHg52XB3qI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsfVOXlkL/XhCxmwDENWt7KdPNA5tMQxxV0ZR/HLo7MteCdLhJ
	CAB7T1rVo3bYO68s+FUvh6W9pu/ajLmGshQ1ukCvpiACSgFSnK9CgQFl5LIJm/HoasdCDFc51hQ
	keUGty4G2bThrRQ2nILvUo5Fz2diFuxk=
X-Gm-Gg: AZuq6aLC6koBMeuY1V8QGePjstDJPdeO3IqwyLIqN2HYP8ikQzMmL5mQR61UwXST9qV
	vHF6VpzzeRBpR75IeOen7kf2QhM2Vn1cC1LQS/KOUU921db4yQLYt9a7VLgbDHYxc0DyKto4ObG
	3pHIZvcljtbtnMwtP2e6su4m+U/fzo2SoOItf2/MKKicogmZf4A3KA78XU5yvLTtSL609saKWEu
	ryEO8arcHw2JQb+oOyJ53oUo0dfF791byfs6zNAKVUbEIz8pldEriKJTNEMZQMFbNBmWGJz6aPT
	FqdWPvoudGPLsP6XU6siRj46tEZRawuBWuNIstV9gg==
X-Received: by 2002:a05:6402:50d2:b0:64b:58c0:a393 with SMTP id
 4fb4d7f45d1cf-65ea4f07f63mr241574a12.30.1771607768401; Fri, 20 Feb 2026
 09:16:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260220055449.3073-1-tjmercier@google.com> <20260220055449.3073-3-tjmercier@google.com>
 <aZh-orwoaeAh52Bf@slm.duckdns.org>
In-Reply-To: <aZh-orwoaeAh52Bf@slm.duckdns.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 20 Feb 2026 19:15:56 +0200
X-Gm-Features: AaiRm51-NxZivWP9n79oFDzWvBAa9d7rBDJz7DAiXkp5nty2l6CfzMRpgIoYHak
Message-ID: <CAOQ4uxjgXa1q-8-ajSBwza-Tkv91tFP-_wWzCQPW+PwJMehEWA@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] kernfs: Send IN_DELETE_SELF and IN_IGNORED
To: Tejun Heo <tj@kernel.org>
Cc: "T.J. Mercier" <tjmercier@google.com>, gregkh@linuxfoundation.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	cgroups@vger.kernel.org, linux-fsdevel@vger.kernel.org, jack@suse.cz, 
	shuah@kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 20, 2026 at 4:32=E2=80=AFPM Tejun Heo <tj@kernel.org> wrote:
>
> Hello,
>
> On Thu, Feb 19, 2026 at 09:54:47PM -0800, T.J. Mercier wrote:
> > Currently some kernfs files (e.g. cgroup.events, memory.events) support
> > inotify watches for IN_MODIFY, but unlike with regular filesystems, the=
y
> > do not receive IN_DELETE_SELF or IN_IGNORED events when they are
> > removed. This means inotify watches persist after file deletion until
> > the process exits and the inotify file descriptor is cleaned up, or
> > until inotify_rm_watch is called manually.
> >
> > This creates a problem for processes monitoring cgroups. For example, a
> > service monitoring memory.events for memory.high breaches needs to know
> > when a cgroup is removed to clean up its state. Where it's known that a
> > cgroup is removed when all processes die, without IN_DELETE_SELF the
> > service must resort to inefficient workarounds such as:
> >   1) Periodically scanning procfs to detect process death (wastes CPU
> >      and is susceptible to PID reuse).
> >   2) Holding a pidfd for every monitored cgroup (can exhaust file
> >      descriptors).
> >
> > This patch enables IN_DELETE_SELF and IN_IGNORED events for kernfs file=
s
> > and directories by clearing inode i_nlink values during removal. This
> > allows VFS to make the necessary fsnotify calls so that userspace
> > receives the inotify events.
> >
> > As a result, applications can rely on a single existing watch on a file
> > of interest (e.g. memory.events) to receive notifications for both
> > modifications and the eventual removal of the file, as well as automati=
c
> > watch descriptor cleanup, simplifying userspace logic and improving
> > efficiency.
> >
> > There is gap in this implementation for certain file removals due their
> > unique nature in kernfs. Directory removals that trigger file removals
> > occur through vfs_rmdir, which shrinks the dcache and emits fsnotify
> > events after the rmdir operation; there is no issue here. However kernf=
s
> > writes to particular files (e.g. cgroup.subtree_control) can also cause
> > file removal, but vfs_write does not attempt to emit fsnotify events
> > after the write operation, even if i_nlink counts are 0. As a usecase
> > for monitoring this category of file removals is not known, they are
> > left without having IN_DELETE or IN_DELETE_SELF events generated.
>
> Adding a comment with the above content would probably be useful. It also
> might be worthwhile to note that fanotify recursive monitoring wouldn't w=
ork
> reliably as cgroups can go away while inodes are not attached.

Sigh.. it's a shame to grow more weird semantics.

But I take this back to the POV of "remote" vs. "local" vfs notifications.
the IN_DELETE_SELF events added by this change are actually
"local" vfs notifications.

If we would want to support monitoring cgroups fs super block
for all added/removed cgroups with fanotify, we would be able
to implement this as "remote" notifications and in this case, adding
explicit fsnotify() calls could make sense.

Thanks,
Amir.
