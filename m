Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793826538;
	b=Z5pF13P5jvn/mTZhXld8uF0WlvUiC/zasvtS9dNfdLpRDR8tJZKDhyfl/rRC9Qh1wcGH
	 q0NtVEIHIrp+6RpiM7GNzdU5zsSR1VzLyEB3jrdNnWz+FPAnUVZXdK68wn9vZTtqO1h6m
	 tV63acHoRgS6NOpQg6vuaS7S7h5PbbHrlcuKrt55iy1TnzHB1VbYBvsGJhOCYrhxOJICU
	 UZ6waisOQlGiKIYGYPav+UEpKu74SrCCDwGCW1jRlMd/b3r+pmAX+DD25a8MnUF5ZxtLb
	 a0ed3xGixbSWhaBNi7MroXcF1oQN8hofOVai5UgT2F0MGAv0FXKvaRAqK9OTHETzDtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793826538;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=wx4pJ0HLwTbcqPJBKfgxIdGigPrVHgc2rJS/1aTbB3M=;
	b=e5CbNaEpCTu7GHmrQI/fChpjRMZjbzPIZgDO+LaS41Tgou1abVE139IPbzWfea11lFG6
	 SF5kOeg9E2MQAhv5nngug6QglkxynmzFlOq8b1Eai6QJIgyRTdodfQbqtsEDd2GB5U72G
	 uuRKeC5HAK79awfDrhrOnUt4nPfe8m1O6C2oMBTLWXQfIS35qanfRKjoDgDm1TCSKJJeK
	 Q4CSw3ARhmKGD+Hu6cDwFdXdDMLRybehWiF6wfswEllm8h9sQdKrvt+i/erJxFt1HAFdq
	 voHA2p/CzedpVeBCda9sPoMbLIhI1qw948jAj7H0PwTF7ogF6hYeqqoU/mfGRxv5RzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xPZq59FL;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B51607C0B7
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 21:08:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84B51607C0B7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xPZq59FL
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso12319625e9.1
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 13:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793826537; x=1794431337; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wx4pJ0HLwTbcqPJBKfgxIdGigPrVHgc2rJS/1aTbB3M=;
        b=xPZq59FL/LdAYt2ofE6opelD2ogyAljWJpR29J/hfD1ormxa7z8JKZcsOg9mr6VZa7
         3tgPHBX2oJFVcOb6FJ9kifHIO85QJrmL9rBMKdXWdFdGj//Je786Eb2pGSmf17K5RDc1
         h9rTw9B+LvhlLC0trXnS/z6K45j/yjtEmYiSn183ZNwbY6jJZ7ZtqtiRnzr78oy2lMU2
         NP2Dhj1+g1srRraqIxb8IdVpDoJPaWm4CDumcKn/t0n10pJERunxGr86/12a/k6Ebvtd
         kY0vwD0EWQ7kE7JZnDo6/5BrlJFBsdXi67+l5RlnPNgAYz1dNTr6t/7zgnOTrrLOOiAI
         y0AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793826537; x=1794431337;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wx4pJ0HLwTbcqPJBKfgxIdGigPrVHgc2rJS/1aTbB3M=;
        b=PGPJbx1eNeH0sD7+6O+RNvqiwqBeoeBNx78i46az3uKbFFaXUmV1AUlReoXWX0ygtQ
         cv6w2XUlWhbn/9Es6saU1lXxAjHETKVpaggdGRLy/piId/dN7QSIPXME/aN+GRuhIMto
         dfJI0OEr9GdhJUQ9D55quVYMJM053aCH3qLCE+8k2mFxeT3brRvRbqTfA6KW9ZxTT9tW
         ivwO4xxZO6JeGb9MgtZ2mgiR8OJ3zX33+cQlbpxBXLh8mABmLVQBLAoZvXapwjUnrO0B
         GlxJWJVGw5B70HPXAfeLBDCnjnzrPggiNn+AeVaR1gKbcpD3rsVqbFBk71TKHZpYSBo5
         YTeQ==
X-Forwarded-Encrypted: i=1; AKwUvBxqttzkxEhR6Vs9GBsZb4vmz27fmR8YQfho6/NnyPjyZgwZ46fBAEuT62FAcEux7pXbFLMIevN5POW8SJCxX9E=@vger.kernel.org
X-Gm-Message-State: APuU4Z8M+ScQHd58TEBVvULIRnItHm3HzjT2kkEC+R6TFJWE9QBdAYWZ
	leQcj2ngyeuVH3ZrixUZ6fo0FwrVhI4JWF48djGYYmq/FeEDjPAch04J
