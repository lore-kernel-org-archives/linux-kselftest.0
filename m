Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22723B4E8F
	for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 22:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779231395; cv=none; b=hyDGo8OMIBCMFDlX+OJS0p9difIDN8pg2QwHfIOyoP3ZHk2BAYT+2D83Nz0LOF18YE+zCvvi0zT+2F+kZNXarL5/3FRxTEkSGSgpsrIMzJcpiZK9z7V98RrfmvOtX6IsbYeXLQqRcZPrvZYmX6EpuFfejQvERqSvgNQHIMRtTJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779231395; c=relaxed/simple;
	bh=DQ41CRAl1OeIQBnFeFdAojurEqVWILdT4FLVGVcMOpw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Dc6tDwy7I1gG02HDlA5+7EHyyi+cik2rnBWgHnEIuI/g+5rscFuVuQqo5aSaNagtA4AX8mmH1bLBm3dVvmxQ0RTKo7gIp6gEc8W/wnWPAkHUwwJcKVAFiUXMh+HX1meo/8p0KCZ2SBXo6mFn13ohCKuPWFo1lRXdya1b44sHq9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OR0WvzPI; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OR0WvzPI"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-82748257f5fso3253471b3a.1
        for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 15:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779231392; x=1779836192; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1WsJ7iE9Th2TeW99X/1315mg/TeHiumpmbaJfuandy0=;
        b=OR0WvzPIal12u0k45KAs6VmyjO4w3ayUPWhOgtvkx98hnmcndiW0z9/4sca3lW22vX
         elWvcb89s13gmZVBndweCOoiPZhN5sffMhbBvVEKFuG2b3IZQ/NvqdJm/w9gMrTwHr4u
         v7Bz5oPjSUg3NWASoO2U+hB/SZdr80Nh0AVAVJzCdZhS0ZRqUB0H/iryz3FNWXMIDklF
         J+Nj1Dz9fc1zLnW1GWUxXIQH3dWBGK9C1eGCsjDy0TecoyWH+FuM4vTvH48O5lnVKhUn
         y5JGEnErhfR3Fc0mAaGZiWNrDCEDmrEChWi2NkgNKaa1oFDtdPvpk2PzxKQ99/Td2g6G
         37cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779231392; x=1779836192;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1WsJ7iE9Th2TeW99X/1315mg/TeHiumpmbaJfuandy0=;
        b=Uy2m1X91kcnNFfKDXZuV4maLjpEx55knaS6ko8PIhPQj/yVkOoXOtC+TRgBlE9cw+N
         gyf5no7PsRx8iFIWqVjic69lyYSF5DMdB4Q9+yEr09De2gGcLhPWX3e74IdJhHNbVunY
         OAroXbvFef+PDFccxb9yU7UeMz7nwskhpcDlIAfOytUmMQ2TTAKMXnLrSj61qtRHB/od
         j9vJSURvttO2rPFm3EBagcoy9CxTfV6O4zuIir6sBJSyafxI4MUxWpUsoAnsOd/8knqz
         Cq21/+nWTd5clFgD+KaooMgF87p+kSnUQHW+frBFTpjuf/29br5bkWOp1FNhBun7ufqw
         WEiw==
X-Forwarded-Encrypted: i=1; AFNElJ+OH4T1l0SrUkLuwl4XlpxiRQkB0T8dRhU1V0ZzGCtY2aFI8FxQeVKE+aPTJ4bu9z0hTaOX877exx7rVtqetPY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuQVGygx5oDEUEzbIoR2HAD3YAU/Bz2LCuk5yqZ6yyu4mQrzd9
	Ur+8Msfgbh+hDV9+16dC8dUDxkNXjPllb2SZ+ftCEP7tdI7Z+nL4cMzP
X-Gm-Gg: Acq92OHhbipVEfnCweng1YAehEXseBhiXu8sEkIqeNdCOWiER5qCLYV5/dK83m55wlE
	p4EfnHN+fK7bXu0FbX5aFh03L/EBtNz6y6ks5UTrkwn63ecVxZieFzmKnxIESDPSJEPGPcBuPKh
	SQRaO1hiZBG82+g4k/O9zIzrVOJb4FCs1Sn1S9CeRFjztVxMMaDH7Eyjq96GuE+Pgmape3kEoiV
	3OUpPwFd9smULkw6xGwvoRWukEwJymtCq1jl0vbqJ2jndG5iQJsSd5KY+io0jOZabQFKCjqs5Ss
	R8JSscMYW+LiLSKcp59RwCD41sgBZxX1oZyenwZlW/xc1Lb1B2b5OThsTouSmMNTMK+3YTc9ot4
	RLtNNJJuJh2kBHdmNkc2uSo206sRj4jEPMGAyhA9+zfoMvGBUn7H3KezLW70pfhoy/rs/Y5IGcz
	BmYikxjlVWrG42CBEzN8AlfyE93z3IJKuacv77Wlg7MumldW7H2ZRY74QTmsFLx7HdnOjqPzYui
	8DKxfKNIPneQO6gXOc445GXXRc=
