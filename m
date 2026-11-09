Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794258522;
	b=nyZEqbVZlAUlqiINHmGloGL4o2sU6yILSgPQt7DfkKKQWYlEYjbb2Mx4m2ZjADSAlbzQ
	 097vGWBoEDM+jj28y6U4tjG4opTY/iWnhVhtlwit2ObrqAIcHMQ2S5fD2d3Hzd+1fb/1i
	 C7Lar+2nl9Ac/XE1ajALpk+y+AHTFzUAljJXlE8PL8Np6UOUZntXJpQrV7ci47A9cOA5K
	 6Dy/I0mjKi7S5bTuGc/GN5WeutAtfSH/yDD1QziSvii7YigPFbYDgZZ/MCWi3B9VjqPV9
	 cn/lajpJBzRB7Q/lDWzG5U4L2nsNlCJAIOTBMJ/HpGYr7D9s8EKZR0kOr/7v3pugLbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794258522;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=wumk5mwNJr5KP1IwkSlRViD8R1WfLH7S/49T7W8Gkq4=;
	b=3okSFFiH2G29Aj4eNIuk8niQanbaCjHqfrjR9OLqegihmznqfMsdGNc5rUFi5Sx7W1RB
	 OWimoZzjZ1MpPKyYAqE463vI6wxLT/2meZsbw2uOwofdf9pR6UJsbn7VhffyMerLtRz5D
	 5BnaUQPq2i8FK5r/FZ7xRQihirdmguOZUTSddpV6x4j+uRxsV/CYRSim3oiAVk57IG/+B
	 BAOH7AtMLY8k3rOVrtOym5gTlbJM679kO8PrZftzYY3QdFmEoffE8CmrF7dlfgy86Qbif
	 V82CzbFK0pI59RWjZwLLY0n3U+vfHPhdLq89HNNE93BN4KwyZ6fCaieVoq/3tqKIGng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=F0S7vdPC;
	arc=none smtp.remote-ip=209.85.160.70
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E9C60A2631
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 21:08:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73E9C60A2631
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=F0S7vdPC
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-448d51840c4so1010733fac.1
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Nov 2026 13:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794258520; x=1794863320; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wumk5mwNJr5KP1IwkSlRViD8R1WfLH7S/49T7W8Gkq4=;
        b=F0S7vdPCEh3zpkLxuDnPH8w//ucHuqYZ/WaHYBv6bPnaCS0uKvyrKWkw5cKuA4xe0C
         s9YLhasEEbTTDLR9M/etmHLjWMJYz7W021UjCPs4fiREjkAPE+rSn3HLQIEAaY9GwI40
         If6UniZSi8Js/SjUCRJtrFGW5ihoCkWMyMlC4Bed8S1gCSciWgrIDsDTmsEmGYvG7t0s
         Pfht/uc8WDB0h12ENY97ex+bkopjkOzbUGGTMrMEhZWfNnMTLCbxySO7jOTQUiJyNP6B
         eIeSf/9yKQON4cdc/V1T4dd2PYNZG9mJloF+B9KTzbkKfhWqKHOrGAQsVklcA5oKUbI4
         S15w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794258520; x=1794863320;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wumk5mwNJr5KP1IwkSlRViD8R1WfLH7S/49T7W8Gkq4=;
        b=mL0FJemQntvnsx0knXbh3jJA4laBQTWkU0nUcjOoWDpFquIf2Gb/PGqjuLQe8NmyVx
         YsZJ/dpqWHAjm7gF9eKIXVzjha+566Ywd5ZJ88PXBktvpy/HNRy6CuYwqEQA3Eyda8FI
         8zRfsnZO2FrDuImMJy0WZOCJlMJhj/TQYeHNByYRD24rB7bFaF4jb3u/HLsmtWZgAPp1
         scGM2uPRIBk/GvPhV5i+OGHEL6a/LE+CBWLn5x+5NTj3t2UBEhWrXf4+ADMqxPji1+y1
         WehmCT7Sj0jhJxVQAeuyBc0X52bc7Ldd7DPGRisQFLs2riewGHUIS/o2fX+0Fqqqe2Bn
         8buQ==
X-Forwarded-Encrypted: i=1; AL+hErE+rKxbllVxKy7NPhl/oGCmNlK/n48URry8Mkb4FeFhAJ0FFONpx5rLZWSrfJ5k3Klxl7GkRWCR8Pklwmgw0EM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XEXnyLVCDIE/SYCQ6QfBZb8yhmL/49vs7FjEHjbtcm/+jBLTy
	FIY6OJDEP8I6wGOH+Yq5/77MWx2EXVEtbYvDxFlV/geXgfPys/lwAt09XU7tkDEyy2U4zc6qFlq
	WswYnuXAs12AMCQ==
