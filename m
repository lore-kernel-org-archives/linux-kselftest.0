Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1162A361DB6
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Mar 2026 20:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773867326; cv=pass; b=D/D09Ic5footY6sYf+uS7METjdFJiNPrmwaPsQxBgVjmEnp3iFFJyqomUjnD8cW3Ug+xO4MFVjol1fhxeYbI7hdoj34lY6RMk20nQ/HP2XY/4ebxENS97Dbn5QW7NFlCWPwpo2Sc+8tGBR55Qzw6X+j7NcRVNt9b1kh7fnCW6yU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773867326; c=relaxed/simple;
	bh=0J3SkYkL8InsjHVxmNLBnTxY8cGVPE4s4gsacj7fW+Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EQBbTO8JDqudi+8EJX84lE77AxO0tnAPfxl6lsEFP4Fiz4lToEODWdrW7jZHECXqioyN6ATL43OSBwI8QfZ0TnPlbb4wZ5237+wGy9h1p6zU7vgQp382d2YlugifwUopti+QTrK+GHj4RZ1k93r41mD65Csj8gpuoKtf6Q2Yl7A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j8LJKVM7; arc=pass smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j8LJKVM7"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4852e9ca034so2050815e9.2
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Mar 2026 13:55:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773867323; cv=none;
        d=google.com; s=arc-20240605;
        b=kK2pFQP7vu10Sncy9cG6ougWdmnTFWjSLhT6bbBl7/8zQRQsDfJindqI2ygrklDElr
         celmgjq7QEVCR2oq+nFyPI50GFg86y8Oz5WL00vZ5nIUOyohgaxLt+hHz2jMKg1aI28m
         309/U11rJBZIEieJM0uH+BB3aQz9YbRvpCaH3l8GBUs1mllsnBhNswADODx6Wd9JWDZ/
         VLEuzQC0hCdVNyB+X3pt0mp6vtjo99ogORIJBkNuIAkEMjzin9+HJjqZdOAL/AeMVXUi
         n30CqYd8bNwyiXUDI2bicFuUEawvrDfL+OpWsa5OhTD26v//WNIjtNX3Qu/DIODa/09T
         jESA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0J3SkYkL8InsjHVxmNLBnTxY8cGVPE4s4gsacj7fW+Y=;
        fh=DRQhHhpSh8goO6tZAnT4i8HLDtvU2fdxWume9hGJJ4o=;
        b=MvbMrvxX9Qjw0ScxYE5AxQ8GCCHEtzNX268mEE5MrTJXW9Tvskd1zURwU77BXJKv60
         YLHy9M5QIWmwkPArCnuXLwNoo7cJwYHEaSFWToDaXdpiG1wu7dKy7aOLxgORqj6zGkQA
         TmrbKHjiVUh/LE1SKKefGIGDrHZ+L+QloQM4MPHDRAuGWMYpphQgGlZzyHzhuEIZXy+O
         hURwpRPeuQzanpkPboBubbmUrSdVmPlBh38qcazcwzPEJrc8VeTn7oayQQqduQ1fZpIk
         olgX1+Tc6ZosFlHAh2Hi2pGuNTcCC8kZ910xpfQXtX5ID6JsyYwAX8D+QAofa2n+/vue
         BpMg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773867323; x=1774472123; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0J3SkYkL8InsjHVxmNLBnTxY8cGVPE4s4gsacj7fW+Y=;
        b=j8LJKVM7f+xyj0bLAmUHN3o6UGd5S76QQBs1GbDzIh3gzq7u3wNKaijkLom30QqaRa
         t8bzygh40P/SS2d3EYc63SL3W7yYcLbgEHTRFNPcnQ7/KcKonBguxs8ru8Yy2QAfk4Le
         GwNbvNbOMrk+qbkIKadQMr9dQIIAAF/vhqQQOZ+SHQztR1Ubl9VnKWbiUKNVQqxnwUkR
         bSblbLaZ24hT0toaeSW9sWgStYF7mjaI2u9+933c/fdnSQGjBHI7Uw2wK/Vk73L3HL40
         Dv2QT25gY18aDrNu26ZyHOBp/aoc8wf9CT7bdRJxIq416XysNt07Gk4r60GO9jViz0Sl
         hyTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773867323; x=1774472123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0J3SkYkL8InsjHVxmNLBnTxY8cGVPE4s4gsacj7fW+Y=;
        b=Et59+xMe+/xtirnl4ge016I8CKeCcbPnUBA2QlaECR6SfCG721SMFjCFCdBx+A22DF
         XdIZaz3oSWuNwwO4hY64TU53JsGhNlYlIJxIkKlx+q1nvPrqdpEJANy0ESoQOiz2o2Q6
         0nrhr+kDw7sIq90MbD/GCjjN+6OdHsla9p//8TxTM96zcBUgQoWyZ8Apv29QxAqdHyMh
         yGVSmXxkRBkjKr6i+ngEV40HHOh1N+kbVLssdnNz98HbivNpr1rQL88i2pn+aeMzaZfm
         ukgFlOhDNo2WOOMf6M4D89gxQRKPbxUQaMDA76eDpBQuyoJnmeYq7pQA6V+IcyZQYR8p
         QEXg==
