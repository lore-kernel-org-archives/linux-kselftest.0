Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127382F39A1
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Feb 2026 19:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771442145; cv=pass; b=albSkUnNkoESLFYWC1JQmwYlTuUrRLYwCQDQVKHJfkIF5QLggiE1Vm+E6wp9lV9GmLfp/VVtCfWW235sLgWi0K4/jraR88a04T6XRF8bNwyRAwR0UxSba+orukg8zAwVWJtBhRNmjRWYN9YKrh27UK5Zh73LhUd9dy+wmBN8XiE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771442145; c=relaxed/simple;
	bh=wBFNCt7xEGs0VQ8C7Z13cB9OU5SAamOgWMLc8IFwhTg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FZwpmfSuPHGmOvuFpMc6x9vqVvaoIIIh2TQXheTQda6MgaBzAblRoKpSDRG7CdNnEnYkQNrndHDg738L30AVbNAi6xEeqPh1Fal+3ZVtO3HNNz+cx4uQgZ7Pa1fboxdgLv4GseIyR2nZqW33vzV00JPVv4yR8GAH5AR+adRAJug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=k0ibvlJR; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k0ibvlJR"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48373ad38d2so11175e9.0
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Feb 2026 11:15:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771442142; cv=none;
        d=google.com; s=arc-20240605;
        b=UcpbyRqQSNG1Dwq+Gf0cT3Blq/yFjbsg0SiXCK/0bKn/th0Bvdj5vE4luconDYX5+N
         acFgs32E4e74qg8SFZbT9JnkOWTspi9tQClN9e4pBsim5IFm2uHQKJOzL/WQB8yHDEbH
         r+TfOoL5OJIIt137c8ltv+XeGRpe/49L8on3a5gGvbeRZtYPu2D8tUQe4/t/P1LXnfn/
         pPNLGUkiMW/oQ+xRTmJntxjEsRHgtOCROsyTWnoo7janHk7CYw4dTKSbxSJkk68gUA/C
         4nDEtIvlsuPI+W97Lqq/porOPZrg3yFwtBtrS6bxl2xuOblhHkKIE7d6pU0bIUFttJy+
         pfmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uYEklyyKGYW2ZvnMpqijJPxd6tx0mQrMdEMbyIKAW9M=;
        fh=+cB9qjYqiexMIom8Afm1l1pc15eb7MUhb+2GLL17lnA=;
        b=VULmiAfeShsF2qITgocWl/sowAVmtvotzZ30qEmQjjk5T0xJK4kCVh/f95vwg7ZChI
         xmprcjgeJ1imXlcpMML9Dbw2TnfzAzrGQXOs143auFLmw5B1achvlpLbbViZk9CmfSo9
         tdINJczCJFUmuu28hsi4jysL1h+E0iLuxH4rCo0ZEjwUl0y/qVYefH7Sb396RsQj23pf
         jQAbTJ4SVkbE5X4/yLPj/oLG61fHMnvs6LG4LnHzSnKNtGwxYhs8BbJgAiPJ3d8w5h9d
         miD4dbXFz2pW2a9S2ftfXdPSbPsd5ttb3BFQTgga/6rre2f/7aaTRvAjDxF/GhGc6ZVs
         ISew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771442142; x=1772046942; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uYEklyyKGYW2ZvnMpqijJPxd6tx0mQrMdEMbyIKAW9M=;
        b=k0ibvlJRy1mVTRq7VYvbD4vaR8CC+E9EOCFYxbBvEcMiu+Tx0WEqNyYt077TVXI4yn
         Aet3xzHkFL304zxjRw0h3hq0DzVX8UgdfAHMymzQHth53T4mR8Yz1OKBwgCp/1m3+ann
         6QI/xLjsH3iGr4iGgLb+1xuFdaiEHHWGf05T2CfVH61JVQ6+17ww0WHB+9n4kSQ2J9fG
         M4eYQCasoQ1I5w/stnTD7P+A3zgag8s9G3+VD5XgSYLGN0OwNouBin3NRWee/u4WyEVf
         u6uVCTNq+2mEvXK5kybJ4rTyz6P6fn9WBz1RX9KLSV4TDumLZdYcrJqjGXej9ABFek4q
         3uBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771442142; x=1772046942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uYEklyyKGYW2ZvnMpqijJPxd6tx0mQrMdEMbyIKAW9M=;
        b=kesjFqwq49CSTDOE+mhj846w7/sezDScSHb14ATeikqZyR1M+8gjBVxMFCC/DVu09F
         4Hbwt9ArkI/HGYq4fCDQdMqP3XFW6mT8v62ZpvJiMfk8IQJ2TQTilQPSbvWtJOHCJBlu
         WNYEwotN/e6zRs1twj89juTK7nNsWyaAP4qXQUT83Dv62xQ/y8PTtKQWHVetyZr7sdjH
         RraA3IZbrjf/TnZNCj5v5+Gph2VnCyrzsgC7fP5HzqmB8chz3kmihbxgoS2afEz33+G8
         E9SbSw9YSSOMhLwn9ZHvlZlUncHCtS9Y8lIJ2H/dMW7F58xZEJNoUqVDmn984GmZxW8S
         gpIA==
