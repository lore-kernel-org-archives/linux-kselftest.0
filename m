Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8113D1702
	for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 22:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792017787; cv=none; b=E6l8ekE35RX7KXyQkFynfBMe2VOrnmImPYD1p6ueCheQiNEQERatYuQIyGwmvNU5gI3d3JmtW9MlZliGli+pK6NrorUK4aWGXLjtKnaYB1dl7Bk353RSbcvOCS1lIiS6b59p5jydNZSQyx3rMtvszNNJQAiBcaVBBSdClN1JhKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792017787; c=relaxed/simple;
	bh=6QMveXXpEj5QdPkVXKozi90KLuYOCVhf9Jhu27z3Jvw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lf/t0PkQwWBmQorvhsZ2uhSOjvxJka/biFev1sMPzKXh6Q4dtFsUuy4etvTduMOAGFJIqltAxgYHGJAnj/P2Baazw/S3uDBTEmVSbNiGzgE4D5JnHm4LxxoDV4VQxeOzxEaclvPxEdBD+97LeHiA2KC/09krf0oHDFKiTSb7Nis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=mCyY4jhJ; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="mCyY4jhJ"
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E965640275
	for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 22:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1792017775;
	bh=ZdiR6FLWYbNv8HRJW/cp7ACv/gfnAQ2Xl+ab8eRDEmc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=mCyY4jhJ7ZcI7KPXDeIzGwVCxBKUoI8uwCSvNUnOhKAYsNVzpRR9r9FqHliqmWXKf
	 dFVEB9WbdK01k4cUqfzyCxA4rbN082iwp7XLjkQlz2RBKs7XQo0SHVtHi6zwfTaq9z
	 SB96uLSzcDkQ7j0yAUe5BG6yW5Uz0q8fICfoBfiWRzQqtd8e9gZkg9SgGsplvAnLL/
	 h0SmUegl/FQUlh8C7P9YYUuwo+Iua1kYDG/e/yWXJAxAZIBpOD3ZoekPMbwqG+IwVd
	 c7M470grJn5VLBCN6EsJVekDdMn6lkVahne/zwy9VkM7UweXNTW5atP35ekL+ywOau
	 IqZsR42PozLpTqtkaOcrbpRhDQ3rExDNpYFyc22kt9lj74V4qvbrqhkf+OPDsu5BAP
	 dDr1JAPEFz0jhdaA8gZJEb3K/yeFVQ1BSN/W00EeP4Ldwf/1u8hafSbyjmmo4JLrQ0
	 5b0c+GU1YTViyNA9Gb6MPzmbBKOzY94XuaNhGYVXIqCqlJQwsM0m0g+6FWqner9S5G
	 u+SvEChXqIQqVmHC9B6dd0eUrgNdaQLOvZc8DVO51uuMpI/mutqKoKRM4FLdFO5vWg
	 bmP3Wr0j3x9GqrL6Eva/FfRos6F1cnVzKERcg2n/NXK4giXX4aYXDoVrYQKSOlH9CP
	 X9slncHwmwTTkpH8JZX7HGBM=
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48589603501so691678f8f.3
        for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 15:42:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792017775; x=1792622575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZdiR6FLWYbNv8HRJW/cp7ACv/gfnAQ2Xl+ab8eRDEmc=;
        b=Uq3cGDPMAHGARlS/3SR4E1+QUUE1/SzN60g0K3UoTTw7Y2gSqsoJIMgWd+2V3vge0b
         Z4PIiDgErwstVEkyFnwxOrTEAxiPInrqSk4GYnCiB0QOhdB67o0xPfikjd+5/iDpRTjx
         JCmUMXfkEp7/EDD849vnWApw/3pLVgCA3E8JgEWDI9E+rF21T5P6k5qLjkExNt1qtR4j
         zSWSg7r0KBqKBddZpWskx+X9rqzB+LQ6jUcovF1KHkwOzP2WsjaZ0YRJF2trtLnWb5es
         GZQwzZipo1Gk0nmcaxhZaFJS18kBrTFki0oANX55El9k7FdN/uavuBzIC6WnggJ1r6Qz
         eXNg==
X-Forwarded-Encrypted: i=1; AKwUvBwuyFvIW+EA/Yf5+MnOjUut/0CyFSS4gYVlliHF1IRIFkCKmmN2+5dQ+Lcih3aZztwTWfWW6dHsKFPARABSShY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLUqnzXKizGzIrUSe5XHh0NckXZRr0MDXt8owf3ikpyFV/UG+u/
	k82di2BBuN9dcJKdKoAeBKL/VxK8Y8pYvLyqtvC998nN2bey+XSxUbx6RVxtbM3iPpPEjFVurGG
	rWbOyD5XZEzROlEzg0YY0gDWjUcfGS7aT5uDmZtYo9dmzRT8u4Ywef8fMow3WqoA2ZcJc63I0XB
	GRQ9RgNCMVAQ==
X-Gm-Gg: AYBFou3vRfh0nFffPQWubCTifclMZwiu4v6ApIzwQlHrU+Ft0Iut1pjGdddmnC9EXc4
	WjI552+qBdpIyEdSST81Ab980fQjTw7oZ94bb2JCF7imak2Yj8UP5hfCgvWpgspjXEpH08L9aAE
	N251veMlqo59nZbZR9IZWp0Ko9BQeFNAMmfC8klJdSlmK1q68iKGdY6yqS9+8L0CYBwZxoHG4IB
	krotVbAFXMaGtFj4KQc9bbZKez5RCsWq0ZMX2B4FyZEjbWnIKc5OTS+Lyy5KZ+hiQitH5mwgTJ1
	cCcyI2EO0wQ+hd0gMyCPO4MJ/FYj92ADNetEJKs6GrECs3fmhMvVeoVJI5d7cAznJzVQd6pkJi/
	0adVeXgRaHyQ+oQuxmd75nPqLiVUH+UMag7686vjOc3U5AZR7xbjnA+a3
