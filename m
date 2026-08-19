Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8328143E063
	for <linux-kselftest@vger.kernel.org>; Wed, 19 Aug 2026 09:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787131809; cv=pass; b=Kj9V3vS3FjupcWXtpvbniLWdI4zJMR50XkWV/6bN1ZeX71r6wNKnI2ICV8ftEo78Wk2R4GMCoH9aiLXopW0NfwsJj7zCIhzQlHAmsOBiHp4narbUP9McOi/e5fWYbDKz2ZDPlnaY9qKuNZABD+21AWdlocxMJmQu1X5ISZwuJHs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787131809; c=relaxed/simple;
	bh=bcUMXJwuUktcvgwIKXAVppvHnpckok2yRi3o46yECE8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mVu/16Dn8EG4PPO6EQq2bRnwneXrVO9fLCA2H1xsa1jJtjkuaxU2XaCcVuG+4Ls59F2n2lgLcuueSKr23Epupkgj21se+ZSWJQllSaE/316b6iq1+XOnEMVdLghlTBNizPKD/nqZ7W6bv4f4DzQIHrpcrop915OrljlzpHw/Nb4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=QLy2A856; arc=pass smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="QLy2A856"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-92e6a434cabso50336885a.1
        for <linux-kselftest@vger.kernel.org>; Wed, 19 Aug 2026 02:30:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787131803; cv=none;
        d=google.com; s=arc-20260327;
        b=Y9K9WapxBDM/x6iZ51Bfg1TCG69R917eKK6JqNf9Gv5XXZaxlyKax79k4UF33tBu75
         XmmXS8jDdQuRvHthEJfAoYkvEEcGFFh+KRWdLg0rHx/Z6Tcy8KuKnMbgMSzV6gLPwDa3
         I4BTL1sPf0hTKjSXVaJ4xWJJ87p9HG4Y0BTOzAPStgOkAhr43EOOFjSnES+P3Po8YogF
         Fl075dC631tmnPQUvAZrSPES+5+RzgHJ3rzgz3sZkEnxPt0qlAkkumnFUbK9Hi/SdnWF
         7Vu3441f5CSrs9atUvQAIw8lnoLskgWZR8gFAE0MC7s+DZbT3lu2qbUoO2JUBWRhp8Ds
         lHxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1VHXApI477fbl4kLMpkCKvnquBrNIiEH86cTaeDa/W0=;
        fh=RAhrG9kF/xHMfa/LJu3pZFWp+AdOBAtA8zaHLOgpALg=;
        b=NMTIeYoL5mha/UcMK3j2fSm0U5K9bEAtvTAgi9aXI84knGcGBaba5dh/xxjuKJZBM8
         p3WwRE3U4JiMa3ouSkFVI6AML/Wnp/bv/2LKaXCFd/j+/Kjb+cGKB17hVvmWfO6xQ7Dr
         cnnc9w/PqZbZzCyH6GuJGENom1/6JtQkCHlY/kdN1EXLlu8sBpXMCR+SVuyVm941BQmm
         N5q00FuJ4ny5HSbGRX1KkckkMK2XWxCqM9hQbGEx4d2BT6y2H/uw6tjdTygPXnvgqRLS
         0utb+fPF2ZFazG/BrR1qrqcVPgAYbZw4m5P9AniUeM7TasIAAcz8Gt090AlqEXDrJcDe
         KmYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1787131803; x=1787736603; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1VHXApI477fbl4kLMpkCKvnquBrNIiEH86cTaeDa/W0=;
        b=QLy2A8568ZA9AfqEnHcf54aNNAA1Tz86cABTq9/QslvD006HR8cQEkIfa7zDPMbbwM
         eQZzy7hMComUSTGCX2PnvYHYHR/kHx6NNvolaMV5GZ56nPqwY4b2dJFOuGbK+kPoay67
         XOg0EuSF9SxXDShQVwvnzmHSFym1+OJ35AMrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787131803; x=1787736603;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1VHXApI477fbl4kLMpkCKvnquBrNIiEH86cTaeDa/W0=;
        b=l65qyk23FomRhjUQ1Q1m56BCbHfgfHrYJJIaGwoxIX3jidvh2t3raXxU6OBek7xYIm
         o1oz6hfCoNRNgX4J1Yt1J52F8b8r3u8ca05N90IhMZ7KDLp6huSz/3RNHntTHvbrLTB7
         9xn+mPJ54AfZ7x7W7j9UBlxUhvFG7LiwuxBNlyb2GIye8f2oipQ/rjiO0gJzuDqmYYlZ
         kue8PKn1qRKM8G3KaIYHrgEESYzkGeQP7EPNW/vR3BGap9pxMT4EGbjdjco+Uw3NgXpW
         8B4bgWWzIanKkjnGkEt9uqD/jEXCx5DYhxuVNsRKBxcdOQvOpfh9pvhov9a+b8jQQYeg
         4QDA==
