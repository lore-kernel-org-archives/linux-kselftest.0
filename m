Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E5D446BEC;
	Thu, 30 Jul 2026 15:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785425643; cv=none; b=n/pbVKuaZXAZ5WVjvx6TcenkxjakMx4/eKlWDvZFDcw0RLtcwBC/9Il5h1S5uLnza9fjmPVQKXEXoFri0F77ebGVWG0e0fr10/GeVI33kph8MjbuFKIT8xn9CP+iOajzJ+lmfiKCqgCx81ovJXkzmCTPWYhwYttKnGOMgeOzq28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785425643; c=relaxed/simple;
	bh=4IznK4iHQnOgKhIOVLkz3mKcjYpanEe1lysninVZ6qA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cTFor2okSgnavLgBH5poLNPrALOxmvRxdFrGqbof+nZjvbZICyKU5yWXg7WcIs6S20wljV5TgNGOyf3QTUIPsJca+C+MXGEUP0G3JhkN0PE7LTyAMV9pN8Vl3Tc9DQXH7kQYTq2e0P+UtLWwp+VLblCtyqTrwE1Eb5wnIBrnXz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 0ef62b4c8c2c11f1aa26b74ffac11d73-20260730
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:96b88caf-118d-4b7f-add6-2ee005fb4489,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:187b35f85e45fd9b64e635d5100d5755,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|83|102|850|865|898,TC:nil,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0ef62b4c8c2c11f1aa26b74ffac11d73-20260730
X-User: yijiangshan@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <yijiangshan@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 880560079; Thu, 30 Jul 2026 23:33:48 +0800
From: Jiangshan Yi <yijiangshan@kylinos.cn>
To: david@kernel.org
Cc: 13667453960@163.com,
	akpm@linux-foundation.org,
	liam@infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	mhocko@suse.com,
	rppt@kernel.org,
	shuah@kernel.org,
	surenb@google.com,
	vbabka@kernel.org,
	yijiangshan@kylinos.cn
Subject: Re: Re: [PATCH] selftests/mm: make libnuma-dependent tests optional
Date: Thu, 30 Jul 2026 23:33:44 +0800
Message-Id: <20260730153344.3149433-1-yijiangshan@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <fdfdf7ac-8ef5-457a-ad9e-c92f6df33ab1@kernel.org>
References: <fdfdf7ac-8ef5-457a-ad9e-c92f6df33ab1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi David,

Thanks for the review and the historical context — very helpful.

You're right that the situations aren't parallel: liburing was made optional
because it wasn't universally easy to obtain at the time, whereas libnuma is
well established and trivial to install on most setups. My cover letter leaned
too heavily on that analogy without articulating the actual motivation — my
mistake.

The scenario I'm trying to address is the *minimal container / cross-build*
one: some CI images and embedded build environments deliberately omit
libnuma-dev to keep the footprint small, or because the target has no NUMA
topology. There, `migration`, `ksm_tests`, and `rmap` fail at **compile** time
(`#include <numa.h>` not found), and `make` exits non-zero — so the CI step is
judged failed even though the dozens of NUMA-independent tests would build
fine. The goal isn't to spare users the install, but to stop a missing optional
library from failing the whole `make`.

That said, your comment makes me reconsider whether silent skipping is the
right policy for selftests. I'd be happy to switch to: keep the tests
enabled-by-default, but on missing libnuma print a clear notice ("install
libnuma-dev to enable NUMA-dependent tests") and continue building the rest,
rather than aborting. This stays closer to the "run as much as possible"
philosophy while still guiding the user to the missing dependency.

If neither direction is of interest, I'll drop the patch — no point adding
maintenance surface for a problem that isn't real in practice. But if the
minimal-container scenario resonates, I'll respin a v2 with proper motivation
in the commit message.

Thanks again for the patience.

Best regards,
Jiangshan Yi
