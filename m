Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD0D3AB272
	for <linux-kselftest@vger.kernel.org>; Mon, 15 Jun 2026 19:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781550538; cv=none; b=hYcMB6JyolB77AiK9VQpQEw+HIa0G8OHd5VFFTL+i4Pvfp8XvB+DdcvCOMFpjUF1uxtdItmCNCksiWf3RKhg1VSWrJLAkOuhPr0IKbrZZLNqcthbQJK3+Zi7/2WhYn3Hw4w/dxbZcd0W78uaFU1qgVovSBoC6YkFzEZs1QR7ML8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781550538; c=relaxed/simple;
	bh=EvoJ3aDtZ4F/C8Kr9wphawKCAyi3l8ODysFcMsfBdGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OmlVeIXzJaRLwdaSlp9ODCPmgsESFWfUmzk6zIi+3do1MyRD97e758QWBciF/OeqQV4xhMtwUnXGBLMzwQZRsoRWBjsSFU60i0IMyv0MKTsbxW5Z2nm3Ycw6SVEp1WWI7MYtiHIQ//HZ155Fk5u7dViMXx7dPcrLGY1r13JtI7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ETarz34O; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ETarz34O"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2c0b1a48855so11615ad.0
        for <linux-kselftest@vger.kernel.org>; Mon, 15 Jun 2026 12:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781550537; x=1782155337; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ISqMLHuxmmME4HG1iYeuq/aT+EEs3k5ypriNOeJFwpk=;
        b=ETarz34Obq789inNl2pics+fHINA3Gx16qKzeiY9T0eqGMZQWo4H/n9KfwSxzM2PC8
         Nz/2Ac8IgJa3RMZAOr6TyNnmPd7lvmNDxFw8c314bfo1cl+DKZU9rBV1T/s7VheYrJ0l
         g400EEgReNo7S/Ox7a5MtRjfBoeFei+GKjSrGmebvtU0rKO4oHoW0Y8O9LTpLGXXtwKH
         2gMsGKDGFagEyeQ/2TmC1XjCRa/XkK4MkRgsSN2lxP9s1ZlnAZnE5HAhiWFss8E7L8pG
         9il3rn9l41D0SvO2AqquwEXml3fxtzzj/Ym6TcR4l/fFm5GkWb+6GkFRCuiu9dJcJKce
         87lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781550537; x=1782155337;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ISqMLHuxmmME4HG1iYeuq/aT+EEs3k5ypriNOeJFwpk=;
        b=HYub6hPabn0JpDdFfl3fWDk6WyMmH2uXsoLLust98d+VQbjlGtChwFyHN+k1j612+M
         IPAOnNM96idHGFYdDXk/INM7kyAqTVDrP0wI9NH5Yflqf1EVhcFpjmr482CtJ9vMWj0T
         M89NzgAgnnIYPS25u7+D14Ms2XVn8un9lrr+E5UerRUtCH5rxWFrBLP0YkU+wfJYo+0S
         WUFEy3nY+9wjJ6M/D9ntlR54k/gRPAihY/TC8Wc6rEY7rLdHJt44vOw0A/UulGPbB9uo
         PQo+RZZ43suYt6QCjeh2J1MqmcR9upcr5xHfysL4zpiiuMbIgLo2Kv9RYE4JuJ4EG0oj
         6t/w==
X-Forwarded-Encrypted: i=1; AFNElJ/1/uh/oR9VbTwUYFA5x4KT35V1PXxj9QiF0L/YcfDfoX0GTcpGoXlLlqLWeHJ5N9KpeVKMwauF4xMaLcvBjjE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRLst8yuizfEUGjtejpnJHWLku8OGcxvkyeBythjKJihYZbpMF
	qChi8+jQ6iSe3IRDAIzaReXYcnKiQz3wXpAcECsj/oAZwS33fxXEEWYMt+VAZyStfQ==
X-Gm-Gg: Acq92OG31hLunB6odlSLXj4MBUkSlSQ6p0OMSp6LkQdi41jJEBCCT5ZUMdfD5hYfiyh
	vo6JZJpoMCfmNg3WAztfUCkUKRvwJnGqwpxM65Ak/Yn8sPys9QkSc4/x4R/mi+0kGAXqmjXyFXw
	69YBf/hshGPMB5ks/n6cS5Vqb7rhMS2G0uNLIvpcIijkXsrvDIgrv5PVjDTo6VbnYCq6kcYnglc
	vpmISdXLZf6da/9mcdsQKnj4xs2daJq6C9YQuEziWWDUAuTHdUzt354rrDHk1c8wcIWP5eAMji3
	PPG56+M/T0q8yyjeSriBKNw2424HFPwYL2iE0W/I0m6yFSRivfDecC1EFfuZKbHjqD8z1tD7G1A
	4u8SS4PdC3d4CXHjmCrakpOShb/DVMUaxJ2us27yfG1RUEgHU+48IplJzoipRw5UdpNHjCJEo/c
	TLhx1n4dcn1T/3jcj5abflxHJIYTvgJkHwQA/jbY69m0j8nlcju3V5dBzEx8I=
X-Received: by 2002:a17:902:d584:b0:2c2:2485:7086 with SMTP id d9443c01a7336-2c69a3f43e7mr514035ad.17.1781550536841;
        Mon, 15 Jun 2026 12:08:56 -0700 (PDT)
Received: from google.com (62.101.197.35.bc.googleusercontent.com. [35.197.101.62])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c5228ebadsm344889a91.10.2026.06.15.12.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 12:08:56 -0700 (PDT)
Date: Mon, 15 Jun 2026 19:08:52 +0000
From: Lisa Wang <wyihan@google.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Miaohe Lin <linmiaohe@huawei.com>,
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
	linux-kselftest@vger.kernel.org, rientjes@google.com,
	seanjc@google.com, ackerleytng@google.com, vannapurve@google.com,
	michael.roth@amd.com, jiaqiyan@google.com, tabba@google.com,
	dave.hansen@linux.intel.com
Subject: Re: [PATCH v4 5/7] mm: selftests: Add shmem into memory failure test
Message-ID: <ajBNxPKzhARLFk9X@google.com>
References: <20260602-memory-failure-mf-delayed-fix-v4-0-a5bc7db5a9b2@google.com>
 <20260602-memory-failure-mf-delayed-fix-v4-5-a5bc7db5a9b2@google.com>
 <6963083d-6725-4081-b2a2-894a0510c6fb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6963083d-6725-4081-b2a2-894a0510c6fb@kernel.org>

On Fri, Jun 05, 2026 at 01:38:28PM +0200, David Hildenbrand (Arm) wrote:

[...snip...]

> >  static jmp_buf signal_jmp_buf;
> > @@ -165,17 +170,21 @@ static void check(struct __test_metadata *_metadata, FIXTURE_DATA(memory_failure
> >  	case MADV_HARD_CLEAN_PAGECACHE:
> >  	case MADV_SOFT_CLEAN_PAGECACHE:
> >  	case MADV_SOFT_DIRTY_PAGECACHE:
> > -		/* It is not expected to receive a SIGBUS signal. */
> > -		ASSERT_EQ(setjmp, 0);
> > -
> > +	case MADV_SOFT_DIRTY_SHMEM:
> >  		/* The page content should remain unchanged. */
> >  		ASSERT_TRUE(check_memory(vaddr, self->page_size));
> 
> You should likely use "fallthrough;" ... unless you are missing a break; here.

Thanks, will fix this in the next version.

Lisa

> 
> 
> -- 
> Cheers,
> 
> David
