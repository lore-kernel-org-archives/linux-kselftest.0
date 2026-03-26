Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41F830DEA2
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 15:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774537335; cv=pass; b=qI+Cs17CycHA052XshXEVat9bbfvv83+4s1z9y/Q2MWhf9205TsCzIXWxf7krp0DMTi7QQML7NqHpd88rXZ73bjGDPSwEqZFu/KjaXsGY5ROxsylZmBT/otI1hFhcfDJTQLpN5x9EZHM27Oo6LMxOT9sTitWaTHcogUGojcUWYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774537335; c=relaxed/simple;
	bh=fQBoj1TH90YinvX7tOqOMb4BmPMJ09nlNwkXs74qpl8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k/NxK8NdalaJ1/t0F7vvBG+pDQ+xpfrrd/zCoBqfWfSoHfJu9ug3Quv9u5J+NVUym0ZXJIHaGNI+Mr939URXlW2Oq7uinz3mR6B13ek1ApmaqTYvyShj/wRC/+BoHeWo2ynwzVAW3kZQIS/J0Jdz4EnsSzmi73IIt7gVq1sfY0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UK3s+lPl; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UK3s+lPl"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439bc14dcf4so1655320f8f.1
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 08:02:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774537332; cv=none;
        d=google.com; s=arc-20240605;
        b=gcyrMTM0iojT8TLDjs8qr1VqmqfHIxZ9r+Z/TE8bljPHtR/tB6Dcji6L8YJe9O7Ui9
         daN2WgEVywWHYGOK5fj7hjoWCUn7DkfcRWZuRYI9iZJtqPJYZdULwuwH2Pt5ZlFRV+hf
         bZSsQXs1wMxL/d5K9OSFPXyD9nzjwqdSTjyfHsqN64cKu2JaSXB1yx2zn9n03reZRC+v
         F+B+0yqiAX/mFnImccV0PlqXgQrNNLRa8z8mABpOpc7JaaDJw2vs7ORon3y1SOzrPVXO
         Ln2qLAIOMdF5Qmb1DoCtgIWki4SlQp5aN1oYIqsCV3wN1XriLI7Hp0cCu+9ts4cCxCKt
         3FsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u/Sf6wOkMweWv83xQm9DiuxVskt6+OUeojXwOwVW50E=;
        fh=9pD6RHv3hIbWQkziIUL+JptE9IGZunfd7uQQjfccfhw=;
        b=iJN8XsXm85tLDt7M1jP1GcOlARylzTcEyzDIzGFJ0JosT07nw5TPL06CZrgDwEOcZI
         kCetDJgH2p1OBPJb/GOQe+v9QBkHq5mBhi0mnfvTvM6jFuoZUzXUFteDmyOtmDhtNzBy
         BnHALbSWom8k0BtXeE/dVFlwb1G9KPmgcdpr5hZcex6KT9WXiarFSiRymahz/Qf7X0Fl
         D+xjvBXYUV7IeMNLWmwxuTaO6mtgrzD+FWpTB8awTqI5eTY2+2L18mh/VRPxyitJiYAV
         IqMSbGWrOxOY9J91z5DvGZFKItXJ44p/SIuGB2eGEVjqHleJbqT3LAZ24QpXyXgW3/dr
         f3Ew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774537332; x=1775142132; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u/Sf6wOkMweWv83xQm9DiuxVskt6+OUeojXwOwVW50E=;
        b=UK3s+lPlD9MYqLbq2XqOb1LxIBTr7cQc3F+6Gvs2+Q3tcGDYwgES+sAUQc3pohNKup
         NgxgItPP7kiMQQZCAVtjB1OTiLYbWvEj78uVJxEX7VFAJvjHjVg2I/2reW6reU1/0T4b
         0+UGSHLyiqGsDDyTbwItbuk7keXVbLJCE4PlW6gYWUKCo0Y4p2Q7qoBFGLkvX2MflY5T
         IcESzn6fAePJgfWulOELBEBfVPD2OG62+rNc8giuMNIqCS/N4+eLEf2XQWz8XPHjV+vn
         EvnhCjcUl2QeEbjdCDSAaaFRmClBkKiVP2tNR2ViQmRLhE5qkVqd7duYgudQQyEWYww/
         KxLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774537332; x=1775142132;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u/Sf6wOkMweWv83xQm9DiuxVskt6+OUeojXwOwVW50E=;
        b=VLRJzKYonfC1CFQWfVDBYMf7JBSDGvMoX6Dv3CnhT9yMjiBp85wOFwJcDF+e6HA0SM
         iv6kbq6J6TKKDh4wMKiVSjVVzZmiRb49QVh2MAqG2IeWiLkw0bYEMpEmf2QMAFUA8uhG
         jvw8RHJEEH77O11Er8Ya5ona6bjHG4fIw5dGEgR7YOnG0160Br+fH+xGtr12UavQ9PuU
         WiRRmzh/VqVqfkknpPkrqtt48uJWjSQ9qxTZ1Tv/DlkBH/CT1joLx6Zp5QNW0PoC0waA
         2mEFs3Ekc67k5L60vfNs0cr9xtp+AJhWxiXNDa3Esent6MzNjewNZd5AjRlIP57o1P8s
         v+yg==
X-Forwarded-Encrypted: i=1; AJvYcCW3iJ/S4WIPqK3FiMz7eOpmDB/ZXjsniG242+N93I5vReakuhCxi8hV9VUKwWfgm66A0esnfmjNxImcpm7CPfw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyI/+gFCGuHMnWuGG+iFbr6goAseI05NYPglsxlumZVLzZDY3FT
	JJWmSYtRp2HrSbKwhW6fd+NDHjuzj8sjklVpUvsE+Qgpj7gHc/c5pAB3BatrlIAQgG7qQVDaJc0
	diQKGrPBkg/5ToTcO/Wn8a4E2mVSlO48=
