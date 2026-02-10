Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F5B2DB781
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Feb 2026 22:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770763710; cv=pass; b=mu7tj8JIidJAzQbw+S1NkNVnL3Q6yK4+SO4/eREBI6wpIY79UoPLKAFn4BYRzlW7ybZfpgkb3pYgGnWt9Lb//sEg+Qwgv1NprPQlKycidFhhQRsjYroZFlWiCazpzRwgVu/0xxApqvk1SO3TWdZpH38EakAjU97Q7uIQXCtk41I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770763710; c=relaxed/simple;
	bh=7RueDEbxvfiJY9nFUB8GTsk9UAZbqARgQdFKPxdici8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Db5SFUgMTaXw1WuTe8NC2WY/y4i2B7PCgQHZfyifhJludr7PNepQdsnbAXQ3o2qeABAbef9v6YJNsTL0HlQ+5Um7Qkz65BkVWrUJzHXyZZRm0+XisHSDsUKSRkg83fY5udT/JF4LSXHmp+lUOBuwZ3nVurqW4ug0glbyxmIhwx0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZfTG0Rio; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZfTG0Rio"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48318d08ec2so9505e9.1
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Feb 2026 14:48:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770763708; cv=none;
        d=google.com; s=arc-20240605;
        b=LLIL7iNT/tht6voP1Oc+Rum8lV+psu2g538zelIDNCk56tXqQMv71LcuvOMyM8v6fQ
         J7Bpv/nf9ClHDS8t4XvuDS1OkcC63CsIzEw9J4AhZnutW9bIi/p8inCoNhTY5dRWaCPS
         SE7iTsGNn6mHKQHfaKU0wNH7gi24V7LTMPfRooHv4nhQC4uEZQlI27uhW8YEk+zST/2q
         ygHvdY63okUZndyezaUa+L58fWab1Uejjf7+6jnzP+OQ/8hJTUm14lcGmkadWKCcRLUr
         S4IC7hPHDoSOOa0uTd3slBpqDy1bga5kVbV2ou44dQOIbmT130l0y5HldYDBnnpBbyrj
         icZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PuqeYntCSLTt3WclOHSOnzeNRZzfBKcRNCGgofm7tCg=;
        fh=Y+PCivsLfLvB3v5zsdxNJGRBGVYHxZQLzVHIYQABG2M=;
        b=gevMjNMCqkUw4NFEt+VKT/qphFq3tKyF7rJn+SgwHNcQZ+0MaE1qquZLA6sU5EZKbx
         3l0ZIrNIbY04eouPqPElM4Q8o8+agGXfwLxtR5CQgMDvsPyAFkqmxTjLAnEKOmfvrodD
         t9RjjbU3mdXqyYUSaGsNJ2f2lBVmvhwRil36enwvuKL8aTrbnMCVKlc02sMsok9Q3ABT
         8e8yZmfa6R+orYXqoQmFWk84d3RekYGN2X/wvAXInFTRrELx5QA8sabyjYEA2o96Ik3X
         jw53OMg5zovAukZO89cl0pNw3inyrhsH9z+Bv//0UO0xGXPXveyg0y7ebFr/lLK8zNGm
         Xs1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770763708; x=1771368508; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PuqeYntCSLTt3WclOHSOnzeNRZzfBKcRNCGgofm7tCg=;
        b=ZfTG0RioDJXR7P2P+zWbJpWvwOVBQLuMvOIrHH8oMTXOACHwbc6C5PkcN6avuZJugh
         yiXSQsl4F+KS0PhG75cdb1m4juEg48wK31FlnAjPxPJ2IoyRdJNtPScJy1tIFjipr3LP
         CS1PQbUi7hy/vIMscZeSoOB/lnpc35UJZ/oSH1ETTDwdOb/WzVYAKMsQ1H8rlpMXkbyA
         oPRWeldYOVk9LP/WrD3i/lmA9TN8sc6rGH4J8DO8el/NJGYKEPjN3Ub/bnMWK+SXhUXk
         0s+ZTDNg/EYhXryRXwxydjhQr8gxEEpvsHiiNOnW4ZH5h6mcM/eRDGshkfS+rxknEupg
         DNbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770763708; x=1771368508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PuqeYntCSLTt3WclOHSOnzeNRZzfBKcRNCGgofm7tCg=;
        b=igLDf6HKWrVwEw8eoHw/T3mzGFV3wcm1ZG7bGjeGvPzY7UjGfnILICNiAgwxUjjVL0
         ent/DhMsmmEmJByvYjDNDBWkBcRG9BL9OOn3IpVLapLUhbuTBKE9DtDZ7JyF8NJ4SyG1
         Pt9nBEbJDeMQySgvBeXh1S9HKSxOJbB34pelniXXqlbYTSeC26otchhYfvrfpvEnqUgD
         3/a/Wyj+idJSf+iaNgh3oVoCtwN39HYA8+exi3K1uloVpMjpLxEZBCyoBSmmR4Qt5Tm6
         NqBAe1qB20tosspG+cRRFYT1zRO5oPnSaBwNrOUimfzIRYdhumq+YSaiy6J0e2s6qdo8
         TjlA==
