Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793702521;
	b=ZaLTSLYtiFnzagD3qQFMO34fNNbcSksAg/bMaGHBtWwjwQOzaU5K/n8lC6fwRIv5QieC
	 YJtlGzVWI51pre9pBZr4FJV1A21LTiGuyukB8NPrZOCHFhyHgsb4Cr7Jsrj/me8RBpGG+
	 JpOQS5l3VwoFxZ3KgFAOEr0X2Ch5t7OFmEseft3oBsGSxmA6Jk26CYoA/QSSLQt/hlwKm
	 QMtLB2iREm+gQsUIz6juYoGd5X9CgDFgMESk65yc3LkraiYLWOWJRV3dZnaWVYincX7Ri
	 1mSA8RcyWDPzlkaS3q/3SlSv9bqakzdXXW4WdRZYkIR/UiPo9kwSaz+WTy6sP2l3Kxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793702521;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Debian-User;
	bh=wP/O8IukHJOBL3tN+2cJW0yWsYWUQ+Q8NGz6s00IHmg=;
	b=Rw7COGDyM+44e7YfrI9GW0TK8xxndnGYNHLeCoxNh5J6QLFjCTR6UEMk3VJj84mX46oE
	 HrO84WM/UW5QKNojvdCQcILh6HyOeyOBXG4H8ag2EtU4QNEdAKvDmvn2Ac8N/+E8lXu2y
	 mJvEOV0nmguc8hbyUPpdBVk8KGwP7k10AMvANvsESGmDnb53/aENLp9x9fxuTmWhdzpb5
	 fCY01JaRhzSK5Kzgm5rH3vKbHqoxUcVyUZ1f1lUlHY8X9E7w0PyObRSbcDoaOTa8Pn3VQ
	 GIqODbRnyUYSh043wwFNF9+MKwxJy4YRc3kv5Nv48hu5ha5jvLRtiFsQMI1O0kEDzbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=rTkwzoiY;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE55606A823;
	Tue,  3 Nov 2026 10:42:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BE55606A823
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=rTkwzoiY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=wP/O8IukHJOBL3tN+2cJW0yWsYWUQ+Q8NGz6s00IHmg=; b=rTkwzoiYqZlEfmzua7BVb7+Cwb
	ev03kGiWw/4fgGGuk3kUzkZzyFMbubZOySczgWYqOySzgqlk9+JzcEWX1xgby87RfCalXJcDRYQ5p
	MZ/RmZ+6hdUzBLzq1A4+5Ya78hfTer3zwfDAAzaxVKD0hwGp0XIVrmgUytmUldDmsPijjOEXVcai7
	AYVaC/vPM2khzcPEbMkvGNpFRjh6UX0TCzGz/ApbVGkCwGQL3FCmQFrKL5OpQip/KPEhz526Rv/x/
	w6IwZd6oYUAKSdgJoCV2H0TYNQpVW/knvT4L+cyiiD/5r1Bi+nlUGMm1yupFKk/C4cSnXCe2seU1f
	OpNpl/yg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xOBxn-006sNC-1D;
	Tue, 03 Nov 2026 10:41:59 +0000
From: Breno Leitao <leitao@debian.org>
Date: Tue, 03 Nov 2026 02:37:46 -0800
Subject: [PATCH net-next v4 1/5] netconsole: send the oops when oops_only
 is set
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-netcons_ratelimit-v4-1-b554c27ba27a@debian.org>
References: <20261103-netcons_ratelimit-v4-0-b554c27ba27a@debian.org>
In-Reply-To: <20261103-netcons_ratelimit-v4-0-b554c27ba27a@debian.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Shuah Khan <shuah@kernel.org>, Eric Dumazet <edumazet@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, paulmck@kernel.org, 
 gustavold@gmail.com, asantostc@gmail.com, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Breno Leitao <leitao@debian.org>, 
 kernel-team@meta.com
