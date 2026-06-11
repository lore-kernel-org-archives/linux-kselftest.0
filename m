Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C939433469C
	for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 15:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781193468; cv=none; b=EL8ZN40GwCFaka4JoTGxNmI6kGYgGk3L5vIvCt6gAQxoCxLAExh/cGi29pvoDHJki+GTUO7Eg69Us54SC+EaNwDIOamILW9HhP0UW3doZGE5JYBkiTo06d+oxmTXBEKi6gy/do49ARgXki3oIP77RVUrUcQxWJj4uwAjaaw7Wus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781193468; c=relaxed/simple;
	bh=aC/D50n3Vajj/M13O+SFcV+z/+bePeVahMg066WCexE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=af7TcpfmEK6v4e3+xXoPrX7ZNZ0uRJiSNsU4xmVcpoY4WWnzV/3nPCioOFIcw2REATrjLfWgL3KCVsCJICnjDcmL61cWGQdF9xby/9onpEJePIJ1ujGmN/OaotQ8AMGVEAxizR9lxI+a7G9n6WAgbbgvhy+Em4MLH40aNlxFO8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PkZnPsBw; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=UdZNgvYp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PkZnPsBw";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="UdZNgvYp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781193466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CaTVBIrexKm22hRMB++bwqNcNQ1H7GPFCEOimwy1d5I=;
	b=PkZnPsBwVC/EHSvuNb+3wE2iLhQvf+ehHnDZYVfFQsa6YRQwdnh/aDFGc6VfwgFLp0Db2+
	mz/F+RtDI4eQc45s4byz5IlC26ohQySHdXn/8JBaCHuAodr7QsOTSBmbWnn5Ok7MMI28EK
	4RrKFt5UgF6naCtoxijVAUp/+Hz3/JQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-283-3YJVnfamOl6X3FS-tn67kw-1; Thu, 11 Jun 2026 11:57:44 -0400
X-MC-Unique: 3YJVnfamOl6X3FS-tn67kw-1
X-Mimecast-MFC-AGG-ID: 3YJVnfamOl6X3FS-tn67kw_1781193463
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-490afe64f26so204855e9.0
        for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 08:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781193463; x=1781798263; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CaTVBIrexKm22hRMB++bwqNcNQ1H7GPFCEOimwy1d5I=;
        b=UdZNgvYpb48vjGl2W8QzPUdxoZynOhpPN0rhVA83/Yk1PWXvRxGN1dHH9B9vdhOQGN
         9xa00gdg01PBiGnkozM5ggn4+c0M4YIs6qwoG49mzFog++chlzlY8MwyeBOSZkDsmBMa
         tsyYBb9CbHK9/fXWo47PpF7mhWf0WxZaA1gMfMao65am0060pTLKQvxMqK2sXmN02wY6
         KrLMG64D6wANEd69caTQYSzTK1i7dxX+6favbKHxXpSyn7wtR5BkVWt3x9P3IN6okqfG
         x8Yfaoc+bUjaEB85BTTrkkdExzGBROhU7ItSb2XgpEgFjPDTMUIRPIYRuFHP/jGCKhqH
         vs0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781193463; x=1781798263;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CaTVBIrexKm22hRMB++bwqNcNQ1H7GPFCEOimwy1d5I=;
        b=rS2ODUsWqvIx8YLhM0glC/jrOWUq+y3oZjXAiDMmS+QBnRgdFoUpeGsr7AYiiqtGgg
         VB0HZfeUzAaRdushgrODAViuFIqij1r3bXcobymGLjxHTWrwlKTmy24l3Je/TowheTWu
         kOc7kh1h1wu/pjoBTQw0avaCAedK75nkGQsDPFhYshgxQaFCvwkpQF2UJOo5NLOifEE4
         oF2udJRpyIuOrPLB3H1hpngQQxnQlbkBs1tV/FJ6QAa9zJQol5EVi7jpnM8Rz/PK8wr8
         mmw5X3UAImhTYaSluTdlGJ8LkjAK9O6oAxn+60GDNzDsto8YnN4K8eRzXQMR633/wT+v
         IC3A==
X-Forwarded-Encrypted: i=1; AFNElJ/DgjN0uUVSYyB7Z1EZpfDAvGrrt8AJ7Wy2YI8AUfpwFpfNN7gNjCE8nXgPsPJZDeOYX4I8rtICQErR3fI0EcU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoDJ99XbpCOIq01xSfETBoTKQjAHcZCymHjMnjXzJM2HrKT18i
	u227lGmw+Hg2zU5k9xJwFtIlhbHvmxahjFGMU60qkjkZprQGRu5JhWrAOlQPkjljxqXSQwu5AcC
	W9mdhEvE959NYrwpJkupmL30+Ybpwti81ffGIVp6/vZgOBqQctG2dwoEEZJ4WAFsM7WIJTg==
