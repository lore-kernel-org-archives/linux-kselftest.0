Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793202227;
	b=SrLga8YJkpksQ8JZGgZ2qpueOnPzCeBDCSgY2BFaTvtf7iVmcsInKPWyrcVNilBYgnNK
	 bnl3ZbRRUoz9t6GuuLsnLVqLkilkDKU6SoYqe+BrjNRjul5x/sc1Q0eQJn2m80YVskZGs
	 045jL14slVOmyEmH6iJGScqD+fWYZnBRLdPCJoCXf5Lb9gzGgYWt4az/Idgf+itHN1rzo
	 ZLcyybzoZ1ZX5cZVLRk8CfuzNPJ2I1f06QR1Aj5l+02RTP4puG8UKUwlr5LNjIU0Gy2cM
	 sjS2J6Hr5O60YAO9AJUTUPv8wp1tDiroC15uHwTo1zhpyi1glRecW4wLLd1EKzPabBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=b/2i5085qoCW25HAHUxPCuBLSPl8xZ1dIdcLMdJHBiQ=;
	b=TC9MJUdGQHb4J3UkUT9qzjDKRVeMRW08pu8Qzu+gTrqz3+hcyhbfR+KZpBUjh7loQ8wW
	 NCIe0pEYYsMYoqjDEMN/EHu7nOGymgdbEuxuklbn0aPcRSh1/exD0juIXKN1fiurzYEPh
	 2lpwLZJfgTJDr/QBrnbdarUrt3HXhI5PyJTxc1gViq2M9cOcabWUM9I8pn2LQGCSFuWqB
	 XBSVD7UIZoqDJmmnGo+COHAmhKQdoqkt57ggLrU+HR16jme8V/kxdWhOtV1bPHhof3Uh0
	 sBFFczPy3UeKlVDokLhKSH3s9IlDicSEW6QdYoPTXsLeWP9PYP4AlCWtZIze4UkF+wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lTNYU5GK;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F65606A31E
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 15:43:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07F65606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lTNYU5GK
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48c4be28b82so1008149f8f.2
        for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 08:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793202225; x=1793807025; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b/2i5085qoCW25HAHUxPCuBLSPl8xZ1dIdcLMdJHBiQ=;
        b=lTNYU5GKH2xLrlqxE7kHO2jj/RfGi+R9C+H+/xU7FNhbaH23w4+yfjbpdvR9JOubiz
         /RIE76kgM4gpQkcFIUGqCpD/U8EjgJVZsjOe3bHFhRWkMytiO+Z9V58C2zoPn3Qf5KxV
         OA73BKUdswMVS1Jv3SYscgzzgvqMvYNCfWR7Ht50wjl2A0NedQS+vxVml2ok5jrdP52h
         S8vWwty5wAaQKNnrT1cHnVoT5tNHYQm1zhTh00id07llPFjXDyF3+N6i+ZISiJiFiqP8
         0TKFc0HtSnCaMwDeX8LFo8xhBmR9aQnhCT8E4gp3bcbnJvtfvSMMTryOa6e3cZ0/5Unk
         R+dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793202225; x=1793807025;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b/2i5085qoCW25HAHUxPCuBLSPl8xZ1dIdcLMdJHBiQ=;
        b=C5Z4KHRwe4Ijc6uFoPGPz7BPnhG/uv1KjNkr4v073YfUsAv90jvr2x0rFARbHZFpiz
         1kKHQ1L9IzfARRD71hCO/N2DYoCyCbysQhOakTFkaH+EvN+fB5BMpe0uGeRhM9h9YXDn
         11EVcEfJ5kJCSVyvBM4PjToE4cN0pfEXktBhibvH/JuRI4R4lG2xxoqusYEgLLh+mpbF
         npO5+x+nqIc7pgCEyYU5BKEpXiLu0RsCgVrKWNNBNwTIz9zxzyi9T1AWL1EtaCpsxJ52
         kmpnKq+7Nz7yQy4Lkkyx1KGKyQpcKVxJbEEkYwl7DgHDdsrxMIuG+3FcoEyHKxNamMXC
         WcwQ==
X-Forwarded-Encrypted: i=1; AKwUvBzrsQC4YXFZjKTGeSgAnzHQIXpYl2R6CPAkRlKFrDVIO2SO7FUmYgSAnbYbAYET5jIL3XSFfllPgG4P3MFbULU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4dcRE78e+PrBuoj2+yRDJ5qi6qt+YnY6oi40CCr1ANF09+sMR
	xZq38SuPnT0qnz4KWWc2x9LN50o8c5lrKhr+UUbW7xEP7sxFShiUrdNQ
