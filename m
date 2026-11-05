Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793902483;
	b=UTHEmdyURlgA1rCsMvViMFNwMWm0XUgzQ7NhtCYpuMUQCgvltWdYUNd35neE7krP2rp/
	 Dcsnxateb03tgj5ZK/YSHBNQrkQ27bnUjsha9iayZad7jz84c7DB5hqeHtcNqI7VHQTc6
	 buwNkL0msy/a9vjfUGbjV8m5KKG11Txc8azfJupRmjXgL12nz+s9mimW6nek5AxSnhSma
	 kQ6jrRhQkARwBRr5OeHIvEVPbBjAKGV5VtNB+MbO0nI6pHF0Md8CTacMBG9UHvYQrZpWP
	 u+suD9faBPkNBXxLviF02r1D1IDVv89y2IEYKsiMlM4uJIeQ2vqS7edbmKFG3lbKdkQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793902483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:Received:From:In-Reply-To:References:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=k69fxDmtmmF6Y3dZct9TP630KoCBBlkteFGCi7Y2r6o=;
	b=XhGapYC5CtvFLQLfiYctNv/GynkjgnR5bv1+zywK6E8VMDvIzhgpV/aX3MpHVYbmG1/U
	 OmvEA36w1H01n+xkBGDqJslbSGJB9MSiWWusLdmSDYDG+IAeJZImtJ/zzcEYZlPcSD3Af
	 b+1O+NtT/fSsnJdh2OJk95WcSMME3qjqIGLJtJMdK8Kn/8GIA4M/gZwOvAH5mwRMk5wNM
	 Hlqxv9In6nF6sdCsI31c+46MYeamR41COZZLMTCpSxBDgfDpS65T14Lm/2dqB+vdhIniv
	 vt/mKhO6WHzcj3rVmfMfUl9I+G0UM8RiJHbWM0Ya0RddjecgyCULcISrqn1yfxyvZeQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=student.oaklandcc.edu;
	spf=pass smtp.mailfrom=student.oaklandcc.edu;
	dkim=pass header.d=student.oaklandcc.edu header.i=@student.oaklandcc.edu header.a=rsa-sha256 header.s=google header.b=Kvwr0N3w;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5556606A31B
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 18:14:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5556606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=student.oaklandcc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.oaklandcc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=student.oaklandcc.edu header.i=@student.oaklandcc.edu header.a=rsa-sha256 header.s=google header.b=Kvwr0N3w
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b0d91601bdso8031687b3.1
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 10:14:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793902482; cv=none;
        d=google.com; s=arc-20260327;
        b=Hke9lPXOStEc1tfUIGVhOlBXikZQpJ0r2J/hGTuzo8566O7yXen8fbdwR40qDLlUU/
         N/TO4Mk2SSYpiLagha+hnXQ0dWH5UihlnvZ6d6FDpGh+jveiUsbaMLe/ZXb5W26+vO2B
         F2TFoEFoVjJSUOothNZO5nJjMWb0p1eK6CuF0PzDudSdYK72Zit6egbOOl+1+8MDrVyK
         cwxiqqP5QRi84CGPiLKHq7TOwyfu8LIONR5d9qYTGtvOPANEQvccQmg30E7lEU/YdYrK
         1QxQ23E5bhemMGNOTnQ/wskzfcBqoVJyhQHzLrcgMvnQqu2ha4AjtIuUnmemsG1BlONm
         RhHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=k69fxDmtmmF6Y3dZct9TP630KoCBBlkteFGCi7Y2r6o=;
        fh=+AFjarDfSm/c7Lr/oIfacyrt2WJMTBkq3r85m5iTl2g=;
        b=BaKRrCAbyu3u1BJgezHL23WZsBJGlwCn5Fd30aQEJS5AYgRLCFDy4V7B16qgmxIq+Z
         +xj1o7VE/xXdLQRInaKoHCb0iN/yoSpWjelOkIWaJ80sC/ZNYg8PfrTZ4QOKBVodzaQ1
         fW4agN6QE531x8x/YrpR5Os//ldgqbazKiN7Wyum6pI/NMd4l+Bol1iYuzv8NNd1A12/
         FPh/5LGAboPk2fmpI/uHK1wVTzeNQJH8EjIncw4gqORv7Q7aJkY2/yLWD/t9dxKufCjP
         1xfpLnwAgI5xMPUk34KUVbZnFdGln+WvSWB6u4hJGDRFuRiWAE701oK/pbPphgpJrHcv
         Claw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=student.oaklandcc.edu; s=google; t=1793902482; x=1794507282; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k69fxDmtmmF6Y3dZct9TP630KoCBBlkteFGCi7Y2r6o=;
        b=Kvwr0N3wJcuMs7cGXUZBxJtEaOzeSX2XPoDoVeZS8hq++Ke6HbWvywy2wThr+XW+P8
         U1AMiClyMZPXUgzBUARJ7EBZnsm75rovNxs1CNIC+GVfF+nfrOqT5jCVAMsITy7aCxmS
         Kk8Qb4p4wwzx0xZP9rVj8MtBvc1O89NlNWoGHdI5YHasV0y3Z0TIzPVC/4H5LJ6ic0B9
         h4I6X5Num32/yzBi6uWSoiHPXc+4wMsZ5jYcxnTQPjUGfTeSrO3j/owjROA9XpeFbhMc
         VYe+x7L+PvSn3SvjABWpIXpoI1DOQk9B0EC32AXeZ7FC0G4zizNJkwTgS19VYJ2Rxr0V
         EcrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793902482; x=1794507282;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k69fxDmtmmF6Y3dZct9TP630KoCBBlkteFGCi7Y2r6o=;
        b=uTB1SZUBJuv0SPuL8Od5vdrfzMsV2E1t7h9fUeGRNe8bm9dTqxy55CG4+mrd45CQY6
         0Ljc2BWyaXfG8iYRNFwFarboct8Oh5IwAgMgz/OHlFnQyY9SL78hdwExbrsbzt1MABDV
         6dYiNS9pntdvDQYkAOz/xn88Ta9Po2pWQJE9KSo5TscEDggMfrPOg09dxFpDd2xJ7xJi
         2C39MfamVPROgj7TMLvB8qBNrN+RJkaiAZU2kv+K1JHtLxF1baMktBOC3sI+dQhMeE5v
         ClTSzGd/fEv0MU/wimlwxcQs4tlYOdoLXOjM+6NUha6CPDZTwWX28zyR0GAQihuSWCUc
         rJVg==
