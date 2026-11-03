Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793665331;
	b=EjtfKdUzHxx0PfgbdLGDVDhcmcFwcoDhiOVTCUsdhw9aVgftzk7l+T3LgvV4FsdC5FDn
	 eP/QUisUCW6J1JgHX0+fKJmDjjsyyp+wHRjvypFfb+p5So+Eg/HtgMXPjBk9rZAi7B8bO
	 khUGWHpMbbXw2ZfPGGUWVjFhZUeSa4Br5H7SzMGS6JR0mxaptpkxE7SQFiiOYYCJyXM+O
	 fTdz/w+HtKyHRQMxNqX6Jp0U8K75x/n/huiUmWJ++L2VkUx7oCfzdwsLJYcup0I8xPhjd
	 7ZEm47BLAfEjXxPrLgd/G9y29rh6pMF5SftaDLrGZLMMpVbTqdFxNnEnHbeECBPZxwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793665331;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=GnhmkL3sHgBajA/tFiWhkmxN54BhG8qxI7na8JnF6t4=;
	b=ic0yRFWE2lH0ac8c3AvrIAPqKFzDjxdCXnqtJx2T+sNdSdoAzdX/J6N4/DJougt5rDfl
	 BHM0ZtNFAE03kxldjltyXvtJlduKDJbpw9vpkId2VFDSHW/NKaNcUY2BZDDEhTJuG35MU
	 bm0j8FP02HLCeiUzivMa4D5nziVlzZ2wqMM/yDK/1T4TGb33pdyKS8RN+k0eQ+Ea6W7Zl
	 a6j/QbWDchLttbKUew7DzJqnBBRnvM/1wCIZ3AZqL9HtgqbmHr3E48FOhjewwpbWo6bx0
	 4mt65K+jxISZIzXYuEywVVxlXTiRhtwAS4JTC7CtzlktiMrUTaSz4KGyyCSiYOOiGeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DLf+Y9s4;
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80057606D818
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 00:22:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80057606D818
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DLf+Y9s4
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e941532594so40580855ad.3
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 16:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793665331; x=1794270131; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GnhmkL3sHgBajA/tFiWhkmxN54BhG8qxI7na8JnF6t4=;
        b=DLf+Y9s4cg8dY94ixNKufGvp9EgW7E1eziXIR53jM1PZL7X/tYfWWjwG0JdV6xCBZ3
         6mtDWr7KQ6SEGwZfIosZkL6rAba736wMqqE2ABQMe7PvimSYBt20AEtAlptUUqQB4Jeu
         nyL09EIMOW8Fcu4vr/I1ZvjUjegTCY5c6rEhKA/NulQtqGGfEKSePP3RYcEVMQKOOEjq
         Z1byyCmG5XttNdcTvKK31CPRdMeNEmGt7agUHhOi/gDJgSi5LknPJGTNqQqSoPA1MGiu
         EdCMs+1XhgkQBU6zARfTLJTGaT9lo5I4MHKDS+bZEhTZt2W1ju6QF2J30wOhhtvoZuAL
         3Ajw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793665331; x=1794270131;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GnhmkL3sHgBajA/tFiWhkmxN54BhG8qxI7na8JnF6t4=;
        b=KSfQhCi3hT+1vCWgJv6iHDGUP9Fju8S3MhZU05sFUMbsiHBbUVWOnCZEv/qjQ3w1bE
         T6GAWf97Z1gvtwLEVXFj2jLl+/KkZMyT/KbC0Acf2KK9iy9ZlITI3uhOWs86sgnRMsi7
         AUm79A2GQ3PrY++gVA4BV9paWeVe7kxpdmz30ilyrmmcbZHxIN8IuO/lQv/XN4+JwuRR
         ewZwG96h7GAjuUyPAuEIKL0pLTXPziIiUbRf9juKTh8hbSbF9rXTJnCk+EYGe1mHIHB1
         SU87wOhhTbIoFD8vqOL/FDprVJ+vBB/ZMwShfk/D2xSsjsFX8Ej1NDji/M5VRhAhRa+1
         NLqQ==
X-Forwarded-Encrypted: i=1; AKwUvBz1nMTZMEryMKsRkHpqKyCVjUelYNYAa0pyHRb7fcaEjuXNSx4DhEd/hrV+Hi3Wp6bSeiLTY2c4tBdlgo3RaVw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+X2zzkI67lZvQlnHWETlJJPk35YmLnmsI+QVvAqXKsO6SlglfF
	I4ENYslHUXWT+NPwePtDYWYandglKP2iJv7s2u4K29F3z7Gw2+S9FiV6wn+eT49rhIcOxRYOP8v
	zgU7crUki6SYmHQ==
