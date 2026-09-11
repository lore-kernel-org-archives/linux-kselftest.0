Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F2A443E54;
	Fri, 11 Sep 2026 21:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789162455; cv=none; b=qJhPrSdXTXYUaHWZoHVnYZmvl0QA/Mo9cPVYhfq2TeoyXQS2udPdUGmTGvO+n8pnB9Rk3B5+Xe/mKp47gD6UXRIhBtJn9tBcWWckwp19RKBUB9ywkxOJQMnY7JpjUrj2ZY/1RP9KMK+rpB8k+EmRtzMBDQ16PEmSmWx4xdy1PYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789162455; c=relaxed/simple;
	bh=A8teqdywnZczODk1GoZwbGV1p7z3VpZRNGCCpAX6raA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=scbBRVa7i2ZJkAcEOgdIozGrTetX2aUp7S01K6OU1ewGKDcZuZ85x7Wa5nQ3ngJCBt93mTIHiRCUOhOuk2fwxpi8m9eajkbahp8mnaFAujCFnYz1FcX7/om+4ZDVvo9jPRUl50QkiFa4aeesIH+J61gJDJW/NhE291fDuhJ1bxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xii2vz2i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xii2vz2i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01FA51F000FF;
	Fri, 11 Sep 2026 21:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789162454;
	bh=2/L84MEwKU2vMkz4KHPAw2TqPkb8DT8AUIvjC49+OLg=;
	h=From:To:Cc:Subject:Date;
	b=Xii2vz2ig9qoOcmdNXkLs3khiAKwt8hjLOlsJH2A7elddvR4LcFc7Cs+Ho985/L9+
	 teyFUP4PKzSRVnDGl1p2PoqH+k8VSGsYZs/QnTTiy6iBgQqypMVKYtmRSv4/qSlxVb
	 5hpB8h3yp5ONy/b+C71ppBNW+cLPgmMq3AFCddCe2b+/i2vCpsqp++UAmULQGrnCMd
	 rMJ9LudDWUhk/U026HXJ8Yn+fYJrTovab+qcLOkkq7zaBgpEBCgMpQg0Q2XiROB7h8
	 ouingOFMIieM/b43z6njdZVVw8DTv397+lgBWPljz+1p1NT3f1mn4f1zYPsMaZ0p3d
	 oQ/cv/UMwcnlg==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next] selftests: net: add ruff linter exclusions
Date: Fri, 11 Sep 2026 14:34:12 -0700
Message-ID: <20260911213412.3222759-1-kuba@kernel.org>
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

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
CC: shuah@kernel.org
CC: linux-kselftest@vger.kernel.org
---
 tools/testing/selftests/drivers/net/.ruff.toml | 4 ++++
 tools/testing/selftests/net/.ruff.toml         | 4 ++++
 2 files changed, 8 insertions(+)
 create mode 100644 tools/testing/selftests/drivers/net/.ruff.toml
 create mode 100644 tools/testing/selftests/net/.ruff.toml

diff --git a/tools/testing/selftests/drivers/net/.ruff.toml b/tools/testing/selftests/drivers/net/.ruff.toml
new file mode 100644
index 000000000000..f58d51f35317
--- /dev/null
+++ b/tools/testing/selftests/drivers/net/.ruff.toml
@@ -0,0 +1,4 @@
+# NOTE: keep in sync between .../net/ and .../drivers/net/
+
+[lint]
+ignore = ["C401", "I001", "RUF015"]
diff --git a/tools/testing/selftests/net/.ruff.toml b/tools/testing/selftests/net/.ruff.toml
new file mode 100644
index 000000000000..f58d51f35317
--- /dev/null
+++ b/tools/testing/selftests/net/.ruff.toml
@@ -0,0 +1,4 @@
+# NOTE: keep in sync between .../net/ and .../drivers/net/
+
+[lint]
+ignore = ["C401", "I001", "RUF015"]
-- 
2.55.0

