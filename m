Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD7826ED3C
	for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 14:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781707900; cv=pass; b=Z/1NsP91MSiujQEBep4oDbP5a4URxgPHt0sE/pshPZZSdS84QNvoQq5zVYZNhuul0EhGqd7SvPUcQpVTfKUgEUL+NaA5CBjvHctBUCFH5/V6U/X0YyoYG0Q62/fMOql1eiT/1iFIe3yvTjHQPYGyWmAlIpptT9ob5HVd24bSiLU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781707900; c=relaxed/simple;
	bh=dAUxks8+/THss1eLO/4QpULUCgYH/OZWeVxrIpVcei4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h5rOlVbcbM+//TY9A5MlrQhup7r0oPoIf5lbyXJmOzOKuI8RAxkpvckqOq6lukbe60qlK3QN3LLDgXjv3KcuNefFHoJiY4lVwbm97MLrwvZntxR5nPerwmrrC0f2XEB78tdy1wo07miWucOINEamkWaofvaT6wJJdPRd28Ic+tQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QZBA/Kat; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QZBA/Kat"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c0115a3794bso782383566b.0
        for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 07:51:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781707897; cv=none;
        d=google.com; s=arc-20240605;
        b=AnWMTlGrs24UQi7YO3c8HdbsrQA4uXsMraXHgcJ6TWmLGWoJ+hICt6TCtJuhArawyE
         fHPYEy0I3KpPq/FJrtSkviBReFkEUH8mbFSAjG7iYKdwKerXt3rWRPGs/JnpxC7JTONs
         pphNoNcEXcHc6y70vZvEAUsW9FJ+NrCV72+Zgri+eAhFgOgrt5Rt1MTPTFe/LywECmla
         5ekA6W2lPU7h1bQt/vkCZ/TTmJjgM5YeIc2uILq+ANgbJXg4TTVnOTJKVtmraOHfnKRY
         yvofca0L6kHdJqwxeMynAe9QJ5uyP4mSIvBkZwxQmgjBEerr4nhcdV0/9dyQv2CsBgmN
         7FKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ft/RyTCuIhbE3h1/qg2sqDYeE/BKsF6PlyUpOWFeyS4=;
        fh=4e8NRx1lkk+i2IUFNBtsIKWXuElZwT8JO6BE/ZUjzJE=;
        b=RhfYBN55ejKF1p7ctr330iwegWOdW9f/NlJPf5hnuAZ+O/kHKV45tZwbnb6i5S1Nlh
         ql+OkNQ47Fc/uSVdRSZR67xSLPtIZ1Ak6/61PvEqMgg/yiPHpckUSZ5RRI/nhaLP2C4t
         +1ZyJpl4m5zqDDUirV6D5oj78pX/KWHYZh6PmpfpVSr+Q+99NBa8/oHo+09oN51kjrzp
         KEQgHgOn/NrOSNPwxDnVpaylZ9r8cIus4Hj0vmaT/1sSfo5P5b4CfOjOaeYXtTkLz/5F
         CerQer1z03fcgNQBDcZHjheUdIc3IAYePNhgmaTY3OlCcZorNb7mc+G9QFxlLCMVGLw7
         FAmA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781707897; x=1782312697; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ft/RyTCuIhbE3h1/qg2sqDYeE/BKsF6PlyUpOWFeyS4=;
        b=QZBA/Kat9q1pyFt+b3YaVcs98MoIsam6pC35UC2Cgson3H+lP24nZGdyT5s4bAjPSp
         QuyFPe4J2tm2b0cYW3NTL+TW+LVjyTYozhGl9NR07FVsCHaY9rIpk4EM6/WnbDJiKXEt
         eJvhUhpx0I61cuhNx4dbbEM8vYEkXdCXAQ188LAhXjZj/u46B6olwpHQdmh/Q2MYDjb0
         HLcfpwCX5asqHwoXPtNuJfSXBL7JIqSmX6zbHwcBBcZYPTj7AK2JKSF3QY4+oCSecYwz
         qBKKIS0WGj50ByXR/QNs+7JHWg8gl9SlawoiT1d/oO3yUovy50N9GgvT19+nJEyryhIX
         VSEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781707897; x=1782312697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ft/RyTCuIhbE3h1/qg2sqDYeE/BKsF6PlyUpOWFeyS4=;
        b=SmZXutQXsAxFB8D3gBBBaKhRCfikMFeMo00++ovGA8DxYZJ72dVz8J+uv6xTeaEZPr
         RU/Vno/pCK3mId2yJymKWIOlhs8dyYpcQq4BADpUIEi0kzaoWlL0hNpYFA1uiqj7bB5i
         9D61qSggZNXjWO4ApAR7dD07xTV9f2lkeszYKyanwGZD9VmDTYN+wJGpfs/w2v0SR9Jj
         Ttps5g7TchyjBv6wyJKNeaLWWXGX757JFxZVN6Gs51GQ2VYbwbxuBUOQiwG+6QlbXv3n
         BNtIHH8EtZNA3FkwfkYDFe8yPIzRIUyKikuXiSl2WXei8VQkbvu1b5BhNWclOqAzftqq
         QWsA==
