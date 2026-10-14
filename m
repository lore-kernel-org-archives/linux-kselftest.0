Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58884EC657
	for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 09:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791970678; cv=none; b=ZUXBx8wfA6EQMYcQ44TsB/g6wUd32ja3wjbcAszmp0iRGCVFfPN3kZ9uOFDMXy0aAN8QfyB48TLrSY9J6qB1pdqD+D2ZrTELHtl/MQzfm8UARXAnxxkum/83t4HCkCczE5pNiC0mNJbI4kEFCVFyuUsScwXcHsJERi6Q9oxi0aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791970678; c=relaxed/simple;
	bh=xTGeZGgzCxN2Dk6Qq3KIoHNngwt1vaSfrxKjhW9PC7M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G8QESbhWAvsFzcb/IgfFQWd37uZ/P8VRzGF8vwxwgr5qZUNjqyHp8bwy0ayyy27Y31FPuK8oGLXK5k5D47x8OXdJFruX2tMvG10U5ScUPZIQlrjYyZXU+/HXCYZj4FHA8BxEZFUEifUKPrM6gm5ULr7NeTI2eLSjge/2BJuzm4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JkoiPLd8; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JkoiPLd8"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48b0ef9c76eso205748f8f.0
        for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 02:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791970668; x=1792575468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YdecmZTfB9lfXaRQG8h4bWhgYgRYVcqnrt4h9FJW8IM=;
        b=JkoiPLd8qNa600dUreCCthL1qcXkLbNRtnulhUNdnJNyKtQZbDpIP/VODlxkVsbQdS
         yeyxviZuF5x0PKtRoOGLtEzBPFOqTM8T5W8Nl1fVqIkYZb0i+kMR0bqfYr+FR7AvJIMO
         q5nB68VbvnqZhNcGZeeuojKmIOnkg/9z052hGD0UumUQ+IgVvApqQi6nEfHI5u+pMDQc
         2gKTXCSy6epO8LoNgfUjF2jJw3VM9d33C6Bn03RHB9aorhzmiBFvAwSZN6ZwplGxcf2p
         1pLd7tOO7//eUqhyEkiCvy9FfABxPEjQ9/pBeXI5Imft9qZrhoYe6hkSCmrcwZsLad4V
         koQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791970668; x=1792575468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YdecmZTfB9lfXaRQG8h4bWhgYgRYVcqnrt4h9FJW8IM=;
        b=c1WsZKqAwoUN76zG8jIS22AIqeWtyKqcazaHVl0FoOb+4i5dpHjNbva8/ocThnXR9m
         0KB+dbpMh0OB5v0J62TC1EIMzUGsShayG14I/mXz5xCBl59ApvOlkSMr6XrBVzYk3eXr
         f9HMoM6/4IJLIt8G/RNjYwPFUzgEbRfmSqrlemfgKy/gd1ckZhVS8ipOujxmyU4oWszd
         mBvyCuX4FXh25jfPW7tAnsfvF9BOH9yVEICY7jzcF1rA8Us9UAoy6RhCLgdBGd/hAmLd
         gzbwFVFEqCMX35qNWLVN7k++B26nkzjr10c9El2ChWD3lr1uToVY6H0ACYi5aOUkv1q/
         UNJw==
X-Forwarded-Encrypted: i=1; AKwUvBzJMm25qxKdvq7Hvmy34OPNaIudhgjMUmVH7myHD6v1u941zLZvxkUPs/kaMXv18jm/6RCbgbvk6g5p4lCNnW4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNmsnhDaH8Q8vqscEoSsZFaVgyxxPg3ps5x6zDu8P7RX22aY+A
	OxfWlgchZQRuc17IRsoK4YNIa4t61gBNMLwyNMXxAICp7g3/Chei4xDc
