Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8360B34A3DB;
	Mon, 27 Apr 2026 16:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777305958; cv=none; b=oXqbnTrnypPffCsuxOe1GWwNUzgRv67bO3oOj8kmIFmoE7zw4mZXDTQow3hYHR/URrrP7VIaM9UHN75FSLDO7JKHTsMEL1HzpnzcVA7tAadh4aFCxP3qgZvFAkq2ndsGv/xJkqVkV/xFIUBmEloD4NzQsxYxHVLFkv0KcehOpXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777305958; c=relaxed/simple;
	bh=W1SRkiYTcWvF7f8ZhGxDMMs6COXEzVoexFW7mmyLsJU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NAzqfd2706pHQIKGP3ICalhJI2Yt1hrmK8W++UuKyejbGd4tCCxuKeWWIyKtI8H3DFfvNWow1iLfYEzVCEHYQQP5MvzdURFP2p8j7e+cwyxBa2LtilySWzURRjR7P9xYbPnFCIxP/byYoFW5Bk6BfSbprkGLJ0npBsTShfSJBoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=p8/Z+wr4; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="p8/Z+wr4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1777305953;
	bh=W1SRkiYTcWvF7f8ZhGxDMMs6COXEzVoexFW7mmyLsJU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=p8/Z+wr4vF81Ktggcm0AYWPwIuUxpe4cy3ZTh0Tjsf0pZHwFC8irRxi8kyCMezMQe
	 NUsEH8/S2KgpAg7CWLPR2ViljyELsfcu7ZHVRb3vQBts0YSkXxC06rL2fqRp5+DWLo
	 Xc7bV4i7CWBzBd11XDKhaPyiUtSE//v9wEFzIv7c=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 27 Apr 2026 18:04:56 +0200
Subject: [PATCH 1/2] gen_compile_commands: Ignore libgcc.a
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260427-kunit-or1k-v1-1-9d3109e991e8@weissschuh.net>
References: <20260427-kunit-or1k-v1-0-9d3109e991e8@weissschuh.net>
In-Reply-To: <20260427-kunit-or1k-v1-0-9d3109e991e8@weissschuh.net>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Rae Moar <raemoar63@gmail.com>
Cc: linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777305952; l=1058;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=W1SRkiYTcWvF7f8ZhGxDMMs6COXEzVoexFW7mmyLsJU=;
 b=PkYJWX4OrJ4otoup4YBc14tAcNA3dUrRAwcqp1uvK4FvToc8XmhGf1n4+XMv4ieYpbJzOtTMm
 7fQJM+stmh+Baq7Mst3fv42iip0Z/k0d3bKx/ogXwkm1MZ1E54LZhiK
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Some architectures link libgcc.a from the toolchain into the kernel.
gen_compile_commands trie to read the kbuild .cmd files of its
constituent object files, which are not available.

Flat out ignore libgcc.a, as it is not built as part of the kernel
anyways.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 scripts/clang-tools/gen_compile_commands.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
index 96e6e46ad1a7..8d14b81efd73 100755
--- a/scripts/clang-tools/gen_compile_commands.py
+++ b/scripts/clang-tools/gen_compile_commands.py
@@ -201,6 +201,8 @@ def main():
         # Modules are listed in modules.order.
         if os.path.isdir(path):
             cmdfiles = cmdfiles_in_dir(path)
+        elif os.path.basename(path) == 'libgcc.a':
+            cmdfiles = []
         elif path.endswith('.a'):
             cmdfiles = cmdfiles_for_a(path, ar)
         elif path.endswith('modules.order'):

-- 
2.53.0

