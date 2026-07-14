Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25AB53F4139
	for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 09:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784021946; cv=none; b=KHOchCq3Z03ckY8c9U+28vB6O+LMYVA4x9ewK3K3V+JE9tpnvNoSOiMCg+/qQPXJe0L3ADihaglzag+N0DrMSHrG5DxElcYrVevgY7qW5B18laArGNIi0Nl0srUTfclTsliy7cxAMB5k+rtsO3z9moYg1rFlhNaOo7ZxP+fC7MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784021946; c=relaxed/simple;
	bh=q4FOW+IFo8rnGMWf5TfWHsFPOMl10UYg6rO8gBqFIRs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QCTkNuyW/ZhkA1LAcykORmO0dTp4OB+aiHFftHL3jg7uQMrEQgpE2w9IHVgHHw9BBSVRtpOYgM74fpdJU/4CcwQ+XGwIAf/IIS5L/G7XTKjvQ2Mq4wOS6HKyq1pw10LOS2k5I6IuGJ8yshJT8gQmhQuTkyfT/UZ3iRtNxsfcdRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AF5yRpBG; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AF5yRpBG"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-51bf2479349so31479811cf.2
        for <linux-kselftest@vger.kernel.org>; Tue, 14 Jul 2026 02:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784021944; x=1784626744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GXSPexmHoqrmcExG3G7G81Rt80PKXXj/iAwlL6QDuik=;
        b=AF5yRpBGqDBrzxAT9CjKUakKG+Eh2RSmNJ8VFYIEieukDMkba+wFndrghQaz1J1Ha9
         jx7g+PCrOcXZNZ8DbwZrjmwAdRc/ap5+/3N+0FBBBu/aXPwpqyCJCFh9s/Ej+k7od10+
         nvZuUDQgcPxEckpLifjOMB4TwUToPtnm8DmBR3yO0Aex+bseVl2Z6lYJu9DPhdRBTsUV
         cW8NrAUe0U6oaPsnXnJo/2+uowmk05Lx1OQEMy7QeyiWixOhLh1pCNGxcy9vEQ+MNd8U
         O8dm4+o24zOsGwolthA5EJpV20vmNFPaesCq55nrKRTBaJwLqbnAINri6p51BYxuk/PU
         2FfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784021944; x=1784626744;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GXSPexmHoqrmcExG3G7G81Rt80PKXXj/iAwlL6QDuik=;
        b=cDFAWlrVnUzhTpQAvcFjzOCMzaGlUS7b69fIoon+/tuYh25OjxTpnuRodPrWQ9K4ae
         HTwIphp5Jzr6TfYyoXZUQ4oJEoDCjrpAbi3weasVpV+2JkKx7aftCJ92cZF1LELhKerQ
         lFgZOoqJb7TfJzd3yPv5tOD069PhtP6HksokeQsXovwRDONWftdyf3+X8fyWV/AgnG8S
         Cz29rwChGEm6cDNrGCtI5d5tjoCuHXyyzY/8qYjkYb9AU78JUqzl0VWufToRW6wiS5rD
         Ir71zvX45tuZ3iWtPTYgrFsHRrlPtF4cTPpCT2S13YV9tVJR46UU6nDOVBStakSynOiw
         Eq4A==
X-Forwarded-Encrypted: i=1; AHgh+RpUkBO5gcJf7l7IE0aed8mTLt7sovfgURJK7sMlPf+Hb++upobB4KD3dzA1sk2320N0Hrk0HG0mHxQ0hYvoUZE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9DGbShGfu2IcuhGxhyj/PDqH8X87IY96SHC8VuuyosUj26KAQ
	U0vOzYrqEzqEYdbTIOfmavDJza9yrMkf46h1G4A7peZcnnwC4ytZHeHp
X-Gm-Gg: AfdE7cms4NMnD2wve44+tgFe/V5kxtlezt5DMfpfM0LIfFycrgxoAEkYAkKGpXiAJ6v
	TIh1hnhU0S07gb+J/eMOaVSMuFfBbtgRmlA00viGzNrOED2X3FLQTIMcZ/7oE0IF+NRTYOyF36q
	iR+oZK0McQdDzdUcPG8LgO318BFoUYLRum0m5k+b9z4/40NcmHpu1uTutuiYQkKhWbL9ZeV27HF
	QIC4uGDObAPvYtj78U6BgYPK2jATNU8GFb/3X6vGwfqppfMkWNbdz4VD1IH3qcBOculCPUKtS8G
	rkH9aUZLIw6bTBEJTU/Nu9VkOyXYkCEMRUTBs/4sZr/AnLHcDCwsuWjbihrB0DtKzILEJ5u5SKc
	JNRRQwzUaiuVOZZPTMZ+OEShpl/8INlQNGmDMXo9AkYmqbu8KrQT7kDZMaQHE3qNOkZgBlqRtjZ
	DaGj8valMgDrlo955OpvhjHLF3WlwrFS7MuYGpFIfEsmprosGNfcyXrU94mHZX0V6HlJR5+/Zj
