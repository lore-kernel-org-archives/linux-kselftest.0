Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795362561;
	b=tJ6ZTg4b29ZKvDfbXpbruP2y0FrlxZmAqFojTXClaUY011fSQgUpIovrS+8yJNkPmyYP
	 RMr2tcN1eo8V0Ys0LfT87mkiT5EEGPJsNYRfI+6a60g3Zc4fjRH+Uv24lqBQ0DzndLjOr
	 9PX9TqESzh5JACZCYz55X+k3th4ZY6FAaWNV7rkjct/aHEGaB5G21mk4nY8Z3LaGGtsva
	 27lnpfQwm0zmcJ47XdXVjz40sFNXA2Iq5bfPYRJbyxcm++SJyTOqE3Ea0dkeMlWUOG0wU
	 8UKc0byHR9KBNUOyhZJ6AlD6dn8Mld1JgxSD0PE90uB6+Hcb2s0CjoUYEDQj9mYM9vQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795362561;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding;
	bh=ht+BlXhcXOKi0dDlB6+zV4rLk+oHhHsKtlRAubOFSG0=;
	b=ECZ8C+e4nS0/WYBntg/RO3RXhQiCtNSvfUFUebhJUhu6W6tVXSS7DhX4/W8yOg+2+DqG
	 x03/3DJaHbnh/LI5KYaJCL/pUJSh/yMT/K8UPEOhXJ+WDjngzm35nu0We7IM6oNLHH6R5
	 /e/3jGxd/sC/Tjsrihj7w5oLpqw4AvnYKzdAjkE37CBd55Lj6X67NwBT6GnAsP72ubIJo
	 Fk2l5F3WvF6vdZi9ZlXAAOvC2guapYbJI2BSAXwA8ZuqYxpHX2eErTQ5XfWQAcLCcMEbg
	 Mt0W/ptkp6PdOCrWQaycB2WPR2x0DEpf2WdEgjAg4Qe8FtxVuHNl2iUvsjW8WiTJojg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=A3wG1X3J;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77CFB606A32C;
	Sun, 22 Nov 2026 15:49:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77CFB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=A3wG1X3J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=A3wG1X3JoEaGTgNIO6PAMdVsC/1YavxKg9HVLfozuzaZ1MnoPdTuAzpm5XpDyWOlD2BuGYZKrfUrj
	 q4sh9LeXvE8Ql0Nm8+ahIkek5sM1H69OxaiqXB1SmwEMN6pe8I120ATeMS9IeUFI6fbkL10jwM9OQa
	 JATV/dnx1PlGaBdw=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee96b030ef2f82-39a8c;
	Sun, 22 Nov 2026 23:49:13 +0800 (CST)
X-RM-TRANSID:2ee96b030ef2f82-39a8c
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from home-ubuntu-251 (unknown[180.106.213.53])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee16b030ef7809-72e6b;
	Sun, 22 Nov 2026 23:49:13 +0800 (CST)
X-RM-TRANSID:2ee16b030ef7809-72e6b
From: Jingjing Xu <xujingjing@cmss.chinamobile.com>
To: netdev@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org,
	kuba@kernel.org,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	willemb@google.com,
	annaemesenyiri@gmail.com,
	idosch@nvidia.com
Subject: [PATCH net-next 1/2] selftests: net: enable receive metadata independently of its value
Date: Sun, 22 Nov 2026 15:49:11 +0000
Message-ID: <20261122154912.1272447-1-xujingjing@cmss.chinamobile.com>
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

so_rcv_listener passes the expected mark or priority to setsockopt() as
its SO_RCVMARK or SO_RCVPRIORITY enable flag. Consequently, expecting zero
also disables the ancillary message being tested. A zero mark or priority
is valid, but invoking the listener with -M 0 or -P 0 fails with ENOMSG.

Use a separate nonzero flag to enable reception and keep opt.val solely
for checking the received value.

This issue was found with AI-assisted source review and reproduced using
real UDP sockets. Zero and nonzero mark/priority tests pass over IPv4 and
IPv6 after the fix; the zero cases fail on the original helper.

No kernel instrumentation or fault injection was used.

Fixes: c935af429ec2 ("selftests: net: add support for testing SO_RCVMARK and SO_RCVPRIORITY")
Signed-off-by: Jingjing Xu <xujingjing@cmss.chinamobile.com>
---
 tools/testing/selftests/net/so_rcv_listener.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/so_rcv_listener.c b/tools/testing/selftests/net/so_rcv_listener.c
index bc5841192aa6..3d43fa688338 100644
--- a/tools/testing/selftests/net/so_rcv_listener.c
+++ b/tools/testing/selftests/net/so_rcv_listener.c
@@ -65,6 +65,7 @@ static void parse_args(int argc, char *argv[])
 
 int main(int argc, char *argv[])
 {
+	int enable = 1;
 	int err = 0;
 	int recv_fd = -1;
 	int ret_value = 0;
@@ -88,7 +89,7 @@ int main(int argc, char *argv[])
 		goto cleanup;
 	}
 
-	err = setsockopt(recv_fd, SOL_SOCKET, opt.rcvname, &opt.val, sizeof(opt.val));
+	err = setsockopt(recv_fd, SOL_SOCKET, opt.rcvname, &enable, sizeof(enable));
 	if (err < 0) {
 		perror("Recv setsockopt error");
 		ret_value = -errno;
base-commit: 2208ab00f4f213ade91ab775e7f8c4dacdcc856e
-- 
2.53.0



