Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA30A2DA74C
	for <linux-kselftest@vger.kernel.org>; Tue, 23 Jun 2026 15:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782228902; cv=pass; b=muNCo3UmhH0KMeNVYC3WieNhMGy45ADv2q+hJUCWbYzNBlUv2437ETqB6GA8NB1S3QKD5JjMmyhVO7RaBM+Eimn9/5XGWWxfNn//AQua7dkUrXhu91gxQu1rf1wuPl/UwGLp3LDPtrHmEDcGVjGFt29MWrQhioRQxzlMtqnGaxk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782228902; c=relaxed/simple;
	bh=F5jxOgOxeIGxOiAIJVL5hSxhOncVvBstJWDCLkelQbQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rd2f/5vaEKl8BvZsW3gIz9TK15l2jSt/aNE/nVN6TT4GQlhZ10Ot1jLxcefoX++iWkPUQswnRMvYlvQR7XKFRYDh20wAHTlT2X+34ab7q84xLC3MLCs1M0v9i5g9Q/udsu6390CJq+z4/zaKf7lxwv7bZEycLOIQnulDqKCxDug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rQ8WPs7M; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rQ8WPs7M"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6974a6e54dbso7863896a12.2
        for <linux-kselftest@vger.kernel.org>; Tue, 23 Jun 2026 08:35:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782228899; cv=none;
        d=google.com; s=arc-20240605;
        b=FzlFs8zSsN1LECq5FCOefmnGBF50GXoG2R2u/Y/K3zVto41jjLh4ZhWHg3sCb+6ccl
         UcGaCJRTg2U/lcxTrwxEYtr+6mkhiEv3SVkjGFz8n5leHX6MMLEkLIKeoDofZRJrpe1Q
         CrBXdB/2/G22Rs5i49K7em4BnehmlhxHSNVPeDGrb8PfyiaLiIM8eMYr8J6xxoEw6stU
         ycV1M1HbrCtNUL15jdLU9cVxbcG1r8K6+HP3cJI3ryHxPjpq45Ebns9nIAsSZvKIIuue
         cE7PFKyXvWmXZk6zWOgaEIo1f7Eu5yaAIommes9JM0pJ/HRazgIf3QEVnOou9IABHTJ4
         L0EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jGc5O48HR7pepVvOkH86p+d+WQn7/E2BGrsqzSwA0sE=;
        fh=IMY7vZCWt4Y910UENYQ36hVrqVrcAq8xafOZX5kYxBY=;
        b=Wk533oSA/USt7FLDYKevDwA/84Or+CHAgUCTBzbcng1A+1GLTGPrpBlskFyWAN8S83
         WvYC/T0/JKPP/E/h6YFleFpGVWhI+4RHdaDxTkVg70jipD9isPwQfMkJbwq2ddzpVkvh
         v1u9NXjzDUaK2UCXAe14IyrNabJXryzI8A8kRE/lBtsaSYI8y+aJB0WmZDiMaV756xeK
         UCrFDzQBBAUezA3JYEcbOYWfo5p89VUQ3Dub+fZHJdnOG65ZEEPp3yK5z17nABIeWaWH
         qO4vqJkvlLb75aeHyOWgaSkSG7QQGdLAgIhP0TSpO1xEApaDVZbDQiv/zejbsenVw7/N
         zKzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782228899; x=1782833699; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jGc5O48HR7pepVvOkH86p+d+WQn7/E2BGrsqzSwA0sE=;
        b=rQ8WPs7MMgstdoLPEEQHPzKfrSKlXdTayEAxfEKaqHXZ8R3Dfr7OR+Zov9IhAfcoqc
         LbwgrXbHiB2WQ5+HBmaLWQlV3jxkYznxSD7T39Ojx8Xw+L6zhpI2PIDqbsNH8qzkzFaQ
         +SUuHSiq3TKBJV+g1KS/eEhiL/49objPT2kGr7EAsfUdBlXOEt9/d8EwAR+ErGE87Vsn
         wWJhd8YpUr4U9ZSZ0bvsqngAq2EyGFHcJPgykxQKqaswZkiaZUmadADo/sEI05deBjy+
         J3SRo69S04IXqY9Rz5fMPQC6wLOsOS66F0nTc9lAuE+3b1Q0jMZHOhKBKIV1pwll89T4
         g6iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782228899; x=1782833699;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jGc5O48HR7pepVvOkH86p+d+WQn7/E2BGrsqzSwA0sE=;
        b=Rjktg4U0HIoOoTgcUh6F03sC7Dw4AELCaDBSrpJFtYZy6jydFvMSAtJi3kHUUSjgFR
         dp4T5Cmf36hj/5j7li6klT33AREKj69FekoEv9ghudf5+wWJ6TyJxv95WycCFyoOE3JP
         7zE7WNHXMkkiZ49NpTXalvMbCR+QUZd1oFBuWg0TLLHj45Z9WQlcqcpvlW8ZCN9ZRIPN
         voq9v10rkfb1MqexzUOjDE6Ij0+0z2wHpW9t2bLer2PrkQlOoaFlIxMKSywoNe9FInWn
         MGKM0v1vuhpT0443fUvJCRu2mxBKL7ZeyrtU5YqgO1eUUcBOyXX9pYBNT1YZhQDteQ0K
         U0nw==
