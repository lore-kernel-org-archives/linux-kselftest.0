Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68713346B4
	for <linux-kselftest@vger.kernel.org>; Tue, 14 Apr 2026 23:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776207758; cv=none; b=CLY1/91hU+FVF5TnX/6NcvgQEzZrdgmHoHWtvtd3MveXta7kFSQOrv3iRmvzvhpc6SUUffz/b82eKEkOL/bX1CoYZdHZazLBTMRx4416unkT9E5jys8R+5AblyiN/BTeH6hvm6jX9IjnhyS1vCJfqNgtaXIpZgJ7xdSVdOEjS1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776207758; c=relaxed/simple;
	bh=yIHnxxQ55FAQ5ev7rSPpWImHD239J4P9vUUfERsxhN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EBlEnKIaUejnnPeKRm8PNGO8Fi7kcDg2OlzlndxLX15qASvV5NOyLnDMAOCs3BU87Kk3bNXlRHKjlll6MFCJ/NiN9f9aedbdYLxKJ6gqplo8QAvab8mjuNwMaETH1zVxa7ZO/T2wkNJUPefbBOeG4oWcsAJ2RqiyOTwn1Hki9hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V+eE4PA6; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V+eE4PA6"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2b2e8b95bdbso278295ad.0
        for <linux-kselftest@vger.kernel.org>; Tue, 14 Apr 2026 16:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776207756; x=1776812556; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hYhIIDY1BBnC9l/Uqt+TOwqFCFA2hfXSopa3Cxt9ADI=;
        b=V+eE4PA6vhgdpXm2kvI1s2vhqs1bRyy6Al7EmiMt0DyHQtMHp0MpfvaSlEGUEMAYut
         ZxPdYgwxO+S4FSEjO4zcIe/C2RmCUIPtv/ULaFNi9qbQ+c0bKcNTc8OnawBIHJEY3DDh
         d4L5ojfOuuEftI8nTbl1hD68HehHHwSgqTuT4+KKQgE8Fzvf960/NU27FjEoZHjc5Lwz
         d6mSKXjcWoZA6yBi5cCiiFvZQLJx/4l67Yy23Jn7eCUy5O/ZpM1HrnbfMUsA8qeUiqBn
         15239XgoTBfRTuOJwiWbb5kfhY2BJUdd0UNWg3AT9Zi3K0PC2PCqH06cUpDUoDGie3pP
         CS/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776207756; x=1776812556;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hYhIIDY1BBnC9l/Uqt+TOwqFCFA2hfXSopa3Cxt9ADI=;
        b=KKSJMeT0xvFRRmncu/oyvLWLoTZ3TBxlCMOhpR8zPajH0i68Ty/tg3kikIbOtVvP53
         T4vni6NurhmOUfGH0MGJp07XUmZ2g/xf/RWyr4BkieuY+Ud5eP1rRuCWP6lm5Zfqd3Wi
         jUJiDCoeZo2i1jZjqFj+V6Cmgz61sbTBiITkK6Lnb1qg5qFL8mWtqcs1SP741IWGCIyZ
         SQJSCDXJgNVDKsrDXR10j4IKaa7Ahc0jNh4WVipYP/0Rdx0McUOow9OVKUiUe6CFiePC
         9nsSl697wz3XBMfeB/YkoGgg0UkcDcVSppcmAhQZzk0RJ+CQR30ZGSO69iicBH/xDycl
         HTTQ==
X-Forwarded-Encrypted: i=1; AFNElJ+c2T3sYT372oCLUvODIpitFz0xE6BCeHt1exafivGOCspewCnf7CYviFVkQAsofS58nhsSnIBd/UoiNl7ILz0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEIGadr/8ifprpXce7TGRHo7FejJvbyggOpqDN1fhO23tGlphk
	ZpLBxJyJ4tHHAOvVBP0s3dCOBVSDQs3FR46LxdhXBPu6MBn4j9YC5DpuiSmBoE8lVA==
