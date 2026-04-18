Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2237207DF7
	for <linux-kselftest@vger.kernel.org>; Sat, 18 Apr 2026 04:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776485841; cv=none; b=SNaxylWkoOsoEAGXZJHGSTUjt6cfyZVP+cOOcU/nvAOLmSBAIzygrW8T4N2V7mE/qjZZ6gGWxsOn0ZYieKbOwkCZuG0ItPScB6PX0SCup+af6m5txbX8qD/CyM0nnz+FU6gQNW7jAyX3Ghqp0+in7BifRCHxxxUUO4XTcFV5GMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776485841; c=relaxed/simple;
	bh=lWu4lifEBC+paMWkBtn1n5QMc+5bw0cgiGP7ZcJVeJo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FPk0vkL+RIjVXvmak8wmVBf30eL/i3mkPqBn+YOU/A7xh7UpSa3L7ewhsj1b89EEjbzv/jNmfupleNiu5EUZr6nmFloevsSYtVLGTIuRI88qnS8o0D8xN7wWCtOTwIn+LZxfbMn1TZsQldqshf0r6wALNys7Bbk1rMd13bl2P/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QhLFWnEy; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QhLFWnEy"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-82cf636dac8so555968b3a.3
        for <linux-kselftest@vger.kernel.org>; Fri, 17 Apr 2026 21:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776485840; x=1777090640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y3YeiL1Jj/muMdy1IqA7Xewdi0uB6Hzewvx0oWM/aKg=;
        b=QhLFWnEysR5NKXZ5QlgmR6qCCj6tDpUooqPy87McO5vei51N36ti6XdrFD7CzQvOmU
         U+gJgqQA8XgjDE6RvjRqd2WCOUO26j8Qc/QC3Wh3vUvoqa4S5n1b4b388/iMF2SEgVhI
         wX3E6WiUYYVUefzM1/9+FZk7ucqGx2dMd2HirSNoVi/2SeeUNOOlgHQwFPfCdsSTAICb
         8N56S26Dmkog26z+alV54yFWxNgySn29lJS4H8oU7GZk8FS4y0urprk5N7vdz3m0GWYD
         M6JEus+SV8VtYeF15eySECDbry0GyTrBCrDONOGa4FnYMZMVK4WgIR55pBPDIS9e/Zib
         ZDIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776485840; x=1777090640;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y3YeiL1Jj/muMdy1IqA7Xewdi0uB6Hzewvx0oWM/aKg=;
        b=sg4NtWGAAG81JvcdLSn89PyjqRkLE1c+h9K3ALAc5n3JLQe8BUytl8MBZEb/8zhchg
         7AE1wvb4ianlLfemuMFhODAwFfamNTrB7nMI+7m4RsyU7xA7b5L13d6aPakraai5sDQ0
         27wscoiJ3UZjY/X6X94mWlOeWFLE6yyCHCWmlS3aL3Ffpk6ngSOREJH9jo/DtJEALV5i
         TgYPEqi/gLg4Iwb/7LshlxUGQeNhoJBl/9HO9KOACPutj/m+SkTIVafwc0NQlzMzJYiO
         2GW5W0zt94MkhufrUeqxL4eqQaY72/ovsmucCk7NwHTBd44Zr8nxOijWxoLxJqGSurbK
         pE2w==
X-Forwarded-Encrypted: i=1; AFNElJ9vzfldqib8h408hxm9cpljegi2nu9C17EHtl/HtSVuj8ilfU6C4FNd2RlmW0kmcBFwW+D40S/gMhk9tr9Z05s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGR5fRdst/8Tazt5lYPDOms/TvWqU62qKmWCAmTb/pDdboba5Q
	xy3WZINWu7tgSuu2+/XYLnvQKbWjqygfLaZGRrphMUgLiSi5sPM5jjJE
