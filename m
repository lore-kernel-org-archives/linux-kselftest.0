Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3E73D7D74
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Mar 2026 16:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773075034; cv=pass; b=km56M3IjcmEDlQRuAEcuRXUTB+r+3HYrCzMUyj0+zCHFyBIJ7HQGMDXe5zcnv/XfxLB1kDVptgT9pbTZ5JSrOpTkga+6c0Vj4J1fzw80i/fkjcba0L1aBu0h8aVRvJH9idnApJTxRnJ092/Nnaw/Jo5GAVC8Ja2CdJcWAXjJAHQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773075034; c=relaxed/simple;
	bh=dElGlCWfTDUCaV3zjXVrwEshlrdMTwzM4Mn069fiLm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Peu//1p6xu3KctojSddy9Iu7xTmegeglWqHR/aF6PYWD1ndUhLSBnYvvcx7cGSizgG5X6o0VXL4/UXX8xK65vtyxmG4AcbaGNCWzCazZP+LpnD82baIR332Be2s+hEsPkgcvJItslGHAgUYnof10VmxewvlgvWpI/zJDWidQ8Ik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net; spf=pass smtp.mailfrom=amacapital.net; dkim=pass (2048-bit key) header.d=amacapital-net.20230601.gappssmtp.com header.i=@amacapital-net.20230601.gappssmtp.com header.b=J+Xuet5h; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amacapital-net.20230601.gappssmtp.com header.i=@amacapital-net.20230601.gappssmtp.com header.b="J+Xuet5h"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a140efd2d5so3014821e87.2
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Mar 2026 09:50:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773075031; cv=none;
        d=google.com; s=arc-20240605;
        b=I8glOSeAfu9tLvgQE/e8rXeY+rRPbEFFDuLOgrCj8zVotlL1bFdyzyxQm1yPy+4mYP
         Zc8VuAWEioyoUqOxI9N6VWS8jguUle/xa+e/H6PZquiNkX8Euq1m1EAvhLis54Oban3i
         AzDjil5dVY+ZFCK5dOv5UMTT+Hg+uhJCr7W0Jy+uvO1sK0zl0ZdRFLUm72zQYrIoKBGa
         sFKLnbfpbChyrl6XlSFJWR77scYFUn0ZmIN4Kz5zb/ailIrwee9IF1qrEOMB2xLFCRik
         S4yI9s6hw1/onxBsvrQcr5nY2bMo9AB33Esq/AYywk/WNyWWIWCjlZNGOGsnfTXLdf2+
         J9dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1qXi97N/dEOi9sir8d8Z87lcT7PElOkZiITQbx2fwCc=;
        fh=C9LEQ5K57VROQtYRp/qCOJri6Us4DN2X6D94v3Dygjc=;
        b=dk3QWrxqfaEpT/OPaFwokqOnErq5K7kzcCAki9FwYzp4SnVO5JjMY0O+BroMohLhTc
         8TSAt8JxG2M16CA9AC1x2H0DLzNAPuVB0d2empJwcPcI+Ysz+QI+jLIsDnX0b3suToMs
         k2EvqYIKncH99J5hwN+ANGWUxeWiq2XQgt6shsC0aqcdgvOjlNiux9qUFjgc/hvZtrre
         x+QWYTsgHE43L5fd3InHXqLxTHcv8C4lB0z9gWzK0hzAjCTIoEZgfd+kjrSaqhMDE+A1
         fs7mfdnxxV5unsB8eeoXa8zJd46B0PeQTIHLfNazcTXVfAPmq+xGJ00dWUt5B+u1g6wm
         jE0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20230601.gappssmtp.com; s=20230601; t=1773075031; x=1773679831; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1qXi97N/dEOi9sir8d8Z87lcT7PElOkZiITQbx2fwCc=;
        b=J+Xuet5hbFlie89tCjUFjzDwucKsd4NfrnrH1IlxidGOt/z+KgeLuYLA/G1tJg9YeP
         C1CoxioVNedpRpnH3i2g1e9rvaDLyL/wWFxrMS/dadrG87skwpJ9ll0VXP5/mb7t/tVB
         3nTver45s6YBmiBWLR4SANFDP+bIXXTcsmJ6clYmeEH7meYralZNdoAd1IxF7O6aIkco
         lCWgnoV4P4ikTR0XyXY+GmybQCrbR7LB3OkC8+7VNevH+4CSTtWk0BvwVojn5VB4UwmR
         IhgPtrXLc4SezqZQwBlfIP/+nK2z8AMiJCr0cknaXTC3MvGuBMz8TIpTguJCHWhMt/xS
         SObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773075031; x=1773679831;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1qXi97N/dEOi9sir8d8Z87lcT7PElOkZiITQbx2fwCc=;
        b=WZJ4Lx1ROd1kL/cRfs8WROL0k4OsnflhPCeReqEtw+rTr2TGGgI7EgSsteQjetbobS
         HrnQ8+O7i/3h8ktYiXPjQ1xnH6+kLzfGi85GD9t/id+0izqoJu+c4EsNzYo4ZdpyUZKm
         wqEenGbiBhsSjUiKYAzSZPG0fMuSqxu4SpEUSckpnjwC/vEZygbDAdkw8Qkwx3uvCch3
         vndchMk+IJIUY7Xrr9OIuEDVLd+WXYkvzewPakzEE3pbVmdeq5PqVKptcR4jeHtF4ug0
         LRlM2Y2HzPRutwht5xunHPcYEY30nQSvSbbmyTCmgbNDJSVZZockMk2DKNnDG19obTFP
         vD5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVM7jvGH7SUDWoK86TF1p00/hBBBDn1C3mtjI5hpwOdJh0+AY1L26XfjmPXhU+adrsbOS06NxosvAuGN832BO4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj8AWVjy6O//ckxv6F5PS66oBei8KckEi6g6Go+ZN6o8KonIvk
	u0PLJynBnt39Z9rzN+Ihsh2pWN0s3oTD1Lbpbl7TXFPXaQdEavHA0rN3swL7EPgk67n36Z2Lxs7
	OgyRjjwefzUE+1zqe2yrT3Mus33Q7aG8tLDNjmbBv
