Received: from mail-qk2-f41.google.com (mail-qk2-f41.google.com [74.125.230.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58405372E0
	for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 23:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790121526; cv=none; b=gHgyN4uqjAHEAE6iU9sZzd8sgHE3N9NeUiYnvfRyUoqT4yCZV83ffWH2DUNFZDZSefGU1JcgQgqQlkzPX0WPLkCGGx7dbidy643YyCzjVayFu1hs1kABRiQmku4gq9/3n5bnK2oiyTurWG7l2JspR8DwDox6Wy3TvpDiM9F1Lzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790121526; c=relaxed/simple;
	bh=zMZuj4OSysiY14sv8fTeBIk97LrMvKFmXN9V3kYNFd8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dwod9MUOrL67WHqwntkpCTZxc1UspD7PVGXNJ4Qlx0TiOOqCxm9HXv863aaoZLPwhbygxoPVQtZbvyMW057NNPAFSnvfu9Phdsd4l+3KF/CMDjY+SZkdzMLNHrdwQ3n80toG7TVCl4aMue2RBsj30sjFsje2KA1n9KMc77qLtoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=ZQlPmVvq; arc=none smtp.client-ip=74.125.230.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="ZQlPmVvq"
Received: by mail-qk2-f41.google.com with SMTP id d75a77b69052e-532d63f434fso5503671cf.2
        for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 16:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790121521; x=1790726321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+hLggoqTstCCp/LK3cQnyxDjfuxVFKuLURbcW1u38EU=;
        b=ZQlPmVvqnrKTa/s7wZXOFwt/c41ay6syY03TW+bkacaUMnzOBh2O4gIkr5lK71nepG
         lP5a7YPcrMmn1KP1BSXTBioNccWJCOWBrjo7kgblEgBa4tuxD7KiLUEC50Tl1y35e9Nj
         pJryVWIR0xi0HBesbyainB71Ho0tAqPElanRPh5BB6nbm2Gr7HHbGnhGFdTs2ffOnp9+
         U+bFboRvOHCjjlgip3QfeLSIKHA+D+Dvex7lWXE7/3oEL0yoQk1traeOx80cV1Ifj8O+
         +vGD74gp+URIAh49cWni2XmFUb4fyp1KT5xBb+v+OqC3sbJYerFtT6gZAybz4JmCNr6a
         DBmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790121521; x=1790726321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+hLggoqTstCCp/LK3cQnyxDjfuxVFKuLURbcW1u38EU=;
        b=m5qHPGnrbsoKrgALbUbv0BqkBUcrFNr4wQZLHPCuA+h/tsUiLKGAeOVWUqixy3S5wU
         dhpgUEMgz0zrpkVIdUOOG32PcK7W5kpjROolSMV/GN5M5/XUnykVvth9QtumRsM6b0vu
         qSEGdVNzrdVKayl9RcqjPpVyiqq55E0sTIED6dV04tcg1eiJu0kipSYKdkKUDDF9MA1y
         VZmJcmjFME+uSeRfgR8clRdqoIBd10aSvZ3VGo4CThXoL5psa50fDJXi4mh5RT2F+6Rd
         E5y7WFGFb1CDUhCo7xQxXZgKUIKVzkLHVfU1aAedRbJNqfT2SzxUD/oHjY0woPhAoPog
         ievw==
X-Forwarded-Encrypted: i=1; AKwUvBzpWYA9hZh87rMkEwSNWMZk9lmDcJr8GB4kIGvY8vCgyuffJZPLzvaqerRbGzNt1yWizyhelz0KZApdAWROLQo=@vger.kernel.org
X-Gm-Message-State: AFuF++nx/+quUhk9r5+5I62rsokXSL7uBUT/PhbBCjZ8wcUH2Uqoqm45
	B7ZJcc+YMk3g5u2qJWkceuVyH/9Dzzwz+u+6pzHIpOrucfMZbkuM5nrjw06o2T35FFw=
X-Gm-Gg: AYBFou209F2DQutjkvK3xg02A9rz3SP/QndKxr1b3l8Gtc6igya6KIL4c4HCZYzsECC
	/P4G3wzLkpWKLJz8WzM7BMgYb5muutfntiCP7sT6EzRMbyDEh4WcjTWhmlQC+gy3u1bqDf7J08U
	ndQefle9cUwjujr7oouoQWhXHJFOfylLFKVK0QxAdkLh1gntOCDylJOJYXDTYybX9KlrJctuQg8
	MPPiq29YKT48PdtNAFhjbi0v70g/jGNaEzwY/yWUGeZfGPCz4lhpyjFPjppljyuBYLlVS8kZNuA
	+vIZOW/k14T7ysV9HV7rr0yFtVILk0fD7k3tuVPm8eMdktBWmg6VmywDuwdUdmgyvwXdcrG2J1O
	PcI2EGhoKmjYucLiteS7lJNvlK50MyiDE+WVE8+w6hP3N35UQWL++6Jg2PXPp5WF5gRLFYD3F/i
	h9lRTOuzRy3gJJorzc6T5himsJYfcm6cW1HxJepzYV0Fw7GrGbEPRjUID6un0cD0GUx4Z61Tu/j
	favAEwUDiXwlGJG4JGpC6KrS47b8ibKDQxkMwdtXAjpHtUs/6fAcAICkbMw
X-Received: by 2002:ac8:6f1a:0:b0:532:c161:b968 with SMTP id d75a77b69052e-532eac32322mr21316581cf.1.1790121520905;
        Tue, 22 Sep 2026 16:58:40 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532eb3c6715sm8323261cf.30.2026.09.22.16.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 16:58:40 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	liam@infradead.org,
	ljs@kernel.org,
	david@kernel.org,
	vbabka@kernel.org,
	jannh@google.com,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	"Gregory Price (Meta)" <gourry@gourry.net>
Subject: [PATCH 04/10] mm/madvise: use the PMD softleaf validity helper
Date: Tue, 22 Sep 2026 19:58:24 -0400
Message-ID: <20260922235830.2350770-5-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922235830.2350770-1-gourry@gourry.net>
References: <20260922235830.2350770-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A non-present huge PMD must contain a software leaf type supported at
PMD level. The open-coded check names the currently supported migration
and device-private entries instead of expressing that invariant.

Use pmd_is_valid_softleaf() so the validation follows the central
definition of valid PMD softleaf entries.

No functional change intended.

Assisted-by: LLM
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/madvise.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index c345fef23f15d..b31b877c2c130 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -427,8 +427,7 @@ static int madvise_lru_pmd_entry(pmd_t *pmd, unsigned long addr,
 
 		orig_pmd = *pmd;
 		if (unlikely(!pmd_present(orig_pmd))) {
-			VM_WARN_ON_ONCE(!pmd_is_migration_entry(orig_pmd) &&
-					!pmd_is_device_private_entry(orig_pmd));
+			VM_WARN_ON_ONCE(!pmd_is_valid_softleaf(orig_pmd));
 			goto huge_unlock;
 		}
 
-- 
2.53.0-Meta

