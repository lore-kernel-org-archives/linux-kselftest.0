Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794258519;
	b=CMpvgKKCpiK7BxpYHl8YdTWpNllVvyqTtLqdx6h4jY8SIh2OKr6bB+jkJtv7qYRTJ5ld
	 dc4WKrYsp5ZfcSvWv9xnepCbhROtq+skyw7yKosrk/qywLWVzvQ397t44Fl9KjHA+aivI
	 LYagqvTaS/HKOB36s1tm5YVXWDN7OP+jMvWGgGbSdHGLdt0qvZ4RqMhRq8gSsXOagPjLj
	 7bYBlLXCneBlN50pIncuV6r1eSvfCmN5Ac0dvR+O6WOm96bY6UkMvPSx1hTVlZSoA3Qsd
	 UFhe3QFdL4GV7ki7ThiU2ZE0anBffzs2OlZ5b+6AlxKid5F75fxfQOYQUBzRxe3i1dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794258519;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=iC2P0GfdUxK7SsTs/Dpd9lSERxs22y9XDDdLlV5GFTM=;
	b=x9c7aH1OBWLfyG5ki8yKgIYo9lQk/yRu2GZs2vh6Y7v3U/PMW+7lUdNngFs83647MIw1
	 RXSyn2T9ZKc37020/uRJvX516F7BH7WwHsUvZGfFyXKsjAm5JX7SanFkcZbJhbh3Vc/f/
	 Zn8HaxNzZi6FiQhkHeZ8QaJA4rE4tXksbZhnZer8M3l+tD4dY7k2j2bQG3h7nBJZAExyX
	 yy4MSsqIU/ngMSr8hlLCiynfSK2Iznh0gENOC2rUBTKVwRFA7hYOyIDUQX3St2+7hk3CA
	 CCDmfzbdPZcWtiSk47eoHYaqvTboqe+sWwIu3okD4nUQcmWxPz7wixMZlRlLIEfmJiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Am4PHnYR;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A9A606A33D
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 21:08:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17A9A606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Am4PHnYR
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4c467e19391so2062931b6e.3
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Nov 2026 13:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794258518; x=1794863318; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iC2P0GfdUxK7SsTs/Dpd9lSERxs22y9XDDdLlV5GFTM=;
        b=Am4PHnYRT0PM1Z5s2HjamOLVexU4sMrJFIFIAqkgycuWZ9sZhwzwE1lFPs4f2rDNxO
         NE+3X3cvLvEmJtlgTYkfMa7cJV76MkELWjwvwZsXXPRCOfc0NwyduOuqTazmlhLj9QGJ
         CptgZhK7+7AaF6IJdc5BsSAuNqqEU7iB/ZmajYWnUDn0+tACMUfznS1QT4saWwL+V/+6
         TXKZnKltAwKv/Io6iQz6ucJlIyDwQmARjmIe9M+Yh5GbYd6zWQPlHk8346XZmtxfex8p
         Y2wSzLJQtyK/0tV4nb2Nl7IAeDWU19mS4eBBK/B7+qTy8i75q754idQO09CNSj18befV
         sW4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794258518; x=1794863318;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iC2P0GfdUxK7SsTs/Dpd9lSERxs22y9XDDdLlV5GFTM=;
        b=iso8+cwRF9sKIEdr8iWhfTq9IGxpiIhw0eK7uNaDAuKqjjcEg82ZTt180GyZTZAmcv
         2i7VeRJ/7gkRGYn9d90vaLD79MY6Z4KCyKJfHXUn0XCMoHsNfEiusF6SxQuxTb3P6pFV
         1HATuNcBY+0AZ1jFdpU4ZkbQflIiQeSp4voYY6x5s95CiNS0g+EGWRzm42CIakpLOhDu
         SirJ0rM+9EYCm4+nYfAzOhCBdOoHEDtpoyGooxLnB/hhd3C2DCr2DQv53tSOjklFIuPo
         Y5qDDBUFKLp7FJNxIaXVms3CD5SFnthu6Up/N6VQ4OrTuzVVM3TE8H460zaxyFeEfbDR
         EtxQ==
