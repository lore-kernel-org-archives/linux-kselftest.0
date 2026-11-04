Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793833545;
	b=i5W2ENf3d/L+88JEAH3e3JsWfq8svZqf/xDeP4MM94/wBROLTvweVOUdoyZ9vZ7wyUOF
	 OKuf4Bqs8kaD84ZYachS/SQpYaqN5MbVy78QKLghfa5zHIyca3mWCoNKMoxe1vRy4JVVn
	 2k4qHiaggJ/iDlhRxMfrLP9pXUt4eH1/DDbzVlQNmXELvIO52zX5x5x8E2k5MAwkWe/vp
	 cDGV9RkJDkjBJxhxQzVUlq/G16m6Zn9B2FsGIR2JlQdnC4li/PSqaFYGysNQcjpW0HIcJ
	 XDfYdQbDAkOL1D2GakmRQyq2Zh9S4XXjtFMJVUceJ/8MqBjVAOVTWgsJOlChcOjoGSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793833545;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=MOpStKtlaMBvTw82l7hk12nLoKUsFYT90GYDj+kAndo=;
	b=D/33ykWQGVMgbUzx8cmef4K50LScRCD+xOMeh0ypkKignZUEK+jfutuJ83aTBVFBxthK
	 TZ65/JAgIukIfXkwg2+oAZ/pypKVVFgxFR/AU+pfLDMpMA8A9PC8GAmRYYVwf6+WeWu8p
	 2l3aYk1v1aKqSZpFsQex+Vmlo29N7nlTccazalxRvZQbM9HFesXwG9XYZ3vsGZQ8Qe+xz
	 g4rxIOF7w6+18rR79UowOc/qboYmOLv+Tdj/1EhWVR1AmFsrXunayNC3Bt2+J6k/MGTC1
	 Wf7TbD3mxTueSiHktRboogGitqjK6UaWzE2850KtfL89iuXeDh4Y55gabZGoVGcJjxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sCwcKa7X;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E189606A31B
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 23:05:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E189606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sCwcKa7X
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so9421095e9.2
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 15:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793833542; x=1794438342; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MOpStKtlaMBvTw82l7hk12nLoKUsFYT90GYDj+kAndo=;
        b=sCwcKa7XbJktqL3hxABBeqm06+tWavHjtuY13tBflSMCRtQb+wZIupMviVt6gaX6aY
         Gb9TJwBPCahNivxGH/4ZBVweXRACmfAUBmS5eRN1ZkDU69Anp6MagJP+cxNGL7+tJgXz
         p+Kcz18jfYceosvOUAwRmqY2+5tFQcQ5tQ2GQkpZ9xudcmbmi/Qn0s1Cd1Xza7qUK+NZ
         /vH11hu6YvBS6n6hCopNr6WXk9fwzMrVX5v74pOHwKCe8+0dkjS1vNPQjdXhvQTlu3Ac
         HJI8b6gp5lEsT/akwfpznC57AQHWn+lgT1UC70Yr97MslML0Ty938MRMwLso/ME8upGI
         bZ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793833542; x=1794438342;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MOpStKtlaMBvTw82l7hk12nLoKUsFYT90GYDj+kAndo=;
        b=jwBGWGMtX3DfzdKXiEdxcnqAVE+Iv4xa9bjPj5MBcHa2kDyZ4oQuQjjhWbAARcE3pr
         DcQ8zKuTGyY+6iqb+jB4IbZAYDgMd6vCidV/J7cn+1aOIpqUkga4s4/AVHt0l+lHPzQw
         Hdp48fvOx8cZIgtKDNhdzb/kEdTDIdzrtwtrVSK3ZcfTJn2UWNJcmS6OGB7du3h/KMj0
         +62K4VVNnYnEjpfpy3Jfkm/gBLOeIjwy2YytNQPgXbdf/8wIffMhu50e3SxcdjRwbzlF
         am/kpWevJ5T8QgRyeYAqYN6FiiNQHoY2H1QUE3Elt7G9TF5WdubXpIVDoCdJyvWBGBfe
         aUBg==
X-Forwarded-Encrypted: i=1; AKwUvBwIlGk90QhZP7fHLjgNBWud68om8N5FsUQfJdJy7nHBl5JXYzjz3PxvGBGG14nltP1tvgjZpyb+Xoze48dtr18=@vger.kernel.org
X-Gm-Message-State: APuU4Z/W/iCCBl91GAsmwfukUU1PEld2p0DwpiGNO3jBVMSJDjLTnueE
	uhFiZNE3EqUFotQfu/tuapMI/QJuN4CQs9ky2BnfdC0jX92OWHFvAk2P
