Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E6931AAAF
	for <linux-kselftest@vger.kernel.org>; Tue, 27 Jan 2026 16:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769531461; cv=none; b=fFgT24HW0rvXjkFqy/t+bgwoGBUGd8G/x0NIiL9BZqM8FzNLa1W0P/kOxdnXHit97p7tY5LjQdPqpVCLtpYvzKhnSI1ONMjSYY82H4DdFvysp36apqOsfRQ62LtEkmwluHuv7qFaxt2mHtVkKgPBGWktKjPprB39E/+FLhCazNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769531461; c=relaxed/simple;
	bh=Ni9cZG+geyV7R5ptEtpT9bf+Z96YeRXMlBWy8S2AVbk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=AEB7i0auVs8knGi8cKLvyFvNw4XMOkcOr39EfAn14/SKzNg08MuHDtK2NxRE80L3oyNUTjJjkSh0HWKX0KZvmj1wUFBybGzzx8tJ8j/MjRPW81s8PgNiuuYlZ2APqRkLTmx02OVOgc3ffq72jhQ2zpjtri41En/T0NHX/0Wzpbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gr+9OK31; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gr+9OK31"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-78fb6c7874cso55197307b3.0
        for <linux-kselftest@vger.kernel.org>; Tue, 27 Jan 2026 08:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769531457; x=1770136257; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r3HHYD4aeaQa5ff4aHF396cehTuEDTmWYhC92tg8m6k=;
        b=gr+9OK31GZpDs6hmjZjiOxTWfr5wTUJofTfFpb4sgkfMfzWIGBVfNMumd1ah7BTx0O
         OCnBkpVsRZcZB+nka2MD9cCazlEjbT4gjUAgH8sHQHGyVYl/+g496KF2HGwIk9a4ZDK2
         OT1AMWXof/kOQh/VWCClh69YgU4NyMeAzRZN1RfPVSvx5DUBTgTv0kD24TPPD1EwWh4r
         rL864Xj6oVN0jnOiCnewhZDOfQ9bDU95SYJfU04O+AjfjR0CMp9oSYt18JDvZTkb0SQJ
         2oS6vRQguemOHixU947P0FzkD/Noz7qh+nwb0sByOLG1RwaytmyILkKb63KHm+cRsFA/
         Bs4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769531457; x=1770136257;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r3HHYD4aeaQa5ff4aHF396cehTuEDTmWYhC92tg8m6k=;
        b=YZUuVNgxS1ZoKFCQPvA3l/n9pUatcOCswOA/DbVjOEZThMr/Puu6JQDS7LT7ECo63U
         lnBT0Ryzu15m2pKNqxvmGIWlTJQksBLjW+I+Gt3WWtA/k/9gBXgVfbMtM6uxTuM9Wer5
         B2P+XssWrhib6qI9aAt1rqF3DmUNmVzAGOTKPIswmZHmDTStzwIIY6HU7YtTP2UI3JVU
         6FdiT0h5HdDjRaBibQ8Xmtj0nWECtqxO3rVJvBn5slBy7m9xBHB9qkTTuol8xWWNUmxG
         gJhidUjHoECIDSo0S3yEyevWGHZUXzgg4dOkutc1swIM4m06ru1D1NnTdVcawFY6967t
         dWkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUGM4TaukKSHNOeX9w3XiB2I66NtcUA3jQ6dT08mf47RkjNjhhBqDQM10dmxJZO9Y8tL6HKmVV13xaXdjG6F8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhl7pgqBY+4qHZ0XBD7IHyvVWElbYFnTAIbaGw6kmEl0jCa7DK
	EgwgCDA4N5bsy1HQHPXKp5POkUaKFX2wndAzqL/ubOLWWBg2n5XG6xG0
