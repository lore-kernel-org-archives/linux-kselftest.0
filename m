Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793797700;
	b=sNhIMdJe6aI1R0FwCzlYQU4jm1UTZxq6oNIOb78Kk4PjQ1QS1iHqKp/rewV1Kf1hcd5H
	 3VyYJe6CE+aikD9GuUy4w0ff+6pWZTlGgOe/xmpo6ZkQISh632DaqDHNS6JBqUUBTb/9Z
	 xU2c0hDnoCnEpRvFqADwBPHE+phvZcw8qP2A0ui9f9pAWVyrsElcgUmfSxrrc3D7nGa+y
	 9pwtgIf7X2CSZp+F+h1EU62LzM5B7Jytr9xsbVPjRXk2KDnhf43qBOsHXbVZa9MeHyS8t
	 9pFEXniYOSFtzns03YsgMTo70OUQSAnHH23KWffgE7x31uwlzaTf6sKb19A8oA8lEmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793797700;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=A7YzyxBWY9wbzw+KD8hz8nrn6W5RkfNtClvS0wwnDGY=;
	b=dWZdOLGikShbdMt8Fs7j++D3zPBw4jotScSrbrgdTbvyXRhXNl7dUcbGM9TaiHEAyEm0
	 xejGfPpDM5zlalP6FnIU0kPlNftWNW5v5Zkgr8KkVnkhsM/nefE7HiziaFdjc1Pybwfkb
	 gtIc9Ve0sK9dMcCDrJk4RQq9S8dgGCrlp8x4yPeVRv/2miF3E7EHmAuaOJq2JC486jHX1
	 FBPrua7KzldPrZwsfRDuezCZGcQDj7p2XHbM7BXZezFoyoz87J7ZF0p7+TBU3ynJ633Po
	 UNgMCQ4H/mPTJ+V1DsoOID6bqW897c6+CanX0cS285N2DzNo3tX9EQ1lMt1eFgmzFWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Nr01w05D;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=QC2h765l;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA63606A329
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 13:08:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CA63606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Nr01w05D;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=QC2h765l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793797699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=A7YzyxBWY9wbzw+KD8hz8nrn6W5RkfNtClvS0wwnDGY=;
	b=Nr01w05DBfV3OHfU9P5TtV/FU0EBFCf93g3wGeFeCAHFmUtDEEBFyTGYmgI3/Nk5eUa2bX
	FMclrz+3V0TclMR2OUnI0KCdvD4TFiWU7u+e8+HRqMCSIemGUA7oCauqUlCrp9jTZtag2J
	nSYaZ4BXFdP+UvH/budBf3A3ecmiEmU=
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-hOxXrTnJNzuaMBvfJ-dSVA-1; Wed, 04 Nov 2026 08:08:18 -0500
X-MC-Unique: hOxXrTnJNzuaMBvfJ-dSVA-1
X-Mimecast-MFC-AGG-ID: hOxXrTnJNzuaMBvfJ-dSVA_1793797697
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-67a6eb09b1eso874344d50.1
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 05:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793797697; x=1794402497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A7YzyxBWY9wbzw+KD8hz8nrn6W5RkfNtClvS0wwnDGY=;
        b=QC2h765l7V6y9NndNV1+vcSqONzFE5QQmyB+eOB1Dh8EVGVLtY6ePf2OjMrH68ivbR
         FOAKvEhLahKGKx7qgy8ZlzBKSePbuDuYjfCAzsRdINrL8bGN+TuRPca9GBLoIysx31tP
         AKj8kLX+JlePdrKypJYINSi3VCUgq9kWARKx1d0hQoz4VT+dPQlismJOZ2yqwnMQbnWh
         VYpzHD45MldRwJ9gf2W/rLF8z2WvfiCPXdxFLsenlpo76IAzzqyyg4IMSGUH9w+CfMzC
         qlkIm/zEBos+kS2WA2SRB7OGL4QY/CCYxxyWbRHPiyWT50L0HgJRAkhFX5FKnMEMw5na
         d6fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793797697; x=1794402497;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A7YzyxBWY9wbzw+KD8hz8nrn6W5RkfNtClvS0wwnDGY=;
        b=mHZ0gUyuM84DdslNjlnerbMuugdeYN/Rupq9LtGe4sqP9nukvT4YqjYOpKZ8BU0Qeh
         QdctAvP6xlIGLB55p0EkhZIbEL4KdDgVZQqhVvQA1uVnJEgR+ovuoCNfY3td7JqZwGUW
         JO+LQN3ztft9juNsP8YmBwfxaobALt3B8DAP/UCJwVlMd/EHuSABUWIRWL67D2BRPGOG
         3WEccm0X8GPnY/RKXy2JUiMMHrvS5JXNohnVjf/KgwEPVejUeobIFcWBJW9EJnznb1bN
         d+Lt6j4wYHl2fZunlDaOTcNRyUZw5ge5vq+FJKgStM8mCUfbgxLjnWXDLEhIsF0GlocS
         QElQ==
X-Gm-Message-State: APuU4Z/vHYpcKQfcJ2Pu1c/ax8C4Aqshg8PK4+3Jv22WpMvm4tkIS1Qi
	LnPLjtM9dKVN4DIarUvD0O6H2/22pjnXR3YLMEtVpdlFbSjl/RGV5AmeIgNJwKoeDWWULa9ALUR
	voy4o0spLWSjjZOduzBXnd89Hpom6g/Fc/5PLkN3UwbVlJbX7zUIYlF2HcV7yr9NB6qHZirxqNx
	9vGa3uyQ8PrNwYcko0/tnv2tV/aSfdMeGsCP9GmoIbtIbQs+aO/rDrQg==
