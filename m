Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81F9390606
	for <linux-kselftest@vger.kernel.org>; Mon,  1 Jun 2026 10:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780309597; cv=none; b=lHAYwjdiHmPtRxsA6a7pdptclGIMLWu2MGFelfWgD9FQ45+BCR0X5imBVpnwSU9zSwwlKvFqHt24/f1kj6fTwhfXJgdcLrqvhRrkANamgevHWSAkpEiSq5itGNOaVKgccxYnyo7J6GCvcqxXnCKYm0ErsPeMjvldC7Hu+3A6chI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780309597; c=relaxed/simple;
	bh=XMF0XSIyNuy4j6kTqZpEJUq1eyLTItJ7528vJLaFCY0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tpgizcoA/Si5m6/s/fstq+RR6Zw9SnNPNim6IcpWicjIxZAPO2dAOCWwJPo8DlCWbg/bWfjsXVATbXqr/qfot9xSs3UR1to89UZHMM1IHCOTL1ohbO8muoOhpft6gcLiNyUfVepdChG6jk+xePM4c2gyqf1deyZadjUSow1UQ1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=d3SPjfug; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="d3SPjfug"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-304ec41197bso2643644eec.1
        for <linux-kselftest@vger.kernel.org>; Mon, 01 Jun 2026 03:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1780309595; x=1780914395; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vZcJSSPPDZRD9m7u0WYcrKJNavTPlRfNheNSPldKeYQ=;
        b=d3SPjfugQCk4xguTPAWU1vtSJw4WSrPiFInVIS2jafqsTwYa5ZP7iMqXr+F0mlr/NE
         3QcoPZYorAE92oXUb09M0locanhJSCVmVjzZ5fnnWEsAyf178OQpeWZ7XxSzyCzckwaK
         epVJ9am8o9atmfysJjlAUq7RQkYUWnAU00tHBp3kvJMdJea7CdLfBpJ2qekqx8kej1FU
         5y6oO0bVvbSHRg7qGU7QH7mGVgMUOK/VbY92q83YawMuzETTk+kGrUuCYP1KZbEwgCNv
         gArNf0RMuMSWaNZTHZ34DbpH0e2khdOSZG+GGGc5t6+p38+ab/q5+3kFZOFGTnctyDSQ
         wsBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780309595; x=1780914395;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vZcJSSPPDZRD9m7u0WYcrKJNavTPlRfNheNSPldKeYQ=;
        b=jSZHd2XKdYtAzNj2xtAqec/AKZ+WuvqP9PjZdMAfF1vPfwXMtvpAcYMK9Mr6x3E8YS
         Umw4XYhovuiW8bZe7WBuhgk7wiYMefUt+AWS/voTe7pnZ8RrV/w98ZlyGo41z4NxXctP
         +8+eu37Sy2WRqgtqGGtsPMTCJ5QE8S3NFZWsDuADROZ34WE/WAAdl1MOthMefQlRl1b+
         5hvHq+GIs167KP5u/u2NpN6WyVQfmdF0Wd+kFTdsRq7RgoG1trxVfyihBS80UALvYum9
         We0sto0TCscIVjWusTbAq1A1ccIk95+W3UVJjxnOwGpZPDtNhO/oEQUeLWqphmIJ/YB+
         +owQ==
X-Forwarded-Encrypted: i=1; AFNElJ+V0WTwso72D1oLb7ogSrT0M9xl5L2YxhLUw5mKlS56Nv3akE1/31Ko1L31Aiv4A9R578DUzBpxrg2GdwPpK+c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1D8C00PUEQzSoNvETb0YhEpKSrmoxTakh3XuepJMAQOvZKUvJ
	rhTibLBq0M6a/ikHYsjOSZptcNH53fi+rlQsfS6uqnH6+57eXsvIhFqn/kr5D3WlgUc=
