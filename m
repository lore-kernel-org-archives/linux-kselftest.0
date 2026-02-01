Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9F531A567
	for <linux-kselftest@vger.kernel.org>; Sun,  1 Feb 2026 09:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769937231; cv=none; b=kTnARbLW9hxkUAA8Sq4N3YMhM19+U+zC5ykqVJlVBgavTNQPC9zNTsN5BNWr5vk0bAiCx7SWEYs/hka3CZ5E1AVr3Q8u8XaL9Rs6UXvQwo0B30XQMitOFZ5tm6Ylj+1neEgD6Kl4bRRQPNj5Jw4S/NkJ0WtxWnJXE3zQsrA3VmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769937231; c=relaxed/simple;
	bh=e+Fj3gCC5IydUvAZBsRrAStW/0EdHeaZFb835l6T23M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ism5DtRiZXJrjRDOC98MdOG7MFWgI9Tfj5vFv/oCVE2G5Sxo1mKXRJo35qTC2YVcwn8yzcG+/g10HwjCh48v+cvoeRp2iblyCCn7bbtVPS+lsWFMW0u1JQpwkEyqBsstVesQrTfAhVP5wcWCcpkApcGFGrdu+pss4jk3c4/JYQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aHJp2uEN; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aHJp2uEN"
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-2a0d52768ccso23277845ad.1
        for <linux-kselftest@vger.kernel.org>; Sun, 01 Feb 2026 01:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769937229; x=1770542029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0OcmtjAb6TTPHvtHwhlT+XJweCDPW7WCRnecPZjWR3E=;
        b=aHJp2uEN/2+LAFHzG4j5ssyPnJot3NVGSOdSPTRRmStPcdTIxq3gZnyHxnQpJ5bfqS
         hDqOaeUf6LiUv9N6+VtwjlMuKuv6gnd0U2f1MktbeDAsYoXkCcxYis4+97fw2KzWxADy
         dAVhppu+409w+9doI2OosBrgKxvEQ/ApVf43PiLDqTDYMxQ+NzsX/pX/TQ5uXBHdGmZA
         l1kYk0xeIuge99gwuorCpFWvS/v1aftHho0hTQGnuMAXR57zof3g0UVlWrWhVGA9oOfz
         M+FqSf/7WVowZcIbp6htRRdeQde1iwPlGtbMvIV1mYrMLm+paVySk4O4tyOEMVolx6Ys
         0nJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769937229; x=1770542029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0OcmtjAb6TTPHvtHwhlT+XJweCDPW7WCRnecPZjWR3E=;
        b=Or//fgkOx7RvYn5ayja6rSp+iBGgzspsfJPcU0pyGNY0ldPAOKGES6peNHVT/AfRdj
         N/MFHcxReg0w+k+r7EeRNeL5hLN4NZiPjUFirMZOpP2W6aF2mk1t1EgUmmIgTCnzk/4Y
         ubjBQ6CK0j7cyZcq3OhhNGf8nDGrHdiHypfzW+31Eh4wy9T/CfL+M+IlcY5boHTF1LLd
         /ppBypPR48TMpiTzwXlp8Jb0kzAAN6+QkVyddZiQtB3tJOaidDyeJ2z8QJoY0tobPYxM
         WIhdorSAgkwqFRdYL+YeIXZx9fpnc19nKA878d4zc6OfzcpVnY/T015NDi3fH6JKZfB9
         742w==
X-Forwarded-Encrypted: i=1; AJvYcCVZ9bjm8S3Y5cueHN1p/Cx9eitUPFY2BXYkv0s9gTXMuoVM50sIgGxT4oTDTIFHSCwxCAFHSt5+TZ+GniAYpDA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeniroCSPQ4qhYEktJhXlHxOrs3q7OhV1Hel9gRXktQixOHpX5
	qnA7mCYgZcElKjmpu0vXMaUN6IXJzaGBCbmhYiashrm6b0gG+XeTEVY=
