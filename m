Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from cmccmta1.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id E3B80BC
	for <linux-kselftest@vger.kernel.org>; Mon, 20 Nov 2023 18:55:13 -0800 (PST)
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id 2ee3655c1c0c2d3-feac2;
	Tue, 21 Nov 2023 10:55:09 +0800 (CST)
X-RM-TRANSID:2ee3655c1c0c2d3-feac2
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from ubuntu.localdomain (unknown[10.54.5.255])
	by rmsmtp-syy-appsvr04-12004 (RichMail) with SMTP id 2ee4655c1c0b6dc-3dcf5;
	Tue, 21 Nov 2023 10:55:09 +0800 (CST)
X-RM-TRANSID:2ee4655c1c0b6dc-3dcf5
From: zhujun2 <zhujun2@cmss.chinamobile.com>
To: mathieu.desnoyers@efficios.com
Cc: akpm@linux-foundation.org,
	cyphar@cyphar.com,
	dverkamp@chromium.org,
	jeffxu@google.com,
	keescook@chromium.org,
	linux-kselftest@vger.kernel.org,
	shuah@kernel.org,
	zhujun2@cmss.chinamobile.com
Subject: [PATCH] selftests/memfd: fix a memleak
Date: Mon, 20 Nov 2023 18:55:06 -0800
Message-Id: <20231121025506.2391-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <12dd2fb2-0fac-4763-ad34-02af9653f91b@efficios.com>
References: <12dd2fb2-0fac-4763-ad34-02af9653f91b@efficios.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>

The memory allocated within a function should be released
before the function return,otherwise memleak will occur.

Signed-off-by: zhujun2 <zhujun2@cmss.chinamobile.com>
---
 tools/testing/selftests/memfd/fuse_test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/memfd/fuse_test.c b/tools/testing/selftests/memfd/fuse_test.c
index 93798c8c5d54..fd934487c528 100644
--- a/tools/testing/selftests/memfd/fuse_test.c
+++ b/tools/testing/selftests/memfd/fuse_test.c
@@ -217,6 +217,7 @@ static pid_t spawn_sealing_thread(void)
 		abort();
 	}
 
+	free(stack);
 	return pid;
 }
 
-- 
2.17.1