X-Gm-Gg: AYBFou1m20OnKzp7Jy3pCiJrl/iDFEwjAtTaVAhaAnmj9eGcRNEAI4TdpOftGbKSD6n
	3iy3h2umcRo0APxUMYxVhC4roeWRACQabHGvdxkM1Cy1+sXmj5LqE1MZeO6tJnjELRKZio/7TwZ
	SVgzWYyOkrT+i3cOOqmhejojMRsm4iZHT2hDAFFI7I2sSEfbzXzOyRRkirFY5vT+1NQ8du23LI1
	+B9WNW6clQAWRDQgX/FFVHD+148cHI5ULCCOoZrCeqikwMnfO6ZaEeOOVQq3QoPBp6Ms3qtTKCz
	vzDuzzENVXSmTfZN6snPHQEIb2970rhZ1W19h/FEiMYIoVsjNIhtNgwlFgkMgM+lwfs1cnoomE+
	cinsYyTmtWisB282KLFnEQ5d6pvV3YpkLD4nQi9h+krpf7B+ERHwzLJnRdlh5bkD4fRs93B9q4A
	==
X-Received: by 2002:a05:690e:144b:b0:67b:e78c:43ee with SMTP id 956f58d0204a3-67be78c44dcmr1832068d50.116.1793797697511;
        Wed, 04 Nov 2026 05:08:17 -0800 (PST)
X-Received: by 2002:a05:690e:144b:b0:67b:e78c:43ee with SMTP id 956f58d0204a3-67be78c44dcmr1832050d50.116.1793797696768;
        Wed, 04 Nov 2026 05:08:16 -0800 (PST)
Received: from sbertram-thinkpadp1gen5.bos.csb ([67.189.222.97])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67bee2d0473sm1361957d50.23.2026.11.04.05.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 05:08:16 -0800 (PST)
From: "Stephen Bertram" <sbertram@redhat.com>
To: linux-kselftest@vger.kernel.org
Cc: Stephen Bertram <sbertram@redhat.com>
Subject: [PATCH v1] accept03/tst_fd: Harden parallel runs against shared path races
Date: Wed,  4 Nov 2026 08:08:01 -0500
Message-ID: <20261104130805.356900-1-sbertram@redhat.com>
X-Mailer: git-send-email 2.55.0
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

From: Stephen Bertram <sbertram@redhat.com>

Concurrent syscall runs can TBROK in tst_fd when multiple processes
race on fixed fd_file/fd_dir names (unlink ENOENT). Use pid-unique
paths with O_EXCL, distinct names for the file and O_PATH cases, and
give accept03 a private tmpdir.

Signed-off-by: Stephen Bertram <sbertram@redhat.com>
---
 lib/tst_fd.c                                | 29 +++++++++++++++------
 testcases/kernel/syscalls/accept/accept03.c |  1 +
 2 files changed, 22 insertions(+), 8 deletions(-)

diff --git a/lib/tst_fd.c b/lib/tst_fd.c
index 6538a098c..5d4430cf8 100644
--- a/lib/tst_fd.c
+++ b/lib/tst_fd.c
@@ -30,29 +30,42 @@ struct tst_fd_desc {
 	const char *desc;
 };
 
+static void fd_path(char *buf, size_t len, const char *prefix)
+{
+	snprintf(buf, len, "%s_%d", prefix, getpid());
+}
+
 static void open_file(struct tst_fd *fd)
 {
-	fd->fd = SAFE_OPEN("fd_file", O_RDWR | O_CREAT, 0666);
-	SAFE_UNLINK("fd_file");
+	char path[64];
+
+	fd_path(path, sizeof(path), "fd_file");
+	fd->fd = SAFE_OPEN(path, O_RDWR | O_CREAT | O_EXCL, 0666);
+	SAFE_UNLINK(path);
 }
 
 static void open_path(struct tst_fd *fd)
 {
+	char path[64];
 	int tfd;
 
-	tfd = SAFE_CREAT("fd_file", 0666);
+	fd_path(path, sizeof(path), "fd_path");
+	tfd = SAFE_OPEN(path, O_RDWR | O_CREAT | O_EXCL, 0666);
 	SAFE_CLOSE(tfd);
 
-	fd->fd = SAFE_OPEN("fd_file", O_PATH);
+	fd->fd = SAFE_OPEN(path, O_PATH);
 
-	SAFE_UNLINK("fd_file");
+	SAFE_UNLINK(path);
 }
 
 static void open_dir(struct tst_fd *fd)
 {
-	SAFE_MKDIR("fd_dir", 0700);
-	fd->fd = SAFE_OPEN("fd_dir", O_DIRECTORY);
-	SAFE_RMDIR("fd_dir");
+	char path[64];
+
+	fd_path(path, sizeof(path), "fd_dir");
+	SAFE_MKDIR(path, 0700);
+	fd->fd = SAFE_OPEN(path, O_DIRECTORY);
+	SAFE_RMDIR(path);
 }
 
 static void open_dev_zero(struct tst_fd *fd)
diff --git a/testcases/kernel/syscalls/accept/accept03.c b/testcases/kernel/syscalls/accept/accept03.c
index bc472397d..dea4988cf 100644
--- a/testcases/kernel/syscalls/accept/accept03.c
+++ b/testcases/kernel/syscalls/accept/accept03.c
@@ -55,4 +55,5 @@ static void verify_accept(void)
 
 static struct tst_test test = {
 	.test_all = verify_accept,
+	.needs_tmpdir = 1,
 };
-- 
2.55.0

