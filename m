Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A2F317173
	for <linux-kselftest@vger.kernel.org>; Fri, 21 Aug 2026 18:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787338704; cv=none; b=ZshzNFBEVP4xZpZ2VA7j2mcz0deKCZwLnYOaGl6LOLXwpwOtEaI6ckAGy01P58rOjWQ5LsrSJv3hFMbIE89Q4O/wqogej6aCxJs6PaAgO94h3PBNicun39NAn5+vGX2Od+mHPqcerZMQHOHtJH1IhnjhMgckxa1GpaE8jZKrZyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787338704; c=relaxed/simple;
	bh=zgVqh1WXqUuA20jAM25nJa6XotPJcX0sGqZSpoFydf4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=asLJPct/b4kGetCwf/MblShX/NxpsJn+e7Fb7neVnOc2o6NNOIo3U5n5+xKo8tXKqzBwM8T7VNkTpr4BW1RCvCnBHxOPng/qmuds5k87rlE/Qg+poeIwB4Zi/zunjhjzsEXK7cBDQPn+FtPPu9NAlro/LLI6CwFWgc4vE8KyNpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VMbFbuUA; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=tzdgfYjb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VMbFbuUA";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="tzdgfYjb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787338700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L4q5Fof+ukHytC/x5b+k7VwkCJq156UwS0JZy64G2so=;
	b=VMbFbuUABN2f9Ue7WCwG+D+w7eqR51bTv/thXbRlrEx1TJzzloNhgeUBoyYzBbJISdNzTj
	MrkQiCJCW5ecCuugvL6sWh8xjiL+ga6dtQFrtwmzQw73Fw/YAV6drw9atqiIjUvApGKRkf
	VXp5uDQDfO0NBwEqvxLuTHgBixT84zw=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-Qv4fu6NjOLCWTW8Mpnjc0Q-1; Fri, 21 Aug 2026 14:58:03 -0400
X-MC-Unique: Qv4fu6NjOLCWTW8Mpnjc0Q-1
X-Mimecast-MFC-AGG-ID: Qv4fu6NjOLCWTW8Mpnjc0Q_1787338683
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90c8da50f8dso5458896d6.2
        for <linux-kselftest@vger.kernel.org>; Fri, 21 Aug 2026 11:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787338683; x=1787943483; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L4q5Fof+ukHytC/x5b+k7VwkCJq156UwS0JZy64G2so=;
        b=tzdgfYjbAUY8qm+VIUUKGKNeyzdEbEc2UhIMmLLoTvz2vCIhJHpwaVJ5/gUzWohwBU
         Nx5nYHNYA+C3itREbqlH/Tw+3wmh9/X7FK24J7fCOD6pSqPerrsonnAoiiAYfJgSyJuz
         98xk0wZVEAOLAwaUUtn3O/jVkl2kAN11X7Ukkv8DngbNYkQ3kVaR/VA991HfI0+dyW3Q
         FwflzqUc/5RjJZzoKICax97wC0kEPOPfGouuOjBqamEBMAM7fZTfeSrARZfZzYW8CNih
         f52Oj7hVV17apmoYLTSy07/nCf3AQUfx2noKZYC26H1GlJrdoZsAUrN8DK+WPIuIFaw3
         2PYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787338683; x=1787943483;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L4q5Fof+ukHytC/x5b+k7VwkCJq156UwS0JZy64G2so=;
        b=MnBvVfItwKMCgTobj9nHZGjJBNWbZ5G364+O0SRLPR65NwQdydNK2UYJs6lXtM8Wq/
         oJPJ+/k9KyHVFiL52GiZlU3G99bqapR46/74NULHwkMKOC4VIMjudRyC56YVP4gBItkJ
         8hGGHpbTUs6SlySY9ctWZrlGZg44PLlEpqhizVASE8dc7VYvUn/6d8iRXPMALic518pX
         K/13e+aUvhz/852qsCfrPCkOcxAlSpCY0K678aZqxWH8OXOxiKhkKFb0jRPF8VPxrRbf
         xgowPjj/Ujd8yPmArqFKwttJxlBRbrIR3Ilnwfx+n/kjAs+cH1t+WN8deCx8SpTHlGF5
         XkxQ==
X-Forwarded-Encrypted: i=1; AHgh+RpjdpOstO4vJhvsOSn/EK1zQHOSNfgMdNvK0QAX7jsD9cRv1BIirhLfGWTLPuN26TfdpfqQEZdiSW/+qqNw5AU=@vger.kernel.org
X-Gm-Message-State: AFuF++kqE0YAahFWji9eVTVcfOLGk9ixF+F7xuEKtviLhOKolWR+JONl
	EyseAQoSlfW4Uy/Z8YMpDq8P1QHk8JtKmMWbuNB2V8Bqpl2z9/M8oTqkAlG1bbqSBhZwNSZMUM2
	Cuh4L1XLm+0PtG45EvinfBI/P1ZGsCKCc319ENYyJ3YKx+lvJLUvF4I0DlFtVXd5emKgd4A==
