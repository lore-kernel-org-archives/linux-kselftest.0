Received: from passt.top (passt.top [88.198.0.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7969738B12A;
	Mon, 18 May 2026 18:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.198.0.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779129268; cv=none; b=hJBwrf33jdRBYmixuWzR6Gd5YQnOh7IHMhesbKbSk2JyRQ/Sx0mQ1Vn8MSZAqI+xjYdRoZkiGlbvYTcT6F0xpKREvYLA2i+1INob1RDTfwEEPmYMsLCWCaIlmq18kuWt1KmGXOictZ/nudNocfVsDRtnDg2mWVp5ERq6bcH4WnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779129268; c=relaxed/simple;
	bh=PdRPZQQOpmqJOxDDdmnFS15AOoR3KbmtVTn+hwxmRko=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jfcYkgFVgjB38RyFQFh5YXmZk0ggQYIXOMXNK2EdQiQtgy5okgi8mh5XwnVgakj3nY9Igy2tjVRjmA3W1OEVrxxhjs94HEccd8RTJHn3lnhKfXb+IcDAIND/2X/bqlQ3DBoTrhjmAGn1tX8B3QLqUBJ1WXg52f4dpC3umjmuXO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=passt.top; arc=none smtp.client-ip=88.198.0.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=passt.top
Received: by passt.top (Postfix, from userid 1000)
	id 62D145A061B; Mon, 18 May 2026 20:34:24 +0200 (CEST)
From: Stefano Brivio <sbrivio@redhat.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Pavel Emelyanov <xemul@scylladb.com>,
	Laurent Vivier <lvivier@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Jon Maloy <jmaloy@redhat.com>,
	Dmitry Safonov <dima@arista.com>,
	Andrei Vagin <avagin@google.com>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Subject: [PATCH net v2 0/2] Fix race condition between TCP_REPAIR dump and data receive
Date: Mon, 18 May 2026 20:34:22 +0200
Message-ID: <20260518183424.3144867-1-sbrivio@redhat.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If we receive data on a socket that's in repair mode, the sequence and
contents of the receive queue we dump depend on the timing. We need to
freeze the input queue, otherwise the connection parameters restored
later might not match the actual state of the connection.

Patch 1/2 has the full details and the fix, patch 2/2 introduces
selftests to illustrate the problem and verify the solution.

v2: Don't touch the fast path in 1/2 (concern raised by Kuniyuki Iwashima
    and Eric Dumazet). Further details in the message for 1/2 itself.

Stefano Brivio (2):
  tcp: Don't accept data when socket is in repair mode
  selftests: Add data path tests for TCP_REPAIR mode

 include/net/dropreason-core.h                 |   3 +
 include/net/tcp.h                             |   3 +-
 net/ipv4/tcp.c                                |   9 +
 net/ipv4/tcp_input.c                          |  15 +-
 tools/testing/selftests/Makefile              |   1 +
 .../selftests/net/tcp_repair/.gitignore       |   3 +
 .../testing/selftests/net/tcp_repair/Makefile |  23 ++
 .../testing/selftests/net/tcp_repair/client.c | 273 ++++++++++++++++++
 .../testing/selftests/net/tcp_repair/inner.sh |  32 ++
 .../testing/selftests/net/tcp_repair/outer.sh |  44 +++
 tools/testing/selftests/net/tcp_repair/run.sh |  12 +
 .../testing/selftests/net/tcp_repair/server.c | 155 ++++++++++
 tools/testing/selftests/net/tcp_repair/talk.h |  26 ++
 13 files changed, 596 insertions(+), 3 deletions(-)
 create mode 100644 tools/testing/selftests/net/tcp_repair/.gitignore
 create mode 100644 tools/testing/selftests/net/tcp_repair/Makefile
 create mode 100644 tools/testing/selftests/net/tcp_repair/client.c
 create mode 100755 tools/testing/selftests/net/tcp_repair/inner.sh
 create mode 100755 tools/testing/selftests/net/tcp_repair/outer.sh
 create mode 100755 tools/testing/selftests/net/tcp_repair/run.sh
 create mode 100644 tools/testing/selftests/net/tcp_repair/server.c
 create mode 100644 tools/testing/selftests/net/tcp_repair/talk.h

-- 
2.43.0

