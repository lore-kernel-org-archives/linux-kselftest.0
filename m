Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8A520297C
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 14:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784729100; cv=none; b=XUMLB5NI6knOBWWynwSlOyEIwITM/jsCW4kwjyagMUgZxl7NZ/AsyW64xiwC0zkN/5k35rJDzhAJqTaawQfJ9FV+gpTur/ryaKufq8n6UI8dQKvVN6DPAh1pdWjPY9QpI5I2CosCEGEuAIMS3+yK2SRY2EAPDHEebxHpzXJh3l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784729100; c=relaxed/simple;
	bh=BiKsszl+35xq/ewMPZzGz30tgw5kvnsmDpEO+3lG0vE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rCori883h7Wo0tgNYqUHXArHw2vHrVMp0V58FYyNIdbVK/EYACEIFpofdg3JMFr6f9UYb56jScOAMK3rL0Kl+wzyaXLYsO5fY4qZ3mwA8T/ll+rFyGm0KAQ6ZFEdbUjDw/MKY7HUFyswpzgEShEzKtYjfJdOjHuB5+8D8m1jzHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=mrvhPX8T; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="mrvhPX8T"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8f256eaedf8so149143326d6.2
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 07:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1784729097; x=1785333897; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wzTopji7Zl+MAyFivVnXiZLO5KABEpd5UV02S/KHUTw=;
        b=mrvhPX8TYaW6OdLHwE1oVXsMQJLltg7gssKp5utqf/LuYMMymUzUMHKiHysM64pTuL
         L8ZJEzSGtBUdGHqeoUS/ZfnQohfr5G/UrhC/wRUH3KEFfdFHNSA50wlsbw2D2YHpykae
         ihCSsUC5m6IS7Fmjzsof4Ps0QyK2W/EjkS+7y09grIz4VVqpiGjn7sXKLdzKT/vQfG/B
         FoUnOSa9uvT9rWH0HIZMJpxdrLvtqqPMzscmxRRoeGPXyeBHamY6dRkeIHPPOFi2zbom
         3sQoKh5VsE/T35TkORWJZ7BdBRwCVaEy85AwnwuwDRQCD5ybGnugX0rapf/PmeW7sZkw
         vl+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784729097; x=1785333897;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wzTopji7Zl+MAyFivVnXiZLO5KABEpd5UV02S/KHUTw=;
        b=oDco2gaI586Ev9NE2Cf70ti+NvTzP8nuI+awD8a7MfuLNa21pdaK7TlRnCzK43hA33
         3JbxX4lN2uPV9B8RIeGWHslO/luZayQkjvN6eHU3fBJbvUo0xh10dxg4AEqBdrF+Nio3
         EHpYaxhjp9oZeKET4xcDdHyVDBekD8A/XRpnNzH460HL4ICgOJ6H9S0utsJS9jeN6cQQ
         Mh1e8tNPlbRrzOhh7aqhE7oSIByz+Iu9saJmpEz8mwUICjHWrQP+Iun78k9UWEBOsPo9
         oxennYThSqZCA2w6qtXxQ0JBTMYB+okFfEJVs9cbJDUh2wKoVMF8ZjzmbFmwDqczdO4a
         zMOQ==
X-Forwarded-Encrypted: i=1; AHgh+RqsJPSxFh1YsFs/6qr69Da+JIXUam9X3864TBm1FNUXALkpgNirPBPBodGQqP6h1kQq26qZ8c0SMNwZzmZY1Ps=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJgVIlsJETp1HmLW56y+uaDN3kJXeP2HfKRn56aEUhFsQDBcQA
	UzECrzNhLXKF2+qfTgjkLFbJkj22olQ1JtSaHL84RahXIiTVzlDgNtq+w+G3pkS+ZA0=
X-Gm-Gg: AR+sD12i4DFLX3AJyZi9cFCUHraEl4+h2dtXCpm3XIWk7/ikcB/ntBdbEMwHS/k3dh2
	+y5Ka7Q/9FoRuFZKpTde8tMd7jeY/YoiV64BanqHeiOFwfXi8lf6IqniLMFkj8tTpuctkJ6ei32
	VcionKjaV0Ff9tJs1VDE6pyNf8PgOP8Thn+DIB0VtYGWdLjXqC21ZofxTZhFg5oKCuc5wYNbKvh
	LcHXzCigKdy18kioXn+mjYxKiKhWtySTK8xcEA8sG7NPyTdkye7F4VOeSkEfL3nFQFTc1lirvno
	NCshemlHyWoUbMfJuSADsR2w5PcbIo5s9NB7hq2ZHsJ64yNriyuBduK1lJZncmMPB83ksjAusfJ
	+yquoYLOh49v5W9BaTerKIKhESqjUurPamDnnkUwCQMdylgRoDnk+qUYePfM953uu9bKJSBCibF
	vEzU8fNZlqXkk7CPgWX0BML7r2Fl3QMyzfBX77r6+yGRwjJmRuT7ASHS3cJg==
