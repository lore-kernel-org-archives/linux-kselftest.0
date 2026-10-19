Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792438352;
	b=ErdV26GPN0zmbX/dBIFcAfi4x4+dPwWDcyxrtDxMgzPOoeaTcY4VtTQxzC1pa/5oNdf6
	 OqavPURgcsjlIGqUUFxRY0Bgs/F4XsBTHAF4SB6OySXV5KPYYpTfMvo0oSseNiJtrZlY1
	 nFN+JgvCP6sfgbb4ycNaw0C7367UZ4qbTtvhj3BO/xeiWhHAMDXLOOMvDhRsBnPejWFjP
	 h9iWMp42lITwEHFVvmgECxhZzBd95wfFLsLk0S903heyDKvm/ja9apKlwUAZs4vKPCLX2
	 e+fNVR7MvhdEAMpBpOhq0D1n+tLb6GGaM1P54Vysx9Fjsm1yfSrIoJivhwQTfW5OlYA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792438352;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=UDVr2jRR6Ik9p8PRWRYl4J4mWZgBLdNkTR6eKk/XdxA=;
	b=C7biq0uk5/DlcclvTS1mfv8uzBKRQNJfK4Uf/vKyIzjYQIhADnHW5/ucr/d/r/ml1D0v
	 4ybsJIszVjSK/xeD1CTt4aOYJ9MqnZGb6NqwC7AwV+h+N0RkM/uFjPGLxri5SLqNHWHNk
	 eLE03wKSG9QKQLVfT349E1Ka5ifO5wMvfd6A32w0mp//KANEzDhJqMDVzuiq+JUm5oORe
	 1fvuaVZOl6V7SGjZiEUOBTZU38AX6V8ISPlio2eEycvHX8U7yf+vLTu4c4saWfXe9vaOv
	 Z2atpiW1kTIyBjaE+MpZDy9t3aSLW36RvKBGlIJdZP/xmaL6HpaH6cnSgvRzhkjVNgg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=kJyk0MVt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56819606A31C
	for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 19:32:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56819606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=kJyk0MVt
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b203527bceso2983763a12.0
        for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 12:32:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792438350; cv=none;
        d=google.com; s=arc-20260327;
        b=bF+xyuTpIuV7SVEwrX5Iv+4Nf4yCREK1zcXBex86Y4CCGPDnrK1JAcW9Reig8xCGby
         pg+ak7ZOc+ojyihjZ5tcc1+YKjYqoIo17kXaC8O4NWEWwC6l6qMiD5Jx3sRCfk6oBpJX
         bcL41zrMOJt+rJzVb882uN8mjMaGxsmctGhKpMW3uvlVOFtTXx/hmCn78s7XaLtjh48y
         ddWchHheV8HzskgnUZGnqESVpbUKoTaskpnqGTESMFTOXDnCYqjHK6Q81p94BeuYooNU
         kehEATjgcPIq5TVfb5IHeEfnNSytcxLZRNfHulzclQDf0Qr0TdbmWx/yNuy3ta7SnqNR
         1HcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UDVr2jRR6Ik9p8PRWRYl4J4mWZgBLdNkTR6eKk/XdxA=;
        fh=lQ/qCOu9znsR2N/zbyOZ5LRuniIEPSUF6nLSnHKB3qo=;
        b=kxKz+zsR+9DMJ3XIwPAOMVeJjCMEgQugIb1eWOARO1U7jDbWYk534K9K46IPi1X5mM
         7+LgrLkjQG7FJZ3Qw31nZCo/TMHhDvGWlZmwshx4e4ayHLBmkocykf07Dme+zLhW6xOy
         pr/Al66WeT3fV34NsiBEAwj5LJ+Gb1usuxOgefboqbMlqwSUtdqy8LmxDc8wj4j10k7Y
         UqVQUdou5r5v6N2HKl2yfnZ8yluesigdfCidUrPV9YlGK1xgoM4aWCJeqTBx2Vp4HT1M
         O+tKbuO9PasWLXhiRR1Np3PRzmcVOn/47HDGnR7UkILKrtrWvv8tW91NeixWE5pqlhqy
         licw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792438350; x=1793043150; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UDVr2jRR6Ik9p8PRWRYl4J4mWZgBLdNkTR6eKk/XdxA=;
        b=kJyk0MVt4BAW2547Dafs96nKoL2ehgVrqjcpXef1FIXs9ZK6EUkJJSTzsxFkuEPNrL
         8t/b2ajOOCBwZEL7in3pVb2BBk7DW/tyXfR8F8DnBmUu+l9dusAUjzaWF8KjQ5StLTf3
         wpg1pCJj2pW448kat3n3Nf6jPQEiTTXnUlUhuKFbp6TIIZPPbYL9RAcJTKcsjq4PWdN1
         T8urZv3H8uA7X/MhlYuQH1hKUJ8r9kasyDh3LkE0TDUqv5x/Z4e1ctoXZosUjPYHuFbE
         cDuAyt+aQx1XuXfL9Vq3jGXQ/YyA5RiafzQnQyO167Re5nD+c8m2GKOovA/LvtagRuBY
         treg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792438350; x=1793043150;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UDVr2jRR6Ik9p8PRWRYl4J4mWZgBLdNkTR6eKk/XdxA=;
        b=ZOn1ifznyevOR5cuKacDfclegW6Lt74TC/RcXF4Tc7b+paqN8stWjT0kd+3aKH9io7
         cajZfwmbHExqaESyZpfZh+HvZkJfwLQ49iWoIikhD/6k4cQQM5pO9EnUDXMD6KtOyDla
         9QGaYO4HlX9vscNfbAwo2n+UGHQ5iTkJFn6BDHsUw7WIC7XdUeWLN2gfTJlI/AoOPv4f
         aBLSfwafj6aBFYsBQGRFd3bG87lU9A0I5cvWkAPufUaYEYJGzPiCD7sa15P92aCFzAPc
         +c+Z8FQ8rHqbLTuq4Of2YShY5RW1wdbYK6lO3ee9JPdzMoDUKnEPxuSu9QNSbEF99qz/
         leiw==
