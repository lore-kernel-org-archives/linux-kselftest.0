Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794968901;
	b=JXa+GqMfqwpucxap2W14jUvIrKMwKuhPBHDHk6qqeFiiwVN559p4mQhr3UZwck5vAee5
	 5MIW67DuFB8k7Z4EY9xtc3DtZdWltgQAvWilNE2tLpKh2GQk6+EW5d6Rb7uohcJcT9b5l
	 U8KdeqZYPJfWOZ924JvcQqARK/cOrz3wClBGfHr5RuaN2FJUw/qf9RsVQ8uLDIjodQ0os
	 EYNUvm+8glUcWGXMy9/97wGpxsO0PeOACB2divhjg2OHG6ibdrnCXqsksianBzeZU7Jy3
	 FSLtTZObgLr1dHMknwSPLLgGVwrAElclZVjA1QTz3nW6H/f/SAWpY/aWfX4OhKX88KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794968901;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bBM1tckyz85/mFdKRLmUacT5H4u3cjM1OdFw/h4C7tI=;
	b=4uwtHriCjDh+Lg571NCce08eqJBCgrst7ri8VibIe2l4ip2kvHfVU/7aN2t3ybF7Xznf
	 4vrIemdLeBkrkfuUUsSnw57YXcQpHgio4pnXyWrYpJ7JhGkiEzzFTz/XiNz4sBzIM1b5n
	 Xex2tyPTfA921an2PNX/V1gqh1kzlMCVUtlJxbHdmqqIP82hS7KVMYow0RrvZhIt9jCGr
	 xJk4geaKWg2LH5Frt2Gxqu5nvTMn15RZKIb7nkEKh5+z09ZDq0KCt/sDzUu+xoVjCMQ8m
	 nMriIZEgSDQTBBpSpGj4kbBFLclyXu+F8GeJW4N50UkrlLZdtNMlhasyXBNS0xHOuVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IfnD6CrD;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B40D606A32A
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 02:28:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B40D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IfnD6CrD
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2efe591a1f6so1810925ad.2
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 18:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794968900; x=1795573700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bBM1tckyz85/mFdKRLmUacT5H4u3cjM1OdFw/h4C7tI=;
        b=IfnD6CrDsAMUkk3Wmlw79A10NLxrndNMXRede91i+PMYlQ6UxlCc/wEKS86x2VRcBs
         ELbpQgwL4eS3jvxLIlVe03/VbCpjs85zTmBawmM7kkJqUY6TsT0ABq1gnL0Jo3V3TKUf
         f274JqEjdeGqoFuZfDkrM2+WIMXd2L/rMxga5asPktqPWuegCJVV/3soYR/vFI7MgsvR
         6oRAJWiIMzODUrRZeYyfyrwX4yMwDGS8kz82Kp+ovKFydYPachZjICuqDlK5dZly0H1D
         R/TRCRA3Lms2UKmFtyXhpQVzWPLPoNg3nONno6ebKgXoeXy9ySWd6MNYSJWotAomKgr9
         4uOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794968900; x=1795573700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bBM1tckyz85/mFdKRLmUacT5H4u3cjM1OdFw/h4C7tI=;
        b=2yJFj7uMzdwzdyJjeRmrSBSNWITeVTpYkicPb3JQDi1NEvFQyjFGejSYgLk3j7Yc0Y
         H4LZ/jSh+t2+9DPcpqcKa91iV/lsS1KU8XoIR12I5/jYxCAVWQti+Bm/QRI/qZicc+qp
         SqxorT0FTSM4Gecx66rlDthKgnb0J+WREpX/nB6WDVzrNXv0wd/9VRkU9sp5/CgMx1JR
         CWiK0YjiMfXwN+APVMYV3PctopXRnGj9xMfW2QHGEARJu1idQAL4cD0d3amfGsszCIkv
         0H1D8QZsMXGaPsam4mHrILGn12Csl0EQxUXMOrseLEqEQWeGH1cPfqOzR8QglFi7q7F3
         Qpgg==
X-Forwarded-Encrypted: i=1; AL+hErGurM8ZojWW3dVXifwZZ1rb5Dz1G8NgY3DQcZqiJzCXTJMMJIIK1q9rzxID7D4Jo+YVYoBZV7+6b6MG4ZKjls0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8i699l68zhDERmgcVJ85VWWj5gNzCI9TGPZv8DV3MoMZfdxRA8
	/AM7rXf7d/E5dd5oeqtJoOGuqxPUTov86jp++R3iUJMYCAn3N47rMtaq