X-Forwarded-Encrypted: i=1; AJvYcCUVlJGeTdjYEnM0DI9SOTXHNi8WHhW4iI6krrJeQ16XxhSmT2qiCdUIc7BMdurJbK3TwZldwwor2PKJ23Kpr7k=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywuxb+R6YDHQGblQ1QxuPfwTis0QNWvOzB/aKBuQRka5oqh980B
	Ozr8+qNA4x/25cr00lQ7R3thI21hoVhgg6VNfkfUfTvL9nhq2DLXNqTa79/C/ussuHe4w0j3GUe
	XhSo0CYJNG56gvf6c0ktlpNBjCoMAfy0=
X-Gm-Gg: ATEYQzwQnqE8RiPw2uSpRVslIGhyJg8mC/avMHR4t/FHgW/mWXzDW9dRw4MKwTwju4c
	Mf7GH9UoNrV5eIoyoSb3qnm7JcrrXAM2giiI5ndwY8IYRBtJDjXzv/cszUw38o1LNpijbfxrkce
	Osww3lWAMhzcThluRqz5A0HXrszAFRixPRwngHdY0dcbRExO+95MnAPeniIP3wzrVa1vDda1M/u
	HXLw6FMe9yD65JM/chwBqv0IPSpS5uVTteMTgyhV9d50ZOg156VmKSueoULStpYfDD4i8H6qBth
	L5uvJBuhxjBramiEvs0CQ9mDCnKhKQpGD9YPyUxjmuIKHhwzadF4DmVHleodBOB73jeo3Zciz4y
	ojnEn7IWRQ6k1N4OORHXIIYxoscqC/dIEj+sa
X-Received: by 2002:a05:6000:2204:b0:439:b62d:be86 with SMTP id
 ffacd0b85a97d-43b527d2d87mr8541610f8f.47.1773867323192; Wed, 18 Mar 2026
 13:55:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311-bpf-auditd-send-message-v1-0-10a62db5c92f@cloudflare.com>
 <CAP01T77VyW=5SHDvM3HXPNHaxRdzs8H__MOh2zx1dQ6STeAUtg@mail.gmail.com>
 <CAADnVQJCJaLjGCwjCX9VtT615c4kn7v5bxviUmGFVj=uTtUHMg@mail.gmail.com> <abrlvEjQKUdAOcw5@CMGLRV3>
In-Reply-To: <abrlvEjQKUdAOcw5@CMGLRV3>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 18 Mar 2026 13:55:12 -0700
X-Gm-Features: AaiRm51tc55ib07MZtLJnTRuXxmrfDK1FJuMhF5fp5fXwEvfz5MooV7eUnvCNQI
Message-ID: <CAADnVQ+hNWY2Xd85xHySLN1gJD2paxPne3fAzeXx=De9tA5JNQ@mail.gmail.com>
Subject: Re: [PATCH RFC bpf-next 0/4] audit: Expose audit subsystem to BPF LSM
 programs via BPF kfuncs
To: Frederick Lawler <fred@cloudflare.com>
Cc: Kumar Kartikeya Dwivedi <memxor@gmail.com>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Eric Paris <eparis@redhat.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	LKML <linux-kernel@vger.kernel.org>, 
	LSM List <linux-security-module@vger.kernel.org>, audit@vger.kernel.org, 
	bpf <bpf@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, kernel-team <kernel-team@cloudflare.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 18, 2026 at 10:49=E2=80=AFAM Frederick Lawler <fred@cloudflare.=
com> wrote:
>
> Hi Alexei,
>
> On Tue, Mar 17, 2026 at 06:15:59PM -0700, Alexei Starovoitov wrote:
> > On Mon, Mar 16, 2026 at 7:44=E2=80=AFPM Kumar Kartikeya Dwivedi
> > <memxor@gmail.com> wrote:
> > >
> > > On Wed, 11 Mar 2026 at 22:31, Frederick Lawler <fred@cloudflare.com> =
wrote:
> > > >
> > > > The motivation behind the change is to give BPF LSM developers the
> > > > ability to report accesses via the audit subsystem much like how LS=
Ms
> > > > operate today.
> >
> > Sure, but bpf lsm-s don't need to follow such conventions.
> > audit is nothing but a message passing from kernel to user space
> > and done in a very inefficient way by wrapping strings into skb/netlink=
.
> > bpf progs can do this message passing already via various ways:
> > perfbuf, ringbuf, streams.
> > Teach your user space to consume one of them.
>
> Audit provides additional functionality by keeping messages close to the
> syscall, and in-line with other messages for that syscall. Aside from
> that, BPF is arguably too flexible. I'm sure it's already understood,
> but the idea here is to reduce bespoke logging implementations and reduce
> attack surface for violation reporting. Audit is already provided by the
> kernel and a well leveraged pipeline.

Sorry, I don't buy any of these arguments.
Nack.
