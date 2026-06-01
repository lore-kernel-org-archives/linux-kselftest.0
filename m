Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740F438A706
	for <linux-kselftest@vger.kernel.org>; Mon,  1 Jun 2026 08:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780303244; cv=none; b=bHTWojK2xsoJ/v2FEos81TcYTtwUm7zw2qGcHLeqmLe2u+9rqCZhrlf1OlL8mKSUW+th3Jpf9vyfyY0l/VGow2FEMaui5cjbAgyWAI1t5z7ksDoRxihHNOOssDLI8sAKlwn4OpUUpjO85QxssvrtGNOaUdSAA8tuOAOAWq8LZiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780303244; c=relaxed/simple;
	bh=cv2+u2g16bKW6cttSGvgPuxUbJctbV+2nzyrkjnxCq8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YBxV9DXnDqpPGu9VSDXox1VX50IwY1nGtdwbsakLaYYEyUybHV0jw7l+iJHvWDC3YcJZ8PT4oiqBF5vEwMtqzdAKq7g10+eGJbPQpiZbSfFUa6BzgbKNsmToY9zDvMIb+zvMogbK6K9tlyztb2gM+RGauPVITausoY3bT177obE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=EKVZoH83; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="EKVZoH83"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-304ddfcf72cso3612691eec.0
        for <linux-kselftest@vger.kernel.org>; Mon, 01 Jun 2026 01:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1780303238; x=1780908038; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ll+oI1aiVo6jQ8q3ONEacIDuvDvctWXx2EoHq5khZvA=;
        b=EKVZoH83lwfAwLoR+kfv5iPjINjWfTu5hHByTELMTX753MTvXL+ZSmhAq1AGGYMtYe
         oxmbIgHLQV+hXH82eGLFcHdVYa1cplADWB/MDqlxkOl+8iGyxsNKyvNKsCpYLx8/iZX+
         ptJ9ghj508/T6MFyAMCtYz2zrIjIQlilD8wZ18EJdQflItibAksoRMCk/uSM86byF81c
         5qJVWvo/vfui4xHrdjtnG3uo4QlO2Q7TdC54YBk+/yfIDbt/duUkcQoL3AZOkQ6ClVHi
         QaoBc22yT2Y4So8abPrggP2J4KPlhyBo8QsRZR3AOuq8udn0T5O9i9or+491KVDgOfxi
         tyLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303238; x=1780908038;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ll+oI1aiVo6jQ8q3ONEacIDuvDvctWXx2EoHq5khZvA=;
        b=d6wYaZo6zoqPANeL0VN0lOd8MNFOM/tOJiUYkLDsafylXFUXUQzV/rfuzvps5jaw1i
         OyeT9pe+MQohgs+7+QGQTYwIBiPmsto/4+xdOTosQcQMfZU5yqRQxtdvRYmmI3DcRal2
         I4XxT9T4oRFV1NfiDu4UdmMDKI75kcuZz0sqqplZmWIIdV8fu0Lpq/asi7Ks7jfYwOKT
         M+70zgIL/bi1j709KW97GkZZ2U232Z3BKGwOKdz9chzhMvgHmPSioRm1zKfzzu3k0Ia5
         vOz2O8YkhRBuinCWk/dK8eP2fQLhQ77xSkQZwZhKwq4/+QC7KDQgtGmroZg3pyi42kLz
         DbUA==
X-Forwarded-Encrypted: i=1; AFNElJ+eZBWvTvIRDishX5JDQGAVhR2LXS38bjdegvD7ryGyE8Wfvub6KwXsB4acBYgFfm9UIIGIO+RnOFYEDsOM3hc=@vger.kernel.org
X-Gm-Message-State: AOJu0YysSS08Xt135SYs/gdtelWbtOyON9uCEdKhURe/ZZKHORMlSaMN
	YDHMCR8youSdX/NPEVw1v9myR9OHyxk2RfZcGFaL68L4igF07fqpdZidHTPnL8Eva1M=
X-Gm-Gg: Acq92OGIkh+vNMDfKHtVzBx6mT1CdWQgLFaxQO+cqXXIiranJvnK3URs7EuVnvimZOB
	vL6CsdNJJg9eIGePDOGvtI8fGoXlwM3zKVn5zkkx13bDVMs8HUdrNg+CkgUCJcLHzcgSTgQjUL/
	q8lZ2eyFhim47Fu8yYW24gjBmFgJB1hHZc6/8d3GNmVgcHYcPog7r1CAj7TqLW9b96dewZC2Tgx
	AnmyIxcbm72tgdQ+AwadxD5TbeKr1DjeN6hMKDSgigHB92GV6U0wuxZzyyIqowEgFKdSAn0JY47
	8XL5JVGGBHM1QXWHSaOWJQeV6FLxclKTrteVUYC8CKezpIwPKvzGkYmfPupt1tO6IJXI+rsKvTi
	Gv6wJRGv9TtF4F6txnAOxwMdW0TE0CKeiGv1JsEnyIUwEVofru8qE0SXe801or1hWsY/i5Aqo9i
	CQCarG8nQLtTGoionmpIr2L4tuYT5lL+YP7zJlIfKlXBiJ7EuYyxQZJI+B0fLnObRF