X-Gm-Gg: AYBFou2qaik8mU413j933Q5l1xn+D6oGrU1q/0OdMteyGFgZmewxkFI+zrXWn0tQYPq
	iJx5RaVgm4lnCBmwXmxYRDvzjbatiBsJHxLguu1Rtig9cA0Jkg4s2l3Kimq6fMxO1pTIIpBqstU
	PWZ7fzsM+5MZkVANmtjRGDkxgq/tZCcpyUhNeBQ5Y4CB4LxLwD9ET+PKZO4zh0lNi5Afik4xXt3
	nAcwZDfkQYtro1etS6WDigcAWgQQxlY/ElwGVxABSk569N2BiRYTnFF1fgn2FWmoof3Ic6S2xmZ
	4x+RIAR0CeRldwiqMEIFM6WVneuzGOGts0BHj4MEGUgFim0ipDv7Kxvnv9egoKkE5V2XgWmnTL/
	mklXnkc59t9em1lmrCpt3IsBGkurn0WgMQZ2zQkeiV5XuztNgXjIq0ef1ZBHc60EOQcdIi9mtqk
	zxsbWrvye8bhrJ4F9io5WjA6DDz5eylwtPDLZMxUfcHw63pwy/U7VD3mSQEnQq7MjEuVQNNtUxm
	Ws3Y0/CIT/3Ywpj3Mfnmnp4RYz+ZO8ke0r4RBSjQ/tP9sK7h/RNnqcLOiys0gjSBVjcLZP46FmK
	GZy7jmVSTYt+fMDPSknO7hC+d0oF9vh/4L7thRSw2VJg8xfV1A70XFwNl/eIYGoCyw==
X-Received: by 2002:a05:6000:61b:b0:48a:f36d:fb57 with SMTP id ffacd0b85a97d-48e5d2e4a4amr7127543f8f.18.1793202225120;
        Wed, 28 Oct 2026 08:43:45 -0700 (PDT)
Received: from unix.. (244.red-81-44-253.staticip.rima-tde.net. [81.44.253.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8c05sm37044493f8f.49.2026.10.28.08.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:43:42 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	James Morse <james.morse@arm.com>,
	Yury Khrustalev <yury.khrustalev@arm.com>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Zong Li <zong.li@sifive.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Zishun Yi <vulab@iscas.ac.cn>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>
Subject: [PATCH v3 0/4] arm64, riscv: release shadow stacks on failed fork
Date: Wed, 28 Oct 2026 12:43:11 -0300
Message-ID: <20261028154315.1272705-1-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

clone3(CLONE_VM|CLONE_PIDFD) can fail in put_user() after copy_thread()
has mapped a shadow stack into the shared mm. copy_process() then calls
exit_thread(). arm64 and riscv did not implement it, so the VMA leaked.

x86 already frees via exit_thread() -> shstk_free(). Its separate TLS
leak is when copy_thread() fails after the alloc and skips exit_thread().

Changes since v2:
- Move gcs_reset_thread() into process.c (Mark Brown).
- Spell out the x86 vs arm64/riscv difference above.

v2: https://lore.kernel.org/all/cover.1792519121.git.ivanrwcm25@gmail.com/

Assisted-by: LLM


Iván Ezequiel Rodriguez (4):
  arm64/gcs: release GCS on failed fork
  riscv/shstk: release shadow stack on failed fork
  selftests/arm64: GCS must not leak on a failed clone3
  selftests/riscv: shadow stack must not leak on a failed clone3

 arch/arm64/Kconfig                            |   1 +
 arch/arm64/kernel/process.c                   |  16 ++
 arch/riscv/Kconfig                            |   1 +
 arch/riscv/kernel/process.c                   |   9 +
 tools/testing/selftests/arm64/gcs/Makefile    |   3 +-
 .../selftests/arm64/gcs/gcs-clone-pidfd.c     | 168 +++++++++++++++++
 .../testing/selftests/arm64/gcs/gcs-locking.c |  20 --
 tools/testing/selftests/arm64/gcs/gcs-util.h  |  24 +++
 tools/testing/selftests/arm64/gcs/libc-gcs.c  |  20 --
 tools/testing/selftests/riscv/cfi/Makefile    |   5 +-
 .../selftests/riscv/cfi/shstk-clone-pidfd.c   | 173 ++++++++++++++++++
 11 files changed, 398 insertions(+), 42 deletions(-)
 create mode 100644 tools/testing/selftests/arm64/gcs/gcs-clone-pidfd.c
 create mode 100644 tools/testing/selftests/riscv/cfi/shstk-clone-pidfd.c

-- 
2.43.0

