Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA67437864
	for <linux-kselftest@vger.kernel.org>; Fri, 31 Jul 2026 15:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785510551; cv=none; b=Db7XIsHJuCD2ntP4cbMJ7fiTKSkJfzgeLEjFwUZeo1NtXwLM6jroAEoj20BmXsMdYEz9Rfefl1AMRByuYEAqMbMBQZgqlOnShRykeBZowzxv+gSM+LAKSwVWtN/AhFjGT20mFJVxJ1wsrY1Q8QZarF/Ktf+gGbhXWdteUN37TeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785510551; c=relaxed/simple;
	bh=tvuGJlpxe994ywBTZBk8oLyVZiPfdQoTV1v2claAJ/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rnEERSemtNP+J8GkBB833Ve7Bo3yujlkx/+u7xYQW61VHwUWrcpCNvJ3s+m2kqCS3+DIrR/x9j7a9tCxbwPq/aYFev+CsIj9h8GCp2yYsRKglUe6dw1NOy6Rox6SsHQwSdGCnbArfxOrWsj5i9aHERmvoZ/Ebo474HHnRExMT5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oMqG93NA; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oMqG93NA"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47f71156e1aso617426f8f.3
        for <linux-kselftest@vger.kernel.org>; Fri, 31 Jul 2026 08:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785510536; x=1786115336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qNQVoJLOAt300tBIc7RjPTSBrNrM6NOapAN0DpYPO7A=;
        b=oMqG93NAd1Pa+dw1ySgixP4sB/5dgOY2hXyEFi8MoAtT5Z0OPtV7uPC5tb3UCYoASu
         zkNly5iN3R0EpA+RpjftQRQI96/fSzjrELNFliuBDYfHS4WaWujnjrEJRZDwX2LDw6Ya
         911CbRDCuYsbMpK6v6kWP/+LrdoCsi87FZJug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785510536; x=1786115336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qNQVoJLOAt300tBIc7RjPTSBrNrM6NOapAN0DpYPO7A=;
        b=SxcO1wG7s9RsGoLG8xtLZWxt6SpbOpM2xb9OC+RY0CpRnNA0+qee6V96fZVzfO3MOP
         DprFv/xOGwzZKEWYnFjAiSy3IoCBjgY7qpEK5yklsVbGVe3Cg9zpwjQ7jwW3qXeKfT5/
         Bn1IkDhgd4o6by4q6w1CYwTzQ7VuZ5CQBaDSovbQRxfa0R+WTkKenXyC3Xikwfo3tNbZ
         e8Wix7QzIrTtzYhs3+2u+8Z0MrYZP6O2NlxpZIwR6wSNRP0keGO//SHMQOlQL3alY0s8
         4HM0DoDoTub3xS1SGWvGNibWnK+Eb1/Qytv6BaawIyHaj6liAdNbcS69gU0leqlj1PMr
         INZg==
X-Forwarded-Encrypted: i=1; AHgh+RrjM8nQiWnRsCjEncQ8jWYm9/lEGOOftloDKM+UK0x7iFcUQBskXJnUqznOw1Vndadjx6zBeLGZDsEVrvpmJvE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8pnvYNI7siyNXOKUw+Q04nZmDDbFumS0LOkMnk8Uvs6yx4PrH
	pF1eD/Caggok0Y/njrOpcHhAAiq8fYYcMtweY1jzQjVIZ1VYXYqLTzFoxgkozKMb/w==
X-Gm-Gg: AR+sD12qOyiMVHLYxMJJEcL0NwOyIbQq4bmsCVYi5rNCJQkyE6ZmiUnn7bgCt7N2u39
	ZwXes5X8JNorwDQzooFg0sYsFovINRV7eZlII9gbdSMrd+HUzy/DlvppF5cgJ1Dby2gD4H6YUEY
	D0JLAfo/YL3SPYIzCiYLbRebGA6KkhuPRtaBvpXVAKIy2cXn6yPJ5Gf6x4J+qggALHGKkoTIofF
	cS6St9GDGbarpuNbXUJrqiHYCGTGpFzOQmANIoRxYe5QcQ7itBmkvcZTta24goG5Edm1wSuHJPd
	OO4h/JfsmB/QIfRVMYzu2auIosKr7ponKwdG1Rm8U+fEOn3vsipc53XNiNM9S33I72vn8Phb/cW
	wIaEl9gH+WQtmJcVWxRdNA8Ev788gYybf0O17m4YAMnp2Z2Qjc25wfJyeJHK+CI2r9dpucuzWPk
	12rBS6tqj8k5ZwBQJCrrwUbST7cAuYpzojR73+3CpseEe6QJItvKnLxdxArByQ4KK7vSoPZ5Bga
	EYXyxm0IYLlTzELFDINy1KSFr0+6mE2LeqTOZi2JvRGZHjnRlm1hGE=
