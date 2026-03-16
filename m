Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFA8332608
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 16:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773677572; cv=pass; b=p+aSCPQZZ38+YXoziDwjmbNrIrFfiJt9NIDa7HTllTe3WJiDYwd6U7v6Iw1iY3cK0iPsN+bCJ69llKelR7beQBD3VS6Kuaf+3SddP7ZF8WePznZdRPitp/p0+R525O1UFPaj4WaKi4fSwy7QWnJOLh8jiv93WTBlsPPzsvCNwKI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773677572; c=relaxed/simple;
	bh=mngjUXyQIGRdPpzvMVY93piHPQBoPK11l7fLKRKjC7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qtNZY2v+9ml9dGnt/J98yKRlEwqCFmC1soAaX35FBGlOzFCXpov85rWI1DQ2sFhm4qKmRbxn0m7xhY1c04OnzeTnFoMBy4rkarxUJW/tzzh8NTcJ1Al9MkVURX5elfjt3Ra/EMJe39Y465ZzgIEihBxSBR5DtOyDtYaMevtW2E4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j44JMaNr; arc=pass smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j44JMaNr"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-94dd01deb53so866556241.0
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 09:12:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773677570; cv=none;
        d=google.com; s=arc-20240605;
        b=B7dbBR0OzSHQoqtZAN8KVJT57PUCB+0ZtRLODzdtHLE27dnC0Oarew6fPdy6FwSR/i
         39fN9iLYDgI8Gs4roS5pVdxiONT4egeS00t51aXKkl+qcfoRmfb8OCDJettbLmd/CKeM
         zj+wyXptzs0rvFvtYL4TDUfFFvhbbHouhZ0OOCUd8hBzmvPCqk1m0f0g5jZEPW6Eu1QW
         U2mYDVQA7izn9pfwmWaQsfFCkqU8ebpJHmKtuwECkGW/6fD+CHEPV+0abskpbmiU43N0
         GdSJiJ9l+L1Og9G5jC/X6lT4lUIBt0z26i4LtzUr/LD9s+Njmw1ucrTtn80GeRY5HJvV
         njcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J1pru+Gdj6fAyFCvZjE2fE08MsUs87siGvVmJJo9pqs=;
        fh=imm9ysw9Qmx7EOHyiVg9y6TLSdESZan/IqA4bnb3ALA=;
        b=bvsgVUi06BSwEzgPxH6pHFDZ0R1z7D8WFARxtWOPYnUFu0f1Uu4EF8L7so7v7VMPqN
         NITZG5Rp2Q/XuRfC4BFwQgEzJdqCNpubXVBo0YQIGY/uItVwBNi32n26z42Ry66WKn8m
         Ul6yy+IYla+QRM2xCggmVdeW/jUWlgWC0ow/hf1SXeoEavFTjmQL3Tsv2Y1rBcOogEpu
         e2cKWEKw5PmfN8+Z5T8UlZrk8C8FTlpU2ME75tPnn0Vt9ZdDzfJ9ILS5Ti6hGMST0Ped
         pmV0DrAkfVcUahVxDGWOAh2+68IU5Wxo7Vb/el6x2blBY3IefAiGHefZKMvL/UHUe7Ki
         zrVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773677570; x=1774282370; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J1pru+Gdj6fAyFCvZjE2fE08MsUs87siGvVmJJo9pqs=;
        b=j44JMaNrFBAXhZkUUvHY/tt1leg33h3rAo3Ugh3BKflwB6ZUzBgJTvqJM5+uLK+FZI
         7vHgnOIh005vRT1XNeK/P28EbrLwAY/wN+E+a1YpUsrgtcArcEtuNr0CPqNh5BysxXra
         a1BHvzFzgS8inLM8Q756Pdnf/ddDwQ2KtDCmWdoKhl9nzPbZ/02QEnbg2oOhAd+Y8f2+
         Gwir3ZTttiZa04Dp0+sfXei0I5H6h548/Nk8m3hrRxqGTwtVSaWVo98q9kies8dh9PG0
         VGYddRJgagKEk5WsBQZj7dJEx4hbG6Svn6nf3WPOYIFjG5q1dQWstWlCGXxL7pby2XZO
         8XeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773677570; x=1774282370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J1pru+Gdj6fAyFCvZjE2fE08MsUs87siGvVmJJo9pqs=;
        b=akTHfxuGFwEZe7a12k54Xk6jFpluyGVfE7VTA45mfOIjgOH8WjTMDWx0FChKEVwcnP
         HRdghtCqUUDOHEXHCpci0IcRa7w6qWMecdWtL9JHfGx4hDXT/k2yzXj9hZKcFR5eQ1Iq
         mNreA6pXc5teObsfzFH88EoKYjmj5TjjhRAfSK2dHcnVy7zQZxp8+BRFBj+dXAtWUqu+
         G7ioAMjFxTZcDDsvI0rW8MDzi8OHOUAeBi1TuctjmMeRZ4B4OljoiUu8/SAZmWxUyXRU
         Lci1iI2c1w3LHawJM97+s/dRPGcLSi2xVfJIOvXsaV22MF2YxPD/M+jLvVqrkbtDMIAZ
         XPUg==
