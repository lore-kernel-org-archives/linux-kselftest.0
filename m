Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DC93016F5;
	Sat, 27 Jun 2026 08:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782548983; cv=none; b=bdg2Zm1i67NwF8K8oW8BiiEdA7eoGi0CzlciYzkXo+VONcQz/biZSgQB6nuqpg2CVBieJeckN7kgw5eTE8U8/slKpq4T4gZ64QA1da4TivYyUt3BKq1PwzWsfclUX7HEmSl4uK8SyhoZTNq/txLxjd/fxhbX/gXWsjwVdQBRClY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782548983; c=relaxed/simple;
	bh=s7RhtMtbvIvIy5+/t84IB6bqeV2ZahRLNRigWzTvjJE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I+t4Q2dXJXw2e+OAg93symZeCC0x3dhKw24LZT2z2zf4+vG4RKbYKHlzyY8IhWpx25xmpqsUDen9bf1mnD53i0BYQoPOOKYdMhwkX7p+fVve3E6rcZmVBC3/ovNeq0yZedi/C16bOtGhBYPzYZp0ZFZ3LRaHnGHYS6jgnOMmUmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 5FBF31CE6E0; Sat, 27 Jun 2026 16:29:33 +0800 (AWST)
X-Spam-Level: 
Received: from sparky.lan (unknown [IPv6:2001:8003:8810:ea00::9c4])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 22C8D1CC62B;
	Sat, 27 Jun 2026 16:29:31 +0800 (AWST)
From: David Gow <david@davidgow.net>
To: Brendan Higgins <brendan.higgins@linux.dev>,
	Rae Moar <raemoar63@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: David Gow <david@davidgow.net>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 1/2] Documentation: kunit: Test Kconfig entries shouldn't select other configs
Date: Sat, 27 Jun 2026 16:29:19 +0800
Message-ID: <20260627082921.1709181-1-david@davidgow.net>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a note to the Kconfig section of style.rst to use 'depends on' rather
than 'selects' for dependencies, as this can cause users of
CONFIG_KUNIT_ALL_TESTS to suddenly grow unexpected dependencies.

Signed-off-by: David Gow <david@davidgow.net>
---
 Documentation/dev-tools/kunit/style.rst | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/dev-tools/kunit/style.rst b/Documentation/dev-tools/kunit/style.rst
index eac81a714a29..449f9f816fc7 100644
--- a/Documentation/dev-tools/kunit/style.rst
+++ b/Documentation/dev-tools/kunit/style.rst
@@ -164,9 +164,10 @@ This Kconfig entry must:
 * be visible only if ``CONFIG_KUNIT_ALL_TESTS`` is not enabled.
 * have a default value of ``CONFIG_KUNIT_ALL_TESTS``.
 * have a brief description of KUnit in the help text.
-
-If we are not able to meet above conditions (for example, the test is unable to
-be built as a module), Kconfig entries for tests should be tristate.
+* depend on the feature being tested, rather than selecting it (so that
+  enabling ``CONFIG_KUNIT_ALL_TESTS`` does not enable unrelated functionality).
+* be ``tristate``, unless there is a specific reason that the test cannot be
+  built as a module.
 
 For example, a Kconfig entry might look like:
 
-- 
2.54.0