X-Forwarded-Encrypted: i=1; AHgh+RqET/R4NHHu9qsgKI49X+DlWcY2Zi6FpdBimcMrMyLkzX4I3+BImH+OwcKpUu63Dms6dlKoiHTTf2L2N3SI5ts=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbcjSk9OGDIfmuxiuUYfCrJtIzNN7QIbtG2kziIbIZJiKCuM1z
	okhr4IMJ8LTpP4mqQabkdED9Lj6ceiRI7M9EflKPrjzCu9QhgArlpGOAqZ4jqraItSx0K6b/tJe
	yE4ddrdx1ddhmUhIROiamb6Ikq3xdt3VjZBeAlvFz1r/+O4vQ1JW8v2U=
X-Gm-Gg: AR+sD10OB2RVNtZsxde8X3cxA4e5DigT+rFv3bAkyQS8FKAmhLFvGcArjEEGzxAMXQ7
	39LpERLiYiHqfiMVjL70uq6IWlY6qBSVcRJ32GBugNuNxzGmjU0fhHXzdrXe8Jeb3NKYpgugJGg
	ehy/QZEW5DPy4hJRG1dhiA9YTXOAobqopTgLk0oefyYQea5WHPblpS1RctK7fJrsHARBHfs3U0b
	SI7T1rFOB06MRYvEK1fqeVaRthL/ZZkPiFjd7UnfTFEvs6dak5y1+PQV2dWFoYOjMYVLY7pZyS3
	0/lBqLwQ6j5ZZ4sDjZURGflxOrHztWgv/B0ezAGyf+BMgoZa5amiLW1aBy+VTLSw8SdbPmnG7CM
	1
X-Received: by 2002:a05:620a:271b:b0:914:bb06:288 with SMTP id
 af79cd13be357-9371e63648cmr329217985a.22.1787131802541; Wed, 19 Aug 2026
 02:30:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731203842.540798-1-jamz@amazon.com> <20260731203842.540798-2-jamz@amazon.com>
In-Reply-To: <20260731203842.540798-2-jamz@amazon.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 19 Aug 2026 11:29:50 +0200
X-Gm-Features: AcwNN1VAONJkLQZjWH9ox-1mbX0uX4NtpafQdS87YDhNU3mV00rqBfJE5c5YvNw
Message-ID: <CAJfpegseDzOV1jH5eE2LcbWJAuY2hQmdS1xwBmZCMXk4D3D+=g@mail.gmail.com>
Subject: Re: [PATCH 1/2] fuse: zero the partial EOF page when extending a file
To: Jimmy Zuber <jamz@amazon.com>
Cc: Shuah Khan <shuah@kernel.org>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Jan Kara <jack@suse.cz>, Joanne Koong <joannelkoong@gmail.com>
Content-Type: text/plain; charset="UTF-8"

[Cc: Jan + Joanne]

