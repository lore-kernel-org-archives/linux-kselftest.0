Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B33393DDB
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Feb 2026 11:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772018139; cv=none; b=FBrg2yxsSL6AgSUxcrdb5eVx4tSfCZ+X8n95jFKSD0B0n//VR2VecY9QSSeYRBZBptMiTUEBSu+yk820w6rRaSnBoOAjUA9alhkzhLqs6IbFJaZLsKEWnR0GwHC+rR8gPfXbtVYN5P54xE5HgI1HwELMCtbC2CGkTZ0PtrhI1Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772018139; c=relaxed/simple;
	bh=ngMIJOMRnJXLYEUhjLgmW0+cnyNeco/cgTA/LjKrN4A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jSL9G0Z0kqiJmXkPqsNQ3lE5zTMGlZlfn3TdnUK2JcbIeh0+jVGG5H1+KsEDPZ9/IHpWH15SgahlXOHMXNJD2sgw5rdquMWGG81K66+J0zeH+5dBy/MxH/No/XldU+v/fgL2RuMwDuQPx5jaFnYKB8oiiPcLCjOIeoDtrAppiLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LNgDjIEB; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LNgDjIEB"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-463967f35d7so4622787b6e.1
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Feb 2026 03:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772018135; x=1772622935; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KCzNXohVpDD6xCDz15ty9eD9uNVVw6l0koWlP3YqGoU=;
        b=LNgDjIEBXWQKdyfrrBOX6MDFztAyhCSz2+giXWVQQI+OXmd7i0rn7K4/S47DIKNW/f
         0Yu6tH0b9b6lV+4Xmf+GLHIoZfvbPyf+30MJlefV2rPaKGQ6jKM2VNIPPZWg9hNNqmH/
         7S2487M9WNwlcVOIemMGOGv3wfUNQWcIvPqC5YesMd6os6FfSiUNEUf99okfuHqN+2Ty
         x7GSc8DC9ePaXrArAE6QsEzimO8krOD/eeV6Iq0R1dT6UrxxjuQ1lfE4UdQR8dQykunZ
         96WH3D816IGtBDUMtRsZNVRQIYYjsqCrMcfKtjxo/0+7C/FR5/r1GFK1CqehxCWenJSR
         qWZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772018135; x=1772622935;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KCzNXohVpDD6xCDz15ty9eD9uNVVw6l0koWlP3YqGoU=;
        b=hP8xReEoJfIWHwxUxIW5usmi9hQDg8MT3Y6HCMzUKPmgHVxxMyQHPNNBUctZ9v2M2C
         4fdzjakltyhYb0ixdRXtIHRNRiRNGl79FxTrhnzIKty5FWNBoruoz42M8xxGURAknDfq
         6D4PZKT0kA2PSSCGaS0ZRSRPYQg1OYGNENgWy1aOubf4OMBPxFDuZdeV0jHElRgxXtnj
         LeCDNkYAlmV2ur9qi+8WU3/+8IVdptboMSOj/0/jTGb0UFq1ywqhdem3kEfbSSs28DpB
         rKIhG3kKMu5E+uQ+k+ecwa8IsECgZQMayJAo9F0ibwU9O8InA+duuJ/hWJpGZFd551kc
         Da0A==
X-Gm-Message-State: AOJu0YyZhDkpTkROznu/ozElEKIrwCY3D8dV/2C+NtkZtREij4b07rFe
	bkh/aOEAjex39aErB+1U9omOZYNRdm212uh9z2STAmuBFRtlCE0LNOKt
X-Gm-Gg: ATEYQzxZOqjAU7VDnTMRutecRnUCmYxDTeECy5UuqMFQuDflbH/sefpT0EGBjPkjxMZ
	Pw4jNtEVZdC1dB1PbzirDojJuMhCgiXP7RT6LY2hU+ydkk5Ws7/mB8EVHxKWFPantXbZyBlARBE
	g90rluyVr4L0j/PtswG+6GvI0lS46qw2IuPzN+B02Xd8NccfZyXA353TSNa0uepOp5kpTB8lRU2
	RkzjwAqBRLnMpD8lg0ytgCnQGkt+ShV8O5J2NAmj2Ykvz/2wudSwITaiYMjE7ObTXlSNvPHmtnt
	rIsg11VNhJoEGZLN3xiH2ocHFot5tJZrzkY1MeqcWlm2DBJ32g3cnYKsdh5926FeF1GyJMCVBt9
	wPEXI93W4W39I98pf/Bn0l4kRLKRL9SXBBauKiuL9eaNHHVsNJWh2a7Vhgc3ZJ4OFZlSTumMmLh
	Fzo9D4BkHS5jx5tB6dLtSVHX48JIGVqUPkPk7aQhKSSkJulyEqtAZcvAdO0WC0kMxG303ecF9/6
	JlghAV8AEP4keFzqejZjus=
