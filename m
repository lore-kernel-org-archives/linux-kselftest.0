Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F293E3803C7
	for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 17:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779384424; cv=pass; b=kdysoQQ5Yy5G3O4nUc1EX77suyWFvIf22SOPmrGQ8DoGznp7fNfR34QtWjMnoqWUjQWr2ESt7aqXTr2Z86wbhhj9H111WdXl1Z4/QvOeE7tubpK4cdzkAMlFU+fUe4PbUOySLAO7HoKN4Lrq/qIjs3U4xtOYW6nlk3LzCR1pFDw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779384424; c=relaxed/simple;
	bh=7i6+5x+bhz/ruv7bQgQFGPukfPmpvKb2CdKoNo5gNWg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=moHDH1E85QaVXW+rh6Pd+V2KGDRdtpJm2jgfk6vOSbxooVBJTv3j1BTNdHX4lrsi46920rku+g0JoqEflAlPNMp5VoelW+yNRMmx5p9JSEe+SIM9JrMoba1J7rLFUxTNX2sHUtWSL64XgFlOIPDkJEtIBqo7FrrdPRZbSKwOc14=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T5tSAsVN; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T5tSAsVN"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-bd2d8bb1068so1281063166b.1
        for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 10:27:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779384421; cv=none;
        d=google.com; s=arc-20240605;
        b=DxzFaFiU+czaYkCZMe7+O1ZF4o+cHg5kzj1PJYoaPvSc3P3DRUTxnhGxgiF4tl4qi6
         Y8vYQA8LUH+tDu9YmCfJb8kG4tFWVGrUJ9F5PKp2aHC4FJgziRrtg6HBNGJE+7Ekhxj4
         4tS2yp5C0TJjTrsJTgwAhD0uEuyPwKkAtSrDuiRKpKijZ2j8PsBKKFbKV0qw8aCbkU0s
         c09/sv9GzsPPb2xKK+1gXIUiTbkacvpcfnrEfxaeB7ZHOl3XzeV9rkm5U0/o1k9X2eDl
         PkuQZLnqrgpm8zowDezgz/oNZvG3q+G2jW6qeBxmoxVYeyFPkjDIm2EtDfXiOYI3N8Ex
         iJPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=THyCE4kTFreTcsT0e/BAYNeKb4rm5MW+ojTvAPyfOvQ=;
        fh=d2T3nEXWAFbhhQ8EZqNXW31TvkRvxMnenQGFeVifVv8=;
        b=F0/IYG44dFrkGLMF3koX2O+nNFTcRSoPv3dOsVOr4yrCe0q+jc1UY9hl4vxc+rUzfM
         9Daox8gidC44Poo/sbaWFqlIq3z38PL3BIEpGjDVDFNBOpef+kDVsFfzMOf4kTyTBdGp
         BY3mlSwTyKj2U1V6fopx/1wa0u/cnEPY3TbOI2BebJTOJDVTU0RwFFB+lOEq81WjdUuD
         UuOTpDbqcK4oKQCd0dkkXUT55ho81P5OusOGe2oWT/lbbW6078lSBoLiwHOLYvMbDlwI
         2wbMoXnlV6eumy50PqSmY9MrwYWtrgKd7vLV1qFj2C+EK5AosTFkAiJq+X1K0bnM+gCE
         bJiQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779384421; x=1779989221; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=THyCE4kTFreTcsT0e/BAYNeKb4rm5MW+ojTvAPyfOvQ=;
        b=T5tSAsVNmtG43zaypZEUgD8N4LGh1Irw2BHaoH73NByuJFR6bsIEzDg3ZojDuXe4oa
         lUMg2yQAbYk2EjVD1E3Vd3vJtFFHW94EwVvGrM2CMsroqyhOZ8TRjcMG1+TAvXDCLR6d
         a864bjpIcFLdr/05cV3u+gQfpKSZjNUJRT5pYyii5DLYdbqfjoJNyWrkAbPBVzGmTQc/
         B0clNw9gS0+0TSogSbNJacWP9EXtKHT6WZHtZJf6JLool+oXVJjhKR1r1vUWkEXnVrVZ
         v0E6QZs1R3IMyVVOTi0x364Oq8yPZ26SxCA+7kKGulpXQCN6PKUNcq5/w+FC1L74lopw
         Wtkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779384421; x=1779989221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=THyCE4kTFreTcsT0e/BAYNeKb4rm5MW+ojTvAPyfOvQ=;
        b=cf7y+kqGS+TRL5WAwrL0xWKR4Mu0v1p1XaSGB2DNe76/7Y9S9wFymzLNJMAxi1LW+8
         3RFFxwU8HU6wbqkwNkfPZju+4n3QGzG6a0zDwT8hKekj8+t0ocPBV1hfNKb6jLhT2EDe
         NbVZZ1iesiowsV7TVlIsECwptzDv5ReJakUyYhcAIpYP3xcFcoRBlhAy3MBQvbIFQ/RR
         +6RuXrBeTQnMa0Dpw02UOPAVLMbx+aMMFcDfOFYymcIxJ/TRKF0rdTp75gTpmRlzLfbj
         Ckl1u5Eu35zpU3fGr3HoLRXGxPPkq8wtiQ20GZ9uvFLZKbeZ1kCOTZpklufe5cFpBls8
         IOWQ==
