Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFEF6386C22;
	Sat, 12 Sep 2026 23:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789256382; cv=none; b=SCEjCqgrirPbILdi5rhpjaIfu6ScTfd5aTns0pNy71Jza/oxmE1JezDmRwjNdjRX408275naihaBcTf6mobPPyKzG0iF+tUEfJ16aRlZDFLB+eQKB+yF4wH4SVkVhISrKk541oDAC7Vy794DoVBw0f/2wJB82f7nTmY6ev/AS60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789256382; c=relaxed/simple;
	bh=bxcnMsu0RKn1sjspF13NM5HQXwDKmk95ogZLKBNwyXU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i9KM1wB0OygJRUlD3Q7o1G3ZiH40/YwcuBGSK7bd9eTTSYJOv+iiKhNc738xcdzLRfk137dFiBUAftWHviie97FNf6GVGs3epVdGHFvgg3Wh26cEOL6UwnieCEOJALQF8+XUk/iph4b7Jdn0QzUw8gpz0MxwoQC56CyZlNypjEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VHX/4wl7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VHX/4wl7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A4D91F000FF;
	Sat, 12 Sep 2026 23:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789256380;
	bh=Nh7buv5FGpEWpnFr1JC7NVQlhQyknTA7nXPg/+KnG9s=;
	h=From:To:Cc:Subject:Date;
	b=VHX/4wl7YtC/h8C5h+Z+wvgDPOJgGRKZNLQsz+TW1UwHVo8lLQpIzVbezUYj47110
	 gbvg9RgGgueMGA0evbFOTo3BnWxmKsGXxin1YgUrRjzON6ijfGrksF/Df7gCznkBKY
	 3TVLgYorjb34QanumHkeSlrT3uXA22m4glcKBWO7WVgDNZHrJ1qXa/QNWZINibv0Ap
	 BQeTyary9gxcoRQfAfnlp2qLBSTFiW19ryFSHeHkq+IpmaqDmMybufj2u4YyMyNa4m
	 sQs856FSUz2IyhvsLegiBIeiwATdu1SEgtvosMb3NbTIzIvIIdC1HJdidlEZDfRNpV
	 oSKUtzlOSsEoA==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v2] selftests: net: add ruff linter exclusions
Date: Sat, 12 Sep 2026 16:39:26 -0700
Message-ID: <20260912233926.304768-1-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fedora is now shipping ruff 0.16 which added a ton of more
opinionated rules. Let's add some exclusions for checks
which are both noisy and IMO of questionable value.
We can still follow them for new code but it's a matter
of preference.

 C401: set(x for x in Y) -> {x for x in Y}

I find the set() a little more readable.

 I001: hard requirements to sort includes

A little too much

 RUF015: list(set_a - set_b)[0] -> next(iter(set_a - set_b))

list + index are more readable to a "C person" for sure.

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
v2:
 - drop the . in front of the file name
v1: https://lore.kernel.org/20260911213412.3222759-1-kuba@kernel.org

CC: shuah@kernel.org
CC: linux-kselftest@vger.kernel.org
---
 tools/testing/selftests/drivers/net/ruff.toml | 4 ++++
 tools/testing/selftests/net/ruff.toml         | 4 ++++
 2 files changed, 8 insertions(+)
 create mode 100644 tools/testing/selftests/drivers/net/ruff.toml
 create mode 100644 tools/testing/selftests/net/ruff.toml

diff --git a/tools/testing/selftests/drivers/net/ruff.toml b/tools/testing/selftests/drivers/net/ruff.toml
new file mode 100644
index 000000000000..f58d51f35317
--- /dev/null
+++ b/tools/testing/selftests/drivers/net/ruff.toml
@@ -0,0 +1,4 @@
+# NOTE: keep in sync between .../net/ and .../drivers/net/
+
+[lint]
+ignore = ["C401", "I001", "RUF015"]
diff --git a/tools/testing/selftests/net/ruff.toml b/tools/testing/selftests/net/ruff.toml
new file mode 100644
index 000000000000..f58d51f35317
--- /dev/null
+++ b/tools/testing/selftests/net/ruff.toml
@@ -0,0 +1,4 @@
+# NOTE: keep in sync between .../net/ and .../drivers/net/
+
+[lint]
+ignore = ["C401", "I001", "RUF015"]
-- 
2.55.0