X-Mailer: b4 0.17-dev-ce4c1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2865; i=leitao@debian.org;
 h=from:subject:message-id; bh=u7vxqLs2/rKuvcNrK64iMGWJtslWiwS22UFEpFhL96c=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBq6bpqvm619FfG1cCtAmGdxXD4NBude3/FtjD2l
 9ZNMf7u1MmJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaum6agAKCRA1o5Of/Hh3
 balKD/4rlkZCoe7PG0nvt/ptwNv936k3w0jdZBvwXVtfmCHc0jtvde4qfuOSLwBVzsrpMFZwycL
 pllK0t3udh7c0+Ofie+ywwrMQog9fGRa3H5fSEKWMNL3zR0BfRRCCT3f5zlsZ1+DZ2KY0U0cD14
 DMjUFWXaajZmwR8Pgbd+jVstr0fty6uM5W2g/fy/xdM+Dm7IOgY69/MuPaY9wcqgO7rkz1qQxou
 /IlRK7Z14wRPLEzC95hh46ky2QGt98aHHEladL86ultcR6+1Dom1NUXRhkls0g5peH1hT0a4mnS
 nBII1WltlWW7co9vhI65ZPRc7eNMu9qqFpUi7yzJENudxQHUHbUD7M/hqxP4j5RlG/EZ9o9TUKl
 nUmf3svERu9hXDl3TwWMUNQccVKU9bjqoGzZfYHi8AQwDOqWgN+Pa5UTVuCwtQox51iHuXj/89l
 Foq69FoGdprj/eCSKay+20SkoIDYE6QgoOrt95xiMVGO4oF2B2dxTU8QBr6W3Tq57raLd40mu6b
 F4WQBUdPYF1ZVTYE4n40N+2krUQnS7hA/se86yZC82sIFh8GAUOPKeQwwdO9b2QcSOcsTe9Y6Mj
 nNX+92LZgOrB1LuRgGBAzf+gflb4l0GuXIN/lQQFQISwVDlMYNeHSrMVBQ8nOhm+M5wKavJ5NJH
 S2ydW8HsJEzZVPg==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

A target running with oops_only=1 receives nothing when the kernel
oopses, which is the one thing the option exists for. Only a panic
still gets through.

netconsole_write() bails out unless oops_in_progress is set, and that
flag is already gone by the time netconsole runs. netconsole is
CON_NBCON_ATOMIC_UNSAFE, so console_is_usable() keeps it out of the
emergency flush an oops prints in, and the records only leave the box
once the printer thread runs.

die() wakes that thread from oops_exit(), by which point
bust_spinlocks(0) has cleared oops_in_progress again. TAINT_DIE is set
in between, so test that as well, behind a helper.

With oops_only=1 on a netdevsim target, an lkdtm EXCEPTION produces 44
lines of oops. The receiver gets none of them before this change and
all of them after it, while ordinary messages stay suppressed.

The taint never clears, so from the first oops on, an oops_only target
sends everything instead of going quiet again. Sending the aftermath of
a crash beats sending nothing.

Fixes: 7eab73b18630 ("netconsole: convert to NBCON console infrastructure")
Reviewed-by: Gustavo Luiz Duarte <gustavold@gmail.com>
Signed-off-by: Breno Leitao <leitao@debian.org>
---
 drivers/net/netconsole.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/net/netconsole.c b/drivers/net/netconsole.c
index 267254f046de9a..6637b4a16b6c98 100644
--- a/drivers/net/netconsole.c
+++ b/drivers/net/netconsole.c
@@ -83,7 +83,8 @@ MODULE_PARM_DESC(netconsole, " netconsole=[src-port]@[src-ip]/[dev],[tgt-port]@<
 
 static bool oops_only;
 module_param(oops_only, bool, 0600);
-MODULE_PARM_DESC(oops_only, "Only log oops messages");
+MODULE_PARM_DESC(oops_only,
+		 "Only log oops messages, everything once the kernel died");
 
 #define NETCONSOLE_PARAM_TARGET_PREFIX "cmdline"
 
@@ -96,6 +97,17 @@ static int __init option_setup(char *opt)
 __setup("netconsole=", option_setup);
 #endif	/* MODULE */
 
+/* The kernel is dying, or has died.
+ *
+ * oops_in_progress only spans the printing of the crash. netconsole is
+ * CON_NBCON_ATOMIC_UNSAFE, so the records reach the target later, from the
+ * printer thread, with the flag already cleared. TAINT_DIE outlives it.
+ */
+static bool netconsole_kernel_dying(void)
+{
+	return oops_in_progress || test_taint(TAINT_DIE);
+}
+
 /* Linked list of all configured targets */
 static LIST_HEAD(target_list);
 /* target_cleanup_list is used to track targets that need to be cleaned outside
@@ -2480,7 +2492,7 @@ static void netconsole_write(struct nbcon_write_context *wctxt, bool extended)
 {
 	struct netconsole_target *nt;
 
-	if (oops_only && !oops_in_progress)
+	if (oops_only && !netconsole_kernel_dying())
 		return;
 
 	list_for_each_entry(nt, &target_list, list) {

-- 
2.53.0-Meta

