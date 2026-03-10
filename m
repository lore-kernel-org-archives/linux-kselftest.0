Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40593A4F23;
	Tue, 10 Mar 2026 03:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773112463; cv=none; b=l0Zd1KV+uQhsud0NwyGXrv6A4bXJrOA6c48UsT83Fpor0h65qE6i2UfF2z+tpsj/rM89ZiWmTpLuoIA/X+xDSjlI4HHNN9QkJsT0/NZ+B4s3saawPUo899YtUbWj1IdUJRuyRyRdPiT5yUejYh9G6gHqznfEq0nGz97OCY2xLFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773112463; c=relaxed/simple;
	bh=mftVs2kawT2F3YStSADIo0sIzbTVKbdnE7Tzf5pvOZw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=WiEORjlhgVa7RU6Y/dqpilVgOUsYgPCD+vS3TAYMyugYLhNE1cioQLLUk863wacX30PlvVwIubhOdAOCYTBo3gWvOE2vXuGrQSHoMy9oKceQOVbZ9eThyviz97ltiWUDIc2O4I1Fhjx0kVd7/edUUWTy62WVIkGHhCMgJ2i0O3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xku8+QJg; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xku8+QJg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773112462; x=1804648462;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mftVs2kawT2F3YStSADIo0sIzbTVKbdnE7Tzf5pvOZw=;
  b=Xku8+QJgxbz33qhozj6cSBrrqjoWkwTNXVhPvyzmlnhTbVed6dmosfkF
   PANy+W0uSla5at6YfYPEVp/Denc68ZSIVw1Civvxvgpvcpy0prt8S7J0D
   7o+OPTtc7S+I9RiQZ9KBZG09Iy6seKt4Q/8YHy+dRDQoYqrjMqupMtXBX
   XXCf53q3hazUZnNGda9ZgIAdwqcjYEVV1ZWxy5uxMv1uk9SQLmfAYbI3I
   NAiUZ5lUYwbhpIQYPIRPM5A5Uuz7wbRPF/EMpfIdzauFQtvqcnTxhY06Z
   xt53e5uou8eZi9CFH13xdv23IghVsGDTkh2qRdSuM/AeORIW7MJTuGgm/
   w==;
X-CSE-ConnectionGUID: zht8E8LXSCOiJU8Hkw+kUQ==
X-CSE-MsgGUID: Vp860HZdQW6vxPEg+Ge2Iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="74027823"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="74027823"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 20:14:21 -0700
X-CSE-ConnectionGUID: UE5E/jRGQ06DRe8mQwK4VQ==
X-CSE-MsgGUID: TC3QaVsYQxy3/9/ZGCNoDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="224651700"
Received: from ly-workstation.sh.intel.com ([10.239.182.64])
  by fmviesa005.fm.intel.com with ESMTP; 09 Mar 2026 20:14:18 -0700
From: Yi Lai <yi1.lai@intel.com>
To: brauner@kernel.org,
	shuah@kernel.org,
	areber@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	yi1.lai@intel.com,
	yi1.lai@linux.intel.com
Subject: [PATCH] selftests/clone3: Fix capability dropping by using standard libcap API
Date: Tue, 10 Mar 2026 11:14:15 +0800
Message-ID: <20260310031415.151531-1-yi1.lai@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clone3_cap_checkpoint_restore.c selftest defined its own 'struct
libcap' to manually cast and manipulate the internal memory layout of
the opaque 'cap_t' type.

Starting with libcap v2.60 (commit aca076443591 "Make cap_t operations
thread safe"), a '__u8 mutex' was added to the beginning of the internal
'struct _cap_struct'. This structural shift breaks the selftest's custom
struct layout assumptions, causing capability corruption and leading to
failures during test execution.

Fix this by removing the custom struct definition and use the standard
cap_set_flag() API.

Fixes: 1d27a0be16d6 ("selftests: add clone3() CAP_CHECKPOINT_RESTORE test")
Signed-off-by: Yi Lai <yi1.lai@intel.com>
---
 .../clone3/clone3_cap_checkpoint_restore.c    | 20 ++++++-------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/tools/testing/selftests/clone3/clone3_cap_checkpoint_restore.c b/tools/testing/selftests/clone3/clone3_cap_checkpoint_restore.c
index e82281efa273..e9dbb95181ee 100644
--- a/tools/testing/selftests/clone3/clone3_cap_checkpoint_restore.c
+++ b/tools/testing/selftests/clone3/clone3_cap_checkpoint_restore.c
@@ -87,15 +87,13 @@ static int test_clone3_set_tid(struct __test_metadata *_metadata,
 	return ret;
 }
 
-struct libcap {
-	struct __user_cap_header_struct hdr;
-	struct __user_cap_data_struct data[2];
-};
+#ifndef CAP_CHECKPOINT_RESTORE
+#define CAP_CHECKPOINT_RESTORE 40
+#endif
 
 static int set_capability(void)
 {
-	cap_value_t cap_values[] = { CAP_SETUID, CAP_SETGID };
-	struct libcap *cap;
+	cap_value_t cap_values[] = { CAP_SETUID, CAP_SETGID, CAP_CHECKPOINT_RESTORE };
 	int ret = -1;
 	cap_t caps;
 
@@ -111,14 +109,8 @@ static int set_capability(void)
 		goto out;
 	}
 
-	cap_set_flag(caps, CAP_EFFECTIVE, 2, cap_values, CAP_SET);
-	cap_set_flag(caps, CAP_PERMITTED, 2, cap_values, CAP_SET);
-
-	cap = (struct libcap *) caps;
-
-	/* 40 -> CAP_CHECKPOINT_RESTORE */
-	cap->data[1].effective |= 1 << (40 - 32);
-	cap->data[1].permitted |= 1 << (40 - 32);
+	cap_set_flag(caps, CAP_EFFECTIVE, 3, cap_values, CAP_SET);
+	cap_set_flag(caps, CAP_PERMITTED, 3, cap_values, CAP_SET);
 
 	if (cap_set_proc(caps)) {
 		perror("cap_set_proc");
-- 
2.43.0

