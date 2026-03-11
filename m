Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C330636EA82;
	Wed, 11 Mar 2026 03:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773199725; cv=none; b=DS+vkKWjdD2zavM0igKn/cDb2SJyYDdsKUKCsHSqhvO2pgm6cElmWrAFQHJkyonxFD4EmsyaYlSOmPnjN5bPmdZyJv1ec82xLAY6n0GMdiG1rj/dHt/smOHQekvalPhpkAWYO2v9aIRrwXtAbva8WleiLd7CIc3RwyasswJznmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773199725; c=relaxed/simple;
	bh=OmhVf43whsEL20cdvEpr36oI9gerGwAlaUVQ+BqWD38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=br2H6gO0grFSbN2ELZ6IO/xtBImxmupkXfdj8KJeecqaIN64J2TH8UBP7suNCh/NkBk49E9CjnU/+Kjw3HpkNEavKeIySxJydu+Sxddcttc1AWGWo4As5dVzcC7koJ06SHpXJ6VlLEp4pNmuMunxHDf38n7ykbUQFlIisDV/MX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YdD1Z+4P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YdD1Z+4P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DAE1C2BCB4;
	Wed, 11 Mar 2026 03:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773199725;
	bh=OmhVf43whsEL20cdvEpr36oI9gerGwAlaUVQ+BqWD38=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YdD1Z+4PMJhMUpPADdOBkUnfR1xt0J1MeO9p0H42x4tfuhNCmkv/fVZXVGi0LtCYm
	 ymq3A3DieVhLc4KEMzZBc5AeFehZeQxg4x/UPMBHAvfWsqj90qw2AGhW5xb49mLpQ2
	 hbbe9GRWQuxvtS99so7hJJIaZqczgHwRRdOBMmC+BIRBv8lvnlEknSZMf22AciiyVH
	 gkMwmBq4qoZ7m8bYNY5G0IYON8DRMTCxhR7cRkqS4Wn4JMfiAOWyXWP6Q9lQRzOB9P
	 A3iEP7X3numke6O91DzVmmeIlOUCBuCMQS+WtsL+daL7ENt/8NmbLKtooqurrZ4RQs
	 TZbsd9dT8zE0w==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	kees@kernel.org,
	alok.a.tiwari@oracle.com
Subject: [PATCH net-next v2 2/4] genetlink: apply reject policy for split ops on the dispatch path
Date: Tue, 10 Mar 2026 20:28:37 -0700
Message-ID: <20260311032839.417748-3-kuba@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260311032839.417748-1-kuba@kernel.org>
References: <20260311032839.417748-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 4fa86555d1cd ("genetlink: piggy back on resv_op to default to
a reject policy") added genl_policy_reject_all to ensure that ops
without an explicit policy reject all attributes rather than silently
accepting them. This change was applied to net.

When split ops were later introduced in net-next in
commit b8fd60c36a44 ("genetlink: allow families to use split ops directly"),
genl_op_fill_in_reject_policy_split() was added and called from
genl_op_from_split() (used for policy dumping and registration).
However, genl_get_cmd_split(), which is called for incoming messages,
copies split_ops entries as-is without applying the reject policy.
This means that split ops without policy accept all inputs.

This looks like an omission / mistake made when splitting the changes
between net and net-next. Let's try to re-introduce the checking.
Not considering this a fix given the regression potential.
If anyone reports issues we should probably fill in fake policies
for specific ops rather than reverting this.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
CC: kees@kernel.org
CC: alok.a.tiwari@oracle.com
---
 net/netlink/genetlink.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/netlink/genetlink.c b/net/netlink/genetlink.c
index c00f0586c8d6..d251d894afd4 100644
--- a/net/netlink/genetlink.c
+++ b/net/netlink/genetlink.c
@@ -244,6 +244,7 @@ genl_get_cmd_split(u32 cmd, u8 flag, const struct genl_family *family,
 		if (family->split_ops[i].cmd == cmd &&
 		    family->split_ops[i].flags & flag) {
 			*op = family->split_ops[i];
+			genl_op_fill_in_reject_policy_split(family, op);
 			return 0;
 		}
 
-- 
2.53.0

