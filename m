Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41D3392822
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Feb 2026 22:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770071455; cv=none; b=RD1eMd9DIULDQX1jJBptGkY285v4xfJD4DBZmC1YWf+vLGYuIk89kMG0D9qaRCifdalHQhTDJlna8qK6xn1GHxsaGaFsS8WdyNCOCg1lWyhox4VIK6hwt0GoqeHCauYWU+x3//3pIUZzMd+21O30x+PqPy6W9tDAcx9HLfAKAQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770071455; c=relaxed/simple;
	bh=tKnfv3s66pmHbHBt2JoBmVjEyQjy9h/syZzNjta55rg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NszpicgnINb5GwivdmNdI+2jVtleTlr7dQd/d+2B21jkocarX3iWNqy3JVa6RcvEX1tO38SUcl6yeOKsvlPgqm6om8LWGtUUxCnMHMhwodoYqRBCS8eNjlkdlbZPs6ZZpkLaIKROldxwwN36oZfeBH5pUfrwCk1UrkBuKF1ugSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=As+wiYi0; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="As+wiYi0"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3545dbb7f14so1865849a91.0
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Feb 2026 14:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770071453; x=1770676253; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ktrtq40nvCRDa41diPG9B2Yq99qJ/XnO5AhCMBeAVVY=;
        b=As+wiYi0oJKzTelH1/pLev1Snnb201F4yWAa5GCJB/ZU5ELV6XKW7Hj7tRbnpj0SnZ
         2r5yfVRzzJgRU9dZzs4QfPqn29uUzp6myi+BsBobovKktSwLI09xy86lFlzHfCBEu+VG
         478VciOVvv4ElkDWJxa3BiuwnRWJArrYEGX81iI1+me0p4+qkGEppClTcsDj7SMuZ5H5
         iq8TD0ujIO6QgcwASfQsCqdYlewA0LM/yj7BuaaG3SZi9Ofxk1duMa6/9JtXGAiqbjwQ
         G7TFx38RFN9RkrMzO5LTxut60MQzE+OemPfQElRYmTms6rFeMxqP5P/zCDzI1yYfJ5L9
         rpZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770071453; x=1770676253;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ktrtq40nvCRDa41diPG9B2Yq99qJ/XnO5AhCMBeAVVY=;
        b=Y112oXqk7bDXkGw07PBPl7y/qSQllCN5d/tGuK9jbOJoPICDJrtCYxheVirlhiXF2e
         dZrsh4WdPhh8hY7k5CLEzGqsFm2BsVsPljOA46Lh+UrMZm+L62Z+nRQUvpOU+Ktg5uSP
         qsBJTvcXOoC1iq4wobFqEUkiSudT87zW89N2D48OnV4CoW0ziFovTix13iNdjTfNqlKP
         D009sIU3ZXlgm2mg1mo5NCRwP7f1JVWzUJqvkIw4imcx1tIdH+I4b2ySJRt+YOpWLaM4
         DgUXMbjQ8tR80TJATCuo62TctOjvJwJTgi/PfaePk46FhWl6GUCjgP4ghS+DQ2n40t/X
         YwuA==
X-Forwarded-Encrypted: i=1; AJvYcCWirh0R2ez5ARHmCAuf6MH18pXxanXKrv3uigZfdGqcB8TNSCOSLWb42F6visFhL5lw4HyI70EagBU8l1uSDGk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsgHwgCYFXZ41AjZ2k/OaBhnCKPqslEWmfRqoaAAlwZffHWHkn
	npC1DIzcPc7cibCDGHvmkJrydZimXuwfzX7Uhpe3eyZV41d7CZ0a7aQDMRIa3CNXuk6j7+VtGT0
	wNMNnBJee8MoXpL1A6BOxZ3HVfQ==
X-Received: from pjbsu16.prod.google.com ([2002:a17:90b:5350:b0:354:565c:69ac])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:5907:b0:33b:ba50:fccc with SMTP id 98e67ed59e1d1-3543b3ac8d8mr11951779a91.18.1770071453435;
 Mon, 02 Feb 2026 14:30:53 -0800 (PST)
Date: Mon,  2 Feb 2026 14:29:57 -0800
In-Reply-To: <cover.1770071243.git.ackerleytng@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1770071243.git.ackerleytng@google.com>
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
Message-ID: <07219f81b10de2c2a3f1833ff0e28b9fd67599af.1770071243.git.ackerleytng@google.com>
Subject: [RFC PATCH v2 19/37] KVM: selftests: Test using guest_memfd for guest
 private memory
From: Ackerley Tng <ackerleytng@google.com>
To: kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, x86@kernel.org
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	bp@alien8.de, brauner@kernel.org, chao.p.peng@intel.com, 
	chao.p.peng@linux.intel.com, chenhuacai@kernel.org, corbet@lwn.net, 
	dave.hansen@linux.intel.com, david@kernel.org, hpa@zytor.com, 
	ira.weiny@intel.com, jgg@nvidia.com, jmattson@google.com, jroedel@suse.de, 
	jthoughton@google.com, maobibo@loongson.cn, mathieu.desnoyers@efficios.com, 
	maz@kernel.org, mhiramat@kernel.org, michael.roth@amd.com, mingo@redhat.com, 
	mlevitsk@redhat.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	pbonzini@redhat.com, prsampat@amd.com, qperret@google.com, 
	ricarkol@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	rostedt@goodmis.org, seanjc@google.com, shivankg@amd.com, shuah@kernel.org, 
	steven.price@arm.com, tabba@google.com, tglx@linutronix.de, 
	vannapurve@google.com, vbabka@suse.cz, willy@infradead.org, wyihan@google.com, 
	yan.y.zhao@intel.com, Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="UTF-8"

