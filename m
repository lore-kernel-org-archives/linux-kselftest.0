Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E605643803C
	for <linux-kselftest@vger.kernel.org>; Fri, 31 Jul 2026 15:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785510544; cv=none; b=Oj6DW/1EgrPYMAhjynU6T18DZSUTUv0W+Hxdd0BEnFkXVcxAV62RYYyitM1pRafpjsHlT6Tfyafp804zihQpZ8ldVhcZXvPUX+yJ5UvVbnDhkmUBG/j+cnrYl7UbBoQYLA4AdjIjHldz7m42cVKCTnCllH5Po+L/q9HqQDYMUX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785510544; c=relaxed/simple;
	bh=AIVWrh6CF4CKx4RF7vzN6YiuXpAZvS5KqSwfzePjOCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CNwKUyRF1/nhU2ahxJhw6OUb8Qlusu8BWCVjz59bHqqqk/tEuhJ0uOqgd122ZyfeNiCy8SbzGYxp7Yf0kteWw2H4HIuhgBwkcenGWBYTvjbzeBGlqRf7fsZMToZVO43Aa5mcBiEbDw4M/H0JSFf7E/C5xaSHriU8RjWx8V0sii0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JkGWWF5g; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JkGWWF5g"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c1c4c7ddaf6so163362666b.3
        for <linux-kselftest@vger.kernel.org>; Fri, 31 Jul 2026 08:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785510534; x=1786115334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gOaXPDNzFmfCcFZASeKm4HD2Emk8ASo1ynV4rSmHLg0=;
        b=JkGWWF5gOjxkMrtpUQnC0kHCKCA3ttjqTCMdQPIQE2A5UYwLq1eZL4gKLP0DQkuRt1
         n0DZRcuOr9wrD1JRrLw8AAIUsjdiLUdraGfE14xZ/yooQKHdvOBT4aDlBOe41XykaCSh
         9csXID9vksGdyUNwsRh43D2hL2GY3ojFIfix8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785510534; x=1786115334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gOaXPDNzFmfCcFZASeKm4HD2Emk8ASo1ynV4rSmHLg0=;
        b=MHQ5K1JA1dyldLJC5Mn7r7lNW5P5dfT5P6RGps0HYfSkRnMyVfx843e/gnJVOCa5Xe
         RW825s9T9WJxK8/hbuMR/ihcObKvgrlz1ZSGsOCVLsVNnKWRizXA9ASGCsz4nNrvROnY
         GgHyjsgkDkTpywCwqseq44Q3J8vhmsy0Gig93stqX4kW1/Pv0dhh160/G/sy3wMLRkAY
         qKG9GjBikkCkfNE99VZMkzm6His05WwgsALFcDzsjH4hhl/zKuS4c1Td8fpznXX7x6Hr
         qM6kzTvsssRveagdriL8xfnS7b4yLTWtzg7Fy2yot2rcuOhLg1m+QyDAYqlVB79pYEo6
         fIHA==
X-Forwarded-Encrypted: i=1; AHgh+RqcKcgevVvuMExXM0iUV/4DS+RXONg4/hyZ+9VRF1yBQHNhi2AAK0O1oCVKzdkl9ktSAYNDegvGm1hGvxSM0G4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy27ORXPhED2wUP5Ic5HFIKOuePCDEDVJkbgGlAhfgFXYPVw/Xd
	JJkN11gn35+GbvVbsG2LtSG9PRsWMqQ0cba/MF5cwWKEdTOJZewUIsDgUu/97Uiy7Q==
X-Gm-Gg: AR+sD13qI3lwecvDw2LAJxER0SyijTCsmiA6JbUPEzvA5TV5xFy2a+UxVq/Fhhx56NT
	ecTtwK4MZrQqEEwZFbxzQh2VTuv5S16ONLVmu/tyne8px/jGeV+MbRDM3DYK0EXfUW5NlcIjaPp
	+f7fxxxqSeryYmUcrMJFgj+O200FvekvSRqH2R2zch8VLdiTwfM0CJCv20YPciiUE1e+fkdnET8
	vJdz98RGX5kEvTA3vHA2s+rUwjV9Bz3F8NYgkFM8Gb6fw4Wb/TgJTH+DdTdk40t3LlnHe4U7ZpF
	KuK7WE/PaZM/0WOjqngaXKkP//f+sjSxOWGphN+pThWz7/rCZ/7BDfjYrzzhC6hxv1/G1bUscOj
	bkvBVFTu5MaZCKS3AoQn2AqDay+AUjEcHAnvW5wHg5h/aT/NhB7BIjwQtDmX5H906d5ufQJMyNm
	dJImO4/9IPt4SYSENN0XpbbgeP7GOVB8HhFGus11zCLNm/bD/mIhdOJa/8yX38LSoU2DjBX8R1s
	1+C5GNsyFeWIQiuuar9YfzJV/JhRRCSujNkmbonIe0UbOe9vhuA7Bg=
X-Received: by 2002:a05:6938:a08a:10b0:c1f:e172:cf16 with SMTP id a640c23a62f3a-c1fe172d0aamr53127366b.46.1785510534451;
        Fri, 31 Jul 2026 08:08:54 -0700 (PDT)
Received: from dmaluka.c.googlers.com.com (110.121.148.146.bc.googleusercontent.com. [146.148.121.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a0c8bsm5647974f8f.34.2026.07.31.08.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 08:08:54 -0700 (PDT)
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
Subject: [PATCH v2 2/4] KVM: x86: Fix off-by-one in max_vcpu_ids bounds checks
Date: Fri, 31 Jul 2026 15:08:43 +0000
Message-ID: <20260731150846.1728164-3-dmaluka@chromium.org>
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

max_vcpu_ids and KVM_CAP_MAX_VCPU_ID are exclusive, i.e. the maximum
allowed vcpu_id value is max_vcpu_ids minus one, not max_vcpu_ids.

Fix sanity checks for KVM_SET_BOOT_CPU_ID and KVM_CAP_MAX_VCPU_ID to
correctly fail when bsp_vcpu_id is set to max_vcpu_ids, not to a value
below max_vcpu_ids.

Fixes: 7c305d5118e6 ("KVM: x86: Limit check IDs for KVM_SET_BOOT_CPU_ID")
Fixes: d29bf2ca1404 ("KVM: x86: Prevent excluding the BSP on setting max_vcpu_ids")
Signed-off-by: Dmytro Maluka <dmaluka@chromium.org>
---
 arch/x86/kvm/x86.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 47cb9eba113b..b576b46869d2 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -6908,7 +6908,7 @@ int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
 			break;
 
 		mutex_lock(&kvm->lock);
-		if (kvm->arch.bsp_vcpu_id > cap->args[0]) {
+		if (kvm->arch.bsp_vcpu_id >= cap->args[0]) {
 			;
 		} else if (kvm->arch.max_vcpu_ids == cap->args[0]) {
 			r = 0;
@@ -7478,8 +7478,8 @@ int kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
 		mutex_lock(&kvm->lock);
 		if (kvm->created_vcpus)
 			r = -EBUSY;
-		else if (arg > KVM_MAX_VCPU_IDS ||
-			 (kvm->arch.max_vcpu_ids && arg > kvm->arch.max_vcpu_ids))
+		else if (arg >= KVM_MAX_VCPU_IDS ||
+			 (kvm->arch.max_vcpu_ids && arg >= kvm->arch.max_vcpu_ids))
 			r = -EINVAL;
 		else
 			kvm->arch.bsp_vcpu_id = arg;
-- 
2.55.0.508.g3f0d502094-goog

