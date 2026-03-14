Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7344386C06
	for <linux-kselftest@vger.kernel.org>; Sat, 14 Mar 2026 20:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773519294; cv=none; b=JtxO7p6dyfUaL6YJ3Bz94J1UOFSrpYAlXPDumQS2rAoWPH+qwEAH5Yen14A/jJiJ55VlFWBalvhF/tvMFgrcKL+vwO7pmydV3eMO9ViMog/9OX7kxkQEKjLkmMJwed+82d8cCa55yBqdwosMykZ1L7iM/ZysCXO8og4BBWHG5BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773519294; c=relaxed/simple;
	bh=X1zLIw1J0h9kTV3NoqokrWtcJn8B9ET3Wq/q4qH3Vzo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=utPNiNUYJX25QBV69SLjhI4E2qpZH7uBcycWPoQL2HO+lKh5iwd6Xtq8UKtpLAKvoiUGrEUfJlcF62bJBc+OX8f4EJE+nuJsVYP1eYBVMApZWv7XQ2gT2ayZLgc4wKwKGT+OwXdmXNrH+/YgVtoTnOZfS3o8KAEXE5mOcDVj+lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=av4C9+ab; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="av4C9+ab"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7d73e0e0a36so1460412a34.1
        for <linux-kselftest@vger.kernel.org>; Sat, 14 Mar 2026 13:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773519291; x=1774124091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q07GcXVkZ6+WpFEBkbyw8fuqV93z6jZU74lSMjAcsUw=;
        b=av4C9+abqVpl1yMfwP13WzFukND7oTB7bmhw/zU+qs7arventB0BU1KB4Mbsou5O+k
         6DRJJrkSnX7dOSovGsorBbjyap39bFfQGwd9zn0pmCabgitQ3aGWUXM2Kq3ShumzS21K
         S4U0DuPE0UlEdXoN/+jcyQwD22HlteF2XGQcWzONGCc2q72voKQIm/HP4CoxGXuJVagY
         ohNaxMSy0L6t3uHxjB/zD9ya7F219NmdlOpPj/tTZWGriZQc1N63XXGmWzlLOyWUuZOV
         la5lceDE1cuF5SiB8JBi8dEXDq3ND1sgIheSbwJn3HqodREIbOvahlN/u1khl0jM+dBi
         K4sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773519291; x=1774124091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q07GcXVkZ6+WpFEBkbyw8fuqV93z6jZU74lSMjAcsUw=;
        b=MqDEilaATZDvlsodkz6X00RuGtF+my/NpHgrDKbTO+yVlQ8ycuBx4EEBWBl22XB+K/
         yGj3Ps37oUq5NfZcVWbPlAbTG+ZxkM9vcbjQFDjaBQXufSLQHbkQl5gE7pLLiCCFVTZz
         s+nhxT8Bf4eTmhzVBsF2cU7x8UdFgvVnkaCOxfXOa+j+0X8d1RZ5thVn0udKmGhPjoJ2
         eoxvpxeUCs0gC6aEmxBhFhU+Yxq5bsljixPooQESkHLI+OIlNjQXwqNTziuW0oYRpTi6
         CPZiSORUr2P1huxvBu2g4cQstv2nfDfhVAFAhwmECX+vdJgWi+Cj7LL363Ro2hqwkYIX
         i6rw==
X-Forwarded-Encrypted: i=1; AJvYcCWzstDAe1Kw1QbNe+IJqBc3kdKTNLcAviyjzl1iq1Mq1G8Woa1RQSgQmpfGPLs7VnAFEKXRTBG1omu2NFLoA6Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSAGSC5FXxQAIh36+YDuhpxrZLu/Y/fWRGrw9DGansdiTV2eR0
	K7FAjAsvq3puhDS9Kxaa7YwSXsuW2rIrdGQ0AZBvcG6HVtfP7Ys98zy2
