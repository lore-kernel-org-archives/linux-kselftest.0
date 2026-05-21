Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7D73DA5C6;
	Thu, 21 May 2026 14:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779374028; cv=none; b=P78HX/Jq0xQHG5V6Z5E4Lb279i5VmffmVCUoYFKCEpxxLhs7fCxiMzc1REL/vFckaxC5HhJz8wF8wQcpxaglIk/58leLA6C4vKe+iU+bC/fEqK3InaBkcDmpKSkn+oE2y4ECNx0WEGdPU8ttu1PNkjhbb8k6xaLgRoYrrfjzqOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779374028; c=relaxed/simple;
	bh=zLImAfFYBeTQ4EkEKo30JAeP4QYaGpHkek8WKQtNjGM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n9YQ4elBk4yga5/JDg0E0AtpwflOoCTu/IFNJyHT4Ghy3VRkZu9gxsJC4+zvB3rwVJKlCJhgnFN9fCSg9oUHKLAAtvaoLFdfGrUpNeReBZxcNax6FWQz8SevkFpa7xnbrekch/c6jVKyzirxokCcuBvXlfQ8PWXpmwLbxR7TLcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=Gwwj2U47; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="Gwwj2U47"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=J8IffOJp/qAmmLiO0T0WEwL08jhozAnVQTub9WB6NDI=; b=Gwwj2U47ALr+TJGRDfVpkRVsK7
	i/ipxLrLtFkLxQso4V6PEDwMO8z271HbpUmDkGAtlQic3C7qDAn8ZqGD5wDrn0wHTgduHgBJdyLWP
	GMOXRgtDuOYRa1aX6+R5gudxfV5k+P9FIZTWlW6vsEWL4dolGxsqoi6s3McOHKDh3l9BABYB0oK1y
	HIW4vOeY0mJtxBPe/6C5uk4s0b+IPkLi1TzPdyFIkRXOydjTjNuSLtJmJU539haQuQhL1DRyuTYLu
	XH5XvfcVEDrO0TIoO/3DdcR2FeMfqox+xlDeX89qjcWIVUPy9YPSbDXZ+y8lef8b0MQPRHUxe9jAY
	kbc4NaMg==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wQ4So-003wxG-2m;
	Thu, 21 May 2026 14:33:31 +0000
From: Breno Leitao <leitao@debian.org>
Date: Thu, 21 May 2026 07:32:09 -0700
Subject: [PATCH net v2 1/2] nfc: llcp: avoid userspace overflow on invalid
 optlen
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-fix_llc-v2-1-ab44cc09179c@debian.org>
References: <20260521-fix_llc-v2-0-ab44cc09179c@debian.org>
In-Reply-To: <20260521-fix_llc-v2-0-ab44cc09179c@debian.org>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, David Heidelberg <david+nfc@ixit.cz>, 
 Samuel Ortiz <sameo@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, oe-linux-nfc@lists.linux.dev, 
 Breno Leitao <leitao@debian.org>, kernel-team@meta.com
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=1331; i=leitao@debian.org;
 h=from:subject:message-id; bh=zLImAfFYBeTQ4EkEKo30JAeP4QYaGpHkek8WKQtNjGM=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqDxexdCh+05G4yTTneRwG4r2/bnJsILLri6XjN
 5ZvzTiyMtKJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCag8XsQAKCRA1o5Of/Hh3
 bYGPD/9JGuBni69qo3Ovtil2E3F2/ZTxtTp0kpAdst8qd++o81PidehfO2XJ12ekkSWuL0tax73
 /9/0Mqg/U2nvq1O3OTSpdr8o1CiOIpfYSgRRcWUvygzPyzFPdyV1igKUGfY3LWTmP7b32pGwonQ
 FC+5tXce+ghC7txKPuW5ULR/ftf3EZySIw8jTFC+BYJ55Q7dGpqP8YetpDBZyirE9vHcKDZgyPB
 JHvxPqFCI8AG/4Hy+cVD2XkBY5bSIbqBDul2rlh318Ve4PVSbHvZE6QIMjqrBSFm0vUyfnFEriF
 k6ws7/h1p6U92KLuq2Z5a6gL4r+TB0cGOUjh+y2tX3SLB/DSG9WwVosuAk2yh3ujENLDxFuoaj3
 5bSqtS+bGLJ8Bi2GFVKdQzwumoKMOHTAe0hNXdheCF+lgOkZRhbVNM80M823puCXOBtsyQU0H+C
 L3xA+g8uiph0HyJyN2kJSbB8b0OmuXufNyW0JwLO/rx+TX12umGPs09SyNAQk2mnBxG7fo4i272
 jZGYmZDTWvHzvJfQNn0dlLQ1FghggxkTaDtUJBbYcxp21OWRPpcsBFfUqzyW1FD7P/QsbDYbVhf
 qsPomsX6OQ3C+VnLEYsMD5UqZ28wuZ4Iu0fUEuZH8/YWp6RJpGJNvHcKzTjc+K40mL2WNUb/wSN
 ++IF7vIQ1lTe+mA==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

nfc_llcp_getsockopt() casts optval to (u32 __user *) for put_user(), so
the kernel always stores 4 bytes regardless of the caller-supplied
optlen. The existing min_t(u32, len, sizeof(u32)) only clamps the length
reported back to userspace; it does not constrain the store. A call with
optlen < 4 therefore writes past the user buffer, violating the
getsockopt(2) contract for all five supported optnames.

Reject any call with optlen < sizeof(u32) up front. 'len' is int, so a
plain size comparison would promote a negative optlen to size_t and slip
past the check; an explicit 'len < 0' test is added first to catch
negative values before the size compare.

Fixes: 26fd76cab2e6 ("NFC: llcp: Implement socket options")
Signed-off-by: Breno Leitao <leitao@debian.org>
---
 net/nfc/llcp_sock.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/nfc/llcp_sock.c b/net/nfc/llcp_sock.c
index f1be1e84f6653..aa9a78a671521 100644
--- a/net/nfc/llcp_sock.c
+++ b/net/nfc/llcp_sock.c
@@ -319,6 +319,12 @@ static int nfc_llcp_getsockopt(struct socket *sock, int level, int optname,
 	if (get_user(len, optlen))
 		return -EFAULT;
 
+	if (len < 0)
+		return -EINVAL;
+
+	if (len < sizeof(u32))
+		return -EINVAL;
+
 	local = llcp_sock->local;
 	if (!local)
 		return -ENODEV;

-- 
2.53.0-Meta