X-Gm-Gg: Acq92OHIK5R/X69fs05httYeYPpbi3TPsiOazMMHNTsz7raRksKdEk8TgT9XLZaUnuT
	v3TrdlpL5KcA/VB8MqXnXkTnwJHzzX+ehi91flIXnJ17tPIYYqiOCyGA/moVosB8EO6tycCXBa1
	6zmn5/oZTGP/x3fe4gccPSX2AJsaXb+fxa8z9gidTyx56sl/mDhjGGd9VvLwS3NqY+y9RuRi+RO
	aVpC13ZPoPcley7bwIKwgyMkHzTA4ZOZDhqoOBBzRpBWbxAnI+L0PY2z6TI1SXE1dZBqqLO6YyU
	nEgT+xLDfs0IcjKCFmKO/e2+2hVPti+TC7aSbE0nbCq3HioHk6BS/RGtJA43+f7lFf8u2dkgRLS
	lls2h2kaokGT0v384Unfql325eGcqR9op+6XAR8YT7GLHvs6OScglbdxdudHQAnbkcKkATsSVU+
	g=
X-Received: by 2002:a05:600c:3ba7:b0:490:9dc3:3483 with SMTP id 5b1f17b1804b1-490e52cad04mr42831575e9.2.1781193463174;
        Thu, 11 Jun 2026 08:57:43 -0700 (PDT)
X-Received: by 2002:a05:600c:3ba7:b0:490:9dc3:3483 with SMTP id 5b1f17b1804b1-490e52cad04mr42830875e9.2.1781193462659;
        Thu, 11 Jun 2026 08:57:42 -0700 (PDT)
Received: from [172.31.99.182] (91.red-83-48-118.staticip.rima-tde.net. [83.48.118.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e2c7ead0sm84150385e9.3.2026.06.11.08.57.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 08:57:42 -0700 (PDT)
Message-ID: <c5401e8d-0b46-4cc0-88b3-f438d610e73b@redhat.com>
Date: Thu, 11 Jun 2026 09:58:55 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nico Pache <npache@redhat.com>
Subject: [Bug Report] Elevated PMD nr_anon after running selftests
To: Linux MM <linux-mm@kvack.org>, linux-kselftest@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-cxl@vger.kernel.org
Cc: "David Hildenbrand (Red Hat)" <david@kernel.org>,
 "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>,
 Oscar Salvador <osalvador@suse.de>, Andrew Morton
 <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

While testing my mTHP code I noticed that mm selftests caused an accounting error in
/sys/kernel/mm/transparent_hugepage/hugepages-2048kB/stats/nr_anon

At first I thought I might have caused a regression, but when retesting with 7.1-rc5 (without my code), the issue was still present.

This issue occurs in two mm selftests:
1) hmm test
2) migration - private_anon_htlb test

I spoke to David about this and he suggested the following diff which seems to have solved both issues.

David would you like to send a formal patch or patches?

Cheers,
-- Nico

Diff for (1)

diff --git a/mm/memremap.c b/mm/memremap.c
index 053842d45cb1..683a77dd679d 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -425,6 +425,7 @@ void free_zone_device_folio(struct folio *folio)
        mem_cgroup_uncharge(folio);

        if (folio_test_anon(folio)) {
+               mod_mthp_stat(folio_order(folio), MTHP_STAT_NR_ANON, -1);
                for (i = 0; i < nr; i++)
                        __ClearPageAnonExclusive(folio_page(folio, i));
        }
-- 
2.54.0

For (2) he suggested

diff --git a/mm/migrate.c b/mm/migrate.c
index d9b23909d716..9fd50ea25d2d 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -590,7 +590,8 @@ static int __folio_migrate_mapping(struct address_space *mapping,
                /* No turning back from here */
                newfolio->index = folio->index;
                newfolio->mapping = folio->mapping;
-               if (folio_test_anon(folio) && folio_test_large(folio))
+               if (folio_test_anon(folio) && folio_test_large(folio) &&
+                   !folio_test_hugetlb(folio))
                        mod_mthp_stat(folio_order(folio), MTHP_STAT_NR_ANON, 1);
                if (folio_test_swapbacked(folio))
                        __folio_set_swapbacked(newfolio);
@@ -623,7 +624,8 @@ static int __folio_migrate_mapping(struct address_space *mapping,
         */
        newfolio->index = folio->index;
        newfolio->mapping = folio->mapping;
-       if (folio_test_anon(folio) && folio_test_large(folio))
+       if (folio_test_anon(folio) && folio_test_large(folio) &&
+           !folio_test_hugetlb(folio))
                mod_mthp_stat(folio_order(folio), MTHP_STAT_NR_ANON, 1);
        folio_ref_add(newfolio, nr); /* add cache reference */
        if (folio_test_swapbacked(folio))
-- 
2.54.0

