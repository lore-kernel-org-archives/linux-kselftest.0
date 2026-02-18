Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5EC5346E75
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Feb 2026 19:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771444742; cv=pass; b=ZWT08Oa8qWg8/uivDml5pUCxuOS0PPqVq4mQTSWSKEYXQU66++x4+/9c1GyTpFGLPoddcfCGiBJiORaKvjP38s5gUvYLWAwvkNxwhG+UF3tA14GhQCGo2JYVMlebDdtsy0rUJ6KTU/K0wFND80wd8a7je+NOPbb125tJSa8PpKM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771444742; c=relaxed/simple;
	bh=fAj9Q1ygswz4E6SrtEFpUTAbwt8zju3u9r/LEpTkE3E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lpkywlX99ZSjzTQC+d5ZeHW6rx0TDuAgknJ/l045CthlRwPEEjzRX77K2/ka88Li+sjDxYOf8Le/vOgYha9WVuOH50QgGBjFWof0DJQLZlp+Jb7wP6w1OHQWlNigGl3adfvG3yod4XtEyO/LETFtp1fCZnXV4pKV4C8w8MljHTw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AgeRmV1R; arc=pass smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AgeRmV1R"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48318d08ec2so11615e9.1
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Feb 2026 11:59:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771444739; cv=none;
        d=google.com; s=arc-20240605;
        b=bsH2GIACQoB9N+yThVYVKzi19djJVRQigJAqykme0jI0w4A0mHMsOgA2Sk4MkLj5V4
         mjHy0vV3BsCuWgSlaeCb0d9ecndx+DWlLT+RGI0nmtrJ2IozAHDOHM9jHk97eyWv2zak
         Cs7SHXNCPKw8ColkIh9NdN4MjIA1+9RqXXrQlAXvHdINwks0CtKe6Yj/sJ9bkT/J1qIk
         MkLev0tmim3r/T8fjj+vAzi0KBLP5iP7iJAl5QkI8m0LZ6EIkCWVf4OOvqHDJZATVXXh
         NIb50IPUq+c+Rpvr8AxSyz4ZKgBvqoSGO5FcrlkEXBbI1O+PiNaNVvJVO9+uGEb2L3Gz
         z3wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OylA8EM9epDUNp/ar6ETdvAJBvo4gpIzvj6gp7Iy9D0=;
        fh=rQKSTtei2pE5bFCFMJYkUetbR5qn2BRg2HCtuhXVjis=;
        b=KckTrvBOAd4yOshl9MlkkYu16L8/F66+F4YHkSv6VIDDQv1CfKWlUqVyNQeivg8ml2
         BN+XBx0Akcj5k/+Fu3oTvhHRCs1KYqie3N6vHeVB5TlwQb/OESHdN6OJ9Q/ZgjQuh8cc
         +1Re+phCSifTniy/9cxWn76On0KTSNgkho57q/fOXVF9tVzMCgr6JAj+Hb1l/OVVmeJT
         sltQiiIgYC+d0uNh3RS1LTDHEDz+MaFW54eETV6+MrsUS2Ad0pMZIIKrxRTmWAQew6fK
         j4v9kVaslYuxteh9ot5zzEfNXAUl7Ama9vretkav/WkSMWwQIxvFmae360zJYUj+u8B6
         zeiQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771444739; x=1772049539; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OylA8EM9epDUNp/ar6ETdvAJBvo4gpIzvj6gp7Iy9D0=;
        b=AgeRmV1RhQBAlmnoA3RTul5w2nJ57KLE9ZZS9d2bLICsnWFYZTcAJGpdEciopvVxZd
         Z7wQVRxI3QX5CmuHlZqv4sE+nONEMSVZnoijJp8+xCi/OZxFk1yQBjZti4TiIVG8P5hn
         Ol9h//F+Zq/sWL8QbxfxuRIadPeuDnu4Zthz/UpA67xqevmyEUqmbwYfoX3z6aylsdha
         J09LIjJoQvf6TVKT3u3ayg0QvnOffSJM2dKGVPi1DzbDbGNw2am3ehv99BldvySO4qcG
         ARyY127U4WHG9UacPBZJ6VpsRlW0VHY1o1ahaA+oHnWlFwiM/enOn6MSLl7fcJEVRntj
         s/2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771444739; x=1772049539;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OylA8EM9epDUNp/ar6ETdvAJBvo4gpIzvj6gp7Iy9D0=;
        b=B5ruJLQ4tPHAKouRCzFCVROvipaAToUAmz+XZrZ/l+lW0DpQ5jJK3w67cyXQ5k0YM0
         b2+Na4/sJrN7poRNKyQvNOs4wgUa66rhiehELFUUWlZCHzKzD2yA28218g5MoIahYBDm
         Gs0EAZAarttedfDgbhfoqi6NAuh6fZMTFQ7YL+7kwM2n63MK/rtEblGwzmzBLI3Pj43z
         PJztE7SyX/NLHylBlsaGKw1AVf+GX+e2OEGnldbmn/Z4S2OyyFG24CiQNYY/wBEhQfpx
         ydw9rPrjQ4mvb69SO58seegD9myIrhdRPHxw0w+OfKRWSCFCr039sOwp0u4D9wxN+MDM
         iXVw==