X-Gm-Gg: ATEYQzxogg47yqtsBEejziYtA2sBRPu97klLBIGeDroOeijkHMm9XMuqsgcclAlIEhZ
	WOJXTUDSMDwlpxt3blv65pak3LX8aQbuoYTkjgYOAKDUUjIpBYTtAbF0WWVQNQvomNiXIcCnubD
	2MUwjFQcJII9y9pvZZvNjR2GWpZ4MgBuc4nxAi1+ni7+SBvRgXSlPcgbuJNxhuZzqPdlmBEde7z
	bEz6ELKy0TyNEfEyINKa2GX1sDTP2sCEqz3/MumSZaJzXFv2RLZkaVBDgDvGOFaa32PZhaCjIKD
	xGC2Zg3/81Fkyjs=
X-Received: by 2002:a05:6512:33c9:b0:5a1:3d7f:8fbb with SMTP id
 2adb3069b0e04-5a13d7f930amr3518616e87.2.1773075030208; Mon, 09 Mar 2026
 09:50:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260307140726.70219-1-dorjoychy111@gmail.com>
 <20260307140726.70219-2-dorjoychy111@gmail.com> <CALCETrXVBA9uGEUdQPEZ2MVdxjLwwcWi5kzhOr1NdOWSSRaROw@mail.gmail.com>
 <801cf2c42b80d486726ea0a3774e52abcb158100.camel@kernel.org>
 <CALCETrVt7o+7JCMfTX3Vu9PANJJgR8hB5Z2THcXzam61kG9Gig@mail.gmail.com> <20260309-umsturz-herfallen-067eb2df7ec2@brauner>
