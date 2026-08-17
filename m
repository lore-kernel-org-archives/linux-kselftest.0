Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E463285068;
	Mon, 17 Aug 2026 09:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786957867; cv=none; b=L8jow5AoHX6ROuC9q7GQNl3V9h8paU9eTJidxWmhNnYAc74gLGKHxkAFtz9cGtq4wHHCl3AzeA5CG17wakI48jITfDn4q9QulNfBlNQ6kxDA/9EYskN1PMtKPvF0h7noR57MIaPIN7JXg0SWLuHRFcMfZO0SY/lLVnb7SxGjAvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786957867; c=relaxed/simple;
	bh=3PtwBHaoVE1AdiHnCIAi+yV7Nv0dKkEhmu/IEvrP1p0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mLegIckRa3DKSVm/jFRhzK6I6bkDeQl/T4Ao73W1a1F5ILoS47xPlToacEnxa6t43jddneRQmPF+mcVtMYfu3EH+oJMpYVHA1bFPQDOGvLL/VStOo67VHvQC7QKc/JvfbSvk3yox7EKtmJoRgQkDtxh4h+Xc55AiOB/As7zSJrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=cTkGPi/E; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="cTkGPi/E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Hl
	mDL3tBEO2C94aJxBhvVsgsjTiyefcae9H4rAJukqk=; b=cTkGPi/EhasUlNj3Uq
	1y1mcqQE6CxU4JnpBWyGuBgCk1LnBtgeBV+AVFawLiUShFcEhED8Q9NrwGx/Z9zr
	LuXDsgKsabuFmUvlF0I7XEkFWdafjTYas/UMypt6T18is14673OPJPA4M5oeBA0N
	ysa68BAD+urf+2HYEwe6ZGOlE=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3nwL8z4JqwN1xQQ--.31345S2;
	Mon, 17 Aug 2026 17:10:21 +0800 (CST)
From: Qingshuang Fu <fffsqian@163.com>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	SeongJae Park <sjpark@amazon.de>
Cc: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Qingshuang Fu <fuqingshuang@kylinos.cn>,
	Qingshuang Fu <fffsqian@163.com>
Subject: [PATCH] selftests/net: fix kill() argument order in fin_ack_lat
Date: Mon, 17 Aug 2026 17:10:17 +0800
Message-Id: <20260817091017.281104-1-fffsqian@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3nwL8z4JqwN1xQQ--.31345S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uw47Cr4UJry5try8uFyxGrg_yoW8WrWUpF
	WfK39rCF1rGa12ya1jk3y8JFyxuF1kGw48Gr1j9r1UZ395JFykWrZIkF1jvwnIq39aq3W5
	ZF1S9FWYka1UA3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piiID7UUUUU=
X-CM-SenderInfo: 5iii21xldqqiywtou0bp/xtbC6h1uOWqCz-2x+gAA3x

From: Qingshuang Fu <fuqingshuang@kylinos.cn>

sig_handler() passes its arguments to kill() in the wrong order: it
sends signal number child_pid to PID SIGTERM (15) instead of sending
SIGTERM to the client process.  The call therefore always fails
(a pid is virtually never a valid signal number) and the client is
never notified: when only the server process receives SIGTERM, the
client keeps running its infinite connect loop as an orphan process.

Swap the arguments so that the server forwards SIGTERM to the client.
Also guard the call with child_pid > 0: the client inherits the
handler and sees child_pid == 0, and a plain argument swap would make
it call kill(0, SIGTERM), signaling the whole process group (including
the invoking shell) instead of exiting quietly.

Fixes: af8c8a450bf4 ("selftests: net: Add FIN_ACK processing order related latency spike test")
Signed-off-by: Qingshuang Fu <fuqingshuang@kylinos.cn>
---
 tools/testing/selftests/net/fin_ack_lat.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/fin_ack_lat.c b/tools/testing/selftests/net/fin_ack_lat.c
index 70187494b57a..f985e01354b4 100644
--- a/tools/testing/selftests/net/fin_ack_lat.c
+++ b/tools/testing/selftests/net/fin_ack_lat.c
@@ -103,7 +103,8 @@ static void server(int sock, struct sockaddr_in address)
 
 static void sig_handler(int signum)
 {
-	kill(SIGTERM, child_pid);
+	if (child_pid > 0)
+		kill(child_pid, SIGTERM);
 	exit(0);
 }
 

base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
-- 
2.25.1