X-Gm-Gg: AZuq6aLZ0ONDHKsPdEzTrBd5B5KdtCBPyxlLgDLftFnJRi0NA4iaOEVY5OT4EwuEzBO
	VN0svyXgQoyzXTdmo/t4NteLUv8T3Jug6feP1pyN90zvGrCSrE4wgfodBN/5xuMY2GXP+wZXRFy
	rXZybffk2RAd0iBziNxAExZYBOxVQv6h6cQjGCUGm/rwWu4MrqGu1qzMMXTgVyyChpS4xjRj+sl
	15umkjurnxxSvywI9nSxh6x25W84ekZN56bFOSqjSv47WRd2fdSNMqgjlRw+q7r+91O/CBRMeJj
	mWFcRFQEQaNb+bTGl53p3eNgF2T4d8T9uEuGv47zVb+L2+DCkakX9i072s5h8GvNFufjjqslX48
	QVvxNmFUeDs/0MZO3ienMaNExvzg8DXT4P8oVlZRN9kskJY42GyO5wCudEn63UokbA/3cok3IDt
	QfcIO37ew=
X-Received: by 2002:a05:690c:6902:b0:78c:672:9b40 with SMTP id 00721157ae682-7947ac5b3f2mr16260637b3.55.1769531456630;
        Tue, 27 Jan 2026 08:30:56 -0800 (PST)
