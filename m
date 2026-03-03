Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AFC1891A9
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Mar 2026 01:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772500971; cv=pass; b=Vrgdkr1jH4ytkLYyB5GeuMZVadfSwiPCcJArYyoL5ANN9m3gDxoyG7UxkmRIsz1NIxm9DIQIsbxykk525MovfJrdZltap+4NDPOEcdfr5zlcsZooA4dJDqzs3IvEP/0FP667UgYi3PoYakyZiUSquLhaUWJ5zd0viOSHrPMG0zY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772500971; c=relaxed/simple;
	bh=gbgQ8CGwYBaGpra6BJW0UGovLFJFUbkHN9kIy60ugm8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rk046234TY/3mK2mqvV18r4nw5R27nT94wccHlZ1awQnPhPUbwNIsEjrQYxa90SIuS90Dk+oTBKXJm5bKsdjsjHrB095yRO9VKFj5yLuO8hbI1+5/PLormc5ApDGfuB5ob9aXc+bZY2qcsz9sS/A+9Lpkw3k/nyIUO/fYID7OeE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gFuB91TJ; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gFuB91TJ"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-439b790af67so933881f8f.0
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Mar 2026 17:22:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772500969; cv=none;
        d=google.com; s=arc-20240605;
        b=XahV4K97Cw1U2oNi9vSRB2g4Mn14FIdfawiIJQyKijaLdFB7GHJVQ4zZKqcZYK4Dzc
         kMdTuDhOWfeNwxoeV110OfKWsMx3hx8uj1PMgxSKDBSEgXUH5ZXQsdFngpyBbIdoURsf
         p1H8myfdBDWR39JUn+X2wAf+ERMmNBuIEENfob6fGost3OBI8gnuknFXfxBsm7tei5EE
         /eT1YDC6GffZG3e5V20bSABGMfU3mDKoct9yAAWhGQBUVytuZp6iSoH5MsGPwRVW/ung
         1l5CmL6r17wIwHFfaVgC3ZWMIVg7ULrRg0ifoAO2QqIsjYcjQDqUYYPjw0kxu76lqToJ
         EgXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ciwfr7qohbSek7074R+vfsZPxDWv/6ffbabolDxuJOU=;
        fh=sjephMeTdlJ6H/Zj7f08IgaIKwuDyOudA1ZbsNpqTA8=;
        b=YxeV6BJ8x+piKrMnfeO+V898aqm7ywwmRh0x+hf1iPhx8JM6VbvjOdb44Zc/P1AFRz
         6Pl6BsgNS2yzR39UWa9NxMtqGuhajHa+ozZRLVeo1vZr4OSCU5RgpWdXY8ekH1NTjNK2
         NHziH0v4RmeUxDLAzxJRLCibO7J53utivPj8e+QrD8aJsHnv2SSBU42G1m886NZWmz7U
         X6a2eTP9KvN3Jio5/IhqfwmP6uOb2p52Nh5pB+HMqU+1MdowsZ4qHnyo94s+U07K0oPy
         0zNhf45lcu4x6rpmYfj4u1Q7CNei0Uejgs1/41cpmwqiTXGKcWZH2DD+SqzNhULHgGta
         Z5LA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772500969; x=1773105769; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ciwfr7qohbSek7074R+vfsZPxDWv/6ffbabolDxuJOU=;
        b=gFuB91TJTXS0fsRp4onB1ZtQS2MT7d6i/e+AAzvnqZGfJAHDAoH8W3MwkPzuZf4O4a
         IzOLNw9wtjkV9uUoqqxqp/N4hfjURZROs/ipl6lI+wuLSLoLV4XE1JvG2iAX1cNovZcV
         Ptd28o9RYjfVuzi4DhPKYW6VAwUgXNiZ0jS7YqZGPjHeqdcmXAfEV0igUlTmE5OWBpG1
         PLcrFvlAupaq/7zSWdZ9uid8mh/XFejPsbZXYAEOLsbuhqyjgXnWH4LebC6CJDISRMku
         iHBKXvfyeTmBO+0G5zFIIkzQzorM9IRipU1TPglIYV5GBnDfMZms9YrtF8MeIFiyxCu4
         dboQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772500969; x=1773105769;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ciwfr7qohbSek7074R+vfsZPxDWv/6ffbabolDxuJOU=;
        b=tquf++GHfsiQpeFF1t9733uPYjWG53ziBwFROU0m6MnRtX3dGZUHY5/ahC11rNaHe9
         t3ZwMs2KS0byPmxaXtcdUJcVHLobmvOv1l+mwKer9BkBzFqKEJGW/eJMkW8ewXgyrcpn
         QZDPZY3O8nJpmiUyhUTPigeLbgR8ANWf2Yu96uikdzo/b5+ulcfWbYf9zcPCfJCCoxOC
         hogn7ue/H3PGzfBAc1s8s9thO+f09ICIqiO7ffeqAgY9xJJW34mRy9vRMgn8D0Yjki6D
         NUSz333Y3nQay253xayBzJdAGUqSxBh3WrljW59qopWcp9lwscMJVJXgT8oSVggMGRYp
         o8Cw==