X-Gm-Gg: AZuq6aIsrEF8SN4stGGVf/bZYyLFWY0wodIgRpCVBxE2CtbxjSXch/PAIrHFeGbVXc3
	l2W0QmlcxphTbDikcTl+SedCaWJnqk8EUafwip5hEeTwl9WY6SGtDB8L6rrCZd551KANl+AMRPU
	4tc2BcGyNsD0FrhHYguqDoa5gO1OncdwZKNZwEXJuxwVmzQ8OWL4b3bg1J9cCGoChAkWCL97llu
	759uvQ+NRfU4S3qIovDRo9t1ioC6gfI2hr6ftsONoQSJ7SyKViDkdejwZzAf9S3KsmGh/ink59h
	FH6+crfc/q4hBdheWSsDJinn/i3r5y6LN9VRuc/mWqkcPPrIRS6X4kbbOyJ/ZPsgxTEIagxsFZg
	xG8kzDQLIT3OmPVJcL+WbWysLuiLZHmwf1ahSe+oCHj7vfPSh7pZ6lyRKdEVOt7Zoq7ZGvlQ55r
	7zwf1mkwY1lzXB1TAOPBcBpUwd7IQMxg==
X-Received: by 2002:a17:903:283:b0:29f:1fad:8e50 with SMTP id d9443c01a7336-2a8d959c8abmr92762215ad.3.1769937228976;
        Sun, 01 Feb 2026 01:13:48 -0800 (PST)
Received: from localhost.localdomain ([59.16.109.172])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b414fc4sm119553465ad.32.2026.02.01.01.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 01:13:48 -0800 (PST)
From: Jinseok Kim <always.starving0@gmail.com>
To: Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@google.com>
Cc: Rae Moar <raemoar63@gmail.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	Jinseok Kim <always.starving0@gmail.com>
Subject: [PATCH v2] kunit: reworded commit message
Date: Sun,  1 Feb 2026 18:13:20 +0900
Message-ID: <20260201091320.291408-1-always.starving0@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260112041322.2168-1-always.starving0@gmail.com>
References: <20260112041322.2168-1-always.starving0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When running kunit_tool_test.py, the test_run_raw_output_invalid test
prints invalid usage text and error messages to stderr. This happens
because the test triggers kunit.main() with an invalid argument, causing
argparse to print the usage and exit.

This output is confusing to the user because it looks like a test failure
or usage error, even though the test passed successfully. Furthermore,
argparse displays 'usage: kunit_tool_test.py run ...', which is misleading
since the test script itself does not accept the 'run' command.

This patch mocks sys.stderr in the test to suppress this expected error
output, making the test execution output cleaner.

Changes in v2:
- Reworded commit message to keep lines less than 75 characters

Signed-off-by: Jinseok Kim <always.starving0@gmail.com>
---
 tools/testing/kunit/kunit_tool_test.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/kunit/kunit_tool_test.py b/tools/testing/kunit/kunit_tool_test.py
index b5cc07c3d027..7a8ba8e4f1d4 100755
--- a/tools/testing/kunit/kunit_tool_test.py
+++ b/tools/testing/kunit/kunit_tool_test.py
@@ -690,8 +690,8 @@ class KUnitMainTest(unittest.TestCase):
 	def test_run_raw_output_invalid(self):
 		self.linux_source_mock.run_kernel = mock.Mock(return_value=[])
 		with mock.patch('sys.stderr', new=io.StringIO()):
-            with self.assertRaises(SystemExit) as e:
-                kunit.main(['run', '--raw_output=invalid'])
+			with self.assertRaises(SystemExit) as e:
+				kunit.main(['run', '--raw_output=invalid'])
 		self.assertNotEqual(e.exception.code, 0)

 	def test_run_raw_output_does_not_take_positional_args(self):
--
2.43.0
