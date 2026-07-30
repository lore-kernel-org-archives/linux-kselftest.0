Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D722E33F8A5
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 06:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785393185; cv=none; b=lDn5JEJuzTnIHjAaTChpNX4Jt0KbTjiRCVL865B5XSal9cPQJYiQ2KPC+OgHDsxSzFkqkWMjqsEObi42j8wQgclon4hJ8YGjt1tjuaab8fdDC2qpNiNPdJiNNYGvHN2vSAKJLscIZZpB2hj2gh8a25jMwb/nrUVk2kx9XudROno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785393185; c=relaxed/simple;
	bh=mE0FCmxFAcg8+2FAt8rKZAFyLmmxB6bNkFOqEWN8ZzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hy2qxlpanEXWW8diRb1cHppW/PnxUiSFDf/5O4PZUpeYwx/vkAmSWcCG6aozVybSV4ZutLfhm7CwExG0l2uApRMqt5bOuVa3q5fHUc9tYGb0A3uJ1NOUz8z30vGZ2w0CgAQM0Y9pzpxkBk/LWlLEZis/ZlwXNx+LCnMAuw0XRQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=jJU9QT8y; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="jJU9QT8y"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-902e4af2d9dso3581076d6.0
        for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 23:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1785393183; x=1785997983; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bSQdFbtMw22wegisDIIs9GXGwF8lm4tP2s7WAQxucNU=;
        b=jJU9QT8yJtCAp65+9EuO3Geo3Vhl1afACkQb/QTuW4PGYHwwpsdgJEMFkuDag/6kk7
         m7LGrtoq9CWm0jj+oNAAnFIJ+1uA1OuB4R38o8IGEQRB8D4Bc5OoG87rt7KBedmO54Q8
         /ITFQjtFaTt/hyWdZH2vHU5Flo/tI+o4EDNXU+g0lI2BWO17OKpWMtBSZxFFxYOOb7Ei
         7UeJW4ljRCF4HQ6VSnXxTaUs5lZq4ai1qnnTtYd7kN9ehYyQjgbL/AeDDO592uBoRXYy
         Jsk3GaqMFEtSsfWznYZs/1Xv13b8+Cm3s/EkNXi7G3oe2tes9DXNWV7zCrT9T6cPFpRh
         ep1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785393183; x=1785997983;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bSQdFbtMw22wegisDIIs9GXGwF8lm4tP2s7WAQxucNU=;
        b=ppEePard1M5+aZ7y4vRc5SZ2qCsjWCj/znJx+jCnUi9NFT7Z1QjHjFyJqGIPibNlVV
         SJkXBp7AhKaAd0FO4smhA3qRfZQbBVFcnDmefql9hx8K4SIotZgLS5aq7rT4KAtI7K/o
         rq6dj8aSDs9MAN9LsEhdwh5w7fIQPwMPHfefU4trnqKYbX1GyEingVRDBZINU/JOoP6t
         bmC8pzfGCnYNrAMXkWhEdF77lTBG9ntbJB2T9nD0Hx8QS1+a/lvqV3SOL9dqK3+97u5M
         lOVnShnZp84HbcGxBVz2dnBv3VyVndSluSIQZ9Voo0JJe+ZqptEidyIeG1C1XCm38XGO
         USGA==
X-Forwarded-Encrypted: i=1; AHgh+RroxIIZw6Jh3+KB+p8JRFwFcZd/dWMgc3VfEaayQ92quk+6MrTvmk8DVqApEZs48UclssumvW7KHnnH4dzJpJY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsV+ZBcQpPHGFpbNk84N5lqKDQHbCSj5nMnVhuPjA19Z2bibCp
	2GSbOtYIYtaIh6Z3fTcIIusg95yXwRYzjwSDCmBl7rcb5Bx3oRIWjcadebiQQKxwMk8=
X-Gm-Gg: AR+sD100uQWHu50ndNjPqGVJwbqpgOBzQp31LE//nRkCbsjkd9t0A2PxnF9c9LWxw6G
	TmieVepGrLb4nZqSh31f6YQKEDUaVrIGJEWwYcvjOYYY5eTK2wnPO40rV3FglOWhpQPQAeOMocd
	5w/5T5Hj0RKA/7OPVVsE90Ub18B8iqZikDWRJuoyU3cqECI7eX75lVkP0SBBIyDLOjtQQqu19va
	p0h9nBISS8S1/WaGfDmL3ZWSYTWd7joWSTTnUMfDGTzFERLbFB8Ch2sQBX8p0UpFDBeuVM4/UKq
	EcVcOYnLgbmMbcdtQX4dOqqUrJN8anxg+eoDAb38nfSO0Jkl/s3jUce+k5lKNEsTFQxWTITLH4D
	9nMRFuEbmpkYLRslZWDQnZ6Mcw0d/DxlRKabeX8CnRkrAmUabpqCNd84+FeoXRxtHlIWC50pbKT
	VojEwQmVfiDttZk8dj+MNRQLKEI9rGv/bqWYjE/M+GVwYLBfwow+suS/VSOyqRScLWrd0PouwQR
	2RjGp86Rl8QK28qYwTwky4O3kow/C74Ax1BFye1sUOxagZAHQG8Udo=
X-Received: by 2002:a05:6214:4b03:b0:907:8960:fb59 with SMTP id 6a1803df08f44-908351168b4mr10279196d6.34.1785393182683;
        Wed, 29 Jul 2026 23:33:02 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908323e7697sm10555086d6.25.2026.07.29.23.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 23:33:01 -0700 (PDT)
Date: Thu, 30 Jul 2026 02:32:59 -0400
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
Subject: Re: [PATCH v3 04/15] mm: update print_bad_page_map() to show
 anonymous page index
Message-ID: <amrvgjPNfKqWPUU0@gourry-fedora-PF4VCD3F>
References: <20260729-b4-scalable-cow-virt-pgoff-v3-0-e8ecfefea812@kernel.org>
 <20260729-b4-scalable-cow-virt-pgoff-v3-4-e8ecfefea812@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729-b4-scalable-cow-virt-pgoff-v3-4-e8ecfefea812@kernel.org>

On Wed, Jul 29, 2026 at 05:48:39PM +0100, Lorenzo Stoakes (ARM) wrote:
> This is potentially useful debugging information and matches the existing
> page offset provided.
> 
> Use the raw __linear_anon_page_index() function so as to always output this
> value regardless of whether the mapping is file-backed or not.
> 

Begs the question whether we should mark the value based on whether
it is file backed or not, but i suppose you can gleen that from the
other printed values (anon_mem, mapping, vm_ops, etc).

> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

