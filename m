Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2AB3BD629
	for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 11:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774870559; cv=none; b=uBoYRI1/sp3/Kpl5+dneUE9663P762oViDhZL9TNsCr8HGOzYJ6O/QJC+oCfDjxRD0YMPppWUFnfMT4ROkBOtJF5POP7AnxP0iwsg32ge9BBX+6aMkvPdIjEg8aCJnYsvLi9rgkggdngymCrAsIPDuNGbzrB/eQ7ooh87TVF8No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774870559; c=relaxed/simple;
	bh=IHi+tz61BqV6himK80I8WymO/a5UUCf4uLwI/wHDak0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QFCqJvzaRKibo9S3t4Uw41NWJQ2TVKZkJGehgwMXYbw4BDbH0vOYUnJPdUUK9JBmq30vOrwVgJjNi88baTAaZDxuMHh5sibFt2rbpODqtW/QhQQGMhOxIXrgnfC+9qGauSKTs3Pc+jVZ2FdGij8OLsaB/J+nkhXleb/HP0PxfAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W3q54qRh; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=CQBDW9dx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W3q54qRh";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="CQBDW9dx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774870556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=556GKtPgfbryfydv+tI3+PhJHtuBKVNgx90rfTV7vcs=;
	b=W3q54qRh4t/X0K+wwABXaSkVesiuN0iKBvPQCHFJNUWRq9K5PhBM2p3LZtS0EkViARIBdB
	hLEF1NNumBxYoTjy6JvA73p69U+UeVBEOKEmBrOnUlB4xtTXgltBeGuvVFbYTDwMxhTS5y
	6JYZm/CcQkoB5IaknHRcbj0L+ePAxps=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-25-VlnEHh6PPFGmU1NCJac_Sg-1; Mon, 30 Mar 2026 07:35:55 -0400
X-MC-Unique: VlnEHh6PPFGmU1NCJac_Sg-1
X-Mimecast-MFC-AGG-ID: VlnEHh6PPFGmU1NCJac_Sg_1774870554
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b23af7d7e8so88872835ad.0
        for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 04:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774870554; x=1775475354; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=556GKtPgfbryfydv+tI3+PhJHtuBKVNgx90rfTV7vcs=;
        b=CQBDW9dxA0k5X2MFTZxscu7MMyZn5vU+OG2p2JYcErpTDB1uqkXs/RHNxu/7E1l5Ng
         LGUobvnBEkyf3ybCfY5qFTRJiIJM1P6XrNGw2FQJ+vUpO5EHcdNMmxV684baW95MGBIz
         3j9PO+ZeGoKAIcQdu7x/KIHpde0ulP3qNf25pmm+pXhgGafw+NYwOz/KNAUxrhU1vu8h
         gP7qZ86XGpLKuQnPIVp7XfxtkfKYNY34FJlQI0jcGApSvHZU3hLJtzA70m+pTLu/Qf5o
         Bb/TLsIdeI4ujHY2yEHpPQyzRC/5xz3EM0MPUsZsEsdNTziYHwj18o3m4lOeulr3z91s
         1FDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774870554; x=1775475354;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=556GKtPgfbryfydv+tI3+PhJHtuBKVNgx90rfTV7vcs=;
        b=bK9mqmLapyp09vvwtH7zrSGRel2ARlJ4qtID1VOE3iezFrrAtHWscMpRkUTDGsLFJb
         WD+8fpG1JbxlLPLwBoFMTwLvuRu6RZ9+8A/A269wxrs2Y4ad7hn8QxkKOS+Al9JgMITa
         Ot+SJAlZ3Zi5v0VGUoZklhZAOpxMy9okSB6u376qkIj2tTkCQjFiD0KO+bbUdDMu9QvF
         RLnnaVRxS+aTuGVBncOZo99JyISO09oovRR+rcr7GaQvcPmPM4oLcmbAaJLUKzhM/xQo
         U0O8NWNiHnVww8ueBjoW0OM04qC6Y1wNg+IDjqlLQygJjoW644EDIuphR+/iDSZQ4C3S
         tHKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTWdBZDMVY+siey5+wDlQK3+dBtbTaTnGDT9vTKPceqWMjQZGFXH3qFkR/QUeuqKkLEIuBe1rvHP7/DjBhXsQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYw9j3rSHdzfbbBGHz2eNw/d5pvYbJLsOM2Hk1OTsrSwy5Wtr6
	ob8OXYCcSAKQ7x/Zw9g0/uNJK8AHD9g+tIitT4t4ZdTtSNFefklBOa0uTSz/HAnKKNwVEwKEQ8s
	cqEiI/49ylinqOsff4o8Hb0kXMK2Byg6acFegrieGryQ6kVNed8y66eLhL+V01B/xguTLIw==
