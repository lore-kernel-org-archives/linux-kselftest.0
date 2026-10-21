Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792596439;
	b=Aj2W23F3pbshGr1njM79AtmFxO6BWYD7rG9X64jDGV0MJq1WnBxGrucs/i3rRkjHa20G
	 wrSmkNKT8PbAQ6OnD2vl3mt0s1atjEI2Dq74vAg65Qg4SqB2zrUqSv0Y9y7xuIfqrJinG
	 bArrlfkjjHo0+Jb3EuyvihJBYdh0UgjkBd1p4CZzqOAYqgWeCHHYM26PGIqT/jJDT70C8
	 7EqfJSPHL+XoP4S+5SSlmYsV1/3kq1ufG7zMryL9u081Ozl99peq+e75IF7hNm+5ax3Ni
	 QTAuXc0t64eR2jys/dyGlq+EEGalXU1BEsE5Ztb7JWUX+n6C29mvnFI0yMA3Mil+Wqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792596439;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=jgAnNPRw4bl7KLoUTwKbk6oRViEcdsIxPyek4/jTHZc=;
	b=aMiY4IsWtiYJRADLwSsA7qQjP36UAxWS7USaRVCinumUpxGKTtSKUeuiovgBhedkLoHS
	 astvEoMfY7c0yAOOjcUecMu0z2wsTL7/iEZ4rupqPArL7YAOcJ6hrxiQ07IdsfN+FXuzZ
	 dk3K9MfycT1FqUHD50R4AYK2B/P2NnAEkEcV1r61cmhYUsW0xmDQRFu0EjqoiUynNloMv
	 zCZU2CPg74GZKic7twJGNve5cQk9L2AcCmMPRZyMozoJiNqx904WxBJMW7k+H3WKcsszt
	 ALRdUDLUpH5FCUDrC6U4maEieDrhnjcCZaaPPAFIxJyV7AneWvscdqaB9Vfn0Kapj6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--gthelen.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=RWx0T6jq;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F29606A31F
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 15:27:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77F29606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--gthelen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=RWx0T6jq
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-366c279b454so1711834eec.0
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 08:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792596438; x=1793201238; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jgAnNPRw4bl7KLoUTwKbk6oRViEcdsIxPyek4/jTHZc=;
        b=RWx0T6jqAP4HmT2K09lvjwGaIFrNgspwI+GiEccvd37c5EIofQ2Z90i2VF0eV+9EtW
         QNuan04bsuIV5lePSClR20Yf54OtGxfL0UNC+1+iheIhH0M5Qv5EBYDmJ6C8S9St0NfV
         wQDR/4VN+ylTCPqz1GJKvI2H+gchcDZETgzsXeJzL6a2rKrM3lsTkbxRZEUopeuCnzdO
         +YeaVdSfb3opdL8y9vnYKrSoLD+KUp4X49ruFZOYhcXq+DrJVrgi/LWtkQ86F/296Z9I
         FvnVC2aJhOKeHwyRNjfNtDNCu84/oj60zWLdKJeGupNojRFVl7Rye1eL3NLIM+LEVunE
         zuZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792596438; x=1793201238;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jgAnNPRw4bl7KLoUTwKbk6oRViEcdsIxPyek4/jTHZc=;
        b=oGWZnmrTuZG7Px0QeHPrYB5U0uQwz9veI3YuPdMCb1Nyfzals7D95yVreNdHmY+ztM
         brVg0YURWTgqWp7tzSn8ckZL0KzPfkm0R8jRS+qDulOeFomPILpL8XOPPM6a3PP9gzv0
         frXw0/etEzbRUQXnMOROtkFxeJxaMUxrr2RRl7PJMHS4vx8SLtQY9efH1qByekKupz8m
         JbeYKqDZFC7tb+9hyPaDcO89eD/Cg4MD/j9qbst4gEvd0R/FsN7opT1eAU1UIrmlYNB1
         Zk9Tq+6pawG8iGFEzqdv69wpAHO2rNRQT6aEhGImYGgaSduV2GccE+zuHwos9GVYBbcu
         EFew==
