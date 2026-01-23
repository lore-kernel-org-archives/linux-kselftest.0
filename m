Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793F11DDC33
	for <linux-kselftest@vger.kernel.org>; Fri, 23 Jan 2026 18:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769194493; cv=pass; b=NOVNpAydyBD4dwsQPi8JA2AqY/uc5DGRmznW0ZNhRlnizP6/79Agt/KJzME+0xebwTd++1eGHTDgkkW0Kx/UIeCEypjMjK3jXRGfKOhJLyjDDAsXB77azF/uQ6jbLiqNLXhclKtFVI0Ytgg3vbR0RzO20JBAOA8geStEZPVAecA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769194493; c=relaxed/simple;
	bh=mogKnU+/3Gpm3+TCKIivbq94eYQH9qfmDATkiFrBSF0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NOibOst+LCHG1HH7vqq7Zqsj6EOSPcHyQ2k6GcKrIMQbN0HhTCj9jwxLh9XuDsXdGXXGX7TA+xnoFZfSg+/ErAD2zod3rBlZztuoa97v6VNF05EFA0P7kCyx6/KWsUEVbURBATrv/WW+dsppbh+YAbrvyeHPHavESxM/0TkkCrA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=azPsTssj; arc=pass smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="azPsTssj"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-35305538592so2545632a91.0
        for <linux-kselftest@vger.kernel.org>; Fri, 23 Jan 2026 10:54:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769194492; cv=none;
        d=google.com; s=arc-20240605;
        b=jeRuQLelMJk9m8pPFz4LwGHq5IC0LmNpTAufqDw2ybCIYBfjYydfX8gn0B9NzIad01
         gkdDngWthdsyFQRiCjXel7Jg5jIarDQsxcRPKkGv4owARddcGy1peaa0LrVuWzclvw0B
         tY8GzVvWuIcfKNPJWwTVEoLSje6o2r1AyEWiIAlrWTETqnBsPuQSo7l6zcSQARzs74Cl
         4nwQNYF99JgveOAo0pxUP7KmArbiVE9zJ6oXjQb/XhzMQ/hoJsjRaZBxO/ZGW5bxMZoW
         UUfkVQ9umRpQsnw8h+Mmn+LQtjDjuRfL7dADV0msDt9UQOtUa/uQ/4KKyey74UXKTUeL
         qbJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gYmPiHRJ1VjBncSc3bQynnNatD06b0uPrSBt7EelaoA=;
        fh=Wa7AXKQcho/gwq4THJBY31UBI3kXXpR1G7i0uJiZaSc=;
        b=TNA3a4VuozDhyD8GOFl69UwCx/vGRwJSbOK6dAof/mGlH3me5dMUE/gyNvwI4dgUda
         f67uCcdmAAzqmQGeilb0L6IUmrtJPafYWEVUzRedCPzYfjdQ2nf0MEs2Zdz9d89LRffm
         kRr/hM9Q9cGsCXLJBlHQuYWRt+xox5roRYzpYI+3cF4EYUieCKNeF2sGf+BeenAEWj/n
         m/uc6njTu4JjA/DlVcVxntXPM+3XYtxPTGE01/bT8v2bJB+/+03pCl8IW5gNpUEqWrHa
         0UGqCKsvwiUAbt+an/TLz0aGAgPwe0tHlo6uG3ycQzBLKg7oXR1d6NiEMmO8rmRQ5BMj
         7KAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769194492; x=1769799292; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gYmPiHRJ1VjBncSc3bQynnNatD06b0uPrSBt7EelaoA=;
        b=azPsTssjg29Vs4wLIzjZFP/Nk7GTIgAVC6iGTmAsj/Hdad1VkjZOiD40/raEvsR7EQ
         m1C7G0U/VR6gnEK/XAVgODZv5CtipRqMWBH/w8zyhzclos3II7dZcU9Puf1q1bp4My5e
         My8iN39aZW4dAKY2ZsGrpdZX2Ggana5AXE5ZVrMo+nsoAu4sXr+TSG0egBc75vzUc4Wb
         /H3VHK2+pqTWROAiKWmxAXRQr4q4PbpyTZg/XN0olDw6myZhQ3+7tp0mFdGYOBDpeSL/
         9EtbtSPoxvC62QfRyNwm6RT1b+7gk/k/IMNM7f0c+cFrVX5GJVVmHikkGT4db04ufPnJ
         iZZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769194492; x=1769799292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gYmPiHRJ1VjBncSc3bQynnNatD06b0uPrSBt7EelaoA=;
        b=SViCEt7KkYdDZT86d92yYAxHYFGUmfpWHrb+o6JaNRMOi/K02aPvfwYBQV/kFdJ2CG
         oo9Hgu2EFP+j+yeO8bKQ3D/SNxK4TgIJNxP2ephgXmEOTSbvG4bd5AtW04Dh4CHyFQ76
         RgCTSW/b+DEorwAyKhEyEwT89cEdnb4CCj/OVKKTlz/+PCFVHaeoUYuIljEgX37H2IsF
         Wk0AJpku7uaIDjYMnlX+hkMWMk/oQz4MAlSh5jIY0G647B5VfvbSgy37QyulSekRET8M
         m1CVN1K89almTmLNVBD9d4yELe51iioOw+n+FFYcJ9pY2XuosRwxc0XikCYMWOURskC8
         zLow==
