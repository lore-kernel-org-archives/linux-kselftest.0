Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD45B3BCD17;
	Mon,  3 Aug 2026 11:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785756623; cv=none; b=BVQTzrRKqOxfgRlU6HpOoGHhsnLDHg+SB4uylIShaoMX+G5T4f6FsD5gwajjiWGO/asZEdRXTZdCD/oQtCKGz+Go8CBuCp+mh6dL6ECojSbis6GQLOomMt0P1AE96V3+iey3Cwe+YExbuw7UkRA+RjTEqSiHBjEO8+YopAs4310=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785756623; c=relaxed/simple;
	bh=1hyD7n6x4B5WKNhx81QFig7jm9LpnsZfhzBuH5E/qz8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aBD8weH73NuqbXPtqgr803TL3RVFvn34TwE09++m0OIpHcholBBYDKrz32e8mKXI40IrIg4G7zzKMd+DSPgod5EZtUvBVEsMxJIKlAlX8ere/Sur3hnTN3atQIWLx9D1YyY7GhR19dvp8/Xjb9oB12r7jl2tijHISHhKuxHwggo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=UcvWIu2t; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="UcvWIu2t"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=pezhe/jGLbZ8Imse26s/T+5MBjNkk8ZspZsG2MuLj6E=; b=UcvWIu2tdi/bvIcOpVieWLMPrB
	Kvjf0LpacF+oR1zHl3aW619PaGLNNpalnqQfTBRBrHgOzLPDWoEDhNnm0sSGrahclJ+/ZtIoeypN8
	wxJeYn2EfxMRNIvqE5sv5pS1oSdfD/wyJha2OEsyX93tqoc9rX78cwNkAxrGBEOptNbEqeG4zfUpC
	lwCWv859219mFHWmfwAZnBMqKH3S8SAhEmsB9sAwd0ORHCjdtDkX0OjqvgHRfHaHh7BK6rKjz91ZE
	NpXpB0E5yzyNTp6ICkTBBfyURIZEERe6zd63Gk3rmOB17j0fWNg3Elji2JGncreF8Ms+fNF2Q02bV
	lCZwnpww==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wqqs0-00CKNb-0d;
	Mon, 03 Aug 2026 11:30:12 +0000
From: Breno Leitao <leitao@debian.org>
Subject: [PATCH net-next 0/2] netconsole: replace target_list_lock by RCU
 on userdata hot path
Date: Mon, 03 Aug 2026 04:30:02 -0700
Message-Id: <20260803-netcons-userdata-rcu-v1-0-1e5e6b62b75d@debian.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALp7cGoC/yXMQQrDIBAF0KvIX2dAg4h4ldKFNZPWLibF0RIIu
 Xtpu37wDii3yopkDjR+V62bIBk3GZRHljtTXZAMZjsHG60j4V42URrKbck9UyuDvPU+sHVxjQG
 TwavxWvdfe4FwJ+G94/oXHbcnl/5dcZ4fXvxpyYIAAAA=
X-Change-ID: 20260801-netcons-userdata-rcu-40446e018f86
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, gustavold@gmail.com, asantostc@gmail.com, 
 Breno Leitao <leitao@debian.org>, kernel-team@meta.com
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=1271; i=leitao@debian.org;
 h=from:subject:message-id; bh=1hyD7n6x4B5WKNhx81QFig7jm9LpnsZfhzBuH5E/qz8=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqcHvAsd/OzvBdwyNWj98MK8TCPU99ZDrfG/Tb3
 e6h1S3d6/CJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCanB7wAAKCRA1o5Of/Hh3
 bSYwD/wPDlv7Im7UfY19uBeKqNDFFa+ILjlig/Z8kJFmFcCC+0iuLisAeh6AurnZF46LF693m+f
 KAeVULp2ZNlqLfzltTJ+1EDBPfM16oaTmLN/RTWq8sEKgasE7Ck4zMR3BW2pDcBJ/iXi8qN9EX6
 yhMHgqTYwIEEUnkqZ6hvuQFkmQBKNmOE+GwHVXrMCJoREJYkb+xeQ+cjIi4vg7wg1OWG5tNor4h
 weZeGmSAwL5caUu1jpA7lZi6CfFjc9f9CKJUvZTXhdUxCpGjpoRY5rGsVQKi18XR+6P4SWRts43
 ARg2XLzkjkHd6Tjqe1Va+jq1I6v25YA7arDvoNaLLzGrmOOcncstVoUidRf4cO8lNmobkw66D7M
 Dthnzvdtm8ua11SgKUl2okE8U120GFoOyVb1E8/HYZHPG+wrX3MIQ4+eKYRPdlRggK8w/8ltxXB
 pjL9RIRsU1FSCZG14SQi9QPmMsRWPsXq7UW2FFMRF3dQ/m+KCrfb3lPHvr+8OIykTfkRJYecon+
 y1SzZEB8asCEOkTOexTHlG9wzR/cNA4XRE0olo39EbR2a2Xvmd/T0zLnrplaUKecQQzoHhUfXx5
 BUsyAi2lcN++PjzH5itGl7QsZZIUChePADfVwwvVWwtRNPP3ctW/MEP1oVQ+UHXI8mThNGNnyEG
 xlb1Z4z7c1ljZXQ==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

I would like to move netconsole to use RCU on the hot path for
a while instead of target_list_lock. My goal is to have no lock on the
tx side at all and eventually drop CON_NBCON_ATOMIC_UNSAFE, if that is
possible [1].

Start removing target_list_lock on certain parts of the code. This patch
transform the userdata array into a RCU-protected pointer, and use the
dynamic mutex as the write lock.

Added a selftest, given we didn't have any netconsole selftest for
userdata operations. Feel free to drop it if this is not user, dear
maintainers.

Link: https://lore.kernel.org/all/20251121-nbcon-v1-0-503d17b2b4af@debian.org/[1]

Signed-off-by: Breno Leitao <leitao@debian.org>
---
Breno Leitao (2):
      netconsole: publish the userdata payload with RCU
      selftests: netconsole: add a userdata torture test

 drivers/net/netconsole.c                           |  88 ++++----
 .../selftests/drivers/net/netconsole/Makefile      |   1 +
 .../drivers/net/netconsole/netcons_userdata.sh     | 224 +++++++++++++++++++++
 3 files changed, 279 insertions(+), 34 deletions(-)
---
base-commit: 8ba098e6b6ff0db8edf28528d1552be261af30d4
change-id: 20260801-netcons-userdata-rcu-40446e018f86

Best regards,
--  
Breno Leitao <leitao@debian.org>

