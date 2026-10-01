Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25BF73EFFC0
	for <linux-kselftest@vger.kernel.org>; Thu,  1 Oct 2026 20:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790885154; cv=none; b=LI1uh4EXY3ooU9T7OL0ebeDgOPgrVt8+TnQRqgAhZqSq/rof3Q9kzKBKO6nwyA5WeoYMP7JPtmzkV4+gZg4L7StIiMQTPG0Enqi7nkv9+tN/iGetTNIzJvbENo7yiL/xNrluWtnVhK9uvvqRw6N280YlyMLCo9Il1X49tTAPeh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790885154; c=relaxed/simple;
	bh=lvERhqWFIzeR9CSOt0wp6SobFqysALAzzfrhXiUWo9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o3NO+FvpdD/zFJFEmH3vW/WpzgyBMbsAF4D8FY/Qw1LfxA4qArsaSYVWybrDV6BbILx3N/cKwB/2o1gW07mM5es3wNGKTqXYsyNSeVxKiKNaIWu45tAMJ2PGvVCry+iWPczk3P3eEXoHHO+qDJVmacexo45t4GEbhdZ2T0ZslBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=OK+Urmy4; arc=none smtp.client-ip=74.125.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="OK+Urmy4"
Received: by mail-pz2-f38.google.com with SMTP id 41be03b00d2f7-cc7c058617aso1830793a12.2
        for <linux-kselftest@vger.kernel.org>; Thu, 01 Oct 2026 13:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1790885152; x=1791489952; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EcGZBgVs6V7xRRG4AyNekMmCdFec/IScmb1jciCnZPs=;
        b=OK+Urmy43tNyTAwdubfgQQQJ7uxBhIenyxSpYdcMcejCrJV0PkCgiMF2JKqjq8T4y8
         TYMxu9+NJcixCVwdE+cyFvqGLm4ROuDvlXjOxpYuDuIAvcSj0Qzq+lnadc/XuFDR7qN/
         GnbTl3Wfur9HEENZeOeXDXCVgDXaguM0XWetTNH6aLoJVZsFcufu6ZzY/sl+0qJnmRdP
         Z5HJnbiOHgypIxBr62moDWZ4IkArfLZVnyMiHDI+bMpfnMEpz0d9QmC16F4KiV8Jqj/f
         X7nCLe1DbYMEt11smZ45fy+PAseJRdtUb1NG6Pz5hbWigFm1Krq3+8xA6AoQwhHSrrVM
         5twA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790885152; x=1791489952;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EcGZBgVs6V7xRRG4AyNekMmCdFec/IScmb1jciCnZPs=;
        b=zVy6Pj7eBFHH8K5fqQChKFSUPhjEm6AxrB71zfktKejbFH0+QIofFp8Uw9mDvcYgDN
         6OBu1OaJgU7IgXIVJckNXIL5T5jv0of7c0IP5ssTuBwfmA+5IoK8hp84NIUqkgBnLbay
         VElq8uiS8VRn47kKcjcgJJeX2NNEDEhsThR/BEh2FMs067NX+e7GQNL+Sk4hqQk743zx
         CKMzh2aLyavR/isAFCbFw7mfp3sdVPIfJoQiZEYXTAZOj9Ob7WWl8HZEBp3b6UZgUawj
         j86kYDZtNqhMHHmKD+Fj2M6Y5LkyfjW4UZkroaCFlg/mCgNdld4LqgGS7EifrZ9R+fzk
         7lSw==
X-Forwarded-Encrypted: i=1; AKwUvBwRIdUuHtRnuIXuZz7Ed5E6V5GEQj5aEmX0s1SSDCNFkmFV4k41gCFT48xWz8Mk88tLmIQlJ6o75MMcmxgOM2U=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/x8nkV0QlUSqJaITWGfeYzZ3I0s5lnVetubo+1mG37vrKfumx
	SuAcg2MbXNoYD4dspgnZjJ/e5ottdFFC5YSRgO7R5WRbhofs7VPHncZ84dwatxMGXwQ=
X-Gm-Gg: AYBFou1wZquV/dvSgnPia89suZUrDMGmJjSlU400WzHdPZlTIIkKxJylBVLsLPghk5K
	1PR8gDt7MC9ElhNpOTAehxissR8rJ7ZRG/lvxLdUFGFb5hUjOCz5sbhZ+VcQhBtrHtiuIrAGQ5/
	cVJmiMVieJ+eUvzUcCHjOS/dInZQxtieXLWSwXeTH487V3hJQsagp3kDL1PU9vnoQ8xoPrsJxpg
	v5dY2yx+KW+wrBjXjbRovbblRhfJSWnycJrSoULtHFtgXat79ZQ2ApydUudhPt1SiPbeiYghT5S
	mQ3q7dDJDL+xvhi8fLKjryWntTSdxemAraEa0iXeCtZfy6kryBL/1jU00LdvtXxXLlxS2myuigz
	3KQI/98nH1yxVMEQKxJwFvQSzW/4ZJIb4mQDLcO3yUbX+/eQ2AtVXqAkpbqmBcuiVwOcJ9ZhM/G
	AqsJCxvZvdffWB2L4CNvX9sQHns+60IKLYBq6e1/Pl3xomSGewTdZPFcPTgVXXzAJsoDsu2ZVfk
	HbHXnbZikuP
