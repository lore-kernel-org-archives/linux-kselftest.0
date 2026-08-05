Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B543E51CB
	for <linux-kselftest@vger.kernel.org>; Wed,  5 Aug 2026 08:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785918624; cv=none; b=NDz8q/trsHoH76ZtNgPllzmnoOnht9svLB00/X02kV3l6CNgsm2s4q+kJBy8ybrZ7F+SHtHUQdXvRCjfTzBru6vtEndyTz/cqa/zluO9uCoiOOe5s4vqOvO03Dzyz+IGokXrrkHCUntVv01qzVEbwsnc0ZdjFpL1NE0nEE8e7E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785918624; c=relaxed/simple;
	bh=nQ1NCUDBxf7/2HybHqgxgN+S57hXK/KTaVChqtsEuKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PE9HmoeRfgQt19emkAy8T6fzNRwRj88SDkAg4Ert6HIssKRLdxXr4sGsUIdX4328w6KaMJ/jgNPQtVeIjzZcUKh3CTNCbMGGz4tXOiGUX+dX3zSF3UzAP+OoU3Zmaq7JiBf4KhU5QTH1teuOKS9Gw8J9U/KH+BqTZQS1WLhX848=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=pUmgdlOs; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="pUmgdlOs"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-529a1ee0e62so4289811cf.2
        for <linux-kselftest@vger.kernel.org>; Wed, 05 Aug 2026 01:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1785918622; x=1786523422; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XOBR/YIjpOqevYoPUdylhCXb2OTHUbA6kWHOmhD/jcc=;
        b=pUmgdlOsxvJguZRhPL+G9WC1e5d+9ulS2kSMmx2aOek7w4UOnlLaS7YJIbgsooO3e5
         icmVyiBHb+h7utIRLgAi782wW4Trb103yvWbzcXTypmsr+PYTxyOWs+5VaNOaLOYmXYa
         lhYWE3dzFEXWN6gyCn0AyTxaV5GtyQY4SdIKGBnyn8vQ8MAj5gk4waGeGBxuAvf6jNz0
         L2EIOfIzCn82cQvZDWxtF2Jp0yPOxPg8HErYFTjyEjCL5AK9l8h17x/DCm0ztjNbxNTr
         NsUbf2Yh15diFSaHQCuue7ao4W6ASo2gnCJPD5tiaa/fNlsnSXfoITf8B7p1Kr5keYye
         aTgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785918622; x=1786523422;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XOBR/YIjpOqevYoPUdylhCXb2OTHUbA6kWHOmhD/jcc=;
        b=gZNrpqjsBYudf+95Ryhhb5UP1Dw2NymG+ugXPtVyYHJ/4PPKkrEwIoJpkZM0snEJRl
         trGqLe94XEf89DhEy70VGY21BxRvmiJX4/I2WUFKmXzPsa3gMx762hcw2f1bya7nAhtn
         Jie0BNO4CLydJ9taIvuQ5S79Wq/0CPgcHKG88FZFFItjrSeO0ZprI0YKHb7OutcNLHtv
         KbfgA+iXo0PmEvTj4MpOhxgXGyBjZzwnh2FNLq/UF5gVt3k0JINT2QbYEqM1zcFCqUEf
         vx6mX1cbfDJQX5hdI+C2Aho/VRcOIpmec9fzowl0ht3kIr3YqoTbFk/c/932uHqemvu5
         Z9mg==
X-Forwarded-Encrypted: i=1; AHgh+Rq4HaQvf2MJctbYiGyn7zx5hr/9D60lTXCc5v7vxt2sv84YmvjFjoFpDVtIKyHz6ebvlxSxFgdwL839ca28wak=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5JOHc+JrOc+VeecUKcG8kG0dyuCnyfgwXTrsVLM2HuKQUDh3D
	T9aBroVKMxwKaR3ovhksm5ocIA3N8u9mUl4NxMZXdtzXa/hQsLjoS5x/NUHf8BZ62Jc=