X-Gm-Gg: AeBDietu6CroXWz8Z/cvhq3LFbnj3XXNZERh3mDcacexmXF9RbB12KITPZ3leRJCtJh
	OXzXoK+zPpNAqPGStU9rqJVFj82UDVtIcLS64wYEZIkUswJ0fCeRrBXhphuXEk+Woz03TWHyQH6
	elqP31ASufN3J/Y2fc/eoM7+xrQltWZKK9zAM578uVcH6TNbg09WJ6eyXPHZBNsaKxUlrDhSkK6
	cIvUBmfxD1O+3DylWhYLIQ1hGqiZyhTlOawBsO1kh+U5bxh/gMY7aIgDTDav+4Eg8t1Tt/St4J2
	52eUO/7Hgz7JRZ0HklcoC08Wv8bmyR+JLKUVt6HxYzRXbbeRXN/5iDIdhzgxzRKgfhMtxOfBpLE
	VTCKc/iPryJZsLCXk5HQrr0odaSz3ByOHzMLLKJ/foA2++nDSm9MoFjlv2Ycuc4zXn0UWpwx3V6
	oLHrE1cX0EZP/lBoaN+ylfWXAuCPhpett9uo27f1e7VRAru7dmbQg6z7Dwxq5qsWsNq/6fWCyiJ
	1i42VLIGBAncQ==
X-Received: by 2002:a17:902:d50d:b0:2a9:5ef5:399b with SMTP id d9443c01a7336-2b476bcdeb8mr642005ad.19.1776207755684;
        Tue, 14 Apr 2026 16:02:35 -0700 (PDT)
Received: from google.com (115.112.199.104.bc.googleusercontent.com. [104.199.112.115])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f673e38ccsm64574b3a.33.2026.04.14.16.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 16:02:34 -0700 (PDT)
Date: Tue, 14 Apr 2026 23:02:31 +0000
From: Lisa Wang <wyihan@google.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Miaohe Lin <linmiaohe@huawei.com>, rientjes@google.com,
	seanjc@google.com, ackerleytng@google.com, vannapurve@google.com,
	michael.roth@amd.com, jiaqiyan@google.com, tabba@google.com,
	dave.hansen@linux.intel.com,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
	Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC v2 2/7] mm: memory_failure: Allow
 truncate_error_folio to return MF_DELAYED
Message-ID: <ad7Hh_kz2aIOeZFI@google.com>
References: <20260319-memory-failure-mf-delayed-fix-rfc-v2-v2-0-92c596402a7a@google.com>
 <20260319-memory-failure-mf-delayed-fix-rfc-v2-v2-2-92c596402a7a@google.com>
 <2f177e0f-2eb0-48d0-b48c-7a0a340caf5d@huawei.com>
 <adA_1zXLUBqmSHFl@google.com>
 <5c5dfa85-baab-5c0f-6f6d-b71abbe10ed8@huawei.com>
 <4d38d333-d446-40a3-b6f4-c4890bfd24cf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4d38d333-d446-40a3-b6f4-c4890bfd24cf@kernel.org>

On Mon, Apr 13, 2026 at 09:18:13PM +0200, David Hildenbrand (Arm) wrote:
> On 4/7/26 05:55, Miaohe Lin wrote:
> > On 2026/4/4 6:31, Lisa Wang wrote:
> >> [...snip...]
> >>>
> >>> Will it be better to add a pr_info here to provide some information for users?
> >>>
> >>> Thanks.
> >>> .
> >> I think we don't need to add pr_info here; truncate_error_folio() always
> >> leads to action_result, which already logs the recovery status.
> > 
> > No strong opinion but I want to make code style more consistent with sth. like below:
> > 
> 
> Yeah, would be cleaner.
> 
> > if (err == MF_DELAYED)
> > 	pr_info xxx
> > else if (err != 0)
> > 	pr_info("%#lx: Failed to punch page: %d\n", pfn, err);
> > else if (!filemap_release_folio(folio, GFP_NOIO))
> > 	pr_info("%#lx: failed to release buffers\n", pfn);
> 
> Maybe we can even make the failed here a "Failed" ;)

Noted. Will update in V4.

Lisa
> -- 
> Cheers,
> 
> David