X-Forwarded-Encrypted: i=1; AJvYcCW4yqS/ucLtThtgPb7os3/002WQwRKCWVkIt5jyoe18FQ4gQcC82XlP1AvxGnLTk0U7In3ZJGl0hROezREyXks=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4ccjKtyGjGh4J8VbNNOvk4CCDOjyahJRcuBnk2UnfR4vItc6z
	6zBm1hnipIpIy+9GCU1Fx/crPXtoxAD3CsLGVMV1wGoNT5oXazF0T8iP6+5r04drprw4k4zy3Vp
	mqOULhgy5YJYIR0KYDJGYrylJSW2WDSQ=
X-Gm-Gg: ATEYQzzmUdPD0peQXoSKCSBUxjcWnIftKomyitz5QV9AP9ik91/66JH7+/13sajkj2P
	yIRqlIrTrKbIzbJDXxPCGj1XgMmMyHIjZ6FMYha/5IKtA5Co9Z7W6r/Y095duZPIeXw/UclcGM3
	5UsPFZxdpIIXvJlqPQjoCBh6kEoHwNp5hovFHVcpv0fcA0dDCKQo6gbnlJN6J2EfetXe/WLt4cz
	q0hpb+L4jIFLbJwPbUZsnaILIsHBwuPEDILykNk0mDvxgHbLvoHbIL7AZkh1gTeJLv+ePyzjvep
	oNTy4diTvRHWP3sYeQLpplnVGjI7mhKSE9HSqtYYgbWN
X-Received: by 2002:a05:6102:b0f:b0:5ff:fbe4:8a7 with SMTP id
 ada2fe7eead31-6020e52bc2cmr4525326137.24.1773677569597; Mon, 16 Mar 2026
 09:12:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260307140726.70219-1-dorjoychy111@gmail.com>
In-Reply-To: <20260307140726.70219-1-dorjoychy111@gmail.com>
From: Dorjoy Chowdhury <dorjoychy111@gmail.com>
Date: Mon, 16 Mar 2026 22:12:38 +0600
X-Gm-Features: AaiRm53PnIFKVZg8YyfIZR4HMQW1Q6cca8fQLreG4GsNHelMK8lmfHxNIAUkk-o
Message-ID: <CAFfO_h6iNKbcKUi+Em2emRvXdZCfxcm7HnCenpTg9pSsHMb6YA@mail.gmail.com>
Subject: Re: [PATCH v5 0/4] OPENAT2_REGULAR flag support for openat2
To: linux-fsdevel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-api@vger.kernel.org, 
	ceph-devel@vger.kernel.org, gfs2@lists.linux.dev, linux-nfs@vger.kernel.org, 
	linux-cifs@vger.kernel.org, v9fs@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, viro@zeniv.linux.org.uk, brauner@kernel.org, 
	jack@suse.cz, jlayton@kernel.org, chuck.lever@oracle.com, 
	alex.aring@gmail.com, arnd@arndb.de, adilger@dilger.ca, mjguzik@gmail.com, 
	smfrench@gmail.com, richard.henderson@linaro.org, mattst88@gmail.com, 
	linmag7@gmail.com, tsbogend@alpha.franken.de, 
	James.Bottomley@hansenpartnership.com, deller@gmx.de, davem@davemloft.net, 
	andreas@gaisler.com, idryomov@gmail.com, amarkuze@redhat.com, 
	slava@dubeyko.com, agruenba@redhat.com, trondmy@kernel.org, anna@kernel.org, 
	sfrench@samba.org, pc@manguebit.org, ronniesahlberg@gmail.com, 
	sprasad@microsoft.com, tom@talpey.com, bharathsm@microsoft.com, 
	shuah@kernel.org, miklos@szeredi.hu, hansg@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ping...
Requesting for review on this patch series please.

Regards,
Dorjoy


