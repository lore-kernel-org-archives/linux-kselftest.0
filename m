Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC53C3D34B2
	for <linux-kselftest@vger.kernel.org>; Mon, 27 Apr 2026 14:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777299477; cv=pass; b=OAzumoscI6z7pNsxWMFvRMrQdFJSRI6aHhCfuQ0UqX7cGXjFeTCV7iua024xn/14Zd6tVkACeWotaJuLpu0JvJd8L7xLgp1hU+Sk/WNgjQL7lj+OeZa9Edd+eYKPfgtECUKLTHrGVFVILu1bQXVQyG/WkHJ+qQK/U4WJiHDe3qc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777299477; c=relaxed/simple;
	bh=dCas8RQKsBsKm7RPEue3wRPtJ4lneFcySX6TUqGbvVk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LqZo1as4Kb+WtIp1eWNbvsC9HwMGG6lheEIk6FGLm7hREBvv1i06DCULRfJguUyjYoxzUS3bD9Zdto+CgpsiwleORXzQ0qaDhtETCiwhCDzKdLFVcCDz/MbAuMmUr8U7HLcQkJmk1ATm6nkJ6eCfiGuKTCvYu+uBQz4+uwJcWxk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UV7XlqUV; arc=pass smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UV7XlqUV"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-56f660d9a51so6587312e0c.2
        for <linux-kselftest@vger.kernel.org>; Mon, 27 Apr 2026 07:17:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777299475; cv=none;
        d=google.com; s=arc-20240605;
        b=jjeak67XVUtirN2Mjq2vD5ciN2Ls7WqSyqIoeGjOoWbISJkt15DQxFSu8qQSbXpF6b
         sr6z16J3viUKPrV+V9YPWNgbVkMYCAGkyQWXgvW2NqISD/JL9frbqS85zeKXYb1OybxA
         xK5jpr1bcpxg+VW6abe9Mf4QLN5gGDWkB4S0POBPpOx0OTziZ9rEG37WDdaZQniTjWnz
         KIfJvdUorDFja8gUE8OYK+pHratfxrksI7Its/rqz8801JhMGWhRKGJ1mQ0zg+D4CcHO
         vwP9GftxTcKdAV5hDcb6TRt5ouq+ibvNRYNwwRPqfe8jsdIfRD6R+HppPSm5E0f2I7A8
         3Mng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mZ1b/SaO6jwDwL2+8FqnCPqXNKQ2XKB8aPpu8Tl3aso=;
        fh=W9qvNAuaJPC/meVBFfwFN5oQ6vhqg7z2iUMwpXsTgKI=;
        b=BxlQVgZ8ntNcT+Q8S77N9IujBMe3RmhcR2eU9/hDV6cajnsXVpkD2iQmZfbkWJRSh+
         Wfobvps2fwwN/s7SXrR62t/77NoIcOnMm0SiG6t+ehPUjbduyEvb8lcXypYrLQHQwcVC
         HodrXyMq6wEveWJ09sA32MFJ4pbCRmnnNAO9WHUL6S68sPt+T8A8o7tgGUqvml1jnf0r
         tKmajHlBB112KXfd31T0WxCyaMxB4fIXOlYqvLBREN4LRG/3StZC0vez/bd/WipyxKBg
         toKuGe4X2pZlpI7pQkAMiJCiT9fqYrWyvFZ6I9cJzbq4+VfUGgT0ANqizQxFyozJj3Pm
         m0MA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777299475; x=1777904275; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mZ1b/SaO6jwDwL2+8FqnCPqXNKQ2XKB8aPpu8Tl3aso=;
        b=UV7XlqUVvinNvlG4ozIHjmCDkWLWkXqWdHVlwKleD4e0udKlFPCyhDThue+4KCSFuf
         4PPkqV7PBmqSm85u3fIzULTAc9+wtQaK8rViECu4uoP52DqNbn15+/ac4reFdyXrn/B1
         s3/x0N6JxPqqHQ+SvjX5nH64ret3FMse3JDW0UFDRIL8eY4pp1TNXlldauyddtT20e1L
         qF3CPo8D4Y7Ek3KN8fARmEEs5LMSb+8CfKYUV0BkpMnaU5nmr2gie+0EpOmT51BfojAE
         Cr7faIb0pQuMBU6P/HjjO15sUUH7oPx7M3XGM8FLv2JB+tutyWbnxLL5ubYguDpuqSMe
         bJpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777299475; x=1777904275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mZ1b/SaO6jwDwL2+8FqnCPqXNKQ2XKB8aPpu8Tl3aso=;
        b=ZOx73eemtdW2wucrClzcnLI2STfIyIVrbV91GsirLMxpqE5ixm0Qr2b7ngR5XrtqTz
         ePdAiJIy4DfG6GQwo54i+D8ZhEJVMV3fV4kLT7AhxGJVQbeYv9Py8irslVZBhPpokihm
         D8yq1mOf4JbhVkKjmErIT3vray/npSbhbFtIPYtfO/6KAFr4GKuV0pw2QJmXJJMDwMC7
         zk0o+YPUE94UE7DsAur13j0iqnOx+oof2lmJpNekMtALFY+tFPy4/22Zw5/BRRSGVbBF
         5SqfvbqtoIy8ao5KOUityztiHLpApF/kSoDgPdqnWaokhj0OZTXPIdQu8UjbD1iZaNCx
         cOxA==