X-Forwarded-Encrypted: i=1; AFNElJ9GRfdeGNdX28y4adYOSmYROO+3GtgI0EC6Vt0yqGs2a9/PA2IrrC5LvYznbKTlllaKqm9sQqIgqBlzJxHKqoU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRFyOIVz+J78CD+Uz8mAZnQcTgZ2zn25kl+dDD62hNAD45leg7
	6naXCEBklIhikdvX7iD5Huae+x2mCLmX/UGRc/qw88gRnSu5hZsR6iswsnp359Z2shEBW70ckiF
	8n7NPJMRtB4m1XnXDFGkkJf6o7X43778=
X-Gm-Gg: Acq92OFoWB9uSOOjxD3lrVnAFOsbHsgVMgrbgYjn0bqV2v97imbpVoCupSEXvFZSH26
	qBYpbtnSgNEdC9AMNcOfiWIb4i0x8KfZBAzGNqUeweGhOkhGUBXsUy2jTXACQ3IOvXf5ng4rqik
	AjnwfmDwBLWTWl0XhkkAMgV2GHY+XIn/PDfccHGDYfhvCheHG94XKIpHAQO/Z4FekCNg/sR4cMg
	mqBzkK5DrWJBk4S+APdYu01A6alMhz/NugVFRz49ExLblESOXhqqzexinmTcRcX6DdFUzmEBtKz
	5vllm1zHJGykt8j7tz8KqoPrROOKZCJ5Z7GvdtE=
X-Received: by 2002:a17:907:2d29:b0:bd8:f776:6980 with SMTP id
 a640c23a62f3a-bdd25138390mr17544066b.10.1779384421135; Thu, 21 May 2026
 10:27:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515-fix_pipe-v1-0-b14c840c7555@debian.org>
 <20260515-fix_pipe-v1-1-b14c840c7555@debian.org> <q37bmptbjr2gysl2g67bqo5axxqor4lsrrnf7ajixxjdrumbup@tgu3kz6kien5>
 <ag3Ty3T24wjn1aFw@gmail.com> <CAGudoHGT+8FW9HsN+ymQ2QECVjmwkx=xNQ9=WnjYWirXcA6u4w@mail.gmail.com>
 <ag8lIqhAmJtW4Rtv@gmail.com>
In-Reply-To: <ag8lIqhAmJtW4Rtv@gmail.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Thu, 21 May 2026 19:26:48 +0200
X-Gm-Features: AVHnY4KU_xMWhlEHSlaLjTiAK0klSyvl5qfkNVZeAKELkRInHGtOqN8RPU6YoQs
Message-ID: <CAGudoHGMVQTU-5bh5csvZDgXv_aXun5-eSSGRoONxgSZAcF6Rg@mail.gmail.com>
Subject: Re: [PATCH 1/2] fs/pipe: bulk pre-allocate pages outside pipe->mutex
 in anon_pipe_write
To: Breno Leitao <leitao@debian.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Shuah Khan <shuah@kernel.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	usama.arif@linux.dev, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2026 at 5:38=E2=80=AFPM Breno Leitao <leitao@debian.org> wr=
ote:
>
> Also, I am not reusing the leftover pages back to pipe->tmp_page, given
> I really don't expect to have much leftovers, but, I am happy to do so,
> in case you think this would be useful.
>

