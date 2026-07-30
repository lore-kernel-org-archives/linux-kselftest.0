Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4E83B27FA
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 06:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785392926; cv=none; b=ByQzz5fWlTrQJ0imeNMsc2z4iwbzRODRxgLQt5JrYaZIqtODa64EHh493v/nA8YfZF+UEUW/UYUP1dYUJnyQto/LoKTDKeYxulgFE5oLZZ/vRRSzhVQkzzfceI27WpFer8EsXVu3gH2sCbCZZzahz3Avd611eUoK7SfL72yraOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785392926; c=relaxed/simple;
	bh=On1K3w81fo3KsHiluy85FHhsNbZ3rFpNf8XA/wTGIuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YC6HQTPY4xvn2U+8gKdJRakQPvUzhEvHQvbiYy2fd3N6hfFlBu7m8m3e1LoNH6frrGnzighTd+cIL3SNVAilnaF3IOzTx0yf4pHAZkGcJt8w4Ohxr93GNRJk1pvSxwMKZpH/0ChdgsPhPO3xAOWt3kjC2YLCwbzxg7rC2QAejN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Xoinvwuy; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Xoinvwuy"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-92e5b048375so95869185a.1
        for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 23:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1785392920; x=1785997720; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BYuSkRMlAL8RFmXTAhfpgmHH3OtvbWBlkpFHBuC4V6M=;
        b=XoinvwuyyCqJJMjYeE7YopI2LKZonCNERKJgEn5p0j1kOL5jpSypAzwv9MmO6uHx6+
         VE3FKIFrwlodVOQ5QkuhSzQJA82N4rVG1aEX71DT5fbmQ0TVhNxDUTqG6DP2YyvgRJzA
         Y8X3c7nCuBtToSOOkmMYJi3gtWBTdH8FsfZzNRc6flOFGmkn32LibInyTiy/FDCxevVV
         dx9ySgcg5a8jmJvLo+tl+CGNDf2hkhxPPmSdW0bDnHEOKwykZAJCMWXQA8YBxPWlsM4U
         A/wUkTk5Gh1c8Cp80l2UbEMGG8vGG5IljZyjR7piGMOBrMLgOba/fTeb0QKwn5ex2wge
         kWXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785392920; x=1785997720;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BYuSkRMlAL8RFmXTAhfpgmHH3OtvbWBlkpFHBuC4V6M=;
        b=mDVjfEWeBK0nCip7mXIHG4kwY+jFs4XlLl9dXKDFL/9afYA+Umv2bBraq7ywctV4Ql
         EvtY3uf4yJs8TG00yQ4paRtcTr5EQrlZuIn+u3r7cJGDaKOvsct1J9fLZ7HPjP/k+oz7
         jSNyGrB/SzCrxSw1r6OfuuCLxVS86cxby5h60wQBBM8J0T9/tDpwHiwG9OZxxpYwj9Hg
         /h/8s9CQhAGGYKkNV0YGJCrXh00R+9VXPU73lF8Zt/ymOPpfXjXFgUmyJOlgBF8MgXOi
         DAGU4WMdZPmhWMy/g9AZMUKrM1Xei4MlYYSTd73XBtVezIDO3tD1WJapbqnClv2Em+kg
         jnrA==
X-Forwarded-Encrypted: i=1; AHgh+RoGUdYS6SzIeW0/TFg0CULMrK16hIKlyelbLIv0c2vrWoW+/skEwM0BELBNLAPkNd8SePOlMonBqCrCmxFxP4s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yywg8SzRuUCngDrsa8SUw/2xupJOb3UEvzCePOkzEHnDmarpJTY
	pCgxt9UCWM/qwUBpXEIMQ9VHUvG66GosY2Cj6nO81zdEKBLDWycz0+fG1SVF+OAgHWQ=
X-Gm-Gg: AR+sD12e1Ep0+hOZzh8AFq928NDrdu6VY5QCeJcmFcyzXQaV04ADDEOeRKGZ1/01Ud7
	hxTYRcasdg0eRdLCZIPIjJrwSb5awfoIdT+OisT4ub5QRyybEidn0wTzOMQFI0KbYnQsZ2vqAWq
	kmKz2ZWyoL3mhBVbOv0+Ai5qojStBG4CRaAMIwu9MWRj1DHA0K97W9j+UUz5Pninak2MoZyd3K4
	2txh6mvReoKyWl061C84aHxbdsXkPLywa130trYVnsAavtR+nlJo9nHdmRao1K0nRsDgqxhyACh
	80ZmHA4VCB/I0Srit5MdSghTGckUfwuVgfOtg5QxBAhe3KwCTKrXTYiGeR2V5CxEJWwIKaMpmQJ
	8V0b/dqHFNzenR2kY5i4VMFk1PcskjWs5uMPl6xBCKhjryA/e1T7f3MvQIJgJSzJYFU97aZV8jx
	XMW2lQf/ll5WXSf+CKx8C+NCyfRsAQhjvLUtCygtAZBTlOO3M+4XKrwtzZQwQKL3Ds1uV6nNkZ6
	qCZ6hedB1ixzZsj5ZcI8DhoxgvSKWjXxrmOE6pcEIglywejbltGm8g=
X-Received: by 2002:a05:620a:252:b0:92e:fe10:3f02 with SMTP id af79cd13be357-9348613d64dmr94585385a.51.1785392919868;
        Wed, 29 Jul 2026 23:28:39 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-933e7318180sm346275085a.28.2026.07.29.23.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 23:28:37 -0700 (PDT)
Date: Thu, 30 Jul 2026 02:28:35 -0400
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
Subject: Re: [PATCH v3 02/15] mm: introduce linear_anon_page_index()
Message-ID: <amru_6sVmelONPh8@gourry-fedora-PF4VCD3F>
References: <20260729-b4-scalable-cow-virt-pgoff-v3-0-e8ecfefea812@kernel.org>
 <20260729-b4-scalable-cow-virt-pgoff-v3-2-e8ecfefea812@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729-b4-scalable-cow-virt-pgoff-v3-2-e8ecfefea812@kernel.org>

On Wed, Jul 29, 2026 at 05:48:37PM +0100, Lorenzo Stoakes (ARM) wrote:
> This function provides the anonymous equivalent of linear_page_index(),
> instead offsetting based on the anonymous page offset of the VMA.
> 
> It is valid only for anonymous or MAP_PRIVATE file-backed mappings. It must
> not be called for shared file-backed mappings.
> 
> For pure anon VMAs, this will be equal to linear_page_index().
> 
> Assert that both of these invariants are true In linear_anon_page_index()
> and implement the algorithm in __linear_anon_page_index().
> 
> Note that MAP_PRIVATE-/dev/zero mappings will satisfy vma_is_anonymous()
> but not fulfill this invariant, so when asserting this we check
> vma->vm_file to account for this.
> 
> We do not update callsites yet, so no functional change intended.
> 
> Also const-ify vma_is_anonymous() to make it compatible with the
> const-ified linear_anon_page_index().
> 
> VMA userland tests are also updated accordingly.
> 
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>
