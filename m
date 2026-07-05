Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B812E2FC876
	for <linux-kselftest@vger.kernel.org>; Sun,  5 Jul 2026 17:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783271460; cv=none; b=JEZZxux0SXWBAtXV4/wi2dFZa12H9lrGLGupDNDZMmw1nJjDlA8zV7VpqhToqa0MXbpouBEhMCuf0CeAGZN2YZYfyn0jFQwksGvLseVEIAMb7laHQQy5KvrQms6EzcX2R4MbKhLOeTRS4Z1cMvUqkNY/0Lr1897NhKpJ7KSPhNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783271460; c=relaxed/simple;
	bh=dKbDeK5JMWOskgWhH2hh7caMG/c2GZ2IPAktPg/6cNs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JGm/7+TZRvn1hR0NjEKTwXqtF4R4Am+bW0veWsajxYxkitN0U7sZtwLWN8nLqWEZXSAEKQPGpIztUyfeDAYF+SV0xxBsee3I1DDbV5/zou/y4Wb7OYWVfXERgPPC5OVi/xQu2GyaEziVL//+yXxWgsw/MfQVNMVzmXz+53BnmR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kDitKflW; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kDitKflW"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cca24023edso512375ad.1
        for <linux-kselftest@vger.kernel.org>; Sun, 05 Jul 2026 10:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783271459; x=1783876259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F6oriXBGQKRVO8BFxyvH8HRrLjtHNA6kmEs+Bsjv0iU=;
        b=kDitKflW8giQwfda6RrlbI49/Xk4B7wcYcgaoA1SgnzB8/v1PEnvaRrT8J3yGiBCfZ
         htpHSE1XpvpZH4cL71/cLddoFKsZob8k/P5ORnzU3BfRurQ+ZbgHH/r/AiiyUoq31A0H
         hYurNpbXVjnJfQAwpax+xVTDrgjY+or+tcXS7DV97Jw++O7CkjmmrlZFzHWjs9pJ0Y9c
         pLC9BOT1hgE9rvi3OgfDeY9KHfzSJ3bFgBiIFGp1SCdnraFbCpWlJ++B6Io4ih28fba0
         t7fCQvE4PFbQEYjPq6L7TmI3YUwDOI6IW1ACx+mbG9VlgzOwQ6LWAOUTgwP0fr5aHL9U
         op4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783271459; x=1783876259;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F6oriXBGQKRVO8BFxyvH8HRrLjtHNA6kmEs+Bsjv0iU=;
        b=tDjHdk7/oOKVyqbIjZ5AF0ARwdT1gkYU34BwzCX/UxAiRqJSSr0ZcUnAI2Xwq54Tz3
         QsZcy+4Om/HOhrzfhxL8mw01P/yBxeo0L93tuj1Yuezzqccrzp9MaRbrrrgHYz4f2RL1
         UbCw6akhs/Es6sLZw4K77V1iUutj2RlaodxkKOcUPz34vc7kfqWRXbd8k3CV3Q72ltJd
         EOcDPBPwI5HT7fc/UD9n2UufP8NBwfrY60cD/CKxZCBdJ3q7ldx9HSh7pDItjMM6viD7
         NHWInGHNd6adHRZsDaUuefYoOz/JhSe/WqDYBR5fSbTP8C4HEoC0hInAecO+BDtSXOBd
         FKrg==
X-Forwarded-Encrypted: i=1; AHgh+RqRkMTyGxp1CTYyrnDryykIB3J56FP0cwL/GoeC6VYRb8nZ8eOEC5Y4Uwva57mrnxPSd4SK6Fu7Rq8P2KbOuTY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZll8uGvLraoJz4DO5r48kRwt97xTScj4oP7DtyeeiMXZjR/4d
	C14SKliUin8g9dWgpyuyw/jeUa6snx014qONlcLKzWt2PowUBuxxHf/e
