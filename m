Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D66C23D7E3
	for <linux-kselftest@vger.kernel.org>; Sun,  8 Mar 2026 06:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772951480; cv=pass; b=u5fYgkoUR70J8hXXwlyi0j+O/WOTprPzTJFAv3sgE8F2Vp/gY8sM2txIC5iq6Nv8r29X5bYEuctkV5crMbg2RR8FMFkYeIG4cqhli7zEb3Lq8QQ8CnKRuWBJuuEqUAiuvTjhMWZmaTD//Wm/j7ivklR0Y44lcSpU5Aeeuil6OCg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772951480; c=relaxed/simple;
	bh=bqMEOQ0Ckcrgyric5QOWebyRcZKyiXhkKZw3Ukws05o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BFVv3NvrikpTZjnZLsZQVcQUSt1M7V0w/k0BJfd0kgzB+W1TUx5OlS2IoBy5eXe+HOyHafpOT7LEVvGPpXmViYBx+4rW78eoH7TAjX70ZLQWd35KIe6EF1H3s8OGzqLv4BQskkD1lxaUGWa1tS0FjFJsxGfA+eMqQ9h5DCoOWIE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UoBC7Wij; arc=pass smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UoBC7Wij"
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5ffbd778410so1173321137.3
        for <linux-kselftest@vger.kernel.org>; Sat, 07 Mar 2026 22:31:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772951477; cv=none;
        d=google.com; s=arc-20240605;
        b=InJ7tO1mt+TjuWdeq32tInUBx8h11T8G1FPu2HeoSs3rNF2bfPErAAiNPAEu4Kb3Vu
         OQsCUXG6iffM4UvtxvKbVvMfjyGNpOAcyivlccvHqDGC1gps75oJepztWkTp4uzdFJPt
         WNQlCrNXWxjFbyVKuaAhy6dXLjlI4C4+AxgnbzP5A9TjZVfKsnFhVXYCOGzsrycIRpvj
         d37qQ3EdNwmOfNnRc0sy5/59y+QnR7UQ9BSCTdmiVveYYrkxK79R/b8JyEFfjhOVGmc5
         rIe3zwrmy+/0+hrvkD4M7Zm32eESmqhaAS5U51x+snWkwwS2r1Pn3gTuuC5+1ewfhN6E
         0U7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wmFGvCnSNVovQCGgt6RuGUFVOm9BbgW1X0Xq7Fd9owU=;
        fh=7J9ZMKbPpLmhCw7jIEU/vEl58/IeiWMFbpGyge4yel4=;
        b=LW5vWWxZMhAAtuPZKxrtgKIjFFRRcQBDwg3kmJrkfaTRdPlJCr7J9u2DRPbqQ9WOMa
         XVtRvfl9uPtZwrdt1DLZsTEEcXywkgFiDzRFilteyn63XFwwoCPx/zORBcKrYNE9D56T
         X9Zepvc0pT380y3ACrI6daaq3+8ZOlExaHdCWFteSmt4gjsNO2WAxIxs69hXJGBX8Z4+
         Pw2g/AQ0Vp3qxYdg4MDib4yhJ/ttgIQXSdwwj2OY13i15XaRYaomQjrz0M1RNH2EuAqy
         3LB2WKC71eIzkYL7GyytDGdz9jgvSHK6Oa/oT7e/tq/1TtPXzyBDPtX6iQ8Ew9bfZ6/c
         ff+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772951477; x=1773556277; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wmFGvCnSNVovQCGgt6RuGUFVOm9BbgW1X0Xq7Fd9owU=;
        b=UoBC7WijfmQjVlLHxpWqT3DlTCrRD4bQJHimo+Ve0AMx+0bxsR3bN/1HscBrJM5qp4
         hAoHmEH3IXVxPHPjHP72bQjLwytOTAT5lJd6vLsKUfcx09gi0FJHs8GAtUs2Zp97KKRS
         FEk475ub7vx4XQABNB53DotIZxjsKUBLPuPd0GzyFt/3v07yHqf9qXCPxfHICyaytCF/
         wULC1pF4Xso5tHqPjvY31TUJdWMLPO7UZMC4SdrzuK11/bdvaGVzvdmvJy12Y+tEql+T
         EYn1klj2Rf4ROnNVpKQExB+BChYuTiyYbqJmdmRYKShyl6hiOYBewDd9lUoEbhAHN1Ij
         57aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772951477; x=1773556277;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wmFGvCnSNVovQCGgt6RuGUFVOm9BbgW1X0Xq7Fd9owU=;
        b=gwsES5IsWOecnX1nWJZStf1Mi3ihB6PJxbR1jBPaENnHTnrxhlggGxtUkdGo/CUiJv
         rRTq/tZxg99ysVCYbW7I2kcBe4/jmSDYVap7PP/ajTJo6vBZftJ1qyFVudJY5rOcm4Nt
         /ACtNkRaJ/B4Vox8cQM/DxXRIQwAPzKssmu4Dfh0CiNIRdzfYP30OXX6vG6SYI8EzqW2
         W4iPml8oIVlufPgRue6hfeRAFAz8llpDpcpOugQmkwjaQhybLdFalTkjOsLjLYOyFom2
         bDPfO/iF360Deivc3kNty7eiPADfIJ+R+2oW655XoVZuKh25xxgQWVVo9tojzZCq1140
         6Bpw==