X-Forwarded-Encrypted: i=1; AJvYcCVt2i/ofnbKfPUyy6kcSoOiLo+cfdZeOwxBfqB22Pmu54biZ93arutqrQJ75mwCfQ1COQNuA2mFBgLNUCtKuMg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQbJUq+3TXmmfkWItGS4z2BIQyMmuceUuP1dasVJCzoFSlduO9
	3SXZKv63VpQxFCdzJyslNDgmtxpv3N8TFRmPQTLKF9HQi+aLr2GNwQqzmYmpjGaBk+iUr7BoGsY
	YCTfuQbFyq5/xBjmFXTMPKLXScIr9Uh9p0TqfniJ7
X-Gm-Gg: AZuq6aL38+TUzB124DXs+lsKiW1YgzWjKfWuILnfKL3H8NhdQ8IBhtXKRjScw3BQ7Dw
	dtOKQzksfqQCcrjKnMJrGOWopV7t7A04pjiVuqf4KY6g27ocNE1ef1KETvJGks67W3UGNeRdPhm
	0etIuF/M5Xjvc4WTmx4uH1aKwnB7rTjM6fyDx89eDrNzdk+EMLAblrbcEi0zl7sqn7bRLRUDe7i
	dhVB9JFx3QNdY6p0S3NcxsW38waMblRl35T1/dvW+2Z73RJl7DDyxxGLyEBChY8+l8Ae491ywdd
	bKZF/HDuMKXev8Cgs4e+5z8V4KTiDi1C4pR9OC8io5ZcU6XQRMQT2qw57VfgUJBdraA+oA==
X-Received: by 2002:a05:600d:4452:10b0:483:6a76:11a6 with SMTP id
 5b1f17b1804b1-4839e6312famr23405e9.5.1771442142133; Wed, 18 Feb 2026 11:15:42
 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260218032232.4049467-1-tjmercier@google.com>
 <20260218032232.4049467-3-tjmercier@google.com> <e7b4xiqvh76jvqukvcocblq5lrc5hldoiiexjlo5fmagbv3mgn@zhpzm4jwx3kg>
 <CABdmKX1S4wWFdsUOFOQ=_uVbmQVcQk0+VUVQjgAx_yqUcEd60A@mail.gmail.com> <s4vb5vshejyasdw2tkydhhk4m6p3ybexoi254qjiqexzgcxb5c@ctazolc3nh6f>
In-Reply-To: <s4vb5vshejyasdw2tkydhhk4m6p3ybexoi254qjiqexzgcxb5c@ctazolc3nh6f>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 18 Feb 2026 11:15:30 -0800
X-Gm-Features: AaiRm53wtP0XVPm7Td49NxqM3FHtwAMm9Y-nYQJjMavu1aBdzT7jkoJc9BaBFyc
Message-ID: <CABdmKX2cQCneFyZhTWmWYz-RTmAOQcEKh5ZQewz25E6Xfok1tQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] kernfs: send IN_DELETE_SELF and IN_IGNORED on file deletion
To: Jan Kara <jack@suse.cz>
Cc: gregkh@linuxfoundation.org, tj@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, amir73il@gmail.com, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 18, 2026 at 10:37=E2=80=AFAM Jan Kara <jack@suse.cz> wrote:
>
> On Wed 18-02-26 10:06:35, T.J. Mercier wrote:
> > On Wed, Feb 18, 2026 at 10:01=E2=80=AFAM Jan Kara <jack@suse.cz> wrote:
> > >
> > > On Tue 17-02-26 19:22:31, T.J. Mercier wrote:
> > > > Currently some kernfs files (e.g. cgroup.events, memory.events) sup=
port
> > > > inotify watches for IN_MODIFY, but unlike with regular filesystems,=
 they
> > > > do not receive IN_DELETE_SELF or IN_IGNORED events when they are
> > > > removed.
> > >
> > > Please see my email:
> > > https://lore.kernel.org/all/lc2jgt3yrvuvtdj2kk7q3rloie2c5mzyhfdy4zvxy=
lx732voet@ol3kl4ackrpb
> > >
> > > I think this is actually a bug in kernfs...
> > >
> > >                                                                 Honza
> >
> > Thanks, I'm looking at this now. I've tried calling clear_nlink in
> > kernfs_iop_rmdir, but I've found that when we get back to vfs_rmdir
> > and shrink_dcache_parent is called, d_walk doesn't find any entries,
> > so shrink_kill->__dentry_kill is not called. I'm investigating why
> > that is...
>
> Strange because when I was experimenting with this in my VM I have seen
> __dentry_kill being called (if the dentries were created by someone looki=
ng
> up the names).

Ahh yes, that's the difference. I was just doing mkdir
/sys/fs/cgroup/foo immediately followed by rmdir /sys/fs/cgroup/foo.
kernfs creates the dentries in kernfs_iop_lookup, so there were none
when I did the rmdir because I didn't cause any lookups.

If I actually have a program watching
/sys/fs/cgroup/foo/memory.events, then I do see the __dentry_kill kill
calls, but despite the prior clear_nlink call i_nlink is 1 so
fsnotify_inoderemove is skipped. Something must be incrementing it.