X-Gm-Message-State: AFq9FYKE8rvGFqpyVe+RO3vr324yaunOyDnbCe9vUo5ICUHb5PnMk9Me
	h8yis+zPIYARcFBebcntX6FaeF9yKgClRnXOlScLcCCgQW4TLOhIZhro/R78RzhYwo38KjcVGtC
	ZJ/soNG3AHwEGo+1r6B2asBX9o8w3C7sMlRgj03pS8w==
X-Gm-Gg: AYBFou1RXpWkjR6/SheV57djMUWOMTRyYZ8LORbUJuGwdxyHtKcZ6F4iRrnsJeviXlU
	VCgZXhsThBvCyPP5gULPUqIpf+d5MQCN3NEsNXMxuPfBVdnscGZEJOFMVlShidEQwgeqsEPouWv
	3yqUsNou5yPzHw+RSMqDEXDsqGiIUQi3KFlWz5nOGH1/gCB6mzNX/MO1YhBWE+eTyZrYUBcu7em
	TtNgXxkFBRNzEDpQmmEMeyPzSGyHDy0ZIQl7M5BYtOdQkme7wyfIfj2M6XqlX/s7sFB1ZRgPRo7
	/yzqYW7WMJu3Sbgm1REhKoXBB1DdxfHMscU7JZ8lLjU6ce/nBjU3wZxzEIvmYME0YSGkend1F1S
	qTF89MzQuGeAIUwtXm/c85bU6j4DiTcFyOcsvi5ZQR8HJx1BpyQgRXaiRILQDRHVsDHQ=
X-Received: by 2002:a05:6402:46ce:b0:6ac:9a44:d404 with SMTP id
 4fb4d7f45d1cf-6b3a80333f9mr4787170a12.0.1792438349280; Mon, 19 Oct 2026
 12:32:29 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015093816.2438942-1-pasha.tatashin@soleen.com>
 <20261015093816.2438942-4-pasha.tatashin@soleen.com> <9huzwlrdh4q4.fsf@tarunix.c.googlers.com>
