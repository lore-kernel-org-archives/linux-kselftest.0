Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793942397;
	b=wZWMn7/RsbGjQOm8hcj2oY6fdm0x08UjcQatDECPsC6nDD9bgl9eeBCAwprGQTcOLbN4
	 IcAnnD+QQA+QaSgIq6VCAvYHWzPUBbvmMdJN8LGpO8ov7q3VEa7NOoMybj1Xw0lZjyhPa
	 kycAbqzp2FaLsRXHP9Qf2isxoMaTG9cbIQQscPVL+2QF3yNX+ESPD0zm+Fg7bAH1eI2eL
	 C51kgKOHCDTIKSuqOU52cgS5OlYKIt46u6UPYc4xOzXbgjZS1ZL75uwTVdzyCRwKou/3O
	 swrHTw/hBjKAA5Qghpt3dr55TufgDVkzPbdwnGJEPxZA7qR2cznsa8iBcUEgLE11nBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793942397;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=thIA+a4MIDQnMOr6nTyDyHd3MBhrUbqPQ16GG235Ges=;
	b=HNYcHjBmrI2RcWSnDMtsLnpXqHFOrQRrnwsPSF1Jgl/w9RKKMBCATOmVm0SDKJoUWD1E
	 snm2Nh5khY2cIXMEIgFcecvPBYF/HO8KXNomEgtv2BMfIxqOzgzi+cT7oP3KMiXyJ3v2f
	 9FWT9sGzyE3IbK2UEVOjKKT+Xa4JwQX0rSz7sYRkuFqXKoN6mksy5YFNrEhuOP1+EKkr6
	 6Ka+1+NbPIOqgr8Ujwc4JZkd5FiummOmoeG6geG3H2OAvCJyMLuV1gxcEqxw5Lj4XwsMy
	 GqCb079XmQ4KeWVa1ooQ0YbN65FkX6A9epUnTNmVZh+CT6IGYwvUuxemrxi2efm9Ndw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eqZz6nYC;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4EF606A31B
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Nov 2026 05:19:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A4EF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eqZz6nYC
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b0e0e65adbso94834a91.3
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 21:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793942396; x=1794547196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=thIA+a4MIDQnMOr6nTyDyHd3MBhrUbqPQ16GG235Ges=;
        b=eqZz6nYCn9PVjvW6yBFagMYl08LpllPL0trgOTQ3WHfIsNe+Y3/2+c9C6h18C0RNgg
         jcERXhHYR2j4PoKgvkM1grKc5o+2PbWgwtCSHMNJwQzb4XvUs1QLlkxMNVJsq/GWuFUT
         s9h1cmrFSKEV7dPPJif7k8Q29+sSOxXEHiCW/1HNAcVB4xEWcERlp9ysXpPpYfQcSXMT
         yIa1DJOyKWCMCntBQS0TL3w+NtUTOJa3FmLKQJE1fsONpnQ7ap6O8tThBDnZ1j8EppoJ
         sv0gJ5YPX0wJBbWlpMAqrJ/HtJVjkCSrhJ/YrnFRT8frMY3n7cMxI0P6o4n+ujJVHd5o
         r5Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793942396; x=1794547196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=thIA+a4MIDQnMOr6nTyDyHd3MBhrUbqPQ16GG235Ges=;
        b=L972nbfROoGXgnN4ETXAJvF3FQKKd3+3XsR8SIUyp/hqwPhDO53y6CFbdEzXY8R40U
         G3DytH7Vo8eKMqFcFtYMpWteZMPu7DZOXwEZTs/9Jw5lz+sdgSEEAFYSDu11kwdEy8yl
         BKgVQyz/6pISPvekuty5djQCDt9Xe4kfT2aFZB3dE4U5pZ2EQTFwYBzaPcDIU9Vc+Lw5
         A2vy9zHsz21J22nwS/X/GgF0FFk+U2FII3wOU3y+FXw09BtLeTc7u4nGFqlInqAGCiZ4
         gzow2ZhtnjgRQzQCADI9I41+WthX83d7FDIYplZfmPEf+yvRcWqleyJzEtM38bGEXz0R
         +OuQ==
X-Forwarded-Encrypted: i=1; AL+hErEaHVxpbZVGLUJZ1X5qJFWcKprd+RcOURNR7ZiQjWzp8/akpyGlO0BLrgoj1Q9zCF4sG6iNasZb+Rp4zlYua9c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gmiHSpD1hzAJ9ap4jDIbP0Zp7NheT+tHrNjbNCT6u3FaD7kzQ
	o+7pfdpcgX8W9JkEzRBAuc8xAyAYUbrUvTqIBdXd6zGXIxRm+67doEP4
