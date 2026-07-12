Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E1834104E
	for <linux-kselftest@vger.kernel.org>; Sun, 12 Jul 2026 15:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783871128; cv=none; b=GAcHeWbfsiqgeYZ+FOPye2i+B1ZvVwh0dv994us721cAi8X8+vDWyB5pIoaa4B3Ij57iGtpnK+lBzFmNcS6nyh8BrJMQQy1lNEz6uIgCt1OnmoJe8dpJRMMid6iO2sWV9UUk9hddp/yCS8cYDbMlFemvIMKf0qlQ+rQ4lE1Ripo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783871128; c=relaxed/simple;
	bh=uhoFb1AdQ1YY63K+zjDeKis0/pyRtDsZVbRXxtXWIEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DgHr6933P4G7gaUgcyBw8mtRhI+8VHM0Fn4asM7nc93E9Ic6Fal1mJdBJKOVYjjZdsoWZfXUnrgpXcFdPNmfRDw+ngbU2f3MPktGDw6Sld6NHbTQoiUsHH+88qxynlNBXvUi06bXzYyb5r+fiahh2ERGSfXg6VMQ6qfth/dAnyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=FsDCEHzZ; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="FsDCEHzZ"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-92e55b62640so125994085a.0
        for <linux-kselftest@vger.kernel.org>; Sun, 12 Jul 2026 08:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783871123; x=1784475923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zjJw3wlBuqXvLpxi0GmvsmDJYE5o3ZwGQsOl9zW5rZ8=;
        b=FsDCEHzZ6ObAzYO+uIrwhLS6SpuDFiRHY4PN5Xqvn8fXFhYY2fju0cIElpd6qlt7B3
         UQWHgm5MIaZdCJSq/utvA+u46asV9VrhVrPSkIwNP0r1bEzSOBQ/ZcJPM8DxA9hda6jU
         XGpN++uG4hEbuCmrN0Bv8/TtUkDz48dISsPfpgtN6Xex+mns5tO0chbc2kDchD6ssPBx
         X/XoRbLzE+F37BD9ohQ3c7qaXQq4Kojr10SHyoKnag7KGOJinOc2SJoQwGxG1M1F/JEg
         CPeIFRV1VDQq8383J2Uq+KOIum9zPrshkbnwAo7pZGtS2qGS/MDmIdaD+CuzrNATrDn3
         Y+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783871123; x=1784475923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zjJw3wlBuqXvLpxi0GmvsmDJYE5o3ZwGQsOl9zW5rZ8=;
        b=hRq8tzs7NM/NBHMiWuioSURWSQWJiiUh5qo43VDrtLLWnD8zOEO45hh9z+OYKr/nkI
         D3IJESpb7wcW40eiHR4u0ape1yVV3B9IEr0Ndc8pJhdihTLtgfLUpZ4mGIM4XBZsXaYW
         47ql9YHkl4ge5bPR3YRLc7oT3oLJeuBMJDY5Dh47hMxuVgh+PMWGfH0dWm9htSLC19NY
         hmbtI38jjpEbg1Kwjhbbl/XTjAQuqEs2c8Yfe1hAhztj2xslq8SMpBnBsAr0jjSyXP4C
         wqNt6QIAsiKmibQ2zPKltSPqq9LgGYFyDSzCbG1VAm5cFjt8oTMuztcsP1Rs/IzYCUS0
         k0cg==
X-Forwarded-Encrypted: i=1; AHgh+RqFcUcA95DBta+6GUCDwx7Vf689pOLOfV9+pp9SzsQzXf/EIsboPpCvoKiDYslTmyXQCaPl41tFKnCoAWKY0mk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjGVHjUYsSFp/1CeLasY8nTrurIV3qiEf+Fjk9iZiA3O2JPjaD
	rPgr/G1uLYRV0YrgiwJTHGLbDKFwm15FERE9I/DdRYgDmhkev6CsY0M7tN0q8sRTVbY=
