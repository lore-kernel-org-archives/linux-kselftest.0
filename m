Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792997072;
	b=qtjcJG2GauhznglNjWWA6z8XMyQskn9jjwi5gLnjwF3FF+lqD27eqFIPnOZeYcLpoDuQ
	 rvWSEcXuX32ltCkDxRc051EczuESSxfY+IMApcn038kjzUvMoqKXUppBy8eEDpqAmaiyJ
	 n79SvDFZoyNu97KRHZiSw3kRIiEPqXt08jLa2fdjIpPq7Pi/P0zfK6jHWQaWCQq4pNYXu
	 6TSdrsWYboy/KEbjegqqdTkalKLiW8+FANHSXI8ub4jopMIdJOnIMJOukX3Qx6cY9dJpn
	 xFfyS7tyo+TjcsebsUKOs6H6HEMBFXyMYjA+nam9zFBYm76aIAm5BKoXZL3suoiGa+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792997072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=SVDMJgn10rHnD4uE6hPqCMQFD9J01/4zPqZn28ffNpc=;
	b=Mu7fa5IaSjyhwXQkXTr37yqj2udnNe0IpGdDFVG/E6Qs2a2P4RSKBoJ+Ec3OrkJ8vjJy
	 1sVWb9gApRmsg5LpJCZlWMO4FQtTvnAfRQ9qHyChf/iD1HCG66A8karU7OPCBPD79uYmL
	 yAUCCg/kCxRGsbD7j9StyPorKvzPZy4trXGgtzxam5jdg8fizDVOhOoSpTHvID0fST23L
	 7AxE4i2OrNpRlTXtSORDU3CPNKjSrHJFLAcsW4zEIatVrKa1pnAtAFMJneWSeCw9699U5
	 ppJbl0ro61Yc4CrmmRPHmghuUbyXV9QPFdv/U/0DT9UYowffSHCLgeiIXSPTjVlpyIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--gongtao.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=JjCptTet;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A299F60A2624
	for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 06:44:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A299F60A2624
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--gongtao.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=JjCptTet
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e93f266d20so45623935ad.3
        for <linux-kselftest@vger.kernel.org>; Sun, 25 Oct 2026 23:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792997071; x=1793601871; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SVDMJgn10rHnD4uE6hPqCMQFD9J01/4zPqZn28ffNpc=;
        b=JjCptTetbNOcG54FEjsBHK7DXD2G20PJIUydtqZS8VmndGJnL5jd7h49Hubdsodwbv
         9pU1fP143Z1/OXHOSyd/emSgh36vVZrxfMFypsXQ2FT9WQxSgIT1iDzfkRFSNWZE9gA+
         sKzbyxXULqwhnA+S/3/icTXM2Ot8jsU9VbDpj6s1LPkE8Jq4tJOqQkkQ7ZYLj8C/FIjw
         2BpDKsFtRl3qvL0WQVm9k4hz37ZxvYQjeyjbBZt/Qoirh/HdCCz+4fr5L3t/JX064hwP
         ReYGvwdYSEnPiXN2ZfEvc0zKBbrp63aA9x7+fy3PiN1W12SJegilX6Sww87WWZ5JGPBE
         Txxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792997071; x=1793601871;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SVDMJgn10rHnD4uE6hPqCMQFD9J01/4zPqZn28ffNpc=;
        b=cfdT+EoHoGc5QpAEkrKVlbOm5CSeqZM1zsZ5VXt36xatlhc/11EMTHsM9WFyBNYuRP
         cIX7uhrk466lUMuKQEFWffyrPSEThM72eenOM/VpBTUEuDRPGTpODLYXUbZt/SLMfyK9
         QgBDTtK4py16LsTKLJlUqjiW9GclG1vgPh3eMrOVLa+xh21AY6PSLTY/vMQLmSmn+Zy1
         mwZcXVWo2YH4Y6OHYu7Q6e5Jz1GFq4oH8iVIIh057H2bH2MN+7y0/nbBFkZy1DHcsIg2
         3SjfSUf7PPtcEGWYt0ubqXudG5aIm6zYJoZhygYbR1WUePGpiTSk95QIC/b6aoE4Jtaf
         usdQ==
