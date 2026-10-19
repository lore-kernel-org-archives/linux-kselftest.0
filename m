Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792428940;
	b=VVrrWFiLecQ6OekREIQ/05mkDkivJpdWIge1NibBlYKDVDfIpgUOv0JUZ/tkxc6zpgO9
	 2FhdswbWZDrcizyUowo3Hb1GKsjTqqIV22q0u1ptGC7nL7meWJeYm4UzP0gMTvnUTgFiM
	 uIigjJ6dnDRKFgxL/S/5ZjQK5xAqUO/bzSIM9ft1hxkblukbjQv7eoTzBd0trbJYc4X2L
	 yRkXrsFIdMdaoSEvEJjiUvkflgbKr5juueHAzjvciUsWQHoWciwQlGfc8e8qzKY76NkZY
	 pouFEBDXV+bAcb+IVcJSFf5yIb6KbRO/f7BPNGGLLNnDENi7+/6xsxH48miBDrjb42A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792428940;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=dhKiNbMxx5wK3WqJKJtEBmeHBf3k9RLE0GuJwhoWhPs=;
	b=odb5y3M//mWUU3PK0iyqbj5zKHodlj0GdvD+SjWWkLFe/lsnKUvMypxaaLrg2aV18JcK
	 swPunTzXUsk5NI7WhD/QDPeWrnIYCRY71Odrw25gpUmM3+kO/btwZx5Ec+mWzDcR03bU/
	 S1ck4al1SN0Rx9ZZqBqVT5t8MT54LWRtBtpYHiSQwAOP1oVfoDYTHLL+rVPM6oztYpmqg
	 Zu0J/6CvpYp64lXLRYvNzWZMosuVEvzBK0DkvOCSl0t7v00rNgCl0Y2CIB+8OoNQRnvH8
	 ZxkcEMxnYqqoB8NMHCbPs5dbPaEmpLs2qkDsuB27zG0f6JelIfsXEgc04OTNLsPHz7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mXO0TgRx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C855A60A2611;
	Mon, 19 Oct 2026 16:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mXO0TgRx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A9211F000CA;
	Mon, 19 Oct 2026 16:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792428939;
	bh=dhKiNbMxx5wK3WqJKJtEBmeHBf3k9RLE0GuJwhoWhPs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=mXO0TgRx/7WZb+ugIIuBHf5+sjsKtkIlXt69s6rlRC9ifdCrFUIDSEMDHDep4DsTm
	 87bhYxG3da6GUOu0FmjZDbuQJKGp+N7h0XJ3t9b/C3+8G0BgBUAZP16Rjf4sT6m1rz
	 XZI5eHmAAcrqMZxY8mTS+LbIc3Ni1AWVqBuXFNnLS776j/mOK0dyCZrIUnL4nBDMTD
	 BcdeqtYspUwEQf7ywI99eM9jgag99olY5iSxdEKQQKeK4fm3OnKSKxj/sgLbAmm2Xn
	 DESbN/jX3k5IbrJ1fcanL52JaC/87P2ly779v5l5pQ+B9itU7K4sXY8TBWW5RrGwoF
	 oKhPBJdbTIG1g==
From: Chuck Lever <cel@kernel.org>
Date: Mon, 19 Oct 2026 12:55:22 -0400
Subject: [PATCH net-next v6 6/9] tls: Return copied data ahead of a run of
 empty records
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-tls-follow-on-v6-6-ab01c4ecca0c@kernel.org>
References: <20261019-tls-follow-on-v6-0-ab01c4ecca0c@kernel.org>
In-Reply-To: <20261019-tls-follow-on-v6-0-ab01c4ecca0c@kernel.org>
To: John Fastabend <john.fastabend@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>, 
 "David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Chuck Lever <cel@kernel.org>, 
 Dave Watson <davejwatson@fb.com>, Shuah Khan <shuah@kernel.org>, 
 Qingfang Deng <qingfang.deng@linux.dev>, Eric Dumazet <edumazet@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 sashiko-bot <netdev-bot+sashiko@kernel.org>
X-Mailer: b4 0.17-dev-9c833
X-Developer-Signature: v=1; a=openpgp-sha256; l=1535; i=cel@kernel.org;
 h=from:subject:message-id; bh=n7V7hlsDvN4gCTzeIS6j/jVYkcSRP0feMdAlwpShcLE=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBq1kuBpVlgWkZCl+DSneQLnRracm+5jcyGQJDri
 tCpTfbt7zSJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCatZLgQAKCRAzarMzb2Z/
 l1m0D/99lwo6qVi1jC6HG+lPp69aNEutPRiFqAvkGf+uiSKun2M92Is33ZlrYWvNecFDbIXx4Xy
 FLvSFSHSsnDtxhBpnXjGA7nAPAHsZG5wdAdT7EqA9upQP6c0wcurR5R8uRYSG3Zf7g/NwiAIZMi
 Khv+HbRDSq1Ipxb2HhZ/ZfcX4gDUMydZIPCPea5Mo81aPgFyTV4EgA7TM61QMlAGYr7RQNYtW/M
 qn+06UkQlrUPMDE47sgUzHjjZnxjHegtabtLsy2Y/zL1eluRHG/a0HdEkRJRc/bsZ1c70ZHHn7Z
 bntAnZ5c29t1n9sUy5DZKauvVfov7p+uCiiX5SUD2VXeJnSKBKtznX5R6P5MtcgLRY9w2HjnMbD
 AGhl6BR1kUcOknxJVnIvOhBpiB/qkk4JF6rYN/JJSgo9z6kEmKmiyft2EbO8UIoMGnQMQq3pRAI
 XG9IAWiuzwQ8lLUrF0QjC2oh0gG63go9Gz7pKIFptoAmSiWVdauMeSLLuIemZ0veYgLWA0msVx0
 JIKKFIR9blq7NgpSOt/UPb2ippBKxETmd8iJlpldtW817kvEHU1MhucbqOFZePpAEkqFSTOfh+6
 A+9BcegRq4FlsPFdKuQ4t4f09jzN70pMZwEMLLHAokyKUs63JjJmVGE5ebCXkZObp+udWeP4Pnk
 a6F8cjUY+oLWm5g==
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
index 550308410ff1..599bf1f21189 100644
--- a/net/tls/tls_sw.c
+++ b/net/tls/tls_sw.c
@@ -1933,6 +1933,12 @@ int tls_sw_recvmsg(struct sock *sk,
 			/* An empty record still marks a boundary. */
 			msg->msg_flags |= MSG_EOR;
 
+			/* Return data already copied instead of holding it
+			 * through a run of empty records.
+			 */
+			if (decrypted + copied >= target)
+				break;
+
 			/* A run of empty records advances neither loop bound,
 			 * and tls_rx_rec_wait() tests for a signal only after
 			 * sleeping.

-- 
2.55.0

