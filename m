Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7554825B0;
	Thu, 24 Sep 2026 13:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790254850; cv=none; b=eewXPISRl+tQRUO71bfpZyT+l+qYxRz7xXblofwNt9jBfZa7irHmDqFeOQWsmOrJIZ2Z4GLF/+hZJ6ZvO5K9Jt5aMyl2FTXq8uA+bLFrJGEi6vc3BEGOhfzXHyvruQVDhF+DA7A925S0JyoSWhln8T35CEvol2jzdTX+yw4POgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790254850; c=relaxed/simple;
	bh=rO/uioBBB5MMh3jDsV8SdGWSkrqMpS3fgqtY5Gr/ZLU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PtiZIhf989/8cpTbcslElAi8ote0OfWTIt7FK1E+KTyGshoVrqXzd796m2nB1zIxm1Z8IBLXPcp3j/tsrZVCPMs9nV//axamcJVge80f/sKfyFtjmq+GnO6/YKlUowIzL9ztmLl00oPm2Kpfnz3Z0uf1xXvCP8AbarGbeOTqLoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cD6/CVxw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cD6/CVxw"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 79032C2BCF6;
	Thu, 24 Sep 2026 13:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790254850;
	bh=rO/uioBBB5MMh3jDsV8SdGWSkrqMpS3fgqtY5Gr/ZLU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cD6/CVxwsUPB2vGMGYszd+zB3tFCB0Bs/sAgo/yOAEocwqJBq612x02h3tsHU7c6x
	 NG4mKEldAbcdlSIgRuXJUS0Y9HFobZG3xJF8eODWEXUwp2mI5DRB1ZKTsM1jbQwkeX
	 ussjCTzCdypVx+VamOhoXxumN7QDn5Ww75c+4t3Xmj9pEWAMP6gHei3TWu3aiHHi3P
	 +iICc5aeUHlkpRT1xcrtx2iPDUlCqyp5fJhTyGzPotLmF6I3EC+yJ0WRyXiJO0KJAN
	 ruHKivY59fG+Mh4bxQaUl/vLqGuLwKvigttwjlk9S/APU4oWc/MCFD8iTvRsT5pQUW
	 /0yBfZeraTTSA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56DB3C98314;
	Thu, 24 Sep 2026 13:00:50 +0000 (UTC)
From: Alireza Asgari via B4 Relay <devnull+alireza.asgari.net@kernel.org>
Date: Thu, 24 Sep 2026 13:00:24 +0000
Subject: [PATCH net 1/2] net: fix checksum offsets in
 skb_splice_from_iter()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-fix-udp-splice-checksum-v1-1-fe61d65447a8@asgari.net>
References: <20260924-fix-udp-splice-checksum-v1-0-fe61d65447a8@asgari.net>
In-Reply-To: <20260924-fix-udp-splice-checksum-v1-0-fe61d65447a8@asgari.net>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 David Howells <dhowells@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Alireza Asgari <alireza@asgari.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790254849; l=2218;
 i=alireza@asgari.net; s=alireza-kernel; h=from:subject:message-id;
 bh=10aQjP+oz2coB4vcqJcDFDEfRRP5f98Xv2+8tCwyCi0=;
 b=8NR5L/W06Aj8/yjz7hVEj6ADVyibkr2aTYt0eJphxQ91qw1jWWZMr+3Nh+mtaDUaJSWXgexDO
 AJ7KA2lDCjdCv88GE8f7DIhQ2ZBk5mbl+igEgcTtyM/A+G9zJsiQpzz
X-Developer-Key: i=alireza@asgari.net; a=ed25519;
 pk=wuQ0/M69FqoVnrCMUJ13EQCwrCwVjCrtz75k15vW8tw=
X-Endpoint-Received: by B4 Relay for alireza@asgari.net/alireza-kernel with
 auth_id=1055
X-Original-From: Alireza Asgari <alireza@asgari.net>
Reply-To: alireza@asgari.net

From: Alireza Asgari <alireza@asgari.net>

skb_splice_from_iter() appends multiple page fragments before updating
skb->len. However, skb_splice_csum_page() uses that unchanged length as the
offset for every fragment checksum. If bytes already appended during the
call have an odd total length, a later fragment's checksum is combined
with the wrong parity.

For example, prime a UDP socket with sendto(MSG_MORE) and splice two
distinct pipe buffers containing "abc" and "DEFGH". Uncorking reports
success, but the receiver discards the packet for a bad checksum.
This also affects IPv6 and fragments beginning near a page boundary.

Pass the initial skb length plus the bytes already spliced to the checksum
helper. Keep the existing final length update and partial-progress error
handling unchanged. CHECKSUM_PARTIAL does not use this helper and remains
unaffected.

Fixes: 2e910b95329c ("net: Add a function to splice pages into an skbuff for MSG_SPLICE_PAGES")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Alireza Asgari <alireza@asgari.net>
---
 net/core/skbuff.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index b4edbd0665..38783953db 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -7403,7 +7403,8 @@ nodefer:	kfree_skb_napi_cache(skb);
 }
 
 static void skb_splice_csum_page(struct sk_buff *skb, struct page *page,
-				 size_t offset, size_t len)
+				 size_t offset, size_t len,
+				 unsigned int csum_offset)
 {
 	const char *kaddr;
 	__wsum csum;
@@ -7411,7 +7412,7 @@ static void skb_splice_csum_page(struct sk_buff *skb, struct page *page,
 	kaddr = kmap_local_page(page);
 	csum = csum_partial(kaddr + offset, len, 0);
 	kunmap_local(kaddr);
-	skb->csum = csum_block_add(skb->csum, csum, skb->len);
+	skb->csum = csum_block_add(skb->csum, csum, csum_offset);
 }
 
 /**
@@ -7471,7 +7472,8 @@ ssize_t skb_splice_from_iter(struct sk_buff *skb, struct iov_iter *iter,
 			}
 
 			if (skb->ip_summed == CHECKSUM_NONE)
-				skb_splice_csum_page(skb, page, off, part);
+				skb_splice_csum_page(skb, page, off, part,
+						     skb->len + spliced);
 
 			off = 0;
 			spliced += part;

-- 
2.34.1


