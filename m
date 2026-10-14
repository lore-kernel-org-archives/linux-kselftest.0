Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CA04C650A;
	Wed, 14 Oct 2026 18:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792002538; cv=none; b=RWhvhdxO49XwGhpKGLwxxAxKaIpgIxwUy/IAjIi/kYwlVpU1R2XqBYdDEwMCJhk5pKz1pLTqjagy/21/wm6POs6kvqYZ/0DhHKaeDEm5w/s7l8LDli1XS27QOTeobg6Wzgqvj7bVkSboFKibGiaxihJVTqvp/ZyuoIJokVL2d04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792002538; c=relaxed/simple;
	bh=1dD0fAHeh0nDHu35SVW3bBW+v2U+2hEw1mL+B4lo9cI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kBQVDb3pxznMB+cynVJ+jcdeqWrQaDA1skOeTq3qZkmjuA6HY+bASBy9iHKAkOSpJQTvC7XBM0gN7S3vIGaS21DK9ftUjuOOu2WDyB+JIVCud7K6w5EWjtL08FJcZMm/hzJl6h7n5HQUfl1xzwzJdQP2MjKNd3G3q85rK0Re5L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EodmUHOt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EodmUHOt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 682921F000CC;
	Wed, 14 Oct 2026 18:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792002535;
	bh=0wFCZi/sSVdv8KQNOZ4qb7zwfc8DjV9BGcqDpxY/Yus=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=EodmUHOtxFKYtNNXznslC4O9teYAmA+45owcOK8zGesDddRkiWDK8c2/7wFzDISr9
	 3UYoVlOyZBGIGYyZHcmtfP/PpAAYgbierx4YWG+do1nc0y3KcXs7ZuSib9fVv1i+oY
	 Rw9avKG8c+vmgvnE5SGnFaDbA8oZJtZCWyrSB79NYBJmbAWeAKxCDqL3zk9PNOwF/4
	 9JP2pEOY8EGf1/DZ3iBHEbZcVngaXhqm0uKJi2sRPtjB6bWqidg6W/4SNHzFmQMMlK
	 hdhVTiXGwvuhHjb7WWfgLJgYCx6vIYkFnY1bwyGCwFw59JWec0VVRCCeaBzvXcjtSN
	 7AwbghPonBb3w==
From: Chuck Lever <cel@kernel.org>
Date: Wed, 14 Oct 2026 14:28:36 -0400
Subject: [PATCH net-next v5 06/10] tls: Return copied data ahead of a run
 of empty records
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-tls-follow-on-v5-6-e76c301d4f05@kernel.org>
References: <20261014-tls-follow-on-v5-0-e76c301d4f05@kernel.org>
In-Reply-To: <20261014-tls-follow-on-v5-0-e76c301d4f05@kernel.org>
To: John Fastabend <john.fastabend@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>, 
 "David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Chuck Lever <cel@kernel.org>, 
 Dave Watson <davejwatson@fb.com>, Shuah Khan <shuah@kernel.org>, 
 Qingfang Deng <qingfang.deng@linux.dev>, Eric Dumazet <edumazet@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 sashiko-bot <netdev-bot+sashiko@kernel.org>
X-Mailer: b4 0.17-dev-9c833
X-Developer-Signature: v=1; a=openpgp-sha256; l=1421; i=cel@kernel.org;
 h=from:subject:message-id; bh=1dD0fAHeh0nDHu35SVW3bBW+v2U+2hEw1mL+B4lo9cI=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBqz8ndbdRi0yGvejgjrTgA5y+bChJ8kqK11r/H/
 LoubwE4tcWJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCas/J3QAKCRAzarMzb2Z/
 lwc1D/4r9mrlE6uldIDBc6XB70pzOh+MaXTJuzoXXIoiBrph6fVaC/5b8XOGbuMG8TTgp6lYsM5
 dZB27bRrzLvt3ERVvmd1y0vySMo7Hjp8JBgy017bQdrvfb/EVRgo/jGqmEzA6T3GxorPHfyEZlf
 yiUNbtEyOoE+91pS2NHl70qifnJLhTNZH0vPfOuLT3m1UhuvaL9Si8u/nYNJ8AQc5nZbyc6QyJI
 CAeuGaOZxor0dvrZI41BLTDrRU5PE7MMFsaMRBviXFrTCS5S9ohed7WZFpiI5oXf9T7zoS2cRG8
 2p3DNj1juxVkXAIVJzk+D2wjRd48kSOuAmN27uvPDyC6LTTvvjgIpwJAG57hL1QpqefcN+hpt9Q
 nKLMSqt9CTGkEShVZ4SPE9hcJztCAuof7oEteMrivTCyQCR/Ctrw9b0up7CG161n/1Zx8ERfm4v
 yfxUWCzT+2qJiuQ4SIsUGOmrJtUHtfks1+0jqFiGPzuIlp2fGWrKoU1hjaaQ+v+A6Mt2lgj4dV9
 /WkHNWDFNloJWJpCKrLWV8lzOsfGH3S2c8byptVo+t2tWV6+DN99SsQLQ6qob8zxt1FpmVmkudF
 c6OxjrxrbjI1F/dvIc4NmDoUODzKZeUVAVHNYWI5f9T6IaSQB15wGGVgz3iZpxAlJV2a8bMoMiI
 +krZatT3jp1V88g==
X-Developer-Key: i=cel@kernel.org; a=openpgp;
 fpr=28B2E5B01286DF243CF23EFE336AB3336F667F97

Once tls_sw_recvmsg() has copied enough data to meet the receive
low-water mark, the receive loop continues only while another
record is ready. A zero-length application_data record is consumed
without advancing len, so a peer that follows data with a stream of
empty records keeps the reader in the loop. The reader does not get
the data already copied until the stream stops or a signal is
pending. The delay has not been reproduced.

Leave the receive loop at an empty record once the low-water mark
is met. A reader that has copied nothing still reads empty records
for as long as they arrive.

Fixes: 04b25a5411f9 ("net/tls: fix no wakeup on partial reads")
Suggested-by: sashiko-bot <netdev-bot+sashiko@kernel.org>
Link: https://lore.kernel.org/r/179124254665.434549.12245680127262431659@kernel.org
Signed-off-by: Chuck Lever <cel@kernel.org>
---
 net/tls/tls_sw.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
index 153ff135a395..9b4e66567ee8 100644
--- a/net/tls/tls_sw.c
+++ b/net/tls/tls_sw.c
@@ -1939,6 +1939,12 @@ int tls_sw_recvmsg(struct sock *sk,
 
 			/* An empty record still marks a boundary. */
 			msg->msg_flags |= MSG_EOR;
+
+			/* Return data already copied instead of holding it
+			 * through a run of empty records.
+			 */
+			if (decrypted + copied >= target)
+				break;
 			continue;
 		}
 

-- 
2.55.0

