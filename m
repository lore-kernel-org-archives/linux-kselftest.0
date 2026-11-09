Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794258522;
	b=19Juz9Nkh5NbtzbDWH4OauiJ5XOrvZjDF4pqArIx3+ksdFx8UxGrY1T0Sf269gTVG4VC
	 5o0e0CirLYgnPCyOU7J8IOS+j1pDlEy1wmsFWBHF84MrOZ3vjnfV5c70DvHD7j8LXq14p
	 ZKqgxFDO89JA4hESME8f8OV837fLZwA7nS4jpSWVfDcjyEdRYVCqdbK8BiO7yGb8EwgIX
	 Ki5Ulyyo19rw0pHBXOcfpPm8SUpRHwRngA4A8o5A6G7U6GEXFXoVqGoZ2jc6kY/xLWTPB
	 8MSmQrNixcRwvfovlDLhG5d5ettxs0zGwYsI2vkYY4cvl8NkRiRRDfLQSn1dp3/2GSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794258522;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=UIqXWdO+I2nnx9qx72uMZxanfiXwOH1WEBujyHHbfZs=;
	b=uIsqaAuaFiITfmjUxECHflCOtESWUQtnLFjBex6HDQs8qBhGiKuWrtdv3xW9C4qsw5EH
	 iDTlla3Sev9FeQzEZPIX9kocJop8O9zBnkLziEj3kRbZPp5dEzzuAjVIOASWCvI/XwZ+k
	 pOp0gM/Bmi8E3Br9Ls2gHAHZb0lm7xe+HIjkAKWRraGOG3BPFgIZVgeF9O5MXqR/Zi5dw
	 u/2ideYeBirHN4xloaq0+XKGSQlJC385B8kIiHl9gzoFb1aVuYi1UH6lR0VVZuDsmlT81
	 QdDJPG4IZ+EvrBc1wvpBIOjbuNHM2SReqY0Fyx3afxn7mtrgOvpeOX6KKM+Q+GyaQ6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lWjqfcvB;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7758060A380D
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 21:08:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7758060A380D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lWjqfcvB
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4dab94dc3e7so2474078b6e.0
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Nov 2026 13:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794258521; x=1794863321; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UIqXWdO+I2nnx9qx72uMZxanfiXwOH1WEBujyHHbfZs=;
        b=lWjqfcvB+NwV7IEX5ogn0d9ckzY/SOtCvh2zET96ApadV9rHMnOZtzXywlSlBRH2j5
         EI+EW86Ttpq6lMGXzr/YjCZteF0HBXNFZAJ4u61wn+iGm12uBicKhSszPh7dwnFIj1SZ
         Fdu0HIuiMogzn8OLqkGlJtNqtsXt/aoCIQ13CoK5lM5FdKYapSvsRtiKQK6pMUPbtFyP
         RPRyZckONjFxlBH5QlI+uexKugsxbWU+v2910JH+R3Zu0VZpjMTdbYZeaeimkG3nsmFu
         r/INJaWLo00z2XraCPfVs57xB9N551xSVA+Quh4c6nn85z/DhXPa1tvsodkeXA7dy/9k
         ZS4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794258521; x=1794863321;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UIqXWdO+I2nnx9qx72uMZxanfiXwOH1WEBujyHHbfZs=;
        b=l32Me91IRMat8Eu49CJLvrM1Xdujs5Cauw99LscnKzo7UjxYreWtgU64mFJIvBD+3X
         Y5OxEA4QkUIlkwbpRe/CX30jbFR/5dt6W6J5fIN6Su6naQoY3ZAGfBa9W2PDH5gDYBa4
         Qex3qi7CyX9jDLicqm+JCkLDWynQe+Attizc58Ep/AgJzMugUzd8qGVqYsJ65RkE+3OC
         M1rv3Vugt3+Jz1XA1vZ5RFK01lVxV7SQ1op6KsitSLfNaIxlSYDPJhTWgby0ZWj0sgxK
         4VAfWfELVXQwHPt5z/iS2ph8IhVk3UU5/67GXvC0IcVAxVG1qSR3Gq3AosftYxavnXpE
         5bcA==
