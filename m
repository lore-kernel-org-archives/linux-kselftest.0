Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C95B426687;
	Tue, 20 Jan 2026 18:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768932204; cv=none; b=mZJ4sm4/WbypkzPolok724CmRG6NSiAjqzqGS1ulIE5cunRGR9TdshKbuDQcJS3EeRNMRb+TY/sNqiwEHuuUDEIhc43gwM5/jf1U1WeVf49er05oi+17qK6HyP/wSIJEViBmZELzyG1wbX6ukRgsPy0pw+4aowgTG5mfucgkPjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768932204; c=relaxed/simple;
	bh=Am3rZMrXWgdmBEKyRk0Vap2KbR2TTr9+UxoU2DYIAAM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hrUZgb+qE1vDOWZb9AhiscMTU0oZMpvZ4bta/nDzwblhZDQIaU9ilOKjLBa0DRRKeTHLXqSVBzfnhS9rNkplejZWyuVFOlBWivpMDJQ4fUJcnajcCTwTcLq6XMv2xwQctAdPsEn6RwwCwzswXkIhCyXrG/ecXiNwPiR4ObBHXZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E8AP+0Rk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E8AP+0Rk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ECF3C16AAE;
	Tue, 20 Jan 2026 18:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768932202;
	bh=Am3rZMrXWgdmBEKyRk0Vap2KbR2TTr9+UxoU2DYIAAM=;
	h=From:To:Cc:Subject:Date:From;
	b=E8AP+0Rk6iwgLaCX6a8S5p00ne/IEJcgrJEKpGuAZ4aowlKBCaidO1b8feebvSr/V
	 CAN+ZEs/P9XS8PVaTFu+eBEW7kmcWCylxsS83MupVZVYmXrfUVyNCXzQByX4RVjPF0
	 H83HvO97wE1JvgjowD7pyiAAatr3A4lZoEoxjSrN7hj3hZ4mKqaOPja22Cpgb0QAig
	 +7N/U8A3iuCuys91Kc405W2hxdvMa/ddtznVpDaiETB/MUlgKEGvjdjUhpiXfQPxKJ
	 qRdj3VHCFXo4KTO17zpTAWIQqiJKc1oehLPr1kxDfwpLi3gQXZQN1pq8LwrbcFjLS4
	 BifWBzfqK3A7Q==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	shuah@kernel.org,
	sdf@fomichev.me,
	almasrymina@google.com,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next] selftests: drv-net: fix missing include in ncdevmem
Date: Tue, 20 Jan 2026 10:03:19 -0800
Message-ID: <20260120180319.1673271-1-kuba@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Commit ca9d74eb5f6a ("uapi: add INT_MAX and INT_MIN constants")
recently removed some includes of limits.h in uAPI headers.
ncdevmem.c was depending on them:

  ncdevmem.c: In function ‘ethtool_add_flow’:
  ncdevmem.c:369:60: error: ‘INT_MAX’ undeclared (first use in this function)
  369 |         if (endptr == id_start || flow_id < 0 || flow_id > INT_MAX)
      |                                                            ^~~~~~~
  ncdevmem.c:77:1: note: ‘INT_MAX’ is defined in header ‘<limits.h>’; did you forget to ‘#include <limits.h>’?

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
CC: shuah@kernel.org
CC: sdf@fomichev.me
CC: almasrymina@google.com
CC: linux-kselftest@vger.kernel.org
---
 tools/testing/selftests/drivers/net/hw/ncdevmem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/drivers/net/hw/ncdevmem.c b/tools/testing/selftests/drivers/net/hw/ncdevmem.c
index 3288ed04ce08..16864c844108 100644
--- a/tools/testing/selftests/drivers/net/hw/ncdevmem.c
+++ b/tools/testing/selftests/drivers/net/hw/ncdevmem.c
@@ -48,6 +48,7 @@
 #include <errno.h>
 #define __iovec_defined
 #include <fcntl.h>
+#include <limits.h>
 #include <malloc.h>
 #include <error.h>
 #include <poll.h>
-- 
2.52.0