X-Received: by 2002:a05:600c:4747:b0:4a1:77db:45d9 with SMTP id 5b1f17b1804b1-4a18e47aa9amr359760895e9.6.1792017775554;
        Wed, 14 Oct 2026 15:42:55 -0700 (PDT)
X-Received: by 2002:a05:600c:4747:b0:4a1:77db:45d9 with SMTP id 5b1f17b1804b1-4a18e47aa9amr359760415e9.6.1792017774558;
        Wed, 14 Oct 2026 15:42:54 -0700 (PDT)
Received: from workstation5 ([2a02:908:1242:30e0:513f:8595:22d1:d25d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bf63567esm23227965e9.10.2026.10.14.15.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 15:42:54 -0700 (PDT)
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Sarah Emery <sarah.emery@canonical.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: [PATCH 2/2] KVM: riscv: selftest: add Zicclsm, Ziccamoa, Ziccif, Za64rs
Date: Thu, 15 Oct 2026 00:42:39 +0200
Message-ID: <20261014224239.963635-3-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014224239.963635-1-heinrich.schuchardt@canonical.com>
References: <20261014224239.963635-1-heinrich.schuchardt@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

KVM supports extensions Zicclsm, Ziccamoa, Ziccif, Za64rs for the guest.
Add these extensions to the get-reg-list test.

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index bf3980e9db127..71e5969142b30 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -63,6 +63,7 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVNAPOT:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVPBMT:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVVPTC:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZA64RS:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZAAMO:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZABHA:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZACAS:
@@ -89,6 +90,9 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOM:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOP:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOZ:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICCAMOA:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICCIF:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICCLSM:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICCRSE:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICFILP:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICFISS:
@@ -576,6 +580,7 @@ static const char *isa_ext_single_id_to_str(__u64 reg_off)
 		KVM_ISA_EXT_ARR(SVNAPOT),
 		KVM_ISA_EXT_ARR(SVPBMT),
 		KVM_ISA_EXT_ARR(SVVPTC),
+		KVM_ISA_EXT_ARR(ZA64RS),
 		KVM_ISA_EXT_ARR(ZAAMO),
 		KVM_ISA_EXT_ARR(ZABHA),
 		KVM_ISA_EXT_ARR(ZACAS),
@@ -602,6 +607,9 @@ static const char *isa_ext_single_id_to_str(__u64 reg_off)
 		KVM_ISA_EXT_ARR(ZICBOM),
 		KVM_ISA_EXT_ARR(ZICBOP),
 		KVM_ISA_EXT_ARR(ZICBOZ),
+		KVM_ISA_EXT_ARR(ZICCAMOA),
+		KVM_ISA_EXT_ARR(ZICCIF),
+		KVM_ISA_EXT_ARR(ZICCLSM),
 		KVM_ISA_EXT_ARR(ZICCRSE),
 		KVM_ISA_EXT_ARR(ZICFILP),
 		KVM_ISA_EXT_ARR(ZICFISS),
@@ -1238,6 +1246,7 @@ KVM_ISA_EXT_SIMPLE_CONFIG(svinval, SVINVAL);
 KVM_ISA_EXT_SIMPLE_CONFIG(svnapot, SVNAPOT);
 KVM_ISA_EXT_SIMPLE_CONFIG(svpbmt, SVPBMT);
 KVM_ISA_EXT_SIMPLE_CONFIG(svvptc, SVVPTC);
+KVM_ISA_EXT_SIMPLE_CONFIG(za64rs, ZA64RS);
 KVM_ISA_EXT_SIMPLE_CONFIG(zaamo, ZAAMO);
 KVM_ISA_EXT_SIMPLE_CONFIG(zabha, ZABHA);
 KVM_ISA_EXT_SIMPLE_CONFIG(zacas, ZACAS);
@@ -1264,6 +1273,9 @@ KVM_ISA_EXT_SIMPLE_CONFIG(zfhmin, ZFHMIN);
 KVM_ISA_EXT_SUBLIST_CONFIG(zicbom, ZICBOM);
 KVM_ISA_EXT_SUBLIST_CONFIG(zicbop, ZICBOP);
 KVM_ISA_EXT_SUBLIST_CONFIG(zicboz, ZICBOZ);
+KVM_ISA_EXT_SIMPLE_CONFIG(ziccamoa, ZICCAMOA);
+KVM_ISA_EXT_SIMPLE_CONFIG(ziccif, ZICCIF);
+KVM_ISA_EXT_SIMPLE_CONFIG(zicclsm, ZICCLSM);
 KVM_ISA_EXT_SIMPLE_CONFIG(ziccrse, ZICCRSE);
 KVM_ISA_EXT_SIMPLE_CONFIG(zicfilp, ZICFILP);
 KVM_ISA_EXT_SUBLIST_CONFIG(zicfiss, ZICFISS);
@@ -1372,6 +1384,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_svnapot,
 	&config_svpbmt,
 	&config_svvptc,
+	&config_za64rs,
 	&config_zaamo,
 	&config_zabha,
 	&config_zacas,
@@ -1398,6 +1411,9 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_zicbom,
 	&config_zicbop,
 	&config_zicboz,
+	&config_ziccamoa,
+	&config_ziccif,
+	&config_zicclsm,
 	&config_ziccrse,
 	&config_zicfilp,
 	&config_zicfiss,
-- 
2.55.0