In-Reply-To: <9huzwlrdh4q4.fsf@tarunix.c.googlers.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Mon, 19 Oct 2026 15:31:50 -0400
X-Gm-Features: AclHuK9RhOF8P0_iSDq0R6E-rGot2pIUv8sHnfpDWRrrJfxNdPKGST9db7rmV8M
Message-ID: <CA+CK2bD83qVv54_Wps4GRr9otg32pW2A01WVTo-gTR=oYs95Vw@mail.gmail.com>
Subject: Re: [PATCH v1 3/7] liveupdate: Pass user argument to file preserve
 and retrieve
To: tarunsahu@google.com
Cc: linux-kselftest@vger.kernel.org, rppt@kernel.org, shuah@kernel.org, 
	akpm@linux-foundation.org, linux-mm@kvack.org, vipinsh@google.com, 
	linux-kernel@vger.kernel.org, dmatlack@google.com, kexec@lists.infradead.org, 
	pratyush@kernel.org, graf@amazon.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 3:26=E2=80=AFPM <tarunsahu@google.com> wrote:
>
>
> As Per Today's Hypervisor liveupdate meeting, This patch will be picked
> by @dmatlack@google.com for latest tmpfs preservation series.
>
> I have a suggestion to make here.
>
> Let's send this patch as a saperate patch so that I can also use this in
> my guest_memfd preservation work. This will help landing this feature
> sooner and unblock other subsystem who needs it.
>
> Let me know what you think?

Hi Tarun,

You can include this patch the next time you send your guest_memfd
patches. Whichever series lands first will pull in this change.

We are trying not to merge new features without an actual user,
especially ones as important as those changing the uapi. I think tmpfs
preservation may actually make it easier to land, as it only changes
the code that we maintain.

Thanks,
Pasha