X-Gm-Gg: AYBFou1ixrDlWg0WnyX8FQGRRANOrvT+zGo5v5OMFBi6Z8MwUTTUjwTPgc0Jz4ejKKz
	nLJsehi8EA2k+BcisnKZLrd6ki5zafCU8sIqUO1gbo4WN8+HJ5YTZ/Xs/uS2uPU3b/PVvBcIsvI
	ukaZs7cRNHnNew12Ah7ya7XV11eEpl8DaW3n0CPy8DDWZnsU50q2uYYJptOVEagtFk6pksJWJ+R
	7Tz9ziVy6wo2R60npFw02zC7hb3JrSCm5I8oKptfQWrgujETW1VYeQ5dP98ZEUHji47iwRUScQi
	W7Gh/U6P2mdJbqjK5vH6QopkjshMYwTVE3/ELYYfv1AbWBtjAOToBnPHAEG66SubF7zNxogrvL2
	lZgHqN9uDMZeRjo2H3RI29lBkhfuBXZubSqaqIPFg3OQEUfsi7uTdU1sA2GQTLNd1QH9ayjJY7T
	O4N7IjhikGYW+oNMtyXi5Q/QF+g69pUnjUHScrOI5J9fLOMpQx+2vqipOcYyTU6a60nar4nTMJZ
	0rmIGPD2UteyBYj3itPmrBE5CN5CWSD2QFt41zlN7/N9NSxPVEqJEEhrP1DvNA1x+BPVLIV5LnW
	VwCIxzTnnNdCNntQHvRUKIfwNDiztLTFkaOl
X-Received: by 2002:a05:6000:29c3:b0:486:f907:ebec with SMTP id ffacd0b85a97d-48dba9d487dmr20959102f8f.31.1791970667594;
        Wed, 14 Oct 2026 02:37:47 -0700 (PDT)
Received: from dev-dsk-fgriffo-1c-93421965.eu-west-1.amazon.com (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de3f7f8b8sm9365477f8f.35.2026.10.14.02.37.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2026 02:37:47 -0700 (PDT)
From: Fred Griffoul <griffoul@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: David Woodhouse <dwmw2@infradead.org>,
	Ackerley Tng <ackerleytng@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [RFC PATCH v2 09/11] iommufd/selftest: Add a mock memory provider
Date: Wed, 14 Oct 2026 09:37:31 +0000
Message-ID: <20261014093733.90312-10-griffoul@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261014093733.90312-1-griffoul@gmail.com>
References: <20261014093733.90312-1-griffoul@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fred Griffoul <fgriffo@amazon.co.uk>

The provider path of IOMMU_IOAS_MAP_FILE needs a provider to test
against.

Add a mock provider whose pages can be made holes, read only, MMIO or
another shared frame, with a revoke after each change. It can also
back the file with one contiguous allocation and report large blocks.
Test that holes stay unmapped and that a revoke changes only its
range, also inside a large IOMMU page. Also test that new domains see
the current state, and that provider pages and dirty tracking domains
cannot share an IOAS.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Fred Griffoul <fgriffo@amazon.co.uk>
---
 drivers/iommu/iommufd/iommufd_test.h          |  24 ++
 drivers/iommu/iommufd/selftest.c              | 216 ++++++++++++++++++
 tools/testing/selftests/iommu/iommufd.c       | 185 +++++++++++++++
 tools/testing/selftests/iommu/iommufd_utils.h |  69 ++++++
 4 files changed, 494 insertions(+)

diff --git a/drivers/iommu/iommufd/iommufd_test.h b/drivers/iommu/iommufd/iommufd_test.h
index 28fd9c43edc4..3a94429cd3af 100644
--- a/drivers/iommu/iommufd/iommufd_test.h
+++ b/drivers/iommu/iommufd/iommufd_test.h
@@ -33,8 +33,22 @@ enum {
 	IOMMU_TEST_OP_DMABUF_REVOKE,
 	IOMMU_TEST_OP_MD_CHECK_MAPPED,
 	IOMMU_TEST_OP_MD_IOVA_TO_PHYS,
+	IOMMU_TEST_OP_PROVIDER_GET,
+	IOMMU_TEST_OP_PROVIDER_SET,
 };
 
+/* Page states of the mock memory provider, IOMMU_TEST_OP_PROVIDER_SET */
+enum {
+	MOCK_PROVIDER_BACKED = 0,
+	MOCK_PROVIDER_HOLE,
+	MOCK_PROVIDER_READONLY,
+	MOCK_PROVIDER_OTHER,
+	MOCK_PROVIDER_MMIO,
+};
+
+/* IOMMU_TEST_OP_PROVIDER_GET: back the file with one contiguous allocation */
+#define MOCK_PROVIDER_FLAG_CONTIG	(1 << 0)
+
 enum {
 	MOCK_IOMMUPT_DEFAULT = 0,
 	MOCK_IOMMUPT_HUGE,
@@ -209,6 +223,16 @@ struct iommu_test_cmd {
 			__aligned_u64 iova;
 			__aligned_u64 out_phys;	/* 0 if unmapped */
 		} iova_to_phys;
+		struct {
+			__u32 length;
+			__u32 flags;
+		} provider_get;
+		struct {
+			__s32 fd;
+			__u32 state;
+			__aligned_u64 offset;
+			__aligned_u64 length;
+		} provider_set;
 	};
 	__u32 last;
 };
