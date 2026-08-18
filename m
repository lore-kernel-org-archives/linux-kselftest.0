Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4D0379C3E
	for <linux-kselftest@vger.kernel.org>; Tue, 18 Aug 2026 19:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787083078; cv=pass; b=OjBUMSEFm3Lo4AOGigNMBYOoluhpEQssslTUXv1JiZK2pujTkl1PCYpEnvkPMHZpakntnRNWvSk7nzvunpvt9xeShGRmhE7WaGA+FYLIDpx981iVODrmpGmaj9nQL1x2ZcPyXAGrqspFhJlwK5I4EtwJWaezaNzgaGXSwokPKhA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787083078; c=relaxed/simple;
	bh=Szm3BHWLk691Tkb3wpX+u/chbB+Kd0H25f5yPjsHjDY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WSyjEfmbtvHFjWzKzvfRUKW3j9CtXIiWa5map0hAQ/L7gfbz8DiIfnG1UBTXByzwmw7UUdLlXiovn9ie9Pqu5NZJP0uH8cmlZWkXtHJd+E1dc8K4blfqkSklftgeD9z6CXl+ncHtyVILEmDTZBaSQPwCQ9E2dGFEutul+QNWKjA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=elQ8b6iO; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="elQ8b6iO"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a10b20634fso487155a12.3
        for <linux-kselftest@vger.kernel.org>; Tue, 18 Aug 2026 12:57:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787083074; cv=none;
        d=google.com; s=arc-20260327;
        b=l7zHo+Hdwn2rerRrPONxyc1ojZLF5/SJVN0xbb/VYK8JbBh1ZX0QCSFGWdadCLJikI
         Qql5WHolvP+mmRQoArJJZ7dfE0fW1FhRDufNb9SyQEZPUPGTgv5RcGaBPCsbJSbRsJkX
         if+4bfSAoWphYehurjaCPmVEuotVzW4kESV58hh4cpWIlNrCrUvd0XJO/p8KeRK3Qs1/
         d49Ds2Nj7YXZzbz9S8Iwa+8IkFCA8TuMBk3Wj7Uk0KWzbRNcz/5SuQjCvTQ3t7jkJdqT
         g4ds+6gHkw6pnqjx0A5viJAuH96FFAOy5kD4CUTTAvfXNi5DUBiiNgDw8trXy7onh09E
         ntsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WSJnz51fcIZBid2gs89wxh+KscHIMubJ0sU5re+K3qI=;
        fh=1gwkB3XKf6yTYI80Nct+uxiyZgRhXSjoGWQO1pjFLn8=;
        b=eppnJ7Kl6eoaPwUfUT/3lJt9mNdPQXCOtRX0iCG7+DXSeCk86VDhYd4teMsJdpejtE
         qSbyIiTgf2iz1Bje02yjP7/3oWFvOfcj/fEneScDYWYSHA8ytMbf3Lg+ow7sn+Qjytm3
         EQsVXPuSRrLusbvtPXMz87gi9hledq9SG9GpTHwnG/pploNgon/o3XPT1oEPeBQupDIf
         ICiy/r6GK7QbHc+EUwuYcXH2Yr9PYHvrHiOMw/L63CrsGv5XzKl0xPAbqaV1SVUTyi62
         T8TsPzxYv5NM6GjxG/hyH8KKmXMEp/8X9gXin7ogEUYuZ6U+FFzCC2b/MN7s0b9ZpQJ+
         Z8xA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787083074; x=1787687874; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WSJnz51fcIZBid2gs89wxh+KscHIMubJ0sU5re+K3qI=;
        b=elQ8b6iOkIjEjnUW6htJBf3n3m1XxKk13W6by6/hzGgLlhllHeEaa4HIYvuZrFYaGz
         tiXsHVgpxE2FkEzliYnkIBbnFh9zjXZDY0UBf8ErVkxgUXJOc/CS9ROY6atoIEy2hD2t
         Hp6l5D7spJJFbk3gqiT669pDywaJpvkQwHvrWig8ZR5Wa0uw1jeWou2PqdyYMyK9Ku0Q
         4Y3eQSUnjfjakX2dRVx4N+vFqn3WYFaWVlybHezY0GIDLjdZCCFG+7yuniKijg0Qlslb
         M+Yp7EHxtUT/Lg7E8v0welc35Usa91yOacZzQiVvPH3wnfA0KjZRBmNuBiRY1USmlhun
         eRqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787083074; x=1787687874;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WSJnz51fcIZBid2gs89wxh+KscHIMubJ0sU5re+K3qI=;
        b=btrPcZlP3kHkibjfkdiJvJ3Wi4z3ESR36YdCos1JNaVenkFtiwCdVNIBWEErJVwODe
         sVhflsgVHF5rqIqLqyGsQRIPpLhRr8Vv/I9O/49WD7kOARFdR3NfVnvyoZGmYQYP64uy
         rvSKUw30hgu8zwR354gAxiq6IiXDudHnC6S4UHlKg4+qLm5/a6jb+plOWLNUQGj+8gzV
         fPYf17LMIic4+PJYV7AiOZDitwRyRWNkEwgvT+0iBTHGLQLI3L3V1jr1msIueW80ESrX
         Bbyx4/C3JhyGyAJS3I0UASBDrektAlF0Y3UeTwxCVCnYQXcqKke9A51AFHkoPk15iypS
         RFpQ==
