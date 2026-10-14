Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0508910785
	for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 21:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792013203; cv=none; b=CSWQ/LXY2zg8cfsS//Brb3qWiTm1F9vNGbHWPOXHS9bMV4B7f2YSV2hvzcsGPaJo5LYq10WHx7XmOB/QYetvY780CS22wq65FGC9T4hrcgsx5E466aZKFpGKt+oSIqcO0L39Gp8HDu9ZRMTsfHX6gt8k+fQ+ixjnKmqlD0+cUj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792013203; c=relaxed/simple;
	bh=+tmS02gDA463BcaTtTeQCviX6MTFBVXJ76TXlGdnOMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hhFgY/xZvoH5JuTFij3XPDcIXJ8X/F7/PjzyPTGLn7MJ5ar6zGwm5evvc/2NeNymGkuOf9xwTh6cQRPFxdZ++UEplZP0nn4B6tTjW7G6OfciLMd0AkTRcm4rw561krJ3UNdusoksATe0qAJz4TkWjQtSdX0j8mvjF1omwvwF0eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=eDUVeyO3; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="eDUVeyO3"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-91ba8fcc684so17270586d6.3
        for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 14:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792013201; x=1792618001; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SgefoZU/7a8w/FLm1udAZKNsvens6D/F+qkIP8OB5hQ=;
        b=eDUVeyO3s9Qc5qzmBBBtDyb7LXpY4L5s0xbNXEnMuoyEIcbTp+Eqs6shtp6K/sOngZ
         jUdEXS449bMwREPxD8bsNOYRUaDOoFXX6WPoVNgkPRwZ5JYgyeDSDYUOuwsMsu1uIdSM
         my/UgugHixpUY8vKsG+R4bYmmKw6OHOYOylYD8NfajpuaMNHLwb3wC/8fsBWyuxz1lgD
         0tY1IeCnMn3aMEEWuhwlO7HaiEnJODENfo9yE+Ihm5c25y0KtT0FoYoTV0BQiHj+Q5JJ
         4yRNxI3ff22Bdm+tG6rXyT6nJnuqzG7n3SnLmbaJTOnHpQAusvasrB1ZauQjT+E0u0VI
         QrgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792013201; x=1792618001;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SgefoZU/7a8w/FLm1udAZKNsvens6D/F+qkIP8OB5hQ=;
        b=jTxI6ItKwfBxwr5T8vUkEdInHXw/C4Q0NN0/JeTbIGwrQpbjQJ+sUeRnusTVsbiFta
         zUS8/xDHhz0jwACXkCqYvAzzwKKtPHNcTw8Ox9ag951MS3oCttNtFy4zbnd+tUB3BmgJ
         plpwty0DjxS0LmkO8XTEDPRVsoHt1cmsnCIJNDGQguqSvPn1fCf+tpDmFvlbSaIC6Lzd
         eR+AUnnnB1vZYmU5OrIaxzweorbiEgWRWP3IKS5bnFTuFMh1UiLSn9Y4epVuML+w8BQX
         5TNQE0tIwrUtb5M2WWXUWrYkdIzWT7EreHxS1U6IRacuSks4q4i5IChNkuNQWDA1EayN
         9mTw==
X-Gm-Message-State: AFq9FYLo54S17lE/fTY+NJmPQ0CtZGJpWnqTGWBywN/9nNa7UXZQI1TE
	x6Y4BbeSEB6xwpVEPnHY4ktnXULPzhNQG24BEKwwbYkiMowGJ/6G4ZL2z709jkyRuX39kHixiG8
	y0FZbZqo=
X-Gm-Gg: AYBFou2eR4GEkZfllH/c7nO6WT8RW9Bni0oDG/CaT4pT/u5oxk2WIcKSjJW1ojuzFHs
	igUm1UCVZAC0jj3AYeryBWFbu2NfAoSU4kzL6vde359c80TN6/aboPHHaIg8lj5ycwnvx51GfP7
	X+zhbGhRLLyNgHbsHK5ZsAum8BKK0SODhMhU2ndc48R6fdA8ZFwaUcazZ65TR2593ECcVqs8SEn
	JeArkcLl5cO54Jy9Fz9qDFjDVF1ew81SQ4Nc3+h7CbVux45fwkFFHK5HrWGA2R0XOVHrRYijmI4
	vHXBH9zYt+1poTRxVQaA9TYhyBrfjlP9W0EagUUQ++2AhTirjTBgobKQErMdMwZzQPZNRcFpMmf
	a8p+JoGDZCeR4bjVBrszTJ3sdOanVqAT8+i6iSdutoWipOFu263NhKndD4YoAMdiMpTG8LCaN9M
	PJI/tTTyz2hd0hVJx21iM4dNLFUnJ0AEQQh1AmERLz3bqhh65uskCt41hwZ5eM5pMETAPGqa1dM
	v3pjmOd3b+ZXBHmi1E1PEA4s1AqivHNYrZNlFsLc+dXkTulYEafY6I=
X-Received: by 2002:a05:620a:40d2:b0:93e:4d07:14db with SMTP id af79cd13be357-93ebd1e0133mr2853002885a.24.1792013200873;
        Wed, 14 Oct 2026 14:26:40 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b95847sm62808216d6.32.2026.10.14.14.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 14:26:40 -0700 (PDT)
Date: Wed, 14 Oct 2026 17:26:38 -0400
From: Gregory Price <gourry@gourry.net>
To: linux-kselftest@vger.kernel.org, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, liam@infradead.org, 
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
	shuah@kernel.org
Subject: Re: [PATCH 8/8] selftests/mm: check that unauthorized MADV_PAGEOUT
 skips large file folios
Message-ID: <as_yViNexNHzdD7l@gourry-fedora-PF4VCD3F>
References: <20261014175756.2035176-1-gourry@gourry.net>
 <20261014175756.2035176-9-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014175756.2035176-9-gourry@gourry.net>

On Wed, Oct 14, 2026 at 01:57:56PM -0400, Gregory Price (Meta) wrote:
> A caller that neither owns nor may write a file may page out the COW pages
> of a private mapping of it, but not its file pages. When the advised range
> only partly covers a large file folio, the folio must be filtered out
> before it is split or reclaimed, on separate paths for PMD- and PTE-mapped
> folios.
> 
> Check that partial MADV_PAGEOUT by such a caller leaves every page of a
> PMD-sized shmem folio resident, both when a PMD maps it and when a mapping
> of half of it maps it with PTEs.
>
... snip ...
> +	ASSERT_EQ(madvise(mapping, pmd_size / 2, MADV_PAGEOUT), 0);
> +	for (offset = 0; offset < pmd_size; offset += page_size)
> +		ASSERT_TRUE(page_is_present(self->pagemap_fd,
> +					    mapping + offset));
> +	assert_filled(_metadata, mapping, pmd_size);

Sashiko reported:

  The commit message states that the folio must be filtered out before it is
  split or reclaimed. Since page_is_present() only confirms the pages were not
  reclaimed, should this test also verify that the underlying folio was not
  split by the partial-range madvise?

I'm fairly sure this is a false-positive. Splitting a file folio unmaps it
entirely, so the page_is_present assert would fail.

~Gregory
