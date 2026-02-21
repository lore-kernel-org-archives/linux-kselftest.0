Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CEF2DFA54
	for <linux-kselftest@vger.kernel.org>; Sat, 21 Feb 2026 16:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771690303; cv=pass; b=HJBV32tn9ml4Lwi+83bxqgg3HXo6Ogupd5rlUxsp4WfMDDT/5Wuc5qRQJS2OzCxvBk8WR84yMEsswLR8VmYw1nwDMoKbIiTlwTspCLU8gDP2OEIVkfnCFZ8NGCBfG+RH6HCCA0N5fz2gAUPYP2PTVxhiT7TGvbxs9UbtRO1Eu7o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771690303; c=relaxed/simple;
	bh=WFk2dMGDXodWdBOsas5Wh8VEIYFRodTYZpiky7YPwy4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z6ji4E5FGj04iJ0OMegusKCeh7fz/pAmin9tfDMKsSDlor8NFnI7J12ycVaNI0G/YklY6kmVOGqw0UH0NYLHW0A9R5P1ArpfKhxm404BODmrPogL676mFpNucBzWChbKJsaT0g7O8oe+8sC1+L9fR5yfJPaArnMmsu/nWT5LYdo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mUq9u3+l; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mUq9u3+l"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b8f8f2106f1so423801666b.2
        for <linux-kselftest@vger.kernel.org>; Sat, 21 Feb 2026 08:11:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771690301; cv=none;
        d=google.com; s=arc-20240605;
        b=XydW9gAD5rR/yOja2UySj+vpqODhaxF3+DTftZWHm4zzvvhgmBGHR2bnJFf2KyapX3
         rYHnsyBhi34dqKA2AkfUSYUZfdR7hX6aC7J9vTTKI04yEtd5FO9HAAGAEhoPoWWLA3rZ
         hzX80CKQDt90hjiI0OujDXOieSXeR3N+VTxrb6RbCvqLNur1emt2yo0PpYXFkOI3ViAy
         Nm29f/9yDm/h2V4wGJpgovyVmZT4KAbJI8j+VVT9nB69iUZa0lyGEzVw2hWF8DgbQ/SB
         s5NaoZWer2sxCFx6fDCTnVA0B5kj9xZmTi5Ccd6WWXWcOOtn7WiB4WNhf6ztt/ORTjBQ
         qpHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WFk2dMGDXodWdBOsas5Wh8VEIYFRodTYZpiky7YPwy4=;
        fh=oEs2gndQICwZo04dW83bI1cHdioE8Q6aKlwKioM6YIg=;
        b=SXsUqN2wMI51YrRuKHP6CSUdXERbjlxOEqrZ5d2vNVosNj0c5Lfh+o/yLHl4uzDPgG
         oOms/qkDNDYo+7E1KCUx8IDlzMd0a/xby9dkOZ7+hqhHG0g5c4ZtCTHdvf+o3OfVKHXs
         GxgdJPjKsBwXknJrI9JVc2K0/HzJqs5jHrRm09v4+pQcokVndK/KDDiUMw0sxf7Tdo4u
         HC130RqMilB1lsNZVN8wucpJZRtP9BaSXSJmQ3izqUtnFbPWt/Ty4OL9ZwB+HRuPcqFh
         aF1BCT/CmUnWvSuog80u4KCuRLGWLVe8Xyfq6c101Dj56B7pQXMjxdprHgdxpA5jHWyJ
         AcSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771690301; x=1772295101; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WFk2dMGDXodWdBOsas5Wh8VEIYFRodTYZpiky7YPwy4=;
        b=mUq9u3+llNJriYI2iwd1k/lQn3+8PEXC+MxxmLdX0Vc+O7L2bRz6K6Vg2tqRQK0zTP
         xSIO3mrf4GBmMe+1tX76JdAyziIp1yvfGsfTbbnP11I6HREYNrbrtWeF6ZmurwzUFMla
         RKnzD6D8LboyPVC5h6EJE+QZOI/yOpXWZDJQKCPyO1YFzqJ7Uu10iwSSQgKdtS1UmA/9
         wj5g4w7bzma9fUx1ocFMwjUouGaUi4gN4uskGBC0e9Wt0uA1bSYORgn8Y6iJuOJJ7vAL
         unam2Y5dvjZUsDfOIbju6Br2uv4rOQvBrTBqQ5nCLsuIUoS8zK9fKuv6N7zJYah6ag6/
         7+Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771690301; x=1772295101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WFk2dMGDXodWdBOsas5Wh8VEIYFRodTYZpiky7YPwy4=;
        b=Ip0KYUaSUmA5ox68T85KKEVZEXd9VmRYa2tpDXL/nJaP/ZI/Nzw8m86k3FiWl7FJDF
         u5eCZ4fc6O/2Vrocm9mgUQkuWQcqOB/Fh++4ZT/4ETfi/YGoLtBfNbtTSBeVt5ikv4sN
         9VFVF9hbNKnzmjFLzNcx/LDLJWza2RiuI5N2VYRix6NsvC+BEKHUGVlshs2niCoSCnPy
         PX5AuVXXXJxX1Bed8v+bm00Iyj+cTyOarx/yCSHt2EntyKB4na1K5K86LswzAHpq3tjZ
         zErZscA5BgNxvRHy3ZP+Y3Zo2n2NRAOeySX2iY77I7KwQWhHFK1w1WgyMZQLpJN7FaR4
         F3/A==