X-Gm-Gg: Acq92OELxciLQISUeER7DQfvWdfXu6qL0Oxz9dtpmgxTDylSJIBkV7Knb4LL22oKGad
	1A2wz0hhNearvlysAndMkHrjCLhEn13+lw7JaeP8w1GFpddbjgughw7V2QWy02utJIt12njqosA
	p1RbwBiudoQD7hyKSdILLVC/OkUkTn08NQ0fpBRBRTDqQvhhW17dhDd3BEk4P45ahuHmvrliq04
	LmT2ps0LSVVQHdJPhI20anpiH73e2h2/q85ixV4NHmL22RcBUW8tRxWWD9z5DrbCtQmFUqVqgs/
	p1kQnASWT1SeKSYvxJP4M8/2wgeK9OjC4Oqm1J6hfxo9uPzH0q1VeCjn/f7niXBziO5xE608jgD
	lICvdvUIgwTa/5na1CqTqrzgYA/FA5A7uiyCDtT+2fHss5H7gR/pUT+o3dl/dREAysx3jLq/ecj
	LKiJ09+YTICvS08Kx8WD4ISWtM5Y+J8kGT5jeIuqv0zZs1YfuSqMvKjw==
X-Received: by 2002:a05:7301:1695:b0:304:de94:1c2c with SMTP id 5a478bee46e88-304fa75092dmr5279923eec.34.1780309594882;
        Mon, 01 Jun 2026 03:26:34 -0700 (PDT)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed5b9be7sm8176001eec.27.2026.06.01.03.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 03:26:34 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Mon, 01 Jun 2026 03:26:22 -0700
Subject: [PATCH v5 1/5] KVM: RISC-V: SBI FWFT: Mark vCPU CSRs dirty after
 setting feature value
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-kvm-get_reg_list-v2-v5-1-415d08a2813b@sifive.com>
References: <20260601-kvm-get_reg_list-v2-v5-0-415d08a2813b@sifive.com>
In-Reply-To: <20260601-kvm-get_reg_list-v2-v5-0-415d08a2813b@sifive.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Andrew Jones <ajones@ventanamicro.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, zong.li@sifive.com, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, inochiama@gmail.com, 
 Yong-Xuan Wang <yongxuan.wang@sifive.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780309592; l=970;
 i=yongxuan.wang@sifive.com; s=20260424; h=from:subject:message-id;
 bh=XMF0XSIyNuy4j6kTqZpEJUq1eyLTItJ7528vJLaFCY0=;
 b=i4mw/AFm7VlveGu7MUnkidG4GqKblWsIvDKpDapvBtMbjsymQ2BViwqrFhpQVOJj/B8/0HHfM
 1eIuk0srt6vBTpBQi2sl9VIkC6pNQBVnanp9bwOiLrdd6aUCUVh1h+H
X-Developer-Key: i=yongxuan.wang@sifive.com; a=ed25519;
 pk=+8NCHB1ZJvZthQAmZspOAaqjo+/snaW8mFSiDx45HxY=

Mark the vCPU CSRs as dirty after successfully setting an FWFT feature
value. FWFT features may modify CSRs (e.g., pointer masking modifies
henvcfg.PMM), and failing to mark them dirty can lead to the guest
observing stale CSR state after vCPU scheduling or migration.

Fixes: 1323a5cfe52c ("KVM: riscv: Skip CSR restore if VCPU is reloaded on the same core")

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 arch/riscv/kvm/vcpu_sbi_fwft.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwft.c
index 2eab15339694..5e4aafb0cbf1 100644
--- a/arch/riscv/kvm/vcpu_sbi_fwft.c
+++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
@@ -521,6 +521,7 @@ static int kvm_sbi_ext_fwft_set_reg(struct kvm_vcpu *vcpu, unsigned long reg_num
 		break;
 	case 2:
 		ret = conf->feature->set(vcpu, conf, true, value);
+		vcpu->arch.csr_dirty = true;
 		break;
 	default:
 		return -ENOENT;

-- 
2.43.7

