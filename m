Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49333FF89F
	for <linux-kselftest@vger.kernel.org>; Sat, 10 Oct 2026 10:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791629871; cv=none; b=dTulU2Vrfw81sOasc2jZnxCNZ06ctlrxT3S2wZj+6SG6Od5Kr+uzq7AERtMgA4qbz0vh3ycC5OuadzwqDJpq859beZBFWoM2AvuSSCwGvYVHf2ivZNZMP3rCwr48n3YdDiTDUXvA1GglBWvLU5P6Tx4zgHcFb/F7g/GbhXS/o2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791629871; c=relaxed/simple;
	bh=7Yxz+ITQvs4gSufoddaaxMKTBtN2rFiFBlBd0ROOirQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Cj3+6yHcgqpTq60fpm2/Ps54HJGAXHK3X/YgNP4WozL/wDwZ3TGNffxwFzSkQ/WdqMXhNd2Vo8bG96bLqoAuArHs8mcKI3nLRvCrKmQGn3xubyCvCoUuWfuuXDjR/0KxmfTzRg1byWYS6nkK6/cXOmTVWCft9cJNyvfxNgHzNgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bBKJH9DE; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bBKJH9DE"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3514e7cbbbaso1112788eec.1
        for <linux-kselftest@vger.kernel.org>; Sat, 10 Oct 2026 03:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791629869; x=1792234669; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DEScPagcf5yzvrVh4E/CU31naOeEAlog7/cC2wN+nyA=;
        b=bBKJH9DEqsypIpS9vMHKWMyTEvncfcauZzq5yL+7PfPNFVGDhunpOSugVCBKb4E18h
         ljqD+fKsv/1+QWErDpXOyWq/BhPSKlwTm+MCIJsrCyFAP+XvboCyUJuPnivHVBS6LPsC
         Dki3+rEfbVgno1NHRijF3WXzRUlWS+yEMxdQ/l8frdkaqUc+aYt+a51eseVCksIDIUi0
         Lqc8yetYFzRharz4LVlLxovLCEqM1eHG8MLXcMU54kFrmplwds6i94MYcj5dqHEuVhRx
         8s6RoI1noStk4KJ59B2cZWP7f/L4pAYpaVUsBOBkRWcQOvJ4+8Pne0NMBDGtw3b7I6wJ
         Jy4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791629869; x=1792234669;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DEScPagcf5yzvrVh4E/CU31naOeEAlog7/cC2wN+nyA=;
        b=n4jJgfi/bV3unvYnSGxD5SfFJisbVjcb8FbVr8IrCbL5Eqjke/uibJo2HAr3Xm9sLW
         qML0hMYBcOPNGOaCCYqw0prAJikRzHFdmbZhNhH31/egdIiwwms+j1qP2t4UsoUN9wq4
         YUvv+OD/dNcgVor4cpfdb/PG2+vdH+xFs/mj6MIcVjfs/+gfAS7o+j9urHp2HBTb198j
         /k/Y1cXQlNQRi3mmiEKnSlhcNR94q3q7JWVIXJmFMHn+GB7mIux9p47m9q6CWTkIJDNt
         4gYX/X9cjsiJ0dz3/Fzie1doMRCIIavE3X4ANAIqjbS/5p9W46v5SuaCbWhNMd8WmQ7+
         gsPA==
X-Forwarded-Encrypted: i=1; AKwUvBw9JCE7FcXDx9P2rzLrkz/9kDbnGnyj5rNKCMB2FLEmBL5rJ6fnkOE+8Dlp9Dsm2940qqoQFZrSmjGutXU2ptg=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7kRnV/sQmmU/Au27WIW7uvDdyIjsOfqThhDPHvbVhYMCt2HWe
	1LLdespzpoJvaX6WIHktE+L/jl7zMtNwd+xa9idFJtSmdf8zZKY9P1gK
X-Gm-Gg: AYBFou2XjNInYD7fHhdRFy4pKm7G8p1oP/Z0PrjshFLtSsexETqc4kAGitLhQaksHnX
	Z80IDo0suWrp9o1OjnabjvaDz9BFcqvNLJRNoPNlz04hmKUjd+2fsmZCVwkuRQAulGrlYTc7m+e
	g0MKUHjG3a4aJy9ZVXvO4mR7EvuLxE+LwgOC6Il189mUiTLOkS02gBcMBKOf4zN+R/l2ifXKboc
	aCS+oET/UN2gHTLa/jFesGlYm3O+fMNlwoQkeM58PNeDSedxQB41yNB4kU3tg947/nPNLi5HFtY
	0Vg6yf9Dy5wUinDW5u48uvwDFp+CR6hPfxespPu9zk8e3RKJqFKo+V8xy74XyZsyshy4EZCAIM2
	Wttd1fTjiko05IRPD2PalyS10YbaSrwcUigmPaQkTBWDUr08O+TLgROqQSFX9png6RWNIirUGHY
	A00r4PoYqYCyudT/rVGaVGZgF2P4v9rLU2yPC+LaJdOLgkcPxDExnReiKE+9p05WRrFrhQzZoIG
	YSRY1bQXVwFVhuSuvVakHVQBZspcfBLrKjzUs0TNyXRW1ZYVoEjA0yQmZlr9eKvc86eKrtihacf
	lNScRvFSa7W8DN/jIagSAa3ruzy0wdu++Y2rgj02tB2FJYAwEynLDg==
