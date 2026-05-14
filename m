Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5E9390990
	for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 22:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778797594; cv=none; b=c7N/Bss3O5uZWU/60sQCDa5hOxdWP4Bv/XsgYTRmyb6buUc8LSa2SuX9QP73nVo3MT2iD8YwJqF6HNsQlPiA19FrychdYFQrHnWyg1WS7c0VmGNGkBnxBK+UFG5AoqKFjXBkUbgRUVa6JkDltsyTWfJr+9sNJvsJ+qK2f+hYqrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778797594; c=relaxed/simple;
	bh=GAkvPl1aYT4/hWJx1lZpBcP6BmfygBZcILSUemmf7eg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=KmrfhuoOU1qL9T9z0Dhx+MceQfqBSm9/qe1z24idATDyCnd9hicxO70tR5YARFFvfvhMrh7jtTX9AjcL0AHNE3PuHd+UL2n0jbJav4ayTQrkoso1R2mDg1XjiqOB819/Pg7s6X8uyw8tGy2AfmPeyG6LTUgyYicKa+OsxO3pnQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=Z7EJXRiz; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="Z7EJXRiz"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-50e5eb0fabaso79717181cf.0
        for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 15:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1778797591; x=1779402391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jKaeCysGolB8wQTRAqT3H/WnxvkmBcYreAX7ZFxRMf8=;
        b=Z7EJXRizGTQG0w7jbSDW8cnih3io2BcOqced8INVfUW5q71/W21xjhGuE5oB7wydrG
         BYvHOzs5mZHKOGld5EBu52vMIn61QuwZ0thpsTy6aYEKnU6+jAGRvpYwJp5gxJtQSHWc
         oN2EoblHoVpnhGFh4NkUAj9oD5Wb9ftoMOtYx89x8+1w+e1vv3r+35VvZQRRjKWpz11u
         TKrzTmObTEan+0SCCmogxkaN4NfBE1dWZPF9Cb463Gc1IG8F+4UDm5fMnC0R2eD3i32s
         pP7/nQlTQRGCn3w3YFGVGZzhkxqpGcDEZOJUi1c5qFJajWwyNE+9GZf//UfsehRnpDPm
         b4qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778797591; x=1779402391;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jKaeCysGolB8wQTRAqT3H/WnxvkmBcYreAX7ZFxRMf8=;
        b=qJOSRKLzyNiYRAkMVu488qSLDuQU2zMB7kT0Fw9pnLI4dF/BBYyI67m2nFa8at0/U1
         UQkmoaIE/lIs025kaP6VqCoSkng+4ZqgHI7tjdtPfY43ZoBTgPyTsC8BrYLC9ZSMaEra
         8FcpXBctMqh/L+2DqjLq++83k8YTvlVDU/iOMolLpeI1QeDskuTaHhUzl0+QiMeEsB2Z
         23VkfMDU6+ASDWbvLYSzPmNydY+skBqQBlBMbejHhWkLOmyuOdHP6NAglmuaQc02ge00
         mV2GCcjD+SvIRk4w5PZGMlZoWN3u//s5Sxwho8OXPHDj9t2LVUmhJJbMX4do0kImMwkD
         2TAg==
X-Gm-Message-State: AOJu0Yyx/sgi3AP7mYaVrX0sIW8bCixh5rI6Xkk/ajbDEyjBWW1jeoAe
	VNeNXgHCsBarMFaXgkk2EHiG38SPwyy3fwPRke6wej/j89hnuVkfcpldTFAYxNQgPeH9Qwg1bD7
	fNf6cw3A=
X-Gm-Gg: Acq92OGlhl9AHzXjgSYSOaCJ8e8eDmxIuosfpPP812v08J/nn670q4g5y9nyAUXKAFf
	Wkq0ZYafWxri4rNkU+N6cfkjsKas8gnjgsSqigPMdaxvzhmVZacdGqkjZvvclll28p1NW8Mzkx+
	UK6HtsJxhxbUqwmq5loXZMIwbyNKDl+677CJFpZmSOFpH+TeZ5iS2Mh0f6D15C/bERhYv/wzKTq
	SU+19B75A5/GcMyuVJ2g2HVn3i42FMMUKhESZWNgxjypTwgmu00IATZtMFevYNaDWn/IK5sImEY
	JriePdX6Jp5QJx5ACI+yql5MI85fVjlScBOu9dgt7/Kk27mj57tVN2F8c6xGF5UU6uWvkdKh13+
	AgwyHcIkuFyk1kKOAoEzWhLvkEeXpV8WfyRuD0hYn1wz4LzGLwRCEf8j7V0zu8OZtnA1fTbrmOB
	bdQmcwVe2nfaRvorJr+7hoplM/Rdtuuo+UIfEt1AtQIFboqSTJ/jk=