X-Forwarded-Encrypted: i=1; AJvYcCVe4a71lO/xSL7TEMVNAY5aS4+hFS+wID5aoAcry2N49y+gQVEcFGdUvKtIJ/ixHWB0c/eYnH/2okPIHw5HsRU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2lFqirprfdTB0w1Sk9Dl8K0l5UTFkbZReDnN4xhXobpKDKi8E
	P++l/LH8EF5QZ05fR0Fc94GuChWN5yyjFZTpD5rLY1clYYcOg6IrRNeY7EVDAgfCS1j8IClXwDv
	/su5fdVckt+JA3++Z9NM7eTiiXy1JEHo=
X-Gm-Gg: AZuq6aLdMVjNpBGIDgbHwj2CpU6NPkxK4CbyyEKaJ1ImRJ+uCe0MoYs6KN6ufQjDFm8
	wR3x3tUy9UbmR1re8GT9uIxaVrsh93/CIYft+8NL0Hce6/l5bZPW0FZFi+B8DPrVwjxgBoKT7qJ
	gP757CPOR3whkTcsA1vMNqI/lv3TwXdjyY5SIRAFNxVBtJbXQAeeMSx+rBmhASXX4+fflct9rTP
	FiNa0/TuR19YxySRDSu9gtX6EALL/kH/SkZqJt6ddGb7HLkCMIgML7K3OprKBhMZxGuk2vbiR7K
	GqCr4dYa004=
X-Received: by 2002:a17:90a:e185:b0:349:5b1b:78be with SMTP id
 98e67ed59e1d1-353688574b1mr3895164a91.17.1769194491806; Fri, 23 Jan 2026
 10:54:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120152424.40766-1-leon.hwang@linux.dev> <20260120152424.40766-3-leon.hwang@linux.dev>
 <CAEf4BzYuZsFC-DPhhzLcyFTahucHP59+6kAc0sooY2g+SqgrEA@mail.gmail.com> <d8f37588-2b7d-447a-ae4f-dc81e1b573c5@linux.dev>
In-Reply-To: <d8f37588-2b7d-447a-ae4f-dc81e1b573c5@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 23 Jan 2026 10:54:37 -0800
X-Gm-Features: AZwV_Qi3JozEFDMkX_Qj_HRM7VamKhm_b4P9yeRYSoUDV7xr3lmnoWFfgWxKG6U
Message-ID: <CAEf4Bzb_V4p7XvE6e2CUfbKhfjh96i-_mCYa-osWiSGwWObmrQ@mail.gmail.com>
Subject: Re: [RESEND PATCH bpf-next v6 2/9] libbpf: Add support for extended
 bpf syscall
To: Leon Hwang <leon.hwang@linux.dev>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Christian Brauner <brauner@kernel.org>, 
	Seth Forshee <sforshee@kernel.org>, Yuichiro Tsuji <yuichtsu@amazon.com>, 
	Andrey Albershteyn <aalbersh@redhat.com>, Willem de Bruijn <willemb@google.com>, 
	Jason Xing <kerneljasonxing@gmail.com>, Tao Chen <chen.dylane@linux.dev>, 
	Mykyta Yatsenko <yatsenko@meta.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Anton Protopopov <a.s.protopopov@gmail.com>, Amery Hung <ameryhung@gmail.com>, 
	Rong Tao <rongtao@cestc.cn>, linux-kernel@vger.kernel.org, linux-api@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kernel-patches-bot@fb.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 22, 2026 at 5:41=E2=80=AFPM Leon Hwang <leon.hwang@linux.dev> w=