X-Forwarded-Encrypted: i=1; AJvYcCXm6KIPqledNlkIFS9XtwjUize6e2Nl0uMnOM2gast0dDPvXXAuXPu9L9u7q/VxNS/5TKiiracnXpnpIXIgz50=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHeU9fk3Zb3LKKsQdaI2N6ajRcSCccE5MiucYuQwPjkIw/9zpt
	rGkrEi7lNR0Vg+mVhqjevBCINflcuOHLiiY/dWlClMQsCRrW+rmG2enW7jWitqay4R3WpeedORx
	/9EuIylXpLToau6apK4ZddEo6/kKX5nKNbMJeD7hl
X-Gm-Gg: AZuq6aIsyUbe5ozfeFtlMm1VHjEYRzkOR9p9xHc2MkQxkP+xAeAhmup0bwMkeOf19On
	G9010hspMp5WACGfTv/EW6ghPnpIUfxkxzRRDXDJXLD2OSQq7m2gylotljvkPFok2dwEsxv1A0S
	gkC46sjx4p+Q9xIram/p4cbbDLStkvXIplTtXsKZkpYul6T5W6AQSZ6rYl77/rz71kHVaw9ju8X
	S6j8qijVAMaFspGojuQW96Rc55Dez3gb3RF48dnuluULrbtmey7BG9tv1EzHtC5aQj6B34gK8ap
	ojyxGjDc56P6l5jCqGhQWYZL5rIXG9XzGdkcrWWhLiqeYkfr
X-Received: by 2002:a05:600c:1492:b0:47b:e29f:c63f with SMTP id
 5b1f17b1804b1-4835cebf7ffmr48345e9.11.1770763707610; Tue, 10 Feb 2026
 14:48:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260210003801.2834976-1-tjmercier@google.com>
 <20260210003801.2834976-3-tjmercier@google.com> <aYu0WZ-xCZr-bmsq@slm.duckdns.org>
In-Reply-To: <aYu0WZ-xCZr-bmsq@slm.duckdns.org>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 10 Feb 2026 14:48:15 -0800
X-Gm-Features: AZwV_QgfVPfvMntqiVCLNCIUNKNlybv8eQNNTRFicqch08xd5Yhkj2QTYq81v9w
Message-ID: <CABdmKX36bog6EvLd1bkGk+hd8FyPqjgqGZZ3T1gvskgvjZGxmw@mail.gmail.com>
Subject: Re: [PATCH 2/3] kernfs: send IN_DELETE_SELF and IN_IGNORED on file deletion
To: Tejun Heo <tj@kernel.org>
Cc: gregkh@linuxfoundation.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 10, 2026 at 2:42=E2=80=AFPM Tejun Heo <tj@kernel.org> wrote:
>
> On Mon, Feb 09, 2026 at 04:38:00PM -0800, T.J. Mercier wrote:
> ...
> >  static void __kernfs_remove(struct kernfs_node *kn)
> >  {
> >       struct kernfs_node *pos, *parent;
> > @@ -1520,6 +1538,9 @@ static void __kernfs_remove(struct kernfs_node *k=
n)
> >                       struct kernfs_iattrs *ps_iattr =3D
> >                               parent ? parent->iattr : NULL;
> >
> > +                     if (kernfs_type(kn) =3D=3D KERNFS_FILE)
>
> kernfs_type(pos)?

Oh, yes you are right. Thanks.

> > +                             kernfs_notify_file_deleted(pos);
> > +
> ...
> > -static void kernfs_notify_workfn(struct work_struct *work)
> > +static int fsnotify_self_event(int event)
> > +{
> > +     if (event =3D=3D FS_DELETE)
> > +             return FS_DELETE_SELF;
> > +
> > +     return event;
> > +}
> > +
> > +void kernfs_notify_workfn(struct work_struct *work)
> >  {
> >       struct kernfs_node *kn;
> >       struct kernfs_super_info *info;
> >       struct kernfs_root *root;
> >       u32 notify_event;
> > +     u32 self_event;
> >  repeat:
> >       /* pop one off the notify_list */
> >       spin_lock_irq(&kernfs_notify_lock);
> > @@ -929,6 +938,8 @@ static void kernfs_notify_workfn(struct work_struct=
 *work)
> >       kn->attr.notify_event =3D 0;
> >       spin_unlock_irq(&kernfs_notify_lock);
> >
> > +     self_event =3D fsnotify_self_event(notify_event);
>
> Maybe just inline the conversion?

Sure, sgtm. I figured the named function was a bit more
self-documenting, but it's just as easy to add checks for FS_DELETE
where self_event is used.

> Thanks.

>
> --
> tejun
