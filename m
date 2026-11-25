Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795588880;
	b=CjbOp3V0437rUEsGdOYKx6OztIFtwb8ekMnCdAQG5YGbBLY2rjMpiPI4PLSMa4O3cNt+
	 ggvKOXGvcu6HphSeQMiCwzHYJQrebYVZFG090W/ZUfteRytbeMbPiXXfft0IZpaoijX6Y
	 bHH55W1KOidgg2ya9LKCcD/glUC8LqzFGNSL5f34PQmakAYhczdeE/qkq3/sgQzrUUDXb
	 YNTQTcSiepYPvRHjLS6YkkUMb0ZXm3s/B7vt5bkFHH3Lz+TI8Yq5u9RQYilZ9Q8YpHESG
	 iDSH06ocRgztS1IIUFhuTFx/GznZuJcaTfOweY5sWOYn35dOQmmYIA3Vn075MQ3ByzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795588880;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding;
	bh=26ZGboEXDfqbGrgTiA5PM+t9Kn/E+QCP4q2JnEUv5Uc=;
	b=NMFMpt4NO6gkiIl8K89TUL5IZrF/7sik5YkGxAPv9SSz5bgZAHo77h+mF3cNSVkQCgX3
	 QKFGuLW8Xsw8CIMT1yWOaj+/OQ+FclRQ4NJehSRGhchWEgKbVc1bJq5jpusxWUY8yAfIP
	 zYqt16UoqeZJAdrAVodteXlOVNgxo1qaRveKuW/LegMMPBGjWYlO5gWivwMrTtVuxxaPz
	 xGLi2utR/OOlZKzGal5ErlaGZ2V51qrtFHkPVIxi6uBk8H14bkoGasscom9ID5UsZvEaE
	 b8ZzLB2QCvIhHO7nMP4VCsbTyefg63+SvKvdIRH7cr6I/bnpbMS/wCKcoaZvH5LQcVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=gnofGUHu;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56A2B606A326;
	Wed, 25 Nov 2026 06:41:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56A2B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=gnofGUHu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=gnofGUHuOuLLqQ2cYG9F1vK5n4nenLK/8qQBpz/Z88QyRh8KKQlaXzW0ZlegCiE7CwscRLFIEKGDo
	 U1mcnvTV+CfWNEl4tIsm0Fbc7HjSnbsSI5KS+wMhf2pnGxIBDvayR0CGGAFPUiL2BNEJOFk9ZNy6lm
	 rd4q4ElKZDD+lxmo=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86b068306580-eef64;
	Wed, 25 Nov 2026 14:41:11 +0800 (CST)
X-RM-TRANSID:2ee86b068306580-eef64
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from home-ubuntu-251 (unknown[180.106.213.53])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee86b068305c60-3c156;
	Wed, 25 Nov 2026 14:41:11 +0800 (CST)
X-RM-TRANSID:2ee86b068305c60-3c156
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
Subject: [PATCH net-next v2 0/3] selftests: net: fix receive metadata and failure reporting
Date: Wed, 25 Nov 2026 06:41:07 +0000
Message-ID: <20261125064110.1396439-1-xujingjing@cmss.chinamobile.com>
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

Separate the failure-status correction from the zero-value tests, as
requested by Hangbin Liu. The first patch repairs script failure reporting,
the second enables reception independently of the expected metadata, and
the third adds the zero mark/priority cases to the existing test.

Changes in v2:
- Split the exit-constant correction into a standalone fix (Hangbin Liu).
- Put both fixes before the added regression cases.
- Retain Hangbin Liu's Reviewed-by only on the receive-enable fix.
- Wrap that setsockopt() call to stay within 80 columns; behavior unchanged.
- Rebase onto net-next 57f165ff2f30.

v1:
https://lore.kernel.org/netdev/20261122154912.1272447-1-xujingjing@cmss.chinamobile.com/
Split request:
https://patchwork.kernel.org/comment/27396929/
Core-fix review:
https://patchwork.kernel.org/comment/27396955/

Validation used the existing host kernel and real IPv4/IPv6 UDP sockets
in private mount/network namespaces. The original four cases pass before
and after the fixes. A user-space mismatched-metadata sender makes those
four cases fail: the original script exits 0; patch 1 exits 1. Extended zero
cases with the original listener fail 4/8 and exit 1. The complete series
passes 8/8 and exits 0. All helpers build with gcc -Wall -Werror -O2.
No kernel instrumentation or kernel fault injection was used. The negative
sender fixture deliberately changes only user-space metadata arguments.
No hardware test suite was run.

Jingjing Xu (3):
  selftests: net: report SO_RCV test failures to the runner
  selftests: net: enable receive metadata independently of its value
  selftests: net: cover zero receive mark and priority

 tools/testing/selftests/net/so_rcv_listener.c | 4 +++-
 tools/testing/selftests/net/test_so_rcv.sh    | 6 ++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

-- 
2.53.0



