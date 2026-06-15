Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02533305698
	for <linux-kselftest@vger.kernel.org>; Mon, 15 Jun 2026 07:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781509165; cv=none; b=PCTmc4dWt9f2mg2TsciOYVyrZkP+pQ6KKucflqUcR3s32JsKSqLxpwxYlqmLiVSe1QOmgIPuK9wX3teZ5veN8DW0U0D29/Fp0VeJgqQIuZnB6v5fU/ajVWAGlpA4wyXa1O69OIA7SpdDvINfbOa7Y1VbK0iMW+xAw70B09h1LXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781509165; c=relaxed/simple;
	bh=XsOF+ksD2Ssq1KVAnWleC9rUm1HJ7I7wyrO6hTFxv5U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QIwwtAupYonG9d75CqBwV71Qh1+L6xO32uu6I9UyLEa4Blpo5ef8k8cy5RR6U7ktraU47u/nEVHVSJO366s7GZIxH0ELbHrR8xOgmfxpT8U1jrUaexfOpWUBftksFKj02g0NS2j67WA/Szjku6z7jmnhG5T6tMpWyGGVUg6Kgk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ou9FZkhX; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ou9FZkhX"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2c0c1e0d00bso27082055ad.0
        for <linux-kselftest@vger.kernel.org>; Mon, 15 Jun 2026 00:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781509163; x=1782113963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ErjRsxDLnQwk8o4LMq0j/er9sDOr3c+Mh91+omcleio=;
        b=ou9FZkhXdwrQMtKlDdLl9weyextM3HShTTbiHKCXsuft3hhnu4GBhe5alVx812AhvQ
         0q/pjNMqys+8jc64h2ltQCKGjq4iiVaHm1g1Xeoxmv6ur9B4MHwFfvIuatx9GJFeVc9j
         pak9EAcsb1PLNLefxHUFrrh7yMPfb8O4+uaXUBenvkC7HMfdwjlZeWwJDZJE6D84jlZ7
         kPfN6wvos9OkfDIAAALboecmEIQ79DanrYmCTgRstIvVR+ownQ9m5bvbrfisQLoSsVLl
         zHSmkiRj4g/avnnDTAnE35B08VdtibFSnVFqaMB58eAiRbjnYygH0zDlf51GiDWxAnW2
         lLtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781509163; x=1782113963;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ErjRsxDLnQwk8o4LMq0j/er9sDOr3c+Mh91+omcleio=;
        b=Y5mEjn9z2ZwF2Z8VxjhnyPegQCWR8K3lv5CT7pf9gbRY5SejezG/T4x5lgu0cvzzng
         iiGwHkA8JWKb3xO3609i/bWzDIjZEkIosKMA2nkrDolsYYh5pNUk9w62UEZcleeT7pho
         dFlC0I60x3khiFywHA0nrfnJddSn7/Lk/OuEmzRNxstiIh1bBRU5EI10Wqo7jVFZLGng
         DYkmOAMx7Pr8jr3qNBJPc2CRIbrZI8THazhLo8FbDHq+yzqcYWtNOtq+PWF2Ut4k/41S
         KbaD4fO7dHxWZ92hw2zHI7k8I7ftfYQE1raYLBHh+NNFZDqTVNyY6rEersjSSyCyoHme
         ED+A==
X-Forwarded-Encrypted: i=1; AFNElJ8IbzI2x14OrTIP/zuf1ICrnBJGt8vQ/g+2LQ3aHKFZ329s/y0jwDM2iQAcFDJ265ET+A+Kz50XNKmhqtRD5mc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy++XysayYYdY206w3HKvq8z9vpNHh6RXNSUk3gyq+QJn7G4IDH
	1cqVVcb+1MGfb84/wYyNb+3SrjL+L2I/E1W5waDOMvzgD583KWJO7wVm
X-Gm-Gg: Acq92OFpPDsfGiXzDzCXeF46B2BhivxTlq102bcgd4zDtr3tpn7vA9YSQVeJx0tzRhS
	PrAKVNclVQrsMTt3vzJzQ1FYcvWCv+DEqd9ivopvOiMygdMBGmargAOcA5L709ab7ywpSbtmAiW
	2dhZDOmjOhq4q2F4Z38/e9I9TPb++aJIILihErnKOWMp6xv9xRVD7TBzFj4grWZlqut5bbF51G5
	BYT7s9yqm6wF4IHpzhX0Z2q4W6lakTgcBwffI7vir4zxuzYKkxvJW1SWR6jTXYmPFnCR9HK9Gzt
	NPmMyxnEOyxAESzSkaqPG2w9rZkIuBqknzQhjqtag/AnmvVsnhksyZNLlEznKcTMlypxNtbSXjU
	qHB3B8QPyB9ytX7xaFB8zosXR/Ekqleuopjr5ksokfW6wftfdSLT5mFxlvN7k1PGwpSUCqbk5TC
	sr/uy0c9OM3J/wnmGK9NlpTyvpY5N+EI9JXs+b5u9utFpBIj64X2LnygRH11vEB/4=
X-Received: by 2002:a17:902:c401:b0:2c2:27be:39aa with SMTP id d9443c01a7336-2c411d7b1efmr139013815ad.17.1781509163251;
        Mon, 15 Jun 2026 00:39:23 -0700 (PDT)
Received: from localhost.localdomain ([2a12:a304:100::209f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c43307a259sm91271345ad.68.2026.06.15.00.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 00:39:22 -0700 (PDT)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: bpf@vger.kernel.org
Cc: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	memxor@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	shuah@kernel.org,
	paul.chaignon@gmail.com,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH bpf 0/2] Fix partial copy of non-linear skb test_run output
Date: Mon, 15 Jun 2026 15:38:54 +0800
Message-ID: <20260615073856.152479-1-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes BPF_PROG_TEST_RUN copy-out handling for non-linear skbs
when userspace provides a short data_out buffer.

Patch 1 fixes bpf_test_finish() to compute the skb linear head copy length
from the skb layout instead of deriving it from the clamped copy size.

Patch 2 adds a selftest covering a non-linear skb with a short data_out
buffer. The test checks that test_run returns -ENOSPC, reports the full
packet length through data_size_out, and copies the packet prefix into
data_out.

Tested with:

./test_progs -t skb_load_bytes
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED

./test_progs -t skb_load_bytes -v
test_nonlinear_data_out_partial:PASS:nonlinear_partial_err
test_nonlinear_data_out_partial:PASS:nonlinear_partial_data_size_out
test_nonlinear_data_out_partial:PASS:nonlinear_partial_data_out
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED

./test_progs -t skb
Summary: 14/92 PASSED, 0 SKIPPED, 0 FAILED

Sun Jian (2):
  bpf: Fix partial copy of non-linear skb test_run output
  selftests/bpf: Cover partial copy of non-linear skb test_run output

 net/bpf/test_run.c                            | 11 +++---
 .../selftests/bpf/prog_tests/skb_load_bytes.c | 35 +++++++++++++++++++
 2 files changed, 39 insertions(+), 7 deletions(-)

-- 
2.43.0