diff --git a/drivers/iommu/iommufd/selftest.c b/drivers/iommu/iommufd/selftest.c
index 1f5cd2d00fda..242fa53cb6cf 100644
--- a/drivers/iommu/iommufd/selftest.c
+++ b/drivers/iommu/iommufd/selftest.c
@@ -10,6 +10,7 @@
 #include <linux/fault-inject.h>
 #include <linux/file.h>
 #include <linux/iommu.h>
+#include <linux/mem_provider.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/xarray.h>
@@ -2132,6 +2133,212 @@ static int iommufd_test_md_check_mapped(struct iommufd_ucmd *ucmd,
 	return rc;
 }
 
+/*
+ * A mock memory provider.  Each page of the file is backed by its own page of
+ * RAM, or is a hole, read only, the one page that every page in the OTHER
+ * state shares, or reported as MMIO.  With MOCK_PROVIDER_FLAG_CONTIG, the
+ * pages come from one aligned allocation, and aligned blocks of BACKED or
+ * READONLY pages are reported as large blocks.
+ * IOMMU_TEST_OP_PROVIDER_SET changes the state of a range and revokes it.
+ */
+struct iommufd_test_provider {
+	struct mem_provider_file mpf;
+	size_t npages;
+	struct page **pages;
+	struct page *contig;	/* with MOCK_PROVIDER_FLAG_CONTIG */
+	unsigned int order;
+	struct page *other;
+	u8 *state;
+};
+
+static void iommufd_test_provider_free(struct iommufd_test_provider *tp)
+{
+	size_t i;
+
+	if (tp->contig)
+		__free_pages(tp->contig, tp->order);
+	else if (tp->pages)
+		for (i = 0; i != tp->npages; i++)
+			if (tp->pages[i])
+				__free_page(tp->pages[i]);
+	if (tp->other)
+		__free_page(tp->other);
+	kfree(tp->state);
+	kfree(tp->pages);
+	kfree(tp);
+}
+
+static int iommufd_test_provider_release(struct inode *inode,
+					 struct file *file)
+{
+	iommufd_test_provider_free(file->private_data);
+	return 0;
+}
+
+static struct mem_provider_file *
+iommufd_test_provider_attach(struct file *file, loff_t size)
+{
+	struct iommufd_test_provider *tp = file->private_data;
+
+	if (size > (loff_t)tp->npages * PAGE_SIZE)
+		return ERR_PTR(-EINVAL);
+	return &tp->mpf;
+}
+
+static void iommufd_test_provider_detach(struct mem_provider_file *mpf)
+{
+}
+
+static int iommufd_test_provider_get_page(struct mem_provider_file *mpf,
+					  pgoff_t index, unsigned long *pfn,
+					  int *max_order, u32 *attrs)
+{
+	struct iommufd_test_provider *tp =
+		container_of(mpf, struct iommufd_test_provider, mpf);
+	u8 state = READ_ONCE(tp->state[index]);
+	int order = 0;
+
+	/* The largest aligned block around @index whose pages share a state */
+	if (tp->contig && (state == MOCK_PROVIDER_BACKED ||
+			   state == MOCK_PROVIDER_READONLY)) {
+		while (order < min_t(int, *max_order, tp->order)) {
+			size_t first = ALIGN_DOWN(index, 2UL << order);
+			size_t i;
+
+			if (first + (2UL << order) > tp->npages)
+				break;
+			for (i = first; i != first + (2UL << order); i++)
+				if (READ_ONCE(tp->state[i]) != state)
+					break;
+			if (i != first + (2UL << order))
+				break;
+			order++;
+		}
+	}
+	*max_order = order;
+	switch (state) {
+	case MOCK_PROVIDER_HOLE:
+		return -EFAULT;
+	case MOCK_PROVIDER_READONLY:
+		*attrs = MEM_PROVIDER_ATTR_READONLY;
+		break;
+	case MOCK_PROVIDER_OTHER:
+		*pfn = page_to_pfn(tp->other);
+		return 0;
+	case MOCK_PROVIDER_MMIO:
+		*attrs = MEM_PROVIDER_TYPE_MMIO;
+		break;
+	}
+	*pfn = page_to_pfn(tp->pages[index]);
+	return 0;
+}
+
+static const struct mem_provider_ops iommufd_test_provider_ops = {
+	.attach = iommufd_test_provider_attach,
+	.detach = iommufd_test_provider_detach,
+	.get_page = iommufd_test_provider_get_page,
+};
+
+static const struct mem_provider_fops iommufd_test_provider_fops = {
+	.fops = {
+		.owner = THIS_MODULE,
+		.fop_flags = FOP_MEM_PROVIDER,
+		.release = iommufd_test_provider_release,
+	},
+	.ops = &iommufd_test_provider_ops,
+};
+
+static int iommufd_test_provider_get(struct iommufd_ucmd *ucmd, size_t len,
+				     u32 flags)
+{
+	struct iommufd_test_provider *tp;
+	struct file *file;
+	size_t i;
+	int fd, rc;
+
+	len = ALIGN(len, PAGE_SIZE);
+	if (len == 0 || len > PAGE_SIZE * 512 ||
+	    (flags & ~MOCK_PROVIDER_FLAG_CONTIG))
+		return -EINVAL;
+
+	tp = kzalloc_obj(*tp);
+	if (!tp)
+		return -ENOMEM;
+	mem_provider_file_init(&tp->mpf);
+	tp->npages = len / PAGE_SIZE;
+	tp->pages = kcalloc(tp->npages, sizeof(*tp->pages), GFP_KERNEL);
+	tp->state = kcalloc(tp->npages, sizeof(*tp->state), GFP_KERNEL);
+	tp->other = alloc_page(GFP_KERNEL | __GFP_ZERO);
+	if (!tp->pages || !tp->state || !tp->other) {
+		rc = -ENOMEM;
+		goto err_free;
+	}
+	if (flags & MOCK_PROVIDER_FLAG_CONTIG) {
+		tp->order = get_order(len);
+		tp->contig = alloc_pages(GFP_KERNEL | __GFP_ZERO, tp->order);
+		if (!tp->contig) {
+			rc = -ENOMEM;
+			goto err_free;
+		}
+		for (i = 0; i != tp->npages; i++)
+			tp->pages[i] = tp->contig + i;
+	}
+	for (i = 0; !tp->contig && i != tp->npages; i++) {
+		tp->pages[i] = alloc_page(GFP_KERNEL | __GFP_ZERO);
+		if (!tp->pages[i]) {
+			rc = -ENOMEM;
+			goto err_free;
+		}
+	}
+
+	fd = get_unused_fd_flags(O_CLOEXEC);
+	if (fd < 0) {
+		rc = fd;
+		goto err_free;
+	}
+	file = anon_inode_getfile("[iommufd-test-provider]",
+				  &iommufd_test_provider_fops.fops, tp, O_RDWR);
+	if (IS_ERR(file)) {
+		put_unused_fd(fd);
+		rc = PTR_ERR(file);
+		goto err_free;
+	}
+	fd_install(fd, file);
+	return fd;
+
+err_free:
+	iommufd_test_provider_free(tp);
+	return rc;
+}
+
+static int iommufd_test_provider_set(struct iommufd_ucmd *ucmd, int fd,
+				     unsigned int state, u64 offset, u64 length)
+{
+	struct iommufd_test_provider *tp;
+	u64 end;
+	size_t i;
+
+	if (state > MOCK_PROVIDER_MMIO)
+		return -EINVAL;
+
+	CLASS(fd, f)(fd);
+	if (fd_empty(f))
+		return -EBADF;
+	if (fd_file(f)->f_op != &iommufd_test_provider_fops.fops)
+		return -EINVAL;
+	tp = fd_file(f)->private_data;
+
+	if (!length || check_add_overflow(offset, length, &end) ||
+	    !PAGE_ALIGNED(offset) || !PAGE_ALIGNED(length) ||
+	    end > (u64)tp->npages * PAGE_SIZE)
+		return -EINVAL;
+
+	for (i = offset / PAGE_SIZE; i != end / PAGE_SIZE; i++)
+		WRITE_ONCE(tp->state[i], state);
+	mem_provider_revoke(&tp->mpf, offset, length);
+	return 0;
+}
+
 static int iommufd_test_dmabuf_revoke(struct iommufd_ucmd *ucmd, int fd,
 				      bool revoked)
 {
@@ -2252,6 +2459,15 @@ int iommufd_test(struct iommufd_ucmd *ucmd)
 	case IOMMU_TEST_OP_MD_IOVA_TO_PHYS:
 		return iommufd_test_md_iova_to_phys(ucmd, cmd->id,
 						    cmd->iova_to_phys.iova);
+	case IOMMU_TEST_OP_PROVIDER_GET:
+		return iommufd_test_provider_get(ucmd,
+						 cmd->provider_get.length,
+						 cmd->provider_get.flags);
+	case IOMMU_TEST_OP_PROVIDER_SET:
+		return iommufd_test_provider_set(ucmd, cmd->provider_set.fd,
+						 cmd->provider_set.state,
+						 cmd->provider_set.offset,
+						 cmd->provider_set.length);
 	default:
 		return -EOPNOTSUPP;
 	}
