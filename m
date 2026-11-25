Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795588877;
	b=V8fY8GRR2V5mhNRPhO7/uJxlH/vw/his9BG5Zl17NdCgTdwCt0xGa8MR3Lkvng5L0knT
	 wBn7XXNjZfGETImqYtBxvrmE1/BATTHt+F71J9LwJkqpnlOZlTG/xhPiFTWMJ+nkBeUDi
	 kHBFCBU2uw0otTWv6JQT6KXdNovKZeIQWGoLXu1BwphmD8hZ9IH65VFtNrU30pFlZBRxx
	 s7U3eIFZWrlv8nSG+Rkke9ZhU5gpvoyWJRscQ/jOfTh5TQkp1mesLgd5zqUwb+hygovbQ
	 uo3SA0PlEwOYlEZ68pwld6YCflHp5vax5es573HvfHc0e7LdP9uxr7lQZsxVA43iMMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795588877;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jXPtIz69YE1EXIfctFPM9q44zXNnKosM9rIAEAlt/gM=;
	b=2faFralFkqWMf7O0cNKokzE+/ABo9RVLiKwIib58OXpbbUg8/JdxSWmg56iDL4+uCHFy
	 EpnPVeRVe0iavJibu3AH9Nkx0zwbYACPweYTMBxtCb0+ouXhF6AkREhBsZ5TDE2VrEzE+
	 3LPSf4OSMXIrVxcug7AwPPDTXRSyFgaWJ/aJpjNlSE43kGIDYPYrunHmeuJHgvkOY9ryA
	 m4zd6BgSMdHPn/G8rltPR/tnbZ0SyM2PgSMMXh6YQHvXGRqLhd30841RyjEENPVky7UZP
	 f5BcqACtlkJpvug4/1awVPcZSOhcehFIO/DIK345lEEG1oQDHdIZgENxwauXnYiJ1xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=igOsq9VV;
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21037606A31E;
	Wed, 25 Nov 2026 06:41:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21037606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=igOsq9VV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=igOsq9VVs8hnw3xqSjKHQ7sf+qSFWDrrk42oa0SYwFySOX/lUjWFMY/UEq5SaQHT+WwXzLeLI0rQg
	 ktF5JG5wLjBSRl6pU2GL/8uXqMM0RHKApZsG7pkgW0nEuieniPbCpSpKt3h5LMlOHY+QB5oaXTwgZD
	 TFpU8TOPgNaKQxpg=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee76b06830992c-4fbb9;
	Wed, 25 Nov 2026 14:41:13 +0800 (CST)
X-RM-TRANSID:2ee76b06830992c-4fbb9
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[180.106.213.53])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee86b068305c60-3c15c;
	Wed, 25 Nov 2026 14:41:13 +0800 (CST)
X-RM-TRANSID:2ee86b068305c60-3c15c
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
	idosch@nvidia.com,
	hangbin.liu@linux.dev
Subject: [PATCH net-next v2 2/3] selftests: net: enable receive metadata independently of its value
Date: Wed, 25 Nov 2026 06:41:09 +0000
Message-ID: <20261125064110.1396439-3-xujingjing@cmss.chinamobile.com>
In-Reply-To: <20261125064110.1396439-1-xujingjing@cmss.chinamobile.com>
References: <20261125064110.1396439-1-xujingjing@cmss.chinamobile.com>
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
Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
Signed-off-by: Jingjing Xu <xujingjing@cmss.chinamobile.com>
---
 tools/testing/selftests/net/so_rcv_listener.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/so_rcv_listener.c b/tools/testing/selftests/net/so_rcv_listener.c
index bc5841192aa6..a57fff256cc2 100644
--- a/tools/testing/selftests/net/so_rcv_listener.c
+++ b/tools/testing/selftests/net/so_rcv_listener.c
@@ -65,6 +65,7 @@ static void parse_args(int argc, char *argv[])
 
 int main(int argc, char *argv[])
 {
+	int enable = 1;
 	int err = 0;
 	int recv_fd = -1;
 	int ret_value = 0;
@@ -88,7 +89,8 @@ int main(int argc, char *argv[])
 		goto cleanup;
 	}
 
-	err = setsockopt(recv_fd, SOL_SOCKET, opt.rcvname, &opt.val, sizeof(opt.val));
+	err = setsockopt(recv_fd, SOL_SOCKET, opt.rcvname,
+			 &enable, sizeof(enable));
 	if (err < 0) {
 		perror("Recv setsockopt error");
 		ret_value = -errno;
base-commit: 57f165ff2f30491bc3511d24a52ca516751a268b
-- 
2.53.0



