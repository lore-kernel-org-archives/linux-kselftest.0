Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1A13F2106
	for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 08:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782721724; cv=none; b=s8KfBMz1fJFaCHdezdNtaMuA+XjOhnG9SsTvf2P9whz1Y7nJZwjY0N/lAy4LnsPJg3GiXiu4Gv8JHMveV181eiTNQXTv2t+lWtGLC3VUtObrqX37mQueCXV3kj7f+g9mVC+SOAcC3oqw4dou/6OsPZZtk/Q7xJDGmVutqH9W2Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782721724; c=relaxed/simple;
	bh=De/vsgMdYMrS2AQ+tqlj4O6nnOPDD/rmfoCD54wdRA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bPtt7AuU5huniHJ5TfRqPQZbhW6Bckvu9fSohyywKKdVP67FfRMDm98lNbhVwLme8YRyz3iyJD5weKHaFrQaNUmTGxptL+2W7QTRiKCd+4I6vFlar3T1e2NmApjzw1u+Ru9D3nvKzZiDHBGD0nPw4URRPNr5o8VCYNHqL70R7MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bmRtfXsS; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bmRtfXsS"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-37f72212544so2498215a91.0
        for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 01:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782721720; x=1783326520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1R5ufUL1JYVLa5BSDpNGTaM8Nbmty7gpJMGe0EiBf8U=;
        b=bmRtfXsS/UGIK1ftwCpOfDlgPxaCs3MUnJUVneNQ4BxwM8KUP1b3q3yhLEQEvQmgBy
         BdqKzjQ7a35BP4THJeo+aezUujB3IdtuGhaHZL6tolu6d77My712Ka6Jja0B86DtqR6a
         sEXEmzyZE2u+Dv//Publ1sitXNsg0oJI5Oyajf2rt6ibh6terMfOgy9U5o4jKHHD5V79
         OvunIOKDWPCWmk8hd8UI/VXDWAPmJk08ks/6HYrH41nGeEpkZA8DIiYZ2NfRf5SRHuVN
         hawPsrIcegnhbrTX4sP6/+KDmPQ8BUws11WdhDtUsTfyULMs3QTp06tBQAgsw1axQpSt
         q/6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782721720; x=1783326520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1R5ufUL1JYVLa5BSDpNGTaM8Nbmty7gpJMGe0EiBf8U=;
        b=G+YAz/qBmfD9wD4/JKeFgD1t+sEfAogwL9w/oXwBlexE1lGbX8/EE0uKwsuyWP5xPw
         Z9UfPraYFgMhDhT3dNc4YyWfhSv6101rLHgEOfnr0dPcyVvFVwMpxv2KpUuo53G137kp
         YGzCZY9Atw0CcyWWIY4tciJnLudSTLMsYHYHzdUZe1hdsdoBVPdSxFW7EL3qc9HCzXGt
         nkU6zyUSX7oDy9luq71YTbR+nOJrwyyfol0zIq/S6tndKDaapb0phgwC6dGwwhQDXHj3
         4xS+h4SHC+p6H+cOnhIU9jYoojRrGL9JubS1o3JThIF3AcXbgMjzpiaEGeeyZi7Ruw/z
         gOHw==
X-Forwarded-Encrypted: i=1; AHgh+RrqFax7m4HfzZXUv9mUn32M5oI8FQjyDHHMWN777jGpr/9NN4RcHjV/xnQL0nMUC4s6hjaRrlGxCrLl6LXjGXo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrdXNnj5gJwMTEckIdj77Subozc4VGaRIg9PTLdjfKunlC5bTK
	WBexiWry+FphpqnUcSfwZJE1cSqU4b0hOyN0Ns1nRJF1yNUqpttkDFB4
X-Gm-Gg: AfdE7ckNNGCPYHVEX0HPJ346o+psfp8MyBRiWAzgYip1bTTWfjYx/jwnliKQcDr1zYQ
	oO6q/G4FHFasvYc4M1oVicgwNXBQ9mZf1/sm7XqtErpPgJFba/cqaaKlHCsGOyJ7IOMza97v2/X
	GFpKPxFAIUdD2MbuNc+Cci2gACFpNIworw16uOBfpghM11884zoaJNfexkObV0JWq7kSHwFMLoP
	yQiOWT6RTfsMyNmBXxrJ7q7ZYFEGsX+lyMnhcDvJB3AQHTv5A4kE+dPCvvkFfZHHcQW1hZNa7h8
	aFm1KjfuTz7zGc6jTgo/h5AM70KjZZ+BsEvRcWMA3eUiIr1RAO+VjRyE5aWUZ8UZ8CJIUvvPlor
	xhC9S6ivjWFoMOc/cwxmZK2W7CPJiw72VI8BhQau7k+FSyh8nEM6H6ABNIItsCyJg46hJDf4beO
	xbysrr
X-Received: by 2002:a17:90b:2ec4:b0:37f:d265:18c5 with SMTP id 98e67ed59e1d1-37fd2651c13mr5031747a91.18.1782721719646;
        Mon, 29 Jun 2026 01:28:39 -0700 (PDT)
Received: from martin ([2405:9800:b862:14dc:12ff:e0ff:fecd:7ddc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37fd2bd0e49sm3259343a91.0.2026.06.29.01.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 01:28:39 -0700 (PDT)
From: Martin Weiss <martin.githubacc@gmail.com>
X-Google-Original-From: Martin Weiss <Martin.weiss2410@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Martin Weiss <Martin.weiss2410@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 3/4] selftests: powerpc: fix spelling mistake
Date: Mon, 29 Jun 2026 15:28:08 +0700
Message-ID: <20260629082812.551273-3-Martin.weiss2410@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260629082812.551273-1-Martin.weiss2410@gmail.com>
References: <20260629082812.551273-1-Martin.weiss2410@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Weiss <Martin.weiss2410@gmail.com>
---
 tools/testing/selftests/powerpc/tm/tm-tar.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/powerpc/tm/tm-tar.c b/tools/testing/selftests/powerpc/tm/tm-tar.c
index f2a9137f3c1e..ea420caa3961 100644
--- a/tools/testing/selftests/powerpc/tm/tm-tar.c
+++ b/tools/testing/selftests/powerpc/tm/tm-tar.c
@@ -50,7 +50,7 @@ int test_tar(void)
 			"bne	2b;"
 			"tend.;"
 
-			/* Transaction sucess! TAR should be 3 */
+			/* Transaction success! TAR should be 3 */
 			"mfspr  7, %[tar];"
 			"ori	%[res], 7, 4;"  // res = 3|4 = 7
 			"b	4f;"
-- 
2.54.0

