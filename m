Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D148CA6F
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 04:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777867880; cv=none; b=mi97xAcp93Pbuz/odx7a/VfHo2X61qhwqz+IrMxzVELZFZ5EP+yoBn5SYYAeVANlnbNV7JNfL8m5K5xxcALNrg0IWLCQImUcQjm48Fg632Uk/TxjJ2cThugfeeTIMaE+WnY02r9EmJux9cs8BRGI+Fx93pfec9moVEgbPDwe3ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777867880; c=relaxed/simple;
	bh=ALLpA1Spli6gEIvD2eBig7ozCGKkYWm7GRvHWMn4OJc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P7zv426+iSp/gAdc4rxsAMWTwOhxIAIL9M0LrB28WeyQbVBF3CCW6nEFSbl43SMXYeHLx5pWz4IJ5yU9Fd9ynITH7Q0VO7U0cByR/pDezjoAnrkNd00ARadDXw7th/Ep4WJeSWpFvL+yAImvO1uNRV37NxTO+aBeOEeMVkIgyMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O+/QG5Xd; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=sDOeSp2y; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O+/QG5Xd";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="sDOeSp2y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777867877;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pu1MzcUI/l6Cm0rp2QFR6z3D/O2HWrrKP5PFPjdVM80=;
	b=O+/QG5XdO5UgfNaF0nKN3IfqsZilziXxIf3enX6aUqxoEOc1zIMxoAX6VNVmBU0LkXyZJ4
	kcEYAdA18KByD0Z6RF24JqXd5mYGVjh8BiTDMWJ80/Dx7afDtrSALxfZYv0BMolXyhCt62
	3FXyGnXiiLX5dKneHNPpzmLfulRApwI=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-510-DYcOWzOTP2ic_1tIKuqznA-1; Mon, 04 May 2026 00:11:15 -0400
X-MC-Unique: DYcOWzOTP2ic_1tIKuqznA-1
X-Mimecast-MFC-AGG-ID: DYcOWzOTP2ic_1tIKuqznA_1777867875
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7bd5c421975so50153267b3.3
        for <linux-kselftest@vger.kernel.org>; Sun, 03 May 2026 21:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777867875; x=1778472675; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pu1MzcUI/l6Cm0rp2QFR6z3D/O2HWrrKP5PFPjdVM80=;
        b=sDOeSp2y89ZUmkjVAg2qFmiPL7vgVeZe2wERf0/8fOrUEKvc95O03koS0hUGWicz07
         cOPmsVZyb3DIaTUKgsnWk7+T0IiuNEfJ9zmDnHlC4vXvGk1xudNDRJlCcB8rKoc8VVkk
         1mx7o6nME5XkOryjZK6S8E0ZomybNTFR16PuVPaud6Sb0MyqDT1KBf+KKG6FvJYsuhLG
         LsCOIPrRUUW4J2wqdhgQ64GUKBdCGa41Cz6gfL+gFWtDjirtIydfu71e4HR+l4dgNGjd
         rrv8HwNEJ9HeswovDGW1CsGDaLomgw7zHz+Vfa3eCWZtPAmSRIzMkJ/fzX2FvDFnFvgV
         FZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777867875; x=1778472675;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pu1MzcUI/l6Cm0rp2QFR6z3D/O2HWrrKP5PFPjdVM80=;
        b=Xc66pK+TbLSCnXM3YORo76PzURgOnj/YZKNI1OhV9d/1LcRQcjksm09LlGwmz+7HZT
         CGxs/l+VfrkbglyWfvxF2lJYJULJzKjbbMrFeoyuDL4Ruy68cGHoUJSApG8zMPMLM6N5
         7aCDAORRfGGLoLH3dtpmCBwvbdzHlP60fr1haYvTO9aASRcL+Ddy/Wuwmq08dNghFJdd
         xzfps3ii35ZMpEE9tOQf0UTYe0tX6efE1gzcYUacCp2c75OoouIwRpWGG+1ngd066NFZ
         vxdh1rWc9+5u8rrmSClw7WVLPK20v5UAgsVwWQNUFWnBDRMOOvY3RQWr2R3JVoSr9W8z
         dRNQ==
X-Forwarded-Encrypted: i=1; AFNElJ9lSH8DcnLij+Pz2lYBKEpZDQPTEW3Y6VbhqjXnCi7i7iFwROcjC9xuujOFoyQfRx2Waun/Cat+wwqFGb8nhH4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGlWmKiGHu45kue14bAafAJLXOTLaXDFLeiutDqw/K3BQJwnAR
	eAM6kcuzIGlJDfw9wlg6kFnINR0SsnaHk4ZkI1ay/qy0xSl3ltUpd3GnDSaDwoeA78tpjqjVP96
	yedEIzRTc93oJFqnlJ8POpIUkTAXv4IGvuCLXgRX6ViqXH23+bwzIb5S+ZaTR0DiqpefgTg==