X-Gm-Gg: AR+sD12UxXbiugYEdW60PSrOH0wzqObUFvIrANtF/SusyQ59jdG3e6AIuDNB10GAz7i
	7GMhHquLrQkbdy4el2EzWAcDlH2/+GG9xMcRNKKwwhkbBTkbP+UX/CeUY+PNtqW1W6cYjTGVVjI
	IV69BAC6z5D7TvO7r5Axzs/JKQBsnBhWlp/WcJY/d20YApz1iRr2zIMABVnnmB3SFhjy0TcGdft
	RUmfxQya1SuDFfKDWqaNQ4mOyQw2NSTCb3CRYZXTP7HzRiKHVztijAU13/9JNlmPe2xxbdceo2G
	BoMQjJ9lQaybD4G7ysXkYKSni/eNWrQ6qLbqhQWaru+rGyx6x9EX4imnLET791ocxdWRtyyPLCS
	CJgPzez+eBXdC9xEjaQW0KnINoi+0jBRn6kq91fAoHMj6975hPP2ONHflLpb5xTJSoVbw6Nn3JU
	mtTXZlxdvH5rEdYVZzyiwebuKYauyYxEJKItI9r6ChB100FimnRy/ER9YmkKNMA6q4c/Hzy/Kx3
	2wi7spnPPeR6weuvXXgvpDOSSHwT/D33mHRHEjGS9MX
X-Received: by 2002:a05:622a:143:b0:51c:1c2c:a8bc with SMTP id d75a77b69052e-52ce61fa747mr43158721cf.37.1785918621889;
        Wed, 05 Aug 2026 01:30:21 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52ce8972e90sm14423461cf.27.2026.08.05.01.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 01:30:20 -0700 (PDT)
Date: Wed, 5 Aug 2026 04:30:18 -0400
From: Gregory Price <gourry@gourry.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, 
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
Subject: Re: [PATCH v3 04/15] mm: update print_bad_page_map() to show
 anonymous page index
Message-ID: <anL0LEhb_bp_uQ1J@gourry-fedora-PF4VCD3F>
References: <20260729-b4-scalable-cow-virt-pgoff-v3-0-e8ecfefea812@kernel.org>
 <20260729-b4-scalable-cow-virt-pgoff-v3-4-e8ecfefea812@kernel.org>
 <amrvgjPNfKqWPUU0@gourry-fedora-PF4VCD3F>
 <fec1be38-406d-4656-95eb-048729afec40@kernel.org>
 <anBqV9z6hVLIqoIn@lucifer>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anBqV9z6hVLIqoIn@lucifer>

On Mon, Aug 03, 2026 at 11:19:17AM +0100, Lorenzo Stoakes (ARM) wrote:
> On Mon, Aug 03, 2026 at 11:39:11AM +0200, David Hildenbrand (Arm) wrote:
> > On 7/30/26 08:32, Gregory Price wrote:
> > > On Wed, Jul 29, 2026 at 05:48:39PM +0100, Lorenzo Stoakes (ARM) wrote:
> > >> This is potentially useful debugging information and matches the existing
> > >> page offset provided.
> > >>
> > >> Use the raw __linear_anon_page_index() function so as to always output this
> > >> value regardless of whether the mapping is file-backed or not.
> > >>
> > >
> > > Begs the question whether we should mark the value based on whether
> > > it is file backed or not, but i suppose you can gleen that from the
> > > other printed values (anon_mem, mapping, vm_ops, etc).
> >
> > You mean something anon_pgoff_t or what did you have in mind?
> 
> I suspect he means e.g. adding a (A) suffix or something? Like page offset xxx
> (F) or yyy (A) I guess?
>

Yeah just an F/A in the print I suppose.  Sorry if that was unclear.

If it saves someone the head-scratch of whether some bug is because it's
"file" or "true anon", given the ambiguity here, seems like maybe useful
debug information.

~Gregory
