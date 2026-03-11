Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2719B320A0E
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 16:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773245421; cv=pass; b=BqccwDbc4FGQyeKSUWjht3KJxxh4b0DQRkKKGkJDx60LSw0w2tKmG2VPTbbdEuD11Vc1K4LQS8kelsTqJOnOqqTNmIyzn4CYwAftR22HNvzdee5vkldvPlkp688zcqK1UAs5DVfxF0Ft6Ou/hPxFbnjc431uOhds453Dwe+CH4o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773245421; c=relaxed/simple;
	bh=RINC3OxukObTWwNgLj8cUCMQfmLKMyUKoc5ifoxu7lY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rVYMLbO3gWWGwppInvz/Nllv14dpX5jdr77YGk1VtT7cy5wphKwvs93hafdYo9Q/NtbEpJNjgVHu5Cqapg23nZiEIPv37nVDakR4LTJEzEUYelYhTLEq2nfJlwGzEgfB/TS+ZBi3qOTeaPvfGPUxzaQjA2qRFwGp2BBcYI48aTU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net; spf=pass smtp.mailfrom=amacapital.net; dkim=pass (2048-bit key) header.d=amacapital-net.20230601.gappssmtp.com header.i=@amacapital-net.20230601.gappssmtp.com header.b=DQI1cRxa; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amacapital-net.20230601.gappssmtp.com header.i=@amacapital-net.20230601.gappssmtp.com header.b="DQI1cRxa"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a140efd2d5so180418e87.2
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 09:10:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773245418; cv=none;
        d=google.com; s=arc-20240605;
        b=ZQObv5YI6ENAXD7T4XhGPLKiJXLEpCTugbPWhvpk6motUv3YBUcOqKD6dlixasmjmA
         ZiFQtLagQ2MMeosrS/kconFkQjG0BnUHdKfOb7HQX8ERrbbLjrqTSQe5HOFuoRYo2bV8
         C6o+7XMgV7bFGZyHjdmnm3P8AnzBrLgfP8AQBAaczciCycq3XFNUFZ+AWfs46qcolh7s
         a5mnKt+BYSvlVsHLp55uucQqc1AJxgHO4+KacRrvPewzErwhvH+xmLBZTQ4venW8wwru
         q56bbA4ueZ70VCWkzZkcXg6oa05NIqqWmfLz8nFq7LwCUNjn4uOkL7nA/5mN7pIaeE9C
         4h3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zQf3bqKM0prJaYagyzgzwBy7UALOn5Wa6w4qvhYX8FU=;
        fh=q5mgoOOqWHqbNUQZBOTHq5jcLlh8D6qtwS7JocUTvXg=;
        b=jXJJ8S+ULzV1obUmDwpnF53ERhkUWffhp2j0rcqSSYC8E6Lee4Qhg0Md+ODRz7Wkdu
         eJ9UiLohFNtUyGLX45xpb8fQKtjN+OyI4IFsYoyxiGYnr1qvBInpqoF6jI0zbm5Vtsnz
         vUOUQZkeVkbWDys9aeyHkpl7FNyESIMJPQ46TWA545AVwxJUXjWxodIAqE4zx/ZcQ40X
         GxbFrK6D+HsPnEMyP5a+919iaL6cuP72Sqyq1954q6PgMU0l0/ckluzRbD6jHNQXfAca
         Mip/myLps5riVrBlpdUnXeHs8bJzxjNJC36SHKwkuaiNtNTpokk5F6QUUXf8X2iGFud+
         ja+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20230601.gappssmtp.com; s=20230601; t=1773245418; x=1773850218; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zQf3bqKM0prJaYagyzgzwBy7UALOn5Wa6w4qvhYX8FU=;
        b=DQI1cRxaYaxsZCMcyoPsKK9oceAAMF2Z/4ka0wFpZB8+XmCfMpWDiiF7wWVvKTnenh
         fLiq0/4041WV6SUN9UIAUOBG/CMSj6vFuAOInXJ4NveJurk01cGbF8fRy51alCQzW54O
         UmWAXgDLBXidwZi/zen/FyMiT4+9QZH++ETKQNT+c0cTD2imeB9je4SnL8TKcC48glED
         ooRh8mXUApVARqvWJDY7zkjpZo16/2+cEhSB1AU7m2IZ8+56OmAYPqCj9CJqISqpRtn0
         +Gzbol7v857u1b5Km8cgfWLXwWaOdvanog3a0ycMGHtle6ytBjRh/50KWHHrh5a7Q75q
         +ZMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773245418; x=1773850218;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zQf3bqKM0prJaYagyzgzwBy7UALOn5Wa6w4qvhYX8FU=;
        b=mPFj0rZgcQRE8suXpZP3ew8R76TFucNJ7cWr0vDl8UbY+Y/X5R826MwgebthTFo8x6
         taXbciDwXf943mV7LpIE02Gp9aknSJMwTDqLoSXh4ZTqPG8RjT9oKQc11P+WeBxt7DSN
         Fmn3rOwEoayjs4tmxM429abjyIRQbrq5gmtGYRxxxKijSWUF3LCovpa6IzVcmvcS6T+C
         dFpZnMaPv2ZgfwwJOZTQ0D2wH1LMPf2ASGk/VMkniuB/UhphYhGL0ZGcRi1L26I3ayeu
         yIMveqeI1RWY23bDsu/Iaovvgiyb0AYPUeDZCxBpXhN7LMK5dbgOUpVwI7CM5sARvB9F
         yT8w==
