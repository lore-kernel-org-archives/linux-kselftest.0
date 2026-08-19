Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430FF3368BD;
	Wed, 19 Aug 2026 13:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787147294; cv=none; b=LXfPJN7eNNU4BMd1DGTsblE56W1jPagG9mpUTbUDS8rlsRYIlNcJ2hqMM2wfSy7Tz/3K8mzOLeqvO4NoHe+Xcy1DDeglCxILNvgFcAsI8/SvrFXXp27EfpmKZYQNctlnVoM7p7T8jPc6jPDzzCRc3+HFEon6hdZ88pldgx4/flA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787147294; c=relaxed/simple;
	bh=UVRw1fu0B8Ctcz1/a8YqaBLNPF+Krtdu5nk2iXdycqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c4B0WxDiC4L6kyQBj6NUfVqSY/pD3LhrHQ8uU2KiVaBt2ECeICOSGDnvsrRuZM0kvRKuZ1Qs5xWTmhagVpUmJV2FujwQ9fxdUbpSwmREdIDVUbXan8888fNAmenzdEssY7tfQYEm/mJe8ds6T8YoPyKmVzrNmq5zRRHeZ3M5bSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=GqYFNt4q; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=bXYbx99A; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=etk9K476; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=pXl7vQ/j; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="GqYFNt4q";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="bXYbx99A";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="etk9K476";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="pXl7vQ/j"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E3FC63E58;
	Wed, 19 Aug 2026 13:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1787147283; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NQEX4oeo4rqbzT7vGiKmt7h632aZft2fmcG+U9QUHZs=;
	b=GqYFNt4qNp9FiF7i4t9aM5jSvdhKBKwjXzwbxRGkIsGnHVQeU25vfvBj7fPNUV5oyjZdWo
	2cfdTvtXKwW/4bZhbVF+z8IRaS1q71CUxVT2V/p9tyAVPXVYvQCN9KkrB061prohK8jiAD
	OSmMRW7iI+sLYpd22kfQ94sxY+6zhAA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1787147283;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NQEX4oeo4rqbzT7vGiKmt7h632aZft2fmcG+U9QUHZs=;
	b=bXYbx99AQHu1nAIitY0cIYRL7Cv2xdqxtzGg0xdxbbs0JKe6kvskvJr9izYcnkLAOd+92h
	pUyXtPctHwV7dlAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=etk9K476;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b="pXl7vQ/j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1787147278; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NQEX4oeo4rqbzT7vGiKmt7h632aZft2fmcG+U9QUHZs=;
	b=etk9K476Eta0CnYtRSQ7hGOx6PIItSY6RsSsch7ILl4F4zSKZuCnpPglhtfsl4upBZxqPR
	OCNXuy3y7lt2UGQtPRdISvIbQncmDvQrO8JEtON0HiplJlYzJZJKewEJnxcOj08+oXHeHK
	s7i3EjwJtNdDPf2ULQbLN0RIQs/9jss=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1787147278;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NQEX4oeo4rqbzT7vGiKmt7h632aZft2fmcG+U9QUHZs=;
	b=pXl7vQ/jwFEZncnMhQfAFYaeNXVf/9UaG/55dlMwIsWKFD29C7MqYAdU92vw+ApIQoM7as
	v9kcpR0pZOFnuKBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D3601362E;
	Wed, 19 Aug 2026 13:47:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GmGWMw60hWrQXQAAD6G6ig
	(envelope-from <jack@suse.cz>); Wed, 19 Aug 2026 13:47:58 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 75318A13B2; Wed, 19 Aug 2026 15:47:58 +0200 (CEST)
Date: Wed, 19 Aug 2026 15:47:58 +0200
From: Jan Kara <jack@suse.cz>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Jimmy Zuber <jamz@amazon.com>, Shuah Khan <shuah@kernel.org>, 
	fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Jan Kara <jack@suse.cz>, Joanne Koong <joannelkoong@gmail.com>, 
	Brian Foster <bfoster@redhat.com>
Subject: Re: [PATCH 1/2] fuse: zero the partial EOF page when extending a file
Message-ID: <jgowolx6ax3yz7q4fm76gyhhcmea5ahljxhbnncr2qspqzhujg@vb3tiqln6led>
References: <20260731203842.540798-1-jamz@amazon.com>
 <20260731203842.540798-2-jamz@amazon.com>
 <CAJfpegseDzOV1jH5eE2LcbWJAuY2hQmdS1xwBmZCMXk4D3D+=g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJfpegseDzOV1jH5eE2LcbWJAuY2hQmdS1xwBmZCMXk4D3D+=g@mail.gmail.com>
X-Spam-Score: -4.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: E3FC63E58
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[amazon.com,kernel.org,lists.linux.dev,vger.kernel.org,suse.cz,gmail.com,redhat.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.cz:+];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.cz:dkim,suse.com:email]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Hello!

