Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFC220E702
	for <linux-kselftest@vger.kernel.org>; Sun,  1 Mar 2026 01:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772327496; cv=none; b=KS7fmPwyg56NFtf9XUNXZkNnhhQeNQmHQFurPE3FpEQhCDMfxuP//yEgpKqsz8KEpd0bcU+IzQA6QsC3PWKHQtL1/+XND6r680mTY8Z7XjjrH+2Pnm75epDGmcnGtuvz5kBuY6n71hC9NHJfJr7VWu/d/stkekV8u38LCgdQU74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772327496; c=relaxed/simple;
	bh=I37K6vSoJERYXnT+zTKVGt662nzK8Pm5XmgxcapLyLw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZOxCrz+azOjLPGulNoUN1wrtKfl2r5MYVA8OYJJNvWGB+cVkgqPY1AOBevJ0baH0jaBHGJTcOJ+mJzQvpvYOlniFs8+QV6cDQeHtjp2P8KOouwzEHkG8KKO4+T09bZjpFX8m82d5vtRfjTKOMhTxOHxARq1eV9aqimm9jRtugBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XCt6npax; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XCt6npax"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-439a89b6fd0so642396f8f.2
        for <linux-kselftest@vger.kernel.org>; Sat, 28 Feb 2026 17:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772327494; x=1772932294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a4odJx43LrmvpL4m1aLM5dJUeCLCM6s/fspImaJFweQ=;
        b=XCt6npaxWzgC2so8vme0ot0aLDI/37EVNYfE2dgB9ouu1AW/sfNOt4ivYg5b7E+Y0w
         Hh3clZajCGS+IwXBTSsDC1TTCLkaTnYMgn2PErdmHRkFcvojD+lNrtbWThI+lL9MpWZu
         ZvnXV+4EFhQRC5uwACHpGEvhvqSSCc8BJYrSh4rkT6rPOSetfxF3AatCQZx0kEdkugeX
         do9m/8bn1/3jrgjk8PDfk40mhuXWZnBpdIS1pZmXczIko3iLE2dYoHc9Nflu6VZZhCdj
         rYMxBjjGOh9jzOfbV46AWXyR+MQ+q9XYYIsWdftBazqyaB0MM3yobX5jlJZF7ys8xVjg
         WaIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772327494; x=1772932294;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a4odJx43LrmvpL4m1aLM5dJUeCLCM6s/fspImaJFweQ=;
        b=Qz4XePVT4I5GDwiPKbvVOSPLUrNK/Nx8ns28zw2dHWd0Q+wEBPNe23O3GOiv9XBLYy
         pvelBb3PVg9wYeKyl9/YtxXTo5pVIHMBHrWrch/3PF6RekHqDsmHReFQ61Lxu4G0JJmf
         nTHFQpmLZDm6n9/z/djSbZ85JB65YGnvy/21u2TUN4VXvbl5MbVEIuvnJaTU6BxMw7WA
         xqxyn3nC46IFx634rfsRl3BeC8gbyB32xjHYy66fmqKpoOx6MDVB2qZXyPWotqzn9aEp
         9VOQmQ4vHBsPMeG1qj/kF1DqUmjY1+JvUecJ60Zr5knyKIzR0dSXAOg0Yy6dO+jU7hWU
         4tow==
X-Gm-Message-State: AOJu0Yyp2LtczHjO3SvskqBsixlqbRndRamC2nJaUTNF5iHLPC4nsAeJ
	vqmR1UtYsY7lMdCAj6aUb+KAm8sGnAUbYrOESzgFCWc8299Qb9U67ibd
X-Gm-Gg: ATEYQzzVY2jYwLpyNVKwcenh9yVTiPAMWLgiC7IdLyAiRzie1fCb3P5ORwvzoH+PLQL
	sL0/fAg4F2QbCbDqjitXYIJi0FCy693GaBZyGi1TltaUNf+kTB8LFlzGxnA/7VWwrfYJr4IDM4Y
	QQb4HmhTBDdkhCZs2U0c66QgLx1hY+CD601OLD41GV1cTrkr60gp66ABxijh7tqG8zx0DtWuY4t
	WKwEagGGPk7RWoR4t9fkg3h5AoyZ1jMvf9pFjfE7T4qaJCrv7mbShD8Rrpr0K9mHW0dMPv0qDES
	LbrbVy06XZ0qdCgLSUe3A/EoyuV8wVuBrJs7Glk+iHuwTP07B1vG3L0cSmqd/HU2Kw2TO3a3Qw9
	H/g1jvPwz6/5fKzaWnfuC495ZQ10El9nTRaCiXWCI3Zr9dj1hW0lpFPVkwvHyE4orChWGVEwmUA
	gBhbrv1YWI49Fa5EpmsEmmKLKSuAqUoNFN36NVbqDtuHmVBCFxsjref6bWnEIMbK5R9Fo2dFvO
X-Received: by 2002:a05:6000:1a8f:b0:436:369f:3a00 with SMTP id ffacd0b85a97d-4399de4a881mr14575502f8f.50.1772327493600;
        Sat, 28 Feb 2026 17:11:33 -0800 (PST)
Received: from turbo.teknoraver.net (net-5-95-156-124.cust.vodafonedsl.it. [5.95.156.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c7645b9sm15853401f8f.27.2026.02.28.17.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 17:11:33 -0800 (PST)
From: Matteo Croce <technoboy85@gmail.com>
X-Google-Original-From: Matteo Croce <teknoraver@meta.com>
To: Joe Perches <joe@perches.com>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@google.com>
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] get_maintainer: add KUnit maintainers for KUnit test files
Date: Sun,  1 Mar 2026 02:11:31 +0100
Message-ID: <20260301011131.4057-1-teknoraver@meta.com>
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

Signed-off-by: Matteo Croce <teknoraver@meta.com>
---
v2: added missing SOB

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