X-Received: by 2002:ac8:5a45:0:b0:51b:fb4f:afdc with SMTP id d75a77b69052e-51e42364132mr10365921cf.11.1784021943874;
        Tue, 14 Jul 2026 02:39:03 -0700 (PDT)
Received: from localhost.localdomain ([202.8.105.115])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51caacf2a75sm111460511cf.13.2026.07.14.02.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 02:39:03 -0700 (PDT)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Jiri Olsa <jolsa@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Shuah Khan <shuah@kernel.org>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Shung-Hsi Yu <shung-hsi.yu@suse.com>,
	Matt Mullins <mmullins@mmlx.us>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH bpf v5 0/2] bpf: Reject negative const offsets for buffer pointers
Date: Tue, 14 Jul 2026 02:38:44 -0700
Message-ID: <20260714093846.18159-1-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reject negative effective offsets for PTR_TO_TP_BUFFER and PTR_TO_BUF
accesses. Calculate the effective access start using signed arithmetic
to prevent unsigned access-end accounting from wrapping, and cover both
load-time rejection and the raw tracepoint writable attach-time path.

---

Changes in v5:

- Simplify __check_buffer_access() to reject a negative effective start
  after confirming that var_off is constant. Validate the combined
  offset instead of rejecting negative instruction offsets separately.
  Drop the duplicate BPF_MAX_VAR_OFF check because pointer arithmetic
  already bounds constant offsets, and remove the redundant size < 0
  check.
- Switch the raw tracepoint writable attach tests from nbd_send_request
  to bpf_testmod_test_writable_bare_tp, avoiding the NBD configuration
  dependency and its false-pass condition.
- Split the attach coverage into named subtests and require
  bpf_raw_tracepoint_open() to return -EINVAL.
- Add verifier coverage for a negative constant PTR_TO_BUF offset.

Changes in v4:

- Correct the Fixes tag to point to 022ac0750883, where pointer offsets
  were folded into reg->var_off.
- Drop the end > U32_MAX check, which is unreachable after bounding const
  var_off with BPF_MAX_VAR_OFF while keeping instruction offsets and
  access sizes bounded.

Changes in v3:

- Check constant var_off against +/-BPF_MAX_VAR_OFF before computing
  the effective access range, matching the existing verifier pointer
  offset convention.
- Keep explicit rejection of negative instruction offsets and keep
  bounded negative constant var_off valid when the effective offset is
  non-negative.

Changes in v2:

- Split the kernel fix and selftests into separate patches.
- Add an attach-time raw tracepoint writable test that exercises
  max_tp_access against nbd_send_request's writable size.
- Adjust selftest formatting to use the 100 character line width.

Tested:

- ./test_progs -v -t verifier_raw_tp_writable
- ./test_progs -v -t verifier_ptr_to_buf
- ./test_progs -v -t raw_tp_writable_reject_bad_access
- ./test_progs -v -t raw_tp_writable_test_run

v4: https://lore.kernel.org/bpf/20260708090151.151729-1-sun.jian.kdev@gmail.com/
v3: https://lore.kernel.org/bpf/20260708040715.116680-1-sun.jian.kdev@gmail.com/
v2: https://lore.kernel.org/bpf/20260707060804.93561-1-sun.jian.kdev@gmail.com/
v1: https://lore.kernel.org/bpf/20260703035137.109608-1-sun.jian.kdev@gmail.com/


Sun Jian (2):
  bpf: Reject negative const offsets for buffer pointers
  selftests/bpf: Cover negative buffer pointer offsets

 kernel/bpf/verifier.c                         | 31 ++++++----
 .../raw_tp_writable_reject_bad_access.c       | 57 +++++++++++++++++++
 .../raw_tp_writable_reject_nbd_invalid.c      | 43 --------------
 .../selftests/bpf/prog_tests/verifier.c       |  2 +
 .../selftests/bpf/progs/verifier_ptr_to_buf.c | 27 +++++++++
 .../bpf/progs/verifier_raw_tp_writable.c      | 16 ++++++
 6 files changed, 121 insertions(+), 55 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/raw_tp_writable_reject_bad_access.c
 delete mode 100644 tools/testing/selftests/bpf/prog_tests/raw_tp_writable_reject_nbd_invalid.c
 create mode 100644 tools/testing/selftests/bpf/progs/verifier_ptr_to_buf.c


base-commit: 7cbd0c4cebe4c9f678d15e6b9ba975e1155a107f
-- 
2.43.0