X-Gm-Gg: AeBDiet+RmkUWha/ise5N6ASeLxye7Jxy/uJQLzXja2dYn29Slvpd8WrXY6zc+DLEKb
	2N6Lt5N0EyBLU2VvgWaA79p8b/XyJOoNqNLDDn2eXNFm/a0tw60F9iyL8URNS6MqPS/+8WgLqoa
	545c1VWYX9hIUydwQLHeQSwZ8My6tOp9cAFXWKC1Y0uU/TA9TEer24gc1iIQHA8OYxeLNvwpGGI
	mFnP/1tceMautWw+r1jDmTnR+5OeZEIktxNV/upKblEab8ONDEhvq27EEFhNNQCZCqhGAcV2Orj
	2sRkg3iutklZq4KhAik3I/a59yb9vl8gx+1s6I17xj21B6d6hL5ApsNGEr52Mzn3iwZRwfFInFO
	qzorcW17t/JD6kokgjm7674m6dmQ4h0RVKdplA+RY+K5PFy8a1NboOvsWrhif8zJe3NSP0hg3mT
	6VgRoHCuV6HyUD38CrKxomHge9BCBTtnjhY2Lx81hdY1gCVpxtCnYZJiDTPBOzGQ==
X-Received: by 2002:a05:6a00:2307:b0:82a:6b97:34a7 with SMTP id d2e1a72fcca58-82f8c941403mr6183189b3a.39.1776485839874;
        Fri, 17 Apr 2026 21:17:19 -0700 (PDT)
Received: from DESKTOP-MUHC17F.tail07b66e.ts.net ([188.253.121.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e981992sm4356787b3a.7.2026.04.17.21.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 21:17:19 -0700 (PDT)
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
Subject: [PATCH net 0/2] tcp: fix listener wakeup after reuseport migration
Date: Sat, 18 Apr 2026 12:16:31 +0800
Message-ID: <20260418041633.691435-1-jt26wzz@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

this small series fixes a missing wakeup after listener migration in
the SO_REUSEPORT close path and adds regression selftests.

The issue shows up when a fully established child has already been
queued on listener A, userspace has not accepted it yet, and
listener A is then closed. The kernel migrates that child to
listener B in the same SO_REUSEPORT group via
inet_csk_reqsk_queue_add(), but the target listener's waiters are
not notified.

As a result, a nonblocking accept() still succeeds because it checks
the accept queue directly, but waiters that sleep for listener
readiness can remain asleep until another connection generates a
wakeup. This affects poll()/epoll_wait()-based waiters, and can also
leave a blocking accept() asleep after migration even though the
child is already in the target listener's accept queue.

The fix is to notify the target listener after a successful
inet_csk_reqsk_queue_add() in inet_csk_listen_stop().

I also checked the half-open migration path in
reqsk_timer_handler(). That path does not need an extra wakeup here
because the listener becomes readable only after the final ACK
completes the handshake, and tcp_child_process() already wakes the
parent listener at that point.

The series adds selftests under tools/testing/selftests/net/ that
reproduce the regression for both IPv4 and IPv6. They cover both
epoll-based waiters and a blocking accept() waiter.

Patch 1 contains only the runtime fix so it can stand on its own and
be considered for stable backporting. Patch 2 adds the selftest
coverage.

Testing:

On an unpatched host kernel:

  unshare -Ur sh -c \
    './tools/testing/selftests/net/reuseport_migrate_epoll'
  unshare -Ur sh -c \
    './tools/testing/selftests/net/reuseport_migrate_accept'

The epoll selftest fails for both IPv4 and IPv6 with:

  accept queue was populated, but epoll_wait() timed out

The blocking accept selftest fails for both IPv4 and IPv6, for example
with:

  blocking accept() completed only in cleanup

On a patched kernel booted under QEMU with a minimal initramfs, both
selftests pass:

  ok 1 ipv4 epoll wake after reuseport migration
  ok 2 ipv6 epoll wake after reuseport migration
  reuseport_migrate_epoll_RC=0

  ok 1 ipv4 blocking accept wake after reuseport migration
  ok 2 ipv6 blocking accept wake after reuseport migration
  reuseport_migrate_accept_RC=0

Zhenzhong Wu (2):
  tcp: call sk_data_ready() after listener migration
  selftests: net: add reuseport migration wakeup regression tests

 net/ipv4/inet_connection_sock.c               |   1 +
 tools/testing/selftests/net/Makefile          |   3 +
 .../selftests/net/reuseport_migrate_accept.c  | 533 ++++++++++++++++++
 .../selftests/net/reuseport_migrate_epoll.c   | 353 ++++++++++++
 4 files changed, 890 insertions(+)
 create mode 100644 tools/testing/selftests/net/reuseport_migrate_accept.c
 create mode 100644 tools/testing/selftests/net/reuseport_migrate_epoll.c


base-commit: 52bcb57a4e8a0865a76c587c2451906342ae1b2d
-- 
2.43.0
