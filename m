Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D92635DA79;
	Mon, 14 Sep 2026 12:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789387840; cv=none; b=BC/z+nf46Sf9tb86yiK3KH9Jr9tb+efqjYmrUN9d70Qdt9UKdzV6zR0pdVDfZuvoaa6ayF5GKGa9eOR3Atb/vmKecvXD+URpTd4lw373ebnJKYpR7aqeSwGjtjaMs7bTrFQ9zTAci6EK+MW0zDq3rwHj3dJSl/UpGdsWczbSBp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789387840; c=relaxed/simple;
	bh=F1mp269SJrZ9Pvz2cWbJ0FKS4STF7zDk96eGRxgxnrY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EDIF2m6CrXdrr1i+rnX5T8+uR+2b+3JY3P37gjCyzxKUFU4c/xK7qC9mpamMRQNeYUcsZL7mQHrr2N27IJLA1bkGQXE3zqtpau5Ykiib3FEel5cio069W+hZxhGKeGuJ0EcXZNtdhyt6FsiO7Ge/a4LucQvw3m54Jv/eRyi9jYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=tJ3Jkwnt; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="tJ3Jkwnt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=mZu/Vs5nOQG7irnIZ5aI4mnkQoQp5lbpNJctZOHfslc=; b=tJ3JkwntiFYK6DWmvACoCteIuO
	x0xBT1R1VCVqe6fAsFwr9S+Os9ReN4udNHvFJg/vefrRUNM1LzhRM4PnPeQC70jAi32HBcsScF5vV
	8NloT92J4TgJh2/SrYQmUee+1HsIoBznAfuIC4OltQVUnSUPoAeYYQrbJgg47yoM9W2fUhCPzuqL9
	DgbV38UpTgWzx5ZgakgFBVr8bZ2JO/fpXjD2eQeH8UtcGsDFkLlv5U/DpOlGSbun9RZ7f3CKf1tLW
	sCuTbfHzktQOF4167gc4CB6FvpI9nYFPLn3iMfWyO8kDMtyo29IexqwBv9QZq0EnWD1ivXuownh+y
	qsTUKKGg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1x65W8-003bYq-0k;
	Mon, 14 Sep 2026 12:10:36 +0000
From: Breno Leitao <leitao@debian.org>
Date: Mon, 14 Sep 2026 05:09:51 -0700
Subject: [PATCH net-next v3 1/5] netconsole: send the oops when oops_only
 is set
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-netcons_ratelimit-v3-1-8e81b789ab37@debian.org>
References: <20260914-netcons_ratelimit-v3-0-8e81b789ab37@debian.org>
In-Reply-To: <20260914-netcons_ratelimit-v3-0-8e81b789ab37@debian.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, paulmck@kernel.org, 
 gustavold@gmail.com, asantostc@gmail.com, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Breno Leitao <leitao@debian.org>, 
 kernel-team@meta.com
X-Mailer: b4 0.16-dev-f8e9d
X-Developer-Signature: v=1; a=openpgp-sha256; l=2809; i=leitao@debian.org;
 h=from:subject:message-id; bh=F1mp269SJrZ9Pvz2cWbJ0FKS4STF7zDk96eGRxgxnrY=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqp+Qxup9S5bWbD7lHUgfQFCPZDlDcmeyK7qufo
 VdqUxbP86GJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaqfkMQAKCRA1o5Of/Hh3
 bWq0D/wJBOePDkhusz+9f+T76E90flKTzGSNyRgmzJvCBCyYuQuBzRy2Nj1ErNZT8dItZlZBVUB
 yJtEuiNm9GAdFHfLP2ghsTqrztMHV+Do1P+U8sKSHaM9Ir0cHvA2drhAZT8gcbXljnPNjR6P5HJ
 N22QWIVS/FWKGNaPaGN4jh2YIp+q33WuYjhp0I980kU+wZuzkdnH1HL8PC66RkiZtztb545RVef
 TLXEVMIWBPHM5RU/0CtSa7ygecQcG0Asu0FRxsIYx+PAHI/h5PS9Gwt0lWpSuSis2m2iok8aTMW
 5mYt0vBL2/el4Eu4nBKWUrgsFPX/ustMxhnbDBV8v4AEvoiM4d7YDuBLcTcHvhz8E3xzzo9PEyv
 9W+pn/wE47DBhI5ME6yxg5xfij35+G9yiZQX2gsQsZLe1l+fhUxXpjCvPfvPWrq/QcGI/2V2DtY
 ytO/rh1iqHHC5/XP+0q74i+P9WZppO/wGCzSPAhLf7U3cVzJzzrRxNdf4CTZA0iJ/wE0gttdfRt
 9/iKNJboKGrQ9W1LnCs1qMxWiqzcOH3rHCqvkrcUP5LG1Fg+nuH5nyDEEA66hZb/T7uX5JMqNk+
 Ixsw2Ab4gOBZ0X0JYVd60fpF8qmnWVh+f8I0suglZRMzwkjpMnijeG/+lywMcPhhJo2/Yp9VW5B
 NO8M5dPj1atGVIA==
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
Signed-off-by: Breno Leitao <leitao@debian.org>
---
 drivers/net/netconsole.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/net/netconsole.c b/drivers/net/netconsole.c
index b358e5c3673510..833da29717ed1d 100644
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
@@ -2474,7 +2486,7 @@ static void netconsole_write(struct nbcon_write_context *wctxt, bool extended)
 {
 	struct netconsole_target *nt;
 
-	if (oops_only && !oops_in_progress)
+	if (oops_only && !netconsole_kernel_dying())
 		return;
 
 	list_for_each_entry(nt, &target_list, list) {

-- 
2.53.0-Meta

