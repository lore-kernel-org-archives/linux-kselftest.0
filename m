Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794419282;
	b=2DspWPtfs20Z1yaRpEq1yBiTbj72hi1x+8GJig72ahhCD35v3JAkiClQWa/vBNQFdguq
	 RcIbZGe21I1g+nTNNRwxFx/FwU+4Mgzit7tRPMNnVa3UXZoLxJXoQotMVpE3h02GOYLT9
	 wWXGHOfcH20+H3lt0+Zh661fC24lhL7nJewKb8PNose7uv/cgvaP6qGxShMNC2DPbOr5n
	 1tXhdJe1WuOQPR/KHX6eUrp77GmUcbJITmK1wm9jDMvJyGBoY+vVNmbPgy7/uofhCYXdD
	 vFOys3tURcqUJrc+YYPliNe7CpS/rCkChKTF9Hc2JVzKJzZQybLJkaXpRC59e92dQGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794419282;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iHEyEjx61i5+KpzynKjMkfGNsZoJzf5A43ccLavLZAI=;
	b=D6Qqrh9jM2zHatoMLDwT+zU810X3A8QFuQunddhGlagu9i9R2I7tNSXZ3p5FpilElQ/h
	 T1JVeS6pY55FVT9Rgil1lHpQ0DFnDX97qjxS13CM3FP6VP+7/1j1TEEmpfJd0C2La2rTS
	 G+EILaqi2BMiJvEHeuW6t/Q44dLtiZUXJ1+1ZXFRk2jwL4iNKVozF9BzMm/r4RriD7XKn
	 hvr9NXfln4rBmjPNwqUbeLRPKNroEn2V7Kh1lxD3QKkkSLjW+bk3HGjEaRn/JoEOz9EOg
	 g5DCs4uGwJ3icNg8yNfDiIsP0DAvPRSD8AGJ8nMEPMkNbTa35VxS+G3Bdz0puOUvZ4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D83WIRG3;
	arc=none smtp.remote-ip=74.125.224.51
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C5F606A321
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 17:48:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63C5F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D83WIRG3
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-67c6a0abc2eso1181259d50.0
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 09:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794419281; x=1795024081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iHEyEjx61i5+KpzynKjMkfGNsZoJzf5A43ccLavLZAI=;
        b=D83WIRG3J/Z+076mzvh/YssO+Jre6Z7MuWj0DlXDwtQsZ2wYkARYNwMoORfVP375VC
         NWqe+5jVeq0bizthE1v7GvtERH2otTKWL6Zj+HaCaC+c6/Uba4hwn14MPXfjzennzNIe
         Kk5I0WV6SBG98chNTcd07LAtSKLPedPvr/Glmq+52cS8ADs3jHk38vGrvzFKVBNDiyze
         om/99G7o82pb2HD584tzROXFbuHLbnqzxE8+FvQ57SDQnl5ouuron6fOZgAls9BHjV2Y
         cRjifjJ9CSYfdE1vaq99GHt0x9+I0j8eIQQdMKgGigGFDny5VCiZE9JAwB+0RxaQgp7f
         cgAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794419281; x=1795024081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iHEyEjx61i5+KpzynKjMkfGNsZoJzf5A43ccLavLZAI=;
        b=HwG3lCcKO/c2IcS/MnEl7zxjrDRU2+8taPQyXztrqKE0HD+kwJej7v9sTu3F1c7L0H
         VJcVQLUrq+jRGLNQ5bvBwiRCHjWmTnOCjVwMvI+tUbPlkFEs6Jwqz4DqxFDd72cndxhR
         VAmUne9Tl2W3xz0WpWH+PMVg5TWs6OOvWsm57mdTk2T9ltosUdcaHMYXkYDQaSYfvr/n
         uGZX2HLHGraEXjCyyYFFyAPWeTF7X6mnoSUfDrmqgisa8cfa133b5BhM9LN8sIJ30ML0
         hBSpiCu9WoIQP3fGcThuDni7RFs51os0THDVzCBQqeltuU6pz9pNl8KbUYxUgIx4RBo4
         A7BA==
