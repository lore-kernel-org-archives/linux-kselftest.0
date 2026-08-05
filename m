Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC5D409624;
	Wed,  5 Aug 2026 10:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785927555; cv=none; b=V9v12sgkuYUwg13PqPQFXI0i2ya+ODFtPzPAx52DfnntHtW4qtGYLkbpmTE2589heo3QowkAEYPcRJSyERquhcBAytCQki61yTAGSsvhq+YP4Z/fl6CrYfSqe4h99CJ0GLwIqPjqkHtgdMvGDMieKOqx7sQmi7jnrfVJbVjCqQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785927555; c=relaxed/simple;
	bh=um/MXfsQZtuKwRU0PYiiIWXn5S8n5EWuTDYQ0idtgLI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pkeoCn8RdRlQLiQ0Yey+avTOk8Z4uCSak0MJYihPGrKYcmPK1lCKb3qqz1BwTdJupx7yeRZy0uf+KUCBUEt3uCwGA4id7N17xyoewWNaltssok72soZGyVdVpPD3MOb8ntdnOfZAXLTZqju2dV6OGBadojZXhoQqsQmVxOSOJHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=EfUNSMH+; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="EfUNSMH+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=DzNpmQRW/b2c9JEntRyp4ieP0aY7Ggrz9evTHtK5mxM=; b=EfUNSMH+YjeZ6o+gw8+ZzWQ76a
	JMB6kIxxkjO00nZOb8XJ00/0FeaS3p5mv0ZfZAfAPVoB0an1muedolQj2pOuwXm99l6Dpv1His7uD
	1cVXLo+AOYRPlQmRzaXBTYXOkLegUi4NWgfBDyQQR+awNWosppMwrRxQZ8rWXPFLs2YMbjWdT8cGo
	yZ8NfNwi4vVp3O/+/OQztCLZ6kGzh6oizRb52kogh0VkMBZr2tAEjeuOEf6YD7OLv3I/sw0XeG1Jx
	U5kOG1MSt8qoectKK/eYymbcY8C8BEZqoz87pU2gFANpNir94lankCIptuILmTDMT/s/Gxu6q4qRP
	vVavJdTA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wrZKx-00Drzp-1i;
	Wed, 05 Aug 2026 10:59:04 +0000
From: Breno Leitao <leitao@debian.org>
Subject: [PATCH net-next v2 0/2] netconsole: replace target_list_lock by
 RCU on userdata hot path
Date: Wed, 05 Aug 2026 03:58:18 -0700
Message-Id: <20260805-netcons-userdata-rcu-v2-0-c5e80f6a7a46@debian.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEoXc2oC/22OOw6DMBBEr2JtzUa2Aw6iyj0iCn8WcAo7sg0iQ
 tw9gqRMPTPvzQaZkqcMHdsg0eKzjwE6JisGdtJhJPQOOgaSS8VbLjBQsTFknDMlp4vGZGeseV0
 r4qIdWgUVg1eiwa8n9gGBCgZaC/TfJM/mSbYc1KM7+Vxiep8PFnEufrLrf9kikKOghpRR0twad
 3dkvA6XmEbo933/AO4c+ZbVAAAA
X-Change-ID: 20260801-netcons-userdata-rcu-40446e018f86
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, gustavold@gmail.com, asantostc@gmail.com, 
 Breno Leitao <leitao@debian.org>, kernel-team@meta.com
X-Mailer: b4 0.16-dev-f8e9d
X-Developer-Signature: v=1; a=openpgp-sha256; l=1675; i=leitao@debian.org;
 h=from:subject:message-id; bh=um/MXfsQZtuKwRU0PYiiIWXn5S8n5EWuTDYQ0idtgLI=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqcxdyfDcomBKT/a/9l5MxMbbkN3MHJNW4dbtTl
 YH9mZhK7c+JAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCanMXcgAKCRA1o5Of/Hh3
 bc95EACi1YJsQeQt55KIl7OLXLNNGPGt5He8CmOehEsPQT2qXUtLSSGdkRBx/saphmiGFLVgFkm
 UvkOM2smY2WIUZK7TfgPR58P9+2YW4NWPVoB58DOFeT8yY2ndV741jojfUKzBEGMlU8KGUxXSzQ
 0RtN4tLyYjOlgSxQpcKho3Ck6F9WIue9ef4SHF/TanYQM1k9q4vAS7qqKgcW2SigkbW3KNevyhH
 YUgsqt9HLxv0AbDGTJ3pe3wrpxtiufPKsOROVL9jOhtHi70nLdbidm2lIZFvZ5M+cjOkgWq8S7g
 yKn4nydbZRtETAeWnOJl9opMSUhtIVs3B0ehavs1m2FJYnl4Zp8PUM8Lwhs0OR+vKA1HXlod8ji
 ccw+CSYpgftomwvQE7ilkGstipp1NvFyaJ7bZErhVObE0sEuadheC9gFAPVDK2Se7lMnfPxHVTc
 ZBEMCxAj5nLoKg/VeVvCT0CAaP0VWxTX8yLj2+fu+7NnH0X9vwyZ7qhBj327LCGPfSGKUYtugNL
 9pV/X1xpsevs5/SBzPipjkF4INBNhJiyIrgZok/1ngp1TFwdGkjcvAsUrmtrQdvN+lFvkOlmXsq
 xjcXqhfxpC3CYheMJ2mpRmTNV0aLdjH+D+62ISYQa/m6HOfVytYHkWc8gI5NsMZWHoCaLP63CRO
 QDutDPzb93A/vGQ==
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
base-commit: 8ba098e6b6ff0db8edf28528d1552be261af30d4
change-id: 20260801-netcons-userdata-rcu-40446e018f86

Best regards,
--  
Breno Leitao <leitao@debian.org>