X-Received: by 2002:a05:6000:60f:b0:47f:8112:f793 with SMTP id ffacd0b85a97d-47fd72b5cd7mr50971f8f.13.1785510535599;
        Fri, 31 Jul 2026 08:08:55 -0700 (PDT)
Received: from dmaluka.c.googlers.com.com (110.121.148.146.bc.googleusercontent.com. [146.148.121.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a0c8bsm5647974f8f.34.2026.07.31.08.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 08:08:55 -0700 (PDT)
From: Dmytro Maluka <dmaluka@chromium.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Mathias Krause <minipli@grsecurity.net>,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Vineeth Pillai <vineeth@bitbyteword.org>,
	Chuanxiao Dong <chuanxiao.dong@intel.com>,
	Aashish Sharma <aashish@aashishsharma.net>,
	Grzegorz Jaszczyk <jaszczyk@chromium.org>,
	Dmytro Maluka <dmaluka@chromium.org>
Subject: [PATCH v2 3/4] KVM: selftests: Improve bsp_vcpu_id and max_vcpu_ids out-of-bound tests
Date: Fri, 31 Jul 2026 15:08:44 +0000
Message-ID: <20260731150846.1728164-4-dmaluka@chromium.org>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
In-Reply-To: <20260731150846.1728164-1-dmaluka@chromium.org>
References: <20260731150846.1728164-1-dmaluka@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that KVM correctly fails with -EINVAL when attempting to set
bsp_vcpu_id to the value of max_vcpu_ids (not just to a greater value)
and vice versa, improve corresponding tests to cover this corner case
as well.

Signed-off-by: Dmytro Maluka <dmaluka@chromium.org>
---
 tools/testing/selftests/kvm/x86/max_vcpuid_cap_test.c | 6 +++---
 tools/testing/selftests/kvm/x86/set_boot_cpu_id.c     | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86/max_vcpuid_cap_test.c b/tools/testing/selftests/kvm/x86/max_vcpuid_cap_test.c
index 47ee14967873..43f16c052de4 100644
--- a/tools/testing/selftests/kvm/x86/max_vcpuid_cap_test.c
+++ b/tools/testing/selftests/kvm/x86/max_vcpuid_cap_test.c
@@ -30,10 +30,10 @@ int main(int argc, char *argv[])
 	if (kvm_has_cap(KVM_CAP_SET_BOOT_CPU_ID)) {
 		vm_ioctl(vm, KVM_SET_BOOT_CPU_ID, (void *)MAX_VCPU_ID);
 
-		/* Try setting KVM_CAP_MAX_VCPU_ID below BOOT_CPU_ID */
-		ret = __vm_enable_cap(vm, KVM_CAP_MAX_VCPU_ID, MAX_VCPU_ID - 1);
+		/* Try setting KVM_CAP_MAX_VCPU_ID below or equal to BOOT_CPU_ID */
+		ret = __vm_enable_cap(vm, KVM_CAP_MAX_VCPU_ID, MAX_VCPU_ID);
 		TEST_ASSERT(ret < 0,
-			    "Setting KVM_CAP_MAX_VCPU_ID below BOOT_CPU_ID should fail");
+			    "Setting KVM_CAP_MAX_VCPU_ID <= BOOT_CPU_ID should fail");
 	}
 
 	/*
diff --git a/tools/testing/selftests/kvm/x86/set_boot_cpu_id.c b/tools/testing/selftests/kvm/x86/set_boot_cpu_id.c
index 8e3898646c69..1c4ebdf8e82c 100644
--- a/tools/testing/selftests/kvm/x86/set_boot_cpu_id.c
+++ b/tools/testing/selftests/kvm/x86/set_boot_cpu_id.c
@@ -39,8 +39,8 @@ static void test_set_invalid_bsp(struct kvm_vm *vm)
 	int r;
 
 	if (max_vcpu_id) {
-		r = __vm_ioctl(vm, KVM_SET_BOOT_CPU_ID, (void *)(max_vcpu_id + 1));
-		TEST_ASSERT(r == -1 && errno == EINVAL, "BSP with ID > MAX should fail");
+		r = __vm_ioctl(vm, KVM_SET_BOOT_CPU_ID, (void *)max_vcpu_id);
+		TEST_ASSERT(r == -1 && errno == EINVAL, "BSP with ID >= MAX should fail");
 	}
 
 	r = __vm_ioctl(vm, KVM_SET_BOOT_CPU_ID, (void *)(1L << 32));
-- 
2.55.0.508.g3f0d502094-goog

