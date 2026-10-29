Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793312234;
	b=RuexXzepw2vUPMSjvhkagrNmaRFs2Y/V7ZTfgh9+PZRxMsYzISQJw17rkC68kmlvKyBZ
	 ZZc67tsV6BWZTO832kWcF430C62SRascIyyfiFKsaP2OzOpfq0szYFWRMQULFOVg2krVV
	 2Z4MiVwy4SdNc0YFN3cqtl6CatjGK6pkXrM5j9JOstEIx2KWtJRyRAN6ajZnGyBlDT1U6
	 Jdj77uGTCUusgprYo099lDRro2bOdAVucqxY1N/5+/qJ5/HnTx9HHm7CLgddJkoJNHAsu
	 1OdDSpzAmeez6UUjktjZsS+YqFVWod3rvyQYe9PwPNER8Fx5HmLt4wrM8RjMlMNuJMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793312234;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=oCfALTpVNsGOvCIhEmt/b+UiZmu6ux3vhKLUcsB5deQ=;
	b=zjB92OcixITFRxe+iVqMOA/z3/Q9kdP3DasvWhdKyEytgwwMmfH+2caUfTfNnUWE+9h3
	 NCsnRydwEKZxX3EF1OkF1rxGBn4XdOOCct5ZSSMGvLiI3BrQdKYvINqGzxrK4/a8gX+z5
	 GWmPqCzNumKliZvf1BK2Skg01H8wHX4FUYLWc+/4GlKaQd36q0jm5N2sRRLX+JE+4Ll7P
	 2tGCcX7e2L75aD74KxIZQuB1OdI1X8QFOTe1L9f2G/kVtYOi6kOmZWg8BDqovb2kq9vlN
	 8g61cETmMcrPN36faI0l30a+ZclK7aGaJC3zRsb3R7Wq8GzxrWTY25zZae77yHxYT6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=goEw6cA9;
	arc=none smtp.remote-ip=209.85.215.197
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7BA606A31E
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 22:17:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C7BA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=goEw6cA9
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd5ca3840c5so48006a12.2
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 15:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793312234; x=1793917034; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oCfALTpVNsGOvCIhEmt/b+UiZmu6ux3vhKLUcsB5deQ=;
        b=goEw6cA9whthLzAwKBgUvvPwCWEtin8u18elZnDo0yK7TRMAf5M1BbFspPoTwrayMi
         JqRalZ6hLGbgcgReaviJ6bKzUTxFHaopblCkxKB3iQ8XV6Kyqi44QtzeWW+A9PPUQbfC
         z9jhaFEFyXQ2vC+LiLO3iVp0qksAeqNhRwLw6o6ElXrXAYYBfZudumMLei7+i/JQpjNJ
         2zwcP1Zxpe3LE7SkZQxqgpRj2FRLG0dCA4t6wDWkJGVTvZyxrmGSuAQe+w8/UFuN6IGg
         gmVcfJfo9wz83Lt0X4xNZlLQXJKKUOiTwo7af6pvcKrN6EH7yVkIJ52Hzq20bL10gxLj
         8Uvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793312234; x=1793917034;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oCfALTpVNsGOvCIhEmt/b+UiZmu6ux3vhKLUcsB5deQ=;
        b=dsPSM/tnStI4cIa6hoj0JI1Qlvmr3d++gqOS3X0VwhINjERS7NkgZy8M6pd3/3fCkZ
         SQB+BqGPxVBv9MhLWCcAeHDsXjYiU5NNCpahEF1EbTcFEw5lE3nf+r5EPZizIw/5dxVh
         VEbp6RhsTF7f4j4gwXRUCvY3Aw2ZLOglNWLP2uIOqePe/8dsL9Z7Gptfe1rE7Ysg6o1g
         QQ7/Wj2WjICgDMoz4JEY+z2lANzoOeAiqpXeQ/wIlGGyOCZWnPKfDburlevzvNCoiBiU
         /beH/l1Nu+eeMI6mR9beVkh7KWAx+g0PHjM00ZaeiazrUlBa+uR7YBl5I8ICCb6r/eQ2
         cjCA==
X-Forwarded-Encrypted: i=1; AKwUvByQweo9gZSMkcSnvHEagQfDKIe1HofM4cZF9w5pPnVSBcpQrzbYIzqnf90ji8JWgNuG38AcLmNeUrlStlyT1BA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKF3V/PdVkSSA3agDu1c84Kq13z/3UvpVB7AuXCkoZxfn3A15FR
	NOpEwkYzFsZH53lsD4+xnwO47w8gk4QvoM6tHSBM2Fs/R9TGijh7KiRC7PwTELLjmwU0/g9Qi37
	ZpBqOAP9aCof+ig==
X-Received: from pgbd5-n2.prod.google.com ([2002:a05:6a02:64c5:20b0:cd8:c4be:4fc3])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:6116:b0:3e2:8b64:2ca0 with SMTP id adf61e73a8af0-3e928a03d22mr585413637.49.1793312233691;
 Thu, 29 Oct 2026 15:17:13 -0700 (PDT)
Date: Thu, 29 Oct 2026 22:17:10 +0000
In-Reply-To: <20261029221710.1871112-1-dmatlack@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261029221710.1871112-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261029221710.1871112-4-dmatlack@google.com>
Subject: [PATCH 3/3] KVM: selftests: Use VFIO selftests library to pick IOMMU
 mode in IRQ test
From: David Matlack <dmatlack@google.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Cc: Alex Williamson <alex@shazbot.org>, David Matlack <dmatlack@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Use the VFIO selftests library to pick the IOMMU mode in the IRQ test and
drop probe_iommu_type(). Pass NULL to iommu_init() when the user does not
specify a mode with -t, and skip the test if the requested mode (or, if
NULL, any mode) is not available.

The VFIO selftests library now automatically picks the IOMMU mode that is
most likely to work on the current system, so there is no need for each
test to probe for a mode itself.

Suggested-by: Sean Christopherson <seanjc@google.com>
Link: https://lore.kernel.org/kvm/aiIG2L_KdPwuxYA1@google.com/
Signed-off-by: David Matlack <dmatlack@google.com>
---
 tools/testing/selftests/kvm/irq_test.c | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/tools/testing/selftests/kvm/irq_test.c b/tools/testing/selftests/kvm/irq_test.c
index 791e576c334c..f9c11d80a306 100644
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
@@ -266,8 +250,7 @@ int main(int argc, char **argv)
 	}
 
 	if (device_bdf) {
-		if (!iommu_type)
-			iommu_type = probe_iommu_type();
+		TEST_REQUIRE(iommu_mode_is_available(iommu_type));
 		iommu = iommu_init(iommu_type);
 		device = vfio_pci_device_init(device_bdf, iommu);
 		msix = vfio_setup_msi(device);
-- 
2.56.0.317.g454f8302e1-goog