On Fri, 31 Jul 2026 at 22:39, Jimmy Zuber <jamz@amazon.com> wrote:
>
> Extending a fuse file past a non-page-aligned EOF does not zero the tail of
> the old last page.  If that page is cached and was dirtied beyond the old
> EOF -- e.g. an application mmap()ed the EOF page and stored into the region
> past EOF, which is undefined until the file grows -- the now in-bounds tail
> is exposed to subsequent reads as stale data instead of zeros, in violation
> of POSIX file-extension semantics.
>
> Other filesystems zero this via pagecache_isize_extended(), but that helper
> is a no-op for fuse: it returns early when i_blocksize() >= PAGE_SIZE, and
> a non-fuseblk fuse mount has s_blocksize == PAGE_SIZE (the server-supplied
> st_blksize only sets fi->cached_i_blkbits, not i_blkbits).  The NFS client
> hit the same problem and open-codes the zeroing in
> nfs_truncate_last_folio(); add the equivalent fuse_zero_partial_eof_folio()
> and call it from the three paths that extend a file: a buffered write, a
> size-extending setattr/truncate, and a size-extending fallocate
> (fuse_write_update_attr(), fuse_do_setattr() and fuse_file_fallocate()).
>
> writeback_cache connections are unaffected, as their writes go through
> iomap_file_buffered_write(), which zeroes post-EOF folios.  The bug is
> observable on a non-writeback_cache server that returns FOPEN_KEEP_CACHE on
> writable files (without FOPEN_DIRECT_IO), and is caught by the new
> write_extend_eof fuse selftest.
>
> Signed-off-by: Jimmy Zuber <jamz@amazon.com>
> ---
>  fs/fuse/dir.c    |  3 +++
>  fs/fuse/file.c   | 56 ++++++++++++++++++++++++++++++++++++++++++++++++
>  fs/fuse/fuse_i.h |  1 +
>  3 files changed, 60 insertions(+)
>
> diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> index 795e92037ce7..f6614ccef186 100644
> --- a/fs/fuse/dir.c
> +++ b/fs/fuse/dir.c
> @@ -2282,6 +2282,9 @@ int fuse_do_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
>          */
>         if ((is_truncate || !is_wb) &&
>             S_ISREG(inode->i_mode) && oldsize != outarg.attr.size) {
> +               if (outarg.attr.size > oldsize)
> +                       fuse_zero_partial_eof_folio(inode, oldsize,
> +                                                   outarg.attr.size);
>                 truncate_pagecache(inode, outarg.attr.size);
>                 invalidate_inode_pages2(mapping);
>         }
> diff --git a/fs/fuse/file.c b/fs/fuse/file.c
> index cb8da4c06d17..a9063b4e9217 100644
> --- a/fs/fuse/file.c
> +++ b/fs/fuse/file.c
> @@ -21,6 +21,8 @@
>  #include <linux/splice.h>
>  #include <linux/task_io_accounting_ops.h>
>  #include <linux/iomap.h>
> +#include <linux/highmem.h>
> +#include <linux/rmap.h>
>
>  static int fuse_send_open(struct fuse_mount *fm, u64 nodeid,
>                           unsigned int open_flags, int opcode,
> @@ -1200,20 +1202,64 @@ static ssize_t fuse_send_write(struct fuse_io_args *ia, loff_t pos,
>         return err ?: ia->write.out.size;
>  }
>
> +/*
> + * An operation extended i_size past a non-folio-aligned old EOF at @from,
> + * turning [@from, @to) into a hole that must read back as zero.  If the old
> + * last folio is cached and was dirtied beyond the old EOF (e.g. mmap stores
> + * into the post-EOF region, which are undefined until the file grows), zero
> + * that tail so it is not exposed as stale data (xfstests generic/363).
> + *
> + * pagecache_isize_extended() cannot be used: it bails out for
> + * i_blocksize() >= PAGE_SIZE, and a non-fuseblk mount has
> + * s_blocksize == PAGE_SIZE, so the zeroing has to be done here.
> + * Callers hold i_rwsem, serialising this against concurrent writes and
> + * truncates; it must not run under fi->lock, as it locks the folio.
> + */
> +void fuse_zero_partial_eof_folio(struct inode *inode, loff_t from, loff_t to)
> +{
> +       struct folio *folio;
> +       size_t offset, end;
> +
> +       if (from >= to)
> +               return;
> +
> +       folio = filemap_lock_folio(inode->i_mapping, from >> PAGE_SHIFT);
> +       if (IS_ERR(folio))
> +               return;
> +
> +       if (folio_mkclean(folio))
> +               folio_mark_dirty(folio);
> +
> +       if (folio_test_dirty(folio)) {
> +               offset = offset_in_folio(folio, from);
> +               end = min_t(loff_t, to - folio_pos(folio), folio_size(folio));
> +               folio_zero_segment(folio, offset, end);
> +       }
> +
> +       folio_unlock(folio);
> +       folio_put(folio);
> +}
> +

While the fix is probably correct, I'm not happy with it.

Why does pagecache_isize_extended() not handle blocksize >= PAGE_SIZE?

Where does straddling folio zeroing happen for other filesystems?

Is it done by the buffer head code?   Is it done by iomap?   What
about cases that use neither?

Thanks,
Miklos
