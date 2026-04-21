Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6763C9438
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Apr 2026 12:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776774681; cv=none; b=puN5HwfsRL8rcKxpfYO5gUNWkTkp6DVa1947bgAa7AJhbFJMHbXJbeC21fvmQ/SRzjQfMzC1ubmY0IFc597Wy3uW2vtQAwOhoTT2tdgwv6QKQJxPHPi1fQfPFbqVMN6/k/nPQsTFqSh8CGl2gvC+SfBZDk83EK5IS9bqYcoj9/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776774681; c=relaxed/simple;
	bh=zFtsG+q7uxMvPKrlZCiZD0zWArHu+RI9bCRU8wEOyRU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rH1ubYbP6lz9UeZ6Py0/kzERcZJCpttdYfuq9Ds7kkVu5nFKDy3/H+HOypRj8lbNERDPrd6MC+V2Gep2UGA2TVAHyDI+2/x30oBlOFLRjwN4wM1aj42Aln7n+rABLtxDs0NN9sxXYvVeufQb5fMZSN44xnWi9Dvi4nWwRptKlA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PJqC2I33; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PJqC2I33"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c6dd5b01e14so1466108a12.0
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Apr 2026 05:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776774678; x=1777379478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=quKExtcxNcqwsw2W1PK/404UiMVFWlMem8o5xQPR6rw=;
        b=PJqC2I33uOM81yHtKv3u+kwQB1aXkD5RLICYCfpLCZ373Tq9V3DhJtEH2tVAI001H0
         kUakDvIfoKf6L9LdNj8KdexZSOmFOEFe4jqX1/ys+FJzTk8DlRMqqRU5DMo8diYbxo4K
         BX4gdTU99lwkfzdJC7kbrsr2yY4K+4/cmBQY9qHR+OcZVO6Qa5nKcw4cuZzJaJVDOraI
         WIk8n+eXOdEi/lAIxa2L5aO8ZpmYYEvEifV4qhZuv7yVCl5fKA9OmwiYV6G5TsZn5Uss
         xbRqCvTuTiaU/uHkWOgIDfnYtXfQMRDzMUphOxRadkqOYLn6iLs9zBEgZ9c80sgLi17K
         WyCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776774678; x=1777379478;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=quKExtcxNcqwsw2W1PK/404UiMVFWlMem8o5xQPR6rw=;
        b=UCHkY6qAd+OvJZyr2+87er2CRkgxca29DzpUPLzLDmx1cSNQku7sT5pJnTwKCBhJxN
         rGqmkkX5nQag2VifEXPi1PEb3oED+D5PoAWIp91Q8nb4ORIqhE3f4I+GtR4aYdbvFNIT
         phuUo86Zs2kfjzYrAdl/dFm+UXyVEMW0SElkqv214MxezTgEaeu8cJF0pZkIJLEtKB4a
         j77NacIUpSiok71EO+uus6KtZN4zWucEtMRnz1sFXXOhPZpMXNTit9Piz5j7zkUPjZ7z
         PzLyFYgwgCfAWuRPutGOWqzPMuyzfghH5Libdk0ODnLUXRipsI5YwIQMsTr/jswK98vc
         TJew==
X-Forwarded-Encrypted: i=1; AFNElJ9TaEyT2fo3jt17rBwOSLprpNV8+6+G7P+98MSjhhEAsvCyB218Tr0z2jN1YxZ3IquZBxHYZQ9PwiGTOAkFFSw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLZeFfcP+PWbuDVkkDIeRDPExHDJ8MjfCBtksnEuEGweTnY3fp
	/sp+j/Vh9q1wCUc/ipBZRtOx3VGSofxAoJqhbQSHWmHJSJPxXf4zW/gT
X-Gm-Gg: AeBDieuYvv1DOdQaPzoNgHWLM4t8+HW1nOMu5E6JjJ+xDoMSulJ4Ec/O0ceD0CU4qWj
	rrqyS+WDsMqRqZZA2jZ8B7niYS2lLrjh5TmGq916/nF240WdRlEOiPCGO87vbj8DohnIvYNOoqg
	s4zyMwk37anz2YSRSZvIvbO4tlZakVAj68Q6o0P0w1w6hfcYsss88Dqdpe8pC5u0pO394ssEleV
	og3Q6owCdzsHuZbzh6YhDsgFjRqUDlycGTcIr6am9dMWSFHhKiSojGjWpop3IKF0RFvyQCiN8Fz
	BGTobhBN5lBMkUdRtApUfDt3ucfoCcxmc1AV7gY1kOLfzMeTmZ3klt8VoEBznXX8eA70NIEVlEW
	hSSHo9TC/qskvFxfInkxeC81+dnqL/PjXq6q+Lljz85UaNMcME5MHSyHF/aToQnHdeG1UNIEF0i
	PbLZP7MF2BjLLl8gP3jkZKxUoAJBxjbwhvh7k5SpQ2Hkp3QigTBXogZMisG7oLdA==