X-Forwarded-Encrypted: i=1; AJvYcCXD177QkR4h/jsFYBOmpTglyf2dEySX323/TIb2Z/iX6P4Tk4DoCU4zK/3l5hRBAYOSc6kbxMtheR1zNFo2UpQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzN9hfOsMfrLHSWyNN62+aAynx4u/q7A4vIq3al1mxWT7XuSUb5
	8cFaxDUY71NwGxcU/rQIQ/eiOm3Z3BiDUSV+MZ0JUQjtBsJ+pwEC11x41UQhuBXipIR9MWvTPTy
	O4MYHF5qzcNfrPXlnXtyI5qZBykSu8l4uFXP+07nr
X-Gm-Gg: AZuq6aKjoMmtLCUQSeBtaMvttywtqfnHdyZv+Lg/7t6CKreKLKkaMMWnafPJaarCFwg
	jGD/DNOmXhWulylvX9HDCrNSMvLcvkzHNNpgYrJIiVTATDZWRKWHAk6Qipt1YDKJEggQSmJym7b
	1Hjhu4eGSw6TWuBZbTSh3zH2dfS9oyvi4brp5GB9JQrFNybVGmuBnsEW6Fg8XpM8UDOkDEh55Tp
	/6ZZ5XvhoAonytZbfRfgC1UxLVTI3eJ9hgFM7unMAsSUfe6yWrE38pBzUsUfDAPRozPE/2f+jFw
	l+Hj/pt0zassCB3bKOm2ZaD5sRrgY3nvQtbH1fC60Qzyykt2VR4gwghysRtZFLrhDeIhCg==
X-Received: by 2002:a05:600c:8b76:b0:475:da0c:38a8 with SMTP id
 5b1f17b1804b1-4839e5d9a1dmr138535e9.4.1771444738775; Wed, 18 Feb 2026
 11:58:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260218032232.4049467-1-tjmercier@google.com>
 <20260218032232.4049467-3-tjmercier@google.com> <e7b4xiqvh76jvqukvcocblq5lrc5hldoiiexjlo5fmagbv3mgn@zhpzm4jwx3kg>
 <CABdmKX1S4wWFdsUOFOQ=_uVbmQVcQk0+VUVQjgAx_yqUcEd60A@mail.gmail.com>
 <s4vb5vshejyasdw2tkydhhk4m6p3ybexoi254qjiqexzgcxb5c@ctazolc3nh6f> <CABdmKX2cQCneFyZhTWmWYz-RTmAOQcEKh5ZQewz25E6Xfok1tQ@mail.gmail.com>
In-Reply-To: <CABdmKX2cQCneFyZhTWmWYz-RTmAOQcEKh5ZQewz25E6Xfok1tQ@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 18 Feb 2026 11:58:46 -0800
X-Gm-Features: AaiRm52n0lIK2grreFCNiF6qE3JVFwkwj9cGx62TA9xdekMRJsGok-FwMltR-JM
Message-ID: <CABdmKX0BJcsv0TaPSsGN2a4nkQaKF=cX8rnnoL5kPTHNfuKL7Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] kernfs: send IN_DELETE_SELF and IN_IGNORED on file deletion
To: Jan Kara <jack@suse.cz>
Cc: gregkh@linuxfoundation.org, tj@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, amir73il@gmail.com, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 18, 2026 at 11:15=E2=80=AFAM T.J. Mercier <tjmercier@google.com=
> wrote:
>
> On Wed, Feb 18, 2026 at 10:37=E2=80=AFAM Jan Kara <jack@suse.cz> wrote:
> >
> > On Wed 18-02-26 10:06:35, T.J. Mercier wrote:
> > > On Wed, Feb 18, 2026 at 10:01=E2=80=AFAM Jan Kara <jack@suse.cz> wrot=
e:
> > > >
> > > > On Tue 17-02-26 19:22:31, T.J. Mercier wrote:
> > > > > Currently some kernfs files (e.g. cgroup.events, memory.events) s=
upport
> > > > > inotify watches for IN_MODIFY, but unlike with regular filesystem=
s, they
> > > > > do not receive IN_DELETE_SELF or IN_IGNORED events when they are
> > > > > removed.
> > > >
> > > > Please see my email:
> > > > https://lore.kernel.org/all/lc2jgt3yrvuvtdj2kk7q3rloie2c5mzyhfdy4zv=
xylx732voet@ol3kl4ackrpb
> > > >
> > > > I think this is actually a bug in kernfs...
> > > >
> > > >                                                                 Hon=
za
> > >
> > > Thanks, I'm looking at this now. I've tried calling clear_nlink in
> > > kernfs_iop_rmdir, but I've found that when we get back to vfs_rmdir
> > > and shrink_dcache_parent is called, d_walk doesn't find any entries,
> > > so shrink_kill->__dentry_kill is not called. I'm investigating why
> > > that is...
> >
> > Strange because when I was experimenting with this in my VM I have seen
> > __dentry_kill being called (if the dentries were created by someone loo=
king
> > up the names).
>
> Ahh yes, that's the difference. I was just doing mkdir
> /sys/fs/cgroup/foo immediately followed by rmdir /sys/fs/cgroup/foo.
> kernfs creates the dentries in kernfs_iop_lookup, so there were none
> when I did the rmdir because I didn't cause any lookups.
>
> If I actually have a program watching
> /sys/fs/cgroup/foo/memory.events, then I do see the __dentry_kill kill
> calls, but despite the prior clear_nlink call i_nlink is 1 so
> fsnotify_inoderemove is skipped. Something must be incrementing it.

The issue was that kernfs_remove unlinks the kernfs nodes, but doesn't
clear_nlink when it does so. Adding that seems to work to generate
IN_DELETE_SELF and IN_IGNORED. I'll do some more testing and get a
patch ready.
