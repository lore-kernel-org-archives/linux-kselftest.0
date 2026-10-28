Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.229
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793208939;
	b=267MEr9tK2YlLowW6Z47z7axzkEFXt2QLTS9QN7M33QDq76tYatzrtYN93vtgmTJ+r77
	 xwnRMoSUh5IRThRvYiC+ukT0quUBgnwo0PssKbLT9+cp6f5keUDykK4EAR0W6maup0epF
	 avnqJtrBHPSs1NA4Oam1SN1kuLiaw3bbEhQCbJlwWboncCkeRerA/+V43fRkVYqO/9kve
	 vdw0HZ5BYOxo/yuOKLovGBSy4XG9Fjf8d4ff9Z+0zsg/WGMg1NtXiirSoM+PS9X5qYSOS
	 4ICw3fTFke27iLIVWxXxE8EsUXKF9HI+WNMlCK6yiE+cIP4phP43d3c2ZfB147LKqqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793208939;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=JYCogINmtcWvhGsimc1XH47DC7tqKp3oabGA83x3w+g=;
	b=d/iUUFSJ0YD+hpWNDOSkbUEAmPNcOho/JMPAP1m3NIW9joRM3u015bAXdZFmUFvgurte
	 txHWHbSyXdrsHKXx+asVEx3FfmeNTBcE9bMSscUvg8xUBHefgP+NhBUXovPbJN2iK6oRf
	 +Nqspey9wH4tj6i13viOxiSVnfZ3PdPliGVhx8pESMzxhEoR2XB/vpxGYQcsgX4dFRMNs
	 LNf7vtmoTDZ4PPFaRGiCJp75zcGmTU8ikVxbxONIjdRoP1S+u/ZBYCJKIPEG34T41JnPr
	 zT5qG35P08wIOwzl03PIA7C6x0oDMmq5f4b/areXRvGsXRivJzhYWvsYLC6ApLrxavw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=W9kYJmzN;
	arc=none smtp.remote-ip=209.85.210.229
