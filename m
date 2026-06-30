Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03762F0680;
	Tue, 30 Jun 2026 14:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782828113; cv=none; b=gsTV1V3O8ReLGiks72RbfjvbHFYbaRHV5uXv+/q0w3p8tQB4k/meKXrjKzucRY3HzQyzoSt68iNLaYbeH39vl5TwL2sYARKZKd810n21yx8z3/1Mb/EQxiubmW+jMQmDzd2oQBNifEgzD77n4BtYqiJ1bK2dVxeYRUYxQqNtUhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782828113; c=relaxed/simple;
	bh=+dzHlgoH3oIIDwgU+KphGG+YpbzDZnvHjofTkh5NSr0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CMrx3S2La9MXbjvhF+iOK4mAWOOtBX4J8OEqAz/u65ExvglfD8QKJV3yWpzTu7+jIAYOiQaIH+5usQ2Nqr8BCYSaIVZamWx5t+/So4Ii4TgYdmd+lT9iUjnmfIInvN9pdND5j8kM0lM3OzVdWERV5DZuQV3gq1Q8QGuL+6F38+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=EjYSGsNN; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="EjYSGsNN"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=TTidiEq0Vy4JFSPra/Y1UMyI5Ambh3Gr+QoU3i+Ks3E=; b=EjYSGsNNz0EAHxRR7C1jtq3Ecw
	OTgAO25Bi+Pg2e7YnTeLZ2UG+fTdZWRpP3XTleq+4uJ5jZsXIiBtwwJvr1u7O/qPtyukL8m0o6+a1
	+hGdGKKFooUTz5HqHmKX0eqkA2ER6lWHiJBR29nAqkLRAXIEwYkqYdejHAaIVvoLJF+b+bfRYHOOT
	FxAGg5bD68SngPCJMQKwmKcez2IKoM9Refrs+ihQCqjWh9cKSpgKAx+l7RA2lN35LM3YQYgz8VWa9
	J2I8m2G2XuEjof4PkMSopOQ5Cp//E9vq80Qg1VLNWdurZdmPzihhSRg2lY+eLz80UCiWc0Y6YhRoy
	iacbcwUw==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1weZ25-0077I1-2Q;
	Tue, 30 Jun 2026 14:01:50 +0000
From: Breno Leitao <leitao@debian.org>
Date: Tue, 30 Jun 2026 07:01:26 -0700
Subject: [PATCH net-next v2 1/4] net: add sockopt_init_user() for
 getsockopt conversion
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260630-getsockopt_phase2-v2-1-193335f3d4d1@debian.org>
References: <20260630-getsockopt_phase2-v2-0-193335f3d4d1@debian.org>
In-Reply-To: <20260630-getsockopt_phase2-v2-0-193335f3d4d1@debian.org>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Shuah Khan <shuah@kernel.org>, sdf.kernel@gmail.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Breno Leitao <leitao@debian.org>, 
 kernel-team@meta.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1762; i=leitao@debian.org;
 h=from:subject:message-id; bh=+dzHlgoH3oIIDwgU+KphGG+YpbzDZnvHjofTkh5NSr0=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqQ8xElKaOzxkhaUGzoJ/9yrf1T3W2UpN7iip1L
 prUATet7jeJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCakPMRAAKCRA1o5Of/Hh3
 bSAYD/9PA07LrEnr52DTF/K1Yh7zHNLfL+Su6jcHfkOAP/OkGimYi7Vnidbhelv0OC47sRseOPU
 nVQLQ9HWcEoGixlsloeyKgta35R7DpynsI8ihyn6PY7b7LfJrcj33/yaXvAF1oqYDR1r3mOOw10
 n92dyoHSgLHIetq/i1FEU2DObZhXpS6V9LTWa+7mdgx999pUrEhZAmG+mj5NHyMAn0yWhS/bljL
 YGK8mIRhM7ZM6Qf9W3TAYm11dNGEikZCGVv8d7Ei30HJtYDLqFg5gqxMgvR46Qf5cPkBt/D9EGN
 xanvGY9bdiIbbcKKES3H8Mmdj9zX41VL1fFGJZiv/LdhS5tmhtcTxjDD8cp0XAlQAbBxqzTKE3y
 C6PeL1RRl8SoGbraZKU1Gc9foZECj8HU+3dOoBMaCBu7pPVAqiDOZuCVlklBiUfId8bIIY3+UCR
 gZA6q8MdDk+s/O+k6M++a4gEyl57pTCGwCVIvlLoeTvYnG/BD0fJkLAaWafMkWj9EeOhORI33M7
 4pQRenlYp9dly4XA7rWe39KxPMuXCnl1AM/VOeiuE43iyOrBDU7OFY+ww8u4/QTkmiNR0mxtJz5
 D0TBYkEenJwtXFJtjjouQwGlI960KIAC708Ql3pce4p5gpXj7KSNwC87J3e2BeMgRvflj1DOhmg
 q8X/ch7ZHElY0DQ==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

Add a helper that initializes a user-backed sockopt_t from the (optval,
optlen) __user pair passed to a getsockopt() callback.

It is used by transitional __user getsockopt wrappers while the
proto-layer getsockopt callbacks are converted to take a sockopt_t, and
is removed once the conversion is complete.

The goal is to help to convert leafs. Example:

 sock_common_getsockopt(... char __user *optval, int __user *optlen)
      → udp_getsockopt(sk, level, optname, optval__user, optlen__user)
               → udp_lib_getsockopt(sk, level, optname, &opt)   /* needs a sockopt_t */

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 include/linux/net.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/include/linux/net.h b/include/linux/net.h
index f268f395ce473..277188a40c72e 100644
--- a/include/linux/net.h
+++ b/include/linux/net.h
@@ -47,6 +47,29 @@ typedef struct sockopt {
 	int optlen;
 } sockopt_t;
 
+/*
+ * Initialize a user-backed sockopt_t from the (optval, optlen) __user pair of
+ * a getsockopt() callback. Used by transitional __user getsockopt wrappers
+ * while the proto-layer callbacks are converted to take a sockopt_t; the
+ * caller writes opt->optlen back to the user optlen after the callback.
+ */
+static inline int sockopt_init_user(sockopt_t *opt, char __user *optval,
+				    int __user *optlen)
+{
+	int len;
+
+	if (get_user(len, optlen))
+		return -EFAULT;
+	if (len < 0)
+		return -EINVAL;
+
+	iov_iter_ubuf(&opt->iter_out, ITER_DEST, optval, len);
+	iov_iter_ubuf(&opt->iter_in, ITER_SOURCE, optval, len);
+	opt->optlen = len;
+
+	return 0;
+}
+
 struct poll_table_struct;
 struct pipe_inode_info;
 struct inode;

-- 
2.53.0-Meta

