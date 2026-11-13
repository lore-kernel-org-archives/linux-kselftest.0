Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794553994;
	b=Sbkak8DZEv8f0K1N1KnSTwvOGZEmGPJDuUE0vLDlD80XF9BImN9fKNhL5lLvpmdl3xGJ
	 i2Kg8aQhHR78+heOHJJFoqolMzbZ2f1x2CGl/tvKrXlEYgP94gjjRKUBoSBlEKsFcuf9L
	 W28Mu/s4VAQBht7k/8mTcYtGfMsCovkctKxmHG5lfbYcHecUnZrS8e5Vd/UiiD0v1dMoQ
	 v3swQL45ym6S/poUP5go44BDcYqhYNDVIGCspqazS6ve9LhJ+K9ly1FoAzuC6JIOG1Llr
	 IH8JX9w2rX2xUBAkmN8DiDwU7dWNznbe9rKparmoxsaBAI6SIedMhBHF6O3c8fdmerQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794553994;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jwJEcLepynHbIn+FVTxG6lhSdNiQ07QILHBvbeYHS+M=;
	b=hOzpL0DvS0nQGd/heSiwmIi4XNcQfdEubd08+OIKa1sWOa65X9f4l98uIqVZxsZf4U4f
	 A+VqSSounpZcGVKIjgdqMRV3hFKvVMJQr4x2XowbFbMZ+MBsFjqFzeBqnk6xsWo/GZAqL
	 ZbNSCMYTVU653T+HgCYibwPJl+URCMfgd8OWyM2puZWsumwUc0SFLqW0ATiRloYh4pZQl
	 tcrLN4OpNrOpM8SFNxuAmkJ2n1nvWHrq0zG0+RwVaITAAiFgwNeLpbwil6DKlgM3ZRbj7
	 lc+MoSnQYF13p4Y+ZyiQkB6akoVXIxOwLjIUeWJRDrUcjkfWPibTitroIHWmgt2UyPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=CjeDckG5;
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 461D9606A323;
	Fri, 13 Nov 2026 07:13:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 461D9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=CjeDckG5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=CjeDckG5BJvVoZ+/d3qltobSl8QLrmOl9wvuXOj8dcFS6OjanaLVI5FxRAmioaXnIvQZMgOa+Jwo+
	 ILVhlL4FjNplNBMz9rgAxjV7vmjkkdN8XvRym4rsFF364bTdRmclhMj1gpoTAOSB8OLr4ZGfFmrAR+
	 swCzb+7S68Gtk9to=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee76af6b8873fc-e9ebe;
	Fri, 13 Nov 2026 15:13:11 +0800 (CST)
X-RM-TRANSID:2ee76af6b8873fc-e9ebe
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from desktop-eb75daa8a6be458c-20260816004526035 (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76af6b883592-1bdcd;
	Fri, 13 Nov 2026 15:13:11 +0800 (CST)
X-RM-TRANSID:2ee76af6b883592-1bdcd
From: zhangchujun <zhangchujun@cmss.chinamobile.com>
To: hughd@google.com,
	david@kernel.org
Cc: akpm@linux-foundation.org,
	baolin.wang@linux.alibaba.com,
	shuah@kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhangchujun <zhangchujun@cmss.chinamobile.com>
Subject: [PATCH] selftests/memfd: close fd in sysctl helpers
Date: Fri, 13 Nov 2026 15:13:06 +0800
Message-ID: <20261113071306.1673-1-zhangchujun@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
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

The three sysctl helpers sysctl_assert_write(), sysctl_fail_write()
and sysctl_assert_equal() open /proc/sys/vm/memfd_noexec but never
close the descriptor, leaking one fd on every call.  The noexec tests
call these helpers in a loop, so the test can run out of file
descriptors on a system with a low limit.

Close the fd before returning from each helper.

Signed-off-by: zhangchujun <zhangchujun@cmss.chinamobile.com>

diff --git a/tools/testing/selftests/memfd/memfd_test.c b/tools/testing/selftests/memfd/memfd_test.c
index cdab3a837624..8bdfa91d3b76 100644
--- a/tools/testing/selftests/memfd/memfd_test.c
+++ b/tools/testing/selftests/memfd/memfd_test.c
@@ -120,6 +120,8 @@ static void sysctl_assert_write(const char *val)
 		printf("write sysctl %s failed: %m\n", val);
 		abort();
 	}
+
+	close(fd);
 }
 
 static void sysctl_fail_write(const char *val)
@@ -136,6 +138,8 @@ static void sysctl_fail_write(const char *val)
 				val);
 		abort();
 	}
+
+	close(fd);
 }
 
 static void sysctl_assert_equal(const char *val)
@@ -153,6 +157,8 @@ static void sysctl_assert_equal(const char *val)
 		abort();
 	}
 
+	close(fd);
+
 	/* Strip trailing whitespace. */
 	p = buf;
 	while (!isspace(*p))
-- 
2.50.1.windows.1



