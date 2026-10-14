Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328001DF980;
	Wed, 14 Oct 2026 13:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791983072; cv=none; b=PbyFSJMK4LG6iQJKEZs+Zgx7dMIn0kAcTnfh2dPKjpCsF0Qb+qlOVRj28oe22Tj8JwML4ywistSm7564tCeYI0/l0O9AfYlR+gYc8eCaZU5GlznVGQ21RXWq9c6xUqAgsLEN3VYUpqI0SvjRDxHIHr1GkNu9/9ZyL72emlCl1HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791983072; c=relaxed/simple;
	bh=DfdG8Mv3+zufx8SrlKKlpFST8xc1hAD2q3bZ3e6KRPc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=V+3O2yI8vIwphj/FNdGh2VyCYVmMUxRpxCMs5UoclGCqyFaIGR0VjyjMIg2vht6FWKcYU7ct8kojovqAMBWfQmYaauFYTZPEQL9Ye7K2rCcwfMPfusRILh4XUJlZqOZOCPDXsJeU+wSW6cpY+EsmpqSWAppbU20r+3G4hy7NBGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y0n7EgOf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y0n7EgOf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7B3B1F000FF;
	Wed, 14 Oct 2026 13:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791983070;
	bh=PGYA60mHnTCioRjOgFXdMUTLxHyhzPZTPJY/+n4H04A=;
	h=From:Date:Subject:To:Cc;
	b=Y0n7EgOfFva5Ex6qRYM1AWszr3H1j/kRXd+Y1uV0yRYqNKbBogTslSrGDCb73OMc+
	 3lvZv4xPxXZbR105xlHsa04m13L9OP3Vl3EL7pai/EcWhPt9fipd5F/ILPNxT17hJM
	 Q7wJ9KDUbGblyFqESc+ZQdisJTYPDLKgIgMd1+ojZh9YWDPPgSp8kaeKG07I97FC0h
	 UtQQICFMJeShVovNdXAVQ6gisMaDOdMVZAT19oE7bUrRAbRA5sdFt8DaK1TESZ+76N
	 +J3T+O6GF62tB5efsDeloyKLIYKgbX6Ielyu1Cr8G04apLtBIL0GYGRBh5mc7Ln/bu
	 UMxbjZxwnkMMQ==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 14 Oct 2026 14:03:33 +0100
Subject: [PATCH] selftests: lib.mk: Don't fail install if no modules were
 built
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-kselftest-lib-no-modules-v1-1-e4f7208dcb56@kernel.org>
X-B4-Tracking: v=1; b=H4sIAKV9z2oC/yXMQQ6CMBBA0auQWTsJhQDqVYwLOx10tLamU4wJ4
 e4WWL7F/zMoJ2GFczVD4q+oxFBgDhXQ4xbujOKKoamb3tSmxZeyHzNrRi8WQ8R3dJNnRXt0Q0c
 DdSdqoeSfxKP8tvXlulsn+2TK6w+W5Q/U0onzfAAAAA==
X-Change-ID: 20261013-kselftest-lib-no-modules-b8d75c7c59c3
To: Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1324; i=broonie@kernel.org;
 h=from:subject:message-id; bh=DfdG8Mv3+zufx8SrlKKlpFST8xc1hAD2q3bZ3e6KRPc=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLO197uOTrNdauldgw7a43B6tC4Vz+2NRikJuVG1XdHB
 F99VLO7o5SFQYyLQVZMkSUui/tlfcnrNXwHF7bBzGFlAhnCwMUpABOZc4ORoeXKAdOZvHnf9mi5
 3ZNm7+F4u7HpTUfBrxnlG47+T5tu9Zzhf9n7m8n7Pl8LsLgv3Jl9M/1igC7flQdFSekZpREZG5+
 28wIA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The install rule for TEST_GEN_MODS_DIR copies *.ko from the directory
with rsync which fails if there are no modules, for example because the
directory's Makefile skipped building them. Only run rsync if there is
something to install. This currently affects the livepatch suite but it
seems sensible to fix here for added robstness.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/lib.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
index f02cc8a2e4ae..7841bd4239c7 100644
--- a/tools/testing/selftests/lib.mk
+++ b/tools/testing/selftests/lib.mk
@@ -155,7 +155,7 @@ endef
 
 define INSTALL_MODS_RULE
 	$(if $(INSTALL_LIST),@mkdir -p $(INSTALL_PATH)/$(INSTALL_LIST))
-	$(if $(INSTALL_LIST),rsync -a --copy-unsafe-links $(INSTALL_LIST)/*.ko $(INSTALL_PATH)/$(INSTALL_LIST))
+	$(if $(wildcard $(INSTALL_LIST)/*.ko),rsync -a --copy-unsafe-links $(INSTALL_LIST)/*.ko $(INSTALL_PATH)/$(INSTALL_LIST))
 endef
 
 define INSTALL_RULE

---
base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm master
change-id: 20261013-kselftest-lib-no-modules-b8d75c7c59c3

Best regards,
--  
Mark Brown <broonie@kernel.org>

