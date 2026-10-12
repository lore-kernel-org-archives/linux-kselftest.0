Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DAB361960;
	Mon, 12 Oct 2026 22:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791845898; cv=none; b=SudSveo4+hLUByzvMNCV4QUp5M8dD3h6ljqJ6emrxoaU/SIU7iPG0LDGXHi926u4OJZkbUVZMV9DopJJxo83NB4y4Bk1NM+trNg+C2EGYJg2kkMq6oWHa34ZLFt13dkttx1s5nAAoWSogNV5erzpaBF4hy26Kdn341Uih9JcERk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791845898; c=relaxed/simple;
	bh=MkJxUZyxF6EQmqf6ecfPjJHGv2hu4k/RLi3x//zkisI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TlD4rL3u9+0oWBUta3xTxjgDVZzVeCIKmRGUaj9qOxjijrqnfs/NCstsaHEJF1W6p7YAp+zq9ItyfDOIXLluMV0BCT1H0jc6IEBASTmUcbZCsKk3zTVnVHmESgMGhZhOCXJ9bZPmrhYyIpV/vQbKF/JO/3cgtXmb7rBBto7NeDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g/pWXHnt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g/pWXHnt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 895D01F0089B;
	Mon, 12 Oct 2026 22:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791845896;
	bh=/D8rX1p1MdB3oKoXSpIAX73524+wWgj9TVMkaY9+CHU=;
	h=From:Date:Subject:To:Cc;
	b=g/pWXHntkCo7g739lZGVR35dYg+wO53i+/uT2s76TIx4HHUJAjle14E9DSpUAYTGx
	 CaYm+T+QUcYGb6Anooa1j9KVZWc6Hh3MLNkFmicGBp1kzO73Pz7SaRUnuWpndIQ1nR
	 u/EaqSuymChA+fctrK8EjhTGBH0GI/Me2IzW7pu7AH244sFs1mTdZyhaYDtBeF/L9S
	 EeHuqHDBSaq58h/N1g1wHBYZiyZMo/LenTi2W7swAovHfmUQ56nDBCpmyg2k/xyPIW
	 fu/8fmmZveNgW3vqjiHZLm47Hj+qiVK5J0yzpU2asPo+/VBym8+1qB1l/0e0KcZVgc
	 v7My5q1azDIgA==
From: Mark <broonie@kernel.org>
Date: Mon, 12 Oct 2026 23:55:53 +0100
Subject: [PATCH] lib/tests: util_macros: Drop the '.' from the KUnit suite
 name
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-kunit-util-macros-name-v1-1-810b401baeb0@kernel.org>
X-B4-Tracking: v=1; b=H4sIAHllzWoC/yXMQQrCMBBA0auUWTuQBFHqVcRFTGbsVJtKJhGh9
 O6mdvkW/y+glIUULt0CmT6iMqcGe+ggDD49CCU2gzPuZI11+KxJCtYiL5x8yLNi8hPhmY+9iT0
 b5ggtfmdi+f7H19turfeRQtlusK4/jhcrdHoAAAA=
X-Change-ID: 20261012-kunit-util-macros-name-7f490d9f0ffd
To: Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1966; i=broonie@kernel.org;
 h=from:subject:message-id; bh=MkJxUZyxF6EQmqf6ecfPjJHGv2hu4k/RLi3x//zkisI=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLOprEWZhY9eC8cHXpJkunwx6jGZTf5/O7KzjW5UrLkh
 X3ZplrrjlIWBjEuBlkxRZa4LO6X9SWv1/AdXNgGM4eVCWQIAxenAExEOYORYeaWu1yb5v8VWyT/
 a3P7Jtu01QFqma89hB0Pvzrb8ni95neG/0GHzzl328a9KljmL7Qn1FOneob1tZc5RWbT34gcUuj
 6xgwA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The util_macros KUnit suite is named "util_macros.h". KUnit test names
are formed as "<suite>.<test>" and a '.' in the suite name makes them
ambiguous, which breaks every consumer that splits on it:

 - kunit.filter_glob= splits on the first '.', so
   kunit.filter_glob=util_macros.h is parsed as suite "util_macros" with
   test glob "h" and matches nothing.

 - kunit.py's --list_tests output parser only accepts "<suite>.<test>"
   names with a single '.', so the suite's tests are dropped from the
   list and the suite name line "util_macros.h" is mistaken for a test
   called "h" in suite "util_macros".

 - As a result kunit.py --run_isolated=suite boots a kernel with
   kunit.filter_glob=util_macros, which runs nothing and reports an
   error, while the suite's actual tests are never run.

Rename the suite to "util_macros" to match the other lib/tests suites.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Cc: linux-kernel@vger.kernel.org
To: Brendan Higgins <brendan.higgins@linux.dev>
To: David Gow <david@davidgow.net>
To: Rae Moar <raemoar63@gmail.com>
To: linux-kselftest@vger.kernel.org
To: kunit-dev@googlegroups.com
---
 lib/tests/util_macros_kunit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/tests/util_macros_kunit.c b/lib/tests/util_macros_kunit.c
index 94cc9f0de50a..73652a6872c3 100644
--- a/lib/tests/util_macros_kunit.c
+++ b/lib/tests/util_macros_kunit.c
@@ -229,7 +229,7 @@ static struct kunit_case __refdata util_macros_test_cases[] = {
 };
 
 static struct kunit_suite util_macros_test_suite = {
-	.name = "util_macros.h",
+	.name = "util_macros",
 	.test_cases = util_macros_test_cases,
 };
 

---
base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
change-id: 20261012-kunit-util-macros-name-7f490d9f0ffd

Best regards,
--  
Mark Brown <broonie@kernel.org>

