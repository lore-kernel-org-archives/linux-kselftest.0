Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793833768;
	b=ybGoBnc64o3VJsCZYguygyrhlG9JeJ7Zd3pZFsyUCyJKnxx3LO/tSORCO/EL/wPk1f9W
	 jyTr9AhTdDrJDkclkz5/JwHKFHbZTLi4gc8jzDfBAJ8lVsO585DHyspIBcLZGKS9PNidi
	 J/BzRJzaQ6pnaC77e9sfBnAloTA0lY1UzskiTUw5YWQ+s1dkfp6+DHnm8aMe3KLSa7B+D
	 QXbAvNU+lr5T4wzjdh4sFdxCaX2Z/mboSmLZk0nh+uWOhSWddFFYqRlcYYIdVk8UDIUVP
	 sE4DSUlnlE8QR5/5LYUSHPQq2gBsoquv2mdSN8tJP1uF7yCpiA3KfPpvq3B42oviqRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793833768;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=QJ44xLdhQI1uBh7xxp/N2gaMNtMNeyLEDRfUNR/7E78=;
	b=w1+LnJRGCwX5Ky7Bp+SlHD9JjmGO4VevEjaD5FGGNY4kmVhzfs2A9u0lnzgja+iaWOIz
	 50mXDSlyXQFgYFJ0h6BtFF1eIVfLkswr6oGfJvvFRD1L6/NXWqz4nulJKhrwqJOWV5NfM
	 4NGrMTO0UCrFCEZ3Xee5pYxNRtmAs97inzCkVbELLhs94W2YtHEbbIFBuOsIh/v80Eu8L
	 uuDvHbbfnSzJ8EqevCaUyzzsDTOGnZPRC99i8Ak59rc7xX80nNi8lmAbf3Sk9EUtcYbjY
	 Dm4odO1olki6zR/Z3fuavc+Cj9sD678Bx3/KCBhKsdODaBHxXJJOoJaGk4tixT9BSOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wjPH+Yne;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C24606A32C
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 23:09:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4C24606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wjPH+Yne
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso9819115e9.0
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 15:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793833766; x=1794438566; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QJ44xLdhQI1uBh7xxp/N2gaMNtMNeyLEDRfUNR/7E78=;
        b=wjPH+YnexCxHCatAS+O3CqB/uti+0YeZ1zpXdmwJfGvl18ME2cwPE17tj9l8RL6zKG
         4YD+rNP0FbGe1DApbRxNUKKDQxKiWWyJsEsiIeD5m3R1WFqh5uyBi5/u3mZOh93btlba
         3eNdOhcnOs7Rz8iwRjpkdDIuKPNF5iof1aLQiDacU5C4shWTx6C57mU+9gbm2GGZcfBA
         p5pZk14nucF2DgMpHAyDsRhrYK1h49CfvSIS462o++nOlfmXwYGmg6Vlq1VcyCgAzpCN
         hIQfwykB+Z6qGuAShuE0FkkN5trrXYAempNz1eSEyLl34fNFWujFVUwcAFwoGY/0fLOu
         XYqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793833766; x=1794438566;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QJ44xLdhQI1uBh7xxp/N2gaMNtMNeyLEDRfUNR/7E78=;
        b=ct248FPvvgaqb1mvJn98AAcOyRyNOr4KHUWzKGn1jpscPeJl+dUxYNmsTdei3Co01F
         6GgvW5S9zYNqbVBLbcsHlJSSzSoWrvm0knhxrj1myRIQnSVFBoSsTUd9jfMFVwG6wLlY
         b8mnuilP2KE9Kr8N5srGzDpLjJUWfj19281GIAwIQhHSzKYjXYvZ4qYIqgw2vZd/VS9E
         2mUddRNYGxRD/XreSDVCwrlwfKRjfv5NyyO9OmMWF9+aTxDWiOENM81W94yjULlj+kEU
         4xd2DljhFAXF9IFyKeuCK0RNvEqYfiSVEDDM76QdAIhK93q3Mco5KrFF5U6Q9z7p/2xw
         N/oQ==
X-Forwarded-Encrypted: i=1; AKwUvBy0ihD98KZpEx5+yvvtTw5UwK69A8nMp6vKoxWoMWTYlk6/VMy7f7kSzgbJAbqAa3Id37XWqLnc/oV3lczVhGo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wxDwbTf0Di/KjtNNkt+SNpJUJk2AM4KLeRcQ4c6X3e26rUs+I
	GvG5kH9VAwIuBvA5N7sPZfOEHc2+NqGHEueSQ5e1OKIi3gTD4oSITbnY
