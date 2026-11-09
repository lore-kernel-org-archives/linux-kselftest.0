Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.127
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794214141;
	b=1MN3Ckof7IkQKXE5+gnpTDDVRYQcuYlWGjSM6Y1TX/xS0QU8ML1QCXnfdem3qmiDFlV5
	 Ucs1TjxVMDwZWsgF+z4U9l4HFgWSgpSHRTL60Rchxip3QiAiLQLUbaRIbpQjEW0+7HhWE
	 /xxKMlztpVKd61T9u7pE0wVsPSASeg1yqpakxOMf8caU8M+J/uYHWTeHH91IfIfSf6OKR
	 6PyWFdS3D5Q3X9yNOASmfg3iyzg8z4As+E9Fv8PuCp4dNlx720ybywvzHPt0p4eeaPBgE
	 vKYGANEDASzQ0j3bscP7L9lOHzXT3NgR7azk+fXd9fsC9Av0MfKHYPwlWB8Z5b4DDsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794214141;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Wgtb9kfhJDQT6OIlDEFANW5PARd8orgbcoPjl6TcZEI=;
	b=U+zKJiBu7cvmG+gNj2lO7ZwNEsHOAJFLyjAU+5iWBEYo0mOuF9NQ9RU+8J0/P5byhBIn
	 Bhi5EUpjKu8bnXt2gIU6l3fItJ43L8hFboHVpSMczkNugTYVsrGz3/u6cks4Byh2KQQ1P
	 hsvccV9bm1Tg0xXHdAAYJuYoThlD/AM32xUqPhRd+uSzFyZcOywMw6E0J9nhaC+//Ai/c
	 cMJlht0mj4X92U1bsYCnIs0bxmeUDhX2SdK8g6eBl6qkRA6+iWtoFf3bVR/PYFkxL/U7p
	 GyK+E3bybHfjFIvr/TC+sij0aRNREbBJeLEVGddhNYXRyP+LXkJeJI1Igm1qbsc5fOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=miGUCVrv;
	arc=none smtp.remote-ip=95.215.58.127
Received: from mta1.migadu.com (out-127.mta1.migadu.com [95.215.58.127])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2741D606D82D
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 08:49:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2741D606D82D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=miGUCVrv
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=zy9OoZoEVLZKrHt/PA6PNvYObGqJuDPk1PHvlEStbBI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794214139; v=1; x=1794818939;
 b=miGUCVrvJufBAYD4nQ4Mr4V/oWr077wWuAHlTXnc+xnIGO36zplrKgeVOB80+uJccnfjscnf
 kroAvneRR9sldAQvsrB+asOl8eYrp5n6w359bAbYAS0aMujA6EzyeLX/0GqfMa2LKzNqTvo1yN2
 BwNzVMKoMlvzd0nB+/9zMVfk=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d8a3008bccb79f4a;
	Mon, 09 Nov 2026 08:48:57 +0000
X-Mizu-Trace-ID: d8a3008bccb79f4a
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/19] tools: arm-smccc: Add the pKVM memory sharing function IDs
Date: Mon,  9 Nov 2026 08:48:39 +0000
Message-ID: <20261109084854.840576-5-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109084854.840576-1-fuad.tabba@linux.dev>
References: <20261109084854.840576-1-fuad.tabba@linux.dev>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The tools copy of arm-smccc.h lacks the pKVM guest hypercalls that the
protected-VM selftests make.

The kernel's arm-smccc.h defines the vendor-hyp UID with UUID_INIT(),
which requires linux/uuid.h, and tools doesn't have one. So rather than
sync the whole header, copy the function numbers and IDs of HYP_MEMINFO,
MEM_SHARE and MEM_UNSHARE from include/linux/arm-smccc.h.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 tools/include/linux/arm-smccc.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/tools/include/linux/arm-smccc.h b/tools/include/linux/arm-smccc.h
index 63ce9bebccd32..8c8f4ad639018 100644
--- a/tools/include/linux/arm-smccc.h
+++ b/tools/include/linux/arm-smccc.h
@@ -111,6 +111,10 @@
 /* KVM "vendor specific" services */
 #define ARM_SMCCC_KVM_FUNC_FEATURES		0
 #define ARM_SMCCC_KVM_FUNC_PTP			1
+/* Start of pKVM hypercall range */
+#define ARM_SMCCC_KVM_FUNC_HYP_MEMINFO		2
+#define ARM_SMCCC_KVM_FUNC_MEM_SHARE		3
+#define ARM_SMCCC_KVM_FUNC_MEM_UNSHARE		4
 #define ARM_SMCCC_KVM_FUNC_FEATURES_2		127
 #define ARM_SMCCC_KVM_NUM_FUNCS			128
 
@@ -133,6 +137,24 @@
 			   ARM_SMCCC_OWNER_VENDOR_HYP,			\
 			   ARM_SMCCC_KVM_FUNC_PTP)
 
+#define ARM_SMCCC_VENDOR_HYP_KVM_HYP_MEMINFO_FUNC_ID			\
+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,				\
+			   ARM_SMCCC_SMC_64,				\
+			   ARM_SMCCC_OWNER_VENDOR_HYP,			\
+			   ARM_SMCCC_KVM_FUNC_HYP_MEMINFO)
+
+#define ARM_SMCCC_VENDOR_HYP_KVM_MEM_SHARE_FUNC_ID			\
+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,				\
+			   ARM_SMCCC_SMC_64,				\
+			   ARM_SMCCC_OWNER_VENDOR_HYP,			\
+			   ARM_SMCCC_KVM_FUNC_MEM_SHARE)
+
+#define ARM_SMCCC_VENDOR_HYP_KVM_MEM_UNSHARE_FUNC_ID			\
+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,				\
+			   ARM_SMCCC_SMC_64,				\
+			   ARM_SMCCC_OWNER_VENDOR_HYP,			\
+			   ARM_SMCCC_KVM_FUNC_MEM_UNSHARE)
+
 /* ptp_kvm counter type ID */
 #define KVM_PTP_VIRT_COUNTER			0
 #define KVM_PTP_PHYS_COUNTER			1
-- 
2.47.3

