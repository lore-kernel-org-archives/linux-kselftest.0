Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794281964;
	b=YdyV638IwAhtAYiSzkAxEHKJilqHn+GqrOE4W50DJao6NU4rmFhiukJ1/sof/uVcFNEP
	 X/lzWzjid10KANlA4rmcCLFTVm+MVBcQDFmrtaEVjN6qGPdVohUi1syrYjHH/8exB+uS4
	 sfKIb6zK3UF7ltlmOYkf8DSYROknl/PcO32/ShiOF/8uGl8GcVJWSUlakSuVJjcBFTina
	 F3zzQRWpC/is5bOnFeHGMO1NtUAlKj3ZX4QON34oEHJYhQSfh19OkDvQwAvucZW3O+p6A
	 a/SRcU36TkI4GjladmiSiATXCQ+Hq6dGC9Fl8uDAN3ScWs29eESm8IKuBocj1KkwU9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794281964;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UoSroO5PJS1iv1tggvSKiCANxgfYCumSpAM4R3/WqNg=;
	b=yiY9zM+fRZdh/yo+bL6hjpf+rHLnVUd6t0o4rwvym/cd/3lNRxCBBSgvjTj+hvevvhP8
	 GwjcsrdhiR9ML36E4yWGn+ODiqpFpX+A2OTocdrej7GRUByCLU69cjnNHtsnsvBlw+VbO
	 biITVYMQxkBRDIEL0Bnw3k2/s/ttA3K4HJORgehP/I0g4LZUN7oCkxzPHCn1g1amr38u3
	 miJJOsSQShzMxS82Kad/Y1wqU+w6MbRmjAqowcJz90idAyNmRoRfbXKr0XD4eFORWsSs+
	 H7qX9H6NfTBBua5IZKET4l3IP118n5R3bIQGa9I6u+Of8Rkw0RZuJ8qj2/m/9mfX4Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=zizu4idA;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 389A9606A31C;
	Tue, 10 Nov 2026 03:39:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 389A9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=zizu4idA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=zizu4idAUlgHYFJcGeDX7I3HC67ChGTwhjiuy97uCmrBG9QEmIT8+CF7rWJwv0T7R0gsVcUXtKRXa
	 XBqzR07dv3q5rb03rb2TFdTotMe7nZcte4ok7qR74D+ESjoUZooJ4BVyeAp9W+hinMulRdggFOUP8A
	 Q6GurjOLXfuWoWp0=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86af291e83f4-6a4e0;
	Tue, 10 Nov 2026 11:39:20 +0800 (CST)
X-RM-TRANSID:2ee86af291e83f4-6a4e0
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from home-ubuntu-251 (unknown[180.106.244.228])
	by rmsmtp-syy-appsvr04-12004 (RichMail) with SMTP id 2ee46af291e5925-a562d;
	Tue, 10 Nov 2026 11:39:20 +0800 (CST)
X-RM-TRANSID:2ee46af291e5925-a562d
From: Jingjing Xu <xujingjing@cmss.chinamobile.com>
To: netdev@vger.kernel.org
Cc: willemb@google.com,
	kuba@kernel.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org
Subject: [PATCH net] selftests: net: cmsg_sender: retain the resolved address family
Date: Tue, 10 Nov 2026 03:39:18 +0000
Message-ID: <20261110033918.49238-1-xujingjing@cmss.chinamobile.com>
X-Mailer: git-send-email 2.53.0
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

When neither -4 nor -6 is supplied, getaddrinfo() selects the socket
family but opt.sock.family remains AF_UNSPEC. The cmsg and socket option
helpers then take the IPv6 branch even for an IPv4 socket.

For example, an IPv4 loopback packet sent with -l 11 arrived with the
default TTL of 64 on the test host. Using -L 11 instead failed with
ENOPROTOOPT because the tool tried IPV6_UNICAST_HOPS on an IPv4 socket.
Explicit -4 works in both cases.

Record the selected ai_family after successful address resolution so the
helpers use the same family as the socket.

Discovered by Codex-assisted code inspection and tested with real
loopback UDP traffic, without kernel instrumentation. Covered IPv4 and
IPv6, automatic and explicit family selection, and cmsg and setsockopt
hop limits. All eight cases receive the requested value after the fix.
Built through the net selftest Makefile and with GCC -Wall -Werror.

Fixes: 2e5584e0f913 ("selftests/net: expand cmsg_ipv6.sh with ipv4")
Signed-off-by: Jingjing Xu <xujingjing@cmss.chinamobile.com>
---
 tools/testing/selftests/net/cmsg_sender.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/net/cmsg_sender.c b/tools/testing/selftests/net/cmsg_sender.c
index 67a72b1a2f3d..01617a021338 100644
--- a/tools/testing/selftests/net/cmsg_sender.c
+++ b/tools/testing/selftests/net/cmsg_sender.c
@@ -495,6 +495,7 @@ int main(int argc, char *argv[])
 		goto err_free_buff;
 	}
 
+	opt.sock.family = ai->ai_family;
 	if (ai->ai_family == AF_INET6 && opt.sock.proto == IPPROTO_ICMP)
 		opt.sock.proto = IPPROTO_ICMPV6;
 
base-commit: 1d5e2c57e9ffc134e14b3f837c8d7c53b508bd22
-- 
2.53.0