X-Received: by 2002:a05:7300:e683:b0:304:6139:5a3e with SMTP id 5a478bee46e88-304fa6c856dmr4249256eec.34.1780303238426;
        Mon, 01 Jun 2026 01:40:38 -0700 (PDT)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed5b9be7sm8011818eec.27.2026.06.01.01.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 01:40:37 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Subject: [PATCH v4 0/3] KVM: riscv: Fix stale FWFT feature exposure and
 enhance selftests
Date: Mon, 01 Jun 2026 01:40:33 -0700
Message-Id: <20260601-kvm-get_reg_list-v2-v4-0-c88abc81ebda@sifive.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIFFHWoC/32NQQrCMBREryJZG0nTNG1ceQ+REuNP+9W2ktSgl
 N7dpG4URJjNg5k3E/HgEDzZribiIKDHoY8g1itiWt03QPEUmXDGJSu4pJfQ0QbG2kFTX9GPNHB
 qlc2lkpk20pC4vDmw+Fis+8Ob/f14BjMmVWq0cTm453IbeOr9f4hhtFSCacEyUQi982gxwMYMH
 UkXIf+UVL8leZRkJVNS6apQyn5J5nl+AefyIuEOAQAA
X-Change-ID: 20260526-kvm-get_reg_list-v2-f9f36961ac6c
To: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Andrew Jones <ajones@ventanamicro.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, zong.li@sifive.com, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Yong-Xuan Wang <yongxuan.wang@sifive.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780303237; l=2947;
 i=yongxuan.wang@sifive.com; s=20260424; h=from:subject:message-id;
 bh=cv2+u2g16bKW6cttSGvgPuxUbJctbV+2nzyrkjnxCq8=;
 b=QEFM2HnqlqG5bHx3IhEROh5SwyPigoKja7/0XOoScGW5b16NGP83UspWRkyDguvyYkMGfrzB3
 3eOybZtDXYOAptXjGu3eEokQHAx1Pp+Uh/tkZj9jg5Zky2T5bwI43kc
X-Developer-Key: i=yongxuan.wang@sifive.com; a=ed25519;
 pk=+8NCHB1ZJvZthQAmZspOAaqjo+/snaW8mFSiDx45HxY=

This series addresses a bug in the SBI FWFT (Firmware Features) extension
where features could remain exposed to guests after their dependent ISA
extensions are disabled at runtime, and improves the related selftest
infrastructure.

The bug (patch 1) occurred because FWFT feature support was cached at vCPU
initialization time. When userspace subsequently disabled ISA extensions
via KVM ONE_REG, the cached support status was not updated, leading to
stale feature exposure.

The selftest improvements (patches 2-3) enhance the get-reg-list test by
refactoring the extension sublist infrastructure and splitting FWFT
feature testing into separate, properly-gated sublists.

---
Changes in v4:
- Rename the title of cover letter
- Disable preemption when running try_to_set_pmm() (sashiko-bot)
- Remove check_supported_reg() (sashiko-bot)
- Link to v3: https://patch.msgid.link/20260528-kvm-get_reg_list-v2-v3-0-170969a8599f@sifive.com

Changes in v3:
- Restore 'supported' field with init() callback for initialization probing
  (sashiko-bot)
- Add NULL checks before calling feature->supported() in all functions
- Fix isa_ext_enabled tracking logic and restore isa_ext_cant_disable array
- Add sbi_ext_enabled tracking and enhance dependency checking (sashiko-bot)
- Refine code organization and variable naming consistency (sashiko-bot)
- Link to v2: https://patch.msgid.link/20260526-kvm-get_reg_list-v2-v2-0-7940a401454a@sifive.com

Changes in v2:
- Fix FWFT stale feature exposure by removing static 'supported' field
- Refactor get-reg-list test to use unified extension sublist macros
- Split FWFT testing into per-feature sublists with runtime checks
  (Andrew)

To: Anup Patel <anup@brainfault.org>
To: Atish Patra <atish.patra@linux.dev>
To: Paul Walmsley <pjw@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
To: Albert Ou <aou@eecs.berkeley.edu>
To: Alexandre Ghiti <alex@ghiti.fr>
To: Clément Léger <cleger@rivosinc.com>
To: Andrew Jones <ajones@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>
To: Shuah Khan <shuah@kernel.org>
Cc: greentime.hu@sifive.com
Cc: vincent.chen@sifive.com
Cc: zong.li@sifive.com
Cc: kvm@vger.kernel.org
Cc: kvm-riscv@lists.infradead.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org

---
Yong-Xuan Wang (3):
      KVM: RISC-V: SBI FWFT: Fix stale feature exposure after runtime extension changes
      KVM: riscv: selftests: Refactor ISA and SBI extension sublist macros
      KVM: riscv: selftests: Split SBI FWFT into separate feature-specific sublists

 arch/riscv/kvm/vcpu_sbi_fwft.c                   |  34 +++++-
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 138 ++++++++++++++---------
 2 files changed, 116 insertions(+), 56 deletions(-)
---
base-commit: c7832534a8160276cccb9a8cc8cafb5614c579d0
change-id: 20260526-kvm-get_reg_list-v2-f9f36961ac6c