X-Forwarded-Encrypted: i=1; AL+hErGK/4bND+5qJkaR/5INqbE560HedqvrVSgZgyEVlckDa24hJnZmrHpE/hdGnoL8Pgx8c5YjTjcyK1fp7pBz9e4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8efL0hUgVWT0kAw9kwbGIMQHaudFwUUYrJFSj6/c7OGC328gmC
	0bZJefuf/4s80Fncgie0rD5JzIcZYy+8YKOMvd4OXgC0G2gaHaDP4rlCKFhFWXPH/ekA1TQZ3B+
	rJdp4gBgdmnEUxqHWoBvFiK1HncFVVo+rz6p8+4nCSw==
X-Gm-Gg: AYBFou0j6NOe/aJMhASQfLLyPLf2Yme1ohIz5HGNSc3F9XUD2lgz65ZKcluZFRgH/pS
	EwjNTpLR9Y81ZsFACn9ruQ0XsQV6276DX4wN1xIWDc+HvUVLV94mHxXY9hIBcKpU+5y8t4eoIJn
	Gxp7GeC490fTYiKldiQNCU6mNOHLkf91ohySTeou+Y3AV9Wnr0TUKcHF/DLseSTkCeam2pZA0y0
	CFIpfzLiosMaZS5Rw4Pt1xWT2VHOzovKjfHmZe9yPaukdbpkQYA69ZnN2TlLitpMPflBk070UeK
	xMKjGSGgYtF++z5nuNhw37HXHcN9KzUoKpbg6I89RoR3m0lJXWFlJPP+bx5wtZX3tbe53gkHME0
	ca6rKWoAEntGs7gvWLy3Z4ALmIebm/r2CCw==
