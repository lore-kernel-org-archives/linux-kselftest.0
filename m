Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=158.69.130.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795805907;
	b=bNDUqsH1LN4ssm5jFsxoUNrjLX6zRserG5+HJhUIffuLhVi+0g+1sA7BswdumsxUOG+q
	 D6RoWqMpfqJMA6/JQwhpOOhYRc5M8g2mKDT6lL4gWob1VdOravYpSSKkCzuqpcIJ7CuzL
	 1anhYNN37alnJoVAnzVRoRwKn+csNW36kqkOsLRiyQySFr+l6gJrmEosg0Seyno6vrJER
	 /glnSPkZX5/twOGK8+d49ftxzlF7BVCjxyEA/VZXPaPtuuvzC+U0kYeT6y889U+bN4ykk
	 4xTz+oBQp+etjXnxn22AaVXN3psUiaU1o3M5Q2tuVqXOwpaP5RtoqVNZcpf5mcNbWQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795805907;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WHY+8I3fXBrwECRQRQwc27pmPFAuQe8kSc5abxVwo8A=;
	b=kiC0z7Q+gkgP0gO6M4zJG/syKcL2+ETWC1i6y52f7MSStzSSyRhZ4lbYdu4nlFNCJ/I+
	 s8m7S2ZEUQyg+wW9IP/FILaAcdjQRvF2PYjasht62NNbwcRVPKSExHjvQlOwfrFeAUEGM
	 jpgq9hF71+30e6JR0Bm14QnUfsCpuxgIZdRb4G7c7FUGv+HiBh9h14NxJvtOt2BvwZ93e
	 qWd2TmCL2ucLlEEXONPSXyLrlRmbrZENFTip+sXVBlhUqXUcajezmnzATSYCwFsOs5960
	 hLDInYW6U1MbLJ+JI48nKR7y3HOVbi8vxn+0GQXak0lmeEatPllgHOuqIBXBfzH1gRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=efficios.com;
	spf=pass smtp.mailfrom=efficios.com;
	dkim=pass header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b="LJ/nnW57";
	arc=none smtp.remote-ip=158.69.130.18
Received: from smtpout.efficios.com (smtpout.efficios.com [158.69.130.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7022260A2601;
	Fri, 27 Nov 2026 18:58:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7022260A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=LJ/nnW57
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=smtpout1; t=1795805905;
	bh=WHY+8I3fXBrwECRQRQwc27pmPFAuQe8kSc5abxVwo8A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LJ/nnW579ILmO7NawQWrBvzx51rjKSsLQHibTzBRGdQ8xZwweWNEADrzdPTztQT/F
	 bperNJjC9+gBbNhs/WyjQW6vPjIrLeMTI9fp0lTEzAUDJK4DrnBDRpwtT/PV5GZ4UA
	 ZmeO4UXgXvluCIJPcGtkA08NBC107MJ2Bao5brC9fTXYmaDWOak2Lb1a8i2AciBvAL
	 tfxwQBM6MvNq+f1F/6nNQaZCsz9QRsNDR8sNSG99YNum7ygrA2LnY/i5ONmS/R2Pzw
	 2QVqDiVg4ZGpj5O/owIkX2tECkEdUWhk/T1dVSNpcUxdj7pSmwaJk5Mv7pgJaVS7sO
	 XjdclJi45qXRg==
Received: from thinkos.internal.efficios.com (mtl.efficios.com [216.120.195.104])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4jbjNx3Kb0zXmM;
	Fri, 27 Nov 2026 13:58:25 -0500 (EST)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 14/16] MAINTAINERS: Add the membarrier selftests to MEMBARRIER SUPPORT
Date: Fri, 27 Nov 2026 13:58:19 -0500
Message-ID: <20261127185822.158216-15-mathieu.desnoyers@efficios.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127185822.158216-1-mathieu.desnoyers@efficios.com>
References: <20261127185822.158216-1-mathieu.desnoyers@efficios.com>
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

The MEMBARRIER SUPPORT entry does not list the membarrier selftests.
get_maintainer.pl does not report the membarrier maintainers for a
change to these tests.

Add tools/testing/selftests/membarrier/ to the entry.

Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 222b7fc2c3aa..2ee220ccc5e8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17435,6 +17435,7 @@ F:	arch/*/include/asm/membarrier.h
 F:	arch/*/include/asm/sync_core.h
 F:	include/uapi/linux/membarrier.h
 F:	kernel/sched/membarrier.c
+F:	tools/testing/selftests/membarrier/
 
 MEMBLOCK AND MEMORY MANAGEMENT INITIALIZATION
 M:	Mike Rapoport <rppt@kernel.org>
-- 
2.47.3