X-Gm-Gg: AR+sD12AUYA925LCLeI/IuRA/ECDs9y7HC75dCkqeU8+xxbJMkzjzkgpSbx95NTkkQa
	gSDqBi3qLN5mgedLr5ZdILYyYL2h+uKQY23fDd1HdhLTa7t48PLeouwaonr5ygXFtgdpkYIq5rU
	Cnih/x6n6NsiKsO37MuK3c+efQOLHiMsaZFEU03e7wNon4YA/4VHavky0n2KLvG/UztZecY8olr
	ghMhVMMB8rKL90VdkZs8HxdGd8aHntQ3lgjkZO/TiC4N541rjYKF00BxrfC2Y6EvkK7/FlFcGv5
	rhPOsw/Bd/dnsDrueGQ9uS+49G2kpPbcE5XE2AnPlrTW9XziCR0FM9L44XfalCC9QS0IogBmoGA
	l5yhkXrnzC8c72upx3fYH0hSKeKOrI5+EJvRkb2GgnBs8
X-Received: by 2002:ad4:5d67:0:b0:8f7:43f4:fe8d with SMTP id 6a1803df08f44-90c8fa5ed5emr5634176d6.29.1787338683085;
        Fri, 21 Aug 2026 11:58:03 -0700 (PDT)
X-Received: by 2002:ad4:5d67:0:b0:8f7:43f4:fe8d with SMTP id 6a1803df08f44-90c8fa5ed5emr5633776d6.29.1787338682532;
        Fri, 21 Aug 2026 11:58:02 -0700 (PDT)
Received: from localhost (pool-100-17-17-231.bstnma.fios.verizon.net. [100.17.17.231])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c5f2b4ad5sm69468316d6.42.2026.08.21.11.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 11:58:01 -0700 (PDT)
From: Eric Chanudet <echanude@redhat.com>
Date: Fri, 21 Aug 2026 14:56:57 -0400
Subject: [PATCH 05/11] mm/cma: charge cma allocation to memcg per area
 counters
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-cma-memcg-regions-v1-5-d21b165b8440@redhat.com>
References: <20260821-cma-memcg-regions-v1-0-d21b165b8440@redhat.com>
In-Reply-To: <20260821-cma-memcg-regions-v1-0-d21b165b8440@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Tejun Heo <tj@kernel.org>, 
 Johannes Weiner <hannes@cmpxchg.org>, 
 =?utf-8?q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Maxime Ripard <mripard@redhat.com>, 
 Albert Esteve <aesteve@redhat.com>, Eric Chanudet <echanude@redhat.com>
X-Mailer: b4 0.14.3

Hook mem_cgroup_charge_cma() and mem_cgroup_uncharge_cma() into the CMA
alloc/release paths.

In __cma_alloc_frozen(), charge the pages to the current task's cgroup
if the allocation succeeds. Should charging fail (e.g, reaches a limit),
release the pages. Uncharge in __cma_release_frozen().

Signed-off-by: Eric Chanudet <echanude@redhat.com>
---
 mm/cma.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/mm/cma.c b/mm/cma.c
index 03f98f6d45a5..03eb3acbd3c7 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -904,6 +904,12 @@ static struct page *__cma_alloc_frozen(struct cma *cma,
 		cma_debug_show_areas(cma);
 	}
 
+	if (page && mem_cgroup_charge_cma(page, count, cma)) {
+		free_contig_frozen_range(page_to_pfn(page), count);
+		cma_clear_bitmap(cma, &cma->ranges[r], page_to_pfn(page), count);
+		page = NULL;
+	}
+
 	pr_debug("%s(): returned %p\n", __func__, page);
 	trace_cma_alloc_finish(name, page ? page_to_pfn(page) : 0,
 			       page, count, align, ret);
@@ -997,6 +1003,7 @@ static void __cma_release_frozen(struct cma *cma, struct cma_memrange *cmr,
 
 	pr_debug("%s(page %p, count %lu)\n", __func__, (void *)pages, count);
 
+	mem_cgroup_uncharge_cma(pages, count, cma);
 	free_contig_frozen_range(pfn, count);
 	cma_clear_bitmap(cma, cmr, pfn, count);
 	cma_sysfs_account_release_pages(cma, count);

-- 
2.53.0

