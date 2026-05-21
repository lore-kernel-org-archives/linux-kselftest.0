Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F61033B6F6
	for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 15:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779378577; cv=pass; b=ghG1m5n6u0ZlL1WDAfZ+BJA6QLYzmdakamtNRt/H8ez/l9CRZ087VengBe4ct10zNFuq4bpKaJ1qRRRF9rGPYx9KFYNlRDbwf7CYaCgiecn+a/HVbU8KyF78VpOr32Oo+esvTQw+N8CuKi2dO2snB0CWVsCkeyc+RrGzxs/QzCo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779378577; c=relaxed/simple;
	bh=oTJGeDYTACLQP4b7lcnYS7MF/F8SkeHi472hQfd2CPw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MByxQT02CCJdEt592B/zHHaB116tHoA4CRIlq6n9x3Iif5Qzitepuo/ZFfckhqps0hLHMnl3RzSFLc1XJFz+7SKXmtdwQlfxd/UD5FacZFWFoo3jIlVyUsVCB0F7WVwbCz+dTo0PRmJPNbiOvKZwyL7S3gsCNbtWt1O6i3ma52M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lL1NHx9I; arc=pass smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lL1NHx9I"
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-631a7868228so4345360137.0
        for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 08:49:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779378575; cv=none;
        d=google.com; s=arc-20240605;
        b=NAuw/WIKx0xxxh1XmapuXo8/Mgpv5b6nV6VfN+uG40kajuCP3CybyUhMWI2q7J28Pu
         Tjm+1It5Juw8+H+iu72d4GSM9/zSQ5vEbUp+FXHCmXSM6wLLCbDrkYqSHd6TQbNbyuCq
         VaDCEFbkHiPDJBAkUuORn7Q2jSOH1BpNdqe7hcAv9NjJm0XtDNOa+YbtZetkCHUV3tOu
         ve8Afrd4/b7aZhOY0xJj08Ho2qSeO3LNtR1N238YAAkoqXqmbm1JRpae2P8Hwdmk/zDn
         pPKAedSQd6c1ZnjxErmrdITkDFNnX1Z7a/yU13hGO2FYFGpr98n19Ks79P1+/kff50iT
         nEfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BTiKHHtH6isAoh5+/ntoHPqjIgkFbjjbM7Qgllx7bcY=;
        fh=1n4Y2ckllJsozXP41Jqng8KC7jCAU1G9YZn5rowSaac=;
        b=H6uKI0rq7e+wBLTMOpVdS7tdL2ITJdoD67RwInVdBHwyeAxZBdg5X8sClqcCw3/FNv
         a/jySIBmOe6EQamrJxN9BnGpu56YksbS+qK/rRJRJAia+HPHkdRxkEVkkudXgDTEQHX2
         Ha0lrVSLziOae/K2a1NC5pqEzw0vKZuiBSLan4NwnU51oKVioVU5p/kWy7jqYsNNPilP
         PxdWOFDA0Sr16r/EG7hqj/A3uN+XQ126j1VNJ/yjfE2V/piU8pDoHK/6Q3pFm/I79IH4
         f1ymaQoj++u3GbGOtp1WBg74Vb2V+R8Ve4Ck76UdLHBHWaVziswPYm0hKHuths7mN8qT
         7YQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779378575; x=1779983375; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BTiKHHtH6isAoh5+/ntoHPqjIgkFbjjbM7Qgllx7bcY=;
        b=lL1NHx9IIKtcx4n399OipzLHTG7xOmxIhzXqniZ5H/PlWZnBHPquJmbnT+WXpW8VGl
         gD5K7nwalvqc4Jt0om+M7KYYupeksRrANY4jRunce7CrRXOXxqnPI7tkmKyFagBaXwF0
         8hbAFX6ZrBAhSIQxY+fV56hM0QhsKH/3w0jYikbW8LAIDNiMade6YzJVU1Efx90sVY3x
         4RhbDvS072Slf7nSGxLx08t5GZTGyaCT39m+CpTwAhqunSH3Y9mmA6I+HSghd2xMwMha
         PQ0O8KzBHHVN1VIStAFdCi0DV3GfXQMWyTqCZkVW0qbXHgDdJtycc4DpHzSHcGvAFvB1
         f1xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779378575; x=1779983375;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BTiKHHtH6isAoh5+/ntoHPqjIgkFbjjbM7Qgllx7bcY=;
        b=B/wQpJQt8YgehDbozlxzGpAb3C45xKF1zrKG3MilaP8N6JrynIFZQC/g1hJOE99GlM
         ROaRwe38nhWOs/r2UdIpNzS2a7pt2AbPrd4gxqCr2bQmdvaXMjzzPhY7rlM9meIwq8Dj
         WQHbmXKwDH3NG4gfZ26KXwuYJOu+ZESuOlzD0lhOQUlFdAshpzZmyHHnvbsbFKFzgfv5
         6WBa0JyIWL4sC7BM8SNlwqwugq01MxVKmqf8VF++l8ZpF12wtFftQjc1ay9zPzPgzEdd
         dw8tNLHneIs7F2hlLROrhxrGTMyNpHAfiPwR/cPzbExyNhzRH/lMUgXS4Cb72K8Av+Sm
         STRw==
