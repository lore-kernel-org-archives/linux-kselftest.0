Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBAE3E8C68
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Mar 2026 18:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774031378; cv=none; b=DTb8Atc2Q/s41ORPH+Opk57F91kj7aRNdKNk8OxBjZfFoarEfko5b6teVhEjQgqwSaXX23cG8VwqwXGOMlmPBecM/FY64KAryUOAh0mObaTj+J5peEQBh1zO5YMxwwF+5pgjqyVCDSUKL1gU0P56CyXsYQPCR7nFMqmC37f+7jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774031378; c=relaxed/simple;
	bh=RrVGneoI97HAbFh0po9veu/6l2CV4YOVmpXZ5Qd0yT8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VNk3wG/OxvRFO35yesNri2BF8TroZoQ/qdKSApMshjd7NfnA0B3LU7TuI3m9ZPr9RtjJ64r6VpZ2S6NtKReEawdE2KyEfRF0COIoasq16XypMPI+MklfEJfu9Ec3eEqf7DNRnYn4YJqDs1z52Fpww+RCNpmawD/cFrxawCSkD7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=YffsH8b7; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="YffsH8b7"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-486b96760easo25157905e9.2
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Mar 2026 11:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774031375; x=1774636175; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tIiKn6ZLHm7vzDihA5glLwC7dBKb/e9gLHDjPrr2aok=;
        b=YffsH8b746jAPgaogEfcnYMeCYk3wGZAaS+jMa3xWi+OpWKW8xy/Q34Q521lZkDGbU
         9uSnR/iDCPbd8hgiecLx5r8jaeinlTPwaQ+Dnh+MiFvTE8Dlqvp6N3z2vpagQaHlJHDl
         kFWbXPDHhheSzi7EOKxo547rkHlR6rnSeXIJVBhG+YsS6LUJZ/4/6hW2mejBcMfuwIRw
         1pmjzD0+DsoWG7y3fteyPJ1qBCFJTbFyneY+Ck1syl9q7jAwcLeyP9Q8Us7SiBntLYX3
         beN/1Y8wLEwWBwWh1/8LvGSMRDF6ZxbjpziDPqnwUuxc9OAGwg2EhLBYM9aqBTqH96uR
         Sxsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774031375; x=1774636175;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tIiKn6ZLHm7vzDihA5glLwC7dBKb/e9gLHDjPrr2aok=;
        b=TXTZaFQkRF25oEChNaaXsgxnxwE7DJRFfThmtWqayLikAOt2OPI1JPDZVZefij/V2s
         /fmudWbCgy6vUTwWUhcBnuyGlfhLn6zC1wTuPw3mzDEsbPZZdkaBn3EY1C9aiqkTORQW
         xesPgg3WFqZFKrFVlQGEAQ2lt7BMol6lOxu53jwCeA1u96TywKJh7aabictcmMPbAbGp
         T4vk9ORy6baxVD72cFkFOxSJtDmWnjbHsuRiX2yrQ/yz63EIvEMJVmCjOXbuys/0aBZ5
         WvQXJvSkWZmSJuUiZ/frh4mvOvUVpoOoUJOCmZ0YEvZ1tBIw7lQNjK+ls/PRLN/1M1Ro
         mBSA==
X-Gm-Message-State: AOJu0Yw4aD8ilIkSdX1S+MJBX2FAndv8fX4tlDzvSE3emXsFqDlSVezc
	+i5xAJQJjk0g4BdZi/+qbVhULK8zta8ScfR4OK1T/4MRoQjdXj/Du/keRZeeeWkYSZg4Gj9bJ2S
	rqssF
X-Gm-Gg: ATEYQzxcFsKJHq1oFMz2QabG+QceHjJOOK/wWvAxL2OG28Nxt6Z9uJzNHrLWQ+c7fJn
	08StmlwxXchOHkEE7RR4nd2ABFQo1U/y1WOyma9w7Hh0osBE/ligR6rQ7DnqL4L29c6Dv8AQjiG
	5T4asNyotY/cAOh0o2jKCJZ6i7yjNTg4l4cxYlQQULx5ZO19Uq7BU8AFvTyKl/85NybUGKlgdfM
	zW1re08K4VSSxhcMzsP20zxCZ6++EoAFA64B5i/qbvFyGvQTInLzkpAGe/K68TBt4EsaLwSvmnB
	gsTXT/06xOQZajbiuIQA8PPIUB2b0JO6/e7Y3F+dzh2+H6+rralk5c6jntRqWG3CAr/tJDel+vK
	37KAbaP4zOl9mgMGfB7tN0NT3woTun3c0i5kctt//BXkxzO5TPOoXiLKTWDk8BaWwbMP6NJ1qTW
	YzP/b/pqnfZw==
X-Received: by 2002:a05:600c:348a:b0:485:46fd:7887 with SMTP id 5b1f17b1804b1-486fedd7fe6mr55523325e9.13.1774031375336;
        Fri, 20 Mar 2026 11:29:35 -0700 (PDT)
Received: from localhost ([189.99.238.44])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a903f82e6sm20771397b3.17.2026.03.20.11.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 11:29:34 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Fri, 20 Mar 2026 15:29:18 -0300
Subject: [PATCH 3/6] selftests/run_kselftest.sh: Resolve BASE_DIR with pwd
 -P
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260320-selftests-fixes-v1-3-79144f76be01@suse.com>
References: <20260320-selftests-fixes-v1-0-79144f76be01@suse.com>
In-Reply-To: <20260320-selftests-fixes-v1-0-79144f76be01@suse.com>
To: Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openssh-sha256; t=1774031363; l=1081;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=RrVGneoI97HAbFh0po9veu/6l2CV4YOVmpXZ5Qd0yT8=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QP10u3g8MDAKX+kB6cmaiHc+8KUwIN2ttQAAFSFeV5mvkh/k0v9uc8Xwu06/L1f3zTyFuHDCv4P
 s/HAjL6I7RQ4=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

run_kselftest.sh only needs to canonicalize the directory containing the
script itself. Use shell-native path resolution for that by changing into
the directory and calling pwd -P.

This avoids depending on either realpath or readlink -f while still
producing a physical absolute path for BASE_DIR.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/run_kselftest.sh | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/tools/testing/selftests/run_kselftest.sh b/tools/testing/selftests/run_kselftest.sh
index b782b025d002..5f7bce9a640b 100755
--- a/tools/testing/selftests/run_kselftest.sh
+++ b/tools/testing/selftests/run_kselftest.sh
@@ -4,12 +4,7 @@
 # Run installed kselftest tests.
 #
 
-# Fallback to readlink if realpath is not available
-if which realpath > /dev/null; then
-        BASE_DIR=$(realpath $(dirname $0))
-else
-        BASE_DIR=$(readlink -f $(dirname $0))
-fi
+BASE_DIR=$(cd "$(dirname "$0")" && pwd -P)
 
 cd "$BASE_DIR"
 TESTS="$BASE_DIR"/kselftest-list.txt

-- 
2.53.0

