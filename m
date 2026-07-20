Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE720436BC5
	for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 15:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784562548; cv=none; b=LvHJZkhVgzdLVcmN+FJ4wMmjFAnHq6mDFEhxnp+4WHKv/vkorgYXuLpEa0mLUAdG5rcT/3mKwKM1QppD8521O1VNtH3nGYz16ujDD2y5qlfzK5bE5UkZvXd/BIQbvKSZO+BmCkBypcuz7XTomPBd0swWgv95tp+0dBq2borQqWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784562548; c=relaxed/simple;
	bh=iagDN9MQzUvFfugJi8ZOtR1qNU9GWfiOIuQ/KX35R/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kViGVpO/+S6fG3y9PwGrZOq4TgT5Gbrh5HHsSADhz6oiTLhlpf86LZA3bTVFrPplQz4ubtvxtgVk1Zox7SWn/fs3/Qo2r3TuUpHEHI8Ix7rbBKWz8KIK0V07QGIz5vyaTvmIhRdAAcJJgowfrZ+wK3Lrv/fx4yJj93PZUoAIIUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Oz6w8IK5; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Oz6w8IK5"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-930c0f9c1b1so231316485a.1
        for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 08:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1784562545; x=1785167345; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=89meaKDhwFe10Z71hE7i2nRHODsJTbsiRnn58cHYtjw=;
        b=Oz6w8IK5ZAwjM2E9DgdoVBHJKXQkwDwrOnCBPa/wPDQNh683mkFqvwchbawBzpersU
         lj++PO8JAi1kix3SYjAsQlUsF08NCuwdBpR1vVso7HCgyZixchhFEWLB4Y12JC/HIi0R
         tcJzqSdLBUSfu7I9EY6SvqyxvEsxpeF0wWpMep7tX2zzHUCp4xWwAm0G2qEvDLN+gwbd
         9oe8mVqSlIPpWaIBQKBN5N8Zf4w90sYfSsEL+bFgyK3tUcz/X2fCWdnGFSe4WzIZHCBZ
         019Em8Ep7PoOFEKMjVWIR46FF2YzLSNUe53t1BUzoOkE0Tq4/lSQ0Hd3O/tqZDu0nh/N
         rFlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784562545; x=1785167345;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=89meaKDhwFe10Z71hE7i2nRHODsJTbsiRnn58cHYtjw=;
        b=hdLQoWEdflOyLpZHGMiYda0igpf9CTnVYXTjPbtMRHTpp9sEajCDtbX9HibMvm3gjB
         ASQlHpDmHM9fX0BqUtmP8rMQVD3IxW/HPyVkQip14hpmoa7UffC//GHNeTPHvNIhyCMb
         pvbjIs7rFbgBpeDJz+S1NnDtD8IeDCks/BJNp0hENA+QQzq890SGHAMveZydj3+6YHAV
         LsoPZC/PXZfwkioohSluPnDnVrbPxjJR3axnvcLT3p3sr+FlR2xQD9mCAQGDHQTP4Etl
         wsO1RH9ygAdm6Y4Sr+aM5tcq5rjx/6MHiUVsgXjX6cqdTZ/fNa2b0dWLqbtrtQ8rWHEE
         A88w==
X-Forwarded-Encrypted: i=1; AHgh+Rpu+HI3Ch0dHNNtw3CCIGKEtn+sP/HDyoLKIFfAq941AlINTzQeJQ/PQVbJl6JHPUvA0rgZHzMKTPrWCmH0MYY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAR3cGTHdh/1RANPb4CtJxCi/XrrxTlcvEKNQR/VNFezQfk1DX
	AjEzAXYGq1C786yBGPkY6HnYfFR66DgtlQeJHszynQFvFBRJYsYPm59iPrSLtYrFocU=
X-Gm-Gg: AfdE7ckBNRiQgbAPDMaAPW0/IONnurrvm98Fb5SQAnjks2Vtqc3R757J2usPUAs3miq
	whtFYiDnjA/uJgkBGaeEi9wLXyQo9iQb5mv4RAyrBKVecXeuXR7yAx51ORwTFiaRxo7X+KLnZZI
	+m/oscmxu7IjjtrhVTsKxwyRcdyQS6hssZ4zoulUvzllH8dC7/16eLxLir/YkZ+v3ZQM7GIc1dQ
	hYyVCILcav9A3FtFGQ1jkbmGQpFy5e/wxbbEsbdAAa7kUZB1iG9Tdjm+LpFsAjK4VLUTv8Zlb9u
	GlsQGYEjMoy1uLLWUj4iXpPjuVRgt++8WEw//FxK+dag32qeQkBLUVTNUZl8LU/VkfGe6IWeOew
	FoVpIQajd4ani5M71IDaDoI/VKHeuM2ZFDfyQSQOoQmL/sJnUQE87U7vs1RKm/6NEFi3m8YY80h
	S8pKv1rJQXUB8NOUhVSN99AY6JdQPIcN3WXAds4AKxqJtpWvnAuMqSrfd3EA==
X-Received: by 2002:a05:620a:25d4:b0:930:ab28:9459 with SMTP id af79cd13be357-930b41e29bamr1533354985a.56.1784562545561;
        Mon, 20 Jul 2026 08:49:05 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930b54773fbsm894382285a.39.2026.07.20.08.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:49:05 -0700 (PDT)
Date: Mon, 20 Jul 2026 11:49:00 -0400
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
Subject: Re: [PATCH v2 01/15] mm/vma: introduce VMA virtual page offset field
 and add helpers
Message-ID: <al5CPpc7XpRX7Vbt@gourry-fedora-PF4VCD3F>
References: <20260720-b4-scalable-cow-virt-pgoff-v2-0-2d549757a76f@kernel.org>
 <20260720-b4-scalable-cow-virt-pgoff-v2-1-2d549757a76f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720-b4-scalable-cow-virt-pgoff-v2-1-2d549757a76f@kernel.org>

On Mon, Jul 20, 2026 at 03:38:27PM +0100, Lorenzo Stoakes (ARM) wrote:
> 
> The virtual page offset of a VMA is equal to vma->vm_start >> PAGE_SHIFT if
> they are unfaulted or were not remapped, otherwise it is equal to this
> value at the point of first fault.
> 

The latter half of this description is a bit confusing.

Why would the value differ from (vma->vm_start >> PAGE_SHIFT)?
(because it's file backed?)

It sounds like this value can change in response to an event, which
makes me thing a reader could see two values across two calls?

Apologies if i'm fundamentally misunderstanding something.

~Gregory
