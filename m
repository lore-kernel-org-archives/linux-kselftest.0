Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E7F3B47E6
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 06:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785393573; cv=none; b=rbFwcXCkRPzRAT4dSgLN1Jc8TI5QV3eHoMwuKkMLJO4WjqpA5CyE+gc/5nKEMHni84G3BS80MUyZEQIsmvUbg8EKLBf+bm/+GxmH2H+3mYJxo6xQ+UHVCtXzojWVVdvg6JIVVblOcEgSVYLyOWJG0nLzjakH7IaPb82Lk2YiN3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785393573; c=relaxed/simple;
	bh=WncTQphxVp0l2Tk7Aew9QDDKQTVA3eE7asUk3yooeoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GhodS33WWbUeHD53gu5mf1FKjEkfjfOgXNLFBnhYF62QtDBLRv9Ltq+J6VLyqkyk6SKBs8eEa7bdygQHglC6zmBrj+mwgOjpTELpWEG3RdeWMldZfDtKPVvkv5g4YzToSvSMBKUvrTvZXEsJoXMYtpzOsd2DVmQgCnA+gtXx3DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=r9Bnawsg; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="r9Bnawsg"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-92ea24a2dbfso159770185a.0
        for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 23:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1785393570; x=1785998370; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kOg1TP69pkfX9jACUFVlU927ii/AFS16vNDFEmK7SsI=;
        b=r9BnawsghlDcat/pe84AtaXEUH943VqDqoT86wpPLtvduovJvTkepYIApcK1kcS8dm
         Vsbr2HII615RJDo632lNp0VVIk4jIsyUPPLcjZ8G4kf7MUiscXwqTTMMwLZfyFdC/QnN
         f70GImoBQnn4kdpfMeSMKIUTaVJIokZFnAWahC3B01mdSflxvyXXndmWwaULOUhz0m3q
         tPZTXKH1pcBVfEDmSEhiq8AuTzB3paxBpAsg8AYTUEfIz9cdRVb8d9Zl+BpjDqEH0Bo9
         nLEdgyH+WPJoX/9Jvq4uTgVa8DmfohQOLZK2BWsHLPOhSI6MWT2TSx+G8e8h2lnHSk9K
         fJPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785393570; x=1785998370;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kOg1TP69pkfX9jACUFVlU927ii/AFS16vNDFEmK7SsI=;
        b=o9dsPyiiYDPPnyVf+XHKt7u40lujHPzU2TolK5ctPmJhVSecZg3J6gmsVgqMK1nEy5
         knVLn/aQA1vWeCps+fHE8RVWn96Qd/feW6/W+dP4cLpr7FweBHiTu3PIpCUpAhYTtbn7
         Uly+stQvs4iassT2DuDCpf9tlQKjWCLE279PyQiTJmWQlH0FX05m+AUwCdX1CnxGj54h
         Y6AA3j8Hj1V2CMx6ivh++EoUFYKnoq3oOwmh0KsPqlEw27bvjVbh7iE5nGr8gLS1vPL6
         KCvo/4J8LV+CmS2o8QQMTv6qRsndvCvx6hiieT+Nui6A2e7cs0arxoKswUaq+jF08/rr
         iYdw==
X-Forwarded-Encrypted: i=1; AHgh+RrwYjYueZs5/5RtLkPawrUtJ1dti8clemz+GOWFP2EEdJaOoVDFyPvycWeNE8rqM+tYZj+7w2FWSwmjVBd/mns=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGwPk9aCC/L+wBohnoSDcHIgpOmEJxt+ZpkwLsY4EgQV7fKU+R
	OIVvO7htoD1cbmOq/ee+KsP/lj+j7/ZjPUyBwPaYOJz2OT3MH9IKtzVQ1zF0AxJTij0=
