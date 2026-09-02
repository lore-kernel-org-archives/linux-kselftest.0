Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3950738E8B4
	for <linux-kselftest@vger.kernel.org>; Wed,  2 Sep 2026 19:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788378449; cv=none; b=D9ob/cAwhxFynd+ivl107rpT7bx6N8joNihL3bD+r9v9zCeAzlAUM8qOTlixnlQmjY0i8S5nzMIIOEowmoZacTX0Zq1wzUfJ540c3jh4EClSvvEzGNqMwUL25SWyPB7f9leIVsNfV1QLHjEICUtLf91qWk7zWmL/V92qjKwGV0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788378449; c=relaxed/simple;
	bh=3roPg4ZfXvCu9H2QE9Rl5CyrdVkiobJpwL6O2Q76emc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eLT+uTHhDxig2tf/Sx9Es44hVVtIK07P8QfjkRwjYfzO6gkVzVHDeCDAicGwYFSCnb/3nb+Dq2RLm+0+KuPpGMJzHsMlM9e+QNAqvX0qzPyMmTvw/put0MdyZjm0uq8VSHeJ+7k4wYXspdehzEjYPPcKkSQsqnXlqkOSGTVuuRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=kzgj7zER; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="kzgj7zER"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-9390dd46b45so109435185a.0
        for <linux-kselftest@vger.kernel.org>; Wed, 02 Sep 2026 12:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1788378431; x=1788983231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jK2MmrU5PHerjBBjkrNgI0UI4L0yhiHtWM989h7yfSE=;
        b=kzgj7zERtqf4PrGUQ8jXHsNvw5nwm+Ny7PCMsaE/nnZPHxI5BknhQDDBQJuho1xy3d
         rGAqffBveNOCKfOJK4Dhuccyi3cLj5dkKBT96cDScJCR06JH5ipXE4qvAgiqEin/hYL6
         mfa1RCH8PxTB445EpGj8nQPPKKLAkCkkNU+bS+NdhyaW+5xBJePZpXNmYxT6xTzxnbVX
         PrRUV1InxeVPVIuAnJ+jP4/TjCwfb2bRktY955Q2cBkIXQapo6Y0iyMvFVMpgedfTyvr
         c0d1hgMd6PWvecNNwZpQq80zeILuB3rcjjh5qMKPzDGjdyQwSKGAvXl34Dt9gOO5qUVx
         q48A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378431; x=1788983231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jK2MmrU5PHerjBBjkrNgI0UI4L0yhiHtWM989h7yfSE=;
        b=jgHO6UsatjKph9g0C8T/c7c1SAiPJtNvt1ThhGKao2zVZjhy5cikxxTLi1RGZvgZ5j
         Vo5IP3qBMGMz5cChagKBBYT776uf7DT08evryzfRdDr9YAY+PDNBAAZrCdeQcIMd9CjU
         suGCmLObKTAuF8aK7CZ/pUSAYeiFbkdouHvRXggBfnleLkT4yIgG2vrnZVVf/+1JRGa9
         9UzcMrptBcnS13NN58rEvwc44PnPKxe8ZY+F3KpNp+ndufoFahj26xiKACfSA7JxFtHm
         YBJfkfbiDKOvnurgEhT9xRSqvR4U0Vhix8jw7iJL56U2W770GSxSNb9Cwgxxxiy5+dS/
         ZDBg==
X-Forwarded-Encrypted: i=1; AKwUvByXztDRFlAkB835g36EOmNVgrjv3ZLNBCl5LtWb5MqKk5mI08icKjeUtNXHqa+FT5baeG090iF4Z/Sv434tHIk=@vger.kernel.org
X-Gm-Message-State: AFuF++kvR4ThQXcECQk6GNdSohFMXYqX3gL/HqLsR0kkXPBlXoJb9SiA
	A3y2OmYiNcCt4FEpIsrP5a9muJMpLjWJHjRVEsAXzysRi+k9vaO4uKOYA6mxMZDlv1M=
X-Gm-Gg: AYBFou1zcK7AOnC2yzQKmzhXo6uFbIPZOtRao5k8N1KCO6Bytz/7PISWtYN4bCSImyy
	YfGjoWeMILdI4IKrJ4cvAX38pZzbBP2oaMXRuML+ObLSdufql8wzdwtyLvaXzax5pBHbK7+YR+3
	e+0v2HeladN6cYTH+jFd4jd8u6NXAkGbeSAQtBrJaqNVkOL7qm492xxbpSwiAv+s7mphr09NSSV
	lojFFyh0ICEoaIMe6VlkC8PdRG15GApSLPvghqhwlB91Nmfy+K6gAoKmY2m+BerHvUHohiYAf05
	AoTulx0WPVO6rtFchI5k93hie3qa9gyzQpU0/4YdsPUNQth4saZkJG8r4fSrKju1QtsM+GduQ/A
	9QJG94GdEN10J6twN23JL8h5kJNM7+dxZ7ffA9Va6cYBlJQ8QQwjjtn4I83ZaH7e40DD/RoSpfj
	gcEbTYyu7Zd0mUjHL8gqKXc8TxB8OzQAA9D+cbczawGlFnQ5jp3Mrmn+OaLqMTXqQMO/yeexeCx
	le40l+Sxi+9nF+tcJ7Vgwv6jwALW2Rw8AXSCFy0ewBjXMhT35TliKt68nYx