X-Forwarded-Encrypted: i=1; AFNElJ8Z038jshSa4+MrP7iECIEmwA5mjHnY6/PD7xaMeMhdo8cmyuYXO2xYHJYhBbaGwzy8xYdNPdQKel8hd35KFQU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDLoXvRSqxJdmov+r9eetIY93mEDh3UuJi7eEWeo9vOegKH4aG
	Dckjlw1ryBfgbIgr6Bw26qmovNuvoxvJUrl4iKUtdgIrIIVL301io9Ak+k4BVZvyNBcPuwXQa83
	qrcm2y7ZNbC88bDmmWh81j7oJCj7DTNo=
X-Gm-Gg: AfdE7clJiIE1whcUdGDLvsLvk68ursGG2eSOJlT7E3H3REiUI62GCdnfiHPdanS4mYr
	NPvVGQkv9U40h2KvUBbB2HRYeD0NziBTy3mgJNLGP1J14gjG/RdVuBFlkBm6hmeRfMJ9WcJphbr
	9vT3ciFiUa17DZUooTsbE+/VeujwpFLp8BXwWWwBjeNE/tw9t4HExLVEKvz7BH7DNvmywlhilMY
	peNrQOiXs0Nn9iWgpbLye5D8IJAaH/CZNOCsa6doouw2k0jpj263IpmM1ZBaj80dcEbSfEMWXW5
	eUVKgg3fcamD4pa1OgHFYjcoQNGZF5U=
X-Received: by 2002:a05:6402:3205:b0:687:7fa4:faa0 with SMTP id
 4fb4d7f45d1cf-69711e0602bmr1457590a12.23.1782228898944; Tue, 23 Jun 2026
 08:34:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260623111533.2285005-1-ptikhomirov@virtuozzo.com>
 <20260623111533.2285005-2-ptikhomirov@virtuozzo.com> <ajqOyIA8tPQsxfz6@cmpxchg.org>
 <3f6392aa-c1f6-4263-8892-978dacbbd8ca@virtuozzo.com>
