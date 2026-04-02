Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6C23542D1
	for <linux-kselftest@vger.kernel.org>; Thu,  2 Apr 2026 19:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775158647; cv=pass; b=RTMvoQuOKhc9u6Ez/9c8qMnZDqB4RYW09kPdSY2SsaUpHj42VH5PVxxmKXzbprM9bWhESq2lwd96kWKbOxw8o5qyy++qOf8FXVnDXuhpkJUGk7u8ua7w4T5xD5rbvhfDtedt2QJEvso5Srm4aFi76R89+a+KeLrBmnCx3XherJo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775158647; c=relaxed/simple;
	bh=doMwYSTuXe/JETZRl1N7Raoz/ERAK0foPnDNZyFizSk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tXF0CLscuJxHHdKHaeC2WuPdSfLTFJTfDCeMu/o8Nr7XiWQr2PjyGbmJb5HFjgpac8kuZmswG4WJfsaeypwejAMoaKu4VPNDNp9bFLvQ4ZLF8A5tVCpVEn33VHz/4bXyNyF/COWF43aXRq2WMjKO0Zn3yGWKeW5VgDv2xysPD2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JODTMHvv; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JODTMHvv"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b9825ba7e8dso170037166b.3
        for <linux-kselftest@vger.kernel.org>; Thu, 02 Apr 2026 12:37:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775158644; cv=none;
        d=google.com; s=arc-20240605;
        b=jISod59KBRY8mrnzR1psnvfcQZwwGdFOIuXkKYPqPbH2SueqwssW7CWvRwLBKm5Vsu
         Cik7oJMLknHGKpSbB7H4Gk/G4R9rGmS5enCuO4mt026iUsfKq0/fX3OVDgwzAYst5qPA
         IOjeS6px+s6+MlpHksR+phFoBmXMlIAxh7V5fMwN6ytwyz3HLfYdjEWC8dDnAasVLYHl
         23lwXpwPFrTYLlJxD4wztcQki51hfWzTm77yNeuTDxxABMVe+ZSP9FXmc8wa/iefyyfJ
         qGHnQfcs8SqY5QZkLEyJGY/99x7cG6BE+8vjktHBTn7cDMHwhlycNRIrgk8izWn7acSO
         z01A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VvxBK4KP6iOeP3Xbm2ZCHQUuUvym2Uan3OJJLKtWlWc=;
        fh=+e8ULhdCglFG4Ci1hR3dYkOanEr0XHNQCaHSOBCFe/E=;
        b=U0YAiyAt0DSam3SKDTg75h42w9lvRp3BMvUYKileDSzcsuNOC8PaVPXsE1oE8H/3/R
         vHfwdIAzA4y4WWBWpXQdr8k9AKiXS0d4/PKfy99llVGnqVjxTRJagpMCsv1CD7amq206
         94gFEtTJbFOdnO5HWXP5qb6tOlcnAMz+FP4NFjvZK42nEbZs75ISFwokWHs2Kh9IZ0Az
         reB0rBp8as5zKwXr8LNE7w5YpSykm3s1rjC9VHkAEpVOcFJW5Sht6eUIIsTFVSgBhPMy
         VJAcT3jpaz2PSegh6HVVsqU7jJmPEve0B5Hq7shXO2EdUyU+k/BXubmKN8+aJIprWprX
         m98g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775158644; x=1775763444; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VvxBK4KP6iOeP3Xbm2ZCHQUuUvym2Uan3OJJLKtWlWc=;
        b=JODTMHvvyZqxvt1TS85u6XFqiirfBpBno+oIjSasOSVMES9Ugs6IIdMyDMzgvaY0rU
         qHlFkrSgW4attLx/GnfXy1VtKquehTbbtUPwnot0S9Le2Hy3Cou1OCysyB6/8vqnYuTB
         SLs74p1eieESlFXQ3d7mQQ3JAI3CYWXwFmxyBqiRb6AwSLYWDkkDMSHWfEPSfxjF/7KH
         CBsYDXyYhqug6UdzOqYVdbVN+cXfZV8jYCR4d9p15s3trB5hhytMS7L9VGnbs5K6cn2H
         JQdlyO8Kodqo5shWMien+4CWf3WqPGdDzEsy/tcIW1y4/YVWVT9Oa9Lau0AF8fuFpeqU
         2Qfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775158644; x=1775763444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VvxBK4KP6iOeP3Xbm2ZCHQUuUvym2Uan3OJJLKtWlWc=;
        b=qjrUxhJDzCDPeFqquv1jJGdm8qiOmtgbnu1zNkuHIqp3t0rVMKaNlA6x/UrhwG0jcO
         3jOQjadvcN8RyYFeKIJIp+mypEDsFqRSaa2eCuJk5War+96OQP1MMWhoEiPRyunM7Ohs
         DblSYcdPFo8vW1xQfjZH8T8lKEW21NvuMARlZNRyuwRQVgmqk6t8P8TblTfJ4FbaRu0j
         Lzc3qXezzYeDjwUams8+QnkPs0mXoX0XX4xHT/lukGz3DOTdBbqCXHSnufK9jBAXTc9d
         t86LU9BP2xSD8x9gDpA0j2H71QnW5J15RLnqlsHMWou7E9gkgXQeBsDebge7HWVrmd3E
         I3MA==