X-Received: by 2002:a05:620a:3192:b0:936:ea3d:9313 with SMTP id af79cd13be357-9396ef7c45bmr114112385a.20.1788378426620;
        Wed, 02 Sep 2026 12:47:06 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9395f18801asm299300585a.16.2026.09.02.12.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:47:06 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	pbonzini@redhat.com,
	seanjc@google.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ziy@nvidia.com,
	matthew.brost@intel.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	byungchul@sk.com,
	gourry@gourry.net,
	ying.huang@linux.alibaba.com,
	apopple@nvidia.com,
	shuah@kernel.org
Subject: [PATCH 4/5] selftests: KVM: guest_memfd: let the gmem_test() harness bind a node
Date: Wed,  2 Sep 2026 15:46:56 -0400
Message-ID: <20260902194657.79075-5-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902194657.79075-1-gourry@gourry.net>
References: <20260902194657.79075-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To test GUEST_MEMFD_FLAG_BIND_NODE - extend create_guest_memfd() to
accept a node.

Ignore the node argument if the BIND_NODE flag is not provided.

Signed-off-by: Gregory Price <gourry@gourry.net>
Assisted-by: Claude:claude-opus-5
---
 .../testing/selftests/kvm/guest_memfd_test.c  | 50 ++++++++++++++++---
 1 file changed, 42 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/kvm/guest_memfd_test.c b/tools/testing/selftests/kvm/guest_memfd_test.c
index 2233d871a38f4..1818e0fea5690 100644
--- a/tools/testing/selftests/kvm/guest_memfd_test.c
+++ b/tools/testing/selftests/kvm/guest_memfd_test.c
@@ -25,6 +25,31 @@
 
 static size_t page_size;
 
+static int __create_guest_memfd_node(struct kvm_vm *vm, u64 size, u64 flags,
+				     u32 node, u32 pad)
+{
+	struct kvm_create_guest_memfd guest_memfd = {
+		.size = size,
+		.flags = flags,
+		.node = node,
+		.pad = pad,
+	};
+
+	return __vm_ioctl(vm, KVM_CREATE_GUEST_MEMFD, &guest_memfd);
+}
+
+static int create_guest_memfd(struct kvm_vm *vm, u64 size, u64 flags, u32 node)
+{
+	int fd;
+
+	if (!(flags & GUEST_MEMFD_FLAG_BIND_NODE))
+		return vm_create_guest_memfd(vm, size, flags);
+
+	fd = __create_guest_memfd_node(vm, size, flags, node, 0);
+	TEST_ASSERT(fd >= 0, KVM_IOCTL_ERROR(KVM_CREATE_GUEST_MEMFD, fd));
+	return fd;
+}
+
 static void test_file_read_write(int fd, size_t total_size)
 {
 	char buf[64];
@@ -418,26 +443,35 @@ static void test_guest_memfd_flags(struct kvm_vm *vm)
 	}
 }
 
-#define ____gmem_test(__test, __vm, __flags, __gmem_size, args...)	\
-do {									\
-	int fd = vm_create_guest_memfd(__vm, __gmem_size, __flags);	\
-									\
-	test_##__test(args);						\
-	close(fd);							\
+#define ____gmem_test(__test, __vm, __flags, __gmem_size, __node, args...) \
+do {									   \
+	int fd = create_guest_memfd(__vm, __gmem_size, __flags, __node);   \
+									   \
+	test_##__test(args);						   \
+	close(fd);							   \
 } while (0)
 
 #define __gmem_test(__test, __vm, __flags, __gmem_size)			\
-	____gmem_test(__test, __vm, __flags, __gmem_size, fd, __gmem_size)
+	____gmem_test(__test, __vm, __flags, __gmem_size, 0, fd, __gmem_size)
 
 #define gmem_test(__test, __vm, __flags)				\
 	__gmem_test(__test, __vm, __flags, page_size * 4)
 
 #define __gmem_test_vm(__test, __vm, __flags, __gmem_size)		\
-	____gmem_test(__test, __vm, __flags, __gmem_size, __vm, fd, __gmem_size)
+	____gmem_test(__test, __vm, __flags, __gmem_size, 0,		\
+		      __vm, fd, __gmem_size)
 
 #define gmem_test_vm(__test, __vm, __flags)				\
 	__gmem_test_vm(__test, __vm, __flags, page_size * 4)
 
+#define __gmem_test_node(__test, __vm, __flags, __gmem_size, __node)	\
+	____gmem_test(__test, __vm,					\
+		      (__flags) | GUEST_MEMFD_FLAG_BIND_NODE,		\
+		      __gmem_size, __node, fd, __gmem_size, __node)
+
+#define gmem_test_node(__test, __vm, __flags, __node)			\
+	__gmem_test_node(__test, __vm, __flags, page_size * 4, __node)
+
 static void __test_guest_memfd(struct kvm_vm *vm, u64 flags)
 {
 	test_create_guest_memfd_multiple(vm);
-- 
2.53.0-Meta