X-Received: by 2002:a05:690c:a012:b0:8b0:e13c:2852 with SMTP id
 00721157ae682-8b328db53bfmr18059617b3.7.1793902481851; Thu, 05 Nov 2026
 10:14:41 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 5 Nov 2026 10:14:40 -0800
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 5 Nov 2026 12:14:22 -0600
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Thu, 5 Nov 2026 12:13:40 -0600
From: "Louis H. Poulin II" <poulin.louis@student.oaklandcc.edu>
In-Reply-To: <CAGQButum4PYb4A+hmqg-bJZbf4L3KkH6rT9tn-0_NTs3xLhGYw@mail.gmail.com>
References: <CAGQButum4PYb4A+hmqg-bJZbf4L3KkH6rT9tn-0_NTs3xLhGYw@mail.gmail.com>
Date: Thu, 5 Nov 2026 10:14:40 -0800
X-Gm-Features: AclHuK-pWE1BEpdoomXA8eGheOMWNCk027wBT3itki_9ei4qUXSDyfyqr1wzuzc
Message-ID: <CAGQButurzJT6fQqqxO9xD0GABME=AtGeYS0kQf-jDFSqKH6GaA@mail.gmail.com>
Subject: [PATCH 1/2] kunit: tool: Count failed suites with only skipped tests
To: brendan.higgins@linux.dev, david@davidgow.net
Cc: raemoar63@gmail.com, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

A suite can report not ok while all its child cases are skipped.
The parser retains the suite status as FAILURE but counts only the
skipped children. The run status is then derived from those counts and
incorrectly reports SKIPPED.

When a suite reports failure and the child aggregate is SKIPPED, add
a failed count for the suite, as is already done when child aggregate
is SUCCESS. Cover a correctly numbered failing suite with a skipped
child.

Fixes: d65d07cb5b01 ("kunit: tool: improve compatibility of
kunit_parser with KTAP specification")

Signed-off-by: Louis H. Poulin II <poulin.louis@student.oaklandcc.edu>
---
 tools/testing/kunit/kunit_parser.py    |  4 +++-
 tools/testing/kunit/kunit_tool_test.py | 13 +++++++++++++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/tools/testing/kunit/kunit_parser.py
b/tools/testing/kunit/kunit_parser.py
index d722874b..dce365d1 100644
--- a/tools/testing/kunit/kunit_parser.py
+++ b/tools/testing/kunit/kunit_parser.py
@@ -694,7 +694,9 @@ def bubble_up_test_results(test: Test) -> None:
 	elif test.counts.get_status() == TestStatus.TEST_CRASHED:
 		test.status = TestStatus.TEST_CRASHED

-	if status == TestStatus.FAILURE and test.counts.get_status() ==
TestStatus.SUCCESS:
+	# Preserve a failing suite result when its children all pass or skip.
+	if (status == TestStatus.FAILURE and
+			test.counts.get_status() in (TestStatus.SUCCESS, TestStatus.SKIPPED)):
 		counts.add_status(status)

 def parse_test(lines: LineStream, expected_num: int, log: List[str],
is_subtest: bool, printer: Printer) -> Test:
diff --git a/tools/testing/kunit/kunit_tool_test.py
b/tools/testing/kunit/kunit_tool_test.py
index 85ae2175..5fd386d0 100755
--- a/tools/testing/kunit/kunit_tool_test.py
+++ b/tools/testing/kunit/kunit_tool_test.py
@@ -265,6 +265,19 @@ class KUnitParserTest(unittest.TestCase):
 		self.assertEqual(kunit_parser.TestStatus.SKIPPED, result.status)
 		self.assertEqual(result.counts, kunit_parser.TestCounts(skipped=5))

+	def test_failed_suite_with_skipped_child_fails(self):
+		output = ['KTAP version 1', '1..1',
+			'    KTAP version 1', '    # Subtest: suite', '    1..1',
+			'    ok 1 - case # SKIP reason', 'not ok 1 - suite']
+		result = kunit_parser.parse_run_tests(output, stdout)
+		suite = result.subtests[0]
+		self.assertEqual(kunit_parser.TestStatus.SKIPPED, suite.subtests[0].status)
+		self.assertEqual(kunit_parser.TestStatus.FAILURE, suite.status)
+		self.assertEqual(suite.counts,
+			kunit_parser.TestCounts(failed=1, skipped=1))
+		self.assertEqual(kunit_parser.TestStatus.FAILURE, result.status)
+		self.assertEqual(result.counts, suite.counts)
+
 	def test_ignores_hyphen(self):
 		hyphen_log = _test_data_path('test_strip_hyphen.log')
 		with open(hyphen_log) as file:
-- 
2.53.0