Since on the allocation side you do take from tmp_page, a big write
ends up depleting it, afterwards you free up whatever preallocated
pages.

If this is followed by a small write, that small write now has to
suffer allocation *with* the lock held, bringing the original problem.
Easiest way out is to take from preallocated pages before looking at
tmp_page.

I do suspect the best way forward in the long run is repopulate the
tmp_page array if you have pages to do so.

> commit 2394068de8ee0ab9e582ce9776990ed695397553
> Author: Breno Leitao <leitao@debian.org>
> Date:   Fri May 15 01:35:13 2026 -0700
>
>     fs/pipe: bulk pre-allocate pages outside pipe->mutex in anon_pipe_wri=
te
>
>     anon_pipe_write() takes pipe->mutex and then, from the per-iteration
>     anon_pipe_get_page() helper, used to call alloc_page(GFP_HIGHUSER |
>     __GFP_ACCOUNT) once per page while still holding it. That allocation
>     can sleep doing direct reclaim and/or runs memcg charging, which exte=
nds
>     the critical section and stalls a concurrent reader on the very same
>     mutex.
>
>     For writes that span more than one full page, bulk pre-allocate up to
>     PIPE_PREALLOC_MAX (8) pages with alloc_pages_bulk() before taking
>     pipe->mutex. anon_pipe_get_page() consumes from pipe->tmp_page[] firs=
t,
>     then from the prealloc array, and only falls back to alloc_page() und=
er
>     the mutex for writes larger than PIPE_PREALLOC_MAX pages (rare) or fo=
r
>     single-page writes. Sub-PAGE_SIZE writes are unchanged: the merge pat=
h
>     handles them without needing a fresh page.
>
>     The prealloc array, its count, and the helpers operating on it live i=
n
>     struct anon_pipe_prealloc:
>
>       - anon_pipe_get_page_prealloc() issues a single alloc_pages_bulk()
>         call before the mutex is taken.
>       - anon_pipe_free_pages() runs after mutex_unlock() and put_page()s
>         any leftover prealloc pages, keeping put_page() off the critical
>         section. Leftovers happen when the per-pipe tmp_page[] cache or t=
he
>         merge path covered some of what we preallocated, or when the writ=
e
>         exits early.
>
>     This can improve the pipe throughput up to 48% and reduce the latency=
 in
>     33%.
>
>     Suggested-by: Mateusz Guzik <mjguzik@gmail.com>

I have not suggested preallocation, so this credit is not warranted.

