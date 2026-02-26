Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4EA4BC00F;
	Thu, 26 Feb 2026 16:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772121940; cv=none; b=Ph8vQIONSBQa9Wf1ibgvJv6RJ7c7td+O6boUcNTklONfkJ1vYregTOcs0qHTP06rOhHA8NQo2h9CvSEU2gYZt0rJv1+y9Grpf3Lcpb4KpjQCXv/bHoFeCk+UDZ6Y1Z10G57mrlXMNVv82pMGkhaljD6FSGcRgiVTAVDWLbNuc8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772121940; c=relaxed/simple;
	bh=yNM1KucGusRUNSjrZXGlb77jtzoumCtkIOtLUUYrmfs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SUDX9spCJIrA7NkXBkO75fPdYL4ZjkuTnFRehs2FzEbah635vxxjGeNBMKg9wYZMf1ZJF2dRN0CRXIlqj3SNiVbVudZ8/9RZR7z0MeyALSJwkz7NB/ude+WhEJMgdIoipl/LhfqkFc33b7UqIIw4FSjo8wVIwPDgGQ3cu4P2E/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i2eBUODB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i2eBUODB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 780BDC2BCAF;
	Thu, 26 Feb 2026 16:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772121939;
	bh=yNM1KucGusRUNSjrZXGlb77jtzoumCtkIOtLUUYrmfs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=i2eBUODBDDoBf9VeNDQKBXGmH+tcOV+RT7XH//FvkkkTMwmyVplK8qqEk4huklII7
	 2gFHxRfd97CXQ2KbPezyVPbkK/K7XBGpTE7GiLTB73ATCNHdSvqkcXmVIyVVjxcuC+
	 Rz0U9ox/VIZ54QVCQxYG5V+jXOQCAi2xU40GNSbGDMCpx/lQStp8t4C+XyJr2snRIt
	 uUT1nUDUShVMTPTIgZq10TNLfLGvZPkHtdoIq5MpA3lQRPE4yRQTlTdhzNJAqfZaoF
	 eD+hqe7Ik3Bz5wm8AFV3WqicvHj9CAutE8k8m/wvcChEW+XjwlAduGeHFn71FaKbLj
	 IgCPpP5jCkSpQ==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 26 Feb 2026 16:05:27 +0000
Subject: [PATCH v4 3/3] kselftest/filelock: Add a .gitignore file
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-selftest-filelock-ktap-v4-3-db8ae192ff42@kernel.org>
References: <20260226-selftest-filelock-ktap-v4-0-db8ae192ff42@kernel.org>
In-Reply-To: <20260226-selftest-filelock-ktap-v4-0-db8ae192ff42@kernel.org>
To: Shuah Khan <shuah@kernel.org>, Jeff Layton <jlayton@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=464; i=broonie@kernel.org;
 h=from:subject:message-id; bh=yNM1KucGusRUNSjrZXGlb77jtzoumCtkIOtLUUYrmfs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpoG9MrNn4M/oOjyQvwLyn5ACHagRDv46XiFXb3
 r8hn3W+9YmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaaBvTAAKCRAk1otyXVSH
 0Ku7B/4tJqn1LlbTiWt6jqbe73K1xOs9A7p1mYGPIuUteguGhAfjSVO8ARn+6PIftjenEXFpSKG
 hrDAedmvSljkw1iYTVMGTxOqmdl+CwBKcVPRukD/FZWqdy5WzUMcJZ5sKPEoBt9aB/uyH8ANfn/
 Ak4PZxqpIGT0Jtjw3pzfxOyLBkaCS46R/EvL7brOz8Zzqn27uxOMKP8tXwkalt0oX3+gfG+cyxj
 xtkiwEhaeG2HT4nSs+QnFx5QoC0EEECVfQPtpdMedVf8lG9FDigqk5kNNym71z0G2rMvE+Utytu
 09kwS7ZyYWXKCk9yQZyJpiDKniB6W8CswwdCvMhQ2TtmAT6I
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

Tell git to ignore the generated binary for the test.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/filelock/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/filelock/.gitignore b/tools/testing/selftests/filelock/.gitignore
new file mode 100644
index 000000000000..825e899a121b
--- /dev/null
+++ b/tools/testing/selftests/filelock/.gitignore
@@ -0,0 +1 @@
+ofdlocks

-- 
2.47.3