X-Received: by 2002:a05:6a00:e09:b0:82f:51e8:b38e with SMTP id d2e1a72fcca58-83f18e9f782mr22108263b3a.24.1779231391791;
        Tue, 19 May 2026 15:56:31 -0700 (PDT)
Received: from ?IPv6:2605:8d80:324:220f:2a58:15b7:a6c0:c426? ([2605:8d80:324:220f:2a58:15b7:a6c0:c426])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f1966471dsm19428314b3a.6.2026.05.19.15.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 15:56:31 -0700 (PDT)
Message-ID: <782833db5da77e4aa9761fc410827e7abe8583c8.camel@gmail.com>
Subject: Re: [PATCH RESEND bpf-next v10 2/8] bpf: clear list node owner and
 unlink before drop
From: Eduard Zingerman <eddyz87@gmail.com>
To: Kaitao Cheng <kaitao.cheng@linux.dev>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <alexei.starovoitov@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, ast@kernel.org, 
	memxor@gmail.com, corbet@lwn.net, martin.lau@linux.dev,
 daniel@iogearbox.net, 	andrii@kernel.org, song@kernel.org,
 yonghong.song@linux.dev, 	john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@fomichev.me, haoluo@google.com, 	jolsa@kernel.org, shuah@kernel.org,
 chengkaitao@kylinos.cn, 	skhan@linuxfoundation.org, vmalik@redhat.com,
 linux-kselftest@vger.kernel.org, 	martin.lau@kernel.org, clm@meta.com,
 ihor.solodrai@linux.dev, 	bot+bpf-ci@kernel.org
Date: Tue, 19 May 2026 15:56:23 -0700
In-Reply-To: <d5961282-d41c-4e54-8ba2-cd08823a8c77@linux.dev>
References: <20260512055919.95716-3-kaitao.cheng@linux.dev>
	 <da95f45b43d94d17796b19abc4c555e35daafab7d5e1cdca3714fe0f54ab8cce@mail.kernel.org>
	 <e141699dab70282d811ec30bbf2aa8279706817b.camel@gmail.com>
	 <DII0TT9LXYCX.2GMM6QA4Q9BPZ@gmail.com>
	 <0fb2d99b-b122-44fa-a8bc-9befe6e350bc@linux.dev>
	 <7fa6794161a8bd4fdbc21dad68e86e9770c873cc.camel@gmail.com>
	 <0171629c-bdd3-4661-a4e6-2698dd623c3a@linux.dev>
	 <d5961282-d41c-4e54-8ba2-cd08823a8c77@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-05-18 at 11:02 +0800, Kaitao Cheng wrote:

[...]

> > > > The patch does have a bug, however. To fix the issues we are seeing=
 now,
> > > > I propose the additional changes below and would appreciate feedbac=
k.
> > > >=20
> > > > --- a/kernel/bpf/helpers.c
> > > > +++ b/kernel/bpf/helpers.c
> > > > @@ -2263,8 +2263,10 @@ void bpf_list_head_free(const struct btf_fie=
ld *field, void *list_head,
> > > >         if (!head->next || list_empty(head))
> > > >                 goto unlock;
> > > >         list_for_each_safe(pos, n, head) {
> > > > -               WRITE_ONCE(container_of(pos,
> > > > -                       struct bpf_list_node_kern, list_head)->owne=
r, NULL);
> > > > +               struct bpf_list_node_kern *node;
> > > > +
> > > > +               node =3D container_of(pos, struct bpf_list_node_ker=
n, list_head);
> > > > +               WRITE_ONCE(node->owner, BPF_PTR_POISON);
> > > >                 list_move_tail(pos, &drain);
> > > >         }
> > > >  unlock:
> > > > @@ -2272,8 +2274,12 @@ void bpf_list_head_free(const struct btf_fie=
ld *field, void *list_head,
> > > >         __bpf_spin_unlock_irqrestore(spin_lock);
> > > >=20
> > > >         while (!list_empty(&drain)) {
> > > > +               struct bpf_list_node_kern *node;
> > > > +
> > > >                 pos =3D drain.next;
> > > > +               node =3D container_of(pos, struct bpf_list_node_ker=
n, list_head);
> > > >                 list_del_init(pos);
> > > > +               WRITE_ONCE(node->owner, NULL);

Is CPU allowed to reorder the stores in list_del_init() and WRITE_ONCE()?
If it is, I think there is a race here.

Thread #1:
  enter bpf_list_head_free()
  acquire H1 lock
  list_move_tail(pos, &drain);             // reordered
  <-- ip here -->
  WRITE_ONCE(node->owner, BPF_PTR_POISON); // reordered

Thread #2:

  acquire H1 lock
  n =3D bpf_refcount_acquire()
  release H1 lock
  acquire H2 lock
  enter __bpf_list_add()
  <-- ip here -->
  cmpxchg(&node->owner, NULL, BPF_PTR_POISON)

[...]
