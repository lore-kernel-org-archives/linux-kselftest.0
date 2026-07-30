Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E87433AD
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 03:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785382332; cv=none; b=VMN+xwYTDb85SfB+iAvpedXoPm3XnkgRrdr7cVjYGQsAsoA+DY/vobW4YemdQ7QKwA5SFpnLBRTq5sI9CwgT/D4DFTqrutIQpuo5Yq3nbyFj5YLf8ZjJ5OCcGD1t+1auWdDmsGA/OzgwR8tmeDZye7X3Nxd8xbrTa7CDlHjNncg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785382332; c=relaxed/simple;
	bh=V8PGeWeyokDrNTSzkeX0jP1Wwsix/DVehHwbDVareWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QSTCiz8U24KbdahEbuqIAAHAmyoio+h1SCQhfdo1ZAUo3uqD5s90oQLRUYC9lMXutsuijANUFpGCopXk36rFMOAcYWZd6ntj7Q4yxSIfcBxCswHIVnNOfH9Qz1UHm4tSwN5gMmdniP2uvaNk+OZij0tINPcEYnxNaRTSMZVYJ/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=FJOXcIr7; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="FJOXcIr7"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8ee43b3e5abso12108366d6.3
        for <linux-kselftest@vger.kernel.org>; Wed, 29 Jul 2026 20:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1785382330; x=1785987130; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HJ2tPnxbrcFKcFZzwn864hCbrfOqlBJ/Hk+311dwGeA=;
        b=FJOXcIr77Ck9WU5lIz1XKl8wt0M1P/WB0i+NClo1czpP0tyf3qiQiJeFFHw2Yumbj5
         EP3jyHB407dAb4Wmb/BM8axIqZecYdKUvtrRCGQ3um4YpEvqjk/dQdXnyUOLNbzTFxMZ
         +LotiaZgwOKlEj3e80/PPwQiq+uSlmpEKLCTeEd6qDtwU3AlvjBr4uewcuyyVXvEM91F
         vkSmX8wjCKFyYTIf2jzof6weHIWEhokGXu33ebTUbQYAyE4dYsXMqwhZ/ZrAHd4TTTan
         qS2KM1AtgpkbI17z0dAioxxW2v03Vf0tRMNGLAxds3as7Pg4a1B9FIc1stFR+W28llRi
         cWkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785382330; x=1785987130;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HJ2tPnxbrcFKcFZzwn864hCbrfOqlBJ/Hk+311dwGeA=;
        b=ZgipLYlZ5D9IEydygfoxz20tDGVQN96VnH8VQRctQ0oMUQQagN1F5LuvzL3WqFUbKq
         NnUudp5gz4Yddx4g+GfzQuC2mr9+U0/7rxeesaBs1QA13CaWVVOy+CRbFBG3Q88oQNuL
         4W1N7jDzworxCy/aE7cH7XiYbEHMfwnEImOQTlfIe/l4vUkB+4ftce9Nuu1zO90TS4iX
         OyQ0LcjmHEcl40uW4cGtlOjQfB4ln9Us4My96MP0Y8jReUmN5NqlDEJ233Dxpu3jOj8m
         DYwYr2dW370od+KC/pahT99QQ7VntS1LpzoDg5skeC7uS/2Y+vXFN3GqJdWdzjNsps25
         8QcQ==
X-Forwarded-Encrypted: i=1; AHgh+RrxFqf2zOyF8n/HUGJ8kl8m60WhLyAXrkDyvouYLrpcJQsVFwvi3cayKAztdBq5/BIyeGMroOCfodTI+j9D5V4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9OwFR2ktVge/v5qdM2ZAyYbNPZov8dWZe6jbYF56nKAcBiiMd
	/gRPDbqZx6S3x6Dzmgix64lr+i+Kdlo5XN3bskrWrqpGhLh7g+yO/ftL0y+3tH9/Liw=