X-Received: by 2002:a05:622a:6201:b0:50f:817c:2fe6 with SMTP id d75a77b69052e-51659fe0269mr20823261cf.2.1778797591454;
        Thu, 14 May 2026 15:26:31 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-516456ba92fsm28671901cf.9.2026.05.14.15.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 15:26:30 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	skhawaja@google.com,
	graf@amazon.com
Subject: [PATCH v2 00/10] liveupdate: Remove limits on the number of files and sessions
Date: Thu, 14 May 2026 22:26:18 +0000
Message-ID: <20260514222628.931312-1-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes the fixed limits on the number of files that can
be preserved within a single session, and the total number of sessions
managed by the Live Update Orchestrator.

The core of the change is a transition from single contiguous memory
blocks for metadata serialization to a chain of linked blocks. This
allows LUO to scale dynamically.

1.  ABI Evolution:
    - Introduced linked-block headers for both file and session
      serialization.
    - Bumped session ABI version to v4.

2.  Memory Management & Security:
    - Implemented a dynamic block allocation and reuse strategy. Blocks
      are allocated only when existing ones are exhausted and are reused
      during session/file removal cycles.
    - Introduced LUO_MAX_BLOCKS (10000) as a safeguard against stupid
      excessive allocations or corrupted cyclic lists during restore.

3.  Expanded Selftests:
    - Added new kexec-based tests verifying preservation of
      2000 sessions and 500 files per session.
    - Added self-tests for many sessions and many files management.

Changes v2:
   - Addressed all comments from Pratyush
   - Consolidated LUO state management from FDT into struct luo_ser.
   - Extracted luo_file_deserialize_one and luo_session_deserialize_one
     helpers to improve modularity, and later review (Pratyush).
   - Added dedicated luo_block.c for unified linked-block serialization
     and management.

Pasha Tatashin (10):
  liveupdate: centralize state management into struct luo_ser
  liveupdate: Extract luo_file_deserialize_one helper
  liveupdate: Extract luo_session_deserialize_one helper
  liveupdate: add support for linked-block serialization
  liveupdate: defer session block allocation and PA setting
  liveupdate: Remove limit on the number of sessions
  liveupdate: Remove limit on the number of files per session
  selftests/liveupdate: Test session and file limit removal
  selftests/liveupdate: Add stress-sessions kexec test
  selftests/liveupdate: Add stress-files kexec test

 Documentation/core-api/liveupdate.rst         |   8 +
 include/linux/kho/abi/luo.h                   | 140 +++----
 kernel/liveupdate/Makefile                    |   1 +
 kernel/liveupdate/luo_block.c                 | 388 ++++++++++++++++++
 kernel/liveupdate/luo_core.c                  |  57 ++-
 kernel/liveupdate/luo_file.c                  | 209 +++++-----
 kernel/liveupdate/luo_flb.c                   |  65 +--
 kernel/liveupdate/luo_internal.h              |  70 +++-
 kernel/liveupdate/luo_session.c               | 202 ++++-----
 tools/testing/selftests/liveupdate/Makefile   |   2 +
 .../testing/selftests/liveupdate/liveupdate.c |  75 ++++
 .../selftests/liveupdate/luo_stress_files.c   | 101 +++++
 .../liveupdate/luo_stress_sessions.c          | 102 +++++
 .../selftests/liveupdate/luo_test_utils.c     |  24 ++
 .../selftests/liveupdate/luo_test_utils.h     |   2 +
 15 files changed, 1068 insertions(+), 378 deletions(-)
 create mode 100644 kernel/liveupdate/luo_block.c
 create mode 100644 tools/testing/selftests/liveupdate/luo_stress_files.c
 create mode 100644 tools/testing/selftests/liveupdate/luo_stress_sessions.c


base-commit: 34e8f02817e31826e76bb2ded48bf28fe921f20b
-- 
2.53.0

