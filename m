Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792616127;
	b=C/s9IHdHafis0Q7THa44X/JIy/Urox2XdVxA90Mn0X+eFttS8mTIEeCUNqaFYYZT1qo4
	 vqfIeLZjBlkcTvc33vYSkKa2HLJA6eKav4HMbJB70bZdImPRadNYE3PJbZBBVlDBQ7IH3
	 Mfgc7ZmyKBcBWa/x3SG33MK22xVgxrelwKWBBu4JDcU8MZzp+UOz4i1Uqb0DLcdQtlCci
	 XkO8KeCXcpFqx/vGhKfrkV3dmKJ9k0rSZK/HLCOXKQwRJfvaFHxj0cbIcd023vxHzix5f
	 frcYaZTnAEhrl4Mav7Txe9HhzvdTazHZC4e5d5bSKH56isX722DjNbg4cozVHwljFxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792616127;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BoG6FgQzAOsqSSw4b90ZKrbZ/8eF7MERpzSbbqg2z5o=;
	b=2bryq0HROPezwt9DsIeYWjpzV9u2E8xbRrFJwQkK/7CVkoGrGi2M8cKY8CBi8E0ftPmH
	 nKaBW5azDK+JqtLI44JjuIcNExCFXFGSlaLjxHD0vf8p8z89LxmOT2shZoLAjmoMXjvsP
	 JrEsohote5Efx4ZEW7kEuc5ZZEmhL+hZU7hOz5PchvLM/M6mrKSp08lqeIRgrzQOCu9UW
	 DR88TPHHq01UdXTTILGGatHFpNqizNYUaxkQo/UF5PbUOdMAe2iGBC28HoxuB6mjpvqPj
	 m+0/WfEk3hSeqkSe3+icA8CBiyvlJz2RKU/7mf+RHwK49zNmCgPuaoxmklHht5N06BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rlsoi9gk;
	arc=none smtp.remote-ip=209.85.221.170
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754DF606A31B
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 20:55:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 754DF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rlsoi9gk
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5eabf7d5bbeso1274738e0c.1
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 13:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792616126; x=1793220926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BoG6FgQzAOsqSSw4b90ZKrbZ/8eF7MERpzSbbqg2z5o=;
        b=rlsoi9gkS/LM3Pu3xYPtL7zf/U6dTptg6cRP/51gPEafMMPbJkkfk5F1Sgimdip3h9
         PTtEPJw0y6xSa5uQsJAL0fNMDnIraWtFrsA678FnlLlc4rNRtsjgMQcACLSLWHbB+pJF
         1cgJ1mJjEOFGAK0j2jsPClYtjcPl+346TKtQBE4XyiTTHLCAXB07T4wDkIPoYfRENcz0
         H1aJVgf5J/WycWH9fkBBvZYWhSELd4BOB4VJCKkoC5l4x6NscEM2gkGqkpJ3tuHIKfUJ
         UBdi9kJhU6N/x8P9PclLHtuHK/ZqtfQdLf9z3GOdC7H38pmSgiArGz1V9Hm+Dt2F64BD
         4EfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792616126; x=1793220926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BoG6FgQzAOsqSSw4b90ZKrbZ/8eF7MERpzSbbqg2z5o=;
        b=nB4SKN1mDLrMuN+5H/TVpsVYDO0UBgC7f1Uj7QWPt9giCiFgGMgIU/4YuzTAbBvboc
         EGZ8ENVpJZWLfkRqC2sjl0P6eYe1SvoY1prN05TruAJTHnhdS0uP4a4isBnjTNu3gM0f
         2n9RgbPfntf8S+74S8FH1RnqQQ9S17j1FTzsrcWlAdtx2sWiIWLQgImIBRfIT+rbPPiq
         3WACamB30ellhlsWZPN7yF0ODr1YKz4iJ6sDQI0tXCDDYJy6w+AlcEsKHMe15WM9LrOc
         vKwh/UsnU57e8PmpNzPAWjoRxjZJCQ3cQJDHmYY85Zhyg4XlCS4y0vDqI0EZVZT0uhMK
         +ptA==
X-Forwarded-Encrypted: i=1; AKwUvBwGT9nAt+j0OKRCVNzYZGm0x4mPIHa/J11SZUcqrUGh/WphrCMfxvQXBRT+QvCmydu0LmvpOa0Ie9r6mPjQHic=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZOLX41X2sala3sTYhUKhbN/xPai1JhJTd7W4/9Q4TF4buBS8o
	b6mXnK0YMsoVeGlBknDdzyvJhUq5YuWbXgMMq1S2TH3dbMH9bX+3mHwj
X-Gm-Gg: AYBFou2dKVW37lTrQjJBlN3kYrc4F3XrG1ww9pc6qfWRWeGVAEKpfINrtR8cKdssGWU
	KicR4MUDVbOClC1Hxf8iVbXnd6k+77x7Jwy7/ZQiGMI2PJiAorOR3CDQxfYNeB6iWcGRBldyduN
	m4qT4pVLILk8wFQQY+pZdj6fsTwe8Zl95uScV8GfvrugiDnUj4CPIe79fqHupDanXNhsSQKV17I
	2OmsyVng+Q0AwgO4IfNoFYXkCzXmQ2+JMk0MwkvjFQeP9GRDLZ+wl45NXYf+aL7X5zlkLTazqn+
	fE+vX/vnopbwaGCCznWeQpUOZRz1shiNqWZU8Jt5tBaQT09vC6aLF131WCH5YOLM+H7wkseEk+G
	JmoyVk5GkcBs9rsBbIgjesraMcd/YaoW1kMCvXfJ4/qhmDoQTxoLSXJQI9xTOyaN3GcYbxPl4OA
	+xqLvEQWeK0xy7UIa8MKIEQFrTYcD8mx0dMnqYBsScGYu+OkSB7XiseajqjXduZSDDFs4UaTSz+
	bwCzLWdHrWTiZH+jQZCSriVhpICjUHhOoi4t6p/BiHLI9gkRh72ROISnbLs9dDGtW283ZNpNVc6
	l/oweZa0KW0+cIlW3zuO
