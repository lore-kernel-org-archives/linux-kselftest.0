Received: from mail-ot1-f99.google.com (mail-ot1-f99.google.com [209.85.210.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E423C3DFC79
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 14:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777906421; cv=none; b=Wif5F9or1mMUIGR+VWiPC0+cjY90B7WYl2PhopCX2xAXA0jr6hVz8TVCj+4D8Wtg9nBh0TcWcfBeaOV+b/IELeGAqUCYDZYKvkYoah2B6D/DIiVrG1313EiTEyxDRvQDTDOVygcGHEm7gHgWF4DsKXmSodr/Y6eOv0fFZLaDbvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777906421; c=relaxed/simple;
	bh=Q2URSNx8B/upwfVANDhtXGow03GK4tWmrRjookPjOBA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RhNnwEqkrOmlU4REV4QVFgh/pbNOM3s9XI4QK05/iv6qwwErdIhl3wG172FoCC+kSJah69W1LQkYhCIrk6gR/LbGiH+fZ2oVFvADm41KgSB98mvtDHtAcslUx6SUEdQyHC8FCnMPRdQWf9bVpxKR2fljkRHZY0OYux/oNZw/F8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=XaMIA6Fh; arc=none smtp.client-ip=209.85.210.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="XaMIA6Fh"
Received: by mail-ot1-f99.google.com with SMTP id 46e09a7af769-7dbd7a1e989so397087a34.1
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 07:53:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777906419; x=1778511219;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dhl1El7Ec0BsiUHbTpDBR+jiTk0km6h08mEdzxE8DPs=;
        b=ZHQ0hAAwYG3JfRCtzKUj2HrqCZX2zCZ0/rP1jCK8SpCd21y5obk6e1k+Z94GciTfwl
         kyk+z5HQLdfclflAToy4Gux96YIHlofeFlp00sc+sxxV7Z+LpZRTF2dQggO9uxHuvzFM
         MV1ekEF3J0BTmGmEKoV+7e7aVaiKGT7wK39WNSGFgvqWqKRCfk6NX9aTch4dkpuJNB4K
         NtSmFdNcZ+BDiTdi9crCELb6UsTjLiJzW0XUGqFoX3MTvQl1k3NAFg1dX+bizUFlw8X5
         2WVDJUaJb8qBcmFyf7zzrrpoBamqvPspvCT1vWAyX6zACWMFMZN+wHqk7ewotk/Fc60e
         MCJA==
X-Forwarded-Encrypted: i=1; AFNElJ9c54cBOzW0TgwPz6Zi7Vfwplqf38/Jw2Bfu+wre1/OM7hmSGlBbVzasEnhlw/2z613cFdTbgSB1oe9aC6X52c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDfoo5SMUeNJWtGH4UDnBq8LPwFPIPQrjTMBvf5CU2lDvlXFdm
	1WqkoPqg8oSvKli5cVLodtyPSq9CE2gvX4T/Ly0d57ry1CGkpwo5XTit7GCmaeI00a1twlafLSC
	AttYPwyA557r3NSMELehcYV7ztlLLivlegIfeqeDy6UZhOewcXbGUFjDaJp5SlMhdctmFV9EHpL
	+BibM7bvkcjq1WGuna6rKW9vJvtBcL1IjEEkA7WSEl/v5He3Bn31RjUx2SI97A+W9Rs1Z+eoYid
	22zWvWhI5g+mHycplfqb/6/McY=
X-Gm-Gg: AeBDievz/KdLwMKU623NSKKEq9My3fqynjjVWbzQwfAGlqwp+oV0zouM+8wrGh3mcJM
	K3c5yEIjAY+/L2ze+g6HD87INR9wcSsYyVcF9686XR15yYp9oUKLMfIDKSkzM55wX3E9muA95l+
	NwTF9rbGS+jHXArt1z2orHR1qp+wvRiE7G2ZVl83KEv02Q+56X1JOmCcvdsX6PLI/+HKbC3vFKY
	pJoPpqwsDqknMVUXs6lirXz0Ho8dLvbpNFF2fl8b/zVlKQRdORgHP8q3KAR7O519ZrPQJBuSXtY
	NYL0zwUHzkPFRGTwZ0l16Lulxmtvk8Jzs3bkVrK2kTXAD0HaRAQqQz6HpFrStu5JGGvaTdjlwEk
	eI5v2Vt6qvbWg8h4QX3DOIXf0X1fuJ7WP3RSPnVuUHT34gnxbFkbNojf5gIdsgJKbQhrWWiCdpo
	fcYXNYHDuX2eRWjZgwbFUXNcmLFUb1GlQk9rFuRnwJsXGP90fB0QoyHjkYTni8I55A2rk3
X-Received: by 2002:a05:6830:4407:b0:7de:427d:34a8 with SMTP id 46e09a7af769-7dee135e549mr3306804a34.3.1777906418705;
        Mon, 04 May 2026 07:53:38 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-21.dlp.protect.broadcom.com. [144.49.247.21])
        by smtp-relay.gmail.com with ESMTPS id 46e09a7af769-7deca775fb1sm1323020a34.1.2026.05.04.07.53.38
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 May 2026 07:53:38 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8edcc885cd3so118489785a.2
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 07:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1777906418; x=1778511218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dhl1El7Ec0BsiUHbTpDBR+jiTk0km6h08mEdzxE8DPs=;
        b=XaMIA6FhQIPADsniLFXXEo3/UdtbuHYe1S6htY7y49WFiIVRXVbZYhEZtSl8FZ/zhO
         XqlDxJ8SGe9UxCvhohGRYQnY6674//go1dVhKOr+mOGxRD5gANA4WHBlAI6s5IRg9Myv
         TEAelggUS2mxZ/pH4bWd7TJwgB8+xpKSYMtvE=
X-Forwarded-Encrypted: i=1; AFNElJ9RnTzWZdCxag/2zZSiGXP8clDL2ht1hdD0kQs0dP8Nvd15+yOdVyFtv8siNAUNEc9UXMTVv072kufr7jN9N6Y=@vger.kernel.org
X-Received: by 2002:a05:620a:31a2:b0:8ee:f43a:bb63 with SMTP id af79cd13be357-8fd128ac3b1mr984132085a.0.1777906417770;
        Mon, 04 May 2026 07:53:37 -0700 (PDT)
X-Received: by 2002:a05:620a:31a2:b0:8ee:f43a:bb63 with SMTP id af79cd13be357-8fd128ac3b1mr984112285a.0.1777906414615;
        Mon, 04 May 2026 07:53:34 -0700 (PDT)
Received: from photon-d7fac424c0d3 ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c91fb3bsm1046315985a.41.2026.05.04.07.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 07:53:34 -0700 (PDT)
From: Ankit Jain <ankit-aj.jain@broadcom.com>
To: edumazet@google.com,
	kuba@kernel.org,
	netdev@vger.kernel.org
Cc: davem@davemloft.net,
	pabeni@redhat.com,
	ncardwell@google.com,
	kuniyu@google.com,
	horms@kernel.org,
	shuah@kernel.org,
	quic_subashab@quicinc.com,
	quic_stranche@quicinc.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	karen.badiryan@broadcom.com,
	ajay.kaher@broadcom.com,
	alexey.makhalov@broadcom.com,
	vamsi-krishna.brahmajosyula@broadcom.com,
	yin.ding@broadcom.com,
	tapas.kundu@broadcom.com,
	Ankit Jain <ankit-aj.jain@broadcom.com>
Subject: [PATCH net v2 0/2] tcp: protect locked SO_RCVBUF from Silly Window Syndrome
Date: Mon,  4 May 2026 14:49:43 +0000
Message-ID: <20260504144945.13477-1-ankit-aj.jain@broadcom.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

This series fixes a regression where locked SO_RCVBUF sockets suffer from
Silly Window Syndrome (SWS).

Recent memory fragmentation optimizations apply truesize penalties to the
scaling_ratio. For applications locking SO_RCVBUF (like Java/Tomcat) and
processing small packets, this drops the scaling_ratio to 1. This
collapses the advertised window and causes 504 Gateway Timeouts.

Patch 1 bypasses this penalty for locked buffers unless skb->len > advmss.
Patch 2 adds a packetdrill test.

Link to v1:
https://lore.kernel.org/all/20260427152756.1205-1-ankit-aj.jain@broadcom.com/

v1 -> v2:
 - Shifted protection from window_clamp to scaling_ratio based on Jakub
   Kicinski's feedback.
 - Added skb->len > advmss check to ensure large aggregate payloads (GRO)
   are still penalized. This allows tcp_rcv_neg_window.pkt to pass.
 - Added a new packetdrill test (Patch 2/2).

Testing:
 - Verified fix in a live Java/Tomcat environment (504 timeouts resolved).
 - Verified deadlock prevention via the new tcp_locked_rcvbuf_sws.pkt.
 - Passed upstream regression tests: tcp_rcv_neg_window.pkt,
   tcp_rcv_wnd_shrink_allowed.pkt, tcp_rcv_wnd_shrink_nomem.pkt,
   tcp_rcv_zero_wnd_fin.pkt, and tcp_rcv_big_endseq.pkt.

Ankit Jain (2):
  tcp: protect locked SO_RCVBUF from Silly Window Syndrome
  selftests/net: add packetdrill test for locked SO_RCVBUF SWS

 net/ipv4/tcp_input.c                          |  8 ++++-
 .../net/packetdrill/tcp_locked_rcvbuf_sws.pkt | 34 +++++++++++++++++++
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_locked_rcvbuf_sws.pkt

--
2.53.0

