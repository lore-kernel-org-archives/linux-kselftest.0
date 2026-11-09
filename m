Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794247119;
	b=LncmigXYkFpRamCLA1NynOn8TXJDc/R47JyBRpN2BhC8vk4ftGCaB7TAwEtc3ESThLbn
	 343ncN4YrJpYTkidRP8lmVBqdRwac0cdPDYNwzQnTElQ888cEPF5zoWIQ/UX2yqaKcK54
	 ely6v4klE/QakTWx2DylJ7vgOcIqihwReWbmJfEWjODmsNUC6f+kn/OI3BHN+KvWRXmSz
	 OHP6pKaiqr2KSREm4c88OMG+W+t/yGJ7mrbyt8ju+09CuEPHxkjfU6WX3Pl8SucGxasMm
	 +H4zzQwIT0x+zQhiYNjT99rN/IV1AgjMWzJAiH+N24wjP+KqfYjtanNib41T0Bm1htQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794247119;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RGt0Xrzc3bcmg98bCU60AFwjjPYssWRcm4Vb5DTBEm8=;
	b=Jo17y33d8+JEDqqOlMiTGsdWDIwBuWY6rw/RlWiqaH8+R6sEwloIrdMcQ8SsNPUAnH3M
	 5n7ih/stBNitaj0coAI754x7fhQdeS0vn0Y98g1DHVz+dfsPY96myE6r1oGLTv3ku25Sz
	 3DanSn4uYF6PuKJwQDGYt6MtFaNEOd6LUrsOVLXHEebLXg6ovabmsRcfGhEqIZ+iVAiQF
	 0YMAwSw1eaARxq1e3trbrBbEU9+Qo5HNjw/cn1gJ//DZ6bySHewGFuiZFGW9T30o8QSUg
	 ScPzNJoB/Ti3U91Gl0K8BfMtCaOEv9BGfDEMoTUFmhYj6jO/45wwioixpparNqIJDCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j5KXNNOw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170DF606A31C;
	Mon,  9 Nov 2026 17:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j5KXNNOw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 493C61F0089F;
	Mon,  9 Nov 2026 17:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794247118;
	bh=RGt0Xrzc3bcmg98bCU60AFwjjPYssWRcm4Vb5DTBEm8=;
	h=From:To:Cc:Subject:Date;
	b=j5KXNNOwo61Rr+xwRpuVhoRvF5mqY/rVz/oEpu/dY3lDtSLPX1cagxuLZYbRe57cH
	 c8A0Ucth/dahCVQHvH+QnImGea6oc/avhRaSpm1v8ERNyYSm2fIZQaZV7bXXc+u7M7
	 rNl/Wa/BlRXtndTzeBQPqDIm6J2H39bk0KYtC3I0Tr4uBwE6GtLtnXm6l3WiY2nLkz
	 Y9NMpegXYkTJLo4EkXZSOEVeUZonqSaTKaPjXm0AfT8ZnhPWlh8yzUSk4fh+0jYfiR
	 zFVfaH5rHasTgu+ELkV7e2ymCZDt+J0c40Dur67WmYBs9qSeTXTOD956f2jpYB4vr8
	 otPCm+vigl6Xw==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	sd@queasysnail.net,
	shuah@kernel.org,
	cel@kernel.org,
	linux-kselftest@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net 0/5] net: tls: break the connection after a burst of empty data records
Date: Mon,  9 Nov 2026 09:58:31 -0800
Message-ID: <20261109175836.1246840-1-kuba@kernel.org>
X-Mailer: git-send-email 2.56.0
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

Deal with overload of zero-length TLS records. This is the next iteration
of Chuck's series. I tried to make it as simple as possible - break the
connection if sender floods us with zero-length records. Consume / discard
those records even on PEEK to avoid infinite rx_list growth.

https://lore.kernel.org/20261019-tls-follow-on-v6-0-ab01c4ecca0c@kernel.org

Chuck Lever (3):
  tls: Consume empty data records in tls_sw_splice_read()
  selftests: tls: Skip the zero_len tests when TLS is unavailable
  selftests: tls: Extend coverage for zero-length records

Jakub Kicinski (2):
  tls: break the connection after a burst of empty data records
  selftests: tls: Cover the cap on consecutive empty records

 include/net/tls.h                 |   1 +
 net/tls/tls_sw.c                  |  77 ++++---
 tools/testing/selftests/net/tls.c | 348 ++++++++++++++++++++++++++++--
 3 files changed, 385 insertions(+), 41 deletions(-)

-- 
2.56.0

