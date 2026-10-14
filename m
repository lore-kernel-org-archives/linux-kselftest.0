Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293053E763E;
	Wed, 14 Oct 2026 20:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792008093; cv=none; b=VB5QSSgGhjtjGINp4WB23QOtgtdXSFcNwNYaeZixXhlTdh0Sz+StqbtkRAvJGT8mu/2UFt/egh9hiEzJOeMULDm4U8hOuYM0auv8Tt+UrRWlmr76zMh2x2LdViwgW+ucqZGe6JEdStjDEhDMxY8M47cUMADepgIU85dAC/UYtdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792008093; c=relaxed/simple;
	bh=KzY2bvVHdnK8o0jEdBR3mdF0zL8Lm0nOaXsKgcf+HE4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jhRfOp0Qq2dOlPLYuVPCU9gfXv1pzmCkdBhOkPFJaaFdX/q1+9ay4aLgk9j5ZUj7lw+JCfLDiTor8xVHT2xKoKo9B4SDPjBtyrsucaRmYw+hQdWYXf+BDs7TySMx0ilrx/auxsi4E8WiakV9VjHWW+1Qr5mI1NvKvO3hpuzrHLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RYPbz+Ca; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RYPbz+Ca"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A4DA1F000C7;
	Wed, 14 Oct 2026 20:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792008092;
	bh=RpCyM3yYQCSRwMwZTxO0x/ozF1soHumH44biXgdIoZ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RYPbz+Ca2GA2jRHo7QQrKr22Kqpy4/HmAXNRYae95XNA1dgkLJidQVzL5q4L7YiC/
	 8/4Q1cILBxWJmSJvGn5NuOGwT9S9HJCasqBG124Jn+WUobEthtRsYH0mAfMT6ktKm5
	 zoGrNgfP7l8MqfubdWHFOJohmUgjrzSvXy8g6XD2OuFmSdgSaD+9MD8yLGAB7E+ix+
	 3GquwJl+KChzKnDGiAdpxe4tumL6WDhHJvjuXikjJbwsv3HLjtU3bbNT+VwqG+Peax
	 kGsxynfJ6LffM1mL20IWq5r2cOIojO6RaHSJz/qqmkFvreOTok2zY4szzsI89qSqee
	 nxi9E7xwdCVgg==
From: Sasha Levin <sashal@kernel.org>
To: Shuah Khan <shuah@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>,
	Ivan Orlov <ivan.orlov0322@gmail.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] selftests/prctl: skip the anonymous VMA naming test when unsupported
Date: Wed, 14 Oct 2026 16:01:24 -0400
Message-ID: <20261014200127.1363472-3-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261014200127.1363472-1-sashal@kernel.org>
References: <20261014200127.1363472-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PR_SET_VMA_ANON_NAME is only implemented when CONFIG_ANON_VMA_NAME is
enabled. Without it, set_anon_vma_name() returns -EINVAL for every
request, so set-anon-vma-name-test reports a failure on kernels that
simply do not provide the feature:

  # renaming: Expected rename_vma(...) (-22) >= 0
  not ok 1 vma.renaming

Probe the interface in the fixture setup by clearing the name of the
anonymous mapping, which succeeds whenever the feature is available,
and skip the test when the kernel rejects the request with EINVAL.

Fixes: 5290586186d2 ("selftests: prctl: Add new prctl test for PR_SET_VMA action")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/testing/selftests/prctl/set-anon-vma-name-test.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/prctl/set-anon-vma-name-test.c b/tools/testing/selftests/prctl/set-anon-vma-name-test.c
index 5f9589534da8e..d3854ccb2a7a3 100644
--- a/tools/testing/selftests/prctl/set-anon-vma-name-test.c
+++ b/tools/testing/selftests/prctl/set-anon-vma-name-test.c
@@ -93,6 +93,9 @@ FIXTURE_SETUP(vma) {
 					MAP_PRIVATE, self->fd_not_anon, 0);
 	ASSERT_NE(self->ptr_not_anon, MAP_FAILED);
 	close(self->fd_not_anon);
+
+	if (rename_vma((unsigned long)self->ptr_anon, AREA_SIZE, NULL) == -EINVAL)
+		SKIP(return, "PR_SET_VMA_ANON_NAME is not supported");
 }
 
 FIXTURE_TEARDOWN(vma) {
-- 
2.53.0

