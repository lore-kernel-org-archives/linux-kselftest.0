Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.121.94.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794839276;
	b=2Vb52Q+AlMmTXTcV7PfsR/5aM3jcF3ScGLRTJsbdB3Py863CfTKYmaSFgKQ16RpwNRPS
	 bw4yQSJZVhyc7baNd600If9Om5mYesgmSwgq8+owxoL72EG7VN64nI/t8pfFAFk4ScSgn
	 2Bs1ek5H1EjH8AUsSxIYCp2aos9wZ5oYH8II9QnfmTixfK6wLIJjff42detlAZ8V7XNvy
	 SGE+3II+oh6y3dnf0QlOJ2+8Vg+vsPGSd3UqduAHf8aQdz96F7NDcwAULF5ldR5Z4/G/X
	 bQqR0PSIY1VRRZQOKkZmRbBPoP6qm9H7moyWY/ZMO7te/kXaql8/JBfutGzuAcBkhaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839276;
	h=DMARC-Filter:X-KPN-MessageId:Received:DKIM-Signature:X-KPN-MID:
	 X-KPN-VerifiedSender:X-CMASSUN:X-Originating-IP:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=99y4CGnVbAz079lBiip3m9L+73H0dY+aTp6nLYODwTI=;
	b=2FM3ryLkeBTYPYuFdZQFgNP7tX6SXvVc1p/fuS/xWGzFvXa0hPA2zX1xNHfACss5gGKX
	 Fl5cFftqirKfit3Ep7z6oqpIUN3erHh6izR8VVMnOns1Z/SuIX4JUPxsaB6Kv0i2sE9bY
	 npanIpIm/KNoYusXs9vkhwp5wY9q/fz/+iWB5p9iLBSgUhlGef6CbIEAAUOmZ9QJNU3TB
	 0SJZH3v1itwP88c8o71zZ19FonDc4lnOX/FUGl4Xnp4nN6WLsJL9MqGctgzwjmO0E46u4
	 r3cziuBWEL5mG9iX/mbLdpALojlLqhQjj5VXiwTDIZYPGevK47dMRPbjJsTYY5NsPQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=xs4all.nl;
	spf=pass smtp.mailfrom=xs4all.nl;
	dkim=pass header.d=xs4all.nl header.i=@xs4all.nl header.a=rsa-sha256 header.s=xs4all01 header.b=PfPxDpgq;
	arc=none smtp.remote-ip=195.121.94.170
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4929606A32F
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 14:27:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4929606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.a=rsa-sha256 header.s=xs4all01 header.b=PfPxDpgq
X-KPN-MessageId: e4d14012-e1c9-11f1-9b59-005056ab378f
Received: from smtp.kpnmail.nl (unknown [10.31.155.38])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id e4d14012-e1c9-11f1-9b59-005056ab378f;
	Mon, 16 Nov 2026 15:27:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=to:message-id:content-type:mime-version:subject:date:from;
	bh=99y4CGnVbAz079lBiip3m9L+73H0dY+aTp6nLYODwTI=;
	b=PfPxDpgqeA4gwkNtU5plxL6ve9qd6AigPsG822iaSq0Ck/PIrwYRyCl24iBWpx+Q7mreoDK6BTxCz
	 e4BY99kZ1qCCBu7bYYsjQji4Q5G2odIFWxpZ5YT3dkGeAw4VSDKyD6nUB5GPg+JMNQF8KH/xHg4wKS
	 4LOmpAwyQ3bXuPrEYJFfZTHkBqqKSQAgqvidHjaUdjYQP1OoYThoyjy/TPWk+83grlNO3NQJJvoHq1
	 +nKCES8Cmc7d8IXaWXBnszg7/iB3TRRkGt9F5xvNtf3Okv0yv36TAFxHRDD5uLxYQfpLVTNf5zAAMf
	 nLrPV+evvw2RjJBwweAqn1IEtMjlxnw==
X-KPN-MID: 33|/MIgWV6oX9xq3hYmBqzSRu75w+7s54mvLRer7uAyvZKkkOQJU3WlyczKamQ40Ma
 qFvY5M4b0kMHkpQFfC4nDiSVsf6E06m+PKZ9ZJ9LebWU=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|YWDZrMs4Lyv4GRoA6A2/6qGXTAvptwrA0oltIKL5OmqQif2SdfW3tOA2U/S5xOS
 hHmCBdftMN/TAm7tsc1xkIQ==
Received: from [192.168.122.1] (unknown [178.226.154.85])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id e2d743ba-e1c9-11f1-91de-005056abf0db;
	Mon, 16 Nov 2026 15:27:46 +0100 (CET)
From: "Jori Koolstra (CIQ)" <jkoolstra@xs4all.nl>
Date: Mon, 16 Nov 2026 09:27:43 -0500
Subject: [PATCH] selftests: quote tr character classes in runner.sh
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-kselftest-runner-quote-tr-v1-1-e6270326db66@xs4all.nl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MywqDMBBG4VeRWTvQiE3BVxEXXv60Q0vUmSiC+
 O4NLr/FOScZVGDUFCcpdjGZY4YrCxo/fXyDZcqm6lF555znr+EXEiyxbjFCed3mBE7KtX8NwzP
 AT/1IuV8UQY773XbX9QcfAj07awAAAA==
X-Change-ID: 20261116-kselftest-runner-quote-tr-467bb5fe6dac
To: Shuah Khan <shuah@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, "Jori Koolstra (CIQ)" <jkoolstra@xs4all.nl>
X-Mailer: b4 0.14.3

The unquoted [:lower:] and [:upper:] arguments are subject to
pathname expansion, so a single-character file such as 'l' or 'r'
in the current directory would replace them and break the
KSELFTEST_<TEST>_ARGS name sanitization. Quote them like the other
tr invocations.

Fixes: e005ff01bfdb ("selftests/kselftest/runner.sh: Pass optional command parameters in environment")

Signed-off-by: Jori Koolstra (CIQ) <jkoolstra@xs4all.nl>
---
 tools/testing/selftests/kselftest/runner.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kselftest/runner.sh b/tools/testing/selftests/kselftest/runner.sh
index 311811dc55a0..e81a35e607da 100644
--- a/tools/testing/selftests/kselftest/runner.sh
+++ b/tools/testing/selftests/kselftest/runner.sh
@@ -77,7 +77,7 @@ run_one()
 		BASENAME_SANITIZED=$(echo "$BASENAME_TEST" | \
 					$TR_CMD -d "[:blank:][:cntrl:]" | \
 					$TR_CMD -c "[:alnum:]_" "_" | \
-					$TR_CMD [:lower:] [:upper:])
+					$TR_CMD "[:lower:]" "[:upper:]")
 		kselftest_cmd_args_ref="KSELFTEST_${BASENAME_SANITIZED}_ARGS"
 	fi
 

---
base-commit: 4d038dae9e5ba5b3fec87fad5b7bf3dc45523ca1
change-id: 20261116-kselftest-runner-quote-tr-467bb5fe6dac

Best regards,
-- 
Jori Koolstra (CIQ) <jkoolstra@xs4all.nl>

