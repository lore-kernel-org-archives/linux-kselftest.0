Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7061E39A7E6
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Feb 2026 22:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770071482; cv=none; b=Maku5s3Iup/WlRKMFwSrNaprL+OaXZ3DM2e/DcXNBymgNcnZEESzaIqQblICrAsC+UmvVvP5IeezThLQvpOgFiC38fTOb5TLbZpX87VTgmekFtY9ohfC84jp/H/vAQ0Nm2WxgXFv6jKVcHqMKpVPVkAmatpdFwh80AcwuCC6N+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770071482; c=relaxed/simple;
	bh=uUk0S2BVuJ3WVVu8GlDY++t/M050M70+ZcrqbqgPgMQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nAFcb4g0dPW1ywyY8EtohmN2RXPJzjFimTpzWFtmgd3LkFnSnzf9MZKO74iTvikDSfZLRGCEbU0k5WheuUzDuIWrgu7MOYETi8BIt5VAifJTsIxZNVtM2LyPcoCR6yeHbr8enBdSdpF17909VTKq+1OScc5qvFT5fA5UuNzVWTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bj97y5Ns; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bj97y5Ns"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-29f1f69eec6so53887475ad.1
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Feb 2026 14:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770071481; x=1770676281; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CvY5PdjeEdArYXhOoEPGmWzzemIVPGSONb/31dy+9Os=;
        b=bj97y5NstBNG+Z0r5RkkrDouMM4pEcUxusbV4nOKEacpDU/xmWRkcto52qxwzPjnH7
         YILqATnEHHz40e/zHiDB/ps9ZHhYjegozyHOIxgWv6PHNwwsGvL5Kerl8IiNWswtDjJl
         J94s5EXSg7Ezf+nnuS8FvWeMY5VlgJhZTmsv4Tf4S6hK5iEtPdXFfkdxZawMv0pMqCT0
         F7rnKsbk2FU4jtXpd3MPkh4CNDvOFFr9ytf3TLi0lofNBw8t5fOcVgtpg3DmE17IezUM
         V0YwHpQHtSLYHtJc3dAxV7REJ/3r4wWvoBjobepBrkntguuoSxE+BoHaOA3tdlEB0Amr
         3TxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770071481; x=1770676281;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CvY5PdjeEdArYXhOoEPGmWzzemIVPGSONb/31dy+9Os=;
        b=P1ZIWyXeH7FNKWj+/WPircXtVBQZ+kD1/MpEZDYH1EHbvLWpAH51qxln7Ruqjyfaae
         e4OP+yE2JWdWFM2FYSixCiCUTKn65D4/Abi1+OHutRhvuuPE2g5ePpjYcFzGTUCjoQ6w
         TKyBwCQQhy4IDJ3UNOhv5Il8ncGUOiyd3boj+nXzcWr7T0aowX/muMaKaTOXN275Ds0J
         SozWKrmmUMVyWg+74gfqbLcN2Ks/ZFjFmeLcnjNAYwKJkg55E3RNbGJWp5iZIzsT1Vt1
         sOoxMLfneVJpSTaevYIT3e+bd0OzIHQ5xLLIKljtE2MuwkbECVkLOoE6kz9yMZRSUt68
         x5TQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6YuHbso6b3h8rzqEI87nPLqxGLpJtpLiA0veMaxYM2dOGW08NSd5BwmPT3SocT9O4R7t9LYlxeJJnGikhG/M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXK1/br75FYGMy2vfYkggE53hGiaebVacQoUJDbaJfZxJ4zewd
	5eolBjio5K1mE5UV9QcauLlvjuiS7K/eQ+koNq4z3rgvRwq/x1JtyfGHPfuho6sG8rPYI56thtI
	tJISg+TZsRl3RGP9hFTvNDv9g8w==
X-Received: from pll9.prod.google.com ([2002:a17:902:c209:b0:2a7:8fa1:30cd])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2bcc:b0:2a7:ca82:c198 with SMTP id d9443c01a7336-2a8d9593256mr131240535ad.6.1770071480922;
 Mon, 02 Feb 2026 14:31:20 -0800 (PST)
Date: Mon,  2 Feb 2026 14:30:14 -0800
In-Reply-To: <cover.1770071243.git.ackerleytng@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1770071243.git.ackerleytng@google.com>
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
Message-ID: <d7d3ca70995a941bcf01d527c37470c2e64cafc0.1770071243.git.ackerleytng@google.com>
Subject: [RFC PATCH v2 36/37] KVM: selftests: Update pre-fault test to work
 with per-guest_memfd attributes
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
	yan.y.zhao@intel.com
Content-Type: text/plain; charset="UTF-8"

From: Sean Christopherson <seanjc@google.com>

Skip setting memory to private in the pre-fault memory test when using
per-gmem memory attributes, as memory is initialized to private by default
for guest_memfd, and using vm_mem_set_private() on a guest_memfd instance
requires creating guest_memfd with GUEST_MEMFD_FLAG_MMAP (which is totally
doable, but would need to be conditional and is ultimately unnecessary).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/pre_fault_memory_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/pre_fault_memory_test.c b/tools/testing/selftests/kvm/pre_fault_memory_test.c
index 93e603d91311..831b612449ec 100644
--- a/tools/testing/selftests/kvm/pre_fault_memory_test.c
+++ b/tools/testing/selftests/kvm/pre_fault_memory_test.c
@@ -187,7 +187,7 @@ static void __test_pre_fault_memory(unsigned long vm_type, bool private)
 				    TEST_NPAGES, private ? KVM_MEM_GUEST_MEMFD : 0);
 	virt_map(vm, gva, gpa, TEST_NPAGES);
 
-	if (private)
+	if (!kvm_has_gmem_attributes && private)
 		vm_mem_set_private(vm, gpa, TEST_SIZE);
 
 	pre_fault_memory(vcpu, gpa, 0, SZ_2M, 0, private);
-- 
2.53.0.rc1.225.gd81095ad13-goog