X-Gm-Gg: AYBFou160er9IxA51KJXj+KgTmJypW1jJJ/A0ikbNUOGXxCRIIs2ChnYH+lAVI5eII4
	y548lZZg1nIO7S1cY7qvcBNMpjYmU1Ib954igx79MdgJztE6QRIPMyrfQgLCmWB4TojfRRgbWqg
	YutvGJDPy3mhxg148odavmEyqReWgM60AUD4gQappKZX8J29EcZVFWr1fkL9+wvlrLOynaGxg8z
	x86VyhHcYaNZi2Euvx3qqosFzmWUSQOLVDz1BsIca2+7V4yNA/RfRFBETxYTF5mfFcu1CyjXPkq
	FUA3D5G8ZUaBaE8JzhVgVCUjjCNjJRGfssi7faoqVvrOmY3fovyyGffOflBZQaKVeNJ5J90hmlF
	B2UbZFkJMMKJOQO59onw9ahM1CafyOouT29ucUOc2AXDcczHUSrryl5S4Y8vlHV6zXf9Hahlhsc
	9dbCh2o421dAPhZc54snwdFtgzNHsoEzLbbAO1WxiT8Dq1mflVzRo8L0FS1VrhqFfrmhdJa3y0N
	iTOECfi9zA+bQ3zKgToLoLY1WhceC6x4iVZedVNb1B4gG41PW+FyrHV3E0XvJQv5VP8tfsBXUFS
	5ddhELBHv2Ej6Ax7Udddrn9Y/XCctG3nU2EzdWEoh4xOQMnl/RA5cA==
X-Received: by 2002:a05:600c:a00d:b0:4a1:83f0:7c91 with SMTP id 5b1f17b1804b1-4ac185bc336mr363516035e9.18.1793826536887;
        Wed, 04 Nov 2026 13:08:56 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56f02386bsm10975625e9.7.2026.11.04.13.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:08:56 -0800 (PST)
From: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Date: Wed, 04 Nov 2026 22:08:48 +0100
Subject: [PATCH v2 02/27] selftests/landlock: Propagate EXPECT failures
 from forked children
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261104-selftests-refactor-v2-2-c52f23f7ce33@gmail.com>
References: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
In-Reply-To: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
X-Mailer: b4 0.15.2

A failed ASSERT in a forked child calls abort(), so the parent sees
the child die from a signal and the test fails.  A failed EXPECT only
sets _metadata->exit_code, and a child that exits with a fixed status
of 0 hides that failure from the parent.  The child in
trace_fown.deny_scope_fown has this problem.

Exit with _metadata->exit_code in that child.  Do the same in the
audit.log_subdomains_off_fork children.  They only use ASSERT for now,
but this keeps them correct when a check becomes an EXPECT.

Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/audit_test.c         | 4 ++--
 tools/testing/selftests/landlock/scoped_signal_test.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/landlock/audit_test.c b/tools/testing/selftests/landlock/audit_test.c
index 4bea8c880a4d..502a0825d877 100644
--- a/tools/testing/selftests/landlock/audit_test.c
+++ b/tools/testing/selftests/landlock/audit_test.c
@@ -314,7 +314,7 @@ TEST_F(audit, log_subdomains_off_fork)
 		ASSERT_EQ(0, landlock_restrict_self(ruleset_fd, 0));
 		ASSERT_EQ(-1, kill(getppid(), 0));
 		ASSERT_EQ(EPERM, errno);
-		_exit(0);
+		_exit(_metadata->exit_code);
 		return;
 	}
 
@@ -347,7 +347,7 @@ TEST_F(audit, log_subdomains_off_fork)
 		ASSERT_EQ(0, landlock_restrict_self(ruleset_fd, 0));
 		ASSERT_EQ(-1, kill(getppid(), 0));
 		ASSERT_EQ(EPERM, errno);
-		_exit(0);
+		_exit(_metadata->exit_code);
 		return;
 	}
 
diff --git a/tools/testing/selftests/landlock/scoped_signal_test.c b/tools/testing/selftests/landlock/scoped_signal_test.c
index 259cdcc8aa5c..47307dd2e242 100644
--- a/tools/testing/selftests/landlock/scoped_signal_test.c
+++ b/tools/testing/selftests/landlock/scoped_signal_test.c
@@ -1090,7 +1090,7 @@ TEST_F(trace_fown, deny_scope_fown)
 		ASSERT_EQ(1, write(pipe_child[1], ".", 1));
 		EXPECT_EQ(0, close(pipe_child[1]));
 
-		_exit(0);
+		_exit(_metadata->exit_code);
 		return;
 	}
 	EXPECT_EQ(0, close(pipe_parent[0]));

-- 
2.56.0