On Wed 19-08-26 11:29:50, Miklos Szeredi wrote:
> On Fri, 31 Jul 2026 at 22:39, Jimmy Zuber <jamz@amazon.com> wrote:
> > Extending a fuse file past a non-page-aligned EOF does not zero the tail of
> > the old last page.  If that page is cached and was dirtied beyond the old
> > EOF -- e.g. an application mmap()ed the EOF page and stored into the region
> > past EOF, which is undefined until the file grows -- the now in-bounds tail
> > is exposed to subsequent reads as stale data instead of zeros, in violation
> > of POSIX file-extension semantics.
> >
> > Other filesystems zero this via pagecache_isize_extended(), but that helper
> > is a no-op for fuse: it returns early when i_blocksize() >= PAGE_SIZE, and
> > a non-fuseblk fuse mount has s_blocksize == PAGE_SIZE (the server-supplied
> > st_blksize only sets fi->cached_i_blkbits, not i_blkbits).  The NFS client
> > hit the same problem and open-codes the zeroing in
> > nfs_truncate_last_folio(); add the equivalent fuse_zero_partial_eof_folio()
> > and call it from the three paths that extend a file: a buffered write, a
> > size-extending setattr/truncate, and a size-extending fallocate
> > (fuse_write_update_attr(), fuse_do_setattr() and fuse_file_fallocate()).
> >
> > writeback_cache connections are unaffected, as their writes go through
> > iomap_file_buffered_write(), which zeroes post-EOF folios.  The bug is
> > observable on a non-writeback_cache server that returns FOPEN_KEEP_CACHE on
> > writable files (without FOPEN_DIRECT_IO), and is caught by the new
> > write_extend_eof fuse selftest.
> >
> > Signed-off-by: Jimmy Zuber <jamz@amazon.com>
> > ---
> >  fs/fuse/dir.c    |  3 +++
> >  fs/fuse/file.c   | 56 ++++++++++++++++++++++++++++++++++++++++++++++++
> >  fs/fuse/fuse_i.h |  1 +
> >  3 files changed, 60 insertions(+)
> >
> > diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> > index 795e92037ce7..f6614ccef186 100644
> > --- a/fs/fuse/dir.c
> > +++ b/fs/fuse/dir.c
> > @@ -2282,6 +2282,9 @@ int fuse_do_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
> >          */
> >         if ((is_truncate || !is_wb) &&
> >             S_ISREG(inode->i_mode) && oldsize != outarg.attr.size) {
> > +               if (outarg.attr.size > oldsize)
> > +                       fuse_zero_partial_eof_folio(inode, oldsize,
> > +                                                   outarg.attr.size);
> >                 truncate_pagecache(inode, outarg.attr.size);
> >                 invalidate_inode_pages2(mapping);
> >         }
> > diff --git a/fs/fuse/file.c b/fs/fuse/file.c
> > index cb8da4c06d17..a9063b4e9217 100644
> > --- a/fs/fuse/file.c
> > +++ b/fs/fuse/file.c
> > @@ -21,6 +21,8 @@
> >  #include <linux/splice.h>
> >  #include <linux/task_io_accounting_ops.h>
> >  #include <linux/iomap.h>
> > +#include <linux/highmem.h>
> > +#include <linux/rmap.h>
> >
> >  static int fuse_send_open(struct fuse_mount *fm, u64 nodeid,
> >                           unsigned int open_flags, int opcode,
> > @@ -1200,20 +1202,64 @@ static ssize_t fuse_send_write(struct fuse_io_args *ia, loff_t pos,
> >         return err ?: ia->write.out.size;
> >  }
> >
> > +/*
> > + * An operation extended i_size past a non-folio-aligned old EOF at @from,
> > + * turning [@from, @to) into a hole that must read back as zero.  If the old
> > + * last folio is cached and was dirtied beyond the old EOF (e.g. mmap stores
> > + * into the post-EOF region, which are undefined until the file grows), zero
> > + * that tail so it is not exposed as stale data (xfstests generic/363).
> > + *
> > + * pagecache_isize_extended() cannot be used: it bails out for
> > + * i_blocksize() >= PAGE_SIZE, and a non-fuseblk mount has
> > + * s_blocksize == PAGE_SIZE, so the zeroing has to be done here.
> > + * Callers hold i_rwsem, serialising this against concurrent writes and
> > + * truncates; it must not run under fi->lock, as it locks the folio.
> > + */
> > +void fuse_zero_partial_eof_folio(struct inode *inode, loff_t from, loff_t to)
> > +{
> > +       struct folio *folio;
> > +       size_t offset, end;
> > +
> > +       if (from >= to)
> > +               return;
> > +
> > +       folio = filemap_lock_folio(inode->i_mapping, from >> PAGE_SHIFT);
> > +       if (IS_ERR(folio))
> > +               return;
> > +
> > +       if (folio_mkclean(folio))
> > +               folio_mark_dirty(folio);
> > +
> > +       if (folio_test_dirty(folio)) {
> > +               offset = offset_in_folio(folio, from);
> > +               end = min_t(loff_t, to - folio_pos(folio), folio_size(folio));
> > +               folio_zero_segment(folio, offset, end);
> > +       }
> > +
> > +       folio_unlock(folio);
> > +       folio_put(folio);
> > +}
> > +
> 
> While the fix is probably correct, I'm not happy with it.
> 
> Why does pagecache_isize_extended() not handle blocksize >= PAGE_SIZE?

Because originally it didn't do any zeroing. It was only used to
writeprotect the tail page so that the filesystem could allocate missing
blocks under mmaped page after i_size extension which makes sense only when
blocksize < pagesize. Then Brian added the zeroing in commit 52aecaee1c264
("mm: zero range of eof folio exposed by inode size extension") mostly
because it was a convenient place where to add it. For standard disk-based
filesystems the zeroing is needed only when bs < PAGE_SIZE because the
zeroing of the tail block gets handled by the filesystem itself in a
different place.

> Where does straddling folio zeroing happen for other filesystems?

It is generally done by the filesystem. E.g. for extending writes XFS
zeroes from xfs_file_write_checks() -> xfs_file_write_zero_eof(), ext4 from
ext4_write_checks() -> ext4_block_zero_eof(). Similarly for extending
truncate e.g. ext4_setattr() calls ext4_block_zero_eof().

I agree the zeroing is kind of messy and could use some standardization
(especially because it's a corner case people rarely think about and as a
result we had several issues in this area over the years in various
filesystems). But it's a bit tricky because of fs-specific needs (locking,
journalling) for the tail block update and also because this is somewhat
performance sensitive path so you don't want to do too much needless work
due to abstraction.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
