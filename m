Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BA23E1CEE
	for <linux-kselftest@vger.kernel.org>; Thu, 16 Apr 2026 15:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776352939; cv=pass; b=RwBmWpSfS8DiJlqoVxIPOL9riQNajNOGUfVblF2W4BuYq6REdZEiFmYGLIwEOkKJRdAbb/Y++vkRbxwYSDbu11f/XVbKxXmiA3b+M+vGvwHJBxILs7unHnFEjnepspO3zervcTpNYBGwZrIcoM3/Tj3LE5iDqUQM741hNI/QYvo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776352939; c=relaxed/simple;
	bh=d8h0wpCxAz5qr8QgJAWyo5NPmRw20h5MEF24J15IyVI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nppMNHPk41dyNGTamniaRxswWpT3KVxfcSmXFTSdUwotd7nlusiDB10NsgXwwVbsMvCD5lDVN9QaynCoZATJfPlIKxzBAPfHuSA6HI6mi0icejiW0y5YrSycTayXVdMTecllR6Heuba+ZPtmkSh4QDrEpocbtOohnaApVRVIQ10=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g4lVbpH3; arc=pass smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g4lVbpH3"
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-610e2e8f57dso1356381137.0
        for <linux-kselftest@vger.kernel.org>; Thu, 16 Apr 2026 08:22:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776352935; cv=none;
        d=google.com; s=arc-20240605;
        b=dX6PLTqaqocSuDVZyYlhnx1EhElOo2Bk3NaVha8VIO4/o9BNBZEJPD5GrU/z/O6APF
         lpYkRLW2bHj8zqNZGGSYYWueXCCB25NLByV1hc6fYSk1+q8vcr+ZdOGcX57rzbZVZ5jo
         FaRcgIc2Cw+Xv6qUTtKm31+snauMqBlOxb+BiPyUu4byBwqTX35YnEEJsxixi571PK6U
         qiC5GJo7/1hzcJN4zH/i8jC+V4Z7Dz7f6r8spNlzl7xgfQ8JbpFHqU3Zp4FiGB/N6aLx
         EWQ24KBuHiqVbbRTpS8pw9l3QZcj7FDuVK/BsNUJVlBBjOSHgAQVk3IEncF2ADuOb1/H
         EeLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZrzbbPcScOB3YiJODipm6pYCq1GabErqB6lK+E1UuOI=;
        fh=Hvn13Ej0aAJIRMRLrdTpBneXTxjouP2hcVMx7l7sWIc=;
        b=Nle4R2qgWNLz5P+oRTZGiKdhsgRZpg8gJTFX6+PrIzOhbUEXExcKQPaTq7WzgFJl79
         m/lWB04Dmoj+vRhz2JwJ4ycDsYqCf1MHY3OYV1RgyuwWdu6C+8HudHDg/YjvMyrmhz7T
         uB7goHZtGOq185E/TuvPpMrTqdr8GzIRdZ3+74CQjgizFrctXvRuhLTEMreRJn2ShGPf
         CpRgMjlJC9icj9v+LP4pfdzGbi3EUxTHU5GcnQ4MHQQEG/K544WBHuUtZJ85bDnFd+Yj
         A1AnKKpPshVGuGSzFzax5MeeVejuJN61t6I79zfy4zuwY1F8hRV/Fygi3djxmM+Tud3/
         WxFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776352935; x=1776957735; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZrzbbPcScOB3YiJODipm6pYCq1GabErqB6lK+E1UuOI=;
        b=g4lVbpH3NYuTwHK4zof4cI1R5F3IIOc7rqMOk/MWHpRmevLzRVb+qRlTlkjItjBIHx
         c7M0jhqWfaQ2vMdmdCGZvAPwF+odTZ9kyd6p7sv+kuJPT06vFRz8sGzxEE+RDZyrNUPi
         T43wkAslMCjJ0svGA08kUb5Gbx/3985K1GhQDZgh/+pTKuxWXmHDa0LxQ7N8Y6D+AdMV
         pK9JcsBfafPuXYE4xQ1M0Bsj7zmPTRKj8Oqs1QY2itp7CaL3brWr7nECH3oyQEx2Fb50
         mvvGzjXFjjCeXabKEm078u3WnFCD8fkfLKek/kSJSKQGUKyNJa4mEQC63tdpwccNytZ5
         6URQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776352935; x=1776957735;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZrzbbPcScOB3YiJODipm6pYCq1GabErqB6lK+E1UuOI=;
        b=KXsCNdazzLqeTZ6QCzctVJmo55Y1EpCJ6/xkAbNVlYFHBk9szyGgDxQp5CSx9DSy55
         V3UKFnvCghu755OadS1zaQl2IbB6+CPCAgXTFbXjb69gZ+lR20ZDTVz/imP28vw41Ha0
         ToNTGI3v8N0ArpPZ1L2INzyd2n8Seb+R9apsecbEkgofF6GpRnJsLXjJPrQUJh4EhCph
         zDaP9WtJb4WUsXElKz7cTCoW/6tU6SnFRvG+FDI3zuhyjmrYUcnNZ2heGilS4ZH3B3Nn
         DjP0cZXRTwpVVg1wlt3Q5pchtdFjZBxl+ssOeCp0YnQXuWlunlW5tQJvPFLifJ/nR/ai
         q5ag==