X-Received: by 2002:a05:693c:20c6:20b0:352:4ede:e6fb with SMTP id 5a478bee46e88-3537e0426e9mr5385953eec.37.1791629868567;
        Sat, 10 Oct 2026 03:57:48 -0700 (PDT)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-353810403e9sm13577784eec.2.2026.10.10.03.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 03:57:46 -0700 (PDT)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Harald Welte <laforge@gnumonks.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Shuah Khan <shuah@kernel.org>,
	osmocom-net-gprs@lists.osmocom.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anil Kaushik <anilkaushikwireless@gmail.com>
Subject: [PATCH net-next v4 0/3] gtp: ynl spec for the GTP netlink family, a reply-command fix, and a selftest
Date: Sat, 10 Oct 2026 10:57:37 +0000
Message-Id: <20261010105740.223992-1-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds a ynl spec for the gtp generic netlink family, a driver fix the
spec exposed, and a selftest that uses it.

While writing a ynl-based selftest for the existing gtp family I found
that the GET and dump replies put the genl family id in the command
field instead of a GTP_CMD_* value. libgtpnl ignores the command so it
never mattered, but ynl rejects the reply as an unknown command and
drops it. Patch 1 fixes the driver; patches 2 and 3 then describe and
test the family.

Patch 1 sets a valid command (GTP_CMD_GETPDP) in the get and dump
replies.

Patch 2 adds a genetlink-legacy ynl spec for the gtp family
(NEWPDP/DELPDP/GETPDP/ECHOREQ). Description only, no uapi change.

Patch 3 adds a selftest built on the spec: it creates a gtp device, adds
PDP contexts with newpdp, checks getpdp dumps them and delpdp removes
them, by TEI and by MS address, and that deleting an unknown context
fails with ENOENT. It skips when the kernel or iproute2 lack GTP
support.

Changes since v3 (thanks to the Sashiko review):
 - spec: echoreq request now matches gtp_genl_send_echo_req(): add
   ms-address (required by the handler) and net-ns-fd (read by
   gtp_find_dev()), drop peer-addr6 and family (never read).
 - spec: delpdp request now lists the attributes the lookup in
   gtp_find_pdp() reads, the same as the getpdp request, instead of
   all the newpdp ones.
 - spec: add link to the getpdp reply, gtp_genl_fill_info() always
   emits it.
 - spec: commit message reworded, the per-command attributes now
   follow the handlers.
 - selftest: create the gtp device, which loads gtp.ko, before the
   family handle: ynl resolves family ids once per process with a dump,
   which does not autoload modules, so with CONFIG_GTP=m the test
   aborted with a traceback. Without GTP support it now skips.
 - selftest: only consider contexts on the test's own gtp device.
 - selftest: delete by TEI only, so the GTPv1 TEI lookup is used, and
   delete by MS address in the two-contexts case.
 - selftest: check that deleting an unknown context fails with ENOENT,
   both by TEI and by MS address.
 - Patch 1 is unchanged from v3.

v3: https://lore.kernel.org/netdev/20261009060615.4177402-1-anilkaushikwireless@gmail.com/
v2: https://lore.kernel.org/netdev/20261008181031.4129029-1-anilkaushikwireless@gmail.com/

Anil Kaushik (3):
  gtp: set a valid genl command in PDP context get and dump replies
  netlink: specs: add genetlink-legacy spec for GTP
  selftests: net: add a test for the gtp netlink family

 Documentation/netlink/specs/gtp.yaml          | 171 ++++++++++++++++++
 MAINTAINERS                                   |   2 +
 drivers/net/gtp.c                             |   4 +-
 tools/testing/selftests/net/Makefile          |   1 +
 tools/testing/selftests/net/config            |   1 +
 tools/testing/selftests/net/gtp.py            | 115 ++++++++++++
 .../testing/selftests/net/lib/py/__init__.py  |   5 +-
 tools/testing/selftests/net/lib/py/ynl.py     |   8 +-
 8 files changed, 302 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/netlink/specs/gtp.yaml
 create mode 100755 tools/testing/selftests/net/gtp.py

-- 
2.25.1

