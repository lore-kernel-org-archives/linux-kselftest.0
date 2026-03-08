Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7ADF38E5DD
	for <linux-kselftest@vger.kernel.org>; Sun,  8 Mar 2026 17:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772989826; cv=pass; b=WmDDLsaSToNvOpRU8ItuzyUElCBO+DKmyRBPTOMNDodEJ6oX9fjrrHn+trYD5ORWrrAqzVDT/0fAmUtTBrgxvaacxPOqHHoE8ccHReW9HJ/B9U9QOyjmv0V2+7MVAfFJT5wGgj9XS+AgsUUwZeNfT44K2OSK2fOnwwy5BuGI6H8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772989826; c=relaxed/simple;
	bh=mPpVNiloCu6uzQI1WxZPytR2t4HpF2nlFZDXYS8kVTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t1SmQK8j4xxUpFHEXSvp5xk1wzsGKeF/x7x95J0NA3Ke3gC9wNIJVToaYo95SyFYY+9vICsBkmyLwTNFqx5XzXzW14xmDjN1+Sg6nAmaZ+FsW1sJGZvgjURj6hynw26McmVmNZQHr/YD0+9wEYwu0GcjOuMmp7TWjnWMZZccHHk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net; spf=pass smtp.mailfrom=amacapital.net; dkim=pass (2048-bit key) header.d=amacapital-net.20230601.gappssmtp.com header.i=@amacapital-net.20230601.gappssmtp.com header.b=V5oii2AP; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amacapital-net.20230601.gappssmtp.com header.i=@amacapital-net.20230601.gappssmtp.com header.b="V5oii2AP"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a140efd2d5so1512764e87.2
        for <linux-kselftest@vger.kernel.org>; Sun, 08 Mar 2026 10:10:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1772989821; cv=none;
        d=google.com; s=arc-20240605;
        b=SLyE0f12E/MM6XLInN7TEAFxk7/nlpCHr8PH51Z2pBCs/nwPrCI9IXUnODhpJmoNZF
         s+vCrWiVYsD0QjONFsDPcAc12k49DMtNjuWq3cdvEMZ1oS6+HOK1hYJXe1sAmsGmPoGA
         C7fTOD+MJq+5vmX+O1yWQoJZ83uzXeO8cBCpC31LRfJOeEJsIFm/HyRt17ywUJLptzeM
         b4ZMlov4uCDVaEwPoIa15BCsqrAiBNgwMlBOFfd850YpHI5TJnGI+tLaEj5/nIyW5+07
         hTh3xmFCJXBGtmCGsy/IaWjreo9cnvGjLRKa7ryAkc+xIsZYQuF/HUdfzh8j2976n61s
         +iSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gg9ZdLv2ki48mUNl69QeK9y3vC32V/8zR5xNICHMQ28=;
        fh=2PNbT9Nz/SDAeK0zV44PNwlWbSdUYXGw23FUBCm31mQ=;
        b=XW4TTsIHMJaJEOwdDtdkeZeAVuW5+McbkN0xOAE2zy4VyDt3CrzaqDenJbqgKxK88d
         i12jJM1YKjK/4w5cpJqt0WLks27Q4/40tsJgGiQhfR7xj5NgEyuIukXHZRRdp95gq/b3
         7IUQDDp0xWjljhfKSN2KkU3vjYDxbNF3lbxn/X9d25dr0i6Few9DMPltiW0Y06pPT2bI
         EqG+Uftj75JYV1dqKlAzkEaLQF9G7Dkz8W2Bdx37yaGNX7uZQVxBtAF795gFVEfiIhv3
         01RJkEQuq21V+OkiotPOQWS8HwNm32JdL0vO7k2+Eet4uHxLkyrJnnYooXbGBw/BlCMi
         kb+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20230601.gappssmtp.com; s=20230601; t=1772989821; x=1773594621; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gg9ZdLv2ki48mUNl69QeK9y3vC32V/8zR5xNICHMQ28=;
        b=V5oii2AP7iK/gHbMNDsSVEdYvHWzBqwPyeiCJaSxH80cBJ0weDfC5z5Jac3vnz4xBd
         Tn2ClWoMdMt+leExQaUPFXVNn1yHQ669Vg1RrqJYPh/2X3l9jSvgtmZZiIj1bUZ2IzMa
         dB3alhLex5Auo3ljWEQXqzrJbKBAnpaXzkW8R3j7dH57EQCqLyyRRuNOPBvBnxDwabY1
         PCB7f6Teh/1ED3+YhCaqbNuWa+/ytjyR+MjlDNbb0urQBJvJj9Tgkb8oCphjnt8HYU5m
         JKo9lxiVLkjF2Ntl0hmSDMics51tH/PApK2OBsOlL42naroddrbbIARbX0CgiVbmpphc
         lFDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772989821; x=1773594621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gg9ZdLv2ki48mUNl69QeK9y3vC32V/8zR5xNICHMQ28=;
        b=jv1DHm7zzpw7RHjxobaTX2FGbLp8E0MZWbndisqbUX7+JgZCO2HP3PM/n0CfCRedvk
         uEX4QP5IUdK5nCW7qiH6gryJVxe1EbyfsITUS8TGjUUM0KpUAErmb5oLiuCYm5vLkAU2
         sFQNMBnic5sTMy0IIHhw0odiC2Q+wzy+Ay9B7CHeVOacCSRvKJuY4VbSzrRK3Su/eXGS
         keTSb2fNcocicrmPRiV/nxyyBtZ/bXRRi5DX9Pihdt9IFOti9Jypj/Iyv1OvNJJL99bI
         DjDFrISDet7xSwXJlT/pScvgZw9HZmwQtOkuJctnUolgSB10rDSVFlSkcxlIZekzSR/N
         14xA==