X-Gm-Gg: ATEYQzzeif5QWPWMWWHWldoe5uEvf/J+xJ/CMJudLaB4WkN0lYAvZpaGx0Tm2dCtwqI
	zDfz2LaUcB+/9q/nak14G40oMQIUogrRgNNunk4Bysga2sGphqcsGzECbbxjYQt1NIgxbFMhoUK
	cxLO9rwFV4WbeQJuQKWfxBw1NApH19fX9KRGMwYZQS3Rv89mIJq7FLhsI+6JsdJgzbCHBsKGHsb
	mASygNO/1yLMDp2T/BM5dUydrGjfmrW/EPEngTFsTSQ6oYTQlZWm2salPUS8xjdMWdI6EdiSCz6
	/DdIZ+Jw0dc+nml0jjWHmzarv+A34rqv9O5gcymDVhIveXTKd7z4UV0Yhuj4QTr5r9HN3JM45uK
	iGGi7q5TP
X-Received: by 2002:a05:6000:1848:b0:43b:9687:620a with SMTP id
 ffacd0b85a97d-43b979fc0fdmr3667446f8f.5.1774537331511; Thu, 26 Mar 2026
 08:02:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326112521.2827500-1-wusamuel@google.com> <m2v7eig4ue.fsf@kernel.org>
 <CAP01T74KNVT2SVRR+XPbFb1vy85W=Jkp4_yD6xvTSg2avQo8AQ@mail.gmail.com>
In-Reply-To: <CAP01T74KNVT2SVRR+XPbFb1vy85W=Jkp4_yD6xvTSg2avQo8AQ@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 26 Mar 2026 08:01:59 -0700
X-Gm-Features: AQROBzCGtnU5-dOrxHATP1abxYAIKp7uD_DNHv2-zLG2AdZOG74ShatkiLTI8Ko
Message-ID: <CAADnVQK252XxmxM3enS4wPREshTEawQKbChgN-teX3+wmxgdBQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Support BPF traversal of wakeup sources
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: Puranjay Mohan <puranjay@kernel.org>, Samuel Wu <wusamuel@google.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Android Kernel Team <kernel-team@android.com>, LKML <linux-kernel@vger.kernel.org>, 
	Linux Power Management <linux-pm@vger.kernel.org>, driver-core@lists.linux.dev, 
	bpf <bpf@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 7:54=E2=80=AFAM Kumar Kartikeya Dwivedi
<memxor@gmail.com> wrote:
>
> On Thu, 26 Mar 2026 at 13:20, Puranjay Mohan <puranjay@kernel.org> wrote:
> >
> > Samuel Wu <wusamuel@google.com> writes:
> >
> > > This patchset adds requisite kfuncs for BPF programs to safely traver=
se
> > > wakeup_sources, and puts a config flag around the sysfs interface.
> > >
> > > Currently, a traversal of wakeup sources require going through
> > > /sys/class/wakeup/* or /d/wakeup_sources/*. The repeated syscalls to =
query
> > > sysfs is inefficient, as there can be hundreds of wakeup_sources, wit=
h each
> > > wakeup source also having multiple attributes. debugfs is unstable an=
d
> > > insecure.
> > >
> > > Adding kfuncs to lock/unlock wakeup sources allows BPF program to saf=
ely
> > > traverse the wakeup sources list. The head address of wakeup_sources =
can
> > > safely be resolved through BPF helper functions or variable attribute=
s.
> > >
> > > On a quiescent Pixel 6 traversing 150 wakeup_sources, I am seeing ~34=
x
> > > speedup (sampled 75 times in table below). For a device under load, t=
he
> > > speedup is greater.
> > > +-------+----+----------+----------+
> > > |       | n  | AVG (ms) | STD (ms) |
> > > +-------+----+----------+----------+
> > > | sysfs | 75 | 44.9     | 12.6     |
> > > +-------+----+----------+----------+
> > > | BPF   | 75 | 1.3      | 0.7      |
> > > +-------+----+----------+----------+
> > >
> > > The initial attempts for BPF traversal of wakeup_sources was with BPF
> > > iterators [1]. However, BPF already allows for traversing of a simple=
 list
> > > with bpf_for(), and this current patchset has the added benefit of be=
ing
> > > ~2-3x more performant than BPF iterators.
> >
> > I left some inline comments on patch 1, but the high level concern is
> > that encoding the SRCU index into a fake pointer to get KF_ACQUIRE/
> > KF_RELEASE tracking is working against the verifier rather than with it=
.
> > Nothing actually prevents a BPF program from walking the list without
> > the lock, and the whole pointer encoding trick goes away if this is don=
e
> > as an open-coded iterator instead.
>
> Which is fine, the critical section is only doing CO-RE accesses, and
> the SRCU lock is just to be able to read things in a valid state while
> walking the list. It is all best-effort.
> Open coded iterators was already explored as an option in earlier
> iterations of the series and discarded as no-go.

kinda best-effort...
the way it's written bpf_wakeup_sources_get_head() returns
trusted list_head. It's then core-read-ed anyway.
Ideally it should be trusted only within that srcu CS
and invalidated by the verifier similar to KF_RCU_PROTECTED,
but that's bigger task.
Instead let's make bpf_wakeup_sources_get_head() return 'void *',
so it's clearly untrusted.