X-Gm-Gg: AYBFou0F6Kc8Qt3lFHEarZh4n/5Yy4o8H2pIS3fa1r+HHIOXMWNLvox0Hyl/cWClpDh
	vPlV8eInrYi0a5sdFTheGASIIz3E9QcuCio5ljGDj2hrmtcIEGvZsIXahnM1LKSa+GGWW1qBQ/F
	VkmKBSrsKoOKLYXGERUq46MlsgvP3qFsX+XjdKKGT1A4FeQTLZQMGxifGIbJeH+UpIsb011elOY
	S81pLAhbFgaFXeYRvQo5qWAWc55RHz4Znu5Nh6Vq+4KGiPszxptsADk2tHrygOpMs+8OyMjIg7Z
	dOGNSbdaLiV9NpNEHjhED3zkEPlOjIP5PO9eC5Q4KRWo9dq4PaMD4rTGxvZC++k9Fz+rBbmg4iC
	xGpd3L1txZPISov+sBoWJ047AeKkYQL5YQck9dS5RMn2Q6J7BIJEguanY0UGVmmAtXsac35JzG3
	8L6+mksissanAcgc7cnhjxJHShKw9BkKQ2x9UCHl44uSJnkJfpuPtknM4kXX+8cIxZZ4yNXcIkn
	TjfNMNBVFdBHjqSqwpyIiL9/sLCXw55L5vW+7dB0ewTSTaA+48+AxV5Hx0gT2hri+I3ct6Gifup
	kxrwoB6tWIyvPxkTHdcmMNLwV67cIts4IllYcNg4omwyjnpxvhhlBN4w5nCKOReDUAzDBPYN43r
	2RTH5Od0OhyzQTlJGA0WLO4T50ulJOKa+FFwZBXcAYCNJDfVfXUCNLMIU4k4TVDtm/fKigeNlKc
	TmaOxRbHRhNuqlE7H/N/JhTQAYnmSN60EnKBmGdodS
X-Received: by 2002:a17:90b:554d:b0:3ac:af8d:c839 with SMTP id 98e67ed59e1d1-3b0db6f7f23mr1414744a91.35.1793942395880;
        Thu, 05 Nov 2026 21:19:55 -0800 (PST)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47d7bd2esm1594465ad.56.2026.11.05.21.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 21:19:55 -0800 (PST)
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
To: Kuniyuki Iwashima <kuniyu@google.com>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Jann Horn <jannh@google.com>,
	Kirill Tkhai <tkhai@ya.ru>,
	apais@microsoft.com,
	rlmenge@gmail.com,
	hargar@linux.microsoft.com,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Subject: [PATCH net 0/4] af_unix: Fix inq_len and scm_stat.nr_fds accounting leaks
Date: Fri,  6 Nov 2026 05:19:01 +0000
Message-ID: <20261106051905.218638-1-sidchintamaneni@gmail.com>
X-Mailer: git-send-email 2.43.0
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

This series fixes receive-queue accounting leaks of u->inq_len and
u->scm_stat.nr_fds in AF_UNIX sockets, along with selftests:

- Patch 1 fixes a u->inq_len leak in manage_oob() when an unconsumed
  out-of-band (MSG_OOB) skb is skipped and dropped during a normal read.
- Patch 2 fixes u->scm_stat.nr_fds leaks when an OOB skb is skipped or
  freed in manage_oob(), unix_stream_recv_urg(), and
  unix_stream_read_skb().
- Patch 3 fixes a u->scm_stat.nr_fds leak in unix_dgram_disconnected()
  when purging queued skbs from sk->sk_receive_queue on disconnect.
- Patch 4 adds SIOCINQ and scm_fds (/proc/self/fdinfo/<fd>) checks to
  the msg_oob and scm_rights selftests.

Siddharth Chintamaneni (4):
  af_unix: Fix inq_len leak when skipping unread OOB skb.
  af_unix: Fix scm_stat.nr_fds leaks for OOB skb.
  af_unix: Fix scm_stat.nr_fds leak in unix_dgram_disconnected().
  selftest: af_unix: Test SIOCINQ and scm_fds with OOB and dgram
    disconnect.

 net/unix/af_unix.c                            |  69 ++++++-----
 tools/testing/selftests/net/af_unix/msg_oob.c |  12 +-
 .../selftests/net/af_unix/scm_rights.c        | 108 ++++++++++++++++++
 3 files changed, 161 insertions(+), 28 deletions(-)

-- 
2.43.0

