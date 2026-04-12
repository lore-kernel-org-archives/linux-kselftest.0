Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF82346E5D
	for <linux-kselftest@vger.kernel.org>; Sun, 12 Apr 2026 06:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775973839; cv=none; b=RdVc5sG31pYWIu1mUDhCeEl2Rs3gvrwiZqEYcLROzO9Rn0JdZIQpPpInLqdo1IiWo++FdKMX4PUzl2ilDmTx+DoeEDLdpQPjA73vbQK2bDUiUyX81OpFCwFKIQkCDRYjLuz9vgz3qDKEoJ6lJHMAyCjukV3oVyc9d8+USokwqPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775973839; c=relaxed/simple;
	bh=S4TXCDrvBtG070uX5Lc31lW4uy+uw16gQjyA0jgmlIg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YtWXU1ViHW00daEvcOJBTCTuVxFiA4RwhYhwxZsit/0gukSapebzjX8VOl8799CULhO6wYNR0tcL151OfYa+PpvqIKF6CnwZjSNkVlBkTOmN+bLWANJctz7US4PM5wnXFykqlhFWuL+JBAkxOABir/uKfcGW5cuZWcnRdU8ECiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FQR7/7wz; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FQR7/7wz"
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-82f206f2b54so250634b3a.0
        for <linux-kselftest@vger.kernel.org>; Sat, 11 Apr 2026 23:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775973837; x=1776578637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=26xXQQRZJP4kKGBjp0Vx8Z52JjR/eF2ZNpcBSkc8AQA=;
        b=FQR7/7wz8C9jX+WPT3vsDAwHrbvrsPv04VydLgAyPA+dXWQ7sIlceVrPUlYvb+EkhX
         zdW0JJbWMtzgMe4vcd3eHbLfxREpuN/wwbFafhnUVJ4IyuGyVi+imUpghmlb7UBAF1C0
         ySrPYXOttWvcCMlMKGUXloOhGLXbTz0BEa3SQTSSfEAXgdKSdYhwj4Tf0FBEeOwVAzWx
         hDp8JREF+eN8IUJQL5kLpC2EnQ3kACK036y6J9DbrwenI9RkLV8fFPvEDe85USRM1e/W
         Bc9up1h17aLaE6nbUtCftRiXp2hhk1CFhu0DYj5P5kSK+OoDgUykI4V6AKWkKIoFZz1b
         GJrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775973837; x=1776578637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=26xXQQRZJP4kKGBjp0Vx8Z52JjR/eF2ZNpcBSkc8AQA=;
        b=BMRIu/feS9cr0vl+rex8By7JDI8WiF0uLWfO8ZMgIjErHi+hly4MUWcyuBqu/ijqW8
         KbneubSnEjQ2eC6HEh6mqMSEhfdILs5pXMyUdWkB9Y4H7IzKgSxuwJDPGLxstBL6ThOp
         d33Xg9rhZBhnpCAJoN/dOJx70cIBMyD/iq4EuBReayCCplpymvw+gfzoK4uEv6/xXwiz
         220rmhHLghUFqIibzAX6kU8zbkgcJq1ziOn6G1c6DFeY3DeHD3IgtSYh6z74AzC+MoQu
         kL7b/jLSNbYyHR1ac2uCaM5QRb2/UrFKqwpYpWtb/iodj66Khjmqs69Vd4E2gXiSblZm
         oHLA==
X-Forwarded-Encrypted: i=1; AJvYcCVCohw0VizpLqsAlYKHVHOWl+tupprGGuPcaWjqy23bTpRTgzczBbs1PziAiduxSkUlbiJ87tND9COAcdoSDPA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwE+buEdRfGa+SMS/B7KZsuYkpLVNVjSgP8YldJnrPI5m0ld9lU
	Vo0EPKXYzkwnX6d+nXb/UaFPliQTqdtRNE7stbeQHZRNkHPv58T15/I4
X-Gm-Gg: AeBDiet+1AwRKICxA3tRXVeYp3BcecpSfC8Az+aM0R5Ph1/TG5BP8SyAAPDuFwFDsYO
	/VVJdaJedhB0KEnPFEPQOyeKD9UGVclUETMDw4r2c62YeBfeF4Jm/uONlkOGwB2kLUnSHac3K3r
	axVtxLDm2uuDL/m13xZfVzsTCDu4MrM9EealmpacupCVDrmq90SVeHyTGgMnjYaqIh/Xjnro2t/
	FX3IcNNjpau0//rZ3xVGd/NWCoTO6v8Th4IRjvPS1upMt99pwCsaPPpaqnY54uXIEx95HoEG/wT
	Dm6p3bQTdeyveRDjb31lSe8fiSgGP16YPtwIed30uzizZO+uVQ9elbohcAae+ZcqWwBvXqZ9YKT
	KXf3foYmU6o2wIVwzzdsWxL16T3ygXL0Q0X3+fiF6Nui4YMXDrUP8Dom7Wr/4CMrEcN5RA44pk1
	f+00vGf+zQQOmNciIBXbZi
X-Received: by 2002:a05:6a00:b88:b0:82a:7dfd:9757 with SMTP id d2e1a72fcca58-82f0c1c8bc9mr9516041b3a.4.1775973837453;
        Sat, 11 Apr 2026 23:03:57 -0700 (PDT)
Received: from 7950hx ([103.173.155.241])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c4b251esm7072645b3a.37.2026.04.11.23.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 23:03:57 -0700 (PDT)
From: Menglong Dong <menglong8.dong@gmail.com>
X-Google-Original-From: Menglong Dong <dongml2@chinatelecom.cn>
To: ast@kernel.org
Cc: daniel@iogearbox.net,
	john.fastabend@gmail.com,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	memxor@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	shuah@kernel.org,
	emil@etsalapatis.com,
	leon.hwang@linux.dev,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf-next v3 0/3] bpf: add the missing fsession
Date: Sun, 12 Apr 2026 14:03:43 +0800
Message-ID: <20260412060346.142007-1-dongml2@chinatelecom.cn>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the missing fsession attach type to the BPF docs, verifier log and
bpftool.

Changes since v2:
- replace "FENTRY/FEXIT/FSESSION" with "Tracing" in the 1st patch
- v2: https://lore.kernel.org/all/20260408062109.386083-1-dongml2@chinatelecom.cn/

Changes since v1:
- add a missing FSESSION in bpf_check_attach_target() in the 1st patch
- v1: https://lore.kernel.org/all/20260408031416.266229-1-dongml2@chinatelecom.cn/

Menglong Dong (3):
  bpf: add missing fsession to the verifier log
  docs/bpf: add missing fsession attach type to docs
  bpftool: add missing fsession to the usage and docs of bpftool

 Documentation/bpf/drgn.rst                          |  4 ++--
 Documentation/bpf/libbpf/program_types.rst          |  4 ++++
 kernel/bpf/verifier.c                               | 10 +++++-----
 tools/bpf/bpftool/Documentation/bpftool-prog.rst    |  2 +-
 tools/bpf/bpftool/bash-completion/bpftool           |  2 +-
 tools/bpf/bpftool/prog.c                            |  2 +-
 tools/testing/selftests/bpf/prog_tests/exceptions.c |  8 ++++----
 tools/testing/selftests/bpf/verifier/sleepable.c    |  2 +-
 8 files changed, 19 insertions(+), 15 deletions(-)

-- 
2.53.0