X-Gm-Gg: AYBFou2fZRwDFgBGFfgdZZ6xbBq7aN2l2AHiquGhucDXvuAnkOT91w2UBX3ePH7uXN0
	5MTpvuzsCMrLNLOcePVuL8WudUWNLfei4Ow/L5as4his8dHTx4P9gGP2HGMuz95ohTlz/B0DCYU
	iFJmZyJKf3AX2Qy8L0/+8VXswHG4NrNAAL/iRjZ+9RoEAyet3J2b9GHjABlywwGD8TUlZz6VMML
	IkZ4AQ56C8rDOfIfGZGQjlHxXB8/huAQuExE6a1xG9wK+ZU2wTl6FU9cofoLbitCS58cAPXdQXj
	VCi3OUGcVcuz+Y8/8FO9pfbaG4YC+YZaer4j4XbSI4El6kNFPVQ7oZOWcJUIaKyw3gv8P2QegMm
	6P5EFQnJCBGKHjW50Pqw45bSdvOPgpsbLwFR7cDAY4WJCx21Lk+SQmHjXetH+A4U8rIR3NVUdt8
	1UwgFIjhrNly9I0LieeW0PhupLQbdlVOoUaRjvb3C02ZD0HSI/akzc81GGF+XLRank3vrUjhyWh
	3sub0H2WV6J2l56H7pSPwlGGEBJQCJ16R52NjfN02z5BqoqwOFukP0OXk5r4YW19O41OI9Ap0GY
	p3qwZz7w6W1f0vXK0M8Rfds=
X-Received: by 2002:a05:600c:19d1:b0:4a2:677:ad8e with SMTP id 5b1f17b1804b1-4ac1970b9f7mr379985715e9.34.1793833541916;
        Wed, 04 Nov 2026 15:05:41 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed5538basm5998977f8f.44.2026.11.04.15.05.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 15:05:40 -0800 (PST)
Message-ID: <853a133d-f332-47dc-b7f3-eb57f34d9344@gmail.com>
Date: Thu, 5 Nov 2026 00:05:38 +0100
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] mm/huge_memory: copy file THPs at fork like
 copy_present_ptes() does
To: Konstantin Khorenko <khorenko@virtuozzo.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David Hildenbrand (Arm)" <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
 Peter Xu <peterx@redhat.com>
Cc: Alex Williamson <alex@shazbot.org>, kvm@vger.kernel.org,
 =?UTF-8?Q?Lo=C3=AFc_Molinari?= <loic.molinari@collabora.com>,
 Lorenzo Stoakes <ljs@kernel.org>, Shuah Khan <shuah@kernel.org>,
 linux-kselftest@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
 stable@vger.kernel.org
References: <20261104-b4-prep-vstor-149847-copy_huge_pmd-recheck-special-pmd-v5-0-c56d0d26f970@virtuozzo.com>
 <20261104-b4-prep-vstor-149847-copy_huge_pmd-recheck-special-pmd-v5-2-c56d0d26f970@virtuozzo.com>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261104-b4-prep-vstor-149847-copy_huge_pmd-recheck-special-pmd-v5-2-c56d0d26f970@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/4/26 9:40 PM, Konstantin Khorenko wrote:
> This fixes no bug: it makes fork copy a PMD the way copy_present_ptes()
> copies a PTE. Until now copy_huge_pmd() skipped every folio PMD of a
> non-anonymous VMA and left the child to fault them in again, while the
> PTEs of the same VMA are copied.
> 
> Treat file folios as the PTE path does: take a reference, duplicate the
> rmap and account them. fork then pays a reference and an rmap update
> per PMD, and saves the child a fault per PMD it touches. The next patch
> sends PFN mappings through the same tail.
> 
> That covers the VMAs vma_needs_copy() sends here:
> 
> - private file mappings with an anon_vma;
> - VM_COPY_ON_FORK ones: uffd-wp and uffd-rwp, VM_MIXEDMAP, and
>   VM_MAYBE_GUARD, which shared shmem, file and DAX mappings get from a
>   guard region.
> 
> The DAX huge zero PMD is copied too, with a reference taken by
> mm_get_huge_zero_folio() as for anonymous VMAs. A migration entry of a
> file folio is copied and accounted like copy_nonpresent_pte() does, and
> made read-only in both processes only in a CoW mapping. A device
> private entry gets the same CoW check, as in copy_nonpresent_pte().
> 
> The copy then gets the same tail as __copy_present_ptes(): write
> protect both sides in a CoW mapping, mark the child's copy clean in a
> shared one, and drop the uffd-wp bit where the child is not armed. An
> anonymous THP is now write protected only when its PMD is writable, as
> a PTE is.
> 
> A page table is deposited under the copy where the fault paths deposit
> one: in anonymous VMAs, and wherever the architecture needs one.
> 
> Cc: stable@vger.kernel.org # needed by the next patch
> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
> Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> Signed-off-by: Konstantin Khorenko <khorenko@virtuozzo.com>

LGTM:

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