>     Signed-off-by: Breno Leitao <leitao@debian.org>
>
> diff --git a/fs/pipe.c b/fs/pipe.c
> index 9841648c9cf3e..a6441c44f1e3f 100644
> --- a/fs/pipe.c
> +++ b/fs/pipe.c
> @@ -111,7 +111,32 @@ void pipe_double_lock(struct pipe_inode_info *pipe1,
>         pipe_lock(pipe2);
>  }
>
> -static struct page *anon_pipe_get_page(struct pipe_inode_info *pipe)
> +#define PIPE_PREALLOC_MAX 8
> +
> +struct anon_pipe_prealloc {
> +       struct page *pages[PIPE_PREALLOC_MAX];
> +       unsigned int count;
> +};
> +
> +/*
> + * Bulk pre-allocate pages outside pipe->mutex. Callers must gate on
> + * total_len > PAGE_SIZE; single-page writes are handled by the in-lock
> + * alloc_page() fallback. Any pages not consumed by the write loop are
> + * freed by anon_pipe_free_pages() after the mutex is dropped.
> + */
> +static void anon_pipe_get_page_prealloc(struct anon_pipe_prealloc *preal=
loc,
> +                                       size_t total_len)
> +{
> +       unsigned int want =3D min_t(unsigned int,
> +                                 DIV_ROUND_UP(total_len, PAGE_SIZE),
> +                                 PIPE_PREALLOC_MAX);
> +
> +       prealloc->count =3D alloc_pages_bulk(GFP_HIGHUSER | __GFP_ACCOUNT=
,
> +                                          want, prealloc->pages);
> +}
> +
> +static struct page *anon_pipe_get_page(struct pipe_inode_info *pipe,
> +                                      struct anon_pipe_prealloc *preallo=
c)
>  {
>         for (int i =3D 0; i < ARRAY_SIZE(pipe->tmp_page); i++) {
>                 if (pipe->tmp_page[i]) {
> @@ -121,6 +146,15 @@ static struct page *anon_pipe_get_page(struct pipe_i=
node_info *pipe)
>                 }
>         }
>
> +       if (prealloc->count) {
> +               unsigned int idx =3D prealloc->count - 1;
> +               struct page *page =3D prealloc->pages[idx];
> +
> +               prealloc->pages[idx] =3D NULL;
> +               prealloc->count =3D idx;
> +               return page;
> +       }

I would drop the idx var.

*maybe* swap macro can help here

> +
>         return alloc_page(GFP_HIGHUSER | __GFP_ACCOUNT);
>  }
>
> @@ -139,6 +173,17 @@ static void anon_pipe_put_page(struct pipe_inode_inf=
o *pipe,
>         put_page(page);
>  }
>
> +/* Called after pipe->mutex is dropped, to keep put_page() off the criti=
cal section. */
> +static void anon_pipe_free_pages(struct anon_pipe_prealloc *prealloc)
> +{
> +       while (prealloc->count) {
> +               unsigned int idx =3D prealloc->count - 1;
> +
> +               put_page(prealloc->pages[idx]);
> +               prealloc->count =3D idx;
> +       }
> +}
> +
>  static void anon_pipe_buf_release(struct pipe_inode_info *pipe,
>                                   struct pipe_buffer *buf)
>  {
> @@ -438,6 +483,7 @@ anon_pipe_write(struct kiocb *iocb, struct iov_iter *=
from)
>         ssize_t chars;
>         bool was_empty =3D false;
>         bool wake_next_writer =3D false;
> +       struct anon_pipe_prealloc prealloc =3D {};
>

I forgot this bit is going to be a problem with gcc. I verified it
emits rep stosq in place, which is going to completely unnecessarily
slow things down especially on older uarchs. This is a known bug with
gcc doing terrible job optimizing this.

The problem will be avoided by merely initializing the count to 0.
which looks kind of ugly if done here, but see below.

>         /*
>          * Reject writing to watch queue pipes before the point where we =
lock
> @@ -455,6 +501,18 @@ anon_pipe_write(struct kiocb *iocb, struct iov_iter =
*from)
>         if (unlikely(total_len =3D=3D 0))
>                 return 0;
>
> +       /*
> +        * Bulk pre-allocate pages outside pipe->mutex for writes that sp=
an more
> +        * than one full page. alloc_page() with GFP_HIGHUSER may sleep d=
oing
> +        * reclaim and runs memcg charging, so doing it under the mutex
> +        * extends the critical section and stalls the reader. The merge =
path
> +        * handles sub-PAGE_SIZE writes without a fresh page; single-page=
 and
> +        * >PIPE_PREALLOC_MAX-page writes fall back to alloc_page() under=
 the
> +        * mutex for the remainder.
> +        */
> +       if (total_len > PAGE_SIZE)
> +               anon_pipe_get_page_prealloc(&prealloc, total_len);
> +

I don't think this comment belongs here, it should move above the
prealloc routine.

How about this: anon_pipe_get_page_prealloc gets called
unconditionally and expects an uninitialized prealloc struct. For
total_len > PAGE_SIZE you roll with the current code. Otherwise you
just set ->count to 0, which prevents the ->pages array from being
looked at. You can even pre-set to 0 on entry, just don't memset the
entire obj.

>         mutex_lock(&pipe->mutex);
>
>         if (!pipe->readers) {
> @@ -512,7 +570,7 @@ anon_pipe_write(struct kiocb *iocb, struct iov_iter *=
from)
>                         struct page *page;
>                         int copied;
>
> -                       page =3D anon_pipe_get_page(pipe);
> +                       page =3D anon_pipe_get_page(pipe, &prealloc);
>                         if (unlikely(!page)) {
>                                 if (!ret)
>                                         ret =3D -ENOMEM;
> @@ -579,6 +637,7 @@ anon_pipe_write(struct kiocb *iocb, struct iov_iter *=
from)
>         if (pipe_is_full(pipe))
>                 wake_next_writer =3D false;
>         mutex_unlock(&pipe->mutex);
> +       anon_pipe_free_pages(&prealloc);
>
>         /*
>          * If we do do a wakeup event, we do a 'sync' wakeup, because we