In-Reply-To: <20260309-umsturz-herfallen-067eb2df7ec2@brauner>
From: Andy Lutomirski <luto@amacapital.net>
Date: Mon, 9 Mar 2026 09:50:18 -0700
X-Gm-Features: AaiRm50Rb5608a_d1ziKt7e3a5xZPZu4oB7F4zw8iu_Gm1KsPQukeeL-PdrpHz4
Message-ID: <CALCETrWjb+V-zrMT412MtmgDCx9y8simJBQ7+45C9MtdiSMnuw@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] openat2: new OPENAT2_REGULAR flag support
To: Christian Brauner <brauner@kernel.org>
Cc: Jeff Layton <jlayton@kernel.org>, Dorjoy Chowdhury <dorjoychy111@gmail.com>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, ceph-devel@vger.kernel.org, gfs2@lists.linux.dev, 
	linux-nfs@vger.kernel.org, linux-cifs@vger.kernel.org, v9fs@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, viro@zeniv.linux.org.uk, jack@suse.cz, 
	chuck.lever@oracle.com, alex.aring@gmail.com, arnd@arndb.de, 
	adilger@dilger.ca, mjguzik@gmail.com, smfrench@gmail.com, 
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

On Mon, Mar 9, 2026 at 1:58=E2=80=AFAM Christian Brauner <brauner@kernel.or=
g> wrote:
>
> On Sun, Mar 08, 2026 at 10:10:05AM -0700, Andy Lutomirski wrote:
> > On Sun, Mar 8, 2026 at 4:40=E2=80=AFAM Jeff Layton <jlayton@kernel.org>=
 wrote:
> > >
> > > On Sat, 2026-03-07 at 10:56 -0800, Andy Lutomirski wrote:
> > > > On Sat, Mar 7, 2026 at 6:09=E2=80=AFAM Dorjoy Chowdhury <dorjoychy1=
11@gmail.com> wrote:
> > > > >
> > > > > This flag indicates the path should be opened if it's a regular f=
ile.
> > > > > This is useful to write secure programs that want to avoid being
> > > > > tricked into opening device nodes with special semantics while th=
inking
> > > > > they operate on regular files. This is a requested feature from t=
he
> > > > > uapi-group[1].
> > > > >
> > > >
> > > > I think this needs a lot more clarification as to what "regular"
> > > > means.  If it's literally
> > > >
> > > > > A corresponding error code EFTYPE has been introduced. For exampl=
e, if
> > > > > openat2 is called on path /dev/null with OPENAT2_REGULAR in the f=
lag
> > > > > param, it will return -EFTYPE. EFTYPE is already used in BSD syst=
ems
> > > > > like FreeBSD, macOS.
> > > >
> > > > I think this needs more clarification as to what "regular" means,
> > > > since S_IFREG may not be sufficient.  The UAPI group page says:
> > > >
> > > > Use-Case: this would be very useful to write secure programs that w=
ant
> > > > to avoid being tricked into opening device nodes with special
> > > > semantics while thinking they operate on regular files. This is
> > > > particularly relevant as many device nodes (or even FIFOs) come wit=
h
> > > > blocking I/O (or even blocking open()!) by default, which is not
> > > > expected from regular files backed by =E2=80=9Cfast=E2=80=9D disk I=
/O. Consider
> > > > implementation of a naive web browser which is pointed to
> > > > file://dev/zero, not expecting an endless amount of data to read.
> > > >
> > > > What about procfs?  What about sysfs?  What about /proc/self/fd/17
> > > > where that fd is a memfd?  What about files backed by non-"fast" di=
sk
> > > > I/O like something on a flaky USB stick or a network mount or FUSE?
> > > >
> > > > Are we concerned about blocking open?  (open blocks as a matter of
> > > > course.)  Are we concerned about open having strange side effects?
> > > > Are we concerned about write having strange side effects?  Are we
> > > > concerned about cases where opening the file as root results in
> > > > elevated privilege beyond merely gaining the ability to write to th=
at
> > > > specific path on an ordinary filesystem?
>
> I think this is opening up a barrage of question that I'm not sure are
> all that useful. The ability to only open regular file isn't intended to
> defend against hung FUSE or NFS servers or other random Linux
> special-sauce murder-suicide file descriptor traps. For a lot of those
> we have O_PATH which can easily function with the new extension. A lot
> of the other special-sauce files (most anonymous inode fds) cannot even
> be reopened via e.g., /proc.

On the flip side, /proc itself can certainly be opened.  Should
O_REGULAR be able to open the more magical /proc and /sys files?  Are
there any that are problematic?

--Andy