X-Received: from ilqu16.prod.google.com ([2002:a92:ccd0:0:b0:53c:3409:afff])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:5094:b0:4d6:90f3:74b2 with SMTP id 5614622812f47-5683cb012b7mr675827b6e.50.1794258520143;
 Mon, 09 Nov 2026 13:08:40 -0800 (PST)
Date: Mon,  9 Nov 2026 21:08:32 +0000
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
Message-ID: <20261109210833.1250548-5-dmatlack@google.com>
Subject: [PATCH v3 4/5] KVM: selftests: Use VFIO selftests library to pick
 IOMMU mode in irq_test
From: David Matlack <dmatlack@google.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Cc: Alex Williamson <alex@shazbot.org>, David Matlack <dmatlack@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Use the VFIO selftests library to pick the IOMMU mode in irq_test and
drop probe_iommu_type(). Pass NULL to iommu_init() when the user does
not specify a mode with -t, and skip the test if the requested mode is
not available, or if no mode is available at all.

probe_iommu_type() picks iommufd whenever /dev/iommu can be opened, even
if VFIO device cdevs are not available (CONFIG_VFIO_DEVICE_CDEV=n), in
which case the test fails rather than using the VFIO container. The VFIO
selftests library accounts for this when picking a mode, so there is no
need for irq_test to probe for a mode itself.

Note, this changes irq_test's default container mode from
vfio_type1_iommu to vfio_type1v2_iommu, which the VFIO selftests library
prefers. This only matters when iommufd is not available.

Opportunistically rename iommu_type to iommu_mode to match the
terminology used by the VFIO selftests library.

Suggested-by: Sean Christopherson <seanjc@google.com>
Link: https://lore.kernel.org/kvm/aiIG2L_KdPwuxYA1@google.com/
Signed-off-by: David Matlack <dmatlack@google.com>
---
 tools/testing/selftests/kvm/irq_test.c | 26 +++++---------------------
 1 file changed, 5 insertions(+), 21 deletions(-)

diff --git a/tools/testing/selftests/kvm/irq_test.c b/tools/testing/selftests/kvm/irq_test.c
index 791e576c334c..0d6ca1a052c4 100644
--- a/tools/testing/selftests/kvm/irq_test.c
+++ b/tools/testing/selftests/kvm/irq_test.c
@@ -148,22 +148,6 @@ static void kvm_set_empty_gsi_routing(struct kvm_vm *vm)
 	vm_ioctl(vm, KVM_SET_GSI_ROUTING, &routing);
 }
 
-static const char *probe_iommu_type(void)
-{
-	int io_fd;
-
-	io_fd = open("/dev/iommu", O_RDONLY);
-	if (io_fd >= 0) {
-		close(io_fd);
-		return MODE_IOMMUFD;
-	}
-
-	io_fd = __open_path_or_exit("/dev/vfio/vfio", O_RDONLY,
-				    "Is VFIO (or IOMMUFD) loaded and enabled?");
-	close(io_fd);
-	return MODE_VFIO_TYPE1_IOMMU;
-}
-
 static void help(const char *name)
 {
 	printf("Usage: %s [-a] [-d <segment:bus:device.function>] [-e] [-h] [-i nr_irqs] [-m] [-n] [-t iommu_type] [-v nr_vcpus] [-x]\n", name);
@@ -205,7 +189,7 @@ int main(int argc, char **argv)
 	int nr_irqs = 1000, nr_vcpus = 1;
 	bool set_empty_routing = false;
 	const char *device_bdf = NULL;
-	const char *iommu_type = NULL;
+	const char *iommu_mode = NULL;
 	int i, j, c, msix, eventfd;
 	bool migrate_vcpus = false;
 	cpu_set_t available_cpus;
@@ -235,7 +219,7 @@ int main(int argc, char **argv)
 			use_nmi = true;
 			break;
 		case 't':
-			iommu_type = optarg;
+			iommu_mode = optarg;
 			break;
 		case 'v':
 			nr_vcpus = atoi_positive("Number of vCPUS", optarg);
@@ -266,9 +250,9 @@ int main(int argc, char **argv)
 	}
 
 	if (device_bdf) {
-		if (!iommu_type)
-			iommu_type = probe_iommu_type();
-		iommu = iommu_init(iommu_type);
+		__TEST_REQUIRE(iommu_mode_is_available(iommu_mode), "%s",
+			       iommu_mode_unavailable_msg(iommu_mode));
+		iommu = iommu_init(iommu_mode);
 		device = vfio_pci_device_init(device_bdf, iommu);
 		msix = vfio_setup_msi(device);
 		irq = vfio_msix_to_host_irq(device_bdf, msix);
-- 
2.56.0.506.g506a7eabc5-goog

