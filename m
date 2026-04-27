Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84262E54BD
	for <linux-kselftest@vger.kernel.org>; Mon, 27 Apr 2026 20:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777320641; cv=none; b=UJn5XIo3ZVlzQLx938EmzFZoZiH3RQMVDWsOL9paymWEXDO8woJtSjHJenSjupPB4/EKpuQAyowV6pzLV0nu3wD3r8gkNgQhdg9VhuTcM9SNjJnDOgu5KiChAso5umSSloIBPPin7K7Qyizib6QVD9/Vr8mRDOBWDMjeQKTzANE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777320641; c=relaxed/simple;
	bh=6bJZRk7VRD+zl/zHN+fvBcu+sVeXHeGTH6iGszfGv44=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MzPJvQCEja4hxomZz2szEf+5nDJUtXg0snI1pNUNgs8PKXEY1a9GecfQ5W5x0ZMR5iEMFsUuM1QufKmG4P2QqlHt7seQ28FhBld2+FoTLVFWNokv76D5cLqRGcp20gMCbMiJTRsuS9fe0YXc0MY5jXUYlvJQtdfhqjxXFJiOppY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Bc/Ayh/v; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Bc/Ayh/v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777320638;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WtWJa+k+/j6GoRAsuYaJzsipGZCN4xrLFGICBvPF+ns=;
	b=Bc/Ayh/vys8/GobxaursaJoGJFX++E0Zd6GSnye3PxBOleBhAyqdppZZ/Nqb5XpiStFZMj
	dTS3cdHAWRDiunoJkGCgnxU9qQwMJfXvQ7DofpE2Vc9gIIpvgjrvpVVIKOm+ZftAz/L/R2
	wFicjDQeCUcOeW85L4fE2JzBddnz0ew=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-u76Mtm4jNkWqpo-wMH1U3A-1; Mon, 27 Apr 2026 16:10:36 -0400
X-MC-Unique: u76Mtm4jNkWqpo-wMH1U3A-1
X-Mimecast-MFC-AGG-ID: u76Mtm4jNkWqpo-wMH1U3A_1777320636
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8eb52a22eb6so1626869685a.0
        for <linux-kselftest@vger.kernel.org>; Mon, 27 Apr 2026 13:10:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777320635; x=1777925435;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WtWJa+k+/j6GoRAsuYaJzsipGZCN4xrLFGICBvPF+ns=;
        b=Ophr7tif8MPNtZqKAhEPPBJUw6w7O3/oOTcj3GUY69XS+kUhxkRhiPWCfqdafc/Vrr
         Y1GAzW6A8bUP263TYr5dv21gpT2+eftj5hygJcXw1+wSbBeSulDvlZ0uPFcdUqCgK/MM
         M21lMIAcw/arXywKoIKB4n392Yrovoi7XXOwJ1z05FdUob2abg0F1OdjeNTs6ou158s0
         ++U7jLdvImHBoa5Hlu7FmziCLRevyaUoNL3rZT/hkS/2Pj+2cbkuuzVTtihdcOiLA7mH
         cqNiwuAyTDq/nlrVPEjgTGccDlj+sV9Vm7gxDs//DUYs7tvG60sjIGYNhHa37K0qfKL8
         icVg==
X-Forwarded-Encrypted: i=1; AFNElJ+qTnX/1rKoY54IUdzuIiE6XFSLKjKSILXUtxdPr35IwyvFLBp2WGkEMhtqqUgEf+JbwT4wWp933D3b9yiC9xg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnCtcrlRrKoFCgspfQ3npHZ6zJ1HvGHJ+h1ix8bsKhtOP7wJV2
	Y4M9nD2uvvLepPFZtAr0Y3MXfRZTrufMJvH59G/k8o/UHPBiXS5H05jlfIOme5Kq+Z2rLOIsQtC
	t7Mp+gYzURwp1p2oWycUsoLVMGrM3IrOiGL3A5ljJ3W6QwOF6I56Ld3Xitz/OfhWTsM2WTQ==
