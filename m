Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F9C1E8320
	for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 05:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774847990; cv=none; b=IN/f0MHWP5OpZR3VjVMbqJfbrj23Q69tC+naLFCAKVODaf+BdOTFiaO6zCchzad5HW37oxuj6Hw0QIFlhUC9MgJ8zS/HFe+ZbXP30aJwljMW2OHBD+xk4BotET/rlzE9v0bC9m2gQPTcwTLyHXHQ6zPVYKs6ZeA+LMQMxii1POc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774847990; c=relaxed/simple;
	bh=CMRlhF+XecOJLTjjdvxpNhvekD/7EJYbySUXD71PSD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hHX2okJexogXsPA2l/7/gaPdlN7IqDrdR2AjiQbHoLSMTuBav033Emj5tp3vdtTECSsXDI6AHmwsYOTN9sJ8J14seCm9h7RKtpV2fnTIeD5b+p8KavXPej5g1jMtfVL+5iQWCOcMR8jnb3R8Bisay75l3L1pTU7c0t2mNzhaLPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YrYQd2N6; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qs29ROAt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YrYQd2N6";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qs29ROAt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774847987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UfzanPImVBxUZYk0hGCed0rensFpBKfhyF013Y1fyMw=;
	b=YrYQd2N6n7kr3FElBIa+enj4/vUnVXDrEHr/yx2m+LriQISmpKEbjezYSMHgrHZAncdK50
	1XoKxoa1T2gPRiu9FdYYV6NdfWpTpgXWpdQ9KDlnruGuTqnzzmn7aST8D4MbrNgtVNxzW4
	F4qvbasm4QbICDljdFb1cQ+c0tSFU3M=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-132-q0MbvOelNQKirxyE46kwBQ-1; Mon, 30 Mar 2026 01:19:46 -0400
X-MC-Unique: q0MbvOelNQKirxyE46kwBQ-1
X-Mimecast-MFC-AGG-ID: q0MbvOelNQKirxyE46kwBQ_1774847985
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35da8eb0553so605946a91.1
        for <linux-kselftest@vger.kernel.org>; Sun, 29 Mar 2026 22:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774847985; x=1775452785; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UfzanPImVBxUZYk0hGCed0rensFpBKfhyF013Y1fyMw=;
        b=Qs29ROAtOCQeqaxnuKSqppfNzt+A9w3NKkK+rkH3RVsPvXB8X5SQ0RmExVMdzd/vg/
         N0wF1383T3wDnfxavqHthamQIotR6soTGvxXeiRF8ZtjOy3Z9GbpolGkxQm9ZQCa904m
         FpgDSC9UfUx/Kjvp6T6IZW1cniNcUPB3OdiE5hNM9hUDFhT8YemZoTT/KsUPOYGl6k72
         +uv4AM451w0QmsnLsZGcNkGxIwybMpLk3VstiBPf7+qOYBKEB03N039/1hLujGAv1Xus
         ws/8U36nhyi3kq0aosKPePw4o84wPGpTCz5nHAyC2Rf50vBrIWnOQe8zLgMmDo57f6fh
         SFMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774847985; x=1775452785;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UfzanPImVBxUZYk0hGCed0rensFpBKfhyF013Y1fyMw=;
        b=kq5aOFkwn3sUSymrH+29ZYYyLLJyXeIh9UQdAuMuvJMFX6SjUgjxnbRMQhFqHGyo13
         iQH/b1UDtpk5j4WUdjYk/Lp+X/IWGCQ0pFvOVrdoi8X++SNCQa7MC46U3BHcTB9nFv0y
         KPck4o9g0765VKSG3larSUwg6LU45JK85vCKbXNZ/VPVYvyCsD8yvKUfPf+sg1IVgqKi
         kobEXyxrGUSj2i67TEZl916SS5m/2CBmKRzJu/6yoxIRlRvUxSzRCDUaSm8bGA+vMHgJ
         m0JM2oEAaM+IWK3zjQy2KBMQV+txy5304Kho84Cm4VNx5hZQFDh9b5pBffmqnifKjudy
         fVIw==
X-Forwarded-Encrypted: i=1; AJvYcCWJXBnfn9MNPEGRgxdEZ0c6umcrHy2XeN6md8aM9GanUZGXHG5n51o5GP2wRTjeZOC6x7/wyOCOCm2m0RhdJdc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl6Kn8vFreiSwtlmgYSSBH40hLMS9NG7or6cIWaGIojYBMzF5V
	5jZDkVgOWFNFhY657BZYD3VjDwRkuPpFG80WI4gQSbhPO/oRITPPdlSjLOSjSX7IXbutASQfyyX
	IQ/zDX6WjQdaWiYInNYqXnRcFQz8UoQxTFOHZB+sQLrhXaw3WjgwF/t5A9vU06MxTRUEGjw==
X-Gm-Gg: ATEYQzwvqAUvAMEXY/IgJ/h64JcUziw/0vSXp5s4dfHoFJk1xzeC/pe5EvgzPKU73S3
	2RKqvLNaVfNE5cHezTBGZcibwg8PvYEE2cUdhnWkb6OBNQ3z32YUy51eYaBPYx+LcnhB42WWkdR
	7ZVjfUkjETsj8pOAnT85LEUdscTL5gXgh7FBon5eCdTBiIBKgaD48m9aAUlFeTv8Z1K+25cZ0th
	JjysFNkrgU9MBppcP4p0b6aKSg8lRBvOwTCsDDHthmzZfGqRW4RSAbgVJxpcuUQKulB8a9/GibM
	apesPawVfaF1+Y5KfE41t5NDn873tlN7q+rfiMMNtKnFAZJIOygq02VIkrI8btXfKmlrQ0NI3Qo
	zsdyp/sEfogaPKKHx5A==
