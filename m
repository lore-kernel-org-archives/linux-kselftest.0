Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3752E378833
	for <linux-kselftest@vger.kernel.org>; Tue,  4 Aug 2026 05:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785821367; cv=none; b=i7ESaupmp6O1oID7o1MWj0ha6eBK+c0xQqkvj0bSx0NLtgp9GGIyeQz5OD0aMOT1aTJwC64EHcxrA8zODCLm0oOScN+EnFEoWA1yQAqP8P4McwVBsPzllZ9PakJRSF3MI2RXydBGh8/WyGAXVzgXmLdsKCdG2/5sBaYsQQNXbFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785821367; c=relaxed/simple;
	bh=KtQJfOnplEAnHToqIT7C1s7SUHW63edaUagP26DUzzk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JepJuE9g4dnMTfysCLTxmWPRgz7HOra6MDrVG1YPl+LfwPp3XreNx1FlM0zb4rZ3bMlSVYJhfYuOxNiMcrf6hc88SvyIll8imU1jJSB+c+aS4E1GxlNpQtNMhfq3lqFbYMI53LxE4UEuVlN3zlnjY1J+wuPgd6M1GZbHCAhc/6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VtQZhloG; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VtQZhloG"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso40278525ad.2
        for <linux-kselftest@vger.kernel.org>; Mon, 03 Aug 2026 22:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785821365; x=1786426165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K6o4n5pupeB2d8RGbxcjX552Uqn/Hcl7H29fyuT3cEs=;
        b=VtQZhloGZ2kLwgTJqiHSWYii8K/KdYBMNLHZrsIMUpkcAszHw9bZ9UfaEXPWkDc+DI
         t93vi5ad25QiYilJehzCJBX9NqDrfGltM1KJL79fcIE4YMhFFTFbVPFK282yIEUzwZ2a
         oRXuHECrEJ98xC/DMPr/Mex2uSxVqOf9v4fFfnItTwPFzZJIPcc3wmXNRFze5AKBwGPO
         IY3srokmb0TgtrH8Q45W80s+tstL2omn/uNTjeVkXGSQ81TZQpgDEob6Ny3JAFJEC/8C
         cVe7X+V3XkPT1ljHXCzRCzUbjyYu5oAxGcWVqnW0/ZvVzUtX1sDoRf24bDX6HLQ1NZit
         BulQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785821365; x=1786426165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K6o4n5pupeB2d8RGbxcjX552Uqn/Hcl7H29fyuT3cEs=;
        b=HMwtqqaeYGvm1fvCmutCYEbN9hnORb+5uRVLMMeSgpMt0snibXh/K6z6dNqGrnmgME
         yHDfrBa9RtS1BVEwxMLE5VImGYdUKDnTPx899PpZ4e9AT+ufYx7BD+0V85bji1BWKpRV
         R1s5JGwVNkVcWghC6qYwqQgGs0rGJ/9FSNZjJtsV7zmwb10fwrWXGydvgOid1bTjDHBg
         IvUK++FNKqx39SO7xRxZ2Mio+48Rzbr9BdLNahP5dDd0R+MKfG3kT8LU5hJiJYOacG3v
         buPII9sM7Uj/mDIHR0twsYH1SEU3kkXuYAem6TVKPVVD9I9cfcZTtLXixvGDpLnx+Cc2
         c0cA==
X-Forwarded-Encrypted: i=1; AHgh+RrsMhst5VdyxkCCRNu+Ja/BWNKFiLiPxVQ6+Kg0MqrKQuhdR138rNOip69/e2JuEqJJMzVgYdhxsvZdd8x0QE4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzB//B0AddHEw5JPb6xF+pGz9BtpI8wU6fDJVCDx0fCtaAzcQfF
	t/2PxrxFfHwylWs1oWsrkYoRqWFaebamSgBGgPJrFjgBJv41MnW2jtCZ
X-Gm-Gg: AR+sD11BhVRROBAmEzr2u/EYuU2n2hGwdLBy9dF24ahaL+hX5fLmSljbHQl2RY1b2PQ
	ETpZaixYD/DddbPi+dtlMsmTqxISKlT943TqG117UGiV04CZW3qCkwTIWoEDE++BL85wFbQOG91
	iHIgqMkphvjGWgA8Gv3LULq1hIJLzilJnWrE6S69kYejWhS0BemTdy8Ladb/MWryu4XZ9JIGkMb
	H2kJz7GdPIQxynkOMJs8MkYgEnHfIjwZKaAQjAr+4ngOOlW0vxBob0ORSvcm3xDtH6ChDu8yeBd
	QNn0iOAHzG5AJAOENMJzJmJRY/a/4t3fCQ98nd3aguNM8B2vwjZa7zGIMXjHvAesSkxZXX9vPnV
	vbaYTaz5e3GZ01A1WdQRb/RAbk6egB4N9uNDARNpjoDKOzjTPUYK/EuMnO0dXx6TF5cy5MsAvH/
	RXw/JGQcOlqM94TbYNtjtCatedFaRNVPNX7165bp9nRG6V6346F0D+Py6P6LtRdREeX8lO4cBfk
	jscrWEUfdLromFw/HPppVl9He1Mp6xsUg==
X-Received: by 2002:a17:902:ce09:b0:2ca:3e3f:4956 with SMTP id d9443c01a7336-2d05244dc84mr129723385ad.44.1785821365283;
        Mon, 03 Aug 2026 22:29:25 -0700 (PDT)
Received: from anna.. ([114.70.9.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04ae5a904sm47056345ad.20.2026.08.03.22.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 22:29:24 -0700 (PDT)
From: chanyoung <ppoo1220@gmail.com>
To: netdev@vger.kernel.org
Cc: Sabrina Dubroca <sd@queasysnail.net>,
	Jakub Kicinski <kuba@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	David Howells <dhowells@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	chanyoung <ppoo1220@gmail.com>
Subject: [PATCH net v2 0/2] tls: fix plaintext sk_msg ring over-fill
Date: Tue,  4 Aug 2026 14:28:34 +0900
Message-ID: <20260804052837.49015-1-ppoo1220@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An unprivileged user can oops the kernel by splicing into a kTLS socket
whose open record already has a full plaintext sk_msg ring.  Reproduced on
net (53658c6f3682) with a stock config, no KASAN.

Patch 2 oopses an unpatched kernel and passes with patch 1 applied.

v2:
  - fix the copy path so a full record is never left unpushed, rather than
    making tls_sw_sendmsg_splice() tolerate a full ring (Sabrina)
  - selftest: drop the comments, one splice instead of four, reuse a single
    pipe, compare the whole blob, sweep 16..44 fragments
v1: https://lore.kernel.org/netdev/20260726105556.2719227-1-ppoo1220@gmail.com/

chanyoung (2):
  tls: don't leave a full plaintext sk_msg ring unpushed
  selftests: tls: add a test for splicing onto a full plaintext record

 net/tls/tls_sw.c                  | 14 ++++++++++++
 tools/testing/selftests/net/tls.c | 37 +++++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)

-- 
2.43.0

