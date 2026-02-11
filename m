Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281BD318EF4
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Feb 2026 20:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770840076; cv=none; b=judkRGFtOvHufXaUrbw38OaZTSme4Ush+zSTXkLwMCuq/ntncRFsiMVS/T2GThWEV7YjhxImiHjAu53SfMbKYu5wN5nR6NH+ACm+3Wr6FCt89+wmm83N7t3VEHW+XDt0iNXPWcZuYqT8VzRbsIdVg4jcKpdJ7U15rhN+HZBmHRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770840076; c=relaxed/simple;
	bh=gbzTFzf1qwsOloZwMfBXvRhqudV/HFNb7Pt4vdjNQPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d0gyAgNyVWS7VVDhk3xPmH7jHga8uU+/lyDWw4Fm4zpwqvHh0K9y/f6tE9Ecbirla4q04WJH5hxDDhjxBeYvChYJ538gKkNnlw+/y2KTijJ1ZTkMksO7ea+I4Vc8FxtmFEFhypr6O/VfMvtigNJrUw9NfAthK2rcIY7b7kLfWIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MDrx83Rt; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=jEHOOvnK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MDrx83Rt";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="jEHOOvnK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770840074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=unlAZpu0DMR9ibJFuP5Oyxh4e+3VDJDkStDVQDwwXng=;
	b=MDrx83RtDHkuL4df5fdy5aAiBAMNwzxs3OdlAfoHfazW9pjKma8+lP6eNrHVgL0cVlOhh+
	bp1IrG4tflYYQmKk7LEK2B3hgqzuZntuA3xepfRBHF9+Pq8PMYffRcKFBezeUksMTqhfL6
	2kfm64sLI/QDhhQ7y4tR2PqySDDNoSQ=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-359-0gHMw9mQMxGFCc4ZW9Tp2A-1; Wed, 11 Feb 2026 15:01:12 -0500
X-MC-Unique: 0gHMw9mQMxGFCc4ZW9Tp2A-1
X-Mimecast-MFC-AGG-ID: 0gHMw9mQMxGFCc4ZW9Tp2A_1770840072
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-896f2e45fb0so42411306d6.0
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Feb 2026 12:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1770840072; x=1771444872; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=unlAZpu0DMR9ibJFuP5Oyxh4e+3VDJDkStDVQDwwXng=;
        b=jEHOOvnKr+FT4r7y0hDdCAUAT+lpUCbXOu1O0H1o3vGmc1BrAv79exa8tk2WJDnD3m
         TWX7dqPoZVO+gsCBRQm02ECsw/PJP8Jedxm9UIcMm6+QoQ+dLffh7GUnUOFDiRMa8mgf
         C9jBTPiDQXmRQTNoTqg0YBIdkhxTf0qM5t7fBK2lJc8POCpiAun7GFrhtTGshlVq7BUh
         JoZe5fQjkKsatXAn66OMeO+YtsfZLjPgu4ipbQzTKhEpLG5zRxsr/Y4ay3Vpth5CrmJe
         NkjMQokBvB9bmh2yVAgWerRB4MW+NdYYWJaWOWLFFD+nIKey16zF77tlgQu8gAwuwpUj
         SGXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770840072; x=1771444872;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=unlAZpu0DMR9ibJFuP5Oyxh4e+3VDJDkStDVQDwwXng=;
        b=SmyJWmX4riO8WKEbEbqKteVHHWR4rCl2a1clbc1DU5qe9qJdiiDxD+sBVVaLSXCvvB
         1id0YvgZW5dPkijezvuimQT4n+FLK9l5MyORwWsN6/Fr/OWsEsSRzXY00w35HFJ/ahOb
         b9ejv0K0errNpToO7V2OTDDNv6o/KUWw4jPGfck6VCC/Ze5ft8zbO+FePMxCinQ4Ycbv
         Bo6QWVrnBJBMN+Xi5aXKryOIvUEgzet4CsP25IRYY5YRcU+fRWdSBL1oys1f6bOPnqsI
         /1B4k3jVp7KMclVHbUAYkY+7ZiwpnMIrAOK+CxNEPK+fDjRG6qtYlay8LkanarKYVxEr
         BNZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWp9jB70H+5ARVm6c6CsdpeRv83PE2k7Pu7aMHkUJNve3Fp8XQoh/LJKOnpdSe2wC+LRVTBrn1z8GJkEGPJPi8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4JhqvM3eCFRKUUZBLxILt3RDmqcq4C3Wowitenmi75IPoIN3K
	4xYibWKm5wqTmqJubSDsS6rcZmYBm7B+7D7jYyBsWimBTygux7b5WTmnfUjtOc6H4If0eqJMHAN
	PqNdKysAq712FbaguefGN4cDWbqtF/kzXitdpe04gZgCw48gV6XeITcQ0nRN1OFlfRLin7w==
