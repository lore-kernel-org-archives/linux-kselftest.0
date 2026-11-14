Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794673605;
	b=Cq6a41xKPPqESeT2RJTHHDOAJG4fQxfqSUX+mfkjqTjQhrIqh+s7x1ZkX3capsVkddGw
	 lUKQrwXMmSUQChnG/4IamJkE2qVuBXxrRolI8wbm4vPbmerp0P+n9tVS8gREWx2/k3iEg
	 M5QgeS4QAnRh/7sPsrJjY2N0t6mW2UgCMscLJUwmPK71udex+aU+CLJyTlnI0PBiMau5x
	 z0/+fPrQkxLIdxRaNqghtIgQNh7GhE/PuhB90g4nH7V5tWSukFU7PS5xEUOlUV3m+wR+K
	 qGcjWFH1UCxV24IXLnioi1EEsErmFdMgXSRb1McjF396/aPnW4VJKC4H/j0yDLMx9wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794673605;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TNFTF7NV7Q//dPvrSTZY3AgficwQjRGJt0rjTizoF/Y=;
	b=qfLjbZryygn24J8Mv7PbSDpe4Z6XCg5viq+ftiEcIBVHIzzjq4DAoUqRbWNxjADMm4Q5
	 jK5JtAE8pcSUr5VnoeO4xxNE75KfdDPM1idHH1NFLzz4QTELrw7GXwOdaRBRv7U8znJJw
	 To6PpdVg3P8L6OMV9nOqE51Uj6TME4/TOGvNNmJTTpljJMVxpqKU6VQduo2dMyjeZOlO8
	 FF0nEiJmkDxhIRqqHiU1QGePzOCUHkoW9wRB+bTYkYqIZmJBA8bs/0+yvLUB50VTsGcgN
	 gVqgA0fenO4ztcX1g8b5Llqt/wF036BnokjuHSEwny6xTqafzlZ3xFdHqu99XzCs7Ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="EGFEoWw/";
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF962606A329
	for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 16:26:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF962606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EGFEoWw/
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ae1b34e0d2so1632814a91.1
        for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 08:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794673604; x=1795278404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TNFTF7NV7Q//dPvrSTZY3AgficwQjRGJt0rjTizoF/Y=;
        b=EGFEoWw/K66OepLc+Jg+1H3FNhIxIOjTvVvh3dIMaaL9GQ1uDnLPUQHe+lj+FgQkjN
         /q8il6b42zPDdNTG+bt4wLaf0UPlZUWvVdM7OduPNjxsDpHgEjA1WrBwBOLrHcFwgoc6
         0r0OSsBaW8goPuNi5+gJe6PgUEyd/tBSQRtC7iUR+YgaTp9iLiZxkUJUsrCcPZ0AbJU5
         kKn1HsH2VzMPDRpFg7ZSnicvbK6vdhoUUIHitf3Rt/fsP+6I713HymPSKM8VdBaild+y
         uSSbulC7kdMTS+tJHE7BKoAS6Y7ehcJ6tbxV/hPttGHRApR4Xo2L9KKAFU1CCDlvDq/q
         rmNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794673604; x=1795278404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TNFTF7NV7Q//dPvrSTZY3AgficwQjRGJt0rjTizoF/Y=;
        b=GUqQFupXb2LzaJrq6XRDNve3B2yudJ84MgsMIJzTtBQBYO9nQbwYQIXyMhgSyMhwiA
         jX2vOgCxJ5INnZg2wj9rQdkuTyQMC866cXAFIhkQsdvV4n/LC9LeAtFYdXfIXLNyMafh
         gRXZLf8zTbFOaVq6M5F5JG2be5att6Z3mVxknxtazLInMchSH71/52Xh8YgZGzOdSr1D
         OGhIHAdFhaVrKJxzabqJQLi71jzPFDlkIhbpIJK36VWVplnZE+4QCJOOlTY9cX7yq1Tf
         NoPhuA2W73ju8Pi+Yng/uXz8luUjU/096yVSNlrUVov+o3bugwD9qIYdQ2NGY5BwY2Og
         N++Q==
X-Forwarded-Encrypted: i=1; AL+hErGVYQ06deReRXEsciRgzLLgXE27kJFu0VW20SoFo40n1kSAnvNLc2EVDVhkuYCjV4j0iSHfn7nMp4o/pX1qeUE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Qy+65+ncO4aqlQ4oyhSnoMb1N2yGgLdJof1Jqa449lFtNA0xu
	O6hos+aJAda3djibLIEr2b6PeZl2VPLHd3PaJxw98admAbPb2kVDbh65