X-Gm-Gg: ATEYQzyK9qkAYErSrdUz8yh7Vy2u1ZhLGKZwWACcWmXX4vcMOiR5+Lx9SaeWv1sfH28
	Axc3dweKg0Z1zZ7A5v98DeGHF+tg67NKx2pYfzXjrPuduDgk6gCSCpkih8YwhWZW83lSSwcAXda
	aT8yZ1dUcr0kB/yJYYTfWvIBu8VG/i+pBvcrFKr+XgVwSA9bsQYWPvS/ZQ1c9F8DFF7r5LRLa9r
	/pFTvjrfzpM5hvUhMlTsOxPzYO2Q//ppvlUPEz+qfVOY1jhhPcqqmAJPYZ6rBEk9cziQS6mVM8L
	L3hxlmlpbpLZGZMyHDBThS1o0byrrsnfstqOmp7z3qB8IAPpLsOtRswwLHpSoMjykE4z8gtgTlo
	0mB5OLNYWZyqxT7FdgqKG2GmaVkj/+ki+2D+NTxPtrAs2uNQhkKhxWw7LWBFmqT5PjVrYGogV3l
	pocL0r2WyZEb0zSKjKNMUq2Ef9JOabZ+iKMd9fxoRPzRQ0tjhb7KnapidujKPRdkrfzzrOu5Wcp
	bhZgqbBS1RUVufvxEkGol6RYCWlLULEFoS/at7xs6253SxWbD0=
X-Received: by 2002:a05:6830:370d:b0:7d5:13eb:6010 with SMTP id 46e09a7af769-7d78259393bmr5062611a34.33.1773519290685;
        Sat, 14 Mar 2026 13:14:50 -0700 (PDT)
Received: from Atwell-Laptop.. (108-212-132-20.lightspeed.irvnca.sbcglobal.net. [108.212.132.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4177e5e8185sm11914165fac.12.2026.03.14.13.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 13:14:50 -0700 (PDT)
From: atwellwea@gmail.com
To: netdev@vger.kernel.org,
	davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	edumazet@google.com,
	ncardwell@google.com
Cc: linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	mptcp@lists.linux.dev,
	dsahern@kernel.org,
	horms@kernel.org,
	kuniyu@google.com,
	andrew+netdev@lunn.ch,
	willemdebruijn.kernel@gmail.com,
	jasowang@redhat.com,
	skhan@linuxfoundation.org,
	corbet@lwn.net,
	matttbe@kernel.org,
	martineau@kernel.org,
	geliang@kernel.org,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	0x7f454c46@gmail.com
Subject: [PATCH net-next v2 06/14] tcp: regrow rcvbuf when scaling_ratio drops after advertisement
Date: Sat, 14 Mar 2026 14:13:40 -0600
Message-ID: <20260314201348.1786972-7-atwellwea@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260314201348.1786972-1-atwellwea@gmail.com>
References: <20260314201348.1786972-1-atwellwea@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wesley Atwell <atwellwea@gmail.com>

When tcp_measure_rcv_mss() lowers scaling_ratio after a window was
already advertised, grow sk_rcvbuf so the remaining live sender-visible
window still has matching hard receive-memory backing.

This repairs the live advertised window only. Retracted-window rescue is
handled separately in a later patch.

Signed-off-by: Wesley Atwell <atwellwea@gmail.com>
---
 net/ipv4/tcp_input.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
index 32256519a085..d76e4e4c0e57 100644
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -221,6 +221,31 @@ static __cold void tcp_gro_dev_warn(const struct sock *sk, const struct sk_buff
 	rcu_read_unlock();
 }
 
+/* If scaling_ratio drops after we already advertised tp->rcv_wnd, grow
+ * sk_rcvbuf so the remaining live window still maps back to hard memory
+ * units under the old advertise-time basis.
+ */
+static void tcp_try_grow_advertised_window(struct sock *sk,
+					   const struct sk_buff *skb)
+{
+	struct tcp_sock *tp = tcp_sk(sk);
+	int needed;
+
+	/* Keep this repair aligned with tcp_rcvbuf_grow(): do not adjust
+	 * receive-buffer backing for not-yet-accepted or orphaned sockets.
+	 */
+	if (!tcp_rcvbuf_grow_allowed(sk))
+		return;
+
+	if (!tcp_receive_window(tp))
+		return;
+
+	if (!tcp_space_from_rcv_wnd(tp, tcp_receive_window(tp), &needed))
+		return;
+
+	tcp_try_grow_rcvbuf(sk, needed);
+}
+
 /* Adapt the MSS value used to make delayed ack decision to the
  * real world.
  */
@@ -251,6 +276,7 @@ static void tcp_measure_rcv_mss(struct sock *sk, const struct sk_buff *skb)
 			if (old_ratio != tcp_sk(sk)->scaling_ratio) {
 				struct tcp_sock *tp = tcp_sk(sk);
 
+				tcp_try_grow_advertised_window(sk, skb);
 				val = tcp_win_from_space(sk, sk->sk_rcvbuf);
 				tcp_set_window_clamp(sk, val);
 
-- 
2.43.0