X-Gm-Gg: ATEYQzxQ2eKKDCjkjA53rIc5OIRde0CIFkG/xnWi68PRxCDytSO6fjxIKtIiuxKgrRZ
	sxT72s5JDZd70CwfSKu5aVOxmPMe+BTL0PtEF1fdgqsRpgk/5CW2eKeg2KrlVb8uwmvvgOMQmgK
	xwX4DqmcMLC9FoUgInyhYx4WB/+KlZ3iYU3xT3PJXGkVVbcyZfmUce2yjA5wjUMWKMOs45sFTBP
	podjrEId74cmzfm+LjAvbl2fHNXf8p+2J6UeFqYS9X+1INPPLx+Y7kImotSYW9SBxsrSdWj2f/d
	6n7xJOViaMa52n39MC5cc6JQytkRSdnLYkRbfXikDh9ywyr9Gsc7jmWrM52Eh9Ga+s4A2lyxmor
	KRwzd1xKoxe7yRXGYHA==
X-Received: by 2002:a17:902:f70f:b0:2b2:4d36:7aa with SMTP id d9443c01a7336-2b24d3609ffmr53808545ad.35.1774870554449;
        Mon, 30 Mar 2026 04:35:54 -0700 (PDT)
X-Received: by 2002:a17:902:f70f:b0:2b2:4d36:7aa with SMTP id d9443c01a7336-2b24d3609ffmr53808365ad.35.1774870554017;
        Mon, 30 Mar 2026 04:35:54 -0700 (PDT)
Received: from redhat.com ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427acdb9sm80473665ad.68.2026.03.30.04.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 04:35:53 -0700 (PDT)
Date: Mon, 30 Mar 2026 19:35:50 +0800
From: Li Wang <liwang@redhat.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: akpm@linux-foundation.org, rppt@kernel.org, ljs@kernel.org,
	Liam.Howlett@oracle.com, vbabka@kernel.org, surenb@google.com,
	mhocko@suse.com, shuah@kernel.org, aubaker@redhat.com,
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v3] selftests/mm: skip hugetlb_dio tests when DIO
 alignment is incompatible
Message-ID: <acpgFlG4qj646hYp@redhat.com>
References: <20260330053915.75442-1-liwang@redhat.com>
 <a5b7add7-0507-40c0-a324-81f243ffa261@kernel.org>
 <acok3JY66OcV0Qab@redhat.com>
 <acpMD8tRCJhgXHeg@redhat.com>
 <a1054c28-b574-4fcc-afe9-5e902209a22c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1054c28-b574-4fcc-afe9-5e902209a22c@kernel.org>

> >   int main(void)
> >   {
> >       ... 
> >       fd = open("/tmp", O_TMPFILE | O_RDWR | O_DIRECT, 0664);
> >       if (fd < 0)
> >           ksft_exit_skip("Unable to allocate file: %s\n", strerror(errno));
> >   
> >       if (get_dio_alignment(fd) < 0)
> 
> I would suggest that you query the alignment only once, and forward it
> to the test.

Sure thing, I declare a global variable 'dio_offset_align' to get the value
only once via get_dio_alignment(fd).

(sorry for not posting in the above email)

static unsigned int dio_offset_align;

static int get_dio_alignment(int fd)
{
	struct statx stx;
	int ret;

	ret = syscall(__NR_statx, fd, "", AT_EMPTY_PATH, STATX_DIOALIGN, &stx);
	if (ret < 0)
		return -1;

	if (!(stx.stx_mask & STATX_DIOALIGN) || !stx.stx_dio_offset_align)
		dio_offset_align = 1;
	else
		dio_offset_align = stx.stx_dio_offset_align;

	return 0;
}


-- 
Regards,
Li Wang