X-Forwarded-Encrypted: i=1; AFNElJ/8V522R+BGXDHnkHGOhBHNY3779YkKFYQHZI2QHhn9Q12VgyE48/WuF0z9jocdtBCU16WC/SJbV0E0P4ffJ5I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/l6iXfeZdU3xRQrelm4EwVpuhJ3/+zVJJs4yEEbyXQk2klW8X
	mtCyocB7w6dY21W78GsC5iBg+6gtpkIMPYUwFRDynnJGhpsOfnb2FKiGtIZZ3/5NarbkcPsNnQZ
	PTchJVYv/kKfi+woxFZb1jva8k3hfLgE=
X-Gm-Gg: Acq92OHzpRL4rh1z2j6JRvK8qwJ9neLEvCA1pqgPXaTXNBw+6Z/lFtUQTVWspRYaoZd
	WgOekPqpuatXe2tSByx5UTX4e9SmRjCB9NqpeF9W1ZbLeft8nTaCcJTu9f1DA4nknm1Rqqoiv7T
	Lv+pMhD7Q3FY6ChNAF27cw2dTybTiFLctK4F6q3kIOiX5UpNuigGAyzRRN29l1+PdY7nlgKJU4B
	Rmk3NzRFKm3QLaQTipxpUea2JLK+j5MAX33+eGzKMzmrS5xLYuaYlIY9cxVVjmV9lO7cck2405v
	NCrgS4HVYrNErd2mFubkLgG9ZiYYa72x80/rLw==
X-Received: by 2002:a17:907:b598:b0:bee:1e36:876c with SMTP id
 a640c23a62f3a-c05a4c1703cmr211484766b.41.1781707896641; Wed, 17 Jun 2026
 07:51:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260524-fix_pipe-v3-0-bb4a75d23a90@debian.org>
 <ajG2bmhu6j9UWvh4@localhost> <ajJgWBCFYwz9OIo3@redhat.com>
 <ajJ1Xi1p9UhQvILi@gmail.com> <CAGudoHEyDz-Tbj=CZFK5XMLuLyE8B17NumdFVLf6MTTekFgRRA@mail.gmail.com>
 <ajKxJM5k9U5L05AF@redhat.com>
In-Reply-To: <ajKxJM5k9U5L05AF@redhat.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Wed, 17 Jun 2026 16:51:24 +0200
X-Gm-Features: AVVi8CdjBR0lFOZsSJyfbL4WD4q2BfYSOlNp_8lVKa5u-3YhN9i4iyvCeMkkv1M
Message-ID: <CAGudoHG4r09syjknUo7rsZV1G01o0OGBvY3X3S8tQ0dfdSYSaQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] fs/pipe: reduce pipe->mutex contention by
 pre-allocating outside the lock
To: Oleg Nesterov <oleg@redhat.com>
Cc: Breno Leitao <leitao@debian.org>, Josh Triplett <josh@joshtriplett.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Shuah Khan <shuah@kernel.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	shakeel.butt@linux.dev, jlayton@kernel.org, axboe@kernel.dk, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2026 at 4:37=E2=80=AFPM Oleg Nesterov <oleg@redhat.com> wro=
te:
>
> On 06/17, Mateusz Guzik wrote:
> >
> > There are trivial touch ups which can be done by adding a bunch of
> > predicts and inlining kill_fasync if someone can be bothered.
>
> I was thinking about another change, see below. It assumes that in the
> likely case another writer won't steal the pages from ->tmp_page[]
> before we take pipe->mutex.
>
> I'm not sure this makes sense, and I have no idea how it would impact
> performance in "real" workloads.
>
> Oleg.
> ---
>
> diff --git a/fs/pipe.c b/fs/pipe.c
> index 429b0714ec57..9f07f469830a 100644
> --- a/fs/pipe.c
> +++ b/fs/pipe.c
> @@ -131,7 +131,8 @@ struct anon_pipe_prealloc {
>   * pipe->mutex hold-time being shrunk. Any shortfall is covered by the
>   * in-lock alloc_page() fallback in anon_pipe_get_page().
>   */
> -static void anon_pipe_get_page_prealloc(struct anon_pipe_prealloc *preal=
loc,
> +static void anon_pipe_get_page_prealloc(struct pipe_inode_info *pipe,
> +                                       struct anon_pipe_prealloc *preall=
oc,
>                                         size_t total_len)
>  {
>         unsigned int want, i;
> @@ -144,6 +145,11 @@ static void anon_pipe_get_page_prealloc(struct anon_=
pipe_prealloc *prealloc,
>         want =3D min_t(unsigned int, DIV_ROUND_UP(total_len, PAGE_SIZE),
>                      PIPE_PREALLOC_MAX);
>
> +       for (i =3D 0; i < ARRAY_SIZE(pipe->tmp_page); i++) {
> +               if (pipe->tmp_page[i] && !--want)
> +                       return;
> +       }
> +
>         for (i =3D 0; i < want; i++) {
>                 page =3D alloc_page(GFP_HIGHUSER | __GFP_ACCOUNT);
>                 if (!page)
> @@ -548,7 +554,7 @@ anon_pipe_write(struct kiocb *iocb, struct iov_iter *=
from)
>         if (unlikely(total_len =3D=3D 0))
>                 return 0;
>
> -       anon_pipe_get_page_prealloc(&prealloc, total_len);
> +       anon_pipe_get_page_prealloc(pipe, &prealloc, total_len);
>
>         mutex_lock(&pipe->mutex);
>
>

As proposed this will guarantee a big write which fits fine into pages
cached into tmp_page followed by a small write will have to resort to
an allocation under the mutex, partially defeating the original patch.
So you would need to add some provisions to check if you need to
allocate something even in that case.
