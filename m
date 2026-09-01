Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A6A476071
	for <linux-kselftest@vger.kernel.org>; Tue,  1 Sep 2026 09:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788253753; cv=none; b=HXSmHZUA2A6MEQ1wzBUsh0XzhSLxpikxegIXQbF2Q89Vlzywg11G9bTAquvEN8EFi5oZ3aWCzx1JPMvXTN/x2a9X87Lc82C98iM1YWl+dljEVylgUTiAys1E3FxnIee+Ue2qBhhbZYK8IxKWFOEIqw/YJh86aMwcHJpFEYaJIiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788253753; c=relaxed/simple;
	bh=t44TDabfynvpRhcL0vlUK37Vp9X/jS2Wp61Uvpjk0tk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pCWHDd/XFAagB15eiMRezFG6Hx7Jb/jrYoCXLbK4A2ngsZYUegPOOogWwS5Q6uhfE4TnF/pY9SHKuUVzMKZB0vDVMJ93UA+CJEAc6y2rM5yekYJTh76sPBB48XaaZ/7syfkDAa8Q2c79Ead8GvuoSKYQxmuG8aJ8vHPe02BoF3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iZVpImK9; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iZVpImK9"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2caced6038eso9204965ad.0
        for <linux-kselftest@vger.kernel.org>; Tue, 01 Sep 2026 02:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788253746; x=1788858546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=znJKcoBec7Nt3FmFfze7QZZUuPfc93AsW2GJmhnrwiM=;
        b=iZVpImK9/OPnjiZTbR/Z5BJqo81BpH5759mHm2t9pJpkwo10GL3Yrqptk2wPZZW9pd
         MsByZmRnLoco0lUSAV2SBlTBNjab/zsDVbMMhJdzO31gW3OhFbRTEt89qsXbLClXHryR
         6ApkhsWUa3lqsiiH18RRcpemsy0dOli2km36gJEnu0I8Cu5z6Bh3LuCKsl7UNRqBkze9
         oYUYhRyLmOxU6Ihr1AUskEQrVKRfTYb6jw1/jG0GsNknSUtmE6niTJDq0m4XDqm2xlSn
         8ZSsIEGprYuhYVm1Zrrwt+fneB7AUzDkH3T8ILbBV75FE9MNTyyjlSYN1NYXhR4DO/nC
         xKFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788253746; x=1788858546;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=znJKcoBec7Nt3FmFfze7QZZUuPfc93AsW2GJmhnrwiM=;
        b=OxADvE9zYrdUQORDNTljHALqW8QO9MOe5JvUZGR75wXgJgmsTqFH2hM3cHSSAEwhlg
         86CvjhFtL7hkTTdlZz4a3ByXcJsPnAG3c0+lWGD6HNj7pcirPDDzDawvxxsPpIqSJzfS
         nyQLNqUfZbd4PGqwXW8h8gxD/c04ocIdTw0WKB6cDO3Rw0oVPp7pmhwsbj1F0xIzIAp2
         AvXcPc/Qgtz3Rnc9rPsM7VV2bZf2DjHYTZcYNMDOCYBIHq5MCXrJalQjF707tYwDF+gQ
         lrRg9HCCrYy3eQ8kFF6PAuGST+Qm9zK4A9CMemY3u091exhDAHIlOjuQ2+Xe/zUaB29f
         cG0A==
X-Forwarded-Encrypted: i=1; AHgh+RqBvUERj5KD/QY4HZI4a/9ok30q3fgVHMCORl55QQeJ4SlZeXUXljn1M/rFDPJpl/uE7bEUDN9r2eHCtNuBCLE=@vger.kernel.org
X-Gm-Message-State: AFuF++lGYFNC4/YSDvscQDFymUanxS7BJqmE1p4+fVTy0lA2c3qc5zbx
	ZXiSvL6H2uEFDQMEDk6z6DseTOCAN1JnSQ54G2k/8RaK8ovLFzLbUJtM
X-Gm-Gg: AR+sD12shBRTEf++daueaFMmavzYfHz2ImH0ahQcxL8CnOhcZdvKYIDMoisJhW5Srzq
	4tVyfMMVIEI0NgnMxpl7r+70GoAwV3eVjZlASzc5rV3MBkqtZwU31k8tzkrn6Au6BTe0cprYDgg
	UwGGPzGD8fJyh+iozJDI+5W8ZBu7kTuMAiyishIWU0t5jk3loYQSFmNahFd27YD+DD/NwYv2I3l
	S00otpOKJV5MXVJHr4y4ZlPVZL/XtI53Lmus55PdxlsfiI7uDQt7hSlksaD51JPvSnUuI3SLfdD
	FerYa1OrTTGH5HRmk8cgeujVVuLpjHJcflAQADPU72hESA/u2+pp1kN/VVOVpXXHE7dbjfbj1hv
	fotrxD5Mbh17bl+IYC0ZN/4+f8icPySWBRJ8O+eyJmSbAQTHtuE6EoQhKZ+RxflJEk+dTELMFQs
	8y/0P5FTw3I2sT0NwsYnJF2w5Tso8LDdEOrhRJSNbWO24hyEvJmUNMF56jB52vnjmA+XJgip9Ok
	AbTHm9fJXWiHA==
X-Received: by 2002:a17:903:3d10:b0:2d7:5da6:2af4 with SMTP id d9443c01a7336-2d95268a8f7mr40737215ad.4.1788253746178;
        Tue, 01 Sep 2026 02:09:06 -0700 (PDT)
Received: from amd.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7bf283sm40042773eec.8.2026.09.01.02.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:09:05 -0700 (PDT)
From: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Ackerley Tng <ackerleytng@google.com>,
	David Matlack <dmatlack@google.com>,
	Oliver Upton <oupton@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Josh Hilke <jrhilke@google.com>,
	Wu Fei <wu.fei9@sanechips.com.cn>,
	Andrew Jones <ajones@ventanamicro.com>,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
Subject: [PATCH] selftests: kvm: Check calloc() return in vcpu_get_reg_list()
Date: Tue,  1 Sep 2026 09:08:38 +0000
Message-ID: <20260901090839.3338955-1-nagachaithanya9911@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vcpu_get_reg_list() allocates reg_list with calloc() and immediately
dereferences it via reg_list->n without checking for allocation failure,
unlike every other allocation in this file which is guarded by
TEST_ASSERT(). If calloc() returns NULL the test crashes with a NULL
pointer dereference instead of a clean failure message.

Add the missing TEST_ASSERT() check.

Fixes: fd02029a9e01 ("KVM: selftests: Add aarch64 get-reg-list test")
Signed-off-by: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
---
 tools/testing/selftests/kvm/lib/kvm_util.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 9ddc047d5c27..d15f39900ed7 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -1727,6 +1727,7 @@ struct kvm_reg_list *vcpu_get_reg_list(struct kvm_vcpu *vcpu)
 	TEST_ASSERT(ret == -1 && errno == E2BIG, "KVM_GET_REG_LIST n=0");
 
 	reg_list = calloc(1, sizeof(*reg_list) + reg_list_n.n * sizeof(__u64));
+	TEST_ASSERT(reg_list, "Failed to allocate reg_list");
 	reg_list->n = reg_list_n.n;
 	vcpu_ioctl(vcpu, KVM_GET_REG_LIST, reg_list);
 	return reg_list;
-- 
2.43.0