X-Forwarded-Encrypted: i=1; AKwUvBxPOGZfMsm27Xu5AMSK9IoprKA/NEolpaCKkeIRqs5ieaooh1IIbezujyihk+KbEU3TqP0OI6OB6CGPa7xim9s=@vger.kernel.org
X-Gm-Message-State: AFq9FYIAsRPROHyXGG5zbomQ0oIbfJ7yGaN4Ao1k6dK/QqWnsRWjV6E3
	O5nuYOcs/tHrwbq+UQYwfTYkkN2mTGpCf+cgxvRZ1+o5OZpB5qUq8E4xEpzIHyyPOn0AxL9PLgc
	BxIMrVkR+XA==
X-Received: from dycpq4.prod.google.com ([2002:a05:7301:fd04:b0:34d:46b2:7513])
 (user=gthelen job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:d185:b0:359:a6ed:41ab
 with SMTP id 5a478bee46e88-3674db50cd0mr3750142eec.36.1792596438073; Wed, 21
 Oct 2026 08:27:18 -0700 (PDT)
Date: Wed, 21 Oct 2026 08:26:58 -0700
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261021152658.2618709-1-gthelen@google.com>
Subject: [PATCH net] selftests/net: tcp_mmap: remove unused -k option and keepflag
From: Greg Thelen <gthelen@google.com>
To: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Soheil Hassas Yeganeh <soheil@google.com>, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Greg Thelen <gthelen@google.com>
Content-Type: text/plain; charset="UTF-8"

Commit aacb0c2e524c ("selftests: net: tcp_mmap must use
TCP_ZEROCOPY_RECEIVE") removed the only read of keepflag in child_thread(),
leaving the file-scope keepflag variable set by the -k option in main() but
never read. This triggers a Clang 23 warning:

  tcp_mmap.c:91:12: error: variable 'keepflag' set but not used
  [-Werror,-Wunused-but-set-global]

Remove the unused keepflag variable and the dead -k getopt option.

Fixes: aacb0c2e524c ("selftests: net: tcp_mmap must use TCP_ZEROCOPY_RECEIVE")
Signed-off-by: Greg Thelen <gthelen@google.com>
---
 tools/testing/selftests/net/tcp_mmap.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/tools/testing/selftests/net/tcp_mmap.c b/tools/testing/selftests/net/tcp_mmap.c
index 487ae659a1f1..86241bed7f08 100644
--- a/tools/testing/selftests/net/tcp_mmap.c
+++ b/tools/testing/selftests/net/tcp_mmap.c
@@ -85,7 +85,6 @@ static int rcvbuf; /* Default: autotuning.  Can be set with -r <integer> option
 static int sndbuf; /* Default: autotuning.  Can be set with -w <integer> option */
 static int zflg; /* zero copy option. (MSG_ZEROCOPY for sender, mmap() for receiver */
 static int xflg; /* hash received data (simple xor) (-h option) */
-static int keepflag; /* -k option: receiver shall keep all received file in memory (no munmap() calls) */
 static int integrity; /* -i option: sender and receiver compute sha256 over the data.*/
 
 static size_t chunk_size  = 512*1024;
@@ -456,7 +455,7 @@ int main(int argc, char *argv[])
 	int sflg = 0;
 	int mss = 0;
 
-	while ((c = getopt(argc, argv, "46p:svr:w:H:zxkP:M:C:a:i")) != -1) {
+	while ((c = getopt(argc, argv, "46p:svr:w:H:zxP:M:C:a:i")) != -1) {
 		switch (c) {
 		case '4':
 			cfg_family = PF_INET;
@@ -490,9 +489,6 @@ int main(int argc, char *argv[])
 		case 'x':
 			xflg = 1;
 			break;
-		case 'k':
-			keepflag = 1;
-			break;
 		case 'P':
 			max_pacing_rate = atoi(optarg) ;
 			break;
-- 
2.56.0.212.g129ede20d9-goog