X-Forwarded-Encrypted: i=1; AL+hErE27y6oerey7Bw09KvYoPocF89Cb6OK6+SThOiZvSnrmlDACAO6hle5mFd3DRQGH6E0+Bx4JCSR3XgvP49cRdM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xAHxMgw3VdIlNC+lnskxhUTutMzyAl55YV/ArFVqoimdzxK4W
	RoszSmtbbMPH7ivWBz12bKHtwsWU0tWKl2hLHllmzmd1snuEj2QhGKfln2CMjOLk2t2UcQiDPUk
	WIBur8AiJ+bjc9g==
X-Received: from ila8-n2.prod.google.com ([2002:a05:6e02:5208:20b0:518:96aa:6d6a])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:4f5f:b0:553:66a3:d863 with SMTP id 5614622812f47-5683cc9edc1mr664866b6e.21.1794258517825;
 Mon, 09 Nov 2026 13:08:37 -0800 (PST)
Date: Mon,  9 Nov 2026 21:08:30 +0000
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
Message-ID: <20261109210833.1250548-3-dmatlack@google.com>
Subject: [PATCH v3 2/5] vfio: selftests: Skip tests when the IOMMU mode is not available
From: David Matlack <dmatlack@google.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Cc: Alex Williamson <alex@shazbot.org>, David Matlack <dmatlack@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Skip tests when the IOMMU mode they need is not available on the current
system, instead of failing. Add iommu_mode_is_available() to check
whether a given IOMMU mode (or, if NULL, any IOMMU mode) is available,
iommu_mode_unavailable_msg() to explain why a test is skipping, and
SKIP_IF_IOMMU_MODE_UNAVAILABLE() to skip a kselftest harness test if the
mode is not available.

On a kernel without iommufd, for example, all of the iommufd and
iommufd_compat test variants currently fail on an assert in
iommu_init(). Skip them instead, with a message that explains why:

  ok 33 vfio_pci_driver_test.iommufd.send_msi # SKIP IOMMU mode 'iommufd' is not available

Use SKIP_IF_IOMMU_MODE_UNAVAILABLE() before every call to iommu_init()
in the kselftest harness tests, and in vfio_iommufd_setup_test, which
uses iommufd directly. Also skip vfio_pci_driver_test, which calls
iommu_init() from main() to probe the device, if no IOMMU mode is
available.

Skip via the harness's SKIP() rather than calling ksft_exit_skip() from
iommu_init(). ksft_exit_skip() is not aware of the harness, and would
emit a bogus "1..0 # SKIP" plan line in the middle of the TAP output.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 .../vfio/lib/include/libvfio/iommu.h          | 30 ++++++++++++++++++-
 tools/testing/selftests/vfio/lib/iommu.c      | 20 +++++++++++++
 .../vfio/vfio_dma_mapping_mmio_test.c         |  2 ++
 .../selftests/vfio/vfio_dma_mapping_test.c    |  4 +++
 .../selftests/vfio/vfio_iommufd_setup_test.c  |  2 ++
 .../vfio/vfio_pci_device_init_perf_test.c     |  2 ++
 .../selftests/vfio/vfio_pci_device_test.c     |  4 +++
 .../selftests/vfio/vfio_pci_driver_test.c     |  7 +++++
 .../selftests/vfio/vfio_pci_sriov_uapi_test.c |  4 +++
 9 files changed, 74 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/vfio/lib/include/libvfio/iommu.h b/tools/testing/selftests/vfio/lib/include/libvfio/iommu.h