X-Gm-Gg: AR+sD13M1tkCFH/QHCc92wF4M4FwqkV5u9MkjEdoMZvt5J0YMpDRcoAyjr03pYMnFUb
	QOwN/Y2SqDMsr59bRuODxe6R2pu/jPkefR2gCVdG7l6frDlXuGZdH8ijyh/2U8cE2KqOPt8VuMZ
	FUVNZ8FpJpQXl2afEd6mDYW/IMwW6r/IIEgy6bIly/n+wBos850Itj4TgDXZHPEHoVDVj+YG9ec
	jDiGqJYR5z0JDXtbi64It578CzZQ3PbVwtsKxXOCFLEE5rwsBQyXmvorV1cROOk0Av+k17gRXtM
	qFFhSM7jJU1Uv9n06dvkxvvt0dgeTT3Ne7IvHuheMawM4u0c5sc9ggazOTT8yiM9eAHMJlP8wMA
	7hf5ZVxvtDEBxbm5tYBlAUGYOjGJBgdXham22FS91dsWh2uQRty+kdkdyiG3uxobBW8pw2C9JbO
	SmrUQuSZxW8Na40uiRQlcneTBmPCmcmbqdimOmt0D/ujB32c4pluqeAawu9+ZgDWyUSkXF7oyY0
	HREGVWdMKLMhSRL3cNWOaoN4FjZyFcQya3tC1VNwsDJ
X-Received: by 2002:a05:6214:3b88:b0:8ea:7785:f3e6 with SMTP id 6a1803df08f44-908347b2701mr8202616d6.42.1785382329952;
        Wed, 29 Jul 2026 20:32:09 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908323eb01esm6949626d6.30.2026.07.29.20.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 20:32:07 -0700 (PDT)
Date: Wed, 29 Jul 2026 23:32:04 -0400
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
Subject: Re: [PATCH v3 01/15] mm/vma: introduce VMA anon page offset field
 and add helpers
Message-ID: <amrFcza2MxHb2cTX@gourry-fedora-PF4VCD3F>
References: <20260729-b4-scalable-cow-virt-pgoff-v3-0-e8ecfefea812@kernel.org>
 <20260729-b4-scalable-cow-virt-pgoff-v3-1-e8ecfefea812@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729-b4-scalable-cow-virt-pgoff-v3-1-e8ecfefea812@kernel.org>

On Wed, Jul 29, 2026 at 05:48:36PM +0100, Lorenzo Stoakes (ARM) wrote:
> This patch establishes fields within the vm_area_struct type to store the
> anonymous page offset of VMAs.
> 
> The anonymous page offset of a VMA is equal to vma->vm_start >> PAGE_SHIFT
> if they are unfaulted or were not remapped, otherwise it is equal to this
> value at the point of first fault.
> 
> Currently, anonymous folios belonging to CoW'd MAP_PRIVATE-mapped
> file-backed VMAs are tracked by their file offset. By adding anonymous
> offset as a property of VMAs, we can now track them by their anonymous page
> offset instead.
> 
> By tracking this, we provide the means by which to eliminate this
> inconsistency, and more importantly lay the foundations for future work for
> the scalable CoW anonymous rmap rework.
> 
> This patch simply adds the fields and some simple helpers. Subsequent
> patches will update mm code to make use of these fields correctly.
> 
> The fields chosen are packed in the VMA such that, for 64-bit kernel
> builds, no additional space is taken up.
> 
> The first field is present on cacheline 0 containing key VMA fields, and
> the second on cacheline 3, which contains file-backed reverse mapping
> fields.
> 
> Given the relative time spent accessing reverse mapping fields as well as
> updating them, there shouldn't be any performance impact here from false
> sharing.
> 
> Update the VMA userland tests to account for this change.
> 
> No callsites are updated yet, so no functional change intended.
> 
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Much clearer :], appreciate the rewording.

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

