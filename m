Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.144
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793613011;
	b=oO/3XrccJKet+jBJsK5NeUr8a78f7q3Gpjw1oP6gGw0agJDNESZ6tejorq234/eQzbFB
	 TtotHr/pIUuUDS2EP3Fe6F9d0BzaOPsGWhK5QTFEhXSiSjaCIc5dEUIK7L3XnBMOaUPyr
	 OdrEHLHwoSfGSDn1L6DtvvqKBz42LMMN3wLVuDFOjrwWYVuDGnwAvMcdNK4yywGy7QtPc
	 3vHVdz83RBMBO7Zu/F9ZXaEYFjmjecA8f9IIfpsFsWQgk2GVYQ9AuCLn0Z08KzNIGLYht
	 epeja6lXYOa6IVc0EYJ0PM5iR1accHJbvh7ainmbf8IohNN8XD6bLY9+FiMD7tlyAsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793613011;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=f5URTLTHkezdfIPAUekuK4GOOa0eu2kLfxfk3hHSB1w=;
	b=WilwaS/9s29QLbwgZ4wWSdWzD2Biuc856UxPP1A0VSUAzXXAiLATGhi1jL0zO3y0xGbI
	 AcTts/G7I/AEvCZkSsQ4pLlomhnxo3Lll2J1S6xWMs30rPGiO3xW9OyScZBxWlgSwtI5l
	 IWllkqsGWnCu5g9L0jJr0REe30cP2ZGUHMAeJRJb/tZT8ocNSReYFdoba9ThAzojbz1IZ
	 mdHlAW7r7ovquMdsmqpJs4MaxmWVNmHrZrCe19V4+heCbxKratOWa76uh5mpz8rqOGUjn
	 jIgHZM7EEXShGGdFUcwJG+XsitNfg4zp9Eh2xxgYd+s1LoeiN9ZCCGp3DQxkMLxFEoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=X7Od6dlw;
	arc=none smtp.remote-ip=91.218.175.144
Received: from mta0.migadu.com (out-144.mta0.migadu.com [91.218.175.144])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5644606A334
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 09:50:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5644606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=X7Od6dlw
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=AlF6wv067wfiUKWedypTH6kE/s95gBM2cGVev28xcqE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793613008; v=1; x=1794217808;
 b=X7Od6dlwn4SvQM4wKLZagC0Gp3NyD1YWti9K3qTjyNeVZns7AcJxa70zdDqJ7ecy2sfmQdaU
 nFAM1Huyqzb8c5ddFw4xvaEksVb8lQmw+KzWmsSFOARzyIr7mj0LTuN5E4GXqhh7wmeKf+fL+vf
 YQn7hYpQRDNtgwnTbbr71B9k=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8e8bba0ed869d819;
	Mon, 02 Nov 2026 09:50:08 +0000
X-Mizu-Trace-ID: 8e8bba0ed869d819
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: shuah@kernel.org,
	linux-kselftest@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	tabba@google.com,
	will@kernel.org
Subject: [PATCH] selftests: breakpoints: Ignore breakpoint_test_arm64
Date: Mon,  2 Nov 2026 09:50:03 +0000
Message-ID: <20261102095003.2940560-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The arm64 build target was added without a matching .gitignore entry,
so a build leaves breakpoint_test_arm64 showing up as untracked.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 tools/testing/selftests/breakpoints/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/breakpoints/.gitignore b/tools/testing/selftests/breakpoints/.gitignore
index def2e97dab9a9..c5fbc4a48229c 100644
--- a/tools/testing/selftests/breakpoints/.gitignore
+++ b/tools/testing/selftests/breakpoints/.gitignore
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 breakpoint_test
+breakpoint_test_arm64
 step_after_suspend_test
-- 
2.47.3

