Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01FFE299944
	for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 00:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778633487; cv=pass; b=P7avxgkz6g1CBMbVCsctGpRDgtreBObZ323ZJahQ/j4uSMlycOJq20JQ7OXeBeu+JlgEDNY1BwiwmAS9SjCv1QbAJDb8G8NYA2ENhmAH7LIai4jNuYsjgEMJ6zs5hTEdK0cmbtHgLwN9Cbi1QlvN79sSkVZQCYH+Leg8SgeBMUs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778633487; c=relaxed/simple;
	bh=izyNufNv3l0EJK2+rtZ1T7rBl3b1uNLGp9DIpmbczBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tc9TNPcp6Zt464WQHSWc9cqIfc6IMI9GMoNtqQnvTmvVb5Yd0C/ItFYiEA6H3C8MdzteLjUkHRH5XPL+LFUIaQgHPPF5TZjHEzaEmgKZP8suvvatg6VS6IngpCz4hmMUB8JDGuMkNmwjDbR76D8oHAt7SH1jMz2DElRMzzVsLRA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pC71eVXu; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pC71eVXu"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43d7e23defbso3639054f8f.0
        for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 17:51:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778633484; cv=none;
        d=google.com; s=arc-20240605;
        b=kO07X259+dRq1Pw3clEWM/LmLNeJecmwO54VtFCx1L3DJlH5JAeEAZPe/Zwc2rwAfT
         cdUeotKoPuRnPE4KEPz7Md7aQi9Zt1kfPrq1r0f4TAowbErceQr6eEft8EMM/qSsxIBM
         /8J8pJ90LJBk/gkWXJoWGCnWglW69OitzHO6kfQiXZeOPgPULbGUUZ0IYNubuafPWrG4
         iKfKOfwEeAyJIBQ7aqmlKwNyt7bPqIqXMBschsJ0wvUABIYYDtmTK6I59FklnXDqJUyP
         1hVrBgwCRv2cQz9p4O0iVr9MqAJa4x3pt90RB4pvN2L7T4RF5NNL4HqxUb0vAfswGWMH
         KKSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A0yqDbK591ypC5eJWQGsP1nPlMWdMRq98a5gApsWXZY=;
        fh=bF/KMSsIEa7wJ4fMXF/gLxU+er8CHzRIijGQFOhnuQo=;
        b=hyxEjONUm9Q/24DP9DDYKp9Msy1/CN8py7rbV9aw06WwjAJyeFyn9X7sMuep2vru0Q
         UYSyl1tvyeKNbN6OWHYAl8sfVWnyXS5FXTL8GE2Y2KM2OejbpDoPlWdCTfws8AmTdRwn
         bMtcJWW4reTNZ0aqXoqxhPUHflNncTSo/Q4T9Fs9eK11NVLGe/rYAPFeXTC3T/xODxJf
         HuSMP0AcOFrg3u4kMAV0eau7BrGRwHjsjWDGRq/JSu/o+A7RVST+tev/bXOvT9jZ68mm
         A/C0Wfy00tCVw8sDutlp8TOo2ZDsHz0GTpCV9VAuAmDsHXKYQpjN5OvZTiS0xdZbT91P
         8+jA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778633484; x=1779238284; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A0yqDbK591ypC5eJWQGsP1nPlMWdMRq98a5gApsWXZY=;
        b=pC71eVXurgf8caoIXfmSy14jVsV6DMbcG3ZpiY3KbFvMTBWgSBb0V0Ev8LJ3eUx85z
         wb3FpsxuYOjXuky3A/MVX3+s3HnipsymhSvhNtKXddtSWPKT45kmbxrQPOClpE08eS9k
         Fs8Z4a2y6C1CRwMedrrVbj8bCjJr5XGagYLgyh0KacbQPlKzMJ6Ewzn/wq7B1SpbUls/
         5GrpGwLl9OASDSpYmyTqMAQ1RtM/ZlIcjGAmZHluO5cWODf3PtmlYCa6sNOxO9ZFTDqS
         tOWjy2Bpdx+dFcsUZ5V7D+M5pJYH+tV20PYEJSPs97Met6N06ELVEl2HOhVPzlpdzrXI
         y4kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778633484; x=1779238284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A0yqDbK591ypC5eJWQGsP1nPlMWdMRq98a5gApsWXZY=;
        b=j5TUZtrcA+jQX7bv9XLTO9yl5wTSQZmTcIkEVeS4IcxiZJrZwf+S0dpFFhyEbxMeLU
         2Uk0Nkaj0vmEXU0nUGxJDQRKHhNBm5qzFrTQr46VRPHM7YEKJmLsvt6IkaEbM1lU/a9Z
         7rq9vPNrpyVJZspM7jy1ZOLn0S6RevNEir23A6UlvCOyXR5UxvtHCRN9NH7pf2nTA9ie
         oX1miPgtb0vVloTtO7+5QrMF6+eqPVLE3mwmawWZ6ZtMZTQZtRG7bqlX/KX+PD0vT7tH
         NdgMMOabM1mfMaDhXGID6tgwXiuPzWqgbQ/ArGTw9oKB8RyhAeiBgoS2+dBwnBXKzMdB
         O8VQ==
