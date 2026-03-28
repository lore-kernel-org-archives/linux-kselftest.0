Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A059A1D5CFE
	for <linux-kselftest@vger.kernel.org>; Sat, 28 Mar 2026 00:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774657745; cv=none; b=MjY9NnmWUcukHRR3hU3u5bXI8NHZWESG5uQJmPgM0BMW5otfmw5oXqIOXfN15XpwHZ+QdH87Azw+97MG3rJ8jfUa3wcTUBqucBJR0S+S9HLLbzOmzji84jNia1sgXMDHXoHC6AYE4BT0QfPTmw99soU5Gv/FJun5/XlYRih6Ufs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774657745; c=relaxed/simple;
	bh=HMkoE9Vc40bmNBT1wEnVRNiQM3G3Zy83w4vNBU4ViNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WZUH+6An1tgn/IS3HzsY4hd1dtM+eMOzWTZQvdN94Tu8NxfFFq3fxz1T0EUAdK5tJlVBQ8bbaOFv8aJWpKprLt2FpgrW9UGtb+mcBgMgSK6sIvSm+K4b9mKOGhqFMr7sfbY8m1d07TbilOofiQSKWSlbU9PNOY01i0vLEaShMco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FnVncGxj; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=XK10MpHL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FnVncGxj";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="XK10MpHL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774657742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pVak1OQdFi+KSbDm2i0b5emN8NsmFfdL0DbczgHqixQ=;
	b=FnVncGxjmlP/K9CEoi9U8iePkpgFbzrE5U4WmqmZmWzse2GdPA1Rv2v8nY7yQwJ0dntVII
	pMfBwk1wnfzTC1m0wcphY2gxg7FCbFHLF9LGxEDpbkSHSSHoYY2YmKSCjhqsMmwUEgjym4
	oDm9zlv+C7FR4+QA8JorzmhEsBSn+DI=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-225-4vF2k-XMOHewGitpPXEsDw-1; Fri, 27 Mar 2026 20:29:00 -0400
X-MC-Unique: 4vF2k-XMOHewGitpPXEsDw-1
X-Mimecast-MFC-AGG-ID: 4vF2k-XMOHewGitpPXEsDw_1774657740
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b24305cb3cso1591255ad.2
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 17:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774657739; x=1775262539; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pVak1OQdFi+KSbDm2i0b5emN8NsmFfdL0DbczgHqixQ=;
        b=XK10MpHLHEBK4Ckuu112Y5I1ZB2BGD/wDSxiisQwx8JArVAT7gY59wghXCbTUGHEQ/
         nJm2FAWApDvp076D+BsQMbxUr5wi9U3T0/nxZ4HwVgo38ZRmJYdBkJ5scJWaxZ5YOd52
         cPZrtVLuIKJoOX1f+fqBmhBuaLxW0H3ch5T2UT7kMd4ZnK0hlUmn2e0ZvoCwP11DE9yw
         xomGIepjJP9HNi6JrUpR+2Ndyx2MQrpcaPzVYc/onEtGrQf3kmtbxjUr3gBpFID41AKe
         L/G4EBtIMH2ytDuSyTqht6uNqpp1EGd5hMkBcDjQI+tzEEO6/kcbqTdw6FO3SR/SnTPL
         7RlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774657739; x=1775262539;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pVak1OQdFi+KSbDm2i0b5emN8NsmFfdL0DbczgHqixQ=;
        b=YIkbPECaeKaebeFoxcTZDbpGyi1G++rXpziF39zeQPjpMPZMYWY68Kia5oxHyOgsAX
         9UMAL+Oz6Ljg8WfxGVI/VCFIaTi6WxjreE/HRA9w5TX3rcrw0yAhV0kdeCDFR6rMrwuH
         QQ+0Uy3VahI/CN4j9+Y/CDsQ3U4glsRoDxlnJBBP1+gr4DFYoREzwPitcAHuT6Eyrt7L
         umQEgiEPmjY2mGcRroVjgkPZkA8kHnVBJfvLiHajrd/ldZy3sP8PF4Wv8vwVNMmC0/oa
         CnNTjhUlV9qx1TyBzRaG2t/TqcLht4B+uL1jNPXJDuBB9oUfDtkzr62af+2drtBZnmCk
         FEfg==
X-Forwarded-Encrypted: i=1; AJvYcCVKtCsvfoVLLMt3MMZ7gVn+3I9G9XyY2GnpMcQ9hVnUmZSbSxKV3HiQnlqPSkRCaFkjvApdzAZI4tEVPF8XjJE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk6QumA4CNchzUjwDdLYaiC62IdgPdbOSKTQveHV2IlIkwUOMd
	vvvaXHYzSXma/wLOSfV5gfdwvG9pSp43lt4QdFNPSizoytSfRU/x/oSGM57Fk10Fcwue5e+Uxng
	cJNx2KKX/MqHCZZ77zt/7NyO4S28mYrH+8BsNWOOrYaMhQMe40iUaWAgjrig7PzM7guf/Lw==