X-Gm-Gg: AR+sD12Lerx2Kcrl68zEX2zFhP6NoqxhakwXEu6E2kbr5GHha46HN1LS/0TngJYUtgX
	yW7FQ0EizyOYkmAniGDokGexaWrhRZ7n1lOSLstzE88RHj/nrbB0DoBA3jRFN2ylcCs6o2wuYm9
	UxuKYOF8Pr8eNi5iV3AlRMhUiXa+p19cVwZ7K258BsYpKeW9CUP3So+Pabgb/IOcZ4AITZHFjRU
	gfGUBLf1nGxdZnNPPbl2FGwips6quYJjFcQyXuvZ2jm0KJ4O6Oe+D+QHxDjJLF/aXSXvV/1sMCb
	bQhHemNyDbl1HTLSKTtK1UgXsb9xZ8f5Sl+LZHvQ1L+wDKhajOXS6ZHdIWMHn9KJ2Y+wXHaas+1
	e/q9QPRFI6YSQ6o1eWLPTppPlAehC7K3i4b3kgGG1J+Wz3MF4OH53554ejZZJqRx92OBkO41F5Q
	NgqcB10IApua8jKRX8Al9HkArA9k0HDkxUuc1TpDJpCyZxhkhnPuWdwQ+52jaCfbyAZLYH49olD
	IVtwsRk3zgXjb3PIvIc/e7MptMa8tVxkARvfHJkSam3
X-Received: by 2002:a05:620a:72c5:10b0:930:ea99:8097 with SMTP id af79cd13be357-93486cf8599mr88361385a.61.1785393570464;
        Wed, 29 Jul 2026 23:39:30 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-933d3221c71sm356647085a.2.2026.07.29.23.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 23:39:29 -0700 (PDT)
Date: Thu, 30 Jul 2026 02:39:27 -0400
From: Gregory Price <gourry@gourry.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>, 
	Pedro Falcato <pfalcato@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Jan Kara <jack@suse.cz>, Miaohe Lin <linmiaohe@huawei.com>, 
	Naoya Horiguchi <nao.horiguchi@gmail.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Kees Cook <kees@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <npache@redhat.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Usama Arif <usama.arif@linux.dev>, Matthew Brost <matthew.brost@intel.com>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, 
	Peter Xu <peterx@redhat.com>, Xu Xin <xu.xin16@zte.com.cn>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v3 03/15] mm: abstract vma_address() and introduce
 vma_anon_address()
Message-ID: <amrw2v7TVl_AG5_3@gourry-fedora-PF4VCD3F>
References: <20260729-b4-scalable-cow-virt-pgoff-v3-0-e8ecfefea812@kernel.org>
 <20260729-b4-scalable-cow-virt-pgoff-v3-3-e8ecfefea812@kernel.org>
 <amrV0Y7ZUtihiB2B@gourry-fedora-PF4VCD3F>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amrV0Y7ZUtihiB2B@gourry-fedora-PF4VCD3F>

On Thu, Jul 30, 2026 at 12:58:22AM -0400, Gregory Price wrote:
> On Wed, Jul 29, 2026 at 05:48:38PM +0100, Lorenzo Stoakes (ARM) wrote:
> > 
> > This will be necessary for determining the address of a folio's index
> > within a VMA when the folio belongs to a MAP_PRIVATE file-backed VMA but
> > has been CoW'd, and thus is anonymous, once the anonymous VMA page offset
> > field is used for the reverse mapping.
> > 
> 
> This is a doozy of a sentence... 
> 
> ... determines the address of a folio's index within a VMA when
>   - the folio belongs to a MAP_PRIVATE file-backed VMA, but
>   - <The VMA> has been cow'd
>   - thus <The CoW'd VMA> is anonymous (as well)
>   - The original VMA may or may not also be marked anonymous?
>     (just clarifying, could be original mapper or a COW that COWs)
> 
> Ow, my brain.  One question below
> 

After re-reading the cover-letter again - my note here is wrong and
my brain hurts more.

... determines the address of a folio's index within a VMA when
  - the folio belongs to a MAP_PRIVATE file-backed VMA, but
  - <The Folio> has been CoW'd
  - thus <The CoW'd Folio> is <now marked> anonymous
  - The original folio may or may not have been anonymous
    (depending on whether it, itself, was a CoW copy)

Lorenzo you are truly doing Darwin's work untangling all of this.

~Gregory
