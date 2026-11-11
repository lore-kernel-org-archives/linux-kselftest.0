Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794423327;
	b=et9mUsw5yH34Af2Q25Dqu+fBdL7tPae3tWr1WvlJXVsi8tOKyTI/l3DpW/ieoR2eIz3e
	 9c68N+tnO0aZCblqXFvBwVOkcDTmuQyHC666p+ieRjc0FxrHWgHLPpKP62PPIlZHD6nWW
	 zFMCUdTxNCQ0QWYf0d15B5L9FCgzoGYG6bPEiqCqETwDquYXjax8WoCA4AclHP+VVIbkK
	 1La0+NrNOt48Rge8ifQ85YnLjM+JiMTnrhvavoLUpixfpHR2jLRvNc3d71meWvmz+RfGy
	 xC2iayfV6bIvz950xlyC2Z2e+N13zlvmWhR+Aa/7tDFLAhsii4UMAcjbS7GuQDx3SzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794423327;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qig7zK5G4rY7nROTnpAyjhr/qzwfbHkIlR+Z5KlVVbI=;
	b=wix+yzujRK3To3awNT46f4oqxCc6VJLaMTQq9yBMuc8gzZ4CR2QB9GmNft8AQTG/HByq
	 64PfK48LnsDJ8+ff+PnjTD5fXIzSn4LbDt0GQQ6du2nZ957y25gpLcDbOdoReSznZ3Hth
	 s03TXdtfsD8TWQJkgwfwAdM2ei763Oy9YwhqrZQYu6saQHkdqwbfgUKwRBSO3xHbzqGth
	 wnofMcqYnhlutX91BN/horxvVgeOr1P3nofA+8JyBRBtDkCApIY7DwwcHibBFWIKX5emo
	 gGTHlB/mLXX3GGi8shgOJdO7QPE2xocD7m9+lFcFA5sZ/TdAib3qwH6rfYETVghFM+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bd6JaS54;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A096D606A321;
	Wed, 11 Nov 2026 18:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bd6JaS54
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20FCF1F00A05;
	Wed, 11 Nov 2026 18:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794423327;
	bh=qig7zK5G4rY7nROTnpAyjhr/qzwfbHkIlR+Z5KlVVbI=;
	h=From:To:Cc:Subject:Date;
	b=Bd6JaS54Mh/iGL3sTMQSsn/xOGsAb/MNk1lpGxDA3rc6Re87t+XSkhIsH1q/lGORk
	 7dSRFPOoS9tNJVasSqxSGirma3MNd6smr1xt8KMg81wQ27tXLyeifOYFBGMZEGmgxx
	 YdXmerc/y9N9bidOJvNSeYh8plMlYr+uN5notCdsGDBJf54WHS7zy/5+UCykZIRgaD
	 BZThCgwEU0N3mS2W/8M+aUwD2IhWpSKSWfscaawiSTHLFCyPuC3PW+BjBlUsARQRWJ
	 62bfHUXnnWBpD1D8fr2dqqhN9h0yQHs/rKDjoitESzKgZkg/bSafFNVsa6YMMBRJZ2
	 c3we5ZRAAz2pA==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	sd@queasysnail.net,
	john.fastabend@gmail.com,
	shuah@kernel.org,
	cel@kernel.org,
	linux-kselftest@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net v2 0/5] net: tls: break the connection after a burst of empty data records
Date: Wed, 11 Nov 2026 10:55:17 -0800
Message-ID: <20261111185522.2859004-1-kuba@kernel.org>
X-Mailer: git-send-email 2.56.0
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

Deal with overload of zero-length TLS records. This is the next iteration
of Chuck's series. I tried to make it as simple as possible - break the
connection if sender floods us with zero-length records. Consume / discard
those records even on PEEK to avoid infinite rx_list growth.

https://lore.kernel.org/20261019-tls-follow-on-v6-0-ab01c4ecca0c@kernel.org

v2:
 - add missing poll() back to the selftests
v1: https://lore.kernel.org/20261109175836.1246840-1-kuba@kernel.org

Chuck Lever (3):
  tls: Consume empty data records in tls_sw_splice_read()
  selftests: tls: Skip the zero_len tests when TLS is unavailable
  selftests: tls: Extend coverage for zero-length records

Jakub Kicinski (2):
  tls: Break the connection after a burst of empty data records
  selftests: tls: Cover the cap on consecutive empty records

 include/net/tls.h                 |   1 +
 net/tls/tls_sw.c                  |  77 +++++--
 tools/testing/selftests/net/tls.c | 353 ++++++++++++++++++++++++++++--
 3 files changed, 390 insertions(+), 41 deletions(-)

-- 
2.56.0

