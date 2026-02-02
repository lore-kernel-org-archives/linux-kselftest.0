Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB302D8362
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Feb 2026 20:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770063838; cv=pass; b=PavKHckMsQs3uwuaHEeJd44yWVbaLe3Gq0QW70GMM+2VfTJDbDcwj74MoLW0HF6vb2wwNoNgzPA6BRH/u2/sccRnZ5j54+BsDvkOyO5qp0XObXPdGZYAL4pEGK1h0MY91WuVr1wFpSmdtA6Puwdc1PVZDvtdbRxoZaJVfcDZh8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770063838; c=relaxed/simple;
	bh=rygccUd18l19TzR5JCjH1aG9Ieh85FWBhgGrodwQfAk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JgTCpP5vPbVzRbICFMWExEbBv4PyOXiQVgy8fBxmZTQBkbf37IWP0Q0Gto0zxWrsM2krbuwGUICLo8GFJjl/qFc1yvcuCQJn3D7Oo2XoS+MxTM6UkGEGcxK66eJSsqfdMRGfmE7x9EGjekzVvx1UbNUsIkTmVOLe8vVryp4LfRA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U5aTzo61; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U5aTzo61"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b8838339fc6so24902666b.0
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Feb 2026 12:23:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770063836; cv=none;
        d=google.com; s=arc-20240605;
        b=PmSh0rYY/Plis9DdTLERJzlfUHy+rztb5iXlRlDvfGlQi4crmKsXNXMOi5NCm3RoHR
         wFnyiw4N21qfFmWvdcTVHscL34nFAwXaWOesLGarwd7oCZ0OJSY62IAlq68tQkNMuxQe
         a+NFvgak865oS+MBEtddhGbsgPoTaS8x8CT9p136/KQLpMe+t15KMjsuKhail04/gH5s
         JUis6HnL/AF7vIeORp2GXaXaWrPhjk34fUIAD68AbCxXgN3xsohdcwiG5zfcPS8fkBpC
         KPrpNssgkw17nNkMvEm6C3d8L7nfCnN3nlVGb4uR7nwpsgvR6+zmFsl8N6iqK71MJmFI
         qVZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=htIZPWHbD45Ax/xP9Qw9uEOw6k3b0vJzapO+gLliJ94=;
        fh=l4DoI1uzSdazM/ls9i+H34u+FkG/S+1Qw8aCUln09Nw=;
        b=IPzHrwAt5UDN6lu8ixUv7bgeN6N2lurrRl679x1BGQkoSR7XVA7MMilrIQGddefl6F
         CYW6szIvzf5y+Q+wAr1kAChrfUywsvotmpWAwaDCsHwNpHaZb+t6XTJdTHwf7r62hSIM
         PE73uu9DwbriDfqfp1yZU2sJeAHHuCduVr9IT3/xHS0c12NYnAz4/tV7DrLXl2CsrVTu
         y3YSLTj6eLvy8d6PEgNTvhV/+dE9+AHYkozAbwjHXpSToLRmkGFHy/klcocEguMH9YSN
         axzljS09ktWQAZtAwFPVFEeHXj6nlgxKKJmwb6iOx1Mb2xoMcmfquHXCHbqbQHbqQa9D
         v/zw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770063836; x=1770668636; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=htIZPWHbD45Ax/xP9Qw9uEOw6k3b0vJzapO+gLliJ94=;
        b=U5aTzo61c9/GFsxEM2m/A/746Ub8QrtfHQpE1rRZ5Vf54hERmqP4ON5eB4HH08LM+7
         UI9XsRK69lkdz/LYxPZq52tIGUNny7M9dnq95j5P7Fmyp7Rw5Q6Ogr9TMk5I7pIpBLhI
         NHz2enOQi0U4FMoF9/xgSFOAPf1z5kw8vrMQVJPSD2LucXCUtI+UBn0hlm3CyVTknHMF
         K9t8VVvcZY+rQmf1yXA1kkzjBa+2daLFLDEU3vQih+VOcMi7/XGYzayGFKCtltNStaUX
         bD2joBB4sBs1iANJaqA0UI7jWhqVyTZIJgXXiNlK5ei6bmSxOAHvOI868ew8CdZljfGD
         GabQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770063836; x=1770668636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=htIZPWHbD45Ax/xP9Qw9uEOw6k3b0vJzapO+gLliJ94=;
        b=AFA1Or6Y6nxRbeprOXazXsKuV0MVa4u/s24MhIfFNmn77fc6qRib+nTneMYZxlA1f2
         gW46uQiih3B+c9H17Z01kkRxYqBiTqq8o8xI4JovkazJ7H5bH89u1CSTVrDHV/83M8+S
         4DvBu/EXjNViRMC47VOu/Rz0w25hhAZJ4yudMV3KQJJkT+cJ5rN2JIsvOeeh4VRyMBuG
         ZcfHmx9yEcTQfMhbEKVU/XJmySLfS899a98Ro4yueqeXUJKg7WulXtTZXHn6QFyaZp1E
         eDETc/WYvyRgpUGk8cNKx0Lsi8Br1G4NF2wnM+OIKoX9NsDi7xurFVDYhjEtgIAuXAtM
         9CTw==