X-Received: by 2002:a17:90b:528c:b0:35d:9d7b:85ef with SMTP id 98e67ed59e1d1-35d9d7b8852mr4628499a91.6.1774847985103;
        Sun, 29 Mar 2026 22:19:45 -0700 (PDT)
X-Received: by 2002:a17:90b:528c:b0:35d:9d7b:85ef with SMTP id 98e67ed59e1d1-35d9d7b8852mr4628484a91.6.1774847984601;
        Sun, 29 Mar 2026 22:19:44 -0700 (PDT)
Received: from redhat.com ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35d9bb7cb11sm1720354a91.7.2026.03.29.22.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 22:19:43 -0700 (PDT)
Date: Mon, 30 Mar 2026 13:19:41 +0800
From: Li Wang <liwang@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-fsdevel@vger.kernel.org
Cc: rppt@kernel.org, david@kernel.org, ljs@kernel.org,
	Liam.Howlett@oracle.com, vbabka@kernel.org, surenb@google.com,
	mhocko@suse.com, shuah@kernel.org, aubaker@redhat.com,
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] selftests/mm: skip hugetlb_dio tests when DIO
 alignment is incompatible
Message-ID: <acoH7TALgBmBkk2h@redhat.com>
References: <20260327120305.58653-1-liwang@redhat.com>
 <20260327121350.858a127fa49ed6e1eb4a40a7@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327121350.858a127fa49ed6e1eb4a40a7@linux-foundation.org>

Reply Sashiko comment:

> https://sashiko.dev/#/patchset/20260327120305.58653-1-liwang@redhat.com
>
> > +	if (writesize % dio_align != 0) {
> +		ksft_test_result_skip("DIO alignment (%u) incompatible with offset %zu\n",
> +				dio_align, writesize);
> +		return;
> +	}
>
> Is this alignment check complete? 
>
> Direct I/O requires both the transfer length and the memory buffer address
> to be aligned. Later in this function, start_off is used as the buffer offset:
> 	buffer = orig_buffer;
> 	buffer += start_off;
> If start_off is pagesize / 2 (e.g., 2048) and writesize is pagesize * 3
> (e.g., 12288), writesize is a multiple of a 4096-byte alignment, so the test
> is not skipped.
>
> However, the memory buffer itself is only 2048-byte aligned. Will the
> subsequent write() still fail with -EINVAL on 4K-sector devices?

TL;DR: Yes, we should do both buffer address and writesize alignment
       checks to satisfy all FS types.

Looking at the kernel code: fs/iomap/direct-dio.c, the only alignment
check there is at line#413, which checks file's pos and write length.

EXT4:

ext4_file_write_iter
  ext4_dio_write_iter
    iomap_dio_rw
      __iomap_dio_rw
        iomap_dio_iter
          iomap_dio_bio_iter

  390	static int iomap_dio_bio_iter(struct iomap_iter *iter, struct iomap_dio *dio)
  391	{
  		...
  403
  404		/*
  405		 * File systems that write out of place and always allocate new blocks
  406		 * need each bio to be block aligned as that's the unit of allocation.
  407		 */
  408		if (dio->flags & IOMAP_DIO_FSBLOCK_ALIGNED)
  409			alignment = fs_block_size;
  410		else
  411			alignment = bdev_logical_block_size(iomap->bdev);
  412
  413		if ((pos | length) & (alignment - 1))
  414			return -EINVAL;
  415		...

Sashiko points out the buffer-address should do alignment check as well,
I firstly suspect it based on the FS extra check before the iomap_dio_rw:

ext4_file_write_iter
  ext4_dio_write_iter
    ext4_should_use_dio
       iov_iter_alignment <--- do buffer/writesize alignment check

  842 unsigned long iov_iter_alignment(const struct iov_iter *i)
  843 {
  		...
  853                 return iov_iter_alignment_iovec(i);
  		...
  865 }

  799 static unsigned long iov_iter_alignment_iovec(const struct iov_iter *i)
  800 {
  		...
  809                   res |= (unsigned long)iov->iov_base + skip;
  812                   res |= len;
		...
  818         return res;
  819 }

But eventually I found that this is only fallback to the buffer I/O
when the direct I/O is unsupported (go to: ext4_buffered_write_iter).
This wouldn't happen in the test as it open with O_DIRECT flag.

Then, I turned to look at Btrfs path:

btrfs_file_write_iter
  btrfs_do_write_iter
    btrfs_direct_write
      check_direct_IO <--- do buffer alignment check
      ...
      btrfs_dio_write
        __iomap_dio_rw <--- do samething like ext4

  778 static ssize_t check_direct_IO(struct btrfs_fs_info *fs_info,
  779                                const struct iov_iter *iter, loff_t offset)
  780 {
  781         const u32 blocksize_mask = fs_info->sectorsize - 1;
  782
  783         if (offset & blocksize_mask)
  784                 return -EINVAL;
  785
  786         if (iov_iter_alignment(iter) & blocksize_mask)
  787                 return -EINVAL;
  788         return 0;
  789 }

Yes, here I found the evendice that iov_iter_alignment(iter) & blocksize_mask)
do the alignment check.

Unlike ext4 which never reaches the check for normal files, btrfs always checks
buffer alignment for every DIO operation. And it's a hard -EINVAL, not a silent
fallback to buffered I/O.

-- 
Regards,
Li Wang

