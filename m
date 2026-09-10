Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B23A145A2AB;
	Thu, 10 Sep 2026 11:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789039912; cv=none; b=Oec6B9V8w4UUQXBgVvJd4sVN8zOzZQwT4TfqM24ajUK4qtD6Eutw5Gq3z7ywLYrV9tgfv50JQDr5i78gE8obZAkacYrWKw51u+lyf91sFRh60hVTQQewiNYNGJ773VazftDy/l9b7Ma3gm/PZXDnQY633UXcmbpAssJyDStnE4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789039912; c=relaxed/simple;
	bh=azp3o1mihi2R6duYwj7abG8AVTbmAow/Fym5VmGLMS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dugp0ddSioS0lpBiZO+y1eD03L/QA+BpsG9xuNK/JzOG7onNupJMaROaIC+dj+TFMI+sY50xYm6Ds9CqdvlkNl5Bo5YTlTR52/Y0MoGxqDmNLEaFZEo3O8OlMLEdDX7zjid3cWNlamG/s+NOATkfQlVHkw2+Vtdcak/rl9+hMuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=QPChFh2S; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="QPChFh2S"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B24C153B;
	Thu, 10 Sep 2026 04:31:45 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8898B3F528;
	Thu, 10 Sep 2026 04:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789039909; bh=azp3o1mihi2R6duYwj7abG8AVTbmAow/Fym5VmGLMS0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QPChFh2S69dAT24VWmc3VdsBcSdyT2LdSXVbaueArXhiONAA6WvjbudrfRdqY28D5
	 CKk9ZfK/E7iqJuQVFSckwsp3gHioXyIB5H0VSwpiivd3aTci+06eugrRJwJos1BqI9
	 WCJD4yXv2/SQgQEcKMKBuSLaKy0dtEIl713gKddw=
Date: Thu, 10 Sep 2026 12:31:42 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] kselftest: mm: replace usage of /proc/self/smaps
 for check_huge_xxx() helper
Message-ID: <aqKVHnkhjZm-54LZ@e129823.arm.com>
References: <20260907-fix_split-v5-0-822b810458bc@arm.com>
 <20260907-fix_split-v5-2-822b810458bc@arm.com>
 <956df69d-8c0a-420f-889e-7df2842605dc@kernel.org>
 <aqKMVUDvN8bBpwVS@e129823.arm.com>
 <1968ed37-3836-44df-a266-9a37219c2f6f@kernel.org>
 <aqKTkkK0wnm6cqpX@e129823.arm.com>
 <3aad90e1-5081-4f8d-803e-e9f593ce581d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3aad90e1-5081-4f8d-803e-e9f593ce581d@kernel.org>

On Thu, Sep 10, 2026 at 01:27:41PM +0200, David Hildenbrand (Arm) wrote:
> On 9/10/26 13:25, Yeoreum Yun wrote:
> >> On 9/10/26 12:54, Yeoreum Yun wrote:
> >>>
> >>> Agree. but there seems the case where discern whethr the mapping is
> >>> with regular file or shmem like tmpfs -- khugepaged test where using
> >>> __shmem_ops. So I think it would be better to keep this as-is.
> >>
> >> Let's not add or maintain unnecessary complexity.
> >>
> >> hmem_check_huge can really just become check_huge_file.
> >>
> >> Even file_check_huge can just be simplified.
> >>
> >> There must be a pretty good reason why we'd want to keep this.
> > 
> > Okay. then I'll change the check_huge_shmem() to check_huge_file()
> > with the separate patch.
> 
> You'll likely have to make both behave the same under the hood first to then
> remove check_huge_shmem().

Acked.

-- 
Sincerely,
Yeoreum Yun
