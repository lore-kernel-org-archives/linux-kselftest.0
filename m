Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E523B841B;
	Wed, 14 Oct 2026 20:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792008081; cv=none; b=SPoY4DMCou5V+ajq/tXvuaYGQGlXBskdy4n8wE5X7aaNJYwstNo1CSSKk+ECNAy69dkHsEzh0T0+QGmF21aWL3qp+TZZk++56wFemi2Fuxerz31abx5b3B6j75pP+oy3GDNS9owhBsNf9O76/5LNrgc/Fso3ivFcxDt7S5OE7+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792008081; c=relaxed/simple;
	bh=Br3i4PjZrw4EnEhv4YobGgIzVp24lxyAJqkBUQrmBWU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T0k03Hiut7SIio4h8yavKmc15rQHqqGnZu82km4c36zE2XkLfqTLmoGiJClmH5ZFbZbxT03wAgwwZ/JdBzZjybgQU3gfb6WG3nggqhAmyBWYYNyr1Cy7hkUkOJ5ggsAAZWNkDlP8+yFpGmFBC/sgjetGFFXkQKLRS1Qa9evsoGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G7XLT8hz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G7XLT8hz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F0E41F000C4;
	Wed, 14 Oct 2026 20:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792008079;
	bh=qLnh4Hy34iBlkE6qCYvkyeWqQCS3LTCQKonxGWsxSMc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=G7XLT8hze7D88bdDdOuG/X/bRFXetpPRrkCgCsKaplCwVCbQEv/kTvHRvEksYMZsy
	 uU0wDv308gByGvuAdPFZoxBQc57Dl814ruFHHcDsyvsPsRho7A7o81E0sx6in0wsOl
	 PzBc2aXIn2y2UtIRgpepPWGFke08EHEwOwyMqIOPlso4xBGcwvkUhLv+I/7CZPwuW4
	 Dh64LNv/vGsVJMS21RalvxRCHlQEYG/8/wlIJghMxSK8db69VhJMVSPx7VOuszDglf
	 B7tVdB+JhZ7Gfg9PCrrhwqZqO4MB/3V1bPz+CA5HQontpbKH2cX0E30RM7QHLbrC43
	 qNxSTJ+enbOtw==
From: Sasha Levin <sashal@kernel.org>
To: Shuah Khan <shuah@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	=?UTF-8?q?Ricardo=20B=2E=20Marli=C3=A8re?= <rbm@suse.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] selftests: keep the build status from wrapping to success
Date: Wed, 14 Oct 2026 16:01:09 -0400
Message-ID: <20261014200115.1363363-2-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261014200115.1363363-1-sashal@kernel.org>
References: <20261014200115.1363363-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The top-level all and install rules return failure only when every
selected target fails, which commit cad6f32665cb ("selftests: Deescalate
error reporting") deliberately kept as the default. They implement this
by multiplying the exit statuses of the targets:

  ret=$$((ret * $$?))

A failing recursive make exits with status 2, so eight failing targets
produce 256, and "exit 256" reports success. Building eight or more
targets that all fail therefore succeeds, and install goes on to
package an empty installation.

Record a successful target instead of multiplying statuses. The rules
still fail only when no target succeeds, and FORCE_TARGETS still stops
at the first failure.

Fixes: 5f70bde26a48 ("selftests: fix build behaviour on targets' failures")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/testing/selftests/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index 04cf073114318..a442b239f0610 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -236,7 +236,7 @@ all:
 		$(MAKE) OUTPUT=$$BUILD_TARGET -C $$TARGET	\
 				O=$(abs_objtree)		\
 				$(if $(FORCE_TARGETS),|| exit);	\
-		ret=$$((ret * $$?));				\
+		[ $$? -eq 0 ] && ret=0;				\
 	done; exit $$ret;
 
 run_tests: all
@@ -303,7 +303,7 @@ ifdef INSTALL_PATH
 				OBJ_PATH=$(INSTALL_PATH) \
 				O=$(abs_objtree)		\
 				$(if $(FORCE_TARGETS),|| exit);	\
-		ret=$$((ret * $$?));		\
+		[ $$? -eq 0 ] && ret=0;		\
 	done; exit $$ret;
 
 
-- 
2.53.0