Received: from mail-pf1-f229.google.com (mail-pf1-f229.google.com [209.85.210.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1263B606A339
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 17:35:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1263B606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=W9kYJmzN
Received: by mail-pf1-f229.google.com with SMTP id d2e1a72fcca58-8a06454116eso714201b3a.1
        for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 10:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1793208937; x=1793813737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JYCogINmtcWvhGsimc1XH47DC7tqKp3oabGA83x3w+g=;
        b=W9kYJmzNZ6+VEHFF4uCs4IopDL0cDTwKqhohe/BFStkIvGA+lKvHXgRnYFlOyHIeiU
         UwWpHRzH1PPIYMktEDcnayYTyfAYdcVQmgQv5uesmZqdqUboRzOc11W5ZFMlV7MbxSuw
         +QZByXxtQ/EhgN2u22PSiexC4ZRU4lWuSmD7t70MIrbDVXGG9Stm1tGAOv0c/TQrb/H/
         JKkRQlV1UpbqWqb1+pGoN1dxAzuNmWlkqxXMbZFPtu6Am+F3R4Lrc6yVcN3ucYKvYx2n
         NpyJ9IbSSh6ccLTQ6nvGVgTqR0bynCKkTzB0L7W3UypUlfm4cAKLrray5sPVFJoWct0u
         TdVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793208937; x=1793813737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JYCogINmtcWvhGsimc1XH47DC7tqKp3oabGA83x3w+g=;
        b=H9bD3edgfgbDb1xwKV/gq1ttFHFY6+rATzyOZMe6aEnQv+/9NGR9tQ39slz/PYBj7I
         GoqJ0KNbPb1Y0iBFKx/umfqHM6p70fIk94k+Xx1pUKSIkVZ4bc23d9XZ35IKW2OrqI4B
         SrfsH1otVTijlewckjENtzOYcEvI80Vu2Oqqk6JFK5jhn0yxKohgX112wA0XBDgKYiD9
         tIIwMZm2ScPH7/+sfzcU3kV+SCYAVAdD+l+oVkKENhCJPFc7rIzANbeZoK66gNlSNTHB
         LUhcCVfxujInlm1hgmNDpz1rr1klmiPOvAK2ryKOdmV8px6fVyuOiVTabboDlNdIYvCD
         /BQQ==
X-Forwarded-Encrypted: i=1; AKwUvBw70s2aW3cUVCuseIEvodO8g1nsijuXGucafNPoU1A+KAFlEBGOyqqO+vrUaX8Wjm5aQ2+RHck2eGEZ5yo8oVs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJvBOcb3oowuUY1gEBTyDciYzQX0+FqiBOOjG+vek8QQ2hYV16
	87XBTjstshOkpd28VIVQ9k3dcvgb/1nHoIZ8T5ibS688epHKI5dLRLHfqLeJzFvMdO3uNZcDiR5
	pjk+Okhtr+N27mbh8assuFPl0qIIcobaIE/1C
X-Gm-Gg: AYBFou3c6Bovg8fX5tsCZ/aWaFtr0TvTORw8CW2PNu7W2Jw47sQtocHC7IUK0dCCV3S
	Y+yyjF2f/MK009nWkQVq1fwpYn9zj7LpGAvwkYNrO10kzsPbEGntcA9++gEvbIGhSISJyrpLrmF
	isJGSZCVHDvXVcRXl80NDDHAO8FlX8PyymJQG3m/85O6rqLMBhD4e+IZyXFAB3b+QDWmBHY/OYA
	tRIqpy/Hp7ctRmezY3OiMP+IBocV+gvIjR0RgfAsUyEUI2gEql427RcXd+E+o222RMC2pLCYuVV
	fkgiVL6g/RpOGCVyEDpoZzCWS0PeFoo7wxClY1fJ5FmnnbqvJ6MIf3kuCma0vJGSvaFRxcPZ0t+
	a0YXd658wDgkHmJbh5q4zExZL5icGiJlFeFo=
X-Received: by 2002:a05:6a20:9145:b0:3e2:26fc:2e1c with SMTP id adf61e73a8af0-3e902343126mr2499850637.39.1793208937368;
        Wed, 28 Oct 2026 10:35:37 -0700 (PDT)
Received: from c7-smtp-2026.dev.purestorage.com ([208.88.159.129])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-cd8ccc4f975sm188208a12.4.2026.10.28.10.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 10:35:37 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-rjethwani.dev.purestorage.com (dev-rjethwani.dev.purestorage.com [10.17.2.234])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id 7983A401D3;
	Wed, 28 Oct 2026 11:35:36 -0600 (MDT)
Received: by dev-rjethwani.dev.purestorage.com (Postfix, from userid 1557719937)
	id 741D0DCDF71; Wed, 28 Oct 2026 11:35:36 -0600 (MDT)
From: Rishikesh Jethwani <rjethwani@purestorage.com>
To: netdev@vger.kernel.org
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
	Eric Dumazet <edumazet@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Simon Horman <horms@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Shuah Khan <shuah@kernel.org>,
	Hannes Reinecke <hare@suse.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rishikesh Jethwani <rjethwani@purestorage.com>
Subject: [PATCH net v3 0/2] kcm: reject the combination of KCM and TLS
Date: Wed, 28 Oct 2026 11:35:31 -0600
Message-ID: <20261028173533.2658096-1-rjethwani@purestorage.com>
X-Mailer: git-send-email 2.50.1
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

KCM's data_ready callback calls the lower socket's read_sock() inline,
from softirq. With kTLS RX that is tls_sw_read_sock(), which can sleep.
v2 deferred KCM parsing to a workqueue whenever read_sock() is not
tcp_read_sock(), and reworked the strparser workqueue to go with it. As
suggested in review [1], v3 instead rejects the combination, as was
done for sockmap in commit 460e6486617c ("tls: reject the combination
of TLS and sockmap"). It has never worked with kTLS RX: before commit
662fbcec32f4 ("net/tls: implement ->read_sock()") KCM parsed TLS
ciphertext as messages, and since then it sleeps in atomic context.

Patch 1 makes kcm_attach() refuse sockets that have any ULP, and
tls_init() refuse sockets attached to KCM. Patch 2 adds tls selftests
for both orders.

Patch 1 changes user-visible behaviour and is tagged for stable. Its
message calls out the errno change and the one refused setup that
previously passed data: TLS TX-only, in either order.

On the new sock flag: patch 1 adds SOCK_KCM to enum sock_flags, which
leaves one free sk_flags bit on 32-bit. I looked at the alternatives
first:

 - sk_user_data alone cannot be the marker. sunrpc and nvme-tcp set it
   on sockets that tlshd later upgrades to TLS, so it is already set
   when tls_init() runs and tls_init() cannot reject on it.

 - A new SK_USER_DATA_KCM tag, alongside SK_USER_DATA_PSOCK, is not
   safe. The tags live in the low bits of the stored pointer, and bit 3
   is not free: reuseport_array stores &array->ptrs[index] | NOCOPY |
   BPF, where ptrs[] holds 8-byte pointers, so every odd index has bit 3
   set and widening SK_USER_DATA_PTRMASK would corrupt it. It would also
   need masking at each of KCM's raw sk_user_data reads.

 - There is precedent for a flag owned by one subsystem: SOCK_XDP
   (commit e4a2a3048ed9) is set only by tun.

If you'd rather not spend an sk_flags bit on this, the alternative I
would implement is a bool in struct tcp_sock under
IS_ENABLED(CONFIG_AF_KCM), like is_mptcp and syn_smc. KCM only attaches
TCP sockets and the TLS ULP is TCP-only, so both checks can use
tcp_sk(). Happy to respin that way.

Changes in v3:
 - Reject KCM and ULPs in both orders instead of deferring KCM parsing
   to a workqueue.
 - Drop the strparser workqueue patch; it is no longer needed for this
   fix and may be posted to net-next separately.
 - Add selftests.

v1: https://lore.kernel.org/netdev/20261013033920.2069285-1-rjethwani@purestorage.com/
v2: https://lore.kernel.org/netdev/20261016025059.289202-1-rjethwani@purestorage.com/

[1] https://lore.kernel.org/netdev/3108e934-ec00-458b-8720-450554b35b55@linux.dev/

Rishikesh Jethwani (2):
  kcm: reject attaching sockets with a ULP, and TLS on KCM sockets
  selftests: tls: test that TLS and KCM are mutually exclusive

 include/net/sock.h                 |   1 +
 net/kcm/kcmsock.c                  |  12 +++
 net/tls/tls_main.c                 |   6 ++
 tools/testing/selftests/net/config |   1 +
 tools/testing/selftests/net/tls.c  | 144 +++++++++++++++++++++++++++++
 5 files changed, 164 insertions(+)

-- 
2.50.1