X-Received: by 2002:a17:902:c9c4:b0:2b2:eb9d:1648 with SMTP id d9443c01a7336-2b5f9fb33dbmr116307155ad.37.1776774678330;
        Tue, 21 Apr 2026 05:31:18 -0700 (PDT)
Received: from DESKTOP-MUHC17F.tail07b66e.ts.net ([188.253.121.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff409sm169724315ad.14.2026.04.21.05.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 05:31:17 -0700 (PDT)
From: Zhenzhong Wu <jt26wzz@gmail.com>
To: netdev@vger.kernel.org
Cc: edumazet@google.com,
	ncardwell@google.com,
	kuniyu@google.com,
	davem@davemloft.net,
	dsahern@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	tamird@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Zhenzhong Wu <jt26wzz@gmail.com>
Subject: [PATCH net v3 0/2] tcp: fix listener wakeup after reuseport migration
Date: Tue, 21 Apr 2026 20:31:04 +0800
Message-ID: <20260421123106.142299-1-jt26wzz@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes a missing wakeup when inet_csk_listen_stop() migrates
an established child socket from a closing listener to another socket
in the same SO_REUSEPORT group after the child has already been queued
for accept.

The target listener receives the migrated accept-queue entry via
inet_csk_reqsk_queue_add(), but its waiters are not notified.
Nonblocking accept() still succeeds because it checks the accept queue
directly, but readiness-based waiters can remain asleep until another
connection generates a wakeup.

Patch 1 notifies the target listener after a successful migration in
inet_csk_listen_stop() and protects the post-queue_add() nsk accesses
with rcu_read_lock()/rcu_read_unlock().

Patch 2 extends the existing migrate_reuseport BPF selftest with epoll
readiness checks inside migrate_dance(), around shutdown() where the
migration happens. The test now verifies that the target listener is
not ready before migration and becomes ready immediately after it, for
both TCP_ESTABLISHED and TCP_SYN_RECV. TCP_NEW_SYN_RECV remains
excluded because it still depends on later handshake completion.

Testing:
- On a local unpatched kernel, the focused migrate_reuseport test
  fails for the listener-migration cases and passes for the
  TCP_NEW_SYN_RECV cases:
    not ok 1 IPv4 TCP_ESTABLISHED  inet_csk_listen_stop
    not ok 2 IPv4 TCP_SYN_RECV     inet_csk_listen_stop
    ok 3 IPv4 TCP_NEW_SYN_RECV reqsk_timer_handler
    ok 4 IPv4 TCP_NEW_SYN_RECV inet_csk_complete_hashdance
    not ok 5 IPv6 TCP_ESTABLISHED  inet_csk_listen_stop
    not ok 6 IPv6 TCP_SYN_RECV     inet_csk_listen_stop
    ok 7 IPv6 TCP_NEW_SYN_RECV reqsk_timer_handler
    ok 8 IPv6 TCP_NEW_SYN_RECV inet_csk_complete_hashdance
- On a patched kernel booted under QEMU, the full migrate_reuseport
  selftest passes:
    ok 1 IPv4 TCP_ESTABLISHED  inet_csk_listen_stop
    ok 2 IPv4 TCP_SYN_RECV     inet_csk_listen_stop
    ok 3 IPv4 TCP_NEW_SYN_RECV reqsk_timer_handler
    ok 4 IPv4 TCP_NEW_SYN_RECV inet_csk_complete_hashdance
    ok 5 IPv6 TCP_ESTABLISHED  inet_csk_listen_stop
    ok 6 IPv6 TCP_SYN_RECV     inet_csk_listen_stop
    ok 7 IPv6 TCP_NEW_SYN_RECV reqsk_timer_handler
    ok 8 IPv6 TCP_NEW_SYN_RECV inet_csk_complete_hashdance
    SELFTEST_RC=0

---

v3:
- update the selftest patch as suggested by Kuniyuki Iwashima
- update the test flow comment to match the new epoll checks
- initialize epoll to -1 to avoid a compiler warning in the selftest

v2:
  https://lore.kernel.org/netdev/20260418181333.1713389-1-jt26wzz@gmail.com/

v1:
  https://lore.kernel.org/netdev/20260418041633.691435-1-jt26wzz@gmail.com/

Zhenzhong Wu (2):
  tcp: call sk_data_ready() after listener migration
  selftests/bpf: check epoll readiness during reuseport migration

 net/ipv4/inet_connection_sock.c               |  3 ++
 .../bpf/prog_tests/migrate_reuseport.c        | 46 ++++++++++++++++---
 2 files changed, 43 insertions(+), 6 deletions(-)


base-commit: 52bcb57a4e8a0865a76c587c2451906342ae1b2d
-- 
2.43.0