X-Forwarded-Encrypted: i=1; AJvYcCUA/YyYHbqwExjjbWwg0PwpXtCPxgROoTBjg8LzXB0whNQ91DLj41fDbxG6p3myUQKF+JTsogj9QtruVVCBpbg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfMUzwQM+QvPfZ9fzmlfyKKq0l3+OgayHPTQcAuet5NrVDiEoa
	s2+Xpdn7giSx2Du0igUjaQzhOAxOQXAQhQWd93vgZXtdcXnx/S+YXFq2qeH+M3UQIhNQpAMn8fY
	a27SC3SC4KcsNbzJGyOtrXI4LAJtMgFdRNtO7y0QB
X-Gm-Gg: AZuq6aIm22gNKUVMC0eQzypCLjyJohMgjGH39XS8t3vixTrTF4Lcn6ajQa++LjbpeWE
	TeSXHFc8kQYg7UhzvylUb0635WUEJ2w3k2v16t2E/33PyHW+22QGKRghfiVT/2MdkN0eh3PQEoS
	eAt1tlAqWLUxCWd/3kaMoaI+UvCJj2q1rrA69o2YgKTCR1Xvy0/2XNtXDvrJnplctfoA5jL/awz
	twKhVBHPn7N5CIyvEhAXvxf/0oFxYdhU+fRclBPXfk5HWlFYDYCXaWaWscKXOJMsRpFecLxJZ9q
	O0sCtsM4vzjlPWJMl/Qzpizmsw==
X-Received: by 2002:a17:906:2092:b0:b88:5894:6ba1 with SMTP id
 a640c23a62f3a-b8e8384b261mr34088266b.28.1770063835546; Mon, 02 Feb 2026
 12:23:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260124012133.2451708-1-wusamuel@google.com> <20260124012133.2451708-2-wusamuel@google.com>
 <CAJZ5v0jWCdEVgQxOAkek4qqVHMx3Xx4_W3ov9bvdJP=0acX=Yw@mail.gmail.com>
In-Reply-To: <CAJZ5v0jWCdEVgQxOAkek4qqVHMx3Xx4_W3ov9bvdJP=0acX=Yw@mail.gmail.com>
From: Samuel Wu <wusamuel@google.com>
Date: Mon, 2 Feb 2026 12:23:42 -0800
X-Gm-Features: AZwV_QgqKaDjKsxdqUkpb1jGTSFawd3uSAT91ZuKQiHw4J175hzMfkuvra288U8
Message-ID: <CAG2KctqqZ_12AWiJ89OhCfqDfNqxBH3UrzssycxrXbcbj-82VQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 1/3] PM: wakeup: Handle empty list in wakeup_sources_walk
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2026 at 8:15=E2=80=AFAM Rafael J. Wysocki <rafael@kernel.or=
g> wrote:
>
> On Sat, Jan 24, 2026 at 2:22=E2=80=AFAM Samuel Wu <wusamuel@google.com> w=
rote:
> >
> > In the case of an empty wakeup_sources list, wakeup_sources_walk_start(=
)
> > will return an invalid but non-NULL address. This also affects wrappers
> > of the aforementioned function, like for_each_wakeup_source().
> >
> > This patch updates wakeup_sources_walk_start() to return NULL in case o=
f
> > an empty list.
> >
> > Signed-off-by: Samuel Wu <wusamuel@google.com>
> > ---
> >  drivers/base/power/wakeup.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/drivers/base/power/wakeup.c b/drivers/base/power/wakeup.c
> > index 1e1a0e7eeac5..e69033d16fba 100644
> > --- a/drivers/base/power/wakeup.c
> > +++ b/drivers/base/power/wakeup.c
> > @@ -275,9 +275,7 @@ EXPORT_SYMBOL_GPL(wakeup_sources_read_unlock);
> >   */
> >  struct wakeup_source *wakeup_sources_walk_start(void)
> >  {
> > -       struct list_head *ws_head =3D &wakeup_sources;
> > -
> > -       return list_entry_rcu(ws_head->next, struct wakeup_source, entr=
y);
> > +       return list_first_or_null_rcu(&wakeup_sources, struct wakeup_so=
urce, entry);
> >  }
> >  EXPORT_SYMBOL_GPL(wakeup_sources_walk_start);
> >
> > --
>
> This looks like a fix for the for_each_wakeup_source() users.
>
> I can apply it without the next two patches.

Yes please. Feel free to apply this patch independently, as it can
exist as a standalone fix independent of the subsequent two patches in
the series.

Thanks!
