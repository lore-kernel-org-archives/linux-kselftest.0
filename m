Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8DF34041B
	for <linux-kselftest@vger.kernel.org>; Thu, 28 May 2026 09:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779961608; cv=none; b=vEBkeOWqWT4FoMBZ5duDN+4Ts/A3jLRBAuJN3sg3KT3aIwfI+w9D8Ka/7jV+qj77/uf8K93duar8NP7DMprcEDLB9bIL17lsMfKOJ6UIAEIZhDdWx5whtJ6U43hIoI70PmF/3buB6Pn1S+pY2X8qZ8LCthdKPGlw9nDqVk7LfBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779961608; c=relaxed/simple;
	bh=U45YX1bVE/BPWSzuoqEAH8fpZ7EUwj9Dz2GGIOroZE0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mlMzcWn2hSHHQ7amL0vBthF3qC14mptFslsJgTQZ5S2veg3kJHaZCpgHUhWmOx9UnGrwOu2rRTopYxBiN9klENv+w4f5gRrj8Vgw1NdexXLRDfKaJlN1ig4ld2cNHwQyhNnJhjdhVFggS905TDhebaEhEC7jV1MiGK2O8THkXn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GQGMhJdu; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GQGMhJdu"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-bcd3c190f71so2017594866b.0
        for <linux-kselftest@vger.kernel.org>; Thu, 28 May 2026 02:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779961606; x=1780566406; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sS27ZkYmmSuo+TQnd/NA6YerqfqF6DQASvsyjFS6nzs=;
        b=GQGMhJdutvXGlDQ9P/fbptppFbMKzswvzYGatrgOXaufiGMM0/LMxtoZO9d1R2U/Yj
         rRlQoUYspW4Bingvp3Anfhg7f+hXQhW+apVSEAJs+jm0SNeqObemgOedYF7wemScjNBs
         BC85QLhxKCoejpnqXyHQWQGBtIY/Y6ythHaSa3JlieMRZatAlfzmqYVrTTLyJPQCzVlj
         XW3K4SN7AnLDoNq2MMWLOIbrC8aK2HsoW5ftnUVh8MoZqOveggl8jI8KuekUuK6gk8A7
         t6VemZa/M0tCpjQj7R2UbtS6EieTm+PPvVOiqhXcuvUFj9t8xQXqYEHBEUQ9gIULRAqP
         yx0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779961606; x=1780566406;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sS27ZkYmmSuo+TQnd/NA6YerqfqF6DQASvsyjFS6nzs=;
        b=c5UdqZa7NJKNJK1hgbRj1msj35H4DgY65EbBxaSn1/gL8nMXn0/+zBFsplzA8TypjC
         WOoJkSB07z1LWcY0bYp8lezywTUk/BNMVaCDArK2OEVmesm65L5veRFBsWQSYdXplTia
         vbm0MgqJIo+T1b3Gd7VZdiTnS+ie2dn9drNkqJKdvxsZLy6hhngb8QwwMXQI8ybSqrfJ
         YBIldLNZcklvRkA26gsz0gffK/g+X13o59YRf+jYHG9sN31tahcq4BqQ+vCRn3g3saFU
         CKZslWElaNtqPOvz7WrCSFIUhtqz5ziQXhZDgcepw+yHlclGBXo/I7HQaeNlWH6AchuO
         bGDQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ag1jzO2DKTQHpff/QsywMyY1HHFjVqvb3Gn7Ju/JW4KNyzxPBFRMsj94B/Ip4iQOyFa+HOJgfHfDS14SeCLc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0N28wZsEX+gVve4NKRIK7q1ghc5AHkyqRxp2xCvesw1d9dzDi
	3EtIMZdI2NLQj3reuwrxKrZNGfxyA9lZaXMBPe7EAkTKQr5IAfoyG5I1