X-Forwarded-Encrypted: i=1; AFNElJ+XXIRPhONYDvRXXu9gmgLIA90WvI+NX8W/i8orGvL3q7Tys+Yhwb5Y0ImdEtur+KtnRMMyAX6IpM9x0oFttLM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLGxs+FM2gJPq/m5YVSv0ESQ3b/IJfqLA4SHIaM7ih2QKKuL9H
	LJYV3VwWhuzsx/TLeZvOer8z/72KezqVSEOvJkwsUJCxUGDJaeknwxIZgmWm7j5MUYaxVgtF561
	M54AFjNttWj32JbO4YKTS4tCLTil5vpw=
X-Gm-Gg: AeBDietRnJEdfNiNKDVzGl5NijhD1MkMeaKj1d5iPaKgPrADdJIfzUFWWaS5Rz4TmxJ
	IdofRWzRnJe/HKL1nU95IEqH4ICvSAY9rvewWDQo0l8FUs2zcSsmGT50jtutCbu3ZWnKVU4sxZv
	qhzbyzx6cBfxq0IPxUsfp+OzjB7VlQtmsP4Q2jlIDJMyL1h+pxBxT0o5USoraWKbf01I4NEqwp9
	uDKwanf6UhtXuY6UEVs/NEW+xWC9AYWvavY+HGRYgD393gfYkL40r00F00wYkM8Gp86CRpaBRL1
	q4AD5slwNWDf6jzAdtdoa5Hz5JYHk7UTPrXQ0wNJ6vc1bh1ShPi1
X-Received: by 2002:a05:6122:8d3:b0:56c:d5cd:1e7c with SMTP id
 71dfb90a1353d-56fa58856b1mr21307327e0c.5.1777299474612; Mon, 27 Apr 2026
 07:17:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260328172314.45807-1-dorjoychy111@gmail.com>
 <20260328172314.45807-2-dorjoychy111@gmail.com> <lhuzf2oy1me.fsf@oldenburg.str.redhat.com>
In-Reply-To: <lhuzf2oy1me.fsf@oldenburg.str.redhat.com>
From: Dorjoy Chowdhury <dorjoychy111@gmail.com>
Date: Mon, 27 Apr 2026 20:17:43 +0600
X-Gm-Features: AVHnY4JD2JZaiwDyyuW_kBt_sHjEkoUZKURjGdK7nlj6KmXsjRIqpl4zFGzklnA
Message-ID: <CAFfO_h5B=Ox9S=Xc=az2vQwowffohch-mkvSggYAfNXaVuv5GA@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] openat2: new OPENAT2_REGULAR flag support
To: Florian Weimer <fweimer@redhat.com>, brauner@kernel.org, 
	Alejandro Colomar <alx@kernel.org>
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

On Mon, Apr 27, 2026 at 7:28=E2=80=AFPM Florian Weimer <fweimer@redhat.com>=
 wrote:
>
> * Dorjoy Chowdhury:
>
> > diff --git a/include/uapi/asm-generic/errno.h b/include/uapi/asm-generi=
c/errno.h
> > index 92e7ae493ee3..bd78e69e0a43 100644
> > --- a/include/uapi/asm-generic/errno.h
> > +++ b/include/uapi/asm-generic/errno.h
> > @@ -122,4 +122,6 @@
> >
> >  #define EHWPOISON    133     /* Memory page has hardware error */
> >
> > +#define EFTYPE               134     /* Wrong file type for the intend=
ed operation */
> > +
> >  #endif
>
> This is what POSIX says about EFTYPE, in the Rationale for System
> Interfaces:
>
> =E2=80=9C
> [EFTYPE]
>     This error code was proposed in earlier proposals as "Inappropriate
>     operation for file type", meaning that the operation requested is
>     not appropriate for the file specified in the function call. This
>     code was proposed, although the same idea was covered by [ENOTTY],
>     because the connotations of the name would be misleading. It was
>     pointed out that the fcntl() function uses the error code [EINVAL]
>     for this notion, and hence all instances of [EFTYPE] were changed to
>     this code.
> =E2=80=9D
>
> So I'm not sure if reusing this name is a good idea.
>

Thanks for pointing this out. I had started out the patch series with
ENOTREGULAR and it was discussed that EFTYPE was a better and more
generic error code which is also used in BSD systems like FreeBSD[1]
and MacOS[2]. I also agree that EFTYPE makes sense. We can of course
change to something else if everyone agrees.

cc Christian Brauner who originally suggested EFTYPE for input on this.

[1]: https://man.freebsd.org/cgi/man.cgi?errno(2)
[2]: https://developer.apple.com/documentation/foundation/posixerror/eftype

Regards,
Dorjoy