X-Gm-Gg: AfdE7cmkEb0IzQUBS4bLYTmpOPWs3XHT9EMVNg9y5HNuTFGKUbQTbQQCvaM0ESNrbe7
	teCGAr41s4zRAakj5/mmKdxzgEJf2CuKEy5ccp0Z4xpL8yxTWLG8ZtMK/UDTqL49Nsx5TS2H2xy
	2Mm6qyVzVRE30UYpw9iL7Is6BW3eAxBzbCQ+gNqikFTIc7QV3ue+9H6MnOD5dJT1C4SiwvBtcD/
	yyl7OTxMX4YlljAKmxI6HY8tcEJaBxmHFpLOXuMLuNSjCENEywy/UBiZQpVLbbo85D/2Nyz8qY6
	Ohny/N/BvyY/Q7e/7+h8sDqbSDQr88q/0PiQ2pf7v69vfAfTmiqq8wJ6hGzR8pR0vMldnLNgZp2
	oGLqEjQiz7GDxllJbT4acIXmIuVKk8qTi7mI/K1GYKkb10oLjQ0NBC3ICqS84b2n0MceR89aH6O
	nfy7R0C0u3di0D11lmxgVfcAgoiPhEZfTkqVDwPY++m9pHBNqo2DfdH+AXxR9IMM4PytLgom2ad
	w==
X-Received: by 2002:a05:620a:4711:b0:92e:5610:e479 with SMTP id af79cd13be357-92ef2bfd741mr601996885a.52.1783871122600;
        Sun, 12 Jul 2026 08:45:22 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5d61facsm862186485a.42.2026.07.12.08.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 08:45:22 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	driver-core@lists.linux.dev,
	nvdimm@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	kernel-team@meta.com,
	david@kernel.org,
	osalvador@suse.de,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	djbw@kernel.org,
	vishal.l.verma@intel.com,
	dave.jiang@intel.com,
	alison.schofield@intel.com,
	akpm@linux-foundation.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	gourry@gourry.net
Subject: [PATCH v7 04/10] mm/memory_hotplug: export mhp_get_default_online_type
Date: Sun, 12 Jul 2026 11:44:58 -0400
Message-ID: <20260712154505.3564379-5-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260712154505.3564379-1-gourry@gourry.net>
References: <20260712154505.3564379-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drivers which may pass hotplug policy down to DAX need MMOP_ symbols
and the mhp_get_default_online_type function for hotplug use cases.

Some drivers (cxl) co-mingle their hotplug and devdax use-cases into
the same driver code, and chose the dax_kmem path as the default driver
path - making it difficult to require hotplug as a predicate to building
the overall driver (it may break other non-hotplug use-cases).

Export mhp_get_default_online_type function to allow these drivers to
build when hotplug is disabled and still use the DAX use case.

In the built-out case we simply return MMOP_OFFLINE as it's
non-destructive.  The internal function can never return -1 either,
so we choose this to allow for defining the function with 'enum mmop'.

Reviewed-by: Dave Jiang <dave.jiang@intel.com>
Reviewed-by: Dan Williams <djbw@kernel.org>
Signed-off-by: Gregory Price <gourry@gourry.net>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
---
 include/linux/memory_hotplug.h | 2 ++
 mm/memory_hotplug.c            | 1 +
 2 files changed, 3 insertions(+)

diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
index 8f6da2656f4e2..f19893f5fa948 100644
--- a/include/linux/memory_hotplug.h
+++ b/include/linux/memory_hotplug.h
@@ -317,6 +317,8 @@ extern struct zone *zone_for_pfn_range(enum mmop online_type,
 extern int arch_create_linear_mapping(int nid, u64 start, u64 size,
 				      struct mhp_params *params);
 void arch_remove_linear_mapping(u64 start, u64 size);
+#else
+static inline enum mmop mhp_get_default_online_type(void) { return MMOP_OFFLINE; }
 #endif /* CONFIG_MEMORY_HOTPLUG */
 
 #endif /* __LINUX_MEMORY_HOTPLUG_H */
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index e625529baf996..be8e8e2cd1535 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -239,6 +239,7 @@ enum mmop mhp_get_default_online_type(void)
 
 	return mhp_default_online_type;
 }
+EXPORT_SYMBOL_GPL(mhp_get_default_online_type);
 
 void mhp_set_default_online_type(enum mmop online_type)
 {
-- 
2.53.0-Meta