X-Gm-Gg: Acq92OHxVcokOFt39fLvABg5qPQcSkvkFJXVcVXrCEoSKvAjI/vMExN/7gRoWwJawSO
	SvcGUW22xO1+/51r7R3KMXChssNTb2cj/e5kLlok0Dgz1q1WPInxp53KhFyyXV9DQylj/NFLL8v
	++Itx9rIBSPh9iClfyxgytB+JF92hxK3xes862r8HzZoSphHLM5qB8OiyljA635dX6d1oLx2fMw
	QpW9VBRKxse6xCPcTikuqU10UO8Oz0/f7ZwFsm1piq2TgZkMkQ0rtfAZMJNGtbyFSO6ezbhEOHF
	O3AV6Ei3F+OJ9HSzJvo7ivwWwtndw+EkV3B6Ku+qi2jn7AWgsXy3oZnUxAH2QqYUNVHIsqqbxEs
	hOqJ9IZ3Je1oxdQBV9esF8DsVaW3P0mc6uxyXJ7yNzB5S+AUhJr/modPtJs/kYUOys+MqeTpvBX
	PlUvbpkYSXPcAlTMKsrS66zDxM6LXGsYBbX4Rz2sF+2h45DMUNyeDQyz1hEGE+rQDuAaagkK9TL
	o+yn4EaKUhOgopAAmpgcKe9XhecAJ98SYjfow==
X-Received: by 2002:a17:906:9918:b0:bdd:52ef:73e3 with SMTP id a640c23a62f3a-bdd52ef77c4mr1250022566b.12.1779961605153;
        Thu, 28 May 2026 02:46:45 -0700 (PDT)
Received: from arch-piotr.tailb7ebba.ts.net (226.55.classcom.pl. [195.150.55.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdecae32fadsm614281466b.56.2026.05.28.02.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 02:46:44 -0700 (PDT)
From: Piotr Zarycki <piotr.zarycki@gmail.com>
To: seanjc@google.com,
	pbonzini@redhat.com
Cc: shuah@kernel.org,
	dmatlack@google.com,
	vkuznets@redhat.com,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Piotr Zarycki <piotr.zarycki@gmail.com>
Subject: [PATCH] KVM: selftests: hyperv_tlb_flush: use swap() to swap PTEs
Date: Thu, 28 May 2026 11:45:42 +0200
Message-ID: <20260528094542.2529735-1-piotr.zarycki@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the open-coded swap with the swap() macro.

Signed-off-by: Piotr Zarycki <piotr.zarycki@gmail.com>
---
 tools/testing/selftests/kvm/include/test_util.h    | 2 ++
 tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c | 6 +-----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/test_util.h b/tools/testing/selftests/kvm/include/test_util.h
index d9b433b834f1..a66bc9ccba65 100644
--- a/tools/testing/selftests/kvm/include/test_util.h
+++ b/tools/testing/selftests/kvm/include/test_util.h
@@ -26,6 +26,8 @@
 
 #define msecs_to_usecs(msec)    ((msec) * 1000ULL)
 
+#define swap(a, b)  do { typeof(a) __tmp = (a); (a) = (b); (b) = __tmp; } while (0)
+
 static inline __printf(1, 2) int _no_printf(const char *format, ...) { return 0; }
 
 #ifdef DEBUG
diff --git a/tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c b/tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c
index 15ee8b7bfc11..514d41f00714 100644
--- a/tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c
+++ b/tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c
@@ -131,14 +131,10 @@ static void set_expected_val(void *addr, u64 val, int vcpu_id)
 
 /*
  * Update PTEs swapping two test pages.
- * TODO: use swap()/xchg() when these are provided.
  */
 static void swap_two_test_pages(gpa_t pte_gva1, gpa_t pte_gva2)
 {
-	u64 tmp = *(u64 *)pte_gva1;
-
-	*(u64 *)pte_gva1 = *(u64 *)pte_gva2;
-	*(u64 *)pte_gva2 = tmp;
+	swap(*(u64 *)pte_gva1, *(u64 *)pte_gva2);
 }
 
 /*
-- 
2.54.0

