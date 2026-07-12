Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE93CA6F;
	Sun, 12 Jul 2026 02:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783824434; cv=none; b=Udrt3B3WXYceRpvt42QU5ET/9P/kO2dzg5l7Rb8qXLffDDMdF+pzqZupg7XT5DsfDJZcynqeNiVVTwKNwLPDcXIMvajBLoLdRESBwx82YjhuGWRuDmPKaysRjayVlPrmvhLYIxRTcVaFD064dzN9YCv4J+Fh+Saxw9FW7us1rH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783824434; c=relaxed/simple;
	bh=DFVqX2r5tyR2oLkIHCQAv3+gWcYB5gCOluxfLzmDwEA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=r8ykzk0eYn0fqnT4dDjjuC76kF675W1HAqKtyZnGPFiH94SdkC/U8bOYdE/zrb3M5bza/kmmDWQ/Ca76mC21pmgD8Z+N6O6S6/nARk9szzhl1D6rHNeVKQZ7FWU1YlELbXGdrm9JhSWzW+r6u+bP07vxXB2qtBfkyZuW1hCNNqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cuQ/6bYH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cuQ/6bYH"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 162ADC2BCB3;
	Sun, 12 Jul 2026 02:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783824434;
	bh=DFVqX2r5tyR2oLkIHCQAv3+gWcYB5gCOluxfLzmDwEA=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=cuQ/6bYHspIwR3v/ppCZHlUh+Qq3/RfVTkp7Ihbk0bvjqzz7QPAIjT932hDaiu6GW
	 03L5U7UXnJoBjZsh7xVqjUNRBml5mVyOgb2HlIMImjiFm9NM9GcET9EVfKNxvFIMW/
	 2U4CYBAE9oSq0Unkgfp1dn+ADQRa2zu7UuAywZSee7/Lusw9feb72LOUS+GbHjCRGa
	 dlWE7/JWNqZZR1r5hW6Mkvb+KgmJiI6MiwzIE2yxcZLUm/eDPFTsvbVayc16HFb96W
	 zkuApCLCtvArGKCYIGbj/hagK55cHjmQomLJ21eFY5pSAc37JSgFOUupgFnr9IAkrH
	 +xet8TBNV4Z6g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2BACC43458;
	Sun, 12 Jul 2026 02:47:13 +0000 (UTC)
From: Miles Krause via B4 Relay <devnull+mileskrause5200.gmail.com@kernel.org>
Date: Sat, 11 Jul 2026 22:47:12 -0400
Subject: [PATCH] selftests/futex: Give circular-list nodes static storage
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-futex-robust-list-static-nodes-v1-1-723754d75cf5@gmail.com>
X-B4-Tracking: v=1; b=H4sIAC8AU2oC/yWN0QrCMAxFf2Xk2UA71Km/Invo2kwj0kqTymDs3
 436cuHA5ZwVhCqTwKVbodKbhUs28LsO4j3kGyEnY+hdf3SD9zg3pQVrmZooPtlGNChHzCWR4OD
 2p2S/c3AHMMmr0szLL3Ad/yxtelDUrxW27QM1Z93EggAAAA==
X-Change-ID: 20260711-futex-robust-list-static-nodes-7048d7119a05
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, 
 Davidlohr Bueso <dave@stgolabs.net>, 
 =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Miles Krause <mileskrause5200@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783824432; l=1518;
 i=mileskrause5200@gmail.com; s=20260710; h=from:subject:message-id;
 bh=08Ia/Sl+qT3Kah/g1jX/YTW/yGaP4wipGXelK9b9UyI=;
 b=W2Kn/c7e1+v/z2sVd7S9lCOi60U7HWm6XdWHZtL6PB5obvihJuqE99467wAdqOTAfQXNdBVZO
 95s36WHxA6+DOnaERgo5LedR5rnvi5krTmsk1Fwv9ZLSAxDK94RMoN4
X-Developer-Key: i=mileskrause5200@gmail.com; a=ed25519;
 pk=QNhNjcQarqig3ColJBIEr3DYfWM1PHpP7z+6thxWXaU=
X-Endpoint-Received: by B4 Relay for mileskrause5200@gmail.com/20260710
 with auth_id=861
X-Original-From: Miles Krause <mileskrause5200@gmail.com>
Reply-To: mileskrause5200@gmail.com

From: Miles Krause <mileskrause5200@gmail.com>

The registered robust-list head has static storage but points at three
automatic lock nodes. GCC warns about storing the address of a local
variable in the static head when building the selftest with -Wall.

Give the nodes static storage as well. This keeps every object in the
circular list alive through child exit without changing the list topology.

Signed-off-by: Miles Krause <mileskrause5200@gmail.com>
---
Built with:

  make -C tools/testing/selftests/futex/functional clean
  make -C tools/testing/selftests/futex/functional robust_list

Tested with:

  tools/testing/selftests/futex/functional/robust_list -t test_circular_list
---
 tools/testing/selftests/futex/functional/robust_list.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/futex/functional/robust_list.c b/tools/testing/selftests/futex/functional/robust_list.c
index b3fab60181d5..2300253a7e35 100644
--- a/tools/testing/selftests/futex/functional/robust_list.c
+++ b/tools/testing/selftests/futex/functional/robust_list.c
@@ -523,7 +523,7 @@ TEST(test_robust_list_multiple_elements)
 static int child_circular_list(void *arg)
 {
 	static struct robust_list_head head;
-	struct lock_struct a, b, c;
+	static struct lock_struct a, b, c;
 	int ret;
 
 	ret = set_list(&head);

---
base-commit: 051f5d223dfc1806e216f60e4b29c1bf35f5c2d3
change-id: 20260711-futex-robust-list-static-nodes-7048d7119a05

Best regards,
--  
Miles Krause <mileskrause5200@gmail.com>


