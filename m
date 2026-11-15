Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794715580;
	b=ief04FY1ozadrgsuSzbWf/jjmLaSRAM3Q8cPzfNcKnR1R+DWCtkv9Eo8/zBGIdfQNJWk
	 XVgEgubgAO1532y76HaypsEfQJhQLOoQ3VSHGK4kMGGZlrlmkN5hSNHwdab9pox3UufJE
	 F75xz7ZSkvYTVz5IBPxd2TWhL50bKhWaoYsApFbbIg130SV2OkmgvCZKSEbex59fCn2hN
	 SfokPnc4g/Fdv+mRew5w6JjhPx5v5O945W0HT8JLLbCHfc358kBdIOwCpmHDkk7xOIfmn
	 5gNXiuybPlApugay8Y8q6Eyhf4EONHeSGR90OhNCsS4thdqCH0+9U1z6pI+HgiE1Uqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794715580;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JEym9dfcLV/JoHBALcPP+1Zb2oIRJDxXQAWLI+9icsg=;
	b=VSaNnoP5sWZB0zbuPXEZFCsJcoX/iu9eLBsGLTq9FzTOEgPe9lWCd+ra00uQdjl6fH29
	 reCXwGTP3etzrIkqo//Va+G6BnW/5UVIGgQlaRtsr98e2kbgJmpqHHqRTgdVIIFGYfuQo
	 zfgfh8PNfhPlknulwXX7YVqpuOnQtqMINKVOGDK7XPzn7Vkp0h4R9eJoUEKeXJmiKspAK
	 Vk/C58CqsEil+/JUGRsRypwM2DduW5UnYTpCO6TYwzIaxMwn8cOn4IL7Am1+0O9Vhf+Pv
	 GbDtx0YayumUPwBMAd/V91PplFF5PEyQpa63L8SXlSg0VUYizop8E6R+NbMOxDTYcLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R4zU1GlQ;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2B6606A327
	for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 04:06:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB2B6606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R4zU1GlQ
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8b5c3288e6cso999306b3a.3
        for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 20:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794715579; x=1795320379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JEym9dfcLV/JoHBALcPP+1Zb2oIRJDxXQAWLI+9icsg=;
        b=R4zU1GlQBzXZWwrmjfqjapkMcX+qoh4We1wBDnBv5+ydsBVRONNW6/EpHcFzIymZrk
         W1RXyPvmqBFPRZKdg4hgJA+oIWFyte5LLiNbbJRxHb8EY/oGZSmLpoZ+V9IUbGpAFHzP
         EchyJ6Wo0tHSHufIvDjjH7AUtaFtCRdwu2TsbQWhHxiJCK6YSYZhBKMRTTbGKszmVevp
         jKFuCKV2InSbHzbqWpaaQ+oTRpDx+3l4Ev2qfzgaU15MQXWp+HzO2Db4dDCMEgqyM3tU
         pzbyP81jRUqT92vd4B4bca0qyczrV4xJFESfwbX0E0MBGtki8CIYDlHXWSzRW2MKaeFq
         l6mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794715579; x=1795320379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JEym9dfcLV/JoHBALcPP+1Zb2oIRJDxXQAWLI+9icsg=;
        b=VZt/N9mL10BRGkP9dtBr08630PApnDxXpPC+5Sd+QdyhD0W7GH6Cqz0N9pmN4d5w/4
         a+z8YvyM8a0GQkHDwCNqFKItnFPjCX5jL9+HPDtesFVv7Xr8txD8OPCMurqeBCBedKfr
         2dauSpBsjxGaO5oxXJaLzY7oDdDzH8ReG0ChVFgjlEb+xprnmzjrhXaIJXRRQMHLdECm
         XB6A76DwfpiQifpVCwn9twq4h92Rf8j8xEYzcnlZO7VHpTxSeh5Yje6wTJd2OR4/j3Mv
         4UxdNGUD2cmSR0LzYd9RiIXpd/oLUN66/HmwOfCitN4sF+TdUx/PISE3JcVtzpuWyyX/
         j7Lg==
X-Forwarded-Encrypted: i=1; AL+hErF03PysAka9yByb2i325kPONz4/Iqal9yRNoQxu1wSyLnJW6NAvFSmmJ0jD5hyqdamAO55jy3MKg0A9Pr3R5GE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BJpoNZcPxb21oqm+eSjp3W8LAE+Ztscr5kpBuZioj4YP4Y+Jd
	dtlXbpNaMRktdXhO7+77KXrbg5YTXsOANYonFILJIYJLrZqqaJxOu0fE