X-Forwarded-Encrypted: i=1; AJvYcCXZweMeX2OOwOTYazbNuy0B/x+GY/Kh+K/qmbAg7ZvBwjAHqAhmg/8kOYY/kFQUMcsSkvSK3VnlKdF9MfRCltg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi8WsVFulC2xyeZdh1Lndsg3EZpO3W3i6aPQKp4EorKEQXo3w0
	wtu/Q/2x2VEyGKnXgSgQL3LA8/3HX9uno/f7oUCz1wIeSKRAMhzZyQsjDP2J8NjdK9FatwCJO9P
	im4uegXSIF/+9BOh0T50XVEKp2nYnwQ4GrkTnEWc=
X-Gm-Gg: AZuq6aIhmGES+Y20BirOScjAg2ubGSG7/CxIbtv0SD4vMbAblv9Cq5b88vWqmj8fqLj
	H4U32ag7aAHRFL6uFw0J0s0P22Vtqzl5Ip6xPyVpeOTbgoxUdiz477wTamapPPjZshuya9XsnrX
	iU+m5XylY+3RFx84IqRqIprb0JjYcEaAtE4EORPZBLx1154G7hcfj+BD20MZs4N3JRydO8r3cWF
	qUFTDuIMafV3iJjwScvwBRAgvvr/KA8x8Rx+IkDP1Pm/tf9ERxmeziMRowiR1ighJ4CsULeszS3
	29Z3uD6V/o0jNsqsd6hNESh2BWEVLHW3bl51hVEN
X-Received: by 2002:a17:906:474a:b0:b87:7938:7b77 with SMTP id
 a640c23a62f3a-b9081b4adbfmr135784766b.30.1771690300450; Sat, 21 Feb 2026
 08:11:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260220055449.3073-1-tjmercier@google.com> <20260220055449.3073-3-tjmercier@google.com>
 <aZh-orwoaeAh52Bf@slm.duckdns.org> <CAOQ4uxjgXa1q-8-ajSBwza-Tkv91tFP-_wWzCQPW+PwJMehEWA@mail.gmail.com>
 <aZi6_K-pSRwAe7F5@slm.duckdns.org> <CAOQ4uxjZZSRBwZ2ZL31juAUu0-sAUnPrJWvQuJ2NDaWZMeq0Fg@mail.gmail.com>
 <aZju-GFHf8Eez-07@slm.duckdns.org>
In-Reply-To: <aZju-GFHf8Eez-07@slm.duckdns.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sat, 21 Feb 2026 18:11:28 +0200
X-Gm-Features: AaiRm50siD9H0RcvpiyV5fyHjGmjcm9TLE2lBYwftlepNHL-uvxe1pX7UaXUvqc
Message-ID: <CAOQ4uxgzuxaLt2xs5a5snu9CBA_4esQ_+t0Wb6CX4M5OqM5AOA@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] kernfs: Send IN_DELETE_SELF and IN_IGNORED
To: Tejun Heo <tj@kernel.org>
Cc: "T.J. Mercier" <tjmercier@google.com>, gregkh@linuxfoundation.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	cgroups@vger.kernel.org, linux-fsdevel@vger.kernel.org, jack@suse.cz, 
	shuah@kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 21, 2026 at 12:32=E2=80=AFAM Tejun Heo <tj@kernel.org> wrote:
>
> Hello, Amir.
>
> On Fri, Feb 20, 2026 at 10:11:15PM +0200, Amir Goldstein wrote:
> > > Yeah, that can be useful. For cgroupfs, there would probably need to =
be a
> > > way to scope it so that it can be used on delegation boundaries too (=
which
> > > we can require to coincide with cgroup NS boundaries).
> >
> > I have no idea what the above means.
> > I could ask Gemini or you and I prefer the latter ;)
>
> Ah, you chose wrong. :)
>
> > What are delegation boundaries and NFS boundaries in this context?
>
> cgroup delegation is giving control of a subtree to someone else:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup.git/tree/Docume=
ntation/admin-guide/cgroup-v2.rst#n537
>
> There's an old way of doing it by changing perms on some files and new wa=
y
> using cgroup namespace.
>
> > > Would it be possible to make FAN_MNT_ATTACH work for that?
> >
> > FAN_MNT_ATTACH is an event generated on a mntns object.
> > If "cgroup NS boundaries" is referring to a mntns object and if
> > this object is available in the context of cgroup create/destroy
> > then it should be possible.
>
> Great, yes, cgroup namespace way should work then.
>
> > But FAN_MNT_ATTACH reports a mountid. Is there a mountid
> > to report on cgroup create? Probably not?
>
> Sorry, I thought that was per-mount recursive file event monitoring.
> FAN_MARK_MOUNT looks like the right thing if we want to allow monitoring
> cgroup creations / destructions in a subtree without recursively watching
> each cgroup.

The problem sounds very similar to subtree monitoring for mkdir/rmdir on
a filesystem, which is a problem that we have not yet solved.

The problem with FAN_MARK_MOUNT is that it does not support the
events CREATE/DELETE, because those events are currently
monitored in context where the mount is not available and anyway
what users want to get notified on a deleted file/dir in a subtree
regardless of the mount through which the create/delete was done.

Since commit 58f5fbeb367ff ("fanotify: support watching filesystems
and mounts inside userns") and fnaotify groups can be associated
with a userns.

I was thinking that we can have a model where events are delivered
to a listener based on whether or not the uid/gid of the object are
mappable to the userns of the group.

In a filesystem, this criteria cannot guarantee the subtree isolation.
I imagine that for delegated cgroups this criteria could match what
you need, but I am basing this on pure speculation.

Thanks,
Amir.
