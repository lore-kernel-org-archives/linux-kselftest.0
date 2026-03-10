Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEF2274FDF;
	Tue, 10 Mar 2026 00:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773104032; cv=none; b=JbK9B0m6O8L19hI4PSpKSoCK26TzfwzbMwDdVO+tqaI4TKiFwUjXjKNDXgqwEDCOGeF5WBv/5gYnOAOY7vAEVoEG9U7hO24r8D8v5bRao8EPEYfEzLI3PrVdUw2vwsgbKxOp61HEV/L94Np5ZjFZv2K6AKUg9N/cPblqinv7hK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773104032; c=relaxed/simple;
	bh=qH22VRerLX2QOg047vz2LcPzL2zaKfCDqi0cYtMXyNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CSQbrXulHtJohxq1+XpZkyiPFkDc0NALysqFOZz3pByfNZLqD7+rK1pQDKK46A1MxBafHPRFu3BUUOHK6OH2s/4OAiRW9T/rGYJIfk50gkG/mRySAKDFdhbai5Udm2Tv1HWd1luLbBcb2Kvduwaikdh1rCkaP/MdkwKz42YWV4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AUa1u31/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AUa1u31/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C452C2BC9E;
	Tue, 10 Mar 2026 00:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773104032;
	bh=qH22VRerLX2QOg047vz2LcPzL2zaKfCDqi0cYtMXyNE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AUa1u31/ZDzXW8yX7J6tqezJAW01Adoineu8vdLN4he8sZn1GAz91P40UULugzvvE
	 OuRz2Yb3rCi4IRUdjlw6TsI5bkgv2EhlF9fYfxHERFX1viAFv//NQnNRIrnc1W8ow8
	 eNtetjOkz2DiU1SgkrATQiRgXUi082zv/9ezbJI2iA3dVqY6hQ79VdkUkimrtLy0vc
	 74vflDOPdfkfIGhkPyWT0OOunWp2uwuJbPa1cjzXGBItTITJjwM/gGQ6qyDD72JmXm
	 3IEf8FYu/qdypdScP+PRQPd5PaeyhuMhU5c7TcZ8L/4Qh37Gw0BcYduUiuG0Q5bjbb
	 0KSZaAf4uyiHg==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net,
	donald.hunter@gmail.com
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	shuah@kernel.org,
	sdf@fomichev.me,
	linux-kselftest@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net-next 1/5] tools: ynl: handle pad type during decode
Date: Mon,  9 Mar 2026 17:53:33 -0700
Message-ID: <20260310005337.3594225-2-kuba@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310005337.3594225-1-kuba@kernel.org>
References: <20260310005337.3594225-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Apparently Python code only handled the 'pad' type in structs
until now. Add it to attr decoding. nlctrl policy dumps need it.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 tools/net/ynl/pyynl/lib/ynl.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/net/ynl/pyynl/lib/ynl.py b/tools/net/ynl/pyynl/lib/ynl.py
index 9774005e7ad1..8302c19ab55c 100644
--- a/tools/net/ynl/pyynl/lib/ynl.py
+++ b/tools/net/ynl/pyynl/lib/ynl.py
@@ -814,7 +814,9 @@ from .nlspec import SpecFamily
                 continue
 
             try:
-                if attr_spec["type"] == 'nest':
+                if attr_spec["type"] == 'pad':
+                    continue
+                elif attr_spec["type"] == 'nest':
                     subdict = self._decode(NlAttrs(attr.raw),
                                            attr_spec['nested-attributes'],
                                            search_attrs)
-- 
2.53.0

