Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DA6457E6D
	for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 13:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789391425; cv=none; b=rTeWnvaXYQZpnbqPcbFf+cnf6YWAa2uMpUxpklFjIJq4ohyJF37CfxZn0kRG25Ud9XdV4axVJNoXVKs6RdhaoqmQDlO2hsNOY86BXeBBb9p2id+Dewub32Dx2GqVsjJ6CbDpDWN2co1y2ruZF4QM9JagFxnmDfFm9HiBKY/ScKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789391425; c=relaxed/simple;
	bh=vNdbm/0Obc4fuKtBvfdsROOb1B8uqbT+2nOWFswh3xs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U8UyJgIAWcBEbl5hPvWzaHINpFToZrhgvqId5GXL5WDZnXHc6wdNdhKJJBW4eiCvpsBuOrXlkKfYxERQpEktc3erwzzwNdC92qoxQM6TJnwJwi2GbIt51TyoMx+TDYoxVo6321CdmRazkFpb9DBxhrDveDwm1/SCMWiBIai0t7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DPew9Mzj; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=kCmq4bdL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DPew9Mzj";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="kCmq4bdL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789391422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oAtEKro1IwTIfB00hgsxl2ApCEESr6GF0Gn4Vo+1cR4=;
	b=DPew9MzjHjT1zKWYbY+oq3oFoq23q4+OSUQxJPLJ6UQwHWYG5E2wP0UJVhOAvBDeN9NRno
	FYJ3AWauC8tz6Jzx/ZjWAqazqtg8j+vH98Uxyx0cpuDNjpcr+mpOHs2IihtTBNGqsXGyzP
	EZkziRfTHRDM5jykccYEdTU92jzXX2U=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-532-y_fOozwVMXOiy3H-Aa-oRA-1; Mon, 14 Sep 2026 09:10:21 -0400
X-MC-Unique: y_fOozwVMXOiy3H-Aa-oRA-1
X-Mimecast-MFC-AGG-ID: y_fOozwVMXOiy3H-Aa-oRA_1789391420
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49cdc4080ddso17127085e9.1
        for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 06:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789391420; x=1789996220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oAtEKro1IwTIfB00hgsxl2ApCEESr6GF0Gn4Vo+1cR4=;
        b=kCmq4bdLe5NLewQN6O4dwJtLBZhhnuIvbsbqSgHgWtmLyticG8MDcKYIsSimmCa2m3
         s1Pm/efESg99pVrmnKEL3hzJrlHJKfOw7YG1LWcD8JL31DopYaxpHxR8YXa6Ixy9gWqu
         CSyg0T4X7/+HfXSa3VpVkG80I5/QK8M4xs//JKhsUo0TCJ8KR4kCqNf5InuoS5QQv5Ra
         3cqv0q1SPgr4RXsMxvPjLnERZUEX/LAHVszfYl5wnAlqO6DiTR69XeO1lj+4TWw+WAZT
         LsB4nhP5SpaUuZkHtlej+jE4gaOI5suYSoIWlQw57gI7VgVP4b8YPpkHRZxEdRS3FLfR
         m4dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789391420; x=1789996220;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oAtEKro1IwTIfB00hgsxl2ApCEESr6GF0Gn4Vo+1cR4=;
        b=Xs02JojJnO/gt+hcrVt3g1pRkZgz5Xv9a+xeHWFDf64KM0jeuOOHdl6P0aFYsXxxhA
         U3Hw1w+CtogOm3z3jVJppz1aaU8/v33ret6L8y/Ss/VBltjya+0Egu+z096/y48JC9Kh
         iviayrX3AMEvts6Fr5j89g4abt2kSywMsEd96I1CWhX3zxglkRJNqbHNc8yDj8nopvd2
         7cDw+CRXPCCgbvZrr1KuxVHA5kVOq/NcXM/mcbwx9yAY+PujM9BXL24yk8msGmGOmpc4
         Be/f73jEpiRuGlxfJ8QAP5iqsoBrmdk+4ZjK1dqX9Dwo9/McgRHMZ3HYDPMWYZ41JP1H
         11tw==
