Received: from passt.top (passt.top [88.198.0.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0D03D16F6;
	Sun, 17 May 2026 18:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.198.0.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779043699; cv=none; b=kCDs8NKgqHfIH1QyCCHAM7EHseMyArjuoDXjVE8LBnwx2WqoJxiPqNzSeQSSF2gf3jstwOIW5ODmJwPTcplY4s5HnLLwVvFGezM+5HBaZ4QHHJss9/ZNO5hD+6MjkJA3xwbKSjdFhuoCVyVghJ75M+x1kW0tJHqapLida1G+o8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779043699; c=relaxed/simple;
	bh=Ls51sy7a8VSV/7b7mC+EWkCCZNY9AAUy27MYUf5Rhkc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=db4kw7jyzxetWDDzQWv7S/wRvI+McaQ3avVaG2q/1D4K5ciEWHPuZKmOpO1LWI4M1ArQykN/96iP32IfFp6dZFQi4nnRjwAcP49/HOkfHRMTb/amX8tQcugawoW4c+pVt5zejPostuuYNFoM6/JY4NrAkeWxkPjeSMzTQtDbmwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=passt.top; arc=none smtp.client-ip=88.198.0.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=passt.top
Received: by passt.top (Postfix, from userid 1000)
	id CA39E5A0619; Sun, 17 May 2026 20:41:58 +0200 (CEST)
From: Stefano Brivio <sbrivio@redhat.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Pavel Emelyanov <xemul@scylladb.com>,
	Laurent Vivier <lvivier@redhat.com>,
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
Subject: [PATCH net 0/2] Fix race condition between TCP_REPAIR dump and data receive
Date: Sun, 17 May 2026 20:41:56 +0200
Message-ID: <20260517184158.2757505-1-sbrivio@redhat.com>
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

Stefano Brivio (2):
  tcp: Don't accept data when socket is in repair mode
  selftests: Add data path tests for TCP_REPAIR mode

 include/net/dropreason-core.h                 |   3 +
 net/ipv4/tcp_input.c                          |  14 +-
 tools/testing/selftests/Makefile              |   1 +
 .../selftests/net/tcp_repair/.gitignore       |   3 +
 .../testing/selftests/net/tcp_repair/Makefile |  23 ++
 .../testing/selftests/net/tcp_repair/client.c | 273 ++++++++++++++++++
 .../testing/selftests/net/tcp_repair/inner.sh |  32 ++
 .../testing/selftests/net/tcp_repair/outer.sh |  44 +++
 tools/testing/selftests/net/tcp_repair/run.sh |  12 +
 .../testing/selftests/net/tcp_repair/server.c | 155 ++++++++++
 tools/testing/selftests/net/tcp_repair/talk.h |  26 ++
 11 files changed, 585 insertions(+), 1 deletion(-)
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

