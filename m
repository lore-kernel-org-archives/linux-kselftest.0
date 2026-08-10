Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F396F309EF9;
	Mon, 10 Aug 2026 09:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786354607; cv=none; b=EPUgWnNznHTFDBQUP0Cx6+t/F567ZJWt4Pkr1Vvqiwuvv/aFA/mY8lbXt0f7U8RGUoUdJhrjaEJeHxEGWsiEZUbIlChzM5tYpAwm1/S+X9YrxTBXZdrqPWBl8m5ja2cyszjh6i0MJJ7ydQdpBpZZSqmAfirnPuG4VksgA0zqFwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786354607; c=relaxed/simple;
	bh=jdspwZumav1yXK1sUrJh9/CLE5BO7OSnhSbssp13uow=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YliCDlAri9n2W9lHijcUB84ob6aPAATFIIncL0qdcU00ZV+GTdgspPLQtchyKsOBSH3Sg3zgitKmnHOtv1azeQ4tcZu57V3yeJfeQxK9X5hYqrAk+xMX6HIbNSur+PueZlAOyFNikkoypZGT0l5dbLIIC8KTjK9g5pnF5J4ceRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=tHFfPzGr; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="tHFfPzGr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=3MMx2Nj1LHm+N7x0Q7bxqkThPJ17IHrHyJH8o1UQPnM=; b=tHFfPzGrVkbM7K/ZhM8qNAfSbb
	snQzlvUF9C/hqVLelFNqFQqUqPl0g6SJyFKu04TEfmYoaEXdqX+62qz2y13aa4YJmsq7fKs5dFkjr
	8my7gwA+z3uqmuZq8xAix6kAyDgDgfHEMMoDcVJhflwFSva/k9DqIQmWN7mqlvDtZIzcjJGxhoMyv
	xBNrkBSghJGWOKJCNt8me8+g0sOtIOUi7aIkGMxgsWzqQ/m8zQpRiiR7vLaslcS7TWTtE3HpwqhmZ
	P/FjtH5mek2dqo7ei1jpbXzS2Joqbxo0MSTyCGYeKXcbb5mJd4gbJAd6VAD6a1mywtHrhSi4qe5zh
	qng2Zp/g==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wtMQx-002ejb-2c;
	Mon, 10 Aug 2026 09:36:41 +0000
From: Breno Leitao <leitao@debian.org>
Subject: [PATCH net-next v3 0/2] netconsole: replace target_list_lock by
 RCU on userdata hot path
Date: Mon, 10 Aug 2026 02:36:10 -0700
Message-Id: <20260810-netcons-userdata-rcu-v3-0-f65557f769ce@debian.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIqbeWoC/3XOwQ6CMAyA4VdZeqZmGzAIJ9/DeBijwDwMs40FQ
 3h3A3rQRM9tv78rBPKWAjRsBU/JBjs5aFieMTCjdgOh7aBhILlUvOYCHUUzuYBzIN/pqNGbGQt
 eFIq4qPtaQcbg7qm3y8FewFFER0uE62sS5vZGJu7qvjvaECf/OD5I4rh4x/LfsSSQo6CSVKtkW
 5XduaPWanea/HA0kvxUyj+KRI6mpJr3Sle6UF/Ktm1PZZI3/hsBAAA=
X-Change-ID: 20260801-netcons-userdata-rcu-40446e018f86
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, gustavold@gmail.com, asantostc@gmail.com, 
 Breno Leitao <leitao@debian.org>, kernel-team@meta.com
X-Mailer: b4 0.16-dev-f8e9d
X-Developer-Signature: v=1; a=openpgp-sha256; l=1822; i=leitao@debian.org;
 h=from:subject:message-id; bh=jdspwZumav1yXK1sUrJh9/CLE5BO7OSnhSbssp13uow=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqeZujd5Y8KWXWB+0+01x8hXzDkwIGFHNPBoiDJ
 29n8dYe0wOJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCanmbowAKCRA1o5Of/Hh3
 bRrvD/9Tp1pM9SpxgwMiwbWN031Dq6a0I/gCuwBs3+P9lwkiWLoJ8Puf9RlSQrA4dsZGVzPpkLY
 xXoVysJAwImrn8b3YzyJY7TO7rTNmJIFWWv2iIF2pQCUrzt03kj4Xt/5O/3qEYyBn5NzdCz613S
 yFAHTBatiI1MoZLHJGJtwxTq/q4BHxkAbW1bh6t1RLA8mkn8fdecpYbvlPFTZk3LN+7aS1cIRot
 GUF7/et3B3NcFJ8XJnCBDRTUnAlkmWqHN23QR5dP4nO8VJ7esB4YNBbK/URD17YUrOD9xXGrHaS
 fgX+izci5DmQc7waWd2sSOpAXw/j1S5FKTsQwgBMQuJO5n0vntMf83QIkpGh1MTAio4yr88GnFK
 Zsr03sLe2YUuwW6V3nwbLk9DSBEubL7+t4qNnJWs/+mZquD3KZDFsbBGsYSP7y8muT/2gI4vo3L
 sGvM9mOzk59J63pu+iBzg+eqRGrz0AhiKoW9HnXpwE3PsxYcYA8CsghoAzfKcssfNLVzmBkzp1d
 SHr0Q6bKAx6KYdPihfqvvFNGFOXWrEmAnyKTX8f1o+e+Zre71/OH6CCBCKNiSixqpCS7VCthwIb
 vrsVoDyI2nlKuYPXsC/W+1psrpIxam9p9zkvrCv414EfBvY4tU1+DO0clfXT+TJjspyXEJZF8Om
 TIqPupS9g0MS5Tg==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

I would like to move netconsole to use RCU on the hot path for
a while instead of target_list_lock. My goal is to have no lock on the
tx side at all and eventually drop CON_NBCON_ATOMIC_UNSAFE, if that is
possible [1].

Start removing target_list_lock on certain parts of the code. This patch
transforms the userdata array into a RCU-protected pointer, and uses the
dynamic mutex as the write lock.

Added a selftest, given we didn't have any netconsole selftest for
userdata operations. Feel free to drop it if this is not useful, dear
maintainers.

Link: https://lore.kernel.org/all/20251121-nbcon-v1-0-503d17b2b4af@debian.org/[1]

Signed-off-by: Breno Leitao <leitao@debian.org>
---
Changes in v3:
- Rebased on top of net-next
- Link to v2: https://patch.msgid.link/20260805-netcons-userdata-rcu-v2-0-c5e80f6a7a46@debian.org

Changes in v2:
- netconsole: free the payload with kfree(rcu_access_pointer()) in the
  teardown paths, silencing a sparse __rcu warning (Gustavo Luiz Duarte)
- selftest: reap every torture worker before reporting a failure, so
  none is left writing to configfs while the exit trap runs
- Link to v1: https://patch.msgid.link/20260803-netcons-userdata-rcu-v1-0-1e5e6b62b75d@debian.org

---
Breno Leitao (2):
      netconsole: publish the userdata payload with RCU
      selftests: netconsole: add a userdata torture test

 drivers/net/netconsole.c                           |  92 +++++----
 .../selftests/drivers/net/netconsole/Makefile      |   1 +
 .../drivers/net/netconsole/netcons_userdata.sh     | 229 +++++++++++++++++++++
 3 files changed, 286 insertions(+), 36 deletions(-)
---
base-commit: 001b5d347d8ba39b2dccaefcc57967b18caec8fe
change-id: 20260801-netcons-userdata-rcu-40446e018f86

Best regards,
--  
Breno Leitao <leitao@debian.org>