X-Received: by 2002:a05:6870:328f:b0:409:61b0:fd28 with SMTP id 586e51a60fabf-4157b1ccb7fmr9403756fac.46.1772018135281;
        Wed, 25 Feb 2026 03:15:35 -0800 (PST)
Received: from localhost.localdomain (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4157d34a224sm13053927fac.17.2026.02.25.03.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 03:15:34 -0800 (PST)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: Shuah Khan <shuah@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>
Cc: linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kees Cook <kees@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH v3 v3 1/2] selftests/harness: order TEST_F and XFAIL_ADD constructors
Date: Wed, 25 Feb 2026 19:14:50 +0800
Message-ID: <20260225111451.347923-1-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TEST_F() allocates and registers its struct __test_metadata via mmap()
inside its constructor, and only then assigns the
_##fixture_##test##_object pointer.

XFAIL_ADD() runs in a constructor too and reads
_##fixture_##test##_object to initialize xfail->test. If XFAIL_ADD runs
first, xfail->test can be NULL and the expected failure will be reported
as FAIL.

Use constructor priorities to ensure TEST_F registration runs before
XFAIL_ADD, without adding extra state or runtime lookups.

Fixes: 2709473c9386 ("selftests: kselftest_harness: support using xfail")
Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---
v3:
  - Move KSELFTEST_PRIO_* definitions above the TEST_SIGNAL() kdoc block.

v2:
  - Drop the lazy string-matching approach.
  - Use constructor priorities to enforce initialization order.
  Link:
    https://lore.kernel.org/all/20260224113859.12345-1-sun.jian.kdev@gmail.com/

v1:
  Link:
    https://lore.kernel.org/all/20260222111846.12345-1-sun.jian.kdev@gmail.com/
---
 tools/testing/selftests/kselftest_harness.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kselftest_harness.h b/tools/testing/selftests/kselftest_harness.h
index 16a119a4656c..4afaef01c22e 100644
--- a/tools/testing/selftests/kselftest_harness.h
+++ b/tools/testing/selftests/kselftest_harness.h
@@ -76,6 +76,9 @@ static inline void __kselftest_memset_safe(void *s, int c, size_t n)
 		memset(s, c, n);
 }
 
+#define KSELFTEST_PRIO_TEST_F  20000
+#define KSELFTEST_PRIO_XFAIL   20001
+
 #define TEST_TIMEOUT_DEFAULT 30
 
 /* Utilities exposed to the test definitions */
@@ -465,7 +468,7 @@ static inline void __kselftest_memset_safe(void *s, int c, size_t n)
 			fixture_name##_teardown(_metadata, self, variant); \
 	} \
 	static struct __test_metadata *_##fixture_name##_##test_name##_object; \
-	static void __attribute__((constructor)) \
+	static void __attribute__((constructor(KSELFTEST_PRIO_TEST_F))) \
 			_register_##fixture_name##_##test_name(void) \
 	{ \
 		struct __test_metadata *object = mmap(NULL, sizeof(*object), \
@@ -880,7 +883,7 @@ struct __test_xfail {
 		.fixture = &_##fixture_name##_fixture_object, \
 		.variant = &_##fixture_name##_##variant_name##_object, \
 	}; \
-	static void __attribute__((constructor)) \
+	static void __attribute__((constructor(KSELFTEST_PRIO_XFAIL))) \
 		_register_##fixture_name##_##variant_name##_##test_name##_xfail(void) \
 	{ \
 		_##fixture_name##_##variant_name##_##test_name##_xfail.test = \

base-commit: 7dff99b354601dd01829e1511711846e04340a69
-- 
2.43.0

