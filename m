Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537D336AB7C;
	Sat, 15 Aug 2026 01:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786759184; cv=none; b=ARCZ0mQ1UCxh6Gg7JxZup/ps7ZPB2O+YAvQ37QL8rlW8brGX4HPAsMN/7ZuQziPvmiVOfaCc+ly9L4ROqLVem1vp0K3C44xC2rAGQ9bfpJIyr6gZ1BgZQW5R5aih1cIPFOj5hwXt41GSed7RgnMVuSPOhtAMe5sbcaexb1y7auk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786759184; c=relaxed/simple;
	bh=X9BD6U9xfu679WoD7+9b9ZF4FLOqM9dKkuaiTKZIalM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rfGgmELNq4fbrnrPpDk5iU16TujPkH9Yqqx7BY66Izacmdd7D3s8ra1cDtiN6amGcOirxyade9JNPFJe9wwZAVDGmzrTnI/0a/OHk1MnPxzBs0etrYkY1D12hiLMBM7WVavoFxf7fL9a7Pzw5fygJmJJzOX6vhy8UiaN4lOQ9Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=Ut/lCJEw; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JhwiSSGG; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="Ut/lCJEw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JhwiSSGG"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 72AD5140011E;
	Fri, 14 Aug 2026 21:59:41 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Fri, 14 Aug 2026 21:59:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1786759181; x=
	1786845581; bh=S0c1eOgbbGAyxsvdncO2s21v5pX/QpSQtyc3bthgrHY=; b=U
	t/lCJEwc5aQKPhgw7EwTAdTo+PRmF1IqeIOoZHi9eWxt471XuI22OZtQK6rvfCzg
	PyqtP2xJXjnttcwAHHPTXq6RWBbl1TILSyEPlOKqqlfbqhlbW4LBQyziuNP3aQYc
	aKIrMrBrGOdfYk+Nl2ekV8oJNdw5MbAAQtCiOWjRg4zX2kJa6hiMe1Tes3mvOw/7
	VAqfAQbUZ96Ltjk+aZWT3EGpyc2NFU5ZdBHi82avmgjDy3KaYWLSsE3q/2QbI0fz
	Iq4d54umBUGqaK0sAfBzpsVxVlL78nvkRCAHeXcQiiFkOPz2M8A6avRgIRFwQq4T
	oso0GHW6fyv9rYa+r7WYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786759181; x=1786845581; bh=S
	0c1eOgbbGAyxsvdncO2s21v5pX/QpSQtyc3bthgrHY=; b=JhwiSSGG9GcvcRpt2
	StUvvTqekt2dNbT/MEipdTfJWgSKaGnX8aavOol8DZSxj0N/b+OQqhO+bR6/wcRQ
	U2EyqxQZdIiQdPGZ2ivmhTmS5ZlWs7xBqRJG/EFbMN/UtZBZxGMkemYuNcfP5spt
	2BHM0nsRpAn3Xy3iJVVTlkpk2Izn4qhFrjZQIfUjWRR2Z/SKQodDpB7KKrwySSPj
	KEGLALAreBOPdw3tIUmhQfzDHFf1zsuAs3LpMjGQUMaMV5nmlBJgxIsDqh1ClrFi
	YCw3g5OzfuT148DEXOx0g1SLwA7dMzbw+MUgrS9rTmJKJWI/ZRx4nxaZtco2mErn
	sNtpA==
X-ME-Sender: <xms:Dch_auEZShlT8MhC7AAr8dR0miZ55owXdryNSKxgEB3mOIQA_kfK6A>
    <xme:Dch_ajRyYx_cqa--3oBs53Hm4fITiN4zTloBpELhMUHd0GQPcKYmjoGUwxJJhle2C
    0tnBUfW1plUs05_-hW7cGdeV0SdrI9MXOdDEIuyrwVQ-kitUhpX3Q>
X-ME-Received: <xmr:Dch_agqYn17bJZeAzYEvc_rvTQW6rZFojEGSLvdGN3F9hdOySzZiSTBaazk>
X-ME-Proxy-Cause: dmFkZTEYpEQiBdLKlCaLp317TOYqYwO99jnuX4YrBujo3RuW+IIGXdYj4qE1ezcGRvbtOZ
    hc7RfnfkdlTehb5Dkvk4VZTcyRAqm2CcEjaldkIQshIttrB2HSeWyAKQfsR+ykmymFv8qO
    aC/+wh3joJiQccaWn5NjVrqLVVMYdoVO37A5ZL6SnR75seJlCquk1NTOiA0EvXHIVSJ25Q
    iFONSccd/wEzNfQZlOvvQQf5bCKiGIALXd0Rd37Vcnrh56q8DfWwmvEu2ZgBGSMa525iaP
    HkMF5MKO3LDiNiHXJVHjo5f/L4XJttiAOfdXhljkaHgZI649okv5M81/eeF8HfhCZr1UOF
    hEaMyy8SNp+WA12XXrvIqlcMW2sZE0kgpE/SOwwrkjJJR1inJnCtzQ+93UM2eF1fnod6oT
    9r9RUE9IaQWym0pbVGY3R1/tSevMLn2Wm1fDSecSv3O3MsiiHeeD71o9x7zq70jW1XGMxt
    6PxXclH4l5ckE/VqaZuoVIPwRETu0ui1oWDy0ZOTdrEEgVG8tzZNDoMGrwKfGHkXxWDatX
    F7XN4ZYzRnP0ghZSWu5SVUOAinq0yjUcgWhC9vY4+NzBxMhAdOUGFaUimv51f4+MtooxKw
    LlXk8IkRDFUfG5OOf3LKOP1EhgQRur3r/DB1mhiHKKozaXnvIDhtuZIUDTng