X-Received: by 2002:a05:6122:a50f:b0:5ca:856d:cf80 with SMTP id 71dfb90a1353d-5eaebde8b71mr1215288e0c.11.1792616126316;
        Wed, 21 Oct 2026 13:55:26 -0700 (PDT)
Received: from Biostar-A520MT ([187.94.15.233])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eae980f64esm4553359e0c.13.2026.10.21.13.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 13:55:25 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: irogers@google.com
Cc: acme@kernel.org,
	namhyung@kernel.org,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [RFC PATCH v4 0/2] perf/kselftest: convert Perl test helpers to Python
Date: Wed, 21 Oct 2026 17:55:04 -0300
Message-ID: <20261021205506.26736-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261018134322.26445-1-breno3011alves@gmail.com>
References: <20261018134322.26445-1-breno3011alves@gmail.com>
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

This is v4 of the series converting the Perl test helpers to Python.

Changes since v3:
 - Fixed pylint W1514 in check_errors_whitelisted.py by passing an
   explicit encoding to open():
     open(path, encoding="utf-8", errors="surrogateescape")
   "surrogateescape" preserves the byte-for-byte behavior of the Perl
   original, which reads raw bytes.

 - Also fixed two issues found while testing the series locally:
   * open() failures on the whitelist now exit with the underlying
     errno (matching Perl's die), e.g. ENOENT -> rc 2, instead of
     always rc 1.
   * stdin/stdout are reconfigured with surrogateescape so that
     non-UTF-8 bytes in the log (e.g. oops/KASAN output) do not
     raise UnicodeDecodeError/UnicodeEncodeError, preserving the
     byte-for-byte behavior of the Perl originals.

 - The series is split by tree, addressing Ian's suggestion:
   * Patch 1 (kselftest:) touches only tools/testing/selftests/ and can
     go through the kselftest tree.
   * Patch 2 (perf/tests:) touches only tools/perf/ and can go through
     the perf tree.

 - Note on pylint-tests: it fails on tools/perf/tests/shell/lib/
   perf_json_output_lint.py with:
     W4904: Using deprecated class FileType of module argparse
   This is pre-existing in perf-tools-next and reproduces on the base
   commit without this series. The four files touched by this series
   pass pylint 10/10 with the flags used by Makefile.perf.

Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>


Breno Rodrigues Alves (2):
  kselftest: convert prefix.pl to Python
  perf/tests: convert check_*.pl helpers to Python

 tools/perf/Makefile.perf                      |  2 +-
 .../base_probe/test_adding_blacklisted.sh     |  6 +-
 .../shell/base_probe/test_adding_kernel.sh    | 44 +++++++-------
 .../perf/tests/shell/base_probe/test_basic.sh | 12 ++--
 .../shell/base_probe/test_invalid_options.sh  |  4 +-
 tools/perf/tests/shell/base_report/setup.sh   |  4 +-
 .../tests/shell/base_report/test_basic.sh     | 54 ++++++++---------
 .../shell/common/check_all_lines_matched.pl   | 39 -------------
 .../shell/common/check_all_lines_matched.py   | 47 +++++++++++++++
 .../shell/common/check_all_patterns_found.pl  | 34 -----------
 .../shell/common/check_all_patterns_found.py  | 37 ++++++++++++
 .../shell/common/check_errors_whitelisted.pl  | 51 ----------------
 .../shell/common/check_errors_whitelisted.py  | 58 +++++++++++++++++++
 .../shell/common/check_no_patterns_found.pl   | 34 -----------
 .../shell/common/check_no_patterns_found.py   | 37 ++++++++++++
 tools/testing/selftests/Makefile              |  2 +-
 tools/testing/selftests/kselftest/prefix.pl   | 24 --------
 tools/testing/selftests/kselftest/prefix.py   | 24 ++++++++
 tools/testing/selftests/kselftest/runner.sh   |  4 +-
 19 files changed, 269 insertions(+), 248 deletions(-)
 delete mode 100755 tools/perf/tests/shell/common/check_all_lines_matched.pl
 create mode 100755 tools/perf/tests/shell/common/check_all_lines_matched.py
 delete mode 100755 tools/perf/tests/shell/common/check_all_patterns_found.pl
 create mode 100755 tools/perf/tests/shell/common/check_all_patterns_found.py
 delete mode 100755 tools/perf/tests/shell/common/check_errors_whitelisted.pl
 create mode 100755 tools/perf/tests/shell/common/check_errors_whitelisted.py
 delete mode 100755 tools/perf/tests/shell/common/check_no_patterns_found.pl
 create mode 100755 tools/perf/tests/shell/common/check_no_patterns_found.py
 delete mode 100755 tools/testing/selftests/kselftest/prefix.pl
 create mode 100755 tools/testing/selftests/kselftest/prefix.py

-- 
2.56.0

