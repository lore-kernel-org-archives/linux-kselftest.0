Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AADE3BADAA;
	Fri, 24 Apr 2026 12:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777033472; cv=none; b=eHEcLrT+yqFddTNsnxXFlTiYURPug0Rb0+gXUQwON5yED5D4p0Q8Tsu5J5dbpnE0zyb2P9IvQea5u2cNCXgOXd2bDN2CTYn3oUxzMcfCjUFQvKnlMERJ0mowT2yD8ENhF9+o5Jfnv90qfH8bzytMQLLpl3dUMgJac55k/XrAtdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777033472; c=relaxed/simple;
	bh=7lm0oK+mnNa7lcfmncY/+Y6+e7vu6VbtV0bCxg9C0n0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sXVGcVa7be2fvPkR2m8HlXB8ftrIInNLo5/U0tU/zh9ZI4fn/JCkMk+Xjw+wsiA5juWwTwaO2bhyyWp5kQqP+X67x9YIDKpWjLhfDIlr3Afq/bZVyk+q1R7sPhKhsc+35IPpta/3KhR1R3R+IK2FzTDvN/3Y1kZVtFAjJLCfk84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=bSrD78zk; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="bSrD78zk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=p7gOUZBYoVRPaxWe4o+yvogsDm8mw2e6s7QwNm3stTo=; b=bSrD78zksL+9G/yXC8/A6BkcUW
	O9wMV2oEqTSUawDnArmaHfr2L31kSmTyNxwOYLPCRuMVZPhgCzLz69mYCYAJE84CzN6g+szd1Squq
	TlejHmQnXQSmD+CIf5e5bUrdQDpmrogK+pctPFEcvwWZp/U5FHwl/agrfBTC4q6Soqv/IsNi2tqgL
	DD88AQZN2k1eIz/oDSSQnTrijfgtp6dJl0DGuIRRMp+ClR4L81HcM2ybCCzFZLp2sMB+MznJi9nOh
	h0GTf9xsVfNIZsrR8Yx8MGuvLUWmRAQZXKlnO5ybUt3pmytDTqvBMJY7jy1PtVn6ot7i/8T93Lgq6
	rVrbig7Q==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wGFa5-003APa-1U;
	Fri, 24 Apr 2026 12:24:25 +0000
From: Breno Leitao <leitao@debian.org>
Date: Fri, 24 Apr 2026 05:23:59 -0700
Subject: [PATCH v5 1/4] mm/memory-failure: report MF_MSG_KERNEL for
 reserved pages
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-ecc_panic-v5-1-a35f4b50425c@debian.org>
References: <20260424-ecc_panic-v5-0-a35f4b50425c@debian.org>
In-Reply-To: <20260424-ecc_panic-v5-0-a35f4b50425c@debian.org>
To: Miaohe Lin <linmiaohe@huawei.com>, 
 Naoya Horiguchi <nao.horiguchi@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Breno Leitao <leitao@debian.org>, kernel-team@meta.com
X-Mailer: b4 0.16-dev-453a6
X-Developer-Signature: v=1; a=openpgp-sha256; l=1179; i=leitao@debian.org;
 h=from:subject:message-id; bh=7lm0oK+mnNa7lcfmncY/+Y6+e7vu6VbtV0bCxg9C0n0=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBp62DtcfGBW7vwyPonjrr9fSNlpZBREuvDdKhph
 ZviCP0L3tuJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaetg7QAKCRA1o5Of/Hh3
 bUCXEACJqvZ/QZYA5IPrGQOS+grYAiPtDz9AJF6o/NUfAJR6p6eBswB10uwO/tIh+Q56AJMhTlP
 Z07kLsY1FJaAZya2IJHIIUOF00JLN3evkX1vPWmR36hK/Jw3Ucn3L+pEsOXp3n285jXpEZvXZpg
 7kbL5An2Jzfm1oIePV3Z3it3pvrgaeKpdR+98VWzyVQHrzZ3d+SXFilMV0Km43Kr4HcG67fkpDa
 Ez/zdvSQ5K9OxhTd9BZE9iXQbHCfQew+2ZodvitIVXvWcE706C9LMVWzcPOpidnoUtj4ko2GG2M
 owqkxFMb/d+dZgCqEA8+HiOdrCD9qvlF2/0IXFLCJxZ88L8/du67Dy4S0kHMvStPI5tPzDmOQNk
 ERdni2NuoAZTn6Crw/B0sewKYhJJA1Hjz7mYdVLyLQ+T35/DCeMNXuSOlx9yhH8/e08X11dMAGl
 6HxbDlBPCXiE31rQCDKP3JOl5EHloCKhe9JbyTRYl3VhE6zHU5b8Ii/96TZfLlOuVQrSd70DIR0
 8VH3PUgUlkppx6ZzhXgG8AJyMzcQ//7VOKAdOd7TB7TVhjjLrWRAOPzkzmRx15HEfJwo3Vovcr3
 cp7Wu7rkd/HmOgFNE5KaeiOBt2MG0Vv3EvApuhK0erFvjWknkg2wiX/sraFP8XdS9dyZGWt1CWL
 DwdKnTzxxZ53SYA==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

When get_hwpoison_page() returns a negative value, distinguish
reserved pages from other failure cases by reporting MF_MSG_KERNEL
instead of MF_MSG_GET_HWPOISON. Reserved pages belong to the kernel
and should be classified accordingly for proper handling.

Acked-by: Miaohe Lin <linmiaohe@huawei.com>
Signed-off-by: Breno Leitao <leitao@debian.org>
---
 mm/memory-failure.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/mm/memory-failure.c b/mm/memory-failure.c
index ee42d43613097..7b67e43dafbd1 100644
--- a/mm/memory-failure.c
+++ b/mm/memory-failure.c
@@ -2432,7 +2432,16 @@ int memory_failure(unsigned long pfn, int flags)
 		}
 		goto unlock_mutex;
 	} else if (res < 0) {
-		res = action_result(pfn, MF_MSG_GET_HWPOISON, MF_IGNORED);
+		/*
+		 * PageReserved is stable here: reserved pages have
+		 * PG_reserved set at boot or by drivers and are never
+		 * freed through the page allocator.
+		 */
+		if (PageReserved(p))
+			res = action_result(pfn, MF_MSG_KERNEL, MF_IGNORED);
+		else
+			res = action_result(pfn, MF_MSG_GET_HWPOISON,
+					    MF_IGNORED);
 		goto unlock_mutex;
 	}
 

-- 
2.52.0