X-Forwarded-Encrypted: i=1; AL+hErG1Enztsz6ewjtIgqeAbm05lGztXi51RoqWnVn4C5LUPRpU7Gk6xMXXbbY6Ii5nEXucoIG5SBIdLiB6ibvKF18=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PvQ6phNrKtGY0mYg9L2+2TSCnqgm7u/2fTWSjCB+qkly5Hy63
	rsa2F/1oiRRmDSQTQCy1dy3rr8+Bsehcl6jzkXo5uAhMfdfZ0O6jbLRM
X-Gm-Gg: AYBFou2qVKraUDWohusw8IkBk/3sIvEjEL1aNgIl+3USqNDKfePty2UxpdysdJsSvby
	CchzCPG/0WR9EKs+50KzWZiV1aVhi2nNKEZX5VVv03cyRZb5txensiNVQM04XpSKtNrkWVWSB3D
	l3NEAomp85/CFr3kQbMy7TZw5iS/9CnRy0hJTLw9thCvZdHrazFbZRkG52Z9pqABdhkJ+u1pUI2
	MS51e2Vs+zP2oSUk3aWB0rXHe4b7Z7KqvQmmMkIcvnwYmeVoOsQSMh9fa/HWcN1W1eKfaGiRQ9L
	TuuNwxBN13/d1q7majhq/1s6y6sLil41gjOumm32734rq74smioPJfjDlNL3Jqls9MAfcK6+dNP
	JmPvW/FRiLvL/47WPCsGmYAqZmLza5cJ5FNiB2Nh1EB2217BWjCGBf33A3JH5QEFH9IMcvBq78v
	3qfR1GYcxaATSDr2h8msWVWM7sRAvnxKzwYFcQx4ufswLRbkc7rTGaf6IPbluuqJstt1wcPBHcq
	ay7L8BWgJriS2m1xAGy9llCinHw7wpOKT8EgZOXs+CsB3kqvCT4WQbCBKX8V9rNrL5LxlGabDDU
	Ms2y6NVOfSx0SKsR1b+whTYvZ1cuWqLuyNR9zXwY4eyfQngkRn4bhw==
X-Received: by 2002:a53:bdc1:0:b0:679:a692:630d with SMTP id 956f58d0204a3-67c67ff79dcmr1390972d50.86.1794419281418;
        Wed, 11 Nov 2026 09:48:01 -0800 (PST)
Received: from VPN-156-197.vpn.usf.edu ([2607:fe50:0:f802::4046])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c589c6f24sm5077708d50.12.2026.11.11.09.47.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 09:48:00 -0800 (PST)
From: Juan Agustin Niccolini <juanagusnicco@gmail.com>
To: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: horms@kernel.org,
	ncardwell@google.com,
	kuniyu@google.com,
	josef@toxicpanda.com,
	jbacik@fb.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Juan Agustin Niccolini <juanagusnicco@gmail.com>
Subject: [PATCH net v2 2/2] selftests: net: Add SO_REUSEPORT bind cache test to bind_wildcard.c
Date: Wed, 11 Nov 2026 12:47:04 -0500
Message-ID: <20261111174704.24312-3-juanagusnicco@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111174704.24312-1-juanagusnicco@gmail.com>
References: <20261111174704.24312-1-juanagusnicco@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a test for the bug fixed by "tcp: Fix the SO_REUSEPORT bind cache
admitting a conflicting socket". With a 0.0.0.0 listener on the port, a
v6only [::] SO_REUSEPORT socket fills the bind cache, and a dual-stack
[::] SO_REUSEPORT socket must then fail to bind with EADDRINUSE.