X-Gm-Gg: AfdE7cnOLepjTdM5JXLY+q+4HbMxB7nEw7/Joq7QLDkQqpwxDTONHdIv+CPygGNKqXz
	znbSfBMhsElzwpnS7jqw3c9VlPCVUzgYGl5HZ9/rN7qxYfjYdT8O6Xp/Tqr9ilA9Q7QupXkUF5j
	l1AnIp1Uk4M7f/rJaemI6XuAT3g78u1a4iWFlDLDr+xQT/ORONyAbIBYfwixKdEGtmHYkYR6jwD
	3ZfIEVbnMGVRT42411WZNbrybaxTZBJub49OQ5JEq3d0OnvcW2zRb6SJR4QEoWGWg2+k+oT8sZc
	/3IqKbugX6YUPtZwZPAB9uFyLmosKNQfNsLc49qLUmZOm7PdoCuliZVJDtfg+wSKRD0BR168Idw
	ynJt6XqUrFNigdO68rba5PvORjYq2GN3sRviMTmlkrRYnw5b0W4S9j1NYxiq6myz/VA48WxR7Pu
	cOwAX4fCA0pf5MCKohQ6arojkYgnlOm1VrMKUNCesv3XFpGymbFYthX7UU+w==
X-Received: by 2002:a17:902:ce83:b0:2c9:97a7:71ae with SMTP id d9443c01a7336-2cbb9f2a80emr65200725ad.41.1783271458503;
        Sun, 05 Jul 2026 10:10:58 -0700 (PDT)
Received: from fedora.mrout-thinkpadp16vgen1.punetw6.csb ([103.133.229.222])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c876ea9sm39655434c88.13.2026.07.05.10.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 10:10:57 -0700 (PDT)
From: Malaya Kumar Rout <malayarout91@gmail.com>
To: linux-sound@vger.kernel.org,
	tiwai@suse.de
Cc: mrout@redhat.com,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	Malaya Kumar Rout <malayarout91@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/alsa: Fix format specifier and function mismatch in mixer-test
Date: Sun,  5 Jul 2026 22:40:38 +0530
Message-ID: <20260705171038.171966-1-malayarout91@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the ctl_value_index_valid() function, when validating 64-bit integer
controls (SND_CTL_ELEM_TYPE_INTEGER64), the error message for maximum
value validation has two bugs:

1. Uses snd_ctl_elem_info_get_max() instead of the 64-bit variant
   snd_ctl_elem_info_get_max64()
2. Uses %ld format specifier instead of %lld for long long type

This is inconsistent with the minimum value validation (line 335-339)
which correctly uses get_min64() and %lld. The mismatch can cause:
- Incorrect maximum values being reported on some architectures
- Undefined behavior due to format specifier mismatch
- Potential crashes when printing the error message

Fix by using snd_ctl_elem_info_get_max64() and %lld format specifier
to match the data type and be consistent with the minimum value check.

Signed-off-by: Malaya Kumar Rout <malayarout91@gmail.com>
---
 tools/testing/selftests/alsa/mixer-test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/alsa/mixer-test.c b/tools/testing/selftests/alsa/mixer-test.c
index d4f845c32804..242a0b21e85e 100644
--- a/tools/testing/selftests/alsa/mixer-test.c
+++ b/tools/testing/selftests/alsa/mixer-test.c
@@ -339,9 +339,9 @@ static bool ctl_value_index_valid(struct ctl_data *ctl,
 		}
 
 		if (int64_val > snd_ctl_elem_info_get_max64(ctl->info)) {
-			ksft_print_msg("%s.%d value %lld more than maximum %ld\n",
+			ksft_print_msg("%s.%d value %lld more than maximum %lld\n",
 				       ctl->name, index, int64_val,
-				       snd_ctl_elem_info_get_max(ctl->info));
+				       snd_ctl_elem_info_get_max64(ctl->info));
 			return false;
 		}
 
-- 
2.54.0

