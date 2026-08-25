Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915762F84F;
	Tue, 25 Aug 2026 11:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787656878; cv=none; b=XJTb1ktKIqtZ/N01+gtqeE1gP2uzeWaGnjYPaW/b4UhTit2ZiSbOmp8qI7KEdKUjM2L36cVi6yW9bvgeDPCYiNJjTgMzoloQN+VP93qwBPgIWT04rnm8yHtXP+qg14LPwsNRLJPSznAHCuxsWadpdZ3vMEAdPcKafohV2BxDOyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787656878; c=relaxed/simple;
	bh=qZnOR8M4AndwDXO1OfuZmJMJJhPcOsrYOXkrmMVezfQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WdCLfa7A0dkPQ7jZLGEUvbiRkc1JxoDmFItC2qaKvZ+VrAf8mxr7oPmHQwarS/gCFv0uIz3Mfkh+BusUqo1V9GmDSUHhrAeCaoAOdzXx+DcDvO/F4Fc6ttQnXDl1F/Ab4rXFRNDn7I09NipcrHlgfiWuMr/f3yZ4skjc7c/39Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UWzSPvTl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UWzSPvTl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B42E1F000E9;
	Tue, 25 Aug 2026 11:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787656877;
	bh=h8WSm5E7RlGy21wvox/gCKYIqtupoRWvitRuKuzB5iI=;
	h=From:Date:Subject:To:Cc;
	b=UWzSPvTlT17GOPXKdB2QDqA27AvjHK2nMD/TzWVxOyffkoNG1q0ENJWpQ1HjB6JBR
	 Q0hPzAFedJMTH4MRz5qAYglF2NmDiCxAU2bVoctsQrNEUf3Bnpwpzx1+kXWtpuMqV1
	 tuxfqm0GfCvRiMfzHzae19/gLrsq3cQ5HrC2IDA1lFJQkY2hqqBpftYcT1AQuipcIJ
	 OoMc+GU9WoJHnRmdqm1ih8jHn0rEgFHamhUxQwTC+D6go+2dmcVzQYiXArF3ZFT0+W
	 kxIRBcngGACA1g6kmvoTNlPWbMcMEJvncbPsfzXVXyu3RFaKbcfNrNM+rJ1Y9dsTL+
	 jinm2F7iHcO2A==
From: "David Hildenbrand (Arm)" <david@kernel.org>
Date: Tue, 25 Aug 2026 13:20:59 +0200
Subject: [PATCH] selftests/mm: khugepaged: remove str_dup() usage
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-remove_str_dup-v1-1-0ba2121a820c@kernel.org>
X-B4-Tracking: v=1; b=H4sIAJp6jWoC/yXMQQqDMBBG4avIrBtIYxXTqxSRRn/tFKoyoyKId
 zfV5bd4byOFMJSeyUaChZWHPuJ+S6j+vPsOhptoctbltnCZEfyGBZVOUjXzaEKwhYdPrX+0FKN
 R0PJ6Dl/lZZ3DF/X0v9C+HzyTaHpyAAAA
X-Change-ID: 20260825-remove_str_dup-bb089e93094f
To: Andrew Morton <akpm@linux-foundation.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>, 
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
 Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1154; i=david@kernel.org;
 h=from:subject:message-id; bh=qZnOR8M4AndwDXO1OfuZmJMJJhPcOsrYOXkrmMVezfQ=;
 b=owGbwMvMwCF2/OVpCdfQ3ZWMp9WSGLJ6q+YWHl2+pORhy5P5u06cfNYb/tSIqX/RQqMDiXNvN
 RyVXKMf21HKwiDGwSArpsgSFHzf4OXLdbXVbnzMMHNYmUCGMHBxCsBEFL0ZGW4Z/7i7tp1LK7qr
 fXunywfDXI5/7nnctiYuru91l2ro7mb47zt5dyj7/I6bGkrHJ0Z84+2yt/q5JNRfcOmaO5ob11Z
 HMwAA
X-Developer-Key: i=david@kernel.org; a=openpgp;
 fpr=1BD9CAAD735C4C3A460DFCCA4DDE10F700FF835A

We don't check str_dup() return value and never free it. While both
things are irrelevant in practice, let's just clean it up by working on
argv[0] directly and avoiding the str_dup().

Nobody after us needs these parts of the argv[0] string anyway.

This patch is inspired by previous work from Anshuman Tewari [1].

Link: https://lore.kernel.org/r/20260821114416.12255-1-anshumantewari123@gmail.com [1]
Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 tools/testing/selftests/mm/khugepaged.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index 1d2d6bd72fd2a..83d27d069c413 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -1227,7 +1227,7 @@ static void parse_test_type(int argc, char **argv)
 		return;
 	}
 
-	buf = strdup(argv[0]);
+	buf = argv[0];
 	token = strsep(&buf, ":");
 
 	if (!strcmp(token, "all")) {

---

base-commit: 169393fff5d1ec2690934067eeb95544ff5ebdd7

change-id: 20260825-remove_str_dup-bb089e93094f

--

Cheers,

David