X-Gm-Gg: AZuq6aLVLEYR/K5swi7yW0YOOxZ3qCQGW/IsuytquVGTxLJtRSCfg+GHzpwjYhpkrZ3
	jr2vWA5Zr7jswoY2i/IKiLUTQLeg6F8Jft9+HAcq8UdZZkIRpY+0RdDbpKi0kAs2XVay/bFUKbG
	KBnsx+zmzjADcxS2GpCHoT/68fskgwcn+YhmDbtrKB0b2xNs0bErj9TAvI0OrPDWgUjI+7UrjK1
	jAaljcslBNNZAlnOOtKk+HTHulXFbTChl3BIaKtl9RIJmbUJIXQFpKo0mMbfkPhlA4VayjLuksS
	UACamjj9mghrciNBhAWidi1Y4E58zw6VpMQ04YQhPyHnyvSLZwdkcfiQnE5jR69BWD4CMbhcFcT
	hyHIFrAzhVJl4sss4ORh0GiKB0SXw8Yr624R55UMmIpx+W9uerqd1fi/wLIBsQT/2wGLfI85iNi
	rYybS3PA==
X-Received: by 2002:ad4:5aa4:0:b0:894:71fe:89f4 with SMTP id 6a1803df08f44-89728d939c3mr2000766d6.11.1770840071571;
        Wed, 11 Feb 2026 12:01:11 -0800 (PST)
X-Received: by 2002:ad4:5aa4:0:b0:894:71fe:89f4 with SMTP id 6a1803df08f44-89728d939c3mr1999556d6.11.1770840070818;
        Wed, 11 Feb 2026 12:01:10 -0800 (PST)
Received: from x1.local (bras-vprn-aurron9134w-lp130-03-174-91-117-149.dsl.bell.ca. [174.91.117.149])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-506920071c4sm3288501cf.1.2026.02.11.12.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 12:01:10 -0800 (PST)
Date: Wed, 11 Feb 2026 15:00:58 -0500
From: Peter Xu <peterx@redhat.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-mm@kvack.org, Andrea Arcangeli <aarcange@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	David Hildenbrand <david@redhat.com>,
	Hugh Dickins <hughd@google.com>,
	James Houghton <jthoughton@google.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>,
	Nikita Kalyazin <kalyazin@amazon.com>,
	Oscar Salvador <osalvador@suse.de>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC 10/17] shmem, userfaultfd: implement shmem uffd
 operations using vm_uffd_ops
Message-ID: <aYzf-hS4pUY9ulss@x1.local>
References: <20260127192936.1250096-1-rppt@kernel.org>
 <20260127192936.1250096-11-rppt@kernel.org>
 <aYIzCuh8cjd09zrP@x1.local>
 <aYhm_4difwN5XXxe@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aYhm_4difwN5XXxe@kernel.org>

On Sun, Feb 08, 2026 at 12:35:43PM +0200, Mike Rapoport wrote:
> > > +static void shmem_mfill_filemap_remove(struct folio *folio,
> > > +				       struct vm_area_struct *vma)
> > > +{
> > > +	struct inode *inode = file_inode(vma->vm_file);
> > > +
> > > +	filemap_remove_folio(folio);
> > > +	shmem_recalc_inode(inode, 0, 0);
> > >  	folio_unlock(folio);
> > > -	folio_put(folio);
> > > -out_unacct_blocks:
> > > -	shmem_inode_unacct_blocks(inode, 1);
> > 
> > This looks wrong, or maybe I miss somewhere we did the unacct_blocks()?
> 
> This is handled by shmem_recalc_inode(inode, 0, 0).

IIUC shmem_recalc_inode() only does the fixup of shmem_inode_info over
possiblly changing inode->i_mapping->nrpages.  It's not for reverting the
accounting in the failure paths here.

OTOH, we still need to maintain accounting for the rest things with
correctly invoke shmem_inode_unacct_blocks().  One thing we can try is
testing this series against either shmem quota support (since 2023, IIUC
it's relevant to "quota" mount option), or max_blocks accountings (IIUC,
"size" mount option), etc.  Any of those should reflect a difference if my
understanding is correct.

So IIUC we still need the unacct_blocks(), please kindly help double check.

Thanks,

-- 
Peter Xu