X-Forwarded-Encrypted: i=1; AJvYcCWOrKDDGB54aDDGivjecLRt6SipptBK2CRsfLFbyf5tATmKMuQbbghNmrgvTmBZZEgpOaMEJdDbyrjiKCSJ5Eg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz675R/RZxkPgRNXV2KnA9J7aa6JxOlDbGiS/WxB8uJnEFvEsDV
	RIcJDlbqxFFmUyqf5T9vUG6fOcmOyg3h98ziqHlTQoHpCkCtKiDIfCbZGJGJSDIBd5+p/Y1y+oN
	tPx6mrxcBeXMFE8eFLlA1IKJdjmbgfJiCIPgcrT/O
X-Gm-Gg: ATEYQzxk9nldhcxyjKOMsYz5GZxPnpE5DujpJjcC/iiChA7EDXBG+0TJDk/H7vo6dHZ
	t7wcOQNdRNs6sujMMQYFwJSOYbKlURXcHbALqzSl8IjtIGN9xVRWzISeGGY+Pt7Wm/K4OkVCbqj
	5ZD5UgxsuHJeM73ZyaMB/sZFQaYx/c0RgwuZZI+upCNZcnlziGRUJAziblcPWFdBpWmOyfkL31s
	1/GFtFzYgjYNxlRoec2M7FdESEykQFwAkiUjxLOtqjVa5N5GJrlzeeWrgijShBf8IRhK85FtzFQ
	m83Xl8mPcb5mLFU=
X-Received: by 2002:a05:6512:10c1:b0:5a1:3539:1181 with SMTP id
 2adb3069b0e04-5a13ccc6854mr2584241e87.20.1772989820622; Sun, 08 Mar 2026
 10:10:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260307140726.70219-1-dorjoychy111@gmail.com>
 <20260307140726.70219-2-dorjoychy111@gmail.com> <CALCETrXVBA9uGEUdQPEZ2MVdxjLwwcWi5kzhOr1NdOWSSRaROw@mail.gmail.com>
 <801cf2c42b80d486726ea0a3774e52abcb158100.camel@kernel.org>