X-Gm-Gg: AYBFou00yIDFQHs4ZtD0s6+fOFm+RbxQXAe3fURsTyeDzugf0KRiMOpzfVo1X4gIp9g
	4UTeNWOD0HK3DT/FZEUKKX53rCANoAJpMIs3tdgffR0I0cAhw4rI9yZfz2sYtuQD7trlHU0795h
	G2RrrTfcWtPwsnDwS/Tc6RgnbPLdn+E8Jla5sTkmSqvLVcZhsLoebjrbEv+XStIa/1nOqLzBTdW
	0lxI0b4bumMeJTR8IphtvmSZmRD3brkitUZ98Kj21V4zuAaXBY63LIx5Rj5oV9hzWWyvYFGF8ay
	6Xx68hoQY4+DqjR5Wl7+4PuzSnbUeJEywJRO4/uoHe3XFigMNRcrB434vmiwwcR8mXr+Lqd/qsr
	+O8Fdgs60/h7oVkgIbLq3zRBVZ5qfQb61qiaRPuDXMMze7bzuf4x/vjUALcMacHYEFbQRhtzt3b
	wAgbUkuh7EqXwmdIqkJ6ghLeG9Y2U4BPdiqIZnSQlQs7xWBJ2JSUkI5emEwSV5lOeW6XIDk4hPY
	d1wzdlCiMs+GFS6P++MAe6feQxZJhOWgrLiYn76ynhYd7iHe8j4BFPwT7tNA3yCL++m15F51R3e
	HbT64yM3F/HUitJsQa6C/wvQObDfM6lbu0Q2Dws2b5Luj9LRUJz8LDMqtU+G3Wx3NXlYVntzWQ0
	mmF8=
X-Received: by 2002:a05:6a20:b78a:b0:3eb:afe0:20a6 with SMTP id adf61e73a8af0-3f7a72b98d9mr6323697637.21.1794715578825;
        Sat, 14 Nov 2026 20:06:18 -0800 (PST)
Received: from localhost.localdomain ([116.88.205.165])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a8682sm2485668b3a.10.2026.11.14.20.06.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 14 Nov 2026 20:06:16 -0800 (PST)
From: Zhefu Peng <ilskdw@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	kuniyu@google.com,
	mschiffer@universe-factory.net,
	nicolas.dichtel@6wind.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net v5 0/2] vxlan: reset the remote's dst cache when snooping moves a MAC
Date: Sun, 15 Nov 2026 12:06:07 +0800
Message-ID: <20261115040609.61134-1-ilskdw@gmail.com>
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

When a learning VXLAN device snoops a known MAC from another VTEP, it
rewrites the remote's IP address in place but keeps the remote's
dst_cache and remote_ifindex. Traffic to the moved MAC can then use the
route cached for the previous remote and be blackholed. Patch 1 updates
the remote the way vxlan_fdb_replace() does, and compares
remote_ifindex in the early return only for link-local sources, so a
"via" device set on a dynamic entry is kept. Patch 2 adds a selftest.

Results on net with 1, 2 and 4 CPUs, per selftest case (move behind a
router, move to link-local, via kept):
- without patch 1: 0/8, 0/8, 8/8
- with v4 of patch 1: 8/8, 8/8, 0/8
- with this version: 16/16, 16/16, 16/16

v5:
- compare remote_ifindex in the early return only for link-local
  sources, so traffic from the same remote no longer resets a "via"
  device to 0 (Sashiko)
- selftest: add a case for the above and keep lines within 80 columns

v4: https://lore.kernel.org/netdev/20261113155133.75090-1-ilskdw@gmail.com/
- add the selftest (Nicolas Dichtel)

v3: https://lore.kernel.org/netdev/20261111180001.2475-1-ilskdw@gmail.com/
- use my real name in From: and Signed-off-by:

v2: https://lore.kernel.org/netdev/20261110153020.9635-1-ilskdw@gmail.com/
- also update remote_ifindex and clear offloaded, as vxlan_fdb_replace() does
- add the IPv6 link-local case to the changelog and a second Fixes tag

v1: https://lore.kernel.org/netdev/20261106144406.66035-1-ilskdw@gmail.com/

Zhefu Peng (2):
  vxlan: reset the remote's dst cache when snooping moves a MAC
  selftests: net: add a test for vxlan snooping moving a MAC

 drivers/net/vxlan/vxlan_core.c                |   5 +-
 tools/testing/selftests/net/Makefile          |   1 +
 .../selftests/net/test_vxlan_snoop_move.sh    | 199 ++++++++++++++++++
 3 files changed, 204 insertions(+), 1 deletion(-)
 create mode 100755 tools/testing/selftests/net/test_vxlan_snoop_move.sh

-- 
2.54.0