Received: from localhost ([2a03:2880:25ff:e::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7943b2a2cf6sm63595157b3.33.2026.01.27.08.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 08:30:55 -0800 (PST)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Tue, 27 Jan 2026 08:30:55 -0800
Subject: [PATCH net-next] selftests: drv-net: psp: fix test flakes from
 racy connection close
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-psp-flaky-test-v1-1-13403e390af3@gmail.com>
X-B4-Tracking: v=1; b=H4sIAD7oeGkC/x3MQQqDMBBG4avIrDuQRAzSq5Qugv3VQUlDJhSL5
 O4Gl9/ivZMUWaD07E7K+InKNzbYR0fTGuIClk8zOeO8sc5z0sTzHrY/F2hhBG97hKEf/UQtShm
 zHPfwRRGFI45C71ov306BlGoAAAA=
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Shuah Khan <shuah@kernel.org>, Willem de Bruijn <willemb@google.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Daniel Zahka <daniel.zahka@gmail.com>
X-Mailer: b4 0.13.0

There is a bug in assoc_sk_only_mismatch() and
assoc_sk_only_mismatch_tx() that creates a race condition which
triggers test flakes in later test cases e.g. data_send_bad_key().

The problem is that the client uses the "conn clr" rpc to setup a data
connection with psp_responder, but never uses a matching "data close"
rpc. This creates a race condition where if the client can queue
another data sock request, like in data_send_bad_key(), before the
server can accept the old connection from the backlog we end up in a
situation where we have two connections in the backlog: one for the
closed connection we have received a FIN for, and one for the new PSP
connection which is expecting to do key exchange.

From there the server pops the closed connection from the backlog, but
the data_send_bad_key() test case in psp.py hangs waiting to perform
key exchange.

The fix is to properly use _conn_close, which fill force the server to
remove the closed connection from the backlog before sending the RPC
ack to the client.

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
The data_send_bad_key() test case has been flaking in automated
testing. The root cause is actually some racy connection
setup/teardown logic between the client and server in the preceding
test cases.

I have detailed the exact circumstances for the test failure in the
commit. To reproduce the issue deterministically, I inserted a sleep
into the psp_responder.c conn clr handler

	if (cmd("conn clr")) {
		if (accept_cfg != ACCEPT_CFG_NONE)
			fprintf(stderr, "WARN: old conn config still set!\n");
		accept_cfg = ACCEPT_CFG_CLEAR;
		send_ack(comm_sock);
+		sleep(1);
	}

which produces the following error just running two tests:

 1..2                                           
 ok 1 psp.assoc_sk_only_mismatch                                                                          
 # Exception| Traceback (most recent call last):
 # Exception|   File "/data/users/dzahka/psp-flaky-test/tools/testing/selftests/net/lib/py/ksft.py", line 319, in ksft_run
 # Exception|     func(*args)                  
 # Exception|   File "/data/users/dzahka/psp-flaky-test/./tools/testing/selftests/drivers/net/psp.py", line 420, in data_send_bad_key
 # Exception|     tx = _spi_xchg(s, rx)
 # Exception|   File "/data/users/dzahka/psp-flaky-test/./tools/testing/selftests/drivers/net/psp.py", line 65, in _spi_xchg
 # Exception|     tx = s.recv(4 + len(rx['key']))
 # Exception|   File "/data/users/dzahka/psp-flaky-test/tools/testing/selftests/net/lib/py/ksft.py", line 258, in _ksft_intr
 # Exception|     raise KsftTerminate()
 # Exception| net.lib.py.ksft.KsftTerminate                                                               
 # Stopping tests due to KsftTerminate. 
 not ok 2 psp.data_send_bad_key
 # Totals: pass:1 fail:1 xfail:0 xpass:0 skip:0 error:0
 #                                                                                                                                                                                                                 
 # Responder logs (-15):                
 # STDERR:                                                                                                
 #  Set PSP enable on device 3 to 0xf                                                                     
 #  DEBUG:  ...                                                                                           
 #  DEBUG: command: conn clr                                                                              
 #  DEBUG:  ...                                                                                           
 #  DEBUG: command: conn psp                                                                              
 #  WARN: old conn config still set!              
 #  DEBUG: new data sock: psp     
 #  DEBUG: create PSP connection                 
 #  DEBUG:  ...                                                                                           
 #  DEBUG: data sock closed                                                                               
 #  DEBUG:  ...                                                                                                                                                                                                    
 #  WARN: new data sock but no config                                                                     
 #  DEBUG:  ...                                                                                           
 #  DEBUG: data read 20                                                                                   
 #  DEBUG:  ...                     
Traceback (most recent call last):         

The problem is caused by the conn clr and conn psp RPC handlers
running consecutively without the first connection being accepted and
closed by the server.

The fix is simply to match all conn clr commands with a data close
RPC. The forces the trace to be:

 #  Set PSP enable on device 3 to 0xf                                                                     
 #  DEBUG:  ...                                                                                           
 #  DEBUG: command: conn clr                                                                              
 #  DEBUG:  ...
 #  DEBUG: command: data close
 #  DEBUG: new data sock: clear               
 #  DEBUG:  ...                                                                                           
 #  DEBUG: command: conn psp
 #  DEBUG:  ...                                 
 #  DEBUG: new data sock: psp                
 #  DEBUG: create PSP connection

So the closed connection from the conn clr is removed from the backlog
before sending the ack for data close to the client.
---
 tools/testing/selftests/drivers/net/psp.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/drivers/net/psp.py b/tools/testing/selftests/drivers/net/psp.py
index 528a421ecf76..864d9fce1094 100755
--- a/tools/testing/selftests/drivers/net/psp.py
+++ b/tools/testing/selftests/drivers/net/psp.py
@@ -266,6 +266,7 @@ def assoc_sk_only_mismatch(cfg):
         the_exception = cm.exception
         ksft_eq(the_exception.nl_msg.extack['bad-attr'], ".dev-id")
         ksft_eq(the_exception.nl_msg.error, -errno.EINVAL)
+        _close_conn(cfg, s)
 
 
 def assoc_sk_only_mismatch_tx(cfg):
@@ -283,6 +284,7 @@ def assoc_sk_only_mismatch_tx(cfg):
         the_exception = cm.exception
         ksft_eq(the_exception.nl_msg.extack['bad-attr'], ".dev-id")
         ksft_eq(the_exception.nl_msg.error, -errno.EINVAL)
+        _close_conn(cfg, s)
 
 
 def assoc_sk_only_unconn(cfg):

---
base-commit: a8a6c8cc8796ac573fb3902803da28cfa374787c
change-id: 20260126-psp-flaky-test-ea613ea5386c

Best regards,
-- 
Daniel Zahka <daniel.zahka@gmail.com>

