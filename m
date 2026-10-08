Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E654839FCE;
	Sat, 10 Oct 2026 01:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791595173; cv=none; b=ehJUTMEm/LdzC5VbBrfjJOgjCQIQw6AeDPgTrkmVHZyb1G3/GYhuIitx2KRMIQRXmwuEbDnKTg883yQHIkkNwTqQ1evxJVszYlVJhvD2JCFERuvu0KXWuUru3gp6NLeo3g+bzeKUlloh/shwa7QtxhcZwSfptW06w3JEoQXqphg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791595173; c=relaxed/simple;
	bh=V1cAK+X8w8uc7tET+dGrmbrK8Mb0wBNiBdUkxNkAQtg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lo1miIRDpmU3yNbhyudTePTiL8JTb6zbtdtVIAuAE7+hqIHrBK3iGsiyp6/KqXlyNdLIGkd3wJKd+uOxyE/tGumynyzffTlP83X8O2fJm8rCm2/53VHhGOBIAR6lXIku89vdfKGemyA1zdAJz/nTFKytwgMObNV3Uzlai2kkcjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.b=fWjS4Q35; arc=none smtp.client-ip=111.22.67.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.b="fWjS4Q35"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=fWjS4Q35gkxbnGRfoAJ8CMIf/USGo63BwQ8yIOQqOrppgJ4OToYe+OyBLM40wDRuJsK0WLuW03pSN
	 +zppSUneuAKEATMsQ5myCDDN9kacDKW9rbJdivQM/1iCoo4dmEGR4kgn/uWTkUL4jVTKJNAMex/VfH
	 /PcnylXCh1kqOjws=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46ac992963ed-6286a;
	Sat, 10 Oct 2026 09:19:19 +0800 (CST)
X-RM-TRANSID:2ee46ac992963ed-6286a
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from openEuler-24.03 (unknown[223.108.79.100])
	by rmsmtp-syy-appsvr02-12002 (RichMail) with SMTP id 2ee26ac99295573-599f1;
	Sat, 10 Oct 2026 09:19:19 +0800 (CST)
X-RM-TRANSID:2ee26ac99295573-599f1
From: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
To: netdev@vger.kernel.org
Cc: Alice Mikityanska <alice.kernel@fastmail.im>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
Subject: [PATCH net-next v3 0/2] bareudp: Enable BIG TCP packets
Date: Thu,  8 Oct 2026 13:55:11 +0800
Message-ID: <20261008055513.1560739-1-yanhaishuang@cmss.chinamobile.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series allows BIG TCP on bareudp, the same way as on vxlan and
geneve, and extends the big_tcp_tunnels.sh selftest to cover it.

Patch 1 bumps tso_max_size of bareudp devices to GSO_MAX_SIZE.

Patch 2 adds bareudp to big_tcp_tunnels.sh. bareudp only works in
external mode, so the test attaches the tunnel metadata with a tc
tunnel_key action on egress.

Patch 2 depends on commit c57b2e60d4bf ("bareudp: set the inner protocol
to the protocol of the packet"), now in net-next.

v3:
- Patch 2: create the bareudp device in setup_bareudp() and return an
  error if any step fails, update the comments that only mentioned VXLAN
  and GENEVE (Sashiko).
- Repost now that the bareudp fix is in net-next.
v2: https://lore.kernel.org/netdev/20261003100939.468181-1-yanhaishuang@cmss.chinamobile.com/
- Add Acked-by from Alice to patch 1.
- New patch 2, as Alice asked for selftest coverage.

v1: https://lore.kernel.org/netdev/20261001042336.224343-1-yanhaishuang@cmss.chinamobile.com/

Haishuang Yan (2):
  bareudp: Enable BIG TCP packets
  selftests: net: big_tcp_tunnels: Cover bareudp

 drivers/net/bareudp.c                         |  1 +
 .../testing/selftests/net/big_tcp_tunnels.sh  | 52 +++++++++++++++----
 2 files changed, 44 insertions(+), 9 deletions(-)

-- 
2.43.0



