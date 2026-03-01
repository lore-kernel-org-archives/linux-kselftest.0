Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857411DC1AB
	for <linux-kselftest@vger.kernel.org>; Sun,  1 Mar 2026 01:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772327252; cv=none; b=WF6OHL2UiEr8nZ1gGP19up1SkWg2UNg+UYPkHzvjNlIGtxwmSpP837GWfSuTW2xM2fRFUXpoDV0vgsIlrdj8aga3BqoSpdqZNQ21zUxvSJpr+Dk/P2E+TX0dcsMHc0aPqgF8iBpsv2bBHndkN2c6q/QScLHVlouyRHsA1krYI4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772327252; c=relaxed/simple;
	bh=sY7rLZYmUsBXn1LSCHItCrpKWKB+kQ8r/Fx+yVNhcdc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xahps2VizG2GCu/QCuL+k2xR0GcEtPk9J8rpmwV6Gx9h37Wti4VWczHQy9zmwdE3mNBrnJX6EvoECf+JLrH7zTQTKT7L6tG2E8Tgq9jS8yxzuZEBiTeEdAB4bx5weqmb6VgK5hq7TqPpeMEap9NxRfy+os68I0QDfsDMz1zmCrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YZpIKwKQ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YZpIKwKQ"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4836e3288cdso21848495e9.0
        for <linux-kselftest@vger.kernel.org>; Sat, 28 Feb 2026 17:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772327250; x=1772932050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m4fz+PhhBDHsjPkf4NfAX2HK3v0oXQzzKGa/oX5ijFM=;
        b=YZpIKwKQwaZ9RTaO1+VLxT0s42QyNQdgZzumCMTmi2rFluHeY4n7fQ1Cb68DT6wUZ4
         PFpdbLrdCH0pR4gUej0dyjaTzt6+lI53f5aGWgnkNX2E+k/4SMaQtSlQQwGIC+gt3PeK
         EW6ufBzuu4k6A+4Jh/wdi8MfBIE0tcgkWwWE++amDm8cyfgtW+9Fjq2VEq96OKWLJ73E
         gF74dRTYzifDEuh8bbAwMoCIqUwdFIR+D2hfbamNa/Tzo8e+NpGGYdqHm7vqR08h9E14
         Dy8c3eByS7+lNIrLxMp1NR9VfpG91mj1pgkdGueQcAzByercKegFAZ5NuqMHm+XpL2dI
         kt4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772327250; x=1772932050;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m4fz+PhhBDHsjPkf4NfAX2HK3v0oXQzzKGa/oX5ijFM=;
        b=N2fvoDdeonJ1Rl8pvfvRGD4moT/0PiRVPFxyrwkKKRaqJl5tKX2tmX3bOeGV2YAe6o
         AIWh6sgmZF8rHHfJuw0r9AupwFRleefl2NKiYEvbWhnmJzf/B5aY9PyFTwHg96C4RnmN
         JruPC4QTcPCPv0hLVxu1oDSiKn0e9k1UZRGxF1kfkjLjkrFn6OG+iXnkrFF4hE3PvZ1M
         5bgq6IcueQmgonsZenO10jX9QFPZ2ib8aUBqxj/WfRaMwrOJYZNCsqwKWpwnObVpSrBx
         o/AUcB5aXdQX/N83zRWynIi+XIkoO0mXDvWTC/DlJ3Z94VupkRCpss15FpKV5ZCAeJVu
         iHPg==
X-Gm-Message-State: AOJu0YzfbjrByBitHmEkObX8T3nbrziCtDXaSd2udbkTHrMfKoATohd7
	iSZbQrPwY3dYMBeP3YgMAnsAwIApHbi2Tll7Hsvadqw8J/tFfxOAXmOI
X-Gm-Gg: ATEYQzy7fNmMOOaekZ92/1m9YNjFIb2uOSryrd8thCRYVk70d0XaEg5zE139Vm+Gmnp
	SZ0p+iyQsbYHTLipK9Jt6Dbll1e36mIrasgDQsBl2P0/RX/mNxklOpunyX2j4dfR201kveAw0M1
	n8vciOA90Y9iDhzFEJWkB8wHyXNJaTbrlNfUawwuFyYBZOQ5c6b3Kf3nNxryMd4nUogUVOK9gzj
	cbHC3eikjxZfLfiZVgpN7xllAiANCQJ5jQjjGlkTKeO+2nC85wOeTT7ZY8+kYAnpAAa3kysCitw
	zW19kyUT4DPGMJmwvvyR0z7d73nUkoIDHOa0D9RQ8rYGOHce6o1VzI/cQ1V2DsEZtjq8p5LeyaK
	APsAB4SqF1+ucTL++rrFvx2ClCRmCT6Thv6V4W/AfUCoaIpDRB4YFtArDeadJGq8UpaBZFK4KXo
	o5YrKVI3o5EFqByd/5cUYUuzX17o0U9N2g14Yd4Oa07rU9Qv5sFnDnzspVwBZXsERuHU4jSwKE
X-Received: by 2002:a05:600c:4e15:b0:483:29f4:26b3 with SMTP id 5b1f17b1804b1-483c9906a11mr140192065e9.1.1772327249686;
        Sat, 28 Feb 2026 17:07:29 -0800 (PST)
Received: from turbo.teknoraver.net (net-5-95-156-124.cust.vodafonedsl.it. [5.95.156.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd6f26d7sm327913665e9.3.2026.02.28.17.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 17:07:29 -0800 (PST)
From: Matteo Croce <technoboy85@gmail.com>
X-Google-Original-From: Matteo Croce <teknoraver@meta.com>
To: Joe Perches <joe@perches.com>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@google.com>
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] get_maintainer: add KUnit maintainers for KUnit test files
Date: Sun,  1 Mar 2026 02:07:24 +0100
Message-ID: <20260301010724.3619-1-teknoraver@meta.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

KUnit test files are scattered across the tree and don't always match
the F: patterns in the KERNEL UNIT TESTING FRAMEWORK MAINTAINERS entry.
Add the KUnit maintainers automatically when the file path matches
common KUnit naming conventions: _kunit.c, -kunit.c, _kunit_test.c,
and -kunit-tests.c.
---
 scripts/get_maintainer.pl | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/scripts/get_maintainer.pl b/scripts/get_maintainer.pl
index 4414194bedcf..c07723af4132 100755
--- a/scripts/get_maintainer.pl
+++ b/scripts/get_maintainer.pl
@@ -966,6 +966,20 @@ sub get_maintainers {
 	    }
 	}
 
+	## Add KUnit maintainers for KUnit test files
+	if ($file =~ m/[_-]kunit[_-]?.*\.c$/) {
+	    my $kunit_tvi = find_first_section();
+	    while ($kunit_tvi < @typevalue) {
+		my $kunit_start = find_starting_index($kunit_tvi);
+		if ($typevalue[$kunit_start] =~ m/^KERNEL UNIT TESTING FRAMEWORK/) {
+		    $hash{$kunit_tvi} = 0;
+		    add_categories($kunit_tvi, "");
+		    last;
+		}
+		$kunit_tvi = find_ending_index($kunit_tvi) + 1;
+	    }
+	}
+
 	maintainers_in_file($file);
     }
 
-- 
2.53.0