X-Gm-Gg: AeBDietJix0oHHr+ZxdO5kr/apMY6E3U0zH6eYxqGPBNOdoYZaR28Uv4CRBpjtHJPXP
	masu1m2SXNdrlduEu1eaziQRpvMzM0TibjyGvm2Ov200ZJT/SfTN8ka9KnFRVwpq03bJpD/v/PB
	1gAgpBsJ5xB9leeKaI2jZ39yQVt+fcUDJJnOCT7sU/RS8GcMOOpy6orc8F3J5Mev3+EKwxHv1UB
	9Dx7MTRePNjS0Fxz1lrLELL1bcFWibKaVCpgIQncWiN2LNDhBgILdFrEc6u+beLWy3Sy2VEF91O
	LIZswFUJlwPG/Dyj7KVHp+sWSSDWZsIzcYTpL0AXndNttF+/ZKueMntV7jPACQpMvqHoBGoO9JH
	vjkPPyjCnNUme3F6g24OldtG1mVIpPMxBR+MF
X-Received: by 2002:a05:620a:25cc:b0:8cf:bcf7:fcf4 with SMTP id af79cd13be357-8f7d78341bamr13559585a.22.1777320635588;
        Mon, 27 Apr 2026 13:10:35 -0700 (PDT)
X-Received: by 2002:a05:620a:25cc:b0:8cf:bcf7:fcf4 with SMTP id af79cd13be357-8f7d78341bamr13555285a.22.1777320634999;
        Mon, 27 Apr 2026 13:10:34 -0700 (PDT)
Received: from [192.168.2.110] ([69.159.169.238])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8f7c51ae6easm28476085a.19.2026.04.27.13.10.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 13:10:34 -0700 (PDT)
Message-ID: <0d52f348-5f4c-4480-b854-6b73ca5ae294@redhat.com>
Date: Mon, 27 Apr 2026 16:10:23 -0400
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 31/53] selftests/mm: gup_longterm: add setup of HugeTLB
 pages
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
 Barry Song <baohua@kernel.org>, Dev Jain <dev.jain@arm.com>,
 Donet Tom <donettom@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 John Hubbard <jhubbard@nvidia.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lance Yang <lance.yang@linux.dev>,
 Leon Romanovsky <leon@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Mark Brown <broonie@kernel.org>, Michal Hocko <mhocko@suse.com>,
 Nico Pache <npache@redhat.com>, Peter Xu <peterx@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Sarthak Sharma
 <sarthak.sharma@arm.com>, Shuah Khan <shuah@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>,
 Zi Yan <ziy@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org
References: <20260418105539.1261536-1-rppt@kernel.org>
 <20260418105539.1261536-32-rppt@kernel.org>
Content-Language: en-US, en-CA
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <20260418105539.1261536-32-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-04-18 06:55, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> gup_longterm tests skips HugeTLB tests if there are no free huge pages
> prepared by a wrapper script.
> 
> Add setup of HugeTLB pages to the test and make sure that the original
> settings are restored on the test exit.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>   tools/testing/selftests/mm/gup_longterm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/mm/gup_longterm.c b/tools/testing/selftests/mm/gup_longterm.c
> index ab4eaf4feb7c..6e1de12bf28c 100644
> --- a/tools/testing/selftests/mm/gup_longterm.c
> +++ b/tools/testing/selftests/mm/gup_longterm.c
> @@ -510,7 +510,7 @@ int main(int argc, char **argv)
>   	int i;
>   
>   	pagesize = getpagesize();
> -	nr_hugetlbsizes = detect_hugetlb_page_sizes(hugetlbsizes,
> +	nr_hugetlbsizes = hugetlb_setup(2, hugetlbsizes,
>   						    ARRAY_SIZE(hugetlbsizes));

Are we missing a call to hugetlb_save_settings()? If yes, should we do
it in hugetlb_setup()?

>   
>   	ksft_print_header();