Add a selftest to verify that a memory region backed by a guest_memfd
can be used as private guest memory. This is a key use case for
confidential computing guests where the host should not have access to the
guest's memory contents.

The new test, test_guest_private_mem, creates a protected VM, maps a
guest_memfd into the guest's address space, and then marks the region as
private. The guest code then writes to and reads from this private memory
region to verify it is accessible.

To better distinguish between the test cases, rename the existing test
that verifies shared host/guest access from test_guest_memfd_guest to
test_guest_shared_mem.

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 .../testing/selftests/kvm/guest_memfd_test.c  | 57 +++++++++++++++++--
 1 file changed, 53 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/kvm/guest_memfd_test.c b/tools/testing/selftests/kvm/guest_memfd_test.c
index 618c937f3c90..ecb0cbcacbec 100644
--- a/tools/testing/selftests/kvm/guest_memfd_test.c
+++ b/tools/testing/selftests/kvm/guest_memfd_test.c
@@ -406,7 +406,7 @@ static void test_guest_memfd(unsigned long vm_type)
 	kvm_vm_free(vm);
 }
 
-static void guest_code(uint8_t *mem, uint64_t size)
+static void guest_code_test_guest_shared_mem(uint8_t *mem, uint64_t size)
 {
 	size_t i;
 
@@ -418,7 +418,7 @@ static void guest_code(uint8_t *mem, uint64_t size)
 	GUEST_DONE();
 }
 
-static void test_guest_memfd_guest(void)
+static void test_guest_shared_mem(void)
 {
 	/*
 	 * Skip the first 4gb and slot0.  slot0 maps <1gb and is used to back
@@ -437,7 +437,8 @@ static void test_guest_memfd_guest(void)
 	if (!kvm_check_cap(KVM_CAP_GUEST_MEMFD_FLAGS))
 		return;
 
-	vm = __vm_create_shape_with_one_vcpu(VM_SHAPE_DEFAULT, &vcpu, 1, guest_code);
+	vm = __vm_create_shape_with_one_vcpu(VM_SHAPE_DEFAULT, &vcpu, 1,
+					     guest_code_test_guest_shared_mem);
 
 	TEST_ASSERT(vm_check_cap(vm, KVM_CAP_GUEST_MEMFD_FLAGS) & GUEST_MEMFD_FLAG_MMAP,
 		    "Default VM type should support MMAP, supported flags = 0x%x",
@@ -469,6 +470,53 @@ static void test_guest_memfd_guest(void)
 	kvm_vm_free(vm);
 }
 
+static void guest_code_test_guest_private_mem(uint8_t *mem)
+{
+	WRITE_ONCE(mem[0], 0xff);
+	GUEST_ASSERT_EQ(READ_ONCE(mem[0]), 0xff);
+
+	GUEST_DONE();
+}
+
+static void test_guest_private_mem(void)
+{
+	const struct vm_shape shape = {
+		.mode = VM_MODE_DEFAULT,
+		.type = KVM_X86_SW_PROTECTED_VM,
+	};
+	/*
+	 * Skip the first 4gb and slot0.  slot0 maps <1gb and is used to back
+	 * the guest's code, stack, and page tables, and low memory contains
+	 * the PCI hole and other MMIO regions that need to be avoided.
+	 */
+	const uint64_t gpa = SZ_4G;
+	const int slot = 1;
+
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+	size_t npages;
+	int fd;
+
+	npages = page_size / getpagesize();
+	vm = __vm_create_shape_with_one_vcpu(shape, &vcpu, npages,
+					     guest_code_test_guest_private_mem);
+
+	fd = vm_create_guest_memfd(vm, page_size, 0);
+	vm_mem_add(vm, VM_MEM_SRC_SHMEM, gpa, slot, npages, KVM_MEM_GUEST_MEMFD,
+		   fd, 0, 0);
+
+	virt_map(vm, gpa, gpa, npages);
+	vm_mem_set_private(vm, gpa, page_size);
+
+	vcpu_args_set(vcpu, 1, gpa);
+	vcpu_run(vcpu);
+
+	TEST_ASSERT_EQ(get_ucall(vcpu, NULL), UCALL_DONE);
+
+	close(fd);
+	kvm_vm_free(vm);
+}
+
 int main(int argc, char *argv[])
 {
 	unsigned long vm_types, vm_type;
@@ -488,5 +536,6 @@ int main(int argc, char *argv[])
 	for_each_set_bit(vm_type, &vm_types, BITS_PER_TYPE(vm_types))
 		test_guest_memfd(vm_type);
 
-	test_guest_memfd_guest();
+	test_guest_shared_mem();
+	test_guest_private_mem();
 }
-- 
2.53.0.rc1.225.gd81095ad13-goog