X-Forwarded-Encrypted: i=1; AJvYcCVvasx4gRv8emB+Bk37zOXm28i/kKbLGObfXYKB1NH7H/IDS1Xtbv/zkaKVkqxzie7Xi24Ip+8Ezm7QAowIe3w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGF6ev6v9A/MZiF6wQMw/QEpOhzPhuHGoLkFeJS54m9J9/VPdz
	AOGmAB2Ay4bcB3I9fPH8F6Gps5SF/gzlNtElW64VZDCh+GXLZQhoJ4tPhIJCsMSWh/LFD6pn6SZ
	tZT/0lKUtw0Kj5rbym16Lq8tC02vTYVSXynE2dFd7
X-Gm-Gg: ATEYQzyYNwblv0kWqIbyw8HXQQolaV2QGigKqwpgTjEr7ieUmOeDnfnfdXepbvXpF6J
	l+tmSO3O6W0hpaXPq91LM6tKMab03Sr4B/Z0vAXYTE/iXY+MviZbNHQ+fF5jKJZRqIgDErdwhNi
	YFgJXBFcDe/GioxVGASBzbWhJpN9CPrbK8dZb2EvKo3zpNJilmf3zS771KyjRvkQ1aKYVYMe7T9
	RjdiIEYKHQHho1iI3NLppkIrceB+34NDTJTIieMZMg4fX/ySu9bQwpfwcbxZAP7ZyRSxLDOItRG
	/bSg
X-Received: by 2002:a05:6512:712:b0:5a1:4835:306f with SMTP id
 2adb3069b0e04-5a156baf0a8mr762062e87.19.1773245418128; Wed, 11 Mar 2026
 09:10:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260307140726.70219-1-dorjoychy111@gmail.com>
 <20260307140726.70219-2-dorjoychy111@gmail.com> <CALCETrXVBA9uGEUdQPEZ2MVdxjLwwcWi5kzhOr1NdOWSSRaROw@mail.gmail.com>
 <801cf2c42b80d486726ea0a3774e52abcb158100.camel@kernel.org>
 <CALCETrVt7o+7JCMfTX3Vu9PANJJgR8hB5Z2THcXzam61kG9Gig@mail.gmail.com>
 <20260309-umsturz-herfallen-067eb2df7ec2@brauner> <2026-03-11-regular-sore-census-shops-DqYcUT@cyphar.com>
In-Reply-To: <2026-03-11-regular-sore-census-shops-DqYcUT@cyphar.com>
From: Andy Lutomirski <luto@amacapital.net>
Date: Wed, 11 Mar 2026 09:10:05 -0700
X-Gm-Features: AaiRm51EXHFpn1BAVpxsTY5E2VQC7PD0Lwp6wdRjddj9MKMq4N9OfHTiuPJrR94
Message-ID: <CALCETrVMF3VBr0cuEYOg-M_u+hX77Jfdujv3ZMtLGCzHgOcsGA@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] openat2: new OPENAT2_REGULAR flag support
To: Aleksa Sarai <cyphar@cyphar.com>
Cc: Christian Brauner <brauner@kernel.org>, Jeff Layton <jlayton@kernel.org>, 
	Dorjoy Chowdhury <dorjoychy111@gmail.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-api@vger.kernel.org, 
	ceph-devel@vger.kernel.org, gfs2@lists.linux.dev, linux-nfs@vger.kernel.org, 
	linux-cifs@vger.kernel.org, v9fs@lists.linux.dev, 
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

On Tue, Mar 10, 2026 at 9:49=E2=80=AFPM Aleksa Sarai <cyphar@cyphar.com> wr=
ote:
>
> On 2026-03-09, Christian Brauner <brauner@kernel.org> wrote:
> > > > On Sat, 2026-03-07 at 10:56 -0800, Andy Lutomirski wrote:
> > > > > I think this needs more clarification as to what "regular" means,
> > > > > since S_IFREG may not be sufficient.  The UAPI group page says:
> > > > >
> > > > > Use-Case: this would be very useful to write secure programs that=
 want
> > > > > to avoid being tricked into opening device nodes with special
> > > > > semantics while thinking they operate on regular files. This is
> > > > > particularly relevant as many device nodes (or even FIFOs) come w=
ith
> > > > > blocking I/O (or even blocking open()!) by default, which is not
> > > > > expected from regular files backed by =E2=80=9Cfast=E2=80=9D disk=
 I/O. Consider
> > > > > implementation of a naive web browser which is pointed to
> > > > > file://dev/zero, not expecting an endless amount of data to read.
> > > > >
> > > > > What about procfs?  What about sysfs?  What about /proc/self/fd/1=
7
> > > > > where that fd is a memfd?  What about files backed by non-"fast" =
disk
> > > > > I/O like something on a flaky USB stick or a network mount or FUS=
E?
> > > > >
> > > > > Are we concerned about blocking open?  (open blocks as a matter o=
f
> > > > > course.)  Are we concerned about open having strange side effects=
?
> > > > > Are we concerned about write having strange side effects?  Are we
> > > > > concerned about cases where opening the file as root results in
> > > > > elevated privilege beyond merely gaining the ability to write to =
that
> > > > > specific path on an ordinary filesystem?
> >
> > I think this is opening up a barrage of question that I'm not sure are
> > all that useful. The ability to only open regular file isn't intended t=
o
> > defend against hung FUSE or NFS servers or other random Linux
> > special-sauce murder-suicide file descriptor traps. For a lot of those
> > we have O_PATH which can easily function with the new extension. A lot
> > of the other special-sauce files (most anonymous inode fds) cannot even
> > be reopened via e.g., /proc.
>
> Indeed, I see OPENAT2_REGULAR as a way of optimising the tedious checks
> that userspace does using O_PATH+/proc/self/fd/$n re-opening when
> dealing with regular files.

Can you give a brief decription or a link to what these checks are and
what problem they solve?

--Andy
