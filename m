Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1946F403EB9
	for <linux-kselftest@vger.kernel.org>; Mon,  7 Sep 2026 06:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788763315; cv=none; b=adHc6dB9GzcVKcRqZz1e5Yx1CMhUKy3KezxT3HXFhIyyqJ59OElsDVz8Wjny48LeR1aZ1yfhToTTX1JibMegoOF06hBRin0osc5JH2OXdeiBTtnDKeSxs4LpDOl5yrHT0Cnxzr+K9wIesV8lin99AdqjHV+VFdVu/6TDO/proi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788763315; c=relaxed/simple;
	bh=1cJY6sL+Q6oG2/VnhFlaXz7tgv3rZc5fSR5r9wiilcM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QSGvPbFgf8c2we8iW6zpYSPJek6YzEXp8SDr6E+nKJcxI9x61va8gBrSta/o1EIq91/Zf4WqMRUe0ynneK4YHdD8iP1vO/TrGQvx77+Dph3CL/9htUguKZoEdzxAZ+6O6dCwSThDLsiEqBIRXTFb+DtumSH3CImcWErD0sj7Igo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n9QbOWEP; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n9QbOWEP"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2db18e5cb56so28436515ad.0
        for <linux-kselftest@vger.kernel.org>; Sun, 06 Sep 2026 23:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788763313; x=1789368113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vvpO/+VHQl+z4w7f6yOyVn2oZshJZNt+Vlm/SjhRNLI=;
        b=n9QbOWEPubRmudynV5jhJHNME6N0aBKMpxH7MFo7ob+wBluIf59xWfYxptknsKtU7r
         c+zAKNtY9z1SzZT5AKfDujDWOOzvhw9/V/pedX7IvvtVuEzmZz/vg3BSlHDqA2KSLNar
         fAF4SN/iq+xWTW4XORM8IoO7smJOiCMhb49Dd6qi/EL501Q1Ra1pGYpCn8lta5chuoac
         eqxn9kSvTYnVzs1UG22fn+bAG1anA3N92RlXGR13p+rwHEQlhxSyF8GC9ZfKfECdh81r
         2uMXtLI3+8ssDhVgsvxuplUgSfO8SEo3Grei6DwzzdXHmynuhM+Div8sFLqnIABf3Mik
         b5FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788763313; x=1789368113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vvpO/+VHQl+z4w7f6yOyVn2oZshJZNt+Vlm/SjhRNLI=;
        b=TnE+JRB7Y+VpHlg4YgqMmnHS0pi1JVr4iGtICBUu7tAhL1Gg1BXf4rwBuN8JVsO06a
         33VJusY+bU86IxV04AyyueJBV4sH4AK01GFwMzl2aXp3ohG2e/6TMixlPhH9ri0waWP3
         Rr73w5UOnYnPs24Ym3QZLUZ5N5QD48JA/wayG+fPc0xeqW9r/eMPOULjGDaCH6y4VA1s
         sxWt356vj9j71P9PjqiUlMnq/ruPWkY/h9F07TOCY4egsZEyzFBpV8TD0rNCTs0A9Pbw
         Jfk1ECBrUQzT1RJf3zmYJd9pewTicELCyFJhNPs5kNkWMZbqASjjLiHvYObcCrymufrL
         pIZg==
X-Gm-Message-State: AFuF++mO32j1IaI0mQxsc//anKVQgF/lV/XHBDkVnoHY4Lv68UdFpL8z
	4y7xBPJ51HGogETOAodCc5sgXh7wDDKf/t7lNT97VdDu0iG0tkL9XhIC
X-Gm-Gg: AYBFou0ovAqA1YgeDjWbagh2dpj9YK9OUZtfTbd7k13VVZ8/+Mbzx4jeTxTFI+OzA98
	XXb1xopMP1vNkVt7+U3VdWt5B676JFhdoEi8Ow/nXHFZe0dDPkCxHVdCyF6MkwO0mDygobBXYaH
	gUolirnK68tDFUBm789+ORoFM/tnZYTwZUqjcxyq0hQDV8AInQkXwVdwHT7YTuI/r7ECxwBDloF
	cRorEElU9r92TWVUCrI3XBde4DJQMgH10qN9dzJr0llVjiCmZuBsV/V3rN3sgev3Mvj94q+BCx5
	6i4ETQla0YuZ0VXMhqbhVcD+Jpo5UlhDvcd31fRfPsm01W7lDmpAhomKLeCS/3YU/DH89bemFId
	KFxxK5fsRolqf7c4J3eydYuJNotrk8MMmLNkDheefC69etW50bNicMYzrHxZox6SgVyzX1Jnqoi
	V8dZbMOz0Er+vFxeTwfVY4GfcPjv00SUQq9lg0M5nuWJ6EQdrul4y0OYbtIWsjO1DICUb0vHcfc
	6MFAAcydPbuQwUYin+YnNcx
X-Received: by 2002:a17:90b:5905:b0:398:9bd5:490b with SMTP id 98e67ed59e1d1-39b262133ccmr31094553a91.18.1788763313430;
        Sun, 06 Sep 2026 23:41:53 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143240d86c3sm22413038c88.0.2026.09.06.23.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:41:53 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Shuah Khan <shuah@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	x86@kernel.org,
	Dave Martin <Dave.Martin@arm.com>,
	James Morse <james.morse@arm.com>,
	Babu Moger <babu.moger@amd.com>,
	Ming Lei <tom.leiming@gmail.com>
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-block@vger.kernel.org
Subject: [PATCH 2/2] selftests: core: fix repeated word 'and' in comment
Date: Mon,  7 Sep 2026 12:11:38 +0530
Message-ID: <20260907064138.38689-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907064138.38689-1-hemanth.selam@gmail.com>
References: <20260907064138.38689-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the second 'and', reported by checkpatch.pl as a possible repeated
word.  Only touches a comment, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 tools/testing/selftests/core/close_range_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/core/close_range_test.c b/tools/testing/selftests/core/close_range_test.c
index f14eca63f20c..88e7ce6ee977 100644
--- a/tools/testing/selftests/core/close_range_test.c
+++ b/tools/testing/selftests/core/close_range_test.c
@@ -506,7 +506,7 @@ TEST(close_range_cloexec_unshare_syzbot)
 
 	/*
 	 * Create a huge gap in the fd table. When we now call
-	 * CLOSE_RANGE_UNSHARE with a shared fd table and and with ~0U as upper
+	 * CLOSE_RANGE_UNSHARE with a shared fd table and with ~0U as upper
 	 * bound the kernel will only copy up to fd1 file descriptors into the
 	 * new fd table. If the kernel is buggy and doesn't handle
 	 * CLOSE_RANGE_CLOEXEC correctly it will not have copied all file
-- 
2.48.1