rote:
>
>
>
> On 23/1/26 08:53, Andrii Nakryiko wrote:
> > On Tue, Jan 20, 2026 at 7:26=E2=80=AFAM Leon Hwang <leon.hwang@linux.de=
v> wrote:
> >>
> >> To support the extended BPF syscall introduced in the previous commit,
> >> introduce the following internal APIs:
> >>
> >> * 'sys_bpf_ext()'
> >> * 'sys_bpf_ext_fd()'
> >>   They wrap the raw 'syscall()' interface to support passing extended
> >>   attributes.
> >> * 'probe_sys_bpf_ext()'
> >>   Check whether current kernel supports the BPF syscall common attribu=
tes.
> >>
> >> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
> >> ---
> >>  tools/lib/bpf/bpf.c             | 32 ++++++++++++++++++++++++++++++++
> >>  tools/lib/bpf/features.c        |  8 ++++++++
> >>  tools/lib/bpf/libbpf_internal.h |  3 +++
> >>  3 files changed, 43 insertions(+)
> >>
> >> diff --git a/tools/lib/bpf/bpf.c b/tools/lib/bpf/bpf.c
> >> index 21b57a629916..ed9c6eaeb656 100644
> >> --- a/tools/lib/bpf/bpf.c
> >> +++ b/tools/lib/bpf/bpf.c
> >> @@ -69,6 +69,38 @@ static inline __u64 ptr_to_u64(const void *ptr)
> >>         return (__u64) (unsigned long) ptr;
> >>  }
> >>
> >> +static inline int sys_bpf_ext(enum bpf_cmd cmd, union bpf_attr *attr,
> >> +                             unsigned int size,
> >> +                             struct bpf_common_attr *attr_common,
> >> +                             unsigned int size_common)
> >> +{
> >> +       cmd =3D attr_common ? (cmd | BPF_COMMON_ATTRS) : (cmd & ~BPF_C=
OMMON_ATTRS);
> >> +       return syscall(__NR_bpf, cmd, attr, size, attr_common, size_co=
mmon);
> >> +}
> >> +
> >> +static inline int sys_bpf_ext_fd(enum bpf_cmd cmd, union bpf_attr *at=
tr,
> >> +                                unsigned int size,
> >> +                                struct bpf_common_attr *attr_common,
> >> +                                unsigned int size_common)
> >> +{
> >> +       int fd;
> >> +
> >> +       fd =3D sys_bpf_ext(cmd, attr, size, attr_common, size_common);
> >> +       return ensure_good_fd(fd);
> >> +}
> >> +
> >> +int probe_sys_bpf_ext(void)
> >> +{
> >> +       const size_t attr_sz =3D offsetofend(union bpf_attr, prog_toke=
n_fd);
> >> +       union bpf_attr attr;
> >> +
> >> +       memset(&attr, 0, attr_sz);
> >> +       /* This syscall() will return error always. */
> >
> > I'll cite myself from the last review:
> >
> >> But fd should really not be >=3D 0, and if it is -- it's some problem,
> >> so I'd return an error in that case to keep us aware, which is why I'm
> >> saying I'd just return inside if (fd >=3D 0) { }
> >
> > I didn't say let's just ignore syscall return with (void) cast and
> > happily check errno no matter what, did I? Drop the comment, and
> > handle fd >=3D 0 case explicitly, please.
> >
>
> My mistake =E2=80=94 sorry for the misunderstanding.
>
> You=E2=80=99re right; the return value should not be ignored. In the next
> revision, I=E2=80=99ll handle the fd >=3D 0 case explicitly and drop the =
comment.
> The logic will be updated along the lines of:
>
> fd =3D syscall(__NR_bpf, BPF_PROG_LOAD | BPF_COMMON_ATTRS,
>              &attr, attr_sz, NULL, sizeof(struct bpf_common_attr));
> if (fd >=3D 0) {
>         close(fd);
>         return 0;
> }
> return errno =3D=3D EFAULT;
>

well no, it should be

fd =3D syscall(...);
if (fd >=3D 0) {
    close(fd);
    return -EINVAL;
}

return errno =3D=3D EFAULT ? 1 : 0;

> Thanks,
> Leon
>
>
