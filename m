Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08043603DD;
	Wed, 15 Jul 2026 08:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784104452; cv=none; b=VpTOp64KjV67HluPwTf4HMbJ6QUdh1V4GM7n5DMPdhjjOnBhWap8MZHENWfTQdJEqqYGhjPgz48jQI4QVr30lYvxLiwFecJpxUG5YqpNY3hy52uMqbSHhg+66Fypst2Y0vY89DVq9lD5KOuMextbOfH8fqlTUiOG1Hmwx63ddbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784104452; c=relaxed/simple;
	bh=OphNoAUqOLR8mOWf5JyXQkvYoInIlft9JipWcvawUig=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=uwEjmSiQPG19tajaAPH4GZ5hbEEgv0l4C8w8fQ/EbTF1T8QF0mNsqAa61qBAgkLNv3ZKySTdky34d6FJyKqmKOrEb7Zpp528RmU8Yw830tgr3uURiWV8y0KN3ERzXax5on3PYRNeslTQQoLOVk+7NE7XThZ4MYr+NyKN0XZ5WNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=UljCVJeU; arc=none smtp.client-ip=43.163.128.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="UljCVJeU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1784104446; bh=q/2/b0RWB9lYa5vZxIvGUHajHikSAG/Gq7xDRhBFjcI=;
	h=From:To:Cc:Subject:Date;
	b=UljCVJeUxmZGYrKfML1YvYKRVDiiP4h/dHyKzGgQzrCm3K0k+Vsmh6ldilvOJflWk
	 KZwSS+c06GMfkFVHpFc//tpA3TIwkE6vW+Fp6bY5uw8Aey1PR5b00u4QCoGlM20Be9
	 /hkpxFD7AoGJ2qTXx7YjXTnJMYTAwqg5CjTSuVNc=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id 8D01C50; Wed, 15 Jul 2026 16:02:13 +0800
X-QQ-mid: xmsmtpt1784102533taljlcvyk
Message-ID: <tencent_CD80B5F746B6AABD68AF3F1097AD02C96F05@qq.com>
X-QQ-XMAILINFO: MSHuecu5THA/xdRlrHvAw7rh0UCx9KsT+EAf6vNQr9ne3VQ9g7RjYlcviX6dP4
	 D3J5s3it2DxDYIPfnzARG6SqLPPtmqTITE6T7Vm5CblnwkyYDM5zBLDQsg2GVW2C2SGKSdXxWknZ
	 dti3ZGDLcgCsFgIWH4V+D0H9xQr0xjVxLKlkirk5XewgR1oxzbrgKAq7LBp+TSbPCVFROVTz3feY
	 U/YNVt2vcZ44ktxwEPoQeRsKoT6gXkna+PidvtNChYO9mGy3h+VdCzefcWajcDCpJZksvK3lK3Kc
	 d1X5v4kiCUbltHErR2VrWwonRXeaSXZwWt5RoQAYI07YtEaihywhiyuZVSIYyKXS4tT3dkZ79L30
	 PYmJZN82ZDBUnuXCNL03TVuSTyZu3HHrrvAsb3iyft+gRBnG3bC7Atm3DoVYBUQN8+NlX55cXEfv
	 gkw70vJHqWnI5hKeWELFB2J/92l/d4A7u7DeO+kEGOkla5Ih9YQivKJ1zGyKmeYtveV89Y73MyD4
	 MoX02S9GHxGSYVucNsTnNul1hhUopq9TT+1iGiy+2Bd8OgBwBxfy9WasN2QAkcEoXoNYomsKcjyD
	 xiIjU7/lnZ/3Yw53xux2P49FqSMQ1KAxzARiFBu1T2QHkQB1dngA/Qnr6FXXxG6736XZWo6w/cAh
	 xqkLhjGzdDMZbozcYuU3RU307SQgtej0r4gMxh7gtmPy6SUUN+xbkXxKZvevDS/cw6x2tG1y1P99
	 mgciCh/N5AvNZCUvHaK9c8n5msjmN8W/TkP8O9FqhSMo0KX+QFWxLIF6238lmgY5n/eMuTV3DO33
	 0uNgTi8yPi9uuJPVJBSv+jgHR4dZazBgCp5L4nkktz1wx1QG1SJVFg06XX5QtSTmVb5i6JNB/t7R
	 fD5ul0JolYsgJ+3ODPQMsabJiRVrsYUTsuUIVif/z9UwrMDWv/93eK9XC7QmRp7BLHMrKPamracR
	 Wwg+iv02P48dHzmwPli71+xepDHhDUPCbxRPezRlvLZF+yVOX4Drn/jDScgpSNvcv1pdxKz7HotL
	 fy0adluOQ4/ryDwGp0dgAtEhXd1+ja3HE+DiPcDXVq3pGtsawLHSc57RjpdtI2MbPj9Wt+7HKg9C
	 qaCdW2E4mnaR9GBAIau1IhSujfMQ==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-USESPAMBG: true
From: Haofeng Li <920484857@qq.com>
To: Kees Cook <kees@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Haofeng Li <lihaofeng@kylinos.cn>
Subject: [PATCH] selftests/lkdtm: rename STACKLEAK_ERASING to KSTACK_ERASE
Date: Wed, 15 Jul 2026 16:02:10 +0800
X-OQ-MSGID: <20260715080210.3855904-1-920484857@qq.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Haofeng Li <lihaofeng@kylinos.cn>

Commit 57fbad15c2ee ("stackleak: Rename STACKLEAK to KSTACK_ERASE")
renamed the LKDTM crash type and selftest configuration but missed the
entry in tests.txt.

As a result, the selftest generates STACKLEAK_ERASING.sh, which run.sh
skips because the LKDTM DIRECT trigger only exposes KSTACK_ERASE. Rename
the test entry so the generated runner uses the registered crash type.

Fixes: 57fbad15c2ee ("stackleak: Rename STACKLEAK to KSTACK_ERASE")
Signed-off-by: Haofeng Li <lihaofeng@kylinos.cn>
---
 tools/testing/selftests/lkdtm/tests.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/lkdtm/tests.txt b/tools/testing/selftests/lkdtm/tests.txt
index d8180bbe31e8..bec57a02913a 100644
--- a/tools/testing/selftests/lkdtm/tests.txt
+++ b/tools/testing/selftests/lkdtm/tests.txt
@@ -78,7 +78,7 @@ USERCOPY_STACK_FRAME_TO
 USERCOPY_STACK_FRAME_FROM
 USERCOPY_STACK_BEYOND
 USERCOPY_KERNEL
-STACKLEAK_ERASING OK: the rest of the thread stack is properly erased
+KSTACK_ERASE OK: the rest of the thread stack is properly erased
 CFI_FORWARD_PROTO
 CFI_BACKWARD call trace:|ok: control flow unchanged
 FORTIFY_STRSCPY detected buffer overflow
-- 
2.25.1

