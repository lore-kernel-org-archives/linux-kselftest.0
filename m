Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6096C47A0BA
	for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 20:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782852658; cv=none; b=azH7/IQJu2DdLZ7B0gCPvH0TKeYpeBE91RxfG/SPLgsrfZ55wt7D+qppF3wgMPzKDWfv7cL4FBqUC7GhsapKcTY8VmAIkubYSYfaYhkimAeXnVkRbzrTAyMeV2ppcIuB0/tlTGPYu81vCVKuBN/c4PjsClgrnbR+hYF2s7L8siM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782852658; c=relaxed/simple;
	bh=fK/MWsPyhM/NRS8LN/G6f6zgJ3L/0Mw5pNSYTbRJMDc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XNoh0eay0Xmroarw7mHQ4fVdHBK+vE0hhbPuFIwoIFNBlDzmDAZLZ+NOyMOhFz8h8EFxVm8HBCahJ1KS+tAbVI0w0W+DX+QDJ3vHwlr8kleP02OK3t2eYbLzGUAzZ+GOAQ4g+7RHBrWGdjyX5QtLYlfJ1y93tiGZM7dgDdv2BCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T7HrGP7l; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T7HrGP7l"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ca265d6ca1so7626985ad.1
        for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 13:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782852656; x=1783457456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bREOiO5mN7hLvS/DleneGMdLVSBD6LdzBp7bNvZIud4=;
        b=T7HrGP7l88Lf1REDsU3vyF3oRCp/Pkch1PeD4ax2pdQQwkIwEONhWil81pmpKg+8Ag
         rAoEgPzFMIlBHdH8bQVAlUP6DT9Hv3lkmxGGOxTMwa5nIb3V/Cg+dXfxkrBUFVBH8ZTA
         bnPxcGXUBS4htBKKIt3SYiz8x+AiWdAk4ICOzuwAHDKzF+dmAT/Ax0n0StzI6vRuUT1v
         iVhKD2JNRfZLzu2fOtnUw6gBXG5CoqT7JoeQ21IV666CD2uMW+g6RXk6ylt5PvnD5+v/
         43kOygdBxyCJzf29YkluGH4/hQ0NfcGYAH3DmmeVBln65uovZVShBQur4ipr8S+VGhpM
         3V8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782852656; x=1783457456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bREOiO5mN7hLvS/DleneGMdLVSBD6LdzBp7bNvZIud4=;
        b=C1CqNVbT7I4bYqwpR5fY4ryZpztxJAwcA6AVu5Tq5O7ymJ4dNEapCiXrHe4qlRGhZj
         gx3cEqz/AakzWt6zUUmatAWchavCkzSsm2RMkoH0xeBSDDJWkAf6pHdZ6i2rmGPAC/ET
         M156BGk2odOw8GlCnIewJtrOGF3fiQayXUpIbnR6rq7S0+CwB9hZgd7OlxqQVaSxMKTv
         7AZqyjV9oDPdhFeMtOCjZGe/BMU2+PU9biV+1+kq55yQp76SHOuup2x2Ijy+lw/ZHMJB
         pv94g7M6U39e8x1tB0b3bQRmEv0Rc713JIi7NcCfXb1RhijUOJn2miR3xshB7wGix+UH
         BUWw==
X-Forwarded-Encrypted: i=1; AHgh+RpnFbDkbdyZgbJcOiB0k84/NVNZbKX9Unl363mLSCYrk3lsCkdR0Q2WjuEMDdTFL0iTtojeF0sbxrl1Orm6Ax0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGyY8hevLmvnud0Hieg2uWqweJIi1C1c0QwtKKpHicWSKm63hs
	UleRigvAzKiRUkWZZ/SA2X9kyGyR6it6kBP9Em27a245BvPhOM86Zh7V
X-Gm-Gg: AfdE7cnprzi3ZsSuxtjKA4Ijih73VPLUbTYeQP1f3EHZlXGlUYmJq03MJcUYw6m/no4
	OMBeAbbXnOpEPHx3HrtjnlsP3dv+JykMVr4EU6aW4yDhQXENCDYhPcwmwjnFammB7hXgf8D/sJw
	7o2wdSMry0a8YCckQlkZh5alu8oYFbfvrZakN5RWKnFPtbQmWUcXOpGTbtVY7kTRwVOv6Q4AjzR
	OaLEc9mTG9ECZOTTpdwPcOMVdZ2UcjM5Fg0sbCyvJ3PnY0XK6ry37IZcHhpnMEkjdi7c35/LE1K
	Az/oZxnsUenpqXd8dCmVjA6jGEr7J8HD+cpYQPFO3/GUUFUZpI92iE7RTx7VlhipU5hYAgdDRb5
	EisCMfw+90CWPXZbM8ieRdm2djZhVYxFQIO0XfV9c5iU8rhUc6aOH55XVULsg1BOW8bBICFtmkw
	Ym78e3oe5bqnUnOTQCKvalIH3hIYloB0Wc4/GytsOkUZAnPOYtlrk=
X-Received: by 2002:a17:902:f54c:b0:2ca:d4f:adab with SMTP id d9443c01a7336-2ca44a060e1mr25125905ad.19.1782852656493;
        Tue, 30 Jun 2026 13:50:56 -0700 (PDT)
Received: from cps-manycore-1.. ([147.46.174.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382ba1ccsm20322305ad.66.2026.06.30.13.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 13:50:55 -0700 (PDT)
From: Sechang Lim <rhkrqnwk98@gmail.com>
To: Eric Dumazet <edumazet@google.com>,
	Neal Cardwell <ncardwell@google.com>,
	John Fastabend <john.fastabend@gmail.com>,
	Jakub Sitnicki <jakub@cloudflare.com>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Kuniyuki Iwashima <kuniyu@google.com>,
	Simon Horman <horms@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf 0/2] bpf, sockmap: fix copied_seq left behind when a stream parser is removed
Date: Tue, 30 Jun 2026 20:50:33 +0000
Message-ID: <20260630205043.184894-1-rhkrqnwk98@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A stream-parser sockmap socket can be removed with SK_PASS data still
parked on its ingress_msg queue. The copied_seq rollback for that data is
never repaid, leaving copied_seq behind sk_receive_queue, so the native
tcp_recvmsg() warns. Patch 1 settles copied_seq on removal. Patch 2 adds a
selftest.

Sechang Lim (2):
  bpf, sockmap: settle copied_seq when a stream parser is removed
  selftests/bpf: test sockmap strparser recover with undelivered ingress

 net/ipv4/tcp_bpf.c                            |  9 +++
 .../selftests/bpf/prog_tests/sockmap_basic.c  | 59 +++++++++++++++++++
 2 files changed, 68 insertions(+)

-- 
2.43.0

