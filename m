Received: from mta1.migadu.com (out-138.mta1.migadu.com [95.215.58.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F136B3B42F1
	for <linux-kselftest@vger.kernel.org>; Wed,  9 Sep 2026 07:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788937449; cv=none; b=SGWRIANDvdHARG+IT8oXM4jI8C0xbDfK8x6G1Hqiuvz4MUktiIrLL2tM7D1O+c4KCegVRO7CzFnYBTt3ndj7hB5BK8zwrMkO9SwDUwq6nh2gkVj1GMi7RBZBEGV1t/Kz2U3PTAslSe1auFfNXJ+Qw1GqudVIrA3imPiBSfF7Uh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788937449; c=relaxed/simple;
	bh=SUM0U1/OvZRncgMDqenXn6uLiikLIm64tbFJCtzaLpg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lzmLjXF+klCbliHx8k2c9cZxA9CXiXLg9fXj7j1iY0ZnOdIIiu95BCHyzYTXeeAc7m8qGwxlb06qvLFr+dAjDMwl0sPeI5jHYPgy7hv/7StZGill4g/MRjle8o5mvcnY0q3f+aluwpUwFy3jTeeTRvVSeluJnNzDF8GU7rBxj9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jazioOe9; arc=none smtp.client-ip=95.215.58.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jazioOe9"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=SUM0U1/OvZRncgMDqenXn6uLiikLIm64tbFJCtzaLpg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788937442; v=1; x=1789542242;
 b=jazioOe9RWq13qIxmcMFnqA5IPae3CuIThDS0TcFTSS8hESDMsEi8vpgZqwx/Ri4/QCDwbd9
 KiJClUTG7uuVeh4x/pOcJtyzAkG3Pi5uHVSHOzO2H7QCGhtHxE55Ke7fczrczMqYZ+3RuCIYY95
 s1VDXlb4k9qatoZ1/gjMLqJg=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 54304dfd1b75a60a;
	Wed, 09 Sep 2026 07:04:02 +0000
X-Mizu-Trace-ID: 54304dfd1b75a60a
X-Migadu-Flow: FLOW_OUT
From: Xuanqiang Luo <xuanqiang.luo@linux.dev>
To: netdev@vger.kernel.org
Cc: jhs@mojatatu.com,
	jiri@resnulli.us,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xuanqiang Luo <luoxuanqiang@kylinos.cn>
Subject: [PATCH net v1 0/2] net/sched: fix action batch failure cleanup
Date: Wed,  9 Sep 2026 15:03:34 +0800
Message-ID: <20260909070336.32979-1-xuanqiang.luo@linux.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Xuanqiang Luo <luoxuanqiang@kylinos.cn>

Failed batched RTM_NEWACTION requests can leak action references and
reserved IDR indices when cleanup encounters a filter-bound action.

Patch 1 fixes the failure cleanup.

Patch 2 adds tc-testing regression coverage.

Failure reproduction (key output excerpts):

  python3 tdc.py -f tc-tests/actions/gact-rollback.json

not ok 1 e3b1 - Failed action batch releases a bound action reference
	Could not match regex pattern. Verify command output:
[...]
	 index 1 ref 3 bind 1

not ok 2 e3b2 - Failed action batch releases entries after a bound action
	Command exited with 255, expected 0
RTNETLINK answers: Resource temporarily unavailable
We have an error talking to the kernel

not ok 3 e3b3 - Failed action batch releases repeated references to a bound action
	Could not match regex pattern. Verify command output:
[...]
	 index 1 ref 4 bind 1

Xuanqiang Luo (2):
  net/sched: act_api: release all action references on NEWACTION failure
  selftests: tc-testing: test action batch failure cleanup

 net/sched/act_api.c                           |  9 +--
 .../tc-tests/actions/gact-rollback.json       | 78 +++++++++++++++++++
 2 files changed, 80 insertions(+), 7 deletions(-)
 create mode 100644 tools/testing/selftests/tc-testing/tc-tests/actions/gact-rollback.json


base-commit: a401a9d547c50ef34db1088cc1fb9a201a7af657
-- 
2.43.0