X-Forwarded-Encrypted: i=1; AFNElJ+Ki2fPYaABv+KtombwZpRow/KV9Zg6qVPabu7h0hYHonfp/fyZZnc3faw/wAFrEFRaoy+gyzFgr4mv48+ezHM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1xb1wxgToujFqnwaTrPotzGPogE8oSl0I+GNG/kQsqJVWCCdT
	CMURBgjt3X2j+QSOQXy7kWcPRpyynZ6ZQOZ27+sVkzMF7BEY7rp+JQD++OFQpb17MaRhDfoyFyn
	XZNOb84PiKQ4t22iBVrrvtpifHEL+DvQ=
X-Gm-Gg: AeBDievzohZ6+jxX4TBBeJVi3QDYO0ZHBLD/DoW4qXWMpOWWj/EopzMZVKN1kpoY9nx
	j0m9GGlUyo0/OtIMwRh2G14mmC2VrlwTbSaxXRbPDKJ0YIPLFvx1IEZuu3pv2xPSS/A2TYM4BBt
	xenXHFRU5D0nA4P/nX0OZMMTSrErH7Isiixt4Cfe+1wwFH9eC004jR5gZbAYQnZIlAkNBCns7wl
	ASPWSWTahUQp0EVkMAVHB1Ov2tO+QALHijEGPIW+VCwe6e7b8ObtSel6UzY6BTAKh69lsbPYJaJ
	MoLOIirYb6o5AF76ODnLMpZuUCB84+MWKtSU6y+g+Q==
X-Received: by 2002:a05:6102:4194:b0:610:48e8:8c4a with SMTP id
 ada2fe7eead31-61048e896d0mr7561251137.24.1776352934841; Thu, 16 Apr 2026
 08:22:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260328172314.45807-1-dorjoychy111@gmail.com> <20260416-abgraben-seeweg-a44ce660957f@brauner>
In-Reply-To: <20260416-abgraben-seeweg-a44ce660957f@brauner>
From: Dorjoy Chowdhury <dorjoychy111@gmail.com>
Date: Thu, 16 Apr 2026 21:22:03 +0600
X-Gm-Features: AQROBzDwlhonUu0OdB2GZDkt71Qp2GPutRABZHn8dYTEqH0ntcAPsZO_it5641c
Message-ID: <CAFfO_h5mORm0OuK-d4thzBWWySmyvLSVeVa7phZc4Df-8D=1Cg@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] OPENAT2_REGULAR flag support for openat2
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, ceph-devel@vger.kernel.org, gfs2@lists.linux.dev, 
	linux-nfs@vger.kernel.org, linux-cifs@vger.kernel.org, v9fs@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, viro@zeniv.linux.org.uk, jack@suse.cz, 
	jlayton@kernel.org, chuck.lever@oracle.com, alex.aring@gmail.com, 
	arnd@arndb.de, adilger@dilger.ca, mjguzik@gmail.com, smfrench@gmail.com, 
	richard.henderson@linaro.org, mattst88@gmail.com, linmag7@gmail.com, 
	tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com, 
	deller@gmx.de, davem@davemloft.net, andreas@gaisler.com, idryomov@gmail.com, 
	amarkuze@redhat.com, slava@dubeyko.com, agruenba@redhat.com, 
	trondmy@kernel.org, anna@kernel.org, sfrench@samba.org, pc@manguebit.org, 
	ronniesahlberg@gmail.com, sprasad@microsoft.com, tom@talpey.com, 
	bharathsm@microsoft.com, shuah@kernel.org, miklos@szeredi.hu, 
	hansg@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2026 at 7:07=E2=80=AFPM Christian Brauner <brauner@kernel.o=
rg> wrote:
>
> On Sat, 28 Mar 2026 23:22:21 +0600, Dorjoy Chowdhury wrote:
> > I came upon this "Ability to only open regular files" uapi feature sugg=
estion
> > from https://uapi-group.org/kernel-features/#ability-to-only-open-regul=
ar-files
> > and thought it would be something I could do as a first patch and get t=
o
> > know the kernel code a bit better.
> >
> > The following filesystems have been tested by building and booting the =
kernel
> > x86 bzImage in a Fedora 43 VM in QEMU. I have tested with OPENAT2_REGUL=
AR that
> > regular files can be successfully opened and non-regular files (directo=
ry, fifo etc)
> > return -EFTYPE.
> > - btrfs
> > - NFS (loopback)
> > - SMB (loopback)
> >
> > [...]
>
> - I've added an explanation why OPENAT2_REGULAR is only needed for some
>   ->atomic_open() implementers but not others. What I don't like is that
>   we need all that custom handling in there but it's managable.
>
> - I dropped the topmost style conversions. They really don't belong
>   there and if we switch to something better we should use (1 << <nr>).
>
> - I split the EFTYPE errno introduction into a separate patch.
>
> ---

Thanks for fixing up and picking this one up!

>
> Applied to the vfs-7.2.openat.regular branch of the vfs/vfs.git tree.
> Patches in the vfs-7.2.openat.regular branch should appear in linux-next =
soon.
>

I don't see a vfs-7.2.openat.regular branch in vfs/vfs.git tree in
git.kernel.org.  Maybe this hasn't been pushed yet?

> Please report any outstanding bugs that were missed during review in a
> new review to the original patch series allowing us to drop it.
>
> It's encouraged to provide Acked-bys and Reviewed-bys even though the
> patch has now been applied. If possible patch trailers will be updated.
>
> Note that commit hashes shown below are subject to change due to rebase,
> trailer updates or similar. If in doubt, please check the listed branch.
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
> branch: master
>

I guess you wanted to mean vfs-7.2.openat.regular here?

Regards,
Dorjoy