X-Received: by 2002:a17:90b:3846:b0:3a0:c717:2db with SMTP id 98e67ed59e1d1-3a6ce7913eamr293093a91.27.1790885152227;
        Thu, 01 Oct 2026 13:05:52 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:51::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6dd456214sm19602a91.4.2026.10.01.13.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 13:05:51 -0700 (PDT)
Date: Thu, 1 Oct 2026 13:05:50 -0700
From: Joe Damato <joe@dama.to>
To: Hengyu Liang <hengyul@cs.unc.edu>
Cc: brauner@kernel.org, davem@davemloft.net, edumazet@google.com,
	horms@kernel.org, jack@suse.cz, jirislaby@kernel.org,
	kuba@kernel.org, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org, pabeni@redhat.com, sdf@fomichev.me,
	shuah@kernel.org, viro@zeniv.linux.org.uk
Subject: Re: [PATCH] eventpoll: return -ENOIOCTLCMD for unknown ioctl commands
Message-ID: <ar69Hgsx6+PEYYCY@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Hengyu Liang <hengyul@cs.unc.edu>, brauner@kernel.org,
	davem@davemloft.net, edumazet@google.com, horms@kernel.org,
	jack@suse.cz, jirislaby@kernel.org, kuba@kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org,
	pabeni@redhat.com, sdf@fomichev.me, shuah@kernel.org,
	viro@zeniv.linux.org.uk
References: <arWdMDek0iv0obDy@devvm20253.cco0.facebook.com>
 <20260930095058.1062123-1-hengyul@cs.unc.edu>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930095058.1062123-1-hengyul@cs.unc.edu>

On Wed, Sep 30, 2026 at 05:50:58AM -0400, Hengyu Liang wrote:
> On Fri, Sep 25, 2026 at 5:59 AM Joe Damato <joe@dama.to> wrote:
> >
> > On Thu, Sep 24, 2026 at 02:57:47PM -0400, hengyul@cs.unc.edu wrote:
> 
> [...]
> 
> > >       default:
> > > -             ret = -EINVAL;
> > > +             ret = -ENOIOCTLCMD;
> > >               break;
> > >       }
> >
> > I think based on the documentation this is probably right, but I am now
> > wondering why both ep_eventpoll_ioctl and ep_eventpoll_bp_ioctl need to
> > exist.
> >
> > Maybe when I first implemented this I thought it made sense to factor
> > out the busy poll ioctls into their own function, but in retrospect maybe
> > it's cleaner to just collapse the ioctl function into a single one
> > instead of having two layers?
> >
> > In other words, maybe:
> >   - delete ep_eventpoll_ioctl
> >   - add the is_file_epoll check to ep_eventpoll_bp_ioctl
> >   - rename ep_eventpoll_bp_ioctl to ep_eventpoll_ioctl
> >   - fix the test (as you did in this version of the patch)
> >
> > Would result in a cleaner fewer helpers / cleaner code ?
> 
> Thanks for taking a look. Agreed, a single handler would be cleaner.
> Two things I noticed while looking into it:
> 
> 1. With CONFIG_NET_RX_BUSY_POLL=n, ep_eventpoll_bp_ioctl() is the stub
>    that returns -EOPNOTSUPP for every command. If it became the
>    .unlocked_ioctl handler as is, every ioctl on an epoll fd would fail
>    with EOPNOTSUPP on those kernels, which is the same problem in a
>    different config. So the stub would need to keep a small switch:
> 
>     static long ep_eventpoll_ioctl(struct file *file, unsigned int cmd,
>                                    unsigned long arg)
>     {
>         switch (cmd) {
>         case EPIOCSPARAMS:
>         case EPIOCGPARAMS:
>             return -EOPNOTSUPP;
>         default:
>             return -ENOIOCTLCMD;
>         }
>     }

Yea, I see. I read it more closely this time. I suspect when I wrote this
originally, I had factored the code this way that way the stub could take care
of the CONFIG_NET_RX_BUSY_POLL=n case. So, now I'm not sure it make sense to
fold them into a single handler becauase we'd end up duplicating the switch
logic in two places for each CONFIG_NET_RX_BUSY_POLL setting.

So, in retrospect, I think probably the original patch you proposed might be
the best option. Sorry if I misread it the first time. 
