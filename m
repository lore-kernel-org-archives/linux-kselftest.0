Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7A623D2A4
	for <linux-kselftest@vger.kernel.org>; Tue,  9 Jun 2026 18:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781030040; cv=none; b=rIDs6nXwW1KcA76Bw7xxtqQHm8Tuaup6ffkldggKGs9Q7hxe9IjDxVn1y2zq3CBy0pMKP3IwOHWKebxXwW80lSSp/ZG12eHchszEQzRAEeQO8BfH0Dto4xCbd8P4f3LmOZFJnDvajCsVg0wkGlY8WFXtwwQJsO6PgSK/3+0jll0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781030040; c=relaxed/simple;
	bh=YPBILIJB/sXgdKpxBDocoTsa5FDZwh7jmpWEGCgXIzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SWC44Ty/3llEwFIKOVozdwNKKOj8cMh8iNJd5bdi9eFYtlNTWFW8gQVJuybOJC7YpOJpPVQ5MjRzuKCGHkpFb99jKj6GNLl2s82SaGDNhLbWgZq4Po/ZNtgt5Tj46WGqekoji/rh/gTNomeOsPuyy1cHPr4n6y8fonMktm3elA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=cmEBbWi9; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="cmEBbWi9"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-9157b94a07aso686806485a.0
        for <linux-kselftest@vger.kernel.org>; Tue, 09 Jun 2026 11:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1781030038; x=1781634838; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OySD+ExhHPCEiw9aOnLHfgmqMe+Ca/7oT+zDoVBuOjM=;
        b=cmEBbWi92Wbz522rBYJQGkJPku6c/7g5/AvRQqFIQopotI2vvtpnI5NTKyrfqxNuIR
         Kdi7/zeqjL4VSHNr9BNcxZzN4FBX2/pXaJSn5WSlPI+ntggWDxeAUDSHOWNhZhfntfTB
         x5HTZlcoVSPhA8BIdK6b0+QiGGsK3sZdyopSb0CMvtdlvjDKiuZgc57I3nKrPdurzxKs
         zSoKv5WA42KbXP3dCdfef09GbK28iVTi05SyC6vTACKHVFw6WuY72QXHwUDJE6uaUh/X
         RLxl44lBi9+lk5biFRE6TftERtjCAqVkXeQU/Pf7W0UoTZRLIvnkwv9day/rRUmyr3SZ
         DwUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781030038; x=1781634838;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OySD+ExhHPCEiw9aOnLHfgmqMe+Ca/7oT+zDoVBuOjM=;
        b=H7b6zYGhRrchh1dvaLtqgoqcNssaNPYMC7v71zxZXuOrHag1RyjW8JI1kqz6NAH4d/
         srhZaq7QYVJL+dpDNNJXEGM2DN7i8RVE9BjucDRs51d6JbhKjtAw9ulwK5GWQnMmCaD4
         6T3DaTWkioTWI1sv7wA2EQ+UJ97VQeiryV+BdGJY9VG7N7ue1Dt8isP4E2OjxbJpL8f2
         yM+GAk3PDpfR/aVKq9y/eMixurt6UVtkMiaUQs4gJsZ6zIkpBnNf4loyygNEXDbHfpfa
         XMn4cJHFrZQF4FrCex7i7ryZiGAZK1PpbM/lTl2yTNzP11ybS6ESzicYpDY5XXHPTWjJ
         iMTQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Bg1/8bdPa5T1+dspnkIvZzhpZ/mIA2uGw/DYN4ogb/AzPOUM9gUjiC5DIvD+mhas6tX3es5wRTlLFWHhP4lg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcQ5orp112by8k/z7ZhHcbNx90uxKv0VMqSsreLzkPR7f+I5qA
	K8ozETQJOhY4/Fu+CMjjrYDQVpnX2FywstXdd5JXEG1WU0atfnVmB7TM6FRV04KwmNA=