X-Forwarded-Encrypted: i=1; AJvYcCUO4ltj6En+im58/ZzL3tJGX8vz510bTcmFvJ+k7rrKyvR6xc2mof7zowl2umjrTsw9fqaDORZsK8JvPHmVTEI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnB60JFvuHstwyXeW90BW+vGVDDSU2BV3jxYw6RxP+HBYVmn6a
	+L3qgiqz+g78vR7D8vZxC8lYEq2/Dim3TZBtE7AH+g7j9sYAyYPd9ZuDWPGDes3bSGrYroLgpiP
	fWt8DEh2SUFwDEqKDMgk5f4fzgqA/ezg=
X-Gm-Gg: ATEYQzwqzMGBInhRp16dDV7jtkRuc5ipF6pi0tOT0+xwZnWDjwAZIV9Hqj6luQEOFbG
	1pr7/GltappdnmiSzy44EGKoX9diwFtBuL3J7pdl6ChZFPsEm94CmpTsgP/4WaJn7XYyAyt4pIF
	/XFBWzSlwFazU/JzX0cIzngem8Vmx5EnfzzqArZMQ7MIUAH9Um1sBfo/Kf5qXcZ1BQVkS3t0rX2
	rlpxRtOQGy2iPYBQiFGEVghXGIx9FHOJcP6tjfWVUKla3NaQeiIUzXjM9rwPYmP0RtdvQH9mx6O
	IfDWjzVsPf4X7RZ+5eZ6zYvjK8KGGfFBV93fp8ZDHQ==
X-Received: by 2002:a05:6102:41a6:b0:600:11e1:2a4b with SMTP id
 ada2fe7eead31-60011e12bf3mr732622137.34.1772951477120; Sat, 07 Mar 2026
 22:31:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260307140726.70219-1-dorjoychy111@gmail.com>
 <20260307140726.70219-2-dorjoychy111@gmail.com> <CALCETrXVBA9uGEUdQPEZ2MVdxjLwwcWi5kzhOr1NdOWSSRaROw@mail.gmail.com>
In-Reply-To: <CALCETrXVBA9uGEUdQPEZ2MVdxjLwwcWi5kzhOr1NdOWSSRaROw@mail.gmail.com>
From: Dorjoy Chowdhury <dorjoychy111@gmail.com>
Date: Sun, 8 Mar 2026 12:31:06 +0600
X-Gm-Features: AaiRm51WCqo6sYLOpIV6hZ1XNIYME3jM_VRhuXhqPcz8hjUnJuRMBp96SANcO1M
Message-ID: <CAFfO_h4g-QtE1gsp3nw7+BUYnRj29au=pYs1goEnppbdU-8DbA@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] openat2: new OPENAT2_REGULAR flag support
To: Andy Lutomirski <luto@amacapital.net>, brauner@kernel.org
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

On Sun, Mar 8, 2026 at 12:56=E2=80=AFAM Andy Lutomirski <luto@amacapital.ne=
t> wrote:
>
> On Sat, Mar 7, 2026 at 6:09=E2=80=AFAM Dorjoy Chowdhury <dorjoychy111@gma=
il.com> wrote:
> >
> > This flag indicates the path should be opened if it's a regular file.
> > This is useful to write secure programs that want to avoid being
> > tricked into opening device nodes with special semantics while thinking
> > they operate on regular files. This is a requested feature from the
> > uapi-group[1].
> >
>
> I think this needs a lot more clarification as to what "regular"
> means.  If it's literally
>
> > A corresponding error code EFTYPE has been introduced. For example, if
> > openat2 is called on path /dev/null with OPENAT2_REGULAR in the flag
> > param, it will return -EFTYPE. EFTYPE is already used in BSD systems
> > like FreeBSD, macOS.
>
> I think this needs more clarification as to what "regular" means,
> since S_IFREG may not be sufficient.  The UAPI group page says:
>
> Use-Case: this would be very useful to write secure programs that want
> to avoid being tricked into opening device nodes with special
> semantics while thinking they operate on regular files. This is
> particularly relevant as many device nodes (or even FIFOs) come with
> blocking I/O (or even blocking open()!) by default, which is not
> expected from regular files backed by =E2=80=9Cfast=E2=80=9D disk I/O. Co=
nsider
> implementation of a naive web browser which is pointed to
> file://dev/zero, not expecting an endless amount of data to read.
>
> What about procfs?  What about sysfs?  What about /proc/self/fd/17
> where that fd is a memfd?  What about files backed by non-"fast" disk
> I/O like something on a flaky USB stick or a network mount or FUSE?
>
> Are we concerned about blocking open?  (open blocks as a matter of
> course.)  Are we concerned about open having strange side effects?
> Are we concerned about write having strange side effects?  Are we
> concerned about cases where opening the file as root results in
> elevated privilege beyond merely gaining the ability to write to that
> specific path on an ordinary filesystem?
>

Good questions. I had assumed regular file means S_IFREG when
implementing this as mentioned in the UAPI page:
"O_REGULAR (inspired by the existing O_DIRECTORY flag for open()),
which opens a file only if it is of type S_IFREG"
I think Christian Brauner (cc-d) can better answer your above questions.

Regards,
Dorjoy