In-Reply-To: <3f6392aa-c1f6-4263-8892-978dacbbd8ca@virtuozzo.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 23 Jun 2026 17:34:47 +0200
X-Gm-Features: AVVi8Cecv2_TqQ_O8FYC-won9z3vUEfkkWOTSNMZJamaSksyTs_hA8rdhn2B_co
Message-ID: <CAOQ4uxhras5YAr8_HBpuHSDwvfiEF8vAr0NDB0R_PXtGDhnqjQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] fs, mm: add ->cachestat() file operation
To: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Miklos Szeredi <miklos@szeredi.hu>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Nhat Pham <nphamcs@gmail.com>, Shuah Khan <shuah@kernel.org>, linux-unionfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2026 at 4:55=E2=80=AFPM Pavel Tikhomirov
<ptikhomirov@virtuozzo.com> wrote:
>
>
>
> On 6/23/26 15:48, Johannes Weiner wrote:
> > On Tue, Jun 23, 2026 at 01:14:48PM +0200, Pavel Tikhomirov wrote:
> >> The cachestat() syscall reads page cache statistics straight from the
> >> file's f_mapping. Stackable filesystems such as overlayfs keep the dat=
a
> >> pages in an underlying inode's mapping rather than in the overlay
> >> inode's, so cachestat() reports all zeroes for them.
> >>
> >> Add a ->cachestat() file operation and route the syscall through a new
> >> vfs_cachestat() helper that calls it when present, falling back to
> >> file's f_mapping otherwise. This lets stackable filesystems forward th=
e
> >> query to the file that actually owns the page cache. No behaviour chan=
ge
> >> for regular files.
> >>
> >> Signed-off-by: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
> >> ---
> >> Note: Memset change might be a bit tricky, I moved it to no
> >> ->cachestat() path to avoid multiple memset on nested overlayfs, that
> >> means that ->cachestat() is expected to be able to handle unitialized
> >> cs.
> >> ---
> >>  include/linux/fs.h | 10 ++++++++++
> >>  mm/filemap.c       | 43 +++++++++++++++++++++++++++++++++++--------
> >>  2 files changed, 45 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/include/linux/fs.h b/include/linux/fs.h
> >> index 6da44573ce450..966b6564707e4 100644
> >> --- a/include/linux/fs.h
> >> +++ b/include/linux/fs.h
> >> @@ -53,6 +53,8 @@
> >>
> >>  struct bdi_writeback;
> >>  struct bio;
> >> +struct cachestat_range;
> >> +struct cachestat;
> >>  struct io_comp_batch;
> >>  struct fiemap_extent_info;
> >>  struct kiocb;
> >> @@ -1963,6 +1965,8 @@ struct file_operations {
> >>                                 struct file *file_out, loff_t pos_out,
> >>                                 loff_t len, unsigned int remap_flags);
> >>      int (*fadvise)(struct file *, loff_t, loff_t, int);
> >> +    int (*cachestat)(struct file *file, struct cachestat_range *csr,
> >> +                     struct cachestat *cs);
> >
> > I suppose you can't just have it return the real file because of the
> > with_ovl_creds() scope you need during access?
>
> Yes, AFAIU in overlay when we use realfile we should always use it
> with_ovl_creds(), even though I don't think there is anything cred relate=
d
> in filemap_cachestat(), I still think we should follow the common pattern
> other overlay helpers use (similar to ovl_fadvise() and ovl_flush()).
>
> note: Actually some places get ovl_real_file() and use it without
> with_ovl_creds(), e.g.: ovl_read_iter, ovl_write_iter, ovl_splice_read,
> ovl_splice_write. But those look more of an exception than the general
> rule. All other instances use with_ovl_creds().

Use with_ovl_creds() is a good practice to keep the mental security model,
but it is useless if the security check (can_do_cachestat) is not in the
vfs helper (vfs_cachestat), so please move it there.

Also it kind of makes more sense to check (flags !=3D 0) in sys_cachestats
before checking permissions.

>
> Also there are simingly no other file_operations which return "realfile"
> for further processing, mostly the operation from fsops simply replaces
> general operation with its own logic completely.
>
> Thanks for your review!
>
> ps: Hope overlay maintainers will correctly if I'm getting this wrong.
>

I don't think this is wrong per-se, except for can_do_cachestat().

Just be aware that the real file could change from one cachestat
call to the next (i.e. due to copy up).

Thanks,
Amir.