X-Gm-Gg: ATEYQzy833Nofo/JSfX9Qi728T4AgANWIEPHV1VMpGEefHWsJOHQRKTd5CDm3Yr8aBt
	dHV+fRUtHPDnYiqBuNC7l7A9zLhUFWgzm1FTv17fbmW9RRAfFbdC21QtInKDfu822WupdQWNtx5
	UJLUDJNAE/Y212AsGKi3lgL5nDk6ohqpLUYuJYdXFR3pOxMINQZBLcDOxumFxqWCMimB1/jJLqg
	pTRq3ZspHKLBa0VHt1GMwLUMESbKF/Q5uRclrdRciR+dVaDAy8Vwc8uMWW5eXtndYoaR61idIUl
	3USbP3yvMBSKTmTUL6qJgpi1b0xDXHqHIBn3QOjTO8Xswo2RW5j/5XbpSHkjru8sF9D/b9LEBXM
	YT5iNG8EPuqOoe93wpw==
X-Received: by 2002:a17:903:3c30:b0:2b2:43ca:3486 with SMTP id d9443c01a7336-2b243ca38b7mr2412975ad.46.1774657739502;
        Fri, 27 Mar 2026 17:28:59 -0700 (PDT)
X-Received: by 2002:a17:903:3c30:b0:2b2:43ca:3486 with SMTP id d9443c01a7336-2b243ca38b7mr2412725ad.46.1774657739017;
        Fri, 27 Mar 2026 17:28:59 -0700 (PDT)
Received: from redhat.com ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242642956sm5490615ad.6.2026.03.27.17.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 17:28:57 -0700 (PDT)
Date: Sat, 28 Mar 2026 08:28:55 +0800
From: Li Wang <liwang@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: rppt@kernel.org, david@kernel.org, ljs@kernel.org,
	Liam.Howlett@oracle.com, vbabka@kernel.org, surenb@google.com,
	mhocko@suse.com, shuah@kernel.org, aubaker@redhat.com,
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] selftests/mm: skip hugetlb_dio tests when DIO
 alignment is incompatible
Message-ID: <accgxwDzIyk3_fEL@redhat.com>
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

On Fri, Mar 27, 2026 at 12:13:50PM -0700, Andrew Morton wrote:
> On Fri, 27 Mar 2026 20:03:05 +0800 Li Wang <liwang@redhat.com> wrote:
> 
> > hugetlb_dio test uses sub-page offsets (pagesize / 2) to verify that
> > hugepages used as DIO user buffers are correctly unpinned at completion.
> > 
> > However, on filesystems with a logical block size larger than half the
> > page size (e.g., 4K-sector block devices), these unaligned DIO writes
> > are rejected with -EINVAL, causing the test to fail unexpectedly.
> > 
> > Add get_dio_alignment() to query the filesystem's required DIO alignment
> > via statx(STATX_DIOALIGN) and pass it to run_dio_using_hugetlb(). Skip
> > individual test cases whose write length is not a multiple of the
> > alignment, so that aligned cases are still tested.
> > 
> > === Reproduce Steps ===
> > 
> >   # dd if=/dev/zero of=/tmp/test.img bs=1M count=512
> >   # losetup --sector-size 4096 /dev/loop0 /tmp/test.img
> >   # mkfs.xfs /dev/loop0
> >   # mkdir -p /mnt/dio_test
> >   # mount /dev/loop0 /mnt/dio_test
> > 
> >   // Modify test to open /mnt/dio_test and rebuild it:
> >   -       fd = open("/tmp", O_TMPFILE | O_RDWR | O_DIRECT, 0664);
> >   +       fd = open("/mnt/dio_test", O_TMPFILE | O_RDWR | O_DIRECT, 0664);
> > 
> >   # getconf PAGESIZE
> >   4096
> > 
> >   # echo 100 >/proc/sys/vm/nr_hugepages
> > 
> >   # ./hugetlb_dio
> >   TAP version 13
> >   1..4
> >   # No. Free pages before allocation : 100
> >   # No. Free pages after munmap : 100
> >   ok 1 free huge pages from 0-12288
> >   Bail out! Error writing to file
> >   : Invalid argument (22)
> >   # Planned tests != run tests (4 != 1)
> >   # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
> > 
> > ...
> >
> >     v2:
> >     	- Pass dio_align as a parameter to run_dio_using_hugetlb()
> >     	  instead of generally page_size/2 alignment check.
> > 
> 
> Whee, AI review has decided that pre glibc-2.36 is a problem (last time
> it was pre-2.37).

Ok, will handle this build issue with old glibc.

> And it's forgotten the previous fs-doesnt-support-DIO issues.  Did you
> alter that?

[Sorry, forgot to mention in change logs]

Yes, I added O_DIRECT flag back to the first open(). Then it'd skip into
a failure on filesystems that doesn't support O_DIRECT.

Also, statx on FS doesn't support DIO will set stx_dio_offset_align to 0,
which may led a division by zero issue, I added a zero check.

	} else if ((stx.stx_mask & STATX_DIOALIGN) &&
			stx.stx_dio_offset_align) {


> The get_dio_alignment-before-ksft_print_header thing seems legit.

+1

And, before sending v3, I would leave this patch for more days to
see if others comment.

-- 
Regards,
Li Wang