X-Forwarded-Encrypted: i=1; AL+hErHiv8WxIyHY5nSjdgY1bZ3LO1lFcvszEgPoiaKYU70oykTxeh+eAXVCBva+HP8FQaCneLUca5RyQosh4gDs6zw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gbSKXcavUBvQUiW63c5YhZqob+12lPnfvqGh95Qh2dEXul8Hf
	/Rd8BvQRXpft73Muqi3+gFXI/wy/bLrllWNLfcfLTQwyiOhuK4/Mod1VtvFdo6S7Wsa3ueNKCcw
	5tLYh9GTAJfrSuA==
X-Received: from iozz3.prod.google.com ([2002:a05:6602:43:b0:9c7:b2a6:b165])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:320d:b0:567:e971:200c with SMTP id 5614622812f47-5683cd15a02mr645575b6e.41.1794258521365;
 Mon, 09 Nov 2026 13:08:41 -0800 (PST)
Date: Mon,  9 Nov 2026 21:08:33 +0000
In-Reply-To: <20261109210833.1250548-1-dmatlack@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261109210833.1250548-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.506.g506a7eabc5-goog
Message-ID: <20261109210833.1250548-6-dmatlack@google.com>
Subject: [PATCH v3 5/5] KVM: selftests: List the IOMMU modes in irq_test's
 help output
From: David Matlack <dmatlack@google.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Cc: Alex Williamson <alex@shazbot.org>, David Matlack <dmatlack@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"

List the names of all known IOMMU modes, and of the IOMMU modes that are
available on the current system, in the help output for irq_test's -t
option.

The help output currently lists only vfio_type1_iommu and iommufd, even
though the VFIO selftests library supports five IOMMU modes, and the
list would go stale whenever a mode is added. List the available modes
separately so that users can see which modes work on the current system.

Opportunistically refer to the -t option's argument as iommu_mode rather
than iommu_type in the usage line, to match the help text.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 tools/testing/selftests/kvm/irq_test.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/irq_test.c b/tools/testing/selftests/kvm/irq_test.c
index 0d6ca1a052c4..9076271cc0dd 100644
--- a/tools/testing/selftests/kvm/irq_test.c
+++ b/tools/testing/selftests/kvm/irq_test.c
@@ -150,7 +150,7 @@ static void kvm_set_empty_gsi_routing(struct kvm_vm *vm)
 
 static void help(const char *name)
 {
-	printf("Usage: %s [-a] [-d <segment:bus:device.function>] [-e] [-h] [-i nr_irqs] [-m] [-n] [-t iommu_type] [-v nr_vcpus] [-x]\n", name);
+	printf("Usage: %s [-a] [-d <segment:bus:device.function>] [-e] [-h] [-i nr_irqs] [-m] [-n] [-t iommu_mode] [-v nr_vcpus] [-x]\n", name);
 	printf("\n");
 	printf("Tests KVM interrupt routing and delivery via irqfd.\n");
 	printf("-a	Affine the device's host IRQ to a random physical CPU\n");
@@ -159,7 +159,9 @@ static void help(const char *name)
 	printf("-i	The number of IRQs to generate during the test\n");
 	printf("-m	Pin target vCPU to random physical CPU before triggering interrupt\n");
 	printf("-n	Deliver 50 percent of IRQs as non-maskable interrupts\n");
-	printf("-t	Override the IOMMU type to use (vfio_type1_iommu or iommufd)\n");
+	printf("-t	Override the IOMMU mode to use\n");
+	printf("	Options: %s\n", iommu_mode_names_all());
+	printf("	Available: %s\n", iommu_mode_names_available());
 	printf("-v	Number of vCPUS to run\n");
 	printf("-x	Use xAPIC mode instead of x2APIC mode in the guest\n");
 	printf("\n");
-- 
2.56.0.506.g506a7eabc5-goog