X-Forwarded-Encrypted: i=1; AJvYcCVLLKPvAmGM/6Iudpsj1ITxltoP8iwz/7lNrwLkBup8T2oJX4EFJpBAQcYG9lAiEET2jCxZ4xoYk3JQ0Kedylw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx49ADWGEBpPen0wjpKrd56jRlPrdjGGDKaPScBV9r3JcDhhIhv
	N85oKNXYEEWNJh5P3cOt6iNEOfGFcsstmofUd2wGUwz4/r/qZcydGb5empoAYgsjqhtIxwBbTOT
	bx1ByZb4PBs4KsjciFpVnXsHUfMLWcTw=
X-Gm-Gg: ATEYQzz2NOvHn1qfJl4ClWe9YwnuFTv9T5q5Q3sbCocSA4WUJVctvciKqsft82AcP6X
	ovN+6pfZFC7XkIvTndE4xzsSCWF1EXb/6rw4XC4LHecIdt3J87i9BIZRRxKNwCX+GMdUtxeCnxy
	imM8M/3AV3Ws8dpeMJp7yQWWKKXfHxDyN6WF8FZXeiJLxLViVYQd0jl0aRwuLj5O2ndXQkqV5nf
	y3JR938NiegYuG1LiL9jBDvDKL0ZghMKSlhYz6VtcYDYQZAJg10gdDNfC0NgkeZkEOb2lsBwBCT
	E4gK5pCLWCr4VYkSrAVSd0PLQ+G60XWpiUP2LX10k0hY+8Xz1nq73d9sASW19/IDJXz6LDWrmqY
	MLHtJxWePSL3eI4F59953jTxObQ==
X-Received: by 2002:a05:6000:25c6:b0:435:96a1:ee4d with SMTP id
 ffacd0b85a97d-439c10bb54fmr521472f8f.14.1772500968599; Mon, 02 Mar 2026
 17:22:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260302124028.82420-1-pilgrimtao@gmail.com> <20260302124028.82420-2-pilgrimtao@gmail.com>
 <87bjh6ntsr.fsf@gmail.com> <CAAWJmAa9_RcjbHzOmufL12gfoNY3eZtgWGjNTVR0sbCR9Simkw@mail.gmail.com>
In-Reply-To: <CAAWJmAa9_RcjbHzOmufL12gfoNY3eZtgWGjNTVR0sbCR9Simkw@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 2 Mar 2026 17:22:37 -0800
X-Gm-Features: AaiRm52tMbIqemK4kCPdgnjB1juWvykhx_WtqCh-GUkdSRl2-RTrJ0baVX3Hqg4
Message-ID: <CAADnVQJ1E5eJTOqAjX31nYheCY57XnVPyXXV7sOa4htNMhAdBA@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] bpf: Introduce the bpf_list_del kfunc.
To: Chengkaitao <pilgrimtao@gmail.com>
Cc: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Chengkaitao <chengkaitao@kylinos.cn>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 2, 2026 at 5:15=E2=80=AFPM Chengkaitao <pilgrimtao@gmail.com> w=
rote:
>
> On Mon, Mar 2, 2026 at 11:19=E2=80=AFPM Mykyta Yatsenko
> <mykyta.yatsenko5@gmail.com> wrote:
> >
> > Chengkaitao <pilgrimtao@gmail.com> writes:
> >
> > > From: Kaitao Cheng <chengkaitao@kylinos.cn>
> > >
> > > If a user holds ownership of a node in the middle of a list, they
> > > can directly remove it from the list without strictly adhering to
> > > deletion rules from the head or tail.
> > >
> > > When a kfunc has only one bpf_list_node parameter, supplement the
> > > initialization of the corresponding btf_field. Add a new lock_rec
> > > member to struct bpf_reference_state for lock holding detection.
> > >
> > > This is typically paired with bpf_refcount. After calling
> > > bpf_list_del, it is generally necessary to drop the reference to
> > > the list node twice to prevent reference count leaks.
> > >
> > > Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
> > > ---
> > >  include/linux/bpf_verifier.h |  4 +++
> > >  kernel/bpf/btf.c             | 33 +++++++++++++++++++---
> > >  kernel/bpf/helpers.c         | 17 ++++++++++++
> > >  kernel/bpf/verifier.c        | 54 ++++++++++++++++++++++++++++++++++=
--
> > >  4 files changed, 101 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/include/linux/bpf_verifier.h b/include/linux/bpf_verifie=
r.h
> > > index ef8e45a362d9..e1358b62d6cc 100644
> > > --- a/include/linux/bpf_verifier.h
> > > +++ b/include/linux/bpf_verifier.h
> > > @@ -261,6 +261,10 @@ struct bpf_reference_state {
> > >        * it matches on unlock.
> > >        */
> > >       void *ptr;
> > > +     /* For REF_TYPE_LOCK_*: btf_record of the locked object, used f=
or lock
> > > +      * checking in kfuncs such as bpf_list_del.
> > > +      */
> > > +     struct btf_record *lock_rec;
> > As far as I understand this patch introduces a weaker type of
> > verification: we only check that there is some lock held by the
> > object of the same type as this node's head, but there is no guarantee
> > it's the same instance. Please confirm if I'm right.
> > What would it take to implement instance validation instead of
> > type-based lock check?
>
> Your understanding is correct. However, I haven=E2=80=99t come up
> with a better solution to obtain this node's head. Do you have
> any suggestions? Alternatively, shall we revert to version v1?
>
> https://lore.kernel.org/all/20260209025250.55750-2-pilgrimtao@gmail.com/

Let's revert to v1. Passing head just to avoid messing wit the verifier
is an ok trade off.