X-Gm-Gg: AZFdTZdK+2Xl7i6gTBvrV0qxWaKTrzeHR3IPgpqouq2pGU+HeulzvY0QE0koZruzW7H
	JgTiwATVxLlV+jocnXmWgM7M4nrHczbaUBbixwoDGjkxxSeJWUw/wCmr0wFZX5nukAtcF5QFd1U
	CgQXWl16bG7+saiSlVza0ae3ovUjZ8v4i59ncWS6drzzMFtFB37fWsg376kHozjUYdjWC3y2ivX
	c6LpSggvuhxDJMkVhpK2Cb1fKNjHAVfr4efLvqKmH/B01IFoCmYz4VtCiPNv7eQ+mwh7iMs2wQv
	ph/EvcrCQagAH50P0TAHUmeejcVea0q6PH0RvL+0/DBG7b9QcOalZQipQfFfH0sZk4oupKtm+ZD
	hV19E0whIfZ+EjXmWmNpU1b0eWgiS1AaB7TCxf8ZDsUm4Qae+r3xMG/u7YapCObhR+plHy/PONR
	wJMvhVZXfAYvEF1SN9jdXh8hYkEYYLgC490h2HukSDORLDOM9npH5VCApbXcy9JKwftqJ4Rce3Z
	JPqY0acpD0oxvj8RiMo7Tt4GhAZpUJQGGPgRpnDkMU4iOcEVf2XaQbjNGke8TCHtTCh1KT18yN/
	qhT/UVjhbqYJCdBZPd8LmJR6SUnnzqTbsIeKohFWJRPdI3IVJgiL+0/yXNE3h5MuQz5migjh443
	OnmhrP4Vxig1g5YPnU4VlquQ=
X-Received: by 2002:a17:903:32d1:b0:2e8:18ca:5f46 with SMTP id d9443c01a7336-2eff72e6095mr11400325ad.14.1794968899679;
        Tue, 17 Nov 2026 18:28:19 -0800 (PST)
Received: from message.eml ([2a09:bac1:76e0:450::21f:e8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff617f8cesm4756605ad.27.2026.11.17.18.28.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 18:28:19 -0800 (PST)
From: Zhiqi Zhang <zhiqizhangg@gmail.com>
To: Eric Dumazet <edumazet@kernel.org>,
	Neal Cardwell <ncardwell@google.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Tim Fuechsel <t.fuechsel@gmx.de>,
	Lukas Prause <lukas.prause@ikt.uni-hannover.de>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 0/2] tcp: roccet: fix idle restart on RTO
Date: Wed, 18 Nov 2026 10:28:11 +0800
Message-ID: <20261118022813.9778-1-zhiqizhangg@gmail.com>
X-Mailer: git-send-email 2.54.0
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

Patch 1/2 skips the idle restart when packets are outstanding, so an
RTO retransmission no longer overwrites the snd_ssthresh preserved by
roccet_state(TCP_CA_Loss).  Patch 2/2 adds a packetdrill test.

v1:
https://lore.kernel.org/all/20261114141315.19007-1-zhiqizhangg@gmail.com/

Eric's review:
https://lore.kernel.org/all/CAL4WiiohBWs_BteL4o__osD6cPTXrBBPa-P7faV=acTaF_4g3w@mail.gmail.com/

Changes since v1:
- Make the changelog precise about when the idle restart is reached:
  with TLP the first RTO is affected; without TLP the first RTO can
  escape and the second RTO is always affected.
- Limit the claimed effect to tp->snd_ssthresh.  roccet_state() calls
  roccet_reset(), so ca->state is already LAUNCH and last_max_cwnd is
  already 0 when roccet_cwnd_event_tx_start() runs; the idle restart
  only overwrites snd_ssthresh.
- Shorten the comment to the style used in the file.
- Add the packetdrill test from Eric as 2/2, and enable
  CONFIG_TCP_CONG_ADVANCED plus CONFIG_TCP_CONG_ROCCET in the
  packetdrill config (ROCCET is only visible with advanced congestion
  control enabled).

Patch 2/2 is based on a test written by Eric Dumazet.  A variant with
tcp_early_retrans=0 (no TLP) fails at the second RTO only.

Testing: Eric ran the packetdrill test in 2/2 (it fails at the first RTO
without 1/2 and passes with it).  The netem reproducer from v1 still
shows snd_ssthresh being preserved during the RTO with this series.

AI assistance:

- DeepSeek (deepseek-flash) generated the code change in 1/2.
- I wrote the netem reproducer and the documentation, and reviewed the
  code.  The packetdrill test in 2/2 was written by Eric Dumazet.
- DeepSeek was used to polish the wording.

Thanks Eric for the review and the packetdrill test.


Zhiqi Zhang (2):
  tcp: roccet: do not restart from idle on RTO retransmission
  selftests: net: packetdrill: add ROCCET RTO test

 net/ipv4/tcp_roccet.c                         |  8 ++-
 .../testing/selftests/net/packetdrill/config  |  2 +
 .../net/packetdrill/tcp_roccet_rto.pkt        | 63 +++++++++++++++++++
 3 files changed, 71 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_roccet_rto.pkt

-- 
2.54.0 (Apple Git-157)