X-Gm-Gg: AYBFou25fD4Qmc7HzgLNBgZH3+xPhnLdhwbBAlwzX6UIXxBalqhIx6gR2gGCPgcyS+u
	wzN9VEqd/AtVCUHdwdXuViDSm+3brf25qrmzqJJiPLUY8usUwjSSX8+kdU54vfS53RO/gbrGlAO
	1LuixhAmmpKPGfQNsow45w2DqBa9vfqA0KotQyTfncnvHkrQJf/2je1QTaU02gkYyxNZdqdFw57
	25seLbN1dEh8xYi5tDN7Uns1gUgbhV6a7fNxa5zmDpLzQQqQljb9qf4SKnJMsIgBVPjyC43K/Jt
	u7Sfm+km9oK2jIvCAhYG1yzF0/mwbGnXqdGtYF7Zr0NDU1f+tUzTfBR9IO++5TgMWDKFNbwHyL+
	eiqru2YlJd4Bs760r6ZCpICl2UC//hfDOfbwSpWppTm1qv7EDbybQLGfQTQpVyh2HE/vZ8c2AnT
	NVCq68LkbyHZHvlkDUNmyH79oOUBEbTaELsBHl3qipoBLAkes52bg6y32FOm5F/hlUn7N8XuDGV
	4AGY7pxtHCH/nzTjo5t9glBpNt9uJQqTu7o9kqGcto+0rP84Dj/JjQjWRJJO3IpUjVb2Pl/TQXo
	4kMD2BeB1om25nicAlbS5Ms=
X-Received: by 2002:a05:600c:3b88:b0:4a1:cf60:dcc3 with SMTP id 5b1f17b1804b1-4ac187a6ffcmr414345865e9.29.1793833766131;
        Wed, 04 Nov 2026 15:09:26 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56e2ae73csm18115315e9.1.2026.11.04.15.09.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 15:09:25 -0800 (PST)
Message-ID: <a9ed4146-691d-4a35-9b82-e60329688277@gmail.com>
Date: Thu, 5 Nov 2026 00:09:22 +0100
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
Subject: Re: [PATCH v5 3/4] mm/huge_memory: read a special PMD under the lock
 in copy_huge_pmd()
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
 stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
References: <20261104-b4-prep-vstor-149847-copy_huge_pmd-recheck-special-pmd-v5-0-c56d0d26f970@virtuozzo.com>
 <20261104-b4-prep-vstor-149847-copy_huge_pmd-recheck-special-pmd-v5-3-c56d0d26f970@virtuozzo.com>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261104-b4-prep-vstor-149847-copy_huge_pmd-recheck-special-pmd-v5-3-c56d0d26f970@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/4/26 9:40 PM, Konstantin Khorenko wrote:
> copy_huge_pmd() reads a special PMD without the page table lock and
> copies that value to the child. The mmap write lock held by fork does
> not stop unmap_mapping_range(): it zaps under i_mmap_rwsem and the PMD
> lock.
> 
> The zap visits the parent VMA before the child's, as dup_mmap() links
> the child right after the parent in i_mmap. If it clears the parent PMD
> after fork has read it, and passes the child before fork copies it, the
> child keeps a mapping the driver has revoked, for example:
> 
> - vfio-pci: the child reaches the BAR after the device memory was
>   disabled or the device was reset, instead of getting SIGBUS;
> - panthor: the child maps the pages of an evicted buffer object after
>   the driver has released them.
> 
> The same branch deposits no page table under the copy. ppc64 in hash
> mode keeps the hash slot array of every huge PMD in that table, so the
> child dereferences a NULL table on the first hash fault, in
> __hash_page_thp(), and on the zap, in hash__pmdp_huge_get_and_clear().
> 
> Take the locks first and let vm_normal_page_pmd() tell a PFN mapping
> from a folio under them, as copy_present_ptes() does with
> vm_normal_page(). The zap clears the parent PMD under the same lock, so
> either fork finds it none and skips it, or the copy is in place before
> the zap reaches the child.
> 
> The copy of a PFN mapping then goes through the same tail as a folio:
> 
> - it gets a page table where the architecture needs one;
> - in a shared mapping it is marked clean in the child, as a PTE is;
> - in a CoW mapping, which only VM_MIXEDMAP allows, both sides are write
>   protected instead of a warning being printed.
> 
> Fixes: bc02afbd4d73 ("mm/fork: accept huge pfnmap entries")
> Fixes: d1503aa9ab80 ("powerpc/64s: Add support for huge pfnmaps")
> Cc: stable@vger.kernel.org
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20261014-b4-prep-vstor-149847-copy_huge_pmd-recheck-special-pmd-v1-1-d225c60bc316@virtuozzo.com?part=1
> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
> Acked-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Konstantin Khorenko <khorenko@virtuozzo.com>
LGTM:

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
