Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E576020E6E2;
	Mon, 27 Jul 2026 00:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785112432; cv=none; b=jA7SRDbOnA7gBmOGcNQxuKqaBDP3TMhtP6MjDbs8tFPQ/KEEBkhksWM+2rZEiRuPND72WZ1FSVB7DmqygO82ClKAGcXWFF4oAdryxA6/3efNRT5Al63BeGdhOOQfaK8Pfjj1HbKxu4sd4iJ6If7OEBdPLUOyKeQ7yFDgwUcYlI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785112432; c=relaxed/simple;
	bh=eR6AfEg5rVxd11x+/kSqSTMcNo2NWAAuv9dTsii5p0Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ohaV4J17YozLAFleXcJ5EonhvZThwae7sbNRvMOa40aYnHBIWzeTV2ybU6etxG7JBcFcxMqi4vbrv/nH8VUenixf0VpS3XTrywBuANnRX1h+TfvX5sLYAjfl9gDvE5ua+g0uDCn1PdW+O1oYohBbb76rB9eamhteJydh/tBptes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yma+bjLp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yma+bjLp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A62A61F00AC4;
	Mon, 27 Jul 2026 00:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785112430;
	bh=0gYjUuRoNgDXzIXQfMmoSGK3kk53xDKq5alR1mxwQbo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Yma+bjLpcHD4UsjG4+77zwdcke9r2BC4uR2o8a9Wvos63hjnDsGO5XY5n9m1PmZ0a
	 nYq6GPt6iVUbNjx6XT1Cd24k4kb7cb1U0yDjJaiLybTjxGnJfDtj/QKCICJHWKG8Gc
	 Lj/JtkUumXtff2P2ExD6nvZOgvMZhLY+If+IaDnrecMRCyUcL0KX6co4pOSO4+RKgU
	 nKyxKsiVIDtMBf6MMo2XFuxCIW+RiV3Fe/cSFQgFNFzIZlPl0Ixwo/iCABOFbi5Bqh
	 MXAoVt0Hh2AlU0MwIlHlwUG1+IovUCc/gxm8yqImio0Do8dEFb6pTZZWcYZcIZdtaQ
	 6FSnNXE5hLGvQ==
From: Chuck Lever <cel@kernel.org>
Date: Sun, 26 Jul 2026 20:33:31 -0400
Subject: [PATCH net 3/9] net/tls: Fail tls_sw_splice_read() after a failed
 async decrypt
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-tls-follow-on-v1-3-99bf4cc1c729@kernel.org>
References: <20260726-tls-follow-on-v1-0-99bf4cc1c729@kernel.org>
In-Reply-To: <20260726-tls-follow-on-v1-0-99bf4cc1c729@kernel.org>
To: John Fastabend <john.fastabend@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Chuck Lever <cel@kernel.org>, Dave Watson <davejwatson@fb.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
X-Mailer: b4 0.16-dev-da966
X-Developer-Signature: v=1; a=openpgp-sha256; l=1461; i=cel@kernel.org;
 h=from:subject:message-id; bh=eR6AfEg5rVxd11x+/kSqSTMcNo2NWAAuv9dTsii5p0Y=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBqZqdpezgY8qVG9x7mMuep3XE+/894ZTh0xBXDM
 BYa4EzNcgmJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCamanaQAKCRAzarMzb2Z/
 l1m2D/42abSOcS7Vj7Bnu5O9ENRJ0GQ2fkL1MhiizsUzOOKXjZTe96S0UmB7UYu/XFzZ4pQ4hX7
 MdZ5iMOD6RGi1mnJyRgcqolcZynvh64xER9v8i/KeWPYIOY+C5XeyBEwVnEndqA6TGVlRKb8Dlz
 PTAcvbhdTT4IugsdAd0Wr4UD6FpcGkAhxWI/Q6ATR9AWibcQ8rPeYhE+Iy7LLfRTi1YFBiYZrRs
 dMnK+nJ/P1xJ8bNM4UaqJGPFxICN8kkbyM7DvyrdNJOolv76jFFEmwKq46YYqi3QW6UJKht8l1b
 pIj/3InURKyCvCsSd8F1IFwF7h6W6ah0f8bA1A0bvkBznra4KWc7IkfvCZRKcwe4eNo6d98CyGy
 8QnNM8DA+vzTHD/Qa9x5vN3PjY0fMyLWtlFJASoOUADTyfWHfieNbYPybaDlN9tszHkT1L8yFbg
 iZHYDwOmopCC/IFP4ZtsETE9/Ccd8rgFLfrOHPpVUGm6AQ71Tms3deUr+s+degsPNLuSfV+TH0p
 CsgwjpLACMrJlRLZ4cAKHB1w3AuBJjq0FQrZtQvJodauJl9flUNTs6ssGtyTSAHSB3OEprzdqQ7
 KDDP+7EUtaFlAsPUk+x6+BfDYkt+23voaO3eTVSPsyNgxAk6kAII0wMXnO613Ngh/qVmrFWnESC
 C05M7gGGci4460g==
X-Developer-Key: i=cel@kernel.org; a=openpgp;
 fpr=28B2E5B01286DF243CF23EFE336AB3336F667F97

When an async decrypt fails, tls_decrypt_done() records the error in
ctx->async_wait.err and calls tls_err_abort(), which stores it in
sk_err. tls_sw_recvmsg() and tls_sw_read_sock() each read
async_wait.err once they hold the reader lock and fail the call: a
record that did not authenticate breaks the connection.

tls_sw_splice_read() has no such check, and sk_err does not stand in
for one. tls_rx_rec_wait() tests sk_err only inside the loop it
skips whenever a record is already parsed, and the first reader to
reach sock_error() clears it, while async_wait.err persists. A
splice therefore keeps delivering records on a connection that
recvmsg() and read_sock() refuse to read.

Read async_wait.err in tls_sw_splice_read() as the other two readers
do.

Fixes: f314bfee81b1 ("tls: rx: return the already-copied data on crypto error")
Signed-off-by: Chuck Lever <cel@kernel.org>
---
 net/tls/tls_sw.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
index 44ae0fad780d..99e9a9aa995c 100644
--- a/net/tls/tls_sw.c
+++ b/net/tls/tls_sw.c
@@ -2018,6 +2018,11 @@ ssize_t tls_sw_splice_read(struct socket *sock,  loff_t *ppos,
 	if (err < 0)
 		return err;
 
+	/* If crypto failed the connection is broken */
+	err = ctx->async_wait.err;
+	if (err)
+		goto splice_read_end;
+
 retry:
 	if (!skb_queue_empty(&ctx->rx_list)) {
 		skb = __skb_dequeue(&ctx->rx_list);

-- 
2.54.0