X-Forwarded-Encrypted: i=1; AKwUvBxt2ABctFc0PJEcix+p+vY4T2kH2Ds3jY+vH2lg9N53MIcbT3ezSX3Hal3o9bZqoTDY58okcYWS68aLz3DOXcM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmdaC3pExByyBXaAzttPkCWMMOvhxgcYYf8fuYoaXrc2CcgkwG
	3iDPUS/H4pwHEbPCvsBWEY57jMNC01U5Wpn702gEW1gc2P23GMMmDj9l1t0xUMVbKsBXnaY/3LY
	c/M7Ia2Dgjw==
X-Received: from pljc8.prod.google.com ([2002:a17:903:3b88:b0:2ea:dab4:d40d])
 (user=gongtao job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ecca:b0:2e9:4008:6fda
 with SMTP id d9443c01a7336-2ea9c67741amr54989615ad.28.1792997070865; Sun, 25
 Oct 2026 23:44:30 -0700 (PDT)
Date: Sun, 25 Oct 2026 23:44:22 -0700
In-Reply-To: <20261026064424.3003536-1-gongtao@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261026064424.3003536-1-gongtao@google.com>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261026064424.3003536-4-gongtao@google.com>
Subject: [RFC PATCH v3 3/5] KVM: guest_memfd: Advertise support for KVM_LINK_GUEST_MEMFD
From: Tao Gong <gongtao@google.com>
To: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: Vishal Annapurve <vannapurve@google.com>, David Hildenbrand <david@kernel.org>, 
	Ackerley Tng <ackerleytng@google.com>, Ryan Afranji <afranji@google.com>, 
	Sagi Shahar <sagis@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Tao Gong <gongtao@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Vishal Annapurve <vannapurve@google.com>

Advertise KVM_CAP_GUEST_MEMFD_LINK via KVM_CHECK_EXTENSION so that
userspace VMMs and selftests can discover support for linking
guest_memfd instances across VMs via KVM_LINK_GUEST_MEMFD.

Signed-off-by: Vishal Annapurve <vannapurve@google.com>
Co-developed-by: Tao Gong <gongtao@google.com>
Signed-off-by: Tao Gong <gongtao@google.com>
---
 Documentation/virt/kvm/api.rst | 8 ++++++++
 include/uapi/linux/kvm.h       | 1 +
 virt/kvm/kvm_main.c            | 2 ++
 3 files changed, 11 insertions(+)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 7c527a1e7c487..bc54212e48c32 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -9738,6 +9738,14 @@ take care to differentiate between these cases.
 The presence of this capability indicates that the nested KVM guest can
 start in ESA mode.
 
+8.48 KVM_CAP_GUEST_MEMFD_LINK
+-----------------------------
+
+:Architectures: all
+
+The presence of this capability indicates that KVM supports linking an
+existing guest_memfd file to another VM via KVM_LINK_GUEST_MEMFD.
+
 9. Known KVM API problems
 =========================
 
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 53fe8dce57db2..09926fa85fe6c 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -1000,6 +1000,7 @@ struct kvm_enable_cap {
 #define KVM_CAP_PPC_COMPAT_CAPS 250
 #define KVM_CAP_ARM_PMU_V3_STRICT 251
 #define KVM_CAP_GUEST_MEMFD_MEMORY_ATTRIBUTES 252
+#define KVM_CAP_GUEST_MEMFD_LINK 253
 
 struct kvm_irq_routing_irqchip {
 	__u32 irqchip;
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 70521371b64ab..135e7bb7609a8 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5008,6 +5008,8 @@ static int kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
 			return 0;
 
 		return KVM_MEMORY_ATTRIBUTE_PRIVATE;
+	case KVM_CAP_GUEST_MEMFD_LINK:
+		return 1;
 #endif
 	default:
 		break;
-- 
2.56.0.257.gf7497c7d27-goog