X-Gm-Gg: AeBDiev/3m5AZ4+RfRtnDAEqfnDvYPW0OzhBWwVovFTPuXjlZReSZLtvBo6QuPNC+gk
	8zupenEVWSFiL/vUtqnfe/NhUGrwQqS5aSBAnHEGCGAAxliRXJhy4vZxBiRC0R7ciXJjJBaSy/f
	IXgqM57FWaIRBjHLFdSNyUOgDIzI4pJUZ1JCw0G80y+ocj7UuiqYO8ic35H/EkS63PxP9KJWNoO
	3O0TbT0DwVA95LXwc8elX8zmh7IBRL9Al8PT9aH74dUprg8wUqXRp96RA7IUmS1f7HgyhcVzb7u
	JSDrNELwy6RnaeW9B12I3Bg1FrvB157C0VhBdScior+vxOeuJGhRqtha1Q7XQQB6Y4azMkGtIqM
	w/IqHr/EUpH4CUVnyLmkZNldu3MicmvNbd/5hOrJzahUd8WS8bWTRpgInbtrjJfcDlAw=
X-Received: by 2002:a05:690c:398:b0:7bd:8cd8:d6b6 with SMTP id 00721157ae682-7bd8cd8d855mr29092477b3.22.1777867875001;
        Sun, 03 May 2026 21:11:15 -0700 (PDT)
X-Received: by 2002:a05:690c:398:b0:7bd:8cd8:d6b6 with SMTP id 00721157ae682-7bd8cd8d855mr29092277b3.22.1777867874473;
        Sun, 03 May 2026 21:11:14 -0700 (PDT)
Received: from [192.168.178.105] (78-0-206-107.adsl.net.t-com.hr. [78.0.206.107])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6654e464sm44532247b3.14.2026.05.03.21.11.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 May 2026 21:11:14 -0700 (PDT)
Message-ID: <1f3aedf7-9e48-4650-a7e2-5584c8b299c7@redhat.com>
Date: Sun, 3 May 2026 22:11:46 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/14] fs: remove nr_thps from struct address_space
To: Zi Yan <ziy@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Song Liu <songliubraving@fb.com>
Cc: Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Lorenzo Stoakes <ljs@kernel.org>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
 linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org
References: <20260429152924.727124-1-ziy@nvidia.com>
 <20260429153538.727855-3-ziy@nvidia.com>
Content-Language: en-US
From: Nico Pache <npache@redhat.com>
In-Reply-To: <20260429153538.727855-3-ziy@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/29/26 9:35 AM, Zi Yan wrote:
> filemap_nr_thps*() are removed, the related field, address_space->nr_thps,
> is no longer needed. Remove it. This shrinks struct address_space by 8
> bytes on 64-bit systems which may increase the number of inodes we can
> cache.

We've had performance impacts in the past by changing the alignment of 
certain structs. This is a rather critical one. Ill keep an eye out for 
any performance differences noted by our PerfQE team surrounding this 
feature.

LGTM!

Reviewed-by: Nico Pache <npache@redhat.com>

> 
> Signed-off-by: Zi Yan <ziy@nvidia.com>
> Reviewed-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> Reviewed-by: Lance Yang <lance.yang@linux.dev>
> Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
>   fs/inode.c         | 3 ---
>   include/linux/fs.h | 5 -----
>   2 files changed, 8 deletions(-)
> 
> diff --git a/fs/inode.c b/fs/inode.c
> index 6a3cbc7dcd28c..d8a6d6266c3c3 100644
> --- a/fs/inode.c
> +++ b/fs/inode.c
> @@ -279,9 +279,6 @@ int inode_init_always_gfp(struct super_block *sb, struct inode *inode, gfp_t gfp
>   	mapping->flags = 0;
>   	mapping->wb_err = 0;
>   	atomic_set(&mapping->i_mmap_writable, 0);
> -#ifdef CONFIG_READ_ONLY_THP_FOR_FS
> -	atomic_set(&mapping->nr_thps, 0);
> -#endif
>   	mapping_set_gfp_mask(mapping, GFP_HIGHUSER_MOVABLE);
>   	mapping->writeback_index = 0;
>   	init_rwsem(&mapping->invalidate_lock);
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 11559c513dfbb..bb9cc4f7207c1 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -460,7 +460,6 @@ struct mapping_metadata_bhs {
>    *   memory mappings.
>    * @gfp_mask: Memory allocation flags to use for allocating pages.
>    * @i_mmap_writable: Number of VM_SHARED, VM_MAYWRITE mappings.
> - * @nr_thps: Number of THPs in the pagecache (non-shmem only).
>    * @i_mmap: Tree of private and shared mappings.
>    * @i_mmap_rwsem: Protects @i_mmap and @i_mmap_writable.
>    * @nrpages: Number of page entries, protected by the i_pages lock.
> @@ -476,10 +475,6 @@ struct address_space {
>   	struct rw_semaphore	invalidate_lock;
>   	gfp_t			gfp_mask;
>   	atomic_t		i_mmap_writable;
> -#ifdef CONFIG_READ_ONLY_THP_FOR_FS
> -	/* number of thp, only for non-shmem files */
> -	atomic_t		nr_thps;
> -#endif
>   	struct rb_root_cached	i_mmap;
>   	unsigned long		nrpages;
>   	pgoff_t			writeback_index;

