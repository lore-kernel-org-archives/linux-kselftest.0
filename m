Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299223921DF
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Apr 2026 02:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776826004; cv=none; b=Uk3VmCmUZhz/NHNT/hfxXc7yNGAXOTanc8s11PYcVZUtjHI1IG1mjpOvZ/+gjGBj6+NRl7Vis0A3Elt9q/Eu8+0UCy4woeJx9UA8QEq+7bzeAjATmGl+teeq9khay6HeHhsMPk6Hx9OMfnD6Sb4fBop1kQYW37Gl/PmZ1ruLr0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776826004; c=relaxed/simple;
	bh=OaQovPa9+EGt0TGv46fnTHFkH7yaRjfaIRFduQr/UYw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jOwVJvhmqW7q6dRdm5Vv5qkQ+bwGOfRVeFy9LeTo6V+W7yEO+2vmYsnCF82UMWUHly+MDPRIScF/USiXKDs/6CUWENmOPupVg/2ocfZ114OtfJvHVm1B9j5LJAREnUGNCPUK9k7HOSmH35tDGjlLKWEzVft1vMTPPfPqaUhZV5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FlY59O+2; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FlY59O+2"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-82cf636dac8so2090618b3a.3
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Apr 2026 19:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776825986; x=1777430786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OfsVOB0fT6t3Cc1A7FO/ne2eHtXjxBYweMBP+Bjao20=;
        b=FlY59O+2+cAEFXGSvhuuINNDm5uHJnpwY0VA5Ez97mYcbqStGUaqnZ7LK42d/f1TVi
         BB1BvUaNt4/tDDAiFIbVc4kGrd+3cNY0+1u/tlZv6qJ9IG7QoeIutDdOZWcS/R3oxepw
         tTsnIlxYiTmHN8BJ6Iazgutnt7l35r7pvfnpZqwRH8LfEF8IGxEjmyaj0c5FP8KvCmex
         3sKmB9JadEbKXbBlwpMsaVUNzO6FzxkFOUVW9rXxwGp1py7XX8xUfrx103X1BI7Dc99d
         554OZ6ZhPHN+Md+Lxr46EtfvsGXEGltjQt5lTKe/4lWCt44RRbd3DgxNmVJkHnOU+POR
         WIeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776825986; x=1777430786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OfsVOB0fT6t3Cc1A7FO/ne2eHtXjxBYweMBP+Bjao20=;
        b=THrDhZocf8mOJMMQ26mvBeV8QZIE0x/BfagTSXj89iEWWr86JzHvUZ2tVMsWdox8aZ
         vr13nY1IchiJOVPFCodcbj2GBVXxXL5UgyjlmjoSGqDqqLvUk2uK6geupbbgURHaso7/
         O/jo6O3POCriw/Aqhb5UEl8fwGdrui9gXECbdoVBznmqqWPIB16VAYdyr7sB5K8IcT1v
         Qsr+iVMYrPdkhcQb53WXbWR6kjx+LSz4mKpgN20bB63RkQehxmhg/oKsDhYzgYqKKRl0
         YevwOEfy0IotunGWBVc2PySuQBYtVrf+i1+9addjXg2TkpLQ36suNbrk+0hV3YvjGq8U
         Ry+w==
X-Forwarded-Encrypted: i=1; AFNElJ/OqMmwA5+VDyCOFRmtldj9ABchpXng88p+RGX2P/+Hhd1tHBeHzPkYTgoy/GQyg5ynIeU2D/ynSyR0aRARcgQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+RPux+FL59sSRxUvG4AQIylV4JQg9N2IpxfhMNrTEc0GrngNt
	13nf+yTLy9vba/jRJszjKCBhRZhugEDfMh/52fdzvS8TCOJmr4VejBe+
X-Gm-Gg: AeBDietKqEfFsdzsM/3XKlGxkRx0or3n9g4JKlwJEow9DiaQ71tsxIjdFLfmK02KbB7
	VXyp/nP39DGGCJWN6A82P9ymRlQQc2B0amgoOzpFcPARuz9tssc+eqRkucrl5kX9ZIYHwmWrzRO
	eUECijX1X+7klLDdoz7awcPLI5CDIyj2SyNnINa1E/FAmNgpnPJ3mBHBcnf9z7ugiyV0quzIUQA
	UEnw8VmcOGfocTaPcQacUS+3sYRgEYLSc37C0XKXaIg5noUb5+SzIa12YSkdNmww6x0G9OC/qrn
	si6kUonAjv4xPbpbhZnylhKGWIP/O2iW4/N6TfplY/j6OR5KuHntVNeQ6k/NGWDJbRyRxOcODs4
	eNffREmbh+6lvbKBBkVegBYQhu/uKMVV1B4o1URe9uA80tt4oLPqAW5LKsd7ZUAg10NRFbSGJWa
	0aUDL5Pe0G1YOOa41eYewXQ6ujPVVYQ9qGFvDXdkt67OwC7Npju2qlOrZgB1TpUw==
X-Received: by 2002:a05:6a20:7f92:b0:398:b95c:51f7 with SMTP id adf61e73a8af0-3a08d8e2805mr22818050637.37.1776825986281;
        Tue, 21 Apr 2026 19:46:26 -0700 (PDT)
Received: from DESKTOP-MUHC17F.tail07b66e.ts.net ([188.253.121.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7976f92183sm10656632a12.3.2026.04.21.19.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 19:46:25 -0700 (PDT)
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
Subject: [PATCH net v4 0/2] tcp: fix listener wakeup after reuseport migration
Date: Wed, 22 Apr 2026 10:45:52 +0800
Message-ID: <20260422024554.130346-1-jt26wzz@gmail.com>
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

v4:
- fix patch 2 to route shutdown() failures through the epoll cleanup path
- guard patch 2's epoll cleanup when no epoll fd was created

v3:
  https://lore.kernel.org/netdev/20260421123106.142299-1-jt26wzz@gmail.com/

v2:
  https://lore.kernel.org/netdev/20260418181333.1713389-1-jt26wzz@gmail.com/

v1:
  https://lore.kernel.org/netdev/20260418041633.691435-1-jt26wzz@gmail.com/

Zhenzhong Wu (2):
  tcp: call sk_data_ready() after listener migration
  selftests/bpf: check epoll readiness during reuseport migration

 net/ipv4/inet_connection_sock.c               |  3 ++
 .../bpf/prog_tests/migrate_reuseport.c        | 49 ++++++++++++++++---
 2 files changed, 45 insertions(+), 7 deletions(-)


base-commit: 52bcb57a4e8a0865a76c587c2451906342ae1b2d
-- 
2.43.0