X-Forwarded-Encrypted: i=1; AFNElJ+4WctBoawQ7n8X8XUMv17uzPernc2m9QdzdgFDbdlslb8wDfxsNxSrCCO4opbAaC8jII/naUxzuA7KpeKdhXs=@vger.kernel.org
X-Gm-Message-State: AOJu0YziWq8wq1Io5zNFAqVnRGhDramSb+hPfnhU4yl/Jd5bItQrSn5W
	217ag7uBWpC9PG0wrnq1A69djkQ68CxoFmHZbPdk82CX01xt9U5iyGPWJ8EssOHqNjlH1sHSNkD
	Li21akEJD7TED44u0kq7EWH1ZVooWLSI=
X-Gm-Gg: Acq92OEIlyTL5KwQV6FcijXnbdZJYd3wg77KUU6ui9t0aa1grc56zGzkqKu0X6P4cYx
	LSvuSJ1Cgw3FaBMmz4ARjzF1wBXrwFVmCRcTow+J0hJaHZ+DeL3eQ780nwKgBTlDSRuFATA52jx
	QNydK81mMijPsCaer/1Ckjpt0aojLa0I98xEHkI394dm4jRxF8gt4y+V7GCLVObmYodKEQ4AJND
	9YOm28NPMeku6xjU4L7hxL5SpKbf418eQBr42/tVKG6751/KxLCfgawYKBIE4aYuoVMtLXfGH6d
	ysVuoooQS812EDeSMYzz5amiAY+Ct03NB2ImpF0IgH9/InlwFUrV87kBHX5QlX1xgnzV8NIvrOT
	6YgkK5FHYXlqCfPmdRq0zNeX2kA==
X-Received: by 2002:a05:6000:3109:b0:43d:6f0f:32fe with SMTP id
 ffacd0b85a97d-45c59702e8fmr1423029f8f.31.1778633484225; Tue, 12 May 2026
 17:51:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511174559.659782-1-wusamuel@google.com> <CAP01T74KQ6bie5o++i_gHM19J+s2RzDyM6=w87=oUZgPagPejw@mail.gmail.com>
In-Reply-To: <CAP01T74KQ6bie5o++i_gHM19J+s2RzDyM6=w87=oUZgPagPejw@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 12 May 2026 17:51:12 -0700
X-Gm-Features: AVHnY4K10O6Mxpl9QjZAt4PGuFBG9tJtHHyQLjkej2TGD7aWVby8-50dFABh7DA
Message-ID: <CAADnVQJtuKQh-bpDDeqWCQRM1zb2sSgo0qET_+1+JFOL-6cpDg@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Support BPF traversal of wakeup sources
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: Samuel Wu <wusamuel@google.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Danilo Krummrich <dakr@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Android Kernel Team <kernel-team@android.com>, 
	LKML <linux-kernel@vger.kernel.org>, 
	Linux Power Management <linux-pm@vger.kernel.org>, driver-core@lists.linux.dev, 
	bpf <bpf@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 1:44=E2=80=AFPM Kumar Kartikeya Dwivedi
<memxor@gmail.com> wrote:
>
> On Mon, 11 May 2026 at 19:50, Samuel Wu <wusamuel@google.com> wrote:
> >
> > This patchset adds requisite kfuncs for BPF programs to safely traverse
> > wakeup_sources, and puts a config flag around the sysfs interface.
> >
> > Currently, a traversal of wakeup sources require going through
> > /sys/class/wakeup/* or /d/wakeup_sources/*. The repeated syscalls to qu=
ery
> > sysfs is inefficient, as there can be hundreds of wakeup_sources, with =
each
> > wakeup source also having multiple attributes. debugfs is unstable and
> > insecure.
> >
> > Adding kfuncs to lock/unlock wakeup sources allows BPF program to safel=
y
> > traverse the wakeup sources list, and a kfunc to get head of wakeup
> > sources list is needed to start traversing the list.
> >
> > On a quiescent Pixel 6 traversing 150 wakeup_sources, I am seeing ~34x
> > speedup (sampled 75 times in table below). For a device under load, the
> > speedup is greater.
> > +-------+----+----------+----------+
> > |       | n  | AVG (ms) | STD (ms) |
> > +-------+----+----------+----------+
> > | sysfs | 75 | 44.9     | 12.6     |
> > +-------+----+----------+----------+
> > | BPF   | 75 | 1.3      | 0.7      |
> > +-------+----+----------+----------+
> >
> > The initial attempts for BPF traversal of wakeup_sources was with BPF
> > iterators [1]. However, BPF already allows for traversing of a simple l=
ist
> > with bpf_for(), and this current patchset has the added benefit of bein=
g
> > ~2-3x more performant than BPF iterators.
>
> This looks good to me, you can add for the set:
> Acked-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>

Rafael,
how do you want to route it?

If you ack it we can take it into bpf-next.
I'd think patch 1 shouldn't conflict with other 'wakeup' changes.