diff --git a/tools/testing/selftests/iommu/iommufd.c b/tools/testing/selftests/iommu/iommufd.c
index d44b34b05757..c9248e10349e 100644
--- a/tools/testing/selftests/iommu/iommufd.c
+++ b/tools/testing/selftests/iommu/iommufd.c
@@ -1627,6 +1627,191 @@ TEST_F(iommufd_ioas, dmabuf_revoke)
 	close(dfd);
 }
 
+TEST_F(iommufd_ioas, provider_simple)
+{
+	size_t buf_size = PAGE_SIZE * 4;
+	__u64 iova;
+	int pfd;
+
+	test_cmd_get_provider(buf_size, &pfd);
+	test_err_ioctl_ioas_map_file(EINVAL, pfd, 0, 0, &iova);
+	test_err_ioctl_ioas_map_file(EINVAL, pfd, 0, buf_size + PAGE_SIZE,
+				     &iova);
+	test_err_ioctl_ioas_map_file(EINVAL, pfd, 1, PAGE_SIZE, &iova);
+	test_ioctl_ioas_map_file(pfd, 0, buf_size, &iova);
+	if (variant->mock_domains)
+		test_cmd_md_check_mapped(self->hwpt_id, iova, buf_size, true);
+
+	/* The mapping keeps the provider file alive */
+	close(pfd);
+	if (variant->mock_domains)
+		test_cmd_md_check_mapped(self->hwpt_id, iova, buf_size, true);
+	test_ioctl_ioas_unmap(iova, buf_size);
+}
+
+TEST_F(iommufd_ioas, provider_revoke)
+{
+	size_t buf_size = PAGE_SIZE * 8;
+	__u64 phys0, phys1;
+	__u32 hwpt_id;
+	__u64 iova;
+	int pfd;
+
+	if (!variant->mock_domains)
+		SKIP(return, "Needs a mock domain");
+
+	test_cmd_get_provider(buf_size, &pfd);
+
+	/* A page that is a hole when the file is mapped stays unmapped */
+	test_cmd_provider_set(pfd, MOCK_PROVIDER_HOLE, PAGE_SIZE, PAGE_SIZE);
+	test_ioctl_ioas_map_file(pfd, 0, buf_size, &iova);
+	test_cmd_md_check_mapped(self->hwpt_id, iova, PAGE_SIZE, true);
+	test_cmd_md_check_mapped(self->hwpt_id, iova + PAGE_SIZE, PAGE_SIZE,
+				 false);
+	test_cmd_md_check_mapped(self->hwpt_id, iova + 2 * PAGE_SIZE,
+				 buf_size - 2 * PAGE_SIZE, true);
+
+	/* Give the page back */
+	test_cmd_provider_set(pfd, MOCK_PROVIDER_BACKED, PAGE_SIZE, PAGE_SIZE);
+	test_cmd_md_check_mapped(self->hwpt_id, iova, buf_size, true);
+
+	/* Take back the middle, and only the middle goes */
+	test_cmd_provider_set(pfd, MOCK_PROVIDER_HOLE, 2 * PAGE_SIZE,
+			      4 * PAGE_SIZE);
+	test_cmd_md_check_mapped(self->hwpt_id, iova, 2 * PAGE_SIZE, true);
+	test_cmd_md_check_mapped(self->hwpt_id, iova + 2 * PAGE_SIZE,
+				 4 * PAGE_SIZE, false);
+	test_cmd_md_check_mapped(self->hwpt_id, iova + 6 * PAGE_SIZE,
+				 2 * PAGE_SIZE, true);
+
+	/* A domain added now sees the same holes */
+	test_cmd_hwpt_alloc(self->device_id, self->ioas_id, 0, &hwpt_id);
+	test_cmd_md_check_mapped(hwpt_id, iova, 2 * PAGE_SIZE, true);
+	test_cmd_md_check_mapped(hwpt_id, iova + 2 * PAGE_SIZE, 4 * PAGE_SIZE,
+				 false);
+	test_cmd_md_check_mapped(hwpt_id, iova + 6 * PAGE_SIZE, 2 * PAGE_SIZE,
+				 true);
+	test_ioctl_destroy(hwpt_id);
+
+	/* Put the same other frame behind two pages */
+	phys0 = test_cmd_md_iova_to_phys(self->hwpt_id, iova);
+	test_cmd_provider_set(pfd, MOCK_PROVIDER_OTHER, 0, 2 * PAGE_SIZE);
+	phys1 = test_cmd_md_iova_to_phys(self->hwpt_id, iova);
+	ASSERT_NE(0, phys1);
+	ASSERT_NE(phys0, phys1);
+	ASSERT_EQ(phys1,
+		  test_cmd_md_iova_to_phys(self->hwpt_id, iova + PAGE_SIZE));
+
+	/* Read-only and MMIO pages stay mapped */
+	test_cmd_provider_set(pfd, MOCK_PROVIDER_READONLY, 0, buf_size / 2);
+	test_cmd_provider_set(pfd, MOCK_PROVIDER_MMIO, buf_size / 2,
+			      buf_size / 2);
+	test_cmd_md_check_mapped(self->hwpt_id, iova, buf_size, true);
+
+	/* A change past the end of the file is refused */
+	EXPECT_ERRNO(EINVAL, _test_cmd_provider_set(self->fd, pfd,
+						    MOCK_PROVIDER_HOLE,
+						    buf_size, PAGE_SIZE));
+
+	test_ioctl_ioas_unmap(iova, buf_size);
+	close(pfd);
+}
+
+/* Each page of [iova, iova + length) maps linearly from phys */
+static bool provider_linear(int fd, __u32 hwpt_id, __u64 iova, __u64 phys,
+			    size_t length)
+{
+	size_t i;
+
+	for (i = 0; i < length; i += PAGE_SIZE)
+		if (_test_cmd_md_iova_to_phys(fd, hwpt_id, iova + i) != phys + i)
+			return false;
+	return true;
+}
+
+TEST_F(iommufd_ioas, provider_large)
+{
+	size_t buf_size = PAGE_SIZE * 512;
+	__u64 iova = MOCK_APERTURE_START;
+	__u32 hwpt_ids[2];
+	__u64 phys;
+	int pfd, i;
+
+	if (!variant->mock_domains)
+		SKIP(return, "Needs a mock domain");
+
+	/* Large blocks, mapped into a default and a huge-page domain */
+	test_cmd_get_provider_contig(buf_size, &pfd);
+	test_ioctl_ioas_map_fixed_file(pfd, 0, buf_size, iova);
+	hwpt_ids[0] = self->hwpt_id;
+	test_cmd_hwpt_alloc_iommupt(self->device_id, self->ioas_id, 0,
+				    MOCK_IOMMUPT_HUGE, &hwpt_ids[1]);
+	phys = test_cmd_md_iova_to_phys(self->hwpt_id, iova);
+	ASSERT_NE(0, phys);
+
+	for (i = 0; i != 2; i++) {
+		ASSERT_TRUE(provider_linear(self->fd, hwpt_ids[i], iova, phys,
+					    buf_size));
+	}
+
+	/* A page taken back from the middle of a block goes alone */
+	test_cmd_provider_set(pfd, MOCK_PROVIDER_HOLE, 100 * PAGE_SIZE,
+			      PAGE_SIZE);
+	for (i = 0; i != 2; i++) {
+		ASSERT_TRUE(provider_linear(self->fd, hwpt_ids[i], iova, phys,
+					    100 * PAGE_SIZE));
+		test_cmd_md_check_mapped(hwpt_ids[i], iova + 100 * PAGE_SIZE,
+					 PAGE_SIZE, false);
+		ASSERT_TRUE(provider_linear(self->fd, hwpt_ids[i],
+					    iova + 101 * PAGE_SIZE,
+					    phys + 101 * PAGE_SIZE,
+					    buf_size - 101 * PAGE_SIZE));
+	}
+
+	/* Given back, and a change across block boundaries */
+	test_cmd_provider_set(pfd, MOCK_PROVIDER_BACKED, 100 * PAGE_SIZE,
+			      PAGE_SIZE);
+	test_cmd_provider_set(pfd, MOCK_PROVIDER_READONLY, 200 * PAGE_SIZE,
+			      300 * PAGE_SIZE);
+	for (i = 0; i != 2; i++) {
+		ASSERT_TRUE(provider_linear(self->fd, hwpt_ids[i], iova, phys,
+					    buf_size));
+	}
+
+	test_ioctl_destroy(hwpt_ids[1]);
+	test_ioctl_ioas_unmap(iova, buf_size);
+	close(pfd);
+}
+
+TEST_F(iommufd_ioas, provider_dirty_tracking)
+{
+	size_t buf_size = PAGE_SIZE * 4;
+	__u32 hwpt_id;
+	__u64 iova;
+	int pfd;
+
+	if (!variant->mock_domains)
+		SKIP(return, "Needs a mock domain");
+
+	test_cmd_get_provider(buf_size, &pfd);
+
+	/* No dirty tracking domain over provider pages ... */
+	test_ioctl_ioas_map_file(pfd, 0, buf_size, &iova);
+	test_err_hwpt_alloc(EOPNOTSUPP, self->device_id, self->ioas_id,
+			    IOMMU_HWPT_ALLOC_DIRTY_TRACKING, &hwpt_id);
+	test_ioctl_ioas_unmap(iova, buf_size);
+
+	/* ... and no provider pages under a dirty tracking domain. */
+	test_cmd_hwpt_alloc(self->device_id, self->ioas_id,
+			    IOMMU_HWPT_ALLOC_DIRTY_TRACKING, &hwpt_id);
+	test_err_ioctl_ioas_map_file(EOPNOTSUPP, pfd, 0, buf_size, &iova);
+	test_ioctl_destroy(hwpt_id);
+
+	test_ioctl_ioas_map_file(pfd, 0, buf_size, &iova);
+	test_ioctl_ioas_unmap(iova, buf_size);
+	close(pfd);
+}
+
 FIXTURE(iommufd_mock_domain)
 {
 	int fd;
diff --git a/tools/testing/selftests/iommu/iommufd_utils.h b/tools/testing/selftests/iommu/iommufd_utils.h
index b4928cbd4d9c..e89b9d64a005 100644
--- a/tools/testing/selftests/iommu/iommufd_utils.h
+++ b/tools/testing/selftests/iommu/iommufd_utils.h
@@ -593,6 +593,75 @@ static int _test_cmd_revoke_dmabuf(int fd, int dmabuf_fd, bool revoked)
 #define test_cmd_revoke_dmabuf(dmabuf_fd, revoke) \
 	ASSERT_EQ(0, _test_cmd_revoke_dmabuf(self->fd, dmabuf_fd, revoke))
 
+static int _test_cmd_get_provider(int fd, size_t len, __u32 flags,
+				  int *out_fd)
+{
+	struct iommu_test_cmd cmd = {
+		.size = sizeof(cmd),
+		.op = IOMMU_TEST_OP_PROVIDER_GET,
+		.provider_get = { .length = len, .flags = flags },
+	};
+
+	*out_fd = ioctl(fd, IOMMU_TEST_CMD, &cmd);
+	if (*out_fd < 0)
+		return -1;
+	return 0;
+}
+#define test_cmd_get_provider(len, out_fd) \
+	ASSERT_EQ(0, _test_cmd_get_provider(self->fd, len, 0, out_fd))
+#define test_cmd_get_provider_contig(len, out_fd)                     \
+	ASSERT_EQ(0, _test_cmd_get_provider(self->fd, len,             \
+					    MOCK_PROVIDER_FLAG_CONTIG, \
+					    out_fd))
+
+static int _test_cmd_provider_set(int fd, int pfd, unsigned int state,
+				  __u64 offset, __u64 length)
+{
+	struct iommu_test_cmd cmd = {
+		.size = sizeof(cmd),
+		.op = IOMMU_TEST_OP_PROVIDER_SET,
+		.provider_set = { .fd = pfd, .state = state,
+				  .offset = offset, .length = length },
+	};
+
+	return ioctl(fd, IOMMU_TEST_CMD, &cmd);
+}
+#define test_cmd_provider_set(pfd, state, offset, length) \
+	ASSERT_EQ(0, _test_cmd_provider_set(self->fd, pfd, state, offset, length))
+
+static int _test_cmd_md_check_mapped(int fd, __u32 hwpt_id, __u64 iova,
+				     __u64 length, bool mapped)
+{
+	struct iommu_test_cmd cmd = {
+		.size = sizeof(cmd),
+		.op = IOMMU_TEST_OP_MD_CHECK_MAPPED,
+		.id = hwpt_id,
+		.check_mapped = { .mapped = mapped, .iova = iova,
+				  .length = length },
+	};
+
+	return ioctl(fd, IOMMU_TEST_CMD, &cmd);
+}
+#define test_cmd_md_check_mapped(hwpt_id, iova, length, mapped)		\
+	ASSERT_EQ(0, _test_cmd_md_check_mapped(self->fd, hwpt_id, iova,	\
+					       length, mapped))
+
+static __u64 _test_cmd_md_iova_to_phys(int fd, __u32 hwpt_id, __u64 iova)
+{
+	struct iommu_test_cmd cmd = {
+		.size = sizeof(cmd),
+		.op = IOMMU_TEST_OP_MD_IOVA_TO_PHYS,
+		.id = hwpt_id,
+		.iova_to_phys = { .iova = iova },
+	};
+
+	if (ioctl(fd, IOMMU_TEST_CMD, &cmd))
+		return -1;
+	return cmd.iova_to_phys.out_phys;
+}
+#define test_cmd_md_iova_to_phys(hwpt_id, iova) \
+	_test_cmd_md_iova_to_phys(self->fd, hwpt_id, iova)
+
 static int _test_ioctl_destroy(int fd, unsigned int id)
 {
 	struct iommu_destroy cmd = {
-- 
2.47.3