>
> ~Tarun
>
>
> Pasha Tatashin <pasha.tatashin@soleen.com> writes:
>
> > Allow userspace to pass a file-handler-specific argument structure when
> > preserving or retrieving an FD via LUO. File handlers may need
> > additional context during preservation or retrieval, such as a target
> > FD, device location, or handler-specific parameters, without introducin=
g
> > separate ioctls for each file type. Whether the argument is required,
> > optional, or unused is defined by the file handler.
> >
> > Extend struct liveupdate_session_preserve_fd and
> > struct liveupdate_session_retrieve_fd with a 64-bit arg field pointing
> > to a handler-defined argument structure that begins with a 32-bit size
> > field. Because IOCTL_OP validates a minimum size up to the token field,
> > existing callers passing the 16-byte struct remain compatible and have
> > arg zero-filled by copy_struct_from_user().
> >
> > Add parg and rarg (struct liveupdate_arg_spec) to
> > struct liveupdate_file_ops, initialized via LIVEUPDATE_ARG(_struct,
> > _min_last), which records the full struct size and minimum required siz=
e
> > while enforcing at compile time that handler argument structures begin
> > with a 32-bit size field. When arg is non-zero, LUO validates the
> > minimum size and copies the user argument via copy_struct_from_user() u=
p
> > to the handler's expected size and passes the kernel copy in
> > struct liveupdate_file_op_args, or returns -EOPNOTSUPP if the handler
> > does not accept an argument.
> >
> > Also provide liveupdate_claim_file() and liveupdate_unclaim_file() so
> > handlers whose .retrieve() callback restores state into an existing
> > user-supplied file descriptor can claim it in luo_preserved_files befor=
e
> > modifying the file.
> >
> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> > ---
> >  include/linux/liveupdate.h       | 60 +++++++++++++++++++
> >  include/uapi/linux/liveupdate.h  |  6 ++
> >  kernel/liveupdate/luo_file.c     | 99 +++++++++++++++++++++++++++++---
> >  kernel/liveupdate/luo_internal.h |  5 +-
> >  kernel/liveupdate/luo_session.c  |  6 +-
> >  5 files changed, 164 insertions(+), 12 deletions(-)
> >
> > diff --git a/include/linux/liveupdate.h b/include/linux/liveupdate.h
> > index 885ec0bbc4b8c..52d3f453ae011 100644
> > --- a/include/linux/liveupdate.h
> > +++ b/include/linux/liveupdate.h
> > @@ -22,6 +22,36 @@ struct liveupdate_flb;
> >  struct liveupdate_session;
> >  struct file;
> >
> > +/**
> > + * struct liveupdate_arg_spec - Specification of a file handler user a=
rgument.
> > + * @size:     Full size of the argument structure in the current kerne=
l.
> > + * @min_size: Minimum valid user-supplied size (offsetofend of the las=
t
> > + *            required field).
> > + */
> > +struct liveupdate_arg_spec {
> > +     size_t size;
> > +     size_t min_size;
> > +};
> > +
> > +/**
> > + * LIVEUPDATE_ARG - Validated specification of a file handler argument=
 struct.
> > + * @_struct:   The argument structure type.
> > + * @_min_last: The last required member in @_struct.
> > + *
> > + * All file handler argument structures passed via
> > + * &liveupdate_session_preserve_fd.arg or &liveupdate_session_retrieve=
_fd.arg
> > + * must begin with a 32-bit @size field so they can be extended compat=
ibly.
> > + * Use this macro to initialize &liveupdate_file_ops.parg and
> > + * &liveupdate_file_ops.rarg.
> > + */
> > +#define LIVEUPDATE_ARG(_struct, _min_last)                           \
> > +     {                                                               \
> > +             .size =3D sizeof(_struct) +                              =
 \
> > +                     BUILD_BUG_ON_ZERO(offsetof(_struct, size) !=3D 0)=
 + \
> > +                     BUILD_BUG_ON_ZERO(sizeof_field(_struct, size) !=
=3D sizeof(u32)), \
> > +             .min_size =3D offsetofend(_struct, _min_last),           =
 \
> > +     }
> > +
> >  /**
> >   * struct liveupdate_file_op_args - Arguments for file operation callb=
acks.
> >   * @handler:          The file handler being called.
> > @@ -39,6 +69,11 @@ struct file;
> >   *                    is not preserved. Set by the handler's .preserve=
()
> >   *                    callback, and must be freed in the handler's
> >   *                    .unpreserve() callback.
> > + * @arg:              Kernel copy of the user-provided argument for .p=
reserve()
> > + *                    and .retrieve(), or %NULL if none was provided. =
Allocated
> > + *                    to the handler's expected argument size with any=
 trailing
> > + *                    bytes beyond the user-supplied size zero-filled.=
 Valid
> > + *                    only for the duration of the callback.
> >   *
> >   * This structure bundles all parameters for the file operation callba=
cks.
> >   * The 'data' and 'file' fields are used for both input and output.
> > @@ -49,6 +84,7 @@ struct liveupdate_file_op_args {
> >       struct file *file;
> >       u64 serialized_data;
> >       void *private_data;
> > +     const void *arg;
> >  };
> >
> >  /**
> > @@ -67,6 +103,12 @@ struct liveupdate_file_op_args {
> >   *                resources in the session.
> >   * @finish:       Required. Final cleanup in the new kernel.
> >   * @get_id:       Optional. Returns a unique identifier for the file.
> > + * @parg:         Optional. Specification of the user argument structu=
re
> > + *                accepted by @preserve, initialized via LIVEUPDATE_AR=
G(). If
> > + *                unset, non-zero user arguments are rejected with -EO=
PNOTSUPP.
> > + * @rarg:         Optional. Specification of the user argument structu=
re
> > + *                accepted by @retrieve, initialized via LIVEUPDATE_AR=
G(). If
> > + *                unset, non-zero user arguments are rejected with -EO=
PNOTSUPP.
> >   * @owner:        Module reference
> >   *
> >   * All operations (except can_preserve) receive a pointer to a
> > @@ -83,6 +125,8 @@ struct liveupdate_file_ops {
> >       bool (*can_finish)(struct liveupdate_file_op_args *args);
> >       void (*finish)(struct liveupdate_file_op_args *args);
> >       unsigned long (*get_id)(struct file *file);
> > +     struct liveupdate_arg_spec parg;
> > +     struct liveupdate_arg_spec rarg;
> >       struct module *owner;
> >  };
> >
> > @@ -237,6 +281,11 @@ int liveupdate_reboot(void);
> >  int liveupdate_register_file_handler(struct liveupdate_file_handler *f=
h);
> >  void liveupdate_unregister_file_handler(struct liveupdate_file_handler=
 *fh);
> >
> > +int liveupdate_claim_file(struct liveupdate_file_handler *fh,
> > +                       struct file *file);
> > +void liveupdate_unclaim_file(struct liveupdate_file_handler *fh,
> > +                          struct file *file);
> > +
> >  int liveupdate_register_flb(struct liveupdate_file_handler *fh,
> >                           struct liveupdate_flb *flb);
> >  void liveupdate_unregister_flb(struct liveupdate_file_handler *fh,
> > @@ -269,6 +318,17 @@ static inline void liveupdate_unregister_file_hand=
ler(struct liveupdate_file_han
> >  {
> >  }
> >
> > +static inline int liveupdate_claim_file(struct liveupdate_file_handler=
 *fh,
> > +                                     struct file *file)
> > +{
> > +     return -EOPNOTSUPP;
> > +}
> > +
> > +static inline void liveupdate_unclaim_file(struct liveupdate_file_hand=
ler *fh,
> > +                                        struct file *file)
> > +{
> > +}
> > +
> >  static inline int liveupdate_register_flb(struct liveupdate_file_handl=
er *fh,
> >                                         struct liveupdate_flb *flb)
> >  {
> > diff --git a/include/uapi/linux/liveupdate.h b/include/uapi/linux/liveu=
pdate.h
> > index 1644c502521e0..57a3c129d5a9d 100644
> > --- a/include/uapi/linux/liveupdate.h
> > +++ b/include/uapi/linux/liveupdate.h
> > @@ -127,6 +127,8 @@ struct liveupdate_ioctl_retrieve_session {
> >   * @size:  Input; sizeof(struct liveupdate_session_preserve_fd)
> >   * @fd:    Input; The user-space file descriptor to be preserved.
> >   * @token: Input; An opaque, unique token for preserved resource.
> > + * @arg:   Input; User-space pointer to a file-handler-specific argume=
nt
> > + *         structure starting with a 32-bit size field, or 0 if unused=
.
> >   *
> >   * Holds parameters for preserving a file descriptor.
> >   *
> > @@ -150,6 +152,7 @@ struct liveupdate_session_preserve_fd {
> >       __u32           size;
> >       __s32           fd;
> >       __aligned_u64   token;
> > +     __aligned_u64   arg;
> >  };
> >
> >  #define LIVEUPDATE_SESSION_PRESERVE_FD                                =
       \
> > @@ -161,6 +164,8 @@ struct liveupdate_session_preserve_fd {
> >   * @fd:    Output; The new file descriptor representing the fully rest=
ored
> >   *         kernel resource.
> >   * @token: Input; An opaque, token that was used to preserve the resou=
rce.
> > + * @arg:   Input; User-space pointer to a file-handler-specific argume=
nt
> > + *         structure starting with a 32-bit size field, or 0 if unused=
.
> >   *
> >   * Retrieve a previously preserved file descriptor.
> >   *
> > @@ -180,6 +185,7 @@ struct liveupdate_session_retrieve_fd {
> >       __u32           size;
> >       __s32           fd;
> >       __aligned_u64   token;
> > +     __aligned_u64   arg;
> >  };
> >
> >  #define LIVEUPDATE_SESSION_RETRIEVE_FD                                =
       \
> > diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.=
c
> > index 3c1c86ff14d69..e3bfdbc6baedc 100644
> > --- a/kernel/liveupdate/luo_file.c
> > +++ b/kernel/liveupdate/luo_file.c
> > @@ -112,6 +112,7 @@
> >  #include <linux/xarray.h>
> >  #include <linux/slab.h>
> >  #include <linux/string.h>
> > +#include <linux/uaccess.h>
> >  #include "luo_internal.h"
> >
> >  static LIST_HEAD(luo_file_handler_list);
> > @@ -176,6 +177,36 @@ static unsigned long luo_get_id(struct liveupdate_=
file_handler *fh,
> >       return fh->ops->get_id ? fh->ops->get_id(file) : (unsigned long)f=
ile;
> >  }
> >
> > +/**
> > + * liveupdate_claim_file - Claim a file in the LUO preserved files tab=
le.
> > + * @fh:   The file handler claiming @file.
> > + * @file: The file to claim.
> > + *
> > + * File handlers whose .retrieve() callback restores state into an exi=
sting
> > + * user-supplied &struct file (rather than allocating a new one) shoul=
d call
> > + * this before modifying @file to ensure @file is not already managed =
by LUO.
> > + *
> > + * Return: 0 on success, -EBUSY if @file is already managed by LUO, or=
 a
> > + *         negative errno on allocation failure.
> > + */
> > +int liveupdate_claim_file(struct liveupdate_file_handler *fh,
> > +                       struct file *file)
> > +{
> > +     return xa_insert(&luo_preserved_files, luo_get_id(fh, file),
> > +                      file, GFP_KERNEL);
> > +}
> > +
> > +/**
> > + * liveupdate_unclaim_file - Release a claimed file from the LUO prese=
rved files table.
> > + * @fh:   The file handler that claimed @file.
> > + * @file: The file to release.
> > + */
> > +void liveupdate_unclaim_file(struct liveupdate_file_handler *fh,
> > +                          struct file *file)
> > +{
> > +     xa_erase(&luo_preserved_files, luo_get_id(fh, file));
> > +}
> > +
> >  static bool luo_token_is_used(struct luo_file_set *file_set, u64 token=
)
> >  {
> >       struct luo_file *iter;
> > @@ -188,11 +219,45 @@ static bool luo_token_is_used(struct luo_file_set=
 *file_set, u64 token)
> >       return false;
> >  }
> >
> > +static int luo_copy_user_arg(u64 user_arg, const void **argp,
> > +                          const struct liveupdate_arg_spec *spec)
> > +{
> > +     void *karg __free(kfree) =3D NULL;
> > +     void __user *uptr;
> > +     u32 user_size;
> > +     int err;
> > +
> > +     if (!user_arg)
> > +             return 0;
> > +     if (!spec->size)
> > +             return -EOPNOTSUPP;
> > +
> > +     uptr =3D u64_to_user_ptr(user_arg);
> > +     if (get_user(user_size, (u32 __user *)uptr))
> > +             return -EFAULT;
> > +     if (user_size < spec->min_size)
> > +             return -EINVAL;
> > +     if (user_size > PAGE_SIZE)
> > +             return -E2BIG;
> > +
> > +     karg =3D kmalloc(spec->size, GFP_KERNEL);
> > +     if (!karg)
> > +             return -ENOMEM;
> > +
> > +     err =3D copy_struct_from_user(karg, spec->size, uptr, user_size);
> > +     if (err)
> > +             return err;
> > +
> > +     *argp =3D no_free_ptr(karg);
> > +     return 0;
> > +}
> > +
> >  /**
> >   * luo_preserve_file - Initiate the preservation of a file descriptor.
> >   * @file_set: The file_set to which the preserved file will be added.
> >   * @token:    A unique, user-provided identifier for the file.
> >   * @fd:       The file descriptor to be preserved.
> > + * @arg:      User-space pointer to the handler argument structure, or=
 0.
> >   *
> >   * This function orchestrates the first phase of preserving a file. Up=
on entry,
> >   * it takes a reference to the 'struct file' via fget(), effectively m=
aking LUO
> > @@ -208,9 +273,11 @@ static bool luo_token_is_used(struct luo_file_set =
*file_set, u64 token)
> >   *    (allocates if needed).
> >   * 3. Iterates through registered handlers, calling can_preserve() to =
find one
> >   *    compatible with the given @fd.
> > - * 4. Calls the handler's .preserve() operation, which saves the file'=
s state
> > + * 4. Copies the user argument structure (if @arg is non-zero) accordi=
ng to the
> > + *    handler's parg specification.
> > + * 5. Calls the handler's .preserve() operation, which saves the file'=
s state
> >   *    and returns an opaque private data handle.
> > - * 5. Adds the new instance to the file_set's internal list.
> > + * 6. Adds the new instance to the file_set's internal list.
> >   *
> >   * On success, LUO takes a reference to the 'struct file' and consider=
s it
> >   * under its management until it is unpreserved or finished.
> > @@ -225,10 +292,12 @@ static bool luo_token_is_used(struct luo_file_set=
 *file_set, u64 token)
> >   *         -EBADF if the file descriptor is invalid.
> >   *         -ENOSPC if the file_set is full.
> >   *         -ENOENT if no compatible handler is found.
> > + *         -EOPNOTSUPP if @arg is non-zero and the handler does not ac=
cept an arg.
> >   *         -ENOMEM on memory allocation failure.
> >   *         Other erros might be returned by .preserve().
> >   */
> > -int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd=
)
> > +int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd=
,
> > +                   u64 arg)
> >  {
> >       struct liveupdate_file_op_args args =3D {0};
> >       struct liveupdate_file_handler *fh;
> > @@ -264,10 +333,14 @@ int luo_preserve_file(struct luo_file_set *file_s=
et, u64 token, int fd)
> >       if (err)
> >               goto err_fput;
> >
> > +     err =3D luo_copy_user_arg(arg, &args.arg, &fh->ops->parg);
> > +     if (err)
> > +             goto err_module_put;
> > +
> >       err =3D xa_insert(&luo_preserved_files, luo_get_id(fh, file),
> >                       file, GFP_KERNEL);
> >       if (err)
> > -             goto err_module_put;
> > +             goto err_free_arg;
> >
> >       err =3D luo_flb_file_preserve(fh);
> >       if (err)
> > @@ -290,6 +363,7 @@ int luo_preserve_file(struct luo_file_set *file_set=
, u64 token, int fd)
> >       if (err)
> >               goto err_kfree;
> >
> > +     kfree(args.arg);
> >       luo_file->serialized_data =3D args.serialized_data;
> >       luo_file->private_data =3D args.private_data;
> >       list_add_tail(&luo_file->list, &file_set->files_list);
> > @@ -303,6 +377,8 @@ int luo_preserve_file(struct luo_file_set *file_set=
, u64 token, int fd)
> >       luo_flb_file_unpreserve(fh);
> >  err_erase_xa:
> >       xa_erase(&luo_preserved_files, luo_get_id(fh, file));
> > +err_free_arg:
> > +     kfree(args.arg);
> >  err_module_put:
> >       module_put(fh->ops->owner);
> >  err_fput:
> > @@ -533,6 +609,7 @@ void luo_file_unfreeze(struct luo_file_set *file_se=
t,
> >   * luo_retrieve_file - Restores a preserved file from a file_set by it=
s token.
> >   * @file_set: The file_set from which to retrieve the file.
> >   * @token:    The unique token identifying the file to be restored.
> > + * @arg:      User-space pointer to the handler argument structure, or=
 0.
> >   * @filep:    Output parameter; on success, this is populated with a p=
ointer
> >   *            to the newly retrieved 'struct file'.
> >   *
> > @@ -552,9 +629,10 @@ void luo_file_unfreeze(struct luo_file_set *file_s=
et,
> >   *          kernel.
> >   * Return: 0 on success. Returns a negative errno on failure:
> >   *         -ENOENT if no file with the matching token is found.
> > + *         -EOPNOTSUPP if @arg is non-zero and the handler does not ac=
cept an arg.
> >   *         Any error code returned by the handler's .retrieve() op.
> >   */
> > -int luo_retrieve_file(struct luo_file_set *file_set, u64 token,
> > +int luo_retrieve_file(struct luo_file_set *file_set, u64 token, u64 ar=
g,
> >                     struct file **filep)
> >  {
> >       struct liveupdate_file_op_args args =3D {0};
> > @@ -591,9 +669,14 @@ int luo_retrieve_file(struct luo_file_set *file_se=
t, u64 token,
> >               return 0;
> >       }
> >
> > +     err =3D luo_copy_user_arg(arg, &args.arg, &luo_file->fh->ops->rar=
g);
> > +     if (err)
> > +             return err;
> > +
> >       args.handler =3D luo_file->fh;
> >       args.serialized_data =3D luo_file->serialized_data;
> >       err =3D luo_file->fh->ops->retrieve(&args);
> > +     kfree(args.arg);
> >       if (err) {
> >               /* Keep the error code for later use. */
> >               luo_file->retrieve_status =3D err;
> > @@ -604,9 +687,9 @@ int luo_retrieve_file(struct luo_file_set *file_set=
, u64 token,
> >       /* Get reference so we can keep this file in LUO until finish */
> >       get_file(luo_file->file);
> >
> > -     WARN_ON(xa_insert(&luo_preserved_files,
> > -                       luo_get_id(luo_file->fh, luo_file->file),
> > -                       luo_file->file, GFP_KERNEL));
> > +     if (xa_load(&luo_preserved_files,
> > +                 luo_get_id(luo_file->fh, luo_file->file)) !=3D luo_fi=
le->file)
> > +             WARN_ON(liveupdate_claim_file(luo_file->fh, luo_file->fil=
e));
> >
> >       *filep =3D luo_file->file;
> >       luo_file->retrieve_status =3D 1;
> > diff --git a/kernel/liveupdate/luo_internal.h b/kernel/liveupdate/luo_i=
nternal.h
> > index b42369c3b1f30..3bd9ef442934e 100644
> > --- a/kernel/liveupdate/luo_internal.h
> > +++ b/kernel/liveupdate/luo_internal.h
> > @@ -87,13 +87,14 @@ int __init luo_session_setup_incoming(u64 sessions_=
pa);
> >  int luo_session_serialize(void);
> >  int luo_session_deserialize(void);
> >
> > -int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd=
);
> > +int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd=
,
> > +                   u64 arg);
> >  void luo_file_unpreserve_files(struct luo_file_set *file_set);
> >  int luo_file_freeze(struct luo_file_set *file_set,
> >                   struct luo_file_set_ser *file_set_ser);
> >  void luo_file_unfreeze(struct luo_file_set *file_set,
> >                      struct luo_file_set_ser *file_set_ser);
> > -int luo_retrieve_file(struct luo_file_set *file_set, u64 token,
> > +int luo_retrieve_file(struct luo_file_set *file_set, u64 token, u64 ar=
g,
> >                     struct file **filep);
> >  int luo_file_finish(struct luo_file_set *file_set);
> >  int luo_file_deserialize(struct luo_file_set *file_set,
> > diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_se=
ssion.c
> > index 403906937bc0f..74f8a1bf1da8c 100644
> > --- a/kernel/liveupdate/luo_session.c
> > +++ b/kernel/liveupdate/luo_session.c
> > @@ -284,7 +284,8 @@ static int luo_session_preserve_fd(struct luo_sessi=
on *session,
> >       if (session->frozen)
> >               return -EBUSY;
> >
> > -     err =3D luo_preserve_file(&session->file_set, argp->token, argp->=
fd);
> > +     err =3D luo_preserve_file(&session->file_set, argp->token, argp->=
fd,
> > +                             argp->arg);
> >       if (err)
> >               return err;
> >
> > @@ -307,7 +308,8 @@ static int luo_session_retrieve_fd(struct luo_sessi=
on *session,
> >               return argp->fd;
> >
> >       mutex_lock(&session->mutex);
> > -     err =3D luo_retrieve_file(&session->file_set, argp->token, &file)=
;
> > +     err =3D luo_retrieve_file(&session->file_set, argp->token, argp->=
arg,
> > +                             &file);
> >       mutex_unlock(&session->mutex);
> >       if (err < 0)
> >               goto err_put_fd;
> > --
> > 2.56.0.385.gd3acb90ef8-goog