X-Forwarded-Encrypted: i=1; AFNElJ9dgp3hpimA4hc2TIjHBY1w/HJkmbH624d9V+yedWgdM9JRshTx9YR1PujB34WH5JIzv6HWP059arkD9dScgp8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/Qx0CPOVmu9Vx5xPsfXlwXgkmZmeLXcGfOR/sRMwERKliaYJi
	oU03WBTRl8v4uW+Or2aLJIXyrBMRT4AsW0xPbYIyFkfcBGfReWrsJs05jYwT1e3bwpz93JYB4sG
	lJkWdmUkSxJuNR2Xm0Nr5NO32TLkKkrc=
X-Gm-Gg: Acq92OF4arIW7o2nEvofnxXD+eGJOxERPvRTyiPJlPDkCMIDujguy0RDpF06L4Xt6C1
	Y3sqGfjlkpq49giG11kJ8CNHaxrFPSB7LQo5HdAMsRi3+rUOXDinpSBrjUAFHJULxHyhF7UuN6b
	00tGvkd0PD+8e4I5OHovHwfZrlBBIrKe1EbVO2RfCmmB+KvqPfqQUGstpNFDWpsg56TeAzpNxxF
	VRvR7VUrZEcI14lGEuHPaXQzvFO1xOgSbdQsnYIhM/QBluxTRyAracCToBqVp+osvnU5rLWfu+q
	vLyLTER98i0KWB2O4xgp91bRQC1wG8+j1HA888GyzgL8cp8DK6HeBU8=
X-Received: by 2002:a05:6102:1591:b0:650:a9f6:4d29 with SMTP id
 ada2fe7eead31-67390b66b29mr2592164137.13.1779378575543; Thu, 21 May 2026
 08:49:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260328172314.45807-1-dorjoychy111@gmail.com>
 <20260416-abgraben-seeweg-a44ce660957f@brauner> <20260521-grube-leitfaden-0e5420c9bedc@brauner>
In-Reply-To: <20260521-grube-leitfaden-0e5420c9bedc@brauner>
From: Dorjoy Chowdhury <dorjoychy111@gmail.com>
Date: Thu, 21 May 2026 21:49:23 +0600
X-Gm-Features: AVHnY4JMLUcx8yOSfS2Q9vtP8tvb48vFjP_vPMN644Wd5G5CD5CLlCbq3u4DVJI
Message-ID: <CAFfO_h4Em26Hfbv-DWF+9dNS8TBuGpfWjWFBUhLr7jYCKzj3_Q@mail.gmail.com>
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

On Thu, May 21, 2026 at 4:54=E2=80=AFPM Christian Brauner <brauner@kernel.o=
rg> wrote:
>
> On Thu, Apr 16, 2026 at 03:07:12PM +0200, Christian Brauner wrote:
> > On Sat, 28 Mar 2026 23:22:21 +0600, Dorjoy Chowdhury wrote:
> > > I came upon this "Ability to only open regular files" uapi feature su=
ggestion
> > > from https://uapi-group.org/kernel-features/#ability-to-only-open-reg=
ular-files
> > > and thought it would be something I could do as a first patch and get=
 to
> > > know the kernel code a bit better.
> > >
> > > The following filesystems have been tested by building and booting th=
e kernel
> > > x86 bzImage in a Fedora 43 VM in QEMU. I have tested with OPENAT2_REG=
ULAR that
> > > regular files can be successfully opened and non-regular files (direc=
tory, fifo etc)
> > > return -EFTYPE.
> > > - btrfs
> > > - NFS (loopback)
> > > - SMB (loopback)
> > >
> > > [...]
> >
> > - I've added an explanation why OPENAT2_REGULAR is only needed for some
> >   ->atomic_open() implementers but not others. What I don't like is tha=
t
> >   we need all that custom handling in there but it's managable.
> >
> > - I dropped the topmost style conversions. They really don't belong
> >   there and if we switch to something better we should use (1 << <nr>).
> >
> > - I split the EFTYPE errno introduction into a separate patch.
>
> So I've massaged this series a bit in that I moved OPENAT2_REGULAR into
> the upper 64-bit and internally use a __O_REGULAR bit. After having
> thought about it makes a lot more sense to move the openat2() only
> features into the upper 32-bit for the uapi space. I also ported the
> selftests to the TEST* framework to fit with Aleksa's recent rework.

Thanks for fixing up!

Regards,
Dorjoy