In-Reply-To: <801cf2c42b80d486726ea0a3774e52abcb158100.camel@kernel.org>
From: Andy Lutomirski <luto@amacapital.net>
Date: Sun, 8 Mar 2026 10:10:05 -0700
X-Gm-Features: AaiRm53NE6RSEVl9G8ylA7uki0xCjhtuxwfA8HvbEL_OVbVZXAi0saXeclsKpvo
Message-ID: <CALCETrVt7o+7JCMfTX3Vu9PANJJgR8hB5Z2THcXzam61kG9Gig@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] openat2: new OPENAT2_REGULAR flag support
To: Jeff Layton <jlayton@kernel.org>
Cc: Dorjoy Chowdhury <dorjoychy111@gmail.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-api@vger.kernel.org, 
	ceph-devel@vger.kernel.org, gfs2@lists.linux.dev, linux-nfs@vger.kernel.org, 
	linux-cifs@vger.kernel.org, v9fs@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, viro@zeniv.linux.org.uk, brauner@kernel.org, 
	jack@suse.cz, chuck.lever@oracle.com, alex.aring@gmail.com, arnd@arndb.de, 
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

On Sun, Mar 8, 2026 at 4:40=E2=80=AFAM Jeff Layton <jlayton@kernel.org> wro=
te:
>
> On Sat, 2026-03-07 at 10:56 -0800, Andy Lutomirski wrote:
> > On Sat, Mar 7, 2026 at 6:09=E2=80=AFAM Dorjoy Chowdhury <dorjoychy111@g=
mail.com> wrote:
> > >
> > > This flag indicates the path should be opened if it's a regular file.
> > > This is useful to write secure programs that want to avoid being
> > > tricked into opening device nodes with special semantics while thinki=
ng
> > > they operate on regular files. This is a requested feature from the
> > > uapi-group[1].
> > >
> >
> > I think this needs a lot more clarification as to what "regular"
> > means.  If it's literally
> >
> > > A corresponding error code EFTYPE has been introduced. For example, i=
f
> > > openat2 is called on path /dev/null with OPENAT2_REGULAR in the flag
> > > param, it will return -EFTYPE. EFTYPE is already used in BSD systems
> > > like FreeBSD, macOS.
> >
> > I think this needs more clarification as to what "regular" means,
> > since S_IFREG may not be sufficient.  The UAPI group page says:
> >
> > Use-Case: this would be very useful to write secure programs that want
> > to avoid being tricked into opening device nodes with special
> > semantics while thinking they operate on regular files. This is
> > particularly relevant as many device nodes (or even FIFOs) come with
> > blocking I/O (or even blocking open()!) by default, which is not
> > expected from regular files backed by =E2=80=9Cfast=E2=80=9D disk I/O. =
Consider
> > implementation of a naive web browser which is pointed to
> > file://dev/zero, not expecting an endless amount of data to read.
> >
> > What about procfs?  What about sysfs?  What about /proc/self/fd/17
> > where that fd is a memfd?  What about files backed by non-"fast" disk
> > I/O like something on a flaky USB stick or a network mount or FUSE?
> >
> > Are we concerned about blocking open?  (open blocks as a matter of
> > course.)  Are we concerned about open having strange side effects?
> > Are we concerned about write having strange side effects?  Are we
> > concerned about cases where opening the file as root results in
> > elevated privilege beyond merely gaining the ability to write to that
> > specific path on an ordinary filesystem?
> >
>
> Above the use-case, it also says:
>
> "O_REGULAR (inspired by the existing O_DIRECTORY flag for open()),
> which opens a file only if it is of type S_IFREG."
>
> Since we allow programs to open a directory under /proc or /sys using
> O_DIRECTORY, I don't think we should do anything different here. To the
> VFS, all of the examples you gave above are S_IFREG "regular files",
> even if they are backed by something quite irregular.

That's certainly a valid and consistent way to define this, but is it usefu=
l?

--Andy