X-Gm-Gg: AYBFou0uqMXgmCE/A+4xkg0hUAsiShPk6MJHJZBEniPrbW8hnFRe7uBFCEYVJvx5CHf
	QMY4xq0X4RmpsJGDzAdtX0Ktu1ba4NCOWVjl16+74BFvBJRRlVGPYog36/lkt5Vni1T/26i9pOj
	rPYh9g5HogtCowuhW2QQ7jHkvUARK8UjtbovZOQ+jAKgLY72QIvbdyX2UPBq12zC1lqGovAAW/S
	s7DnsGmut3SuWwjSBrbD7e0w5a/U+GUl2TqKkxWqao6lnELzGpCBoB7WDsDKbuDWdhFUiwd5To7
	LUgNalp+bd3uOtiYkB/+bME3ECYcR1s0SWbxlNWFLJGFMi7QGvwmlF3i+USrTEJl5qpebSmoBHF
	lTd81dc3VHsQmv/1kv/1iJcbfrKje1XfhZK9u+hljpP88O1fKeQ1kDK8QSOKPGltnTH8XhC5hrw
	eWHH0Q8Yt+JycTuoiLuUPkVuDVZZo3kC0ZBDLJr/qy5ynMmiwzKHgRhtSFEUt+MVhbYlqJsbgvc
	GaO4UokehX1xf5uMYuKA8GFqAQ3aNO3Th6taoYoXKOs7dNDcP2OMuYPY3NqRH3fqKiq0+SQsICU
	tzUGhyP0dHNzmoV3NFDh/7AAG6v0Nryz/wPXeCGxV24D0F/STHQz8jSaqrA6WufCGiz77QTX9rs
	y7hW6SJk6V0eDrEf8iBvlODMvEjkDmkrnOQXDHulAAI4r41apUBFD12ov7wlC1pip1+HJxAFAr0
	MFys2MnfOBGL3Cf4+YtgDMwc059KGx1SDHCMa0yHvB
X-Received: by 2002:a17:90b:5107:b0:3ab:be66:ddd3 with SMTP id 98e67ed59e1d1-3b1b0cdafd9mr3966945a91.32.1794673604170;
        Sat, 14 Nov 2026 08:26:44 -0800 (PST)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec622b6sm10229142a91.11.2026.11.14.08.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 08:26:43 -0800 (PST)
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
To: Kuniyuki Iwashima <kuniyu@google.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Kirill Tkhai <tkhai@ya.ru>,
	apais@microsoft.com,
	hargar@linux.microsoft.com,
	rlmenge@gmail.com,
	egoriluk@gmail.com,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Subject: [PATCH net v3 0/2] af_unix: Fix scm_stat.nr_fds leak in unix_dgram_disconnected()
Date: Sat, 14 Nov 2026 16:26:30 +0000
Message-ID: <20261114162632.16346-1-sidchintamaneni@gmail.com>
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

This series fixes a u->scm_stat.nr_fds accounting leak in
unix_dgram_disconnected() when purging queued skbs from
sk->sk_receive_queue on disconnect, along with a selftest:

- Patch 1 splices sk->sk_receive_queue onto a local list in
  unix_dgram_disconnected() and calls scm_stat_del() before freeing each
  purged skb.
- Patch 2 adds dgram_disconnect_fdinfo to scm_rights.c verifying scm_fds
  in /proc/self/fdinfo/<fd> across connect(AF_UNSPEC) and dead-peer
  send() disconnects.

Changes in v3:
- Drop unnecessary count_sockets() and sleep(1) calls in
  TEST(dgram_disconnect_fdinfo).
- Link to v2: https://lore.kernel.org/all/20261111225148.88506-1-sidchintamaneni@gmail.com/

Changes in v2:
- Drop MSG_OOB patches and tests per Kuniyuki Iwashima.
- Splice sk->sk_receive_queue onto a local list under the queue lock
  before freeing skbs so concurrent senders cannot extend the drain loop.
- Make dgram_disconnect_fdinfo a standalone TEST() instead of running
  no-op fixture variants, and also test dead-peer send() disconnect.
- Link to v1: https://lore.kernel.org/all/20261106051905.218638-1-sidchintamaneni@gmail.com/

Siddharth Chintamaneni (2):
  af_unix: Fix scm_stat.nr_fds leak in unix_dgram_disconnected().
  selftest: af_unix: Test scm_fds on dgram disconnect.

 net/unix/af_unix.c                            | 59 +++++++++------
 .../selftests/net/af_unix/scm_rights.c        | 75 +++++++++++++++++++
 2 files changed, 110 insertions(+), 24 deletions(-)

-- 
2.43.0