X-Received: from pgbx21-n1.prod.google.com ([2002:a05:6a02:63d5:10b0:cca:8b09:717])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3c8c:b0:3ac:c23f:cf51 with SMTP id 98e67ed59e1d1-3ae8983126bmr10794595a91.49.1793665330510;
 Mon, 02 Nov 2026 16:22:10 -0800 (PST)
Date: Tue,  3 Nov 2026 00:22:03 +0000
In-Reply-To: <20261103002205.3348519-1-dmatlack@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261103002205.3348519-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261103002205.3348519-4-dmatlack@google.com>
Subject: [PATCH v2 3/5] vfio: selftests: Print the known IOMMU modes on an
 unrecognized mode
From: David Matlack <dmatlack@google.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Cc: Alex Williamson <alex@shazbot.org>, David Matlack <dmatlack@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Print the names of all known IOMMU modes when iommu_init() is passed an
unrecognized IOMMU mode, and expose the list of names via
iommu_mode_names() so that tests can also print it, e.g. in their help
output.

Users can specify the IOMMU mode for some tests on the command line (e.g.
irq_test -t), and so a typo or unsupported mode should tell the user what
the valid options are rather than leaving them to go read the library.

Suggested-by: Sean Christopherson <seanjc@google.com>
Link: https://lore.kernel.org/kvm/auit0kVkAaWcNUvk@google.com/
Signed-off-by: David Matlack <dmatlack@google.com>
---
 .../vfio/lib/include/libvfio/iommu.h          |  3 +++
 tools/testing/selftests/vfio/lib/iommu.c      | 20 ++++++++++++++++++-
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/vfio/lib/include/libvfio/iommu.h b/tools/testing/selftests/vfio/lib/include/libvfio/iommu.h
index f204c71494fe..42d1de742c0c 100644
--- a/tools/testing/selftests/vfio/lib/include/libvfio/iommu.h
+++ b/tools/testing/selftests/vfio/lib/include/libvfio/iommu.h
@@ -51,6 +51,9 @@ bool iommu_mode_is_available(const char *iommu_mode);
  */
 const char *iommu_mode_unavailable_msg(const char *iommu_mode);
 
+/* Returns a comma-separated list of the names of all IOMMU modes. */
+const char *iommu_mode_names(void);
+
 int __iommu_map(struct iommu *iommu, struct dma_region *region);
 
 static inline void iommu_map(struct iommu *iommu, struct dma_region *region)
diff --git a/tools/testing/selftests/vfio/lib/iommu.c b/tools/testing/selftests/vfio/lib/iommu.c
index 526bb21f2766..64614325c49b 100644
--- a/tools/testing/selftests/vfio/lib/iommu.c
+++ b/tools/testing/selftests/vfio/lib/iommu.c
@@ -90,6 +90,23 @@ static const struct iommu_mode *iommu_mode_detect(void)
 	return NULL;
 }
 
+const char *iommu_mode_names(void)
+{
+	static char names[256];
+	int i, len = 0;
+
+	if (names[0])
+		return names;
+
+	for (i = 0; i < ARRAY_SIZE(iommu_modes); i++) {
+		len += snprintf(names + len, sizeof(names) - len, "%s%s",
+				i ? ", " : "", iommu_modes[i].name);
+		VFIO_ASSERT_LT(len, (int)sizeof(names));
+	}
+
+	return names;
+}
+
 /*
  * Returns the IOMMU mode with the given name, or if iommu_mode is NULL, the
  * most preferred IOMMU mode that is available (or NULL if none).
@@ -108,7 +125,8 @@ static const struct iommu_mode *iommu_mode_lookup(const char *iommu_mode)
 		return &iommu_modes[i];
 	}
 
-	VFIO_FAIL("Unrecognized IOMMU mode: %s\n", iommu_mode);
+	VFIO_FAIL("Unrecognized IOMMU mode: %s (known modes: %s)\n",
+		  iommu_mode, iommu_mode_names());
 }
 
 bool iommu_mode_is_available(const char *iommu_mode)
-- 
2.56.0.385.gac671c819a-goog