X-Forwarded-Encrypted: i=1; AJvYcCViFTbvtuR5Objs+e0VYeXGup84Al+Mww2RmCzLF611SdaGCT/qZFjx4V7H7jzsU2awhxv9AL2lSb4GAbYAuTE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2xvJTQngh1/Hj4w9cHzrnEApZW/7zw1BOmSQOq14cU1DliyVw
	qblLtP/wyBjp4fBRVIhK6yJW2EOAW8YK/ihC7X+5/YfM1qUe8KivnBePYSPQDQ9C6218rB9z/8k
	L6Mf4AR/vcedoIbghUR8Y6vbNP9jc+Rx2EJcIXoeu
X-Gm-Gg: ATEYQzxqT2pz4ByTpSr/VgxgVR8iUGKGg8EtEvZNwe5QXKP/hUbNR8KfklTMVpx5CZH
	Wi36IrAaFhFCxsuFTzlaMhkn55TXoMAnh/7gOyeBAjoA+Zv5LRr2fW/bNyUDuJcpEgXODKBwtiG
	/CabHSq9MkWVIxcqh/oUBT7CjBy2N4mAFjUs61g4dDMN5rNdXxk0/Vw8x0J1lpXqokNdmxBKzAf
	vktHS/a6bQxHu/nLYLhDaOaRb7/K0gF3URaVb6z7C04T5PZhegE/oaE6tkpvktP0w0ZTGY9yvO0
	375uTz0Ot5zUiSbteIHyzcvf/htI18iujP5Af6LU0a9nQJam
X-Received: by 2002:a17:906:9fc5:b0:b94:cfd:f37b with SMTP id
 a640c23a62f3a-b9c67b99e79mr7310666b.45.1775158643949; Thu, 02 Apr 2026
 12:37:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331153413.2469218-1-wusamuel@google.com> <2026040136-ocelot-simply-8981@gregkh>
 <CAG2KctokEVVuhrs6tYuMjFF4ALR=tX80iZHrt4bhVvEKyoHzRQ@mail.gmail.com> <2026040236-kiln-carat-bb6d@gregkh>
In-Reply-To: <2026040236-kiln-carat-bb6d@gregkh>
From: Samuel Wu <wusamuel@google.com>
Date: Thu, 2 Apr 2026 12:37:12 -0700
X-Gm-Features: AQROBzBlWCEOhUiKVBdAOMQhIYruKxtYmNT9c2ETd_EsKRwXfwQK638DgBnNr5M
Message-ID: <CAG2Kctpr7vBm_=Xz4H5FHYAfFxg=bDt35j6B4EprfUGio=Ftew@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Support BPF traversal of wakeup sources
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, driver-core@lists.linux.dev, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 1, 2026 at 9:06=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Apr 01, 2026 at 12:07:12PM -0700, Samuel Wu wrote:
> > On Wed, Apr 1, 2026 at 2:15=E2=80=AFAM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Tue, Mar 31, 2026 at 08:34:09AM -0700, Samuel Wu wrote:
> > > > This patchset adds requisite kfuncs for BPF programs to safely trav=
erse
> > > > wakeup_sources, and puts a config flag around the sysfs interface.
> > > >
> > > > Currently, a traversal of wakeup sources require going through
> > > > /sys/class/wakeup/* or /d/wakeup_sources/*. The repeated syscalls t=
o query
> > > > sysfs is inefficient, as there can be hundreds of wakeup_sources, w=
ith each
> > > > wakeup source also having multiple attributes. debugfs is unstable =
and
> > > > insecure.
> > >
> > > Describe "inefficient" please?
> >
> > Ack; I=E2=80=99ll provide a more detailed breakdown in the v4 cover let=
ter. To
> > summarize: the "inefficiency" isn't just the number of sources (150),
> > but the fact that each source has 10 attributes. We are looking at
> > 1,500+ sysfs nodes to get a full snapshot of the system.
>
> Wait, no, something is wrong here.  You should NEVER be wanting to
> combine multiple sysfs files at the same time into a "snapshot" of the
> system because by virtue of how this works, it's going to change while
> you are actually traversing all of those files!

Agree, the current approach with sysfs might have stale values. The
BPF approach holds a lock while traversing the list. It's not a
perfect snapshot, but it's internally consistent and arguably better
than the current sysfs implementation.

> Why are you trying to read 1500+ sysfs files at once, and what are you
> doing with that information?  And if you really need it "all at once",
> why can't we provide it for you in a sane manner, instead of being
> forced to either walk the whole sysfs tree, or rely on a bpf script?

The data is fundamental for debugging and improving power at scale.
The original discussion and patch [1] provide more context of the
intent. To summarize the history, debugfs was unstable and insecure,
leading to the current sysfs implementation. However, sysfs has the
constraint of one attribute per node, requiring 10 sysfs accesses per
wakeup source.

That said, I completely agree that reading 1500+ sysfs files at once
is unreasonable. Perhaps the sysfs approach was manageable at the time
of [1], but moving forward we need a more scalable solution. This is
the main motivator and makes BPF the sane approach, as it improves
traversal in nearly every aspect (e.g. cycles, memory, simplicity,
scalability).

[1]: https://lore.kernel.org/all/20190715214348.81865-1-trong@android.com/

Thanks!
Sam