X-Gm-Gg: Acq92OEuSNPkRteDCBXI2Ms9Q2nxy01F28fePDkRFCRsvwAH7np0PGnSyvx05+tRdYN
	6zmkV1T17zzbN1L6h03TLKUtkHHaT/4/+KnqnFEBJ6X/Xdo3Blgw6Gq1Pd6fYzl/1rpWaMYnByN
	iKTMfybgT96FmDAHdTue6wGAciFed1CgQBMcMglcrUZwU+fbSVueLYEN/rX9jFHBd3wA7bP3YWT
	DA7zocuvJ+oAMXntDrYIWuAyc7xxM/BA/l/MZcs2WcwhOIcwcDffujYhE2Ut1sHEnU6Nm9ZlUB0
	5+snIlxOQGpfHGQqSI9iFk3e8bNlL99uxFOfZGq4Mz5/6/XMIubR72vgTOKV+uZ1a57zuXoTRWA
	X0b6U4rvZ936rVLgJfhcAI4TVGa96I4gszUh+7ILJAplaIDNiOZsdNHNb7/OIH278wo9wqUKgDl
	CdjBF9lFXEukD8YdtoHz0gINy0A/L/uWXYTtxRC1JMbqtYjlP+3qSSuS6Sr/GWACItoBCtYmlnh
	WIDN9rS0UjquKf9nw==
X-Received: by 2002:a05:620a:1d01:b0:915:9e84:85ee with SMTP id af79cd13be357-915a9ca7655mr3263727985a.15.1781030037611;
        Tue, 09 Jun 2026 11:33:57 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a3eea49sm2158492985a.44.2026.06.09.11.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 11:33:57 -0700 (PDT)
Date: Tue, 9 Jun 2026 14:33:55 -0400
From: Gregory Price <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-mm@kvack.org, nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-team@meta.com,
	linux-cxl@vger.kernel.org, linux-kselftest@vger.kernel.org,
	djbw@kernel.org, vishal.l.verma@intel.com, dave.jiang@intel.com,
	akpm@linux-foundation.org, ljs@kernel.org, liam@infradead.org,
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
	mhocko@suse.com, osalvador@suse.de, shuah@kernel.org,
	alison.schofield@intel.com, Smita.KoralahalliChannabasappa@amd.com,
	ira.weiny@intel.com, apopple@nvidia.com,
	Hannes Reinecke <hare@suse.de>
Subject: Re: [PATCH v4 8/9] dax/kmem: add sysfs interface for atomic hotplug
Message-ID: <aihck-U9nyne98H0@gourry-fedora-PF4VCD3F>
References: <20260605211911.2160954-1-gourry@gourry.net>
 <20260605211911.2160954-9-gourry@gourry.net>
 <1cb0514b-c753-411e-8ff8-80fa29837441@kernel.org>
 <aigy0ut410TItkgB@gourry-fedora-PF4VCD3F>
 <e6e7453a-d2af-4f1a-8930-5e5e5c5879cd@kernel.org>
 <aihZG8WKVSvA86mA@gourry-fedora-PF4VCD3F>
 <06bcee07-5e56-4a82-95ff-2a8e75b7154d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <06bcee07-5e56-4a82-95ff-2a8e75b7154d@kernel.org>

On Tue, Jun 09, 2026 at 08:22:20PM +0200, David Hildenbrand (Arm) wrote:
> On 6/9/26 20:19, Gregory Price wrote:
> > On Tue, Jun 09, 2026 at 08:11:42PM +0200, David Hildenbrand (Arm) wrote:
> >> On 6/9/26 17:35, Gregory Price wrote:
> > 
> > Was going to propose this, but then I thought... well if CXL detactes
> > itself from dax and does this same pattern, maybe MMOP_UNPLUGGED makes
> > sense.
> > 
> > But i'll leave that for another day and do as you suggest.
> 
> Let me sleep over it :)
> 

Have some other sets i'm trying to break out of private-nodes anyway,
i'll let this bake for the week.

~Gregory