X-Forwarded-Encrypted: i=1; AHgh+Rom3jSVEaZr1QhbzfuIkEpGWEONFsInp6WAboTqdixn5PNLQU7lH9FjHf3ZaNqK0r9aqIwHIGOzjNwucyqliqs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjmbYlWvCQ0aKte59UqHpEvnjvHFIWC+Bz6brEASosdmg2Ccu0
	yeBUMNtWZR+XtSPYFt0/odX5NK8I4iwywu43wAnmVunC5RcV1PjVP5maehGwnpIQilhoatsp+Zg
	QJRKPS30Tm4saMsP6jWIUrO+hiyQj8qWW9Feb
X-Gm-Gg: AR+sD11JTY0XWzg/qhn9vmwgGHAK+H4o3aZQyS9qspY68MJaDJeSqWl3A5qrbK40qiU
	y36otrTtnl8XOBRAXJrESnOWH5tlc0Q5MIsurbxDpc+MsyHYkAy6n4pPSFbTqMfx20eNrfExsa+
	QiRJZmNpQqJLN26GD4HJwdFbCbcjBDhaJgOX6fiI8KHbjhek/TWeKrRnZjq09DNNwD+vhQIwYPB
	E2FpiL3TkdXmRQ/a3akwWfA9qREwX4rQ5ZjwKkoRxfGxRlC3Fk4WEIE8wPYl+LAUJ7P1GCgieIQ
	YcD77zlethZiMwi+wF40q8ZPjV8BJiliXY1HYPCD40srRQ==
X-Received: by 2002:a05:6402:3983:b0:698:ecf:d18a with SMTP id
 4fb4d7f45d1cf-6a3fb76aae4mr349028a12.9.1787083074119; Tue, 18 Aug 2026
 12:57:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817141156.6079-1-luis@igalia.com> <20260817141156.6079-2-luis@igalia.com>
 <CAOQ4uxjsx-Atq3tGsUeakGNZYLVHayVXPne1E6gM0J9tZp+f6g@mail.gmail.com> <87mruje8a7.fsf@wotan.olymp>
In-Reply-To: <87mruje8a7.fsf@wotan.olymp>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 18 Aug 2026 21:57:41 +0200
X-Gm-Features: AcwNN1VmEJCZ2dfSdLunAIKvJi6pxYGeoutfft8jaBr1bHqfqj2oEFnFdnxoK3A
Message-ID: <CAOQ4uxjnJ436FHZUZMKNx5C9gPKvD5c0n9ojcnxQBoUCuBTVqQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/8] Documentation: fuse: add document on caches
 being used by FUSE
