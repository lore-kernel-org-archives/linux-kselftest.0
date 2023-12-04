Received: from cmccmta2.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1254A83
	for <linux-kselftest@vger.kernel.org>; Mon,  4 Dec 2023 01:01:20 -0800 (PST)
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee6656d9559351-5ebda;
	Mon, 04 Dec 2023 17:01:14 +0800 (CST)
X-RM-TRANSID:2ee6656d9559351-5ebda
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from localhost.localdomain.localdomain (unknown[10.54.5.252])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee1656d9559937-28cbf;
	Mon, 04 Dec 2023 17:01:13 +0800 (CST)
X-RM-TRANSID:2ee1656d9559937-28cbf
From: liujing <liujing@cmss.chinamobile.com>
To: shuah@kernel.org
Cc: linux-kselftest@vger.kernel.org,
	liujing <liujing@cmss.chinamobile.com>
Subject: [PATCH] tools/testing/selftests/x86: add dlclose function in the vdso_restorer.c
Date: Mon,  4 Dec 2023 04:01:11 -0500
Message-Id: <20231204090111.2967-1-liujing@cmss.chinamobile.com>
X-Mailer: git-send-email 2.18.2
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>

in the main function of vdso_restorer.c,there is a dlopen function,
but there is no dlclose function to close the file

Signed-off-by: liujing <liujing@cmss.chinamobile.com>
---
 tools/testing/selftests/x86/vdso_restorer.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/x86/vdso_restorer.c b/tools/testing/selftests/x86/vdso_restorer.c
index fe99f2434155..a0b1155dee31 100644
--- a/tools/testing/selftests/x86/vdso_restorer.c
+++ b/tools/testing/selftests/x86/vdso_restorer.c
@@ -57,6 +57,8 @@ int main()
 		return 0;
 	}
 
+	dlclose(vdso);
+
 	memset(&sa, 0, sizeof(sa));
 	sa.handler = handler_with_siginfo;
 	sa.flags = SA_SIGINFO;
-- 
2.18.2



