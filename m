Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161E22E1F02
	for <linux-kselftest@vger.kernel.org>; Sat, 18 Apr 2026 18:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776536035; cv=none; b=o1br+0wzhcYXIoWDcb9rf21ADAG5WCDCTSN8+rbf2pAwgvXCzGkspcXbIWQOIMjWirjpGNsIRukH25DLNw1Rdr344MRU0LF7A1qQJspLccM8/yBemUo6AXWiOyZVdimuEbECudl7Ib/PmDfl6g6TD5ttEdfv5FRzZZ6BMWuXXI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776536035; c=relaxed/simple;
	bh=YYQJavEnd1fnX+vR3sVF/zbo5SR6pv0KkvAYvprHc3k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XkN/96ely6PANQiAAm1oHbfQsh2eDkybKsbb1W/Wd5DwiVwnDOxD7PsPWUfV71N5kgmDxmBfvOQQux68iwKtlwEkpAWeLpl6y2uXvSzk/UfVhkV5idPaEffYH0C12mBVnxDKEUnrtrXOnq7rHg0C5GSAszozM4lwOZiQq4RNMKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=peRZ0NWz; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="peRZ0NWz"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-82a655cfab5so1725575b3a.1
        for <linux-kselftest@vger.kernel.org>; Sat, 18 Apr 2026 11:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776536033; x=1777140833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hm7Zzjznl6z94RlMoEkmeGxVQZOGZnEHpCrSYXcXznI=;
        b=peRZ0NWzgz3gIKgXV+x4hIxwp/Ty+F11ETRtasR4XVbt0UjTg3Ba0tMZwfGFvWcmPa
         EZCnIaluTs3jvRTdHDdul0EUvO99Jzv7Pm+SG8/PhunoPxlfmnd4aHl3FnIaL1mRy7Py
         48FcrF7XCc/GH4P6kHkVhid9zXCaECPSSzlkN0Ir7TtclmG5NgDtHTcIlv6HluM0pAyz
         zDwh+0ulGDbl/O8auu+eASVAxMjyff429YQm4PB6FedCmzZc1EGIZuqYDSreSApF/Iax
         EgsyYALjdIw+b8f/88I8ltsIsjSLCm3r1EDqTXRkKajD60KcxV8hnITuDIM7uWgMGxb2
         OCHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776536033; x=1777140833;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hm7Zzjznl6z94RlMoEkmeGxVQZOGZnEHpCrSYXcXznI=;
        b=LEFxDVdfgE7GLB1yeuuack76QXBW86QFCp5DbR7nN2Mk/Hj5Eh/3GUA31siSlRwJfy
         2bJ4hIQjupw4FO4n6n/7/hupVKYwcomgC4hmNEAtM6spBpK0mogL67IhVWcovvzTwzt1
         VoXTs4XHjvPpi1c/CeUAFldJilNYE/Y6vBz2llFKxcgrbrVDYgyzsoRHqJUSLhpJonL2
         5GhwfXR650VoLkKk9P8+/NP+ECDITRWT5hMv2W2C07w4j/XYKTlzLoyqnEPVg7rfA9Ig
         CPUmWwn6+fYe1u9k+gkDkwPbbhNgqs9YF9yNY2+ahSbev9Y9vJiL74TkFYllLcwR7mG+
         D3MQ==
X-Forwarded-Encrypted: i=1; AFNElJ885hXqClrrLRJJ59UGMJuwspl/eWyR8zp7z6fkhEsJFj1yzlTXFJ6mbPtVU8Znap2TaWYHP8HUM3r9u2uNR0U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRVILXzfsjYkXpNzI+NYLm5H6Jjn28ZKbWOODSL9XVKza97uAo
	Ja+pqF7xhEyukBLFg/cSW0ntftQmBHufnNc9VY9GXNw+ETdJ9ly3NVkl
X-Gm-Gg: AeBDieuUraUWak97s+Cqv52AUHMHErzn9ZBT0BpCQJj2TYO0BwHxpQMJ/WCBLm7YDCO
	XFOeyjtpc9NizDgOu3lTvfSRWmcWOoccWTKyceHAev4J0DC7l9X4yKdrlXmreKkMbo73hRRwp97
	skDnINkfYTLzPUi0A16rNVvaEoUaglU9rtr9j727GgLFnKkbHOFtI4nUplsNBsFxEPmrJGLjUgB
	Y9eJ9DNybm1VQbO3URzDczKyEZzFF6lIJuByo0DCYNkaN/QPi9tAwds2L8J+A1RNXYxSXiBuTBt
	Cykw7TZaW+na6XTudOSyKKWAxgEFypMyvC0ET7QvJEkvtkyp9NokUxzCz/MKdhJU7YZWtrY21nC
	3c5+3L3meEmoraOZ8GTL1LQO8v/Nzxn8M2OsITJ5xTFOV9x/8Vq0a/rJOySdbzlG46qvuTmym1h
	4kOY5HZEk2opGwVGzxU5jdf84mwp1rBURcijkXBXoEGe7/rr18NMgzOd7HYT6VYg==
X-Received: by 2002:a05:6a00:4ac9:b0:82c:217c:98ca with SMTP id d2e1a72fcca58-82f8c828d95mr7744394b3a.12.1776536033299;
        Sat, 18 Apr 2026 11:13:53 -0700 (PDT)
Received: from DESKTOP-MUHC17F.tail07b66e.ts.net ([188.253.121.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9f7735sm5659402b3a.21.2026.04.18.11.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 11:13:52 -0700 (PDT)
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
Subject: [PATCH net v2 0/2] tcp: fix listener wakeup after reuseport migration
Date: Sun, 19 Apr 2026 02:13:31 +0800
Message-ID: <20260418181333.1713389-1-jt26wzz@gmail.com>
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

Patch 2 extends the existing migrate_reuseport BPF selftest with an
epoll readiness check for the TCP_ESTABLISHED migration case.

Testing:
- On a patched kernel booted under QEMU, the full migrate_reuseport
  selftest passes with SELFTEST_RC=0.

---

v2:
- wrap the post-queue_add() nsk dereferences with rcu_read_lock()/
  rcu_read_unlock() to prevent a potential UAF (Eric Dumazet)
- extend tools/testing/selftests/bpf/prog_tests/migrate_reuseport.c
  instead of adding standalone net selftests (Kuniyuki Iwashima)
- limit the epoll readiness check to TCP_ESTABLISHED cases

v1:
  https://lore.kernel.org/netdev/20260418041633.691435-1-jt26wzz@gmail.com/

Zhenzhong Wu (2):
  tcp: call sk_data_ready() after listener migration
  selftests/bpf: check epoll readiness after reuseport migration

 net/ipv4/inet_connection_sock.c               |  3 ++
 .../bpf/prog_tests/migrate_reuseport.c        | 32 ++++++++++++++++++-
 2 files changed, 34 insertions(+), 1 deletion(-)


base-commit: 52bcb57a4e8a0865a76c587c2451906342ae1b2d
-- 
2.43.0