X-ME-Proxy: <xmx:Dch_ahrJoPNdH8-Jem6IiR7LfSReBAwKivDdiOSnJwKOXEcKzSF1ZQ>
    <xmx:Dch_ar1O4-7k2YPb_krkKTwwuJ2wmgySvS0C_9MX8pFfNC4QImb1cQ>
    <xmx:Dch_alhmC2uV7gV7mJuU_zGJtbr6KxRKpQutipCG35jLLGxhF4xCyQ>
    <xmx:Dch_aqnJ3srTrf-QxAQZBonMPNFZZOQjZzc6CdT9_AfNHRYHG96-uA>
    <xmx:Dch_akl6UTtKBKDWOLN5GVEVhzifFY0IWQRFwe-V57e6ge23KOIF7ED->
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Aug 2026 21:59:40 -0400 (EDT)
From: Kiryl Shutsemau <kirill@shutemov.name>
To: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	nico.pache@linux.dev
Cc: baolin.wang@linux.alibaba.com,
	baohua@kernel.org,
	dev.jain@arm.com,
	hughd@google.com,
	lance.yang@linux.dev,
	liam@infradead.org,
	mhocko@suse.com,
	rppt@kernel.org,
	ryan.roberts@arm.com,
	shuah@kernel.org,
	surenb@google.com,
	usama.arif@linux.dev,
	vbabka@kernel.org,
	ziy@nvidia.com,
	usama.anjum@arm.com,
	agordeev@linux.ibm.com,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kas@kernel.org
Subject: [PATCH v4 19/19] selftests/mm: zap whole PTE tables in the khugepaged race harness
Date: Sat, 15 Aug 2026 02:59:01 +0100
Message-ID: <20260815015901.1236937-20-kirill@shutemov.name>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260815015901.1236937-1-kirill@shutemov.name>
References: <20260815015901.1236937-1-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

The harness's MADV_DONTNEED thread zaps 1 to 32 pages at a time, never a
whole PMD-aligned area, and only a zap that covers a full table frees the
table itself (CONFIG_PT_RECLAIM).

Make the thread zap a whole PMD-aligned area once every 64 iterations, and
keep the fine-grained zaps as the common case.  The new case frees page
tables, racing that against a collapse walking the same table.

Assisted-by: Claude-Code:claude-opus-5
Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 tools/testing/selftests/mm/khugepaged_race.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/mm/khugepaged_race.c b/tools/testing/selftests/mm/khugepaged_race.c
index a23e5bfe78af..6682bbae0a8f 100644
--- a/tools/testing/selftests/mm/khugepaged_race.c
+++ b/tools/testing/selftests/mm/khugepaged_race.c
@@ -140,8 +140,24 @@ static void *dontneed_fn(void *arg)
 		unsigned long page_idx = rand_page(&seed);
 		unsigned long nr = 1UL << (rand_r(&seed) % 6);	/* 1..32 pages */
 
-		madvise(region + page_idx * page_size,
-			room_from(page_idx, nr) * page_size, MADV_DONTNEED);
+		/*
+		 * Once in a while zap a whole PMD-aligned area: only a zap
+		 * spanning the full table triggers the empty-table reclaim
+		 * (CONFIG_PT_RECLAIM), which can free the table under a
+		 * collapse that is midway through it.  Sub-table zaps never
+		 * reach that path.
+		 */
+		if (!(rand_r(&seed) % 64)) {
+			unsigned long area = page_idx /
+					(hpage_pmd_size / page_size);
+
+			madvise(region + area * hpage_pmd_size,
+				hpage_pmd_size, MADV_DONTNEED);
+		} else {
+			madvise(region + page_idx * page_size,
+				room_from(page_idx, nr) * page_size,
+				MADV_DONTNEED);
+		}
 		usleep(rand_r(&seed) % 500);
 	}
 	return NULL;
-- 
2.54.0