X-Received: by 2002:a05:620a:1992:b0:930:f7ee:2cf5 with SMTP id af79cd13be357-930f7ee3792mr215753585a.66.1784729095553;
        Wed, 22 Jul 2026 07:04:55 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930f68d5d6dsm171863585a.20.2026.07.22.07.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 07:04:55 -0700 (PDT)
Date: Wed, 22 Jul 2026 10:04:49 -0400
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: Zhigang.Luo@amd.com, arun.george@samsung.com, balbirs@nvidia.com, 
	brendan.jackman@linux.dev, yuzenghui@huawei.com, apopple@nvidia.com, alucerop@amd.com, 
	matthew.brost@intel.com, akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, corbet@lwn.net, skhan@linuxfoundation.org, 
	gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org, djbw@kernel.org, 
	vishal.l.verma@intel.com, dave.jiang@intel.com, alison.schofield@intel.com, 
	osandov@osandov.com, jannh@google.com, pfalcato@suse.de, jackmanb@google.com, 
	hannes@cmpxchg.org, ziy@nvidia.com, pbonzini@redhat.com, osalvador@suse.de, 
	joshua.hahnjy@gmail.com, rakie.kim@sk.com, byungchul@sk.com, ying.huang@linux.alibaba.com, 
	kasong@tencent.com, qi.zheng@linux.dev, shakeel.butt@linux.dev, baohua@kernel.org, 
	axelrasmussen@google.com, yuanchu@google.com, weixugc@google.com, yury.norov@gmail.com, 
	linux@rasmusvillemoes.dk, longman@redhat.com, ridong.chen@linux.dev, tj@kernel.org, 
	mkoutny@suse.com, sj@kernel.org, jgg@ziepe.ca, jhubbard@nvidia.com, 
	peterx@redhat.com, baolin.wang@linux.alibaba.com, npache@redhat.com, 
	ryan.roberts@arm.com, dev.jain@arm.com, lance.yang@linux.dev, usama.arif@linux.dev, 
	xu.xin16@zte.com.cn, chengming.zhou@linux.dev, roman.gushchin@linux.dev, 
	muchun.song@linux.dev, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	driver-core@lists.linux.dev, nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org, 
	linux-debuggers@vger.kernel.org, linux-fsdevel@vger.kernel.org, kvm@vger.kernel.org, 
	cgroups@vger.kernel.org, damon@lists.linux.dev, linux-kselftest@vger.kernel.org, 
	kernel-team@meta.com
Subject: Re: [PATCH v5 28/36] mm: add NODE_PRIVATE_CAP_HOTUNPLUG for opted-in
 private nodes
Message-ID: <amDNMmbdE_ZhUgl1@gourry-fedora-PF4VCD3F>
References: <20260720193431.3841992-1-gourry@gourry.net>
 <20260720193431.3841992-29-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720193431.3841992-29-gourry@gourry.net>

On Mon, Jul 20, 2026 at 03:34:22PM -0400, Gregory Price wrote:
> Add CAP_HOTUNPLUG, which allows memory_hotplug to migrate a private
> node's folios for the purpose of hotunplugging memory.
> 
> Without this, hotunplug fails if any folio on the node is allocated.
> 
> Add node_allows_hotunplug() - which returns true for any normal node
> and private nodes with CAP_HOTUNPLUG.
> 
> Signed-off-by: Gregory Price <gourry@gourry.net>

after this question:
https://lore.kernel.org/linux-mm/al-pkvmgIxGu3LzM@gourry-fedora-PF4VCD3F/T/#m5b8166212a276fece2380f2dd03d6864375a576b

and some off-list feedback about limiting initial cap bits to active
use cases, I realized that this CAP bit can be entirely eliminated.

hotplug notifier callbacks already allow a driver to prevent memory
block state transitions - so that control already exists.

v6 will remove both the filtering here and the cap bit.

~Gregory