On Sat, Mar 7, 2026 at 8:07=E2=80=AFPM Dorjoy Chowdhury <dorjoychy111@gmail=
.com> wrote:
>
> Hi,
>
> I came upon this "Ability to only open regular files" uapi feature sugges=
tion
> from https://uapi-group.org/kernel-features/#ability-to-only-open-regular=
-files
> and thought it would be something I could do as a first patch and get to
> know the kernel code a bit better.
>
> The following filesystems have been tested by building and booting the ke=
rnel
> x86 bzImage in a Fedora 43 VM in QEMU. I have tested with OPENAT2_REGULAR=
 that
> regular files can be successfully opened and non-regular files (directory=
, fifo etc)
> return -EFTYPE.
> - btrfs
> - NFS (loopback)
> - SMB (loopback)
>
> Changes in v5:
> - EFTYPE is already used in BSDs mentioned in commit message
> - consistently return -EFTYPE in all filesystems
>
> Changes in v4:
> - changed O_REGULAR to OPENAT2_REGULAR
> - OPENAT2_REGULAR does not affect O_PATH
> - atomic_open codepaths updated to work properly for OPENAT2_REGULAR
> - commit message includes the uapi-group URL
> - v3 is at: https://lore.kernel.org/linux-fsdevel/20260127180109.66691-1-=
dorjoychy111@gmail.com/T/
>
> Changes in v3:
> - included motivation about O_REGULAR flag in commit message e.g., progra=
ms not wanting to be tricked into opening device nodes
> - fixed commit message wrongly referencing ENOTREGULAR instead of ENOTREG
> - fixed the O_REGULAR flag in arch/parisc/include/uapi/asm/fcntl.h from 0=
60000000 to 0100000000
> - added 2 commits converting arch/{mips,sparc}/include/uapi/asm/fcntl.h O=
_* macros from hex to octal
> - v2 is at: https://lore.kernel.org/linux-fsdevel/20260126154156.55723-1-=
dorjoychy111@gmail.com/T/
>
> Changes in v2:
> - rename ENOTREGULAR to ENOTREG
> - define ENOTREG in uapi/asm-generic/errno.h (instead of errno-base.h) an=
d in arch/*/include/uapi/asm/errno.h files
> - override O_REGULAR in arch/{alpha,sparc,parisc}/include/uapi/asm/fcntl.=
h due to clash with include/uapi/asm-generic/fcntl.h
> - I have kept the kselftest but now that O_REGULAR and ENOTREG can have d=
ifferent value on different architectures I am not sure if it's right
> - v1 is at: https://lore.kernel.org/linux-fsdevel/20260125141518.59493-1-=
dorjoychy111@gmail.com/T/
>
> Thanks.
>
> Regards,
> Dorjoy
>
> Dorjoy Chowdhury (4):
>   openat2: new OPENAT2_REGULAR flag support
>   kselftest/openat2: test for OPENAT2_REGULAR flag
>   sparc/fcntl.h: convert O_* flag macros from hex to octal
>   mips/fcntl.h: convert O_* flag macros from hex to octal
>
>  arch/alpha/include/uapi/asm/errno.h           |  2 +
>  arch/alpha/include/uapi/asm/fcntl.h           |  1 +
>  arch/mips/include/uapi/asm/errno.h            |  2 +
>  arch/mips/include/uapi/asm/fcntl.h            | 22 +++++------
>  arch/parisc/include/uapi/asm/errno.h          |  2 +
>  arch/parisc/include/uapi/asm/fcntl.h          |  1 +
>  arch/sparc/include/uapi/asm/errno.h           |  2 +
>  arch/sparc/include/uapi/asm/fcntl.h           | 35 +++++++++---------
>  fs/ceph/file.c                                |  4 ++
>  fs/gfs2/inode.c                               |  6 +++
>  fs/namei.c                                    |  4 ++
>  fs/nfs/dir.c                                  |  4 ++
>  fs/open.c                                     |  4 +-
>  fs/smb/client/dir.c                           | 14 ++++++-
>  include/linux/fcntl.h                         |  2 +
>  include/uapi/asm-generic/errno.h              |  2 +
>  include/uapi/asm-generic/fcntl.h              |  4 ++
>  tools/arch/alpha/include/uapi/asm/errno.h     |  2 +
>  tools/arch/mips/include/uapi/asm/errno.h      |  2 +
>  tools/arch/parisc/include/uapi/asm/errno.h    |  2 +
>  tools/arch/sparc/include/uapi/asm/errno.h     |  2 +
>  tools/include/uapi/asm-generic/errno.h        |  2 +
>  .../testing/selftests/openat2/openat2_test.c  | 37 ++++++++++++++++++-
>  23 files changed, 127 insertions(+), 31 deletions(-)
>
> --
> 2.53.0
>