X-Forwarded-Encrypted: i=1; AKwUvByCaQLXsDdwbSgkrl2LeRpWYvDUlIwFC/ar5cqGjZuZlK+c8D+cpK7gBtrCFaEvk7dr4Ik7+WeIh4xW/6N5rLI=@vger.kernel.org
X-Gm-Message-State: AFuF++noh6grXIjfTXLHOBcdV9HfQxi0uu9jtS20asj98MW7DnxCDrXt
	vomSY6+2zthoOSMwY9LZhG6Pm/DAiEYURWlytoCFxfLGau5h8oTyGyu25yUcrreLiYZ2IPjkltZ
	We0lXU9TLE/cQ5SGIatg1yMbtJiP78g7LxDNgAnd+BCP04EFwdUJ91jLMeLyS7wJryeZpUyCXMd
	uPDA==
X-Gm-Gg: AYBFou3vD8sR83tfDjwaLPKDv1jSjAD1Za2DRcA0aTCGsk7UFCivoZTf6B9C/KWl3Ek
	3ld2B5alm6QrwY3wsOuEEjKbNrV2R9IWpDL+7OP1f09PI5lcSkacFDMtZCjI9C4NuoOyQLj5tvS
	ElxwgeBOyAAE0ZD114Da2V9UAI3uLwX3qTZfswcNpl2nBfTkk+W6aroADGgWZlBsQ3deVyaFkOm
	LM4UuBmnGQp8Oly5hge2dKMc4jwUFiXTz45Kvh3v1x3CzGl++hgF75C1Vxo22+YGLmcjdsqMJaG
	K+qtjDCw6OI7l5eVElls1eRWdASQwtn+0vzQ6ukiPI/8ho8aGDwwo/34Rsqu85XdcvGR2Fal3YP
	gXuzAEV+x/023QMpJUhGamhoAyxz2ipRa8wS04ZNh3TNMTBDClxBIDb8I6b91N1yhrg==
X-Received: by 2002:a05:600c:3e1b:b0:49e:6836:5386 with SMTP id 5b1f17b1804b1-49e7a5fb97emr32989575e9.0.1789391419747;
        Mon, 14 Sep 2026 06:10:19 -0700 (PDT)
X-Received: by 2002:a05:600c:3e1b:b0:49e:6836:5386 with SMTP id 5b1f17b1804b1-49e7a5fb97emr32988925e9.0.1789391419239;
        Mon, 14 Sep 2026 06:10:19 -0700 (PDT)