To: Luis Henriques <luis@igalia.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Chen Linxuan <me@black-desk.cn>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Matt Harvey <mharvey@jumptrading.com>, kernel-dev@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 5:51=E2=80=AFPM Luis Henriques <luis@igalia.com> wr=
ote:
>
> On Tue, Aug 18 2026, Amir Goldstein wrote:
>
> > On Mon, Aug 17, 2026 at 4:11=E2=80=AFPM Luis Henriques <luis@igalia.com=
> wrote:
> >>
> >> This new file aims at documenting the caches that are used by FUSE.  A=
t
> >> the moment only symlink, attributes, ACLs and readdir caches are descr=
ibed.
> >>
> >> Signed-off-by: Luis Henriques <luis@igalia.com>
> >> ---
> >>  .../filesystems/fuse/fuse-caches.rst          | 142 +++++++++++++++++=
+
> >>  1 file changed, 142 insertions(+)
> >>  create mode 100644 Documentation/filesystems/fuse/fuse-caches.rst
> >>
> >> diff --git a/Documentation/filesystems/fuse/fuse-caches.rst b/Document=
ation/filesystems/fuse/fuse-caches.rst
> >> new file mode 100644
> >> index 000000000000..071febf45d00
> >> --- /dev/null
> >> +++ b/Documentation/filesystems/fuse/fuse-caches.rst
> >> @@ -0,0 +1,142 @@
> >> +.. SPDX-License-Identifier: GPL-2.0
> >> +
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +FUSE Caches
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +
> >> +Introduction
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +
> >> +This document summarises the different types of caches that are used =
in FUSE.
> >> +For each cache type, it attempts to document the rules that are follo=
wed to
> >> +insert, validate and invalidate data into the cache.
> >> +
> >> +symlink caching
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +
> >> +Whenever there's a link resolution request, the VFS will call into
> >> +``fuse_get_link()`` which will then send a ``FUSE_READLINK`` request =
to the
> >> +user-space FUSE server. However, the server can ask the kernel to cac=
he all
> >> +links resolutions by setting the ``FUSE_CACHE_SYMLINKS`` flag during =
the
> >> +``FUSE_INIT`` negotiation.
> >> +
> >> +If this flag is set, FUSE will immediately call into the VFS
> >> +``__page_get_link()`` from the ``->get_link()`` inode operation. The =
first time
> >> +this is done for a specific link, it will end-up sending the ``FUSE_R=
EADLINK``
> >> +to user-space but the link contents will then be added into page-cach=
e. The next
> >> +time the link needs to be resolved, it will use the link content that=
 is already
> >> +cached, and will only fallback into sending the request to use-space =
if the
> >> +folio isn't up-to-date.
> >> +
> >> +Attributes caching
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +
> >> +Attributes obtained from user-space, for example when an inode is fir=
st
> >> +looked-up, are cached in the kernel. However, these attributes have a=
 timeout
> >> +associated and once expired they are invalidated.
> >> +
> >> +Thus, the ``FUSE_GETATTR`` operation will be sent to user-space only =
if the
> >> +attributes aren't yet available, the attributes aren't valid (timeout=
), or if
> >> +there is an explicit request for doing so (for example, by using the
> >> +``AT_STATX_FORCE_SYNC`` flag in ``statx``). This may happen in the fo=
llowing
> >> +situations:
> >
> > "This may happen" what may happen? I don't see it referring to anything=
.
>
> Yeah, that sentence doesn't really make a lot of sense.  I'll rephrase.
>
> >> +
> >> +#. An explicit request from VFS to get the attributes for an inode (t=
hrough the
> >> +   ``->getattr()`` callback).
> >> +#. When an ``->llseek()`` is requested to FUSE with a type of request
> >> +   (``whence``):
> >> +
> >> +   -  ``SEEK_{HOLE,DATA}`` and the user-space doesn't implement the
> >> +      ``FUSE_LSEEK`` operation (it has returned ``ENOSYS``), or
> >> +   -  ``SEEK_END``
> >> +
> >> +#. When doing a buffered read past EOF or automatic page cache invali=
dation mode
> >> +   is enabled (``FUSE_AUTO_INVAL_DATA``).
> >> +#. When doing a buffered write with write-back cache enabled
> >> +   (``FUSE_CAP_WRITEBACK_CACHE``).
> >
> > This list is incomplete and strange. it has post EOF write for
> > writeback which is the exception
> > and leaves out every non writeback write.
>
> This list was meant to list the scenarios where the FUSE_GETATTR is sent
> (the "this may happen" above).  But I'll review the list again.
>
> > If you composed this list yourself I highly recommend an LLM for this t=
ask
> > if you used LLM I suggest a stronger model.
> >
> > Generally speaking, I find that today's robots are much better at writi=
ng these
> > sorts of docs than I am - as long as I sit at the helm and guide them
> > about where to expand on and where to keep it concise.
>
> Thank you for the suggestion (I did not use an LLM btw).  In fact, do you
> think this document is really useful, given that everyone will be running
> an LLM anyway?  (I've been asking this question myself...)
>

LLM is very good in collecting information and arranging it in nicely forma=
tted
structures, but you need to keep a very good eye on the output and you need
to focus on it to make the document relevant to the prospective audience of
human readers. Running LLM to document without a human on the helm
you can get half truths and plain lies.

Also, for economic reasons, the way to work with LLM is to let it research =
the
code base and create nice reviable "brain dumps" that you OR the LLM can
read later into context.

Doing this research every time is neither cost effective nor reliable nor
deterministic.

Thanks,
Amir.