index 53e38130c334..8306ade5f069 100644
--- a/tools/testing/selftests/vfio/lib/include/libvfio/iommu.h
+++ b/tools/testing/selftests/vfio/lib/include/libvfio/iommu.h
@@ -32,11 +32,26 @@ struct iommu {
 
 /*
  * Pass NULL for iommu_mode to use the most preferred IOMMU mode that is
- * available on the current system.
+ * available on the current system. iommu_init() fails the test if the mode
+ * is not available, so check iommu_mode_is_available() first to skip instead.
  */
 struct iommu *iommu_init(const char *iommu_mode);
 void iommu_cleanup(struct iommu *iommu);
 
+/*
+ * Returns true if the given IOMMU mode is available on the current system,
+ * or, if iommu_mode is NULL, if any IOMMU mode is available.
+ */
+bool iommu_mode_is_available(const char *iommu_mode);
+
+/*
+ * Returns a message explaining that the given IOMMU mode is not available,
+ * or, if iommu_mode is NULL, that no IOMMU mode is available, e.g. for tests
+ * to print when skipping. The returned string may be overwritten by the next
+ * call.
+ */
+const char *iommu_mode_unavailable_msg(const char *iommu_mode);
+
 int __iommu_map(struct iommu *iommu, struct dma_region *region);
 
 static inline void iommu_map(struct iommu *iommu, struct dma_region *region)
@@ -81,4 +96,17 @@ FIXTURE_VARIANT_ADD_IOMMU_MODE(iommufd_compat_type1, ##__VA_ARGS__); \
 FIXTURE_VARIANT_ADD_IOMMU_MODE(iommufd_compat_type1v2, ##__VA_ARGS__); \
 FIXTURE_VARIANT_ADD_IOMMU_MODE(iommufd, ##__VA_ARGS__)
 
+/*
+ * Skip the current kselftest harness test if _iommu_mode is not available,
+ * or, if _iommu_mode is NULL, if no IOMMU mode is available. The statement
+ * argument is passed to SKIP(), e.g. return.
+ */
+#define SKIP_IF_IOMMU_MODE_UNAVAILABLE(statement, _iommu_mode) do {		\
+	const char *__iommu_mode = (_iommu_mode);				\
+										\
+	if (!iommu_mode_is_available(__iommu_mode))				\
+		SKIP(statement, "%s",						\
+		     iommu_mode_unavailable_msg(__iommu_mode));			\
+} while (0)
+
 #endif /* SELFTESTS_VFIO_LIB_INCLUDE_LIBVFIO_IOMMU_H */
diff --git a/tools/testing/selftests/vfio/lib/iommu.c b/tools/testing/selftests/vfio/lib/iommu.c
index ecdfbb62ac5e..56696bd5c30d 100644
--- a/tools/testing/selftests/vfio/lib/iommu.c
+++ b/tools/testing/selftests/vfio/lib/iommu.c
@@ -126,6 +126,26 @@ static const struct iommu_mode *iommu_mode_lookup(const char *iommu_mode)
 	VFIO_FAIL("Unrecognized IOMMU mode: %s\n", iommu_mode);
 }
 
+bool iommu_mode_is_available(const char *iommu_mode)
+{
+	if (!iommu_mode)
+		return iommu_mode_detect();
+
+	return iommu_mode_probe(iommu_mode_lookup(iommu_mode));
+}
+
+const char *iommu_mode_unavailable_msg(const char *iommu_mode)
+{
+	static char msg[128];
+
+	if (!iommu_mode)
+		return NO_IOMMU_MODE_AVAILABLE_MSG;
+
+	snprintf(msg, sizeof(msg), "IOMMU mode '%s' is not available",
+		 iommu_mode);
+	return msg;
+}
+
 int __iommu_hva2iova(struct iommu *iommu, void *vaddr, iova_t *iova)
 {
 	struct dma_region *region;
diff --git a/tools/testing/selftests/vfio/vfio_dma_mapping_mmio_test.c b/tools/testing/selftests/vfio/vfio_dma_mapping_mmio_test.c
index d7f25ef77671..add7d3881930 100644
--- a/tools/testing/selftests/vfio/vfio_dma_mapping_mmio_test.c
+++ b/tools/testing/selftests/vfio/vfio_dma_mapping_mmio_test.c
@@ -64,6 +64,8 @@ FIXTURE_VARIANT_ADD_ALL_IOMMU_MODES();
 
 FIXTURE_SETUP(vfio_dma_mapping_mmio_test)
 {
+	SKIP_IF_IOMMU_MODE_UNAVAILABLE(return, variant->iommu_mode);
+
 	self->iommu = iommu_init(variant->iommu_mode);
 	self->device = vfio_pci_device_init(device_bdf, self->iommu);
 	self->iova_allocator = iova_allocator_init(self->iommu);
diff --git a/tools/testing/selftests/vfio/vfio_dma_mapping_test.c b/tools/testing/selftests/vfio/vfio_dma_mapping_test.c
index 7d0de8c79de1..e42170aecf6e 100644
--- a/tools/testing/selftests/vfio/vfio_dma_mapping_test.c
+++ b/tools/testing/selftests/vfio/vfio_dma_mapping_test.c
@@ -119,6 +119,8 @@ FIXTURE_VARIANT_ADD_ALL_IOMMU_MODES(anonymous_hugetlb_1gb, SZ_1G, MAP_HUGETLB |
 
 FIXTURE_SETUP(vfio_dma_mapping_test)
 {
+	SKIP_IF_IOMMU_MODE_UNAVAILABLE(return, variant->iommu_mode);
+
 	self->iommu = iommu_init(variant->iommu_mode);
 	self->device = vfio_pci_device_init(device_bdf, self->iommu);
 	self->iova_allocator = iova_allocator_init(self->iommu);
@@ -228,6 +230,8 @@ FIXTURE_SETUP(vfio_dma_map_limit_test)
 	iova_t last_iova;
 	u32 nranges;
 
+	SKIP_IF_IOMMU_MODE_UNAVAILABLE(return, variant->iommu_mode);
+
 	/*
 	 * Over-allocate mmap by double the size to provide enough backing vaddr
 	 * for overflow tests
diff --git a/tools/testing/selftests/vfio/vfio_iommufd_setup_test.c b/tools/testing/selftests/vfio/vfio_iommufd_setup_test.c
index ec1e5633e080..f4792899fd79 100644
--- a/tools/testing/selftests/vfio/vfio_iommufd_setup_test.c
+++ b/tools/testing/selftests/vfio/vfio_iommufd_setup_test.c
@@ -67,6 +67,8 @@ FIXTURE(vfio_cdev) {
 
 FIXTURE_SETUP(vfio_cdev)
 {
+	SKIP_IF_IOMMU_MODE_UNAVAILABLE(return, MODE_IOMMUFD);
+
 	ASSERT_LE(0, (self->cdev_fd = open(cdev_path, O_RDWR, 0)));
 	ASSERT_LE(0, (self->iommufd = open(iommu_dev_path, O_RDWR, 0)));
 }
diff --git a/tools/testing/selftests/vfio/vfio_pci_device_init_perf_test.c b/tools/testing/selftests/vfio/vfio_pci_device_init_perf_test.c
index e1a54e153cd3..8a98c86096be 100644
--- a/tools/testing/selftests/vfio/vfio_pci_device_init_perf_test.c
+++ b/tools/testing/selftests/vfio/vfio_pci_device_init_perf_test.c
@@ -44,6 +44,8 @@ FIXTURE_SETUP(vfio_pci_device_init_perf_test)
 {
 	int i;
 
+	SKIP_IF_IOMMU_MODE_UNAVAILABLE(return, variant->iommu_mode);
+
 	self->iommu = iommu_init(variant->iommu_mode);
 	self->threads = calloc_assert(nr_devices, sizeof(self->threads[0]));
 	self->thread_args = calloc_assert(nr_devices, sizeof(self->thread_args[0]));
diff --git a/tools/testing/selftests/vfio/vfio_pci_device_test.c b/tools/testing/selftests/vfio/vfio_pci_device_test.c
index 59a7c1f71804..1b1baa1e1c85 100644
--- a/tools/testing/selftests/vfio/vfio_pci_device_test.c
+++ b/tools/testing/selftests/vfio/vfio_pci_device_test.c
@@ -29,6 +29,8 @@ FIXTURE(vfio_pci_device_test) {
 
 FIXTURE_SETUP(vfio_pci_device_test)
 {
+	SKIP_IF_IOMMU_MODE_UNAVAILABLE(return, NULL);
+
 	self->iommu = iommu_init(NULL);
 	self->device = vfio_pci_device_init(device_bdf, self->iommu);
 }
@@ -121,6 +123,8 @@ FIXTURE_VARIANT_ADD(vfio_pci_irq_test, msix) {
 
 FIXTURE_SETUP(vfio_pci_irq_test)
 {
+	SKIP_IF_IOMMU_MODE_UNAVAILABLE(return, NULL);
+
 	self->iommu = iommu_init(NULL);
 	self->device = vfio_pci_device_init(device_bdf, self->iommu);
 }
diff --git a/tools/testing/selftests/vfio/vfio_pci_driver_test.c b/tools/testing/selftests/vfio/vfio_pci_driver_test.c
index f8f99ee6bb1a..56178c25c2fd 100644
--- a/tools/testing/selftests/vfio/vfio_pci_driver_test.c
+++ b/tools/testing/selftests/vfio/vfio_pci_driver_test.c
@@ -80,6 +80,8 @@ FIXTURE_SETUP(vfio_pci_driver_test)
 {
 	struct vfio_pci_driver *driver;
 
+	SKIP_IF_IOMMU_MODE_UNAVAILABLE(return, variant->iommu_mode);
+
 	self->iommu = iommu_init(variant->iommu_mode);
 	self->device = vfio_pci_device_init(device_bdf, self->iommu);
 	self->iova_allocator = iova_allocator_init(self->iommu);
@@ -270,6 +272,11 @@ int main(int argc, char *argv[])
 {
 	device_bdf = vfio_selftests_get_bdf(&argc, argv);
 
+	if (!iommu_mode_is_available(NULL)) {
+		fprintf(stderr, "%s\n", iommu_mode_unavailable_msg(NULL));
+		return KSFT_SKIP;
+	}
+
 	if (!device_has_selftests_driver(device_bdf)) {
 		fprintf(stderr, "No driver found for device %s\n", device_bdf);
 		return KSFT_SKIP;
diff --git a/tools/testing/selftests/vfio/vfio_pci_sriov_uapi_test.c b/tools/testing/selftests/vfio/vfio_pci_sriov_uapi_test.c
index f3a018b8699d..32a1e651c815 100644
--- a/tools/testing/selftests/vfio/vfio_pci_sriov_uapi_test.c
+++ b/tools/testing/selftests/vfio/vfio_pci_sriov_uapi_test.c
@@ -90,6 +90,8 @@ FIXTURE_VARIANT_ADD_ALL_IOMMU_MODES(null_uuid, NULL);
 
 FIXTURE_SETUP(vfio_pci_sriov_uapi_test)
 {
+	SKIP_IF_IOMMU_MODE_UNAVAILABLE(return, variant->iommu_mode);
+
 	self->iommu = iommu_init(variant->iommu_mode);
 
 	self->pf_token = UUID_1;
@@ -163,6 +165,8 @@ TEST(failed_second_open_does_not_clobber_token)
 	struct iommu *iommu;
 	int ret;
 
+	SKIP_IF_IOMMU_MODE_UNAVAILABLE(return, MODE_IOMMUFD);
+
 	iommu = iommu_init(MODE_IOMMUFD);
 
 	/* Create and bind PF using UUID_1 */
-- 
2.56.0.506.g506a7eabc5-goog