Received: from rh.redhat.corp (p200300f6af1c8300fec44a2b8bbb173f.dip0.t-ipconnect.de. [2003:f6:af1c:8300:fec4:4a2b:8bbb:173f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e71e300f3sm222248655e9.7.2026.09.14.06.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:10:18 -0700 (PDT)
From: Sebastian Ott <sebott@redhat.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	Zenghui Yu <zenghui.yu@linux.dev>
Cc: Jiakai Xu <xujiakai2025@iscas.ac.cn>,
	Shuah Khan <shuah@kernel.org>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Anup Patel <anup@brainfault.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kvmarm@lists.linux.dev,
	Sebastian Ott <sebott@redhat.com>
Subject: [PATCH v2] KVM: selftests: fix steal_time for arm64 with host page size > 4K
Date: Mon, 14 Sep 2026 15:10:13 +0200
Message-ID: <20260914131013.60334-1-sebott@redhat.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the following failure when running with 16K host page size:
==== Test Assertion Failure ====
  lib/kvm_util.c:991: vm_adjust_num_guest_pages(vm->mode, npages) == npages
  pid=873 tid=873 errno=0 - Success
     1  0x0000000000405a27: vm_mem_add at kvm_util.c:991
     2  0x000000000040241f: check_steal_time_uapi at steal_time.c:223 (discriminator 7)
     3   (inlined by) main at steal_time.c:539 (discriminator 7)
     4  0x00007fff8b57af3b: ?? ??:0
     5  0x00007fff8b57b007: ?? ??:0
     6  0x0000000000402b6f: _start at ??:?
  Number of guest pages is not compatible with the host. Try npages=4

Fixes: fc240715fc50 ("KVM: selftests: arm64: Fix steal_time test after UAPI refactoring")
Reported-by: Zenghui Yu <zenghui.yu@linux.dev>
Link: https://lore.kernel.org/kvmarm/7575a845-a542-4b16-b512-aec3126f97f3@linux.dev/T/#u
Signed-off-by: Sebastian Ott <sebott@redhat.com>
---
 tools/testing/selftests/kvm/steal_time.c | 30 ++++++++++++++++--------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/kvm/steal_time.c b/tools/testing/selftests/kvm/steal_time.c
index bc3c62b72c58..785d19f9ee8f 100644
--- a/tools/testing/selftests/kvm/steal_time.c
+++ b/tools/testing/selftests/kvm/steal_time.c
@@ -27,6 +27,9 @@
 static void *st_gva[NR_VCPUS];
 static u64 guest_stolen_time[NR_VCPUS];
 
+static struct kvm_vm *vm_create_steal_time(u32 nr_vcpus, void *guest_code,
+					   struct kvm_vcpu *vcpus[]);
+
 #if defined(__x86_64__)
 
 /* steal_time must have 64-byte alignment */
@@ -210,17 +213,14 @@ static void check_steal_time_uapi(void)
 	u64 st_ipa;
 	int ret;
 
-	vm = vm_create_with_one_vcpu(&vcpu, NULL);
-
 	struct kvm_device_attr dev = {
 		.group = KVM_ARM_VCPU_PVTIME_CTRL,
 		.attr = KVM_ARM_VCPU_PVTIME_IPA,
 		.addr = (u64)&st_ipa,
 	};
 
+	vm = vm_create_steal_time(1, NULL, &vcpu);
 	vcpu_ioctl(vcpu, KVM_HAS_DEVICE_ATTR, &dev);
-	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, ST_GPA_BASE, 1, 1, 0);
-	virt_map(vm, ST_GPA_BASE, ST_GPA_BASE, 1);
 
 	st_ipa = (ulong)ST_GPA_BASE | 1;
 	ret = __vcpu_ioctl(vcpu, KVM_SET_DEVICE_ATTR, &dev);
@@ -500,13 +500,27 @@ static void run_vcpu(struct kvm_vcpu *vcpu)
 	}
 }
 
+static struct kvm_vm *vm_create_steal_time(u32 nr_vcpus, void *guest_code,
+					   struct kvm_vcpu *vcpus[])
+{
+	unsigned int gpages;
+	struct kvm_vm *vm;
+
+	/* Create a VM and an identity mapped memslot for the steal time structure */
+	vm = vm_create_with_vcpus(nr_vcpus, guest_code, vcpus);
+	gpages = vm_calc_num_guest_pages(VM_MODE_DEFAULT, STEAL_TIME_SIZE * nr_vcpus);
+	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, ST_GPA_BASE, 1, gpages, 0);
+	virt_map(vm, ST_GPA_BASE, ST_GPA_BASE, gpages);
+
+	return vm;
+}
+
 int main(int ac, char **av)
 {
 	struct kvm_vcpu *vcpus[NR_VCPUS];
 	struct kvm_vm *vm;
 	pthread_t thread;
 	cpu_set_t cpuset;
-	unsigned int gpages;
 	long stolen_time;
 	long run_delay;
 	bool verbose;
@@ -517,11 +531,7 @@ int main(int ac, char **av)
 	/* Set CPU affinity so we can force preemption of the VCPU */
 	cpu = pin_self_to_any_cpu();
 
-	/* Create a VM and an identity mapped memslot for the steal time structure */
-	vm = vm_create_with_vcpus(NR_VCPUS, guest_code, vcpus);
-	gpages = vm_calc_num_guest_pages(VM_MODE_DEFAULT, STEAL_TIME_SIZE * NR_VCPUS);
-	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, ST_GPA_BASE, 1, gpages, 0);
-	virt_map(vm, ST_GPA_BASE, ST_GPA_BASE, gpages);
+	vm = vm_create_steal_time(NR_VCPUS, guest_code, vcpus);
 
 	ksft_print_header();
 	TEST_REQUIRE(is_steal_time_supported(vcpus[0]));
-- 
2.55.0