Without the fix:

  #  RUN           global.reuseport_v6only_cache ...
  # bind_wildcard.c:860:reuseport_v6only_cache:Expected ret (0) == -1 (-1)
  # reuseport_v6only_cache: Test terminated by assertion
  #          FAIL  global.reuseport_v6only_cache
  not ok 1 global.reuseport_v6only_cache

With it:

  #  RUN           global.reuseport_v6only_cache ...
  #            OK  global.reuseport_v6only_cache
  ok 1 global.reuseport_v6only_cache

Signed-off-by: Juan Agustin Niccolini <juanagusnicco@gmail.com>
---
 tools/testing/selftests/net/bind_wildcard.c | 54 +++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/tools/testing/selftests/net/bind_wildcard.c b/tools/testing/selftests/net/bind_wildcard.c
index be3298c791b2..334a0cf87edf 100644
--- a/tools/testing/selftests/net/bind_wildcard.c
+++ b/tools/testing/selftests/net/bind_wildcard.c
@@ -811,4 +811,58 @@ TEST_F(bind_wildcard, reuseport)
 		bind_socket(_metadata, self, variant, i, SO_REUSEPORT);
 }
 
+/* The SO_REUSEPORT bind cache (tb->fast_*) filled by a v6only [::] socket
+ * must not let a dual-stack [::] socket skip the conflict check against a
+ * 0.0.0.0 listener.
+ */
+TEST(reuseport_v6only_cache)
+{
+	struct sockaddr_in6 addr6 = {
+		.sin6_family = AF_INET6,
+		.sin6_addr = in6addr_any,
+	};
+	struct sockaddr_in addr4 = {
+		.sin_family = AF_INET,
+		.sin_addr.s_addr = htonl(INADDR_ANY),
+	};
+	socklen_t addrlen;
+	int fd[3], ret;
+	int on = 1;
+
+	ASSERT_EQ(unshare(CLONE_NEWNET), 0);
+
+	/* bind(0.0.0.0:P), listen() */
+	fd[0] = socket(AF_INET, SOCK_STREAM, 0);
+	ASSERT_GT(fd[0], 0);
+	ASSERT_EQ(bind(fd[0], (struct sockaddr *)&addr4, sizeof(addr4)), 0);
+	ASSERT_EQ(listen(fd[0], 1), 0);
+
+	addrlen = sizeof(addr4);
+	ASSERT_EQ(getsockname(fd[0], (struct sockaddr *)&addr4, &addrlen), 0);
+	addr6.sin6_port = addr4.sin_port;
+
+	/* SO_REUSEPORT + IPV6_V6ONLY, bind([::]:P) fills the cache. */
+	fd[1] = socket(AF_INET6, SOCK_STREAM, 0);
+	ASSERT_GT(fd[1], 0);
+	ret = setsockopt(fd[1], SOL_IPV6, IPV6_V6ONLY, &on, sizeof(on));
+	ASSERT_EQ(ret, 0);
+	ret = setsockopt(fd[1], SOL_SOCKET, SO_REUSEPORT, &on, sizeof(on));
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(bind(fd[1], (struct sockaddr *)&addr6, sizeof(addr6)), 0);
+
+	/* SO_REUSEPORT, bind([::]:P) conflicts with 0.0.0.0:P. */
+	fd[2] = socket(AF_INET6, SOCK_STREAM, 0);
+	ASSERT_GT(fd[2], 0);
+	ret = setsockopt(fd[2], SOL_SOCKET, SO_REUSEPORT, &on, sizeof(on));
+	ASSERT_EQ(ret, 0);
+
+	ret = bind(fd[2], (struct sockaddr *)&addr6, sizeof(addr6));
+	ASSERT_EQ(ret, -1);
+	ASSERT_EQ(errno, EADDRINUSE);
+
+	close(fd[2]);
+	close(fd[1]);
+	close(fd[0]);
+}
+
 TEST_HARNESS_MAIN
-- 
2.43.0

